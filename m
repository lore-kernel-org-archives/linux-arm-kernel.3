Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE22AC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=; b=af0qV4T1AvPsyS65QGsZf0HCFD
	ix/LvEkn5fIgqFZcggEnNgSeu81ebv/WocaqlLY/U5QqJD+7tuIBS382yo/K9NQeVyhKj5sf/9rri
	5hixIGOqcg1vNHuA52wJ2fywaXSRaSrMhkidPE0j8lH/lUn/mVnBB2V3H2eaYAxuC1dpltzHxTZ73
	bsGDv0+0VNz+eO8r4tLeAchpI2LjiV9M6//IjQ3Yf1bqym1JYXg5JChNx5kZ3QOmFhayRVBvPJmSb
	mtIwTJUriccGUrH0HL7WAl8JfiYiSRnm6rJerZ34DKTmtmpx5q2pwXPup+SseFvQWplIGU7JsKcg/
	8kboyKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rzG-00000008Xv3-2XpL;
	Tue, 08 Sep 2026 09:19:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rzE-00000008XtS-0TgI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:19:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d6f9e2f681so47236265ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859167; cv=none;
        d=google.com; s=arc-20260327;
        b=KgX/aZPKxTsOT492hzdyBJ8UM17ApupvPPL1JleZwu9v0AWFBf2WVAQh0MjZx55DRj
         8CRMr7kEmkbzgzVTyD8ZTCZLZJr1/bczfnqrWMvww7fLTInCNieKwlHFJym6kIhwC5xm
         HsVRtUT6t5aWdDqwTbTmHxG/MVtMsnrF7txGH/vvpUAtBPqZkVTyJ9NJKf61SbuASOrM
         omShsHvfRWbb1dIyVVxGKjRHgjFhh123o+/DguKzykn8PN68ojQmranNzkdwa0S6Y4FS
         szJiDcd/NvU3UUrxSw2WgvwqfiQkMdUeyDzr0/5xYQ270OruZpSal7DHDqgW0OEU41JF
         01yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        fh=LA1QpfCvf9dXvF7+eg5YisuiPL5L+9FNF31EAXnJvJI=;
        b=J2o94K+piAR7P79RHVV+U2ZP+0yfU+WZ/S4DC1UOTgKid03xtfPvDkCjlsVWt4eUvl
         774RVOLXPSxeOEwU0pjdxGezQToOLc7gRizj0LrnsYZapl1xd3TRhIgmzSK5sZWxfMex
         3yTLixTpl1jW6pJzzFg7860/CXNXNO8uLTulObXoJVnAqhgsQy42Y6iofN6d3iYsucM6
         oVpKtJMAaKNzdH0Sx9svtzTdAWo8Zf4KOdPgKkaUGFMVMX0H5G/Td5AyA1W+D1tR9JXH
         xkf7bWx4b7q0SvA8WCLuqw4O9vfSa6FWiPmiMfWgOMASAEV1bf6O5sqyUWrV7zRKStHm
         u0Iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859167; x=1789463967; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=fML0MBGdGB/RDDug6JqYvI3nquhahldnpa64G6CphRUNbwXR2FJojVmRo48dtm9q5o
         HAP+75lgGmm4iwY4jASrGk0CuzUFAzZEqre0BtAgx1ap2XOFN8bCJK4XVGor9Do2R/5W
         VNfE2wQU7AjK/u8QVCgKsdFP3UbyftLalII4Bm06mrsCySKC5GZRK8rZwqg50QDdHotx
         2w0aERhUU7reyxQPiqb40eH5DaWvJfZNI7Wsf0iSOW3gqW6Ad/urI2QoChMTszbMkd+O
         AArPPuWYjPeEDTyrXW7zLmQwZQKWCA5jP93uE7tUslDtdVxwJjVKz0Dupk0IvY5CxDLx
         fafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859167; x=1789463967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=cpBHZXuwKfHnLeTIhJ0KlZreQOjWa2jJcSiRwUD/4IaMvgITIrQFnqGGCvHt2Pr4LB
         FZ3nzfdcZc6MBGHWevY0icI0wtFzz5I4iUh7Ume7O7pJvaNSeHG9O+fvRRDs1pfmr3rW
         7bOmfbH5l/V+shCY3FmJ7EQyire2hg5Q3esN+tMMUW5wqUjvzY4j4/yOwSA0Zkdsc+LX
         gfofsqAZwgqoihF90BIr0cLUr5IBzRJFBbB1IkzlFlknRSyzAkxobYEpfyDrSgYSW4k7
         3ETncW/rr06UPrhEv10UQEP7JJawbgyoFWEm9qcgI7Y6jxx7pGa+y3CnSe8C4YV+BRYB
         g6hw==
X-Forwarded-Encrypted: i=1; AKwUvBxyr41o0N3jjBtUAxbKSAK7nrLeCyYw90JpNKHusmOc+q1ggjGoVdd90zyE1wnQrr80V2omZnh6lBqC+zBkaQjn@lists.infradead.org
X-Gm-Message-State: AFuF++l+8nWABp/+SCtqFOjqqm2CRIEpuu8/Bsm//f/xBP56GGp5e/qf
	0g84MOg9MfJbZNyQReYLVOOm7a9Sdwuxo0/J1EMpqO+vycXZcNBIpJacKMDLQyTgdkJlBKGWVoq
	EdI5TzIiOzX3CLMtFJ+Llv/3f8MeiKp0=
X-Gm-Gg: AYBFou34je1swGUwWIXoFOGCsEvZx9cDR4Ilxsb0MeYrJek9XS2mw2CadcBfuNXjxIO
	qVOIh27GOMFvYcDZ+NPKemgZnPCwlrMZ65yb+8Z1UMyBcf0e1Yy7WNygd4SmwY96VPOxqskDqmn
	QI4O8ML8ZaQq+1D8EyvKelfHXyaPnxUFExpJelAnC87H5Yluz4Ukg5S2pGIvmDmbmLngGNixg07
	MxzgkOA49xMhsre338YbB5dqsBNKUmkNikAYkVrJXKJidZ9vStoyLms4nu+jKicd9M4lf+ieXV0
	9K+JYumN6TAWlcguK1+KNyBhuXWtN4wuZ2OFVTTXl5a/0IDbyZh1wMwcp2nJzhSAfX1jGuKQPbg
	1KOmIVnFDMVV3VCC0UFKL5IOiZb552JElG45aD5xdCVv0XAGrNGLNEAB2
X-Received: by 2002:a17:903:3c47:b0:2db:eb5:47ea with SMTP id
 d9443c01a7336-2db12106896mr426721305ad.0.1788859167169; Tue, 08 Sep 2026
 02:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <20260908090448.3332-5-ansuelsmth@gmail.com>
In-Reply-To: <20260908090448.3332-5-ansuelsmth@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 16:19:14 +0700
X-Gm-Features: AcwNN1VpPKN1gkIiS51yj4BLA5N52CV9eNK9WOCJ4im1zZlIaPxLmU_uBzBetZQ
Message-ID: <CAABR9nERV0bGkEQm=4kLNBZVfurr+6c-Q_to9=XixJV9CT=vyQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_021928_148645_5154A381 
X-CRM114-Status: GOOD (  10.16  )
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

> +       ret = devm_request_irq(dev, irq_id, an7581_afe_irq_handler,
> +                              IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
> +

I think we can return the error directly here, as devm_request_irq()
already reports the error.
dev_err_probe() would result in a redundant error message.

