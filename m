Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5689AE83063
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=; b=Shz1wVpYFJCR6+JzcTUi/zDXYm
	8L65YqN+LZqYv2nD0Da7itcjYxFL3vsW7oiRzwxPDzgBlMhbl9QLICk+HQtkGH6RB2LnnzQcMpsQK
	DeCKgZHKu7Sxf4EclCLJncO4VurfMa+OYSItuyfQ4nZnHugdzl9dHicyt/vCIpncLazI6aYMTrau+
	J8h2dO+qaqast3vZjZpFA3kY8fFbX0SXLtDbnEvcTHZss6vhFuH26lY8zeAFgrigAGT+lQpI+32Fi
	EjP3Sw3IyjNNBD2p1uwhOPd/1V8dFu6qfoX2KMeW+yRmS9o108Fm1p6EY+S3tY8IWYHdBOp8ZeeAn
	YyxcjjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBq5-00000006JcW-2Rjt;
	Tue, 03 Feb 2026 08:32:49 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBq3-00000006Jbt-29sw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:32:48 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1249b9f5703so7098407c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 00:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770107566; cv=none;
        d=google.com; s=arc-20240605;
        b=BCq1iqj2kJO3KM+rqxs3DWLPmSzvlEuB5GtgQygsRng9IWeFtmBiBSOR1Rvfxfth11
         RmB4Pk2RewDy0udOB6a3NwNVluhamBDnPNMOPm7wEeR1R2t/Gvo5Vqekiwk3MF8y22jw
         uhk1IUglrLYsFGBVFvf+EsMdGhBUeWj26jbwtYe2WWY2An+K0/wN4Zp2ca40B1QmyffR
         DAmo72ZCgtQ3D9hvEo4P/a3miwnxGQvpVLlZqnfqLeMeiYBrM614TybiDNmU9R1FQG5o
         LD1ogGLvBrNtAaAWcwHmhlx/NzZfoJSgFM+rEkQE7TX++uNIwNTOMpt5dOS31iVVi6FZ
         jKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        fh=nj9bBWJb8VrYM6cPBLuGHvBDkc2t0asO4y8IIEIvL7c=;
        b=YdmegiGplJsf4nwiCJXdUHSEuc6Z45vbyTUCRfBOO/a085u23V35Y8vPbrzG/ZfwW+
         gVomKAwjZ+8Ylgw/7YNlOnUEn/l6DoJC/TemR9THlaeoOIyDycGGWfjRPLC8Yr/trD/g
         akeK+x25o68wXwaQ3aEL8056AILBZGQV9xEZFuy48xaW0yheq1MCii/EKzzgmNQssse8
         3evEbriqRiUxnUawirmWknT/j/q2Cg8UhtnE6ygUThEsvFsAXeSbuWYrv0UyaiVATe3d
         OH7cQWKMfPTItrHO/RzfWQOu2MgPBKN5Ns9FdHLdIoHnQd7BUSLN+izYqSM42nHG9xlV
         AHVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770107566; x=1770712366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        b=QkSZ6/Sg07aPB7M9SmnFdPugt0LoMaRFRFQ7jNprw0sJJHNRGwprDkgNL0SzesXVOL
         811g60ik/OCTeILQU9SZ+9LKtubIHFFQlBKTTyIE1QLbI27ZV2mOG/cNf4YNqbN/s5Zq
         PpVpddj2z4gv/oETbzoA1hIxq7XsDuAuA9UVNK+5MJBNN7g1zQ7UmWHs7JuqhzNtDfb0
         YnucotLJjWE/iLGWtJRZ/FxPLS3r47tqPjdsKI5xyZLw+Kq7mC/ACjA2IoVNL4x+4Uf4
         dLSitvAfnUDed2MCGkoIZTwET6g8Pqa2uqDzdDfoa1UbUGB78WvYO7dc+BtbEM2eIyBr
         edKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107566; x=1770712366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        b=LL5B7RbzbtD+FVeaOv6PMOOyNbU04njOekxp4gZVkXAV123PrTeUfLnKdtIuAzFHuG
         uizhW2zaODqvls+8V7z09PTO6kJtycOXG74J4wMOPHHd7vBawtb5bAmVof6FDwBvIuIY
         W68gOxQDOhfaHodRfjqtd70clO53oNfDl16/zy83P9FL/Q0kl6M+AAevVRYZFW+J/5+q
         rMgubDYir8pzENtAAEYp71CxCYZmjHBSIjkdu/H8wK8xt+8MuP76isx8oHsvE2V5t9Yo
         hzpxNPrf9LlzFODnsnoV9mTxrTVVF2Woxj2Qb7hkJ0HDrye3toRyjSTpKsLAcT3mgKSn
         CvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTsneZs0OLXD9f13qiuGpjDMvEqZH0rKx43f47QuyhdDVtaWQoCWHAIsTB6H2w4Jusxfu1crMuC/z2ED+hQtag@lists.infradead.org
X-Gm-Message-State: AOJu0YyNRaPhyJenr/k9kW1g/fi4E8iunjFl7qn5viqN41n8kPEVecy8
	0uVESrlJutigZocfze73Dnn6MayHTumGT2coRSsHtTiTfeb4ksfiMH4idt8Yp69T02g/pKpFqpG
	bAssqA4vBoHnUMTj5XwbSbYRBWZNZsTk=
X-Gm-Gg: AZuq6aKfu86itp1f9ZPWMimUocv8M5INC+KnZKDWSRZEKMpSmwn+e8VCXtxmiIwO/HK
	2f/WeH2FDlq6ygfSVHQpBScJTKKXom5oiIRDkXVs2Jws4IUAb3/60yJtOpFTS/IuUV1qzon8MFk
	gjMCAm+bniehRKcdmpSirBS5T3xV279Bz3mbw2YedWs8Aej/3qoBX6HGlqOAr5bV2D93DWct1Q+
	0DKs4PjRJY/j/yXc5dojH/x/e7w69G6a5W/sWIoca284nOf3mrfijyQRE8BCc6X5DCxEj/ZUU3X
	GgzUZaxMrRKOo0SohRtLlY7k/2lkDW4YzJiJzc+R7gfgjIDljPjyt2Eh9LZkJJvAETdgNn5RZdX
	s/0wVkypcDQ==
X-Received: by 2002:a05:7022:160b:b0:119:e569:f60d with SMTP id
 a92af1059eb24-125c0f8c302mr7264388c88.6.1770107566507; Tue, 03 Feb 2026
 00:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com> <20260203031345.3850533-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260203031345.3850533-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 10:35:27 +0200
X-Gm-Features: AZwV_Qgw24M2z0kseZy1hei1NjvsOXkgK0vaXVyKxBbNrRS-X0jSjdoVh3qv9-s
Message-ID: <CAEnQRZAgjyKYZEJ9FVqRsCfzLOqwbRZXahqMMNdJpP54NAQ1PQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_003247_589973_4CA59600 
X-CRM114-Status: GOOD (  13.93  )
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

On Tue, Feb 3, 2026 at 5:13=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> The solution is to trigger asrc before dma on i.MX952, and add delay to
> wait output data is generated then start the EDMA for output, otherwise
> the m2m function has noise issues.
>
> So add an option to start ASRC first for M2M before ASRC is enabled on
> i.MX952.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

