Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9515FC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ew4DOVhQnp3KVlv6Z+adbVElEmJww+rFIUASaWfJwLQ=; b=LMNbQyObNaUpRYIrdOPWS8A23v
	LibiuEgNhZZW7KYHpMzGI3f7pNjAtbqSMFrXim8Xq73m1/qoe3XUuqoFTjrjOQHKSN7fWf99aebSU
	yoh8PdC2sEskJKXIuDI5+OygZ2rBf+jcI1JGngxKlKvYCgoQ2IvPVgzpr7ek6ZinvMubQ/IbzvJef
	L9s5Ivm59I+AO7SIym8rGepJuF7HR9s1LqFhSzi+PwDVqy7BU/uyzutmXKcLPUtxjOkn9oyaT54Mk
	IEi0DRfAw/+oSMqEzzO7AOIUzNXdZZ5nuGbaotsC7ivsRzaTnVIDoCJFWgX3ofYAxr3VPQAzZbZhg
	uVZuyNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfK8x-00000000h89-0wjf;
	Tue, 04 Feb 2025 14:43:15 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfK6z-00000000gov-35fN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:41:14 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e53a91756e5so5690860276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 06:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738680072; x=1739284872; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ew4DOVhQnp3KVlv6Z+adbVElEmJww+rFIUASaWfJwLQ=;
        b=pbJigu6gjQBWPz3Bx2dNsYbFmGplRqYQqfR0sADhx07zjqCas/ljPf7ZaOMzr49t/L
         I65SO+d30r/ERhSWKkQdUeJydAtrm3wvO3X1RLeWPoSKU2VEMNktJPnEzqdyF8MmnwLg
         9bMIJ5qZGCpc1qGenqh0B8o15nzRDb9EBKcXKNL+zse/ZkOH9Tmp1jmBPm2WijzsInSz
         936iRa94UEkDTzuZCFor4KoxvjmZlMrBHX90/CZVjnwWd4nXoGixyfBTgp80kHWzEZD7
         VONmYHqDd+EavX8zbEgD8KjFE13psp6egfN+vTu0izZlBHqvhu3/zG+t8jF0tUQ2lZx5
         zhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680072; x=1739284872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ew4DOVhQnp3KVlv6Z+adbVElEmJww+rFIUASaWfJwLQ=;
        b=QFTKU3FpfLff63bE8d1MtIqN6qtmQehW5A3T50HbLt6JywrpfnGLy8eR2PNvrhs5ek
         PlTM2uMyirsy5hEV+ITplRen2X9IjxPuMQ8z8AhW2RCBVHk4OMZGEVpjgpWqdELGFZpV
         uh1HUPPlpSJH4rDFarfEEpZ21kCUtSYMPXtkRVwxFUCQdKrIslLdYES3AuLz9beELTeJ
         zUiyEyPE3HBoupnNak8d+oFbvCGuQMWKpofDR/xbvSonAy2Fu3tvNOMIa1whQRVNqLD/
         r7M+e6A2D1KH9xWEZwhH6fl+RL9eQ7XVgpyZkYkYcAyZzXhp9PillS2f9CZv5zsTxl/t
         pulg==
X-Forwarded-Encrypted: i=1; AJvYcCXorrUjUSSz0FCz7L7Omv+Lr7NIqOh+19lIq+sTeu92eaAVAqspt5I/p3DY6RqRBV1xizssY17maTGBnUuSY8YE@lists.infradead.org
X-Gm-Message-State: AOJu0YxBOeTuTlBY8ytdMKbcsB9/6MfY6++kE8VDsJ8rvlzbWxWQARso
	9wwhTQX5AFxOdZwfqqJfAyMldaADBUDXVl+n4K7IVMHAkrihTxA2sUDO0F/b2wcw3gsRdFti4lz
	q9acDfCsOJZeFsgGraplARpvERRv5jTxKtJLgaA==
X-Gm-Gg: ASbGncsM/6u4to+AFZ7rNFoK24EcK/SvlO+qqHKK+zXxRs5pJ6d1JrizRtkm4hQAm65
	LqUtyIh3jWybUy/kkL6Ajbo3djCCDoS5qGFU9Pg4klui4OQYTbbF3Q5AgGVQcyTGqoqZQZWFMuw
	==
X-Google-Smtp-Source: AGHT+IFB7VsIcSnlCga8NeUStj+nz7dcGdSq8KdqrAerawmVjHxlGaQ1qu1pYWqjA4/tsyCajzkdoxica/UvVlxL0Zk=
X-Received: by 2002:a05:6902:e05:b0:e5b:1034:909 with SMTP id
 3f1490d57ef6-e5b10340af8mr5144143276.29.1738680071774; Tue, 04 Feb 2025
 06:41:11 -0800 (PST)
MIME-Version: 1.0
References: <accb12bd6d048d95bd1feea07dd1a799ad3f8b31.1737532423.git.geert+renesas@glider.be>
In-Reply-To: <accb12bd6d048d95bd1feea07dd1a799ad3f8b31.1737532423.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Feb 2025 15:40:35 +0100
X-Gm-Features: AWEUYZk6NgieIWPfpkG1IfqaDakdkwS41m6bUoTtDOf9y7ZpOmY6vlu_-K7SU_E
Message-ID: <CAPDyKFrOa4hqGkwqGN9BwW0w2QP8S17EO6mSrQHqx+LLprkFxg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: ti: Use of_property_present() for non-boolean properties
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_064113_778487_628DC911 
X-CRM114-Status: GOOD (  18.65  )
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

On Wed, 22 Jan 2025 at 08:56, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> On BeagleBone Black:
>
>     OF: /ocp: Read of boolean property 'clocks' with a value.
>     OF: /ocp/interconnect@44c00000: Read of boolean property 'clocks' with a value.
>     OF: /ocp/interconnect@48000000: Read of boolean property 'clocks' with a value.
>     OF: /ocp/interconnect@4a000000: Read of boolean property 'clocks' with a value.
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Seen since commit c141ecc3cecd7647 ("of: Warn when
> of_property_read_bool() is used on non-boolean properties") in
> dt-rh/for-next.
> ---
>  drivers/pmdomain/ti/omap_prm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
> index b8ceb3c2b81c2510..79d165331d8c6379 100644
> --- a/drivers/pmdomain/ti/omap_prm.c
> +++ b/drivers/pmdomain/ti/omap_prm.c
> @@ -613,7 +613,7 @@ static int omap_prm_domain_attach_clock(struct device *dev,
>         if (!of_device_is_compatible(np, "simple-pm-bus"))
>                 return 0;
>
> -       if (!of_property_read_bool(np, "clocks"))
> +       if (!of_property_present(np, "clocks"))
>                 return 0;
>
>         error = pm_clk_create(dev);
> --
> 2.43.0
>

