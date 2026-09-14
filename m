Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7315C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=; b=Mj5GfFBNjGiN7d2JrC/MT9yuP6
	Dit8107jRm8Xi8UYT+yv+bCIU84AFx0fg27Y1j2qNdT7uhNHj2fovBUaLz2ky88BTCucDdk1TFaJD
	/GF37AMR5yXtrzApVpdTQ+N5suIUc5Vmfp8Oe3GlYn/KMv6kE8g2KZMNVNX6g7ZNI/EQbpNEgTf8v
	/eXL4Q4s08PFAuY3goz2GQsTmVua3/k+c0yp7dHA9RFYTGJv3CuZ9IVEDvnhkrQLtkbHJ6h9LSwdJ
	kdEydv/tWIWuOjuCCxbwXy7v4Q9q3Kn6hER28YMh/9nryzELrA5W1wD7jQLW+iFHf6uBr8oVUq2OU
	k/pOcdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x647F-00000003Ae6-1lkN;
	Mon, 14 Sep 2026 10:40:49 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x647A-00000003AcW-0ZJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:40:45 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4ab201ecso1480555d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 03:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789382441; cv=none;
        d=google.com; s=arc-20260327;
        b=MZ3K7S6FIZ0RT2UfbcT+ZLvUCCdxd7TevwTDm8VSo3k9+VPYamQSPqMldWe2MYQ9XM
         nIYJJuNaTOYJNIA6FwxLN2KrytJQHJegM0IpWY4p6ctbod+14GRokktbeOh21dDD8r6k
         pSSbYDaLN/Ds0JNPLziSAZ/vMwvxCVtRvrUto9//KZtadymsGxmnnz91S6XFoku+Bm9C
         Nq7oVVngOO3haz8XWZTrUp1tAm37S2l48KOond3NEayjY3EJg71XqSTNC4TmmSV/Q/zj
         b2pFZ17n5gZs+AW8188G+RxVS5sSxnymnRXuV11YwLDs0qJCh1i6sUU37N1K4pzCa+Vh
         h/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        fh=x9xXREFbQTUNvqgut0QjauHGtoJmNQm7bINa9EC3Mr4=;
        b=AMx1M+U2CRuBA4u4DfxLBGD7kDEKcNK2dzV7FcW4zcXx6H4Bjq2rkXCNP4daj1JBNz
         c7/Vx+u+I3Tl6CoWdtNRaJbv3U2oO0J94NkZUE/cToFPHnzzulSp3HRm+a/a2jwdMh5P
         b2KCRGAAKaFlTe4Qch3XDkmlafgQ+EygubgOLMINrGUU2etmz/MHyUeBwlZwL/mqv2+J
         QO3/t8Hk5GU3I4TqDy/NPX3F4e1Ixh1gpCq5O2ABu13cQP0Cpuw8sufV9jEoPpUjHZHj
         eV81MlNh4+QcSiJ+cnoC+Xbxfc4uNpF6CjTv8px/BZMQlPBPBVjnoMDzo75f8Xbc9SEl
         5+zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789382441; x=1789987241; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        b=Fac4DNo3YrhEbM+CiKpp9iY2Az6uGf+y+jzL/n7SHpXipNxRf/5WLtKQBIBAV4HxCd
         c9oVyxtK66hYGuCtqwku7/1x2AmeDyeOCPwB07QP99pUDkGorb0kblo3fGfzvyj9O+gg
         tjVMlMVqtKTK0BeOKIXdIxgUkihz+O9mq7Mikvgk4cELCmuCxsaegJcRtyhnwdVWYRij
         8JDhMnCzPpkm3TbQlXOCvhqlSM2Ruj0stpeb56A7TaTfvQehrromCGA3u6HqYmqkxsKr
         xT2IqUqN03txtvscoiLdmypXC6AFWqvDqQ2ZWNV8y8dLlp5hJiT17FCL616z4MFphIsO
         9qQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382441; x=1789987241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        b=PoA/dfaGE2VQV5Sat83DKb44xW4MvpTdjxYDwRhsW5XUVT2WE4p7idojtIz5Wsb9vI
         1FKufkSSB195nnDRWL6RdhoVlhaT2D4GFBN/TjhndY2dNxhUPA465eI8tGuJMdhSsw31
         rVEZNtVywLVU81h2OwZoCm0zPhERb924t5zWnHiNQmDyRZuEDRtKJFSzgTglH0/rvJAs
         fEFMGsQoFsvO6FRlTL83mwYqIFcdhT1A0lz/jlmWV6VIES2RUSCg5z5o4O54bfcO2cJm
         Aug9v0+fQiR63OYm7OdprSMOOSUw6ScN0RxUxtycbc9kjabPknUJltQg1AP1uPY1tTCp
         uoNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz23KrYSJ1ZSDemYKhRWuD/TQRU5YtAJiOsshD/kJiJ3nwNfzj3/fvkkJJZm6lIS4xhkIlJDEzm0mnVWGR8nSGD@lists.infradead.org
X-Gm-Message-State: AFuF++mmKskKWfXGTf4x7ApBMwRaiaL4PBN4BsF0xLVXE4qksY0Il0et
	00dde/sQjOi6ipD32Ced2y/CfDUYfAIFpNlq+rWIOGeElCdb1syaixtd/8FOzEnaF2TWE/XlCM2
	nULlNjYLU9pd8c5Pm6dzEOZDxNx8PqlQ=
X-Gm-Gg: AYBFou3RJ4MFxCnloWDb//1bX4hM3zX+nZGJQgdR3EbJR4sqHUoHGRyqPtCufNtkoBD
	t8sIBf1BcuTHc0bxRUAM1+GZEGpsW0zTnRy5JuFdMyRWX+vzuJrjOm7SCgTIjE/Sdqw/5B5rZ9L
	xu56NA2eSKZ8s8cNvXyzAt9EWcyCuX/Zod9vOt65Za1Z8RYy1a0SWwOpSX6Yefu0aAYhEgOVNJT
	L8FT/2H5qqKm5BZo2vmwA32hk7rmuUdd/EwjKL0Jsw0rS7mPmsL0Wr8IFZAgfX2Dc2XPgTkBkYk
	jNqllqgN9C3sQ4BjfALDcLZFElyAWHyk2+zLjbS517HLUw+wtqOBnfvyUl/TkhUdoM4mQ9c8AuB
	Gj9c2N1kXWmgwe2JpNvxrffJD
X-Received: by 2002:a05:690e:144f:b0:671:1bc2:7f83 with SMTP id
 956f58d0204a3-6714e19664emr414645d50.75.1789382441505; Mon, 14 Sep 2026
 03:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
In-Reply-To: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 14 Sep 2026 12:40:30 +0200
X-Gm-Features: AcwNN1WaZUZ01X5-U4jB8BOoolJJHZrM3FcxWuEUtBzFbxVHcUoB7XaLZqR-tLg
Message-ID: <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Keep Amlogic A9 ETH domain always on
To: xianwei.zhao@amlogic.com
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Qingpeng Yang <qingpeng.yang@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_034044_184030_10353D8A 
X-CRM114-Status: GOOD (  10.13  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2026 at 10:56=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Qingpeng Yang <qingpeng.yang@amlogic.com>
>
> Mark the A9 ethernet power domain as always-on since it is required
> for ethernet online wakeup and must not be powered down.
Is "online wakeup" a wake up from suspend?
If so: is the Ethernet controller listed with the "wakeup-source" flag
in .dts{,i}?
I'm wondering if the pmdomain and/or power (wakeup) frameworks in
Linux have other ways of managing this case (e.g. only keeping the
power domain active if needed).


Best regards,
Martin

