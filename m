Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7221DC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBZk4YT8qgXdmFVphk3af38SH0U45FRNDQkqVdk1COs=; b=falCELsXixm9OYY0iDZBRbsj1t
	i+lB8mdtLaUFEcOuyzELNP0zNycburR9exsYM00XE/reu7M6I1wUe9sY00UBOJN3hsTBegO2TdiKf
	yxnYjB3eUFUTBXOBGaSnOFwJNNAlLB06QAzRQ7I49NVtHzWzWYkfjgy8ck3+3r9lHt77PCi+1qkap
	RMZgqeP4Gty7Kn3AbQS0sjbqPKNcFXTKZ/rh0WPLUdoGuDLJZ9xgaffDVq5WaAEDmJpdwmXo4EYna
	i+/03BNWd0CoCvWUt75+NTgQHoRKZfR5pSDgUUkOT6Ld92VrdXd/V9rPgYb/lEl7GG+z/izUQpooY
	wxJ0MLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNKJ-00000008P47-1wW3;
	Tue, 18 Aug 2026 17:10:15 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNKG-00000008P3i-3LzV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 17:10:14 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so100657a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 10:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787073010; cv=none;
        d=google.com; s=arc-20260327;
        b=hTmPlWUOhvaJNLNeMOzf5gH/teeWJIQoXjFLuLgmOPhB/3Wisz6belAO9nRgHWca7b
         1S/vxQvGALcy9yA2zqYt0kiD1LDSO2F8TmXQi4wn8ttxuHTL+W06Xd6OKUxPwjBoI3PX
         RbEf4CD85OskhhFXF2QHyVCeBxLT/GLRGbRncq7Z2ZaM/jB4mGJ39+seqIksZwhUC8NC
         iGg86UZUbjA/FdS92uLTWzvOQCeMSkTXl6vXTHluZdeEpIKh7MuwQofZJR7MGiEc3H2r
         nzH9tXZY5qcAd1uefUAx3E1P6ROihiCwYQAPKVr6Zdtm/KCrkaMfz9XoxOdwklgKGzgd
         Ij5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uBZk4YT8qgXdmFVphk3af38SH0U45FRNDQkqVdk1COs=;
        fh=IJWZAsS5OHLwJl8lkMpjXoIIxD6bPevqoZ+JMwSy+Jc=;
        b=KMh5MUvNhJaT0zawKxJTItHGb79K2yP9PY7MYrfug49zSN2SbX2yO0zAiArErLRRIf
         WUqzkcJPy5q8sqfY0LW8WCIZRMER/z/l9ymHy+WD99lNwz051mskJHxh+JH+NAENFo1N
         XqydTwA0YyewIiSpznA8I5qlZZ2ZjjNUbEgdPfx4JQLI8KFsVj4U6q7wUSz4PXfVv90F
         KDCkWLI7rgLTqg9UE3WcAarI3GClP0fXYFB4geoWFJDMGWQOGTQqTVul5H9ctIbTMVNd
         WonCd/MT9quhYFtAVOt7VATXy2DBCCaLqXzJYyqjkREiqoa2d3m5g7YW7U+WUBbHA6br
         Xp0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787073010; x=1787677810; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBZk4YT8qgXdmFVphk3af38SH0U45FRNDQkqVdk1COs=;
        b=psPjmzMr1Hz/FFYfQGRM2UywVmpmcZk+1rAjULrs3S/YLBquXidlYb3R1QHDO7qGXq
         7JFWUhq/YcnPzZIrFgAnablgvDuWcHxYfJtCGOtSCBNKebsm6rnLURFugplChMmK6ebc
         iZwINsfcJsVlOEP+SzaiQn74XMlb5eAXenGXJoJZkX3fWQfy+xFIYElehX1EpYnKbgQE
         sS/TGZG7U9/27LNgbd5p1pWqD5ijJ0RW1RM3BqZC0PaaQI1rsQQQ1ojRa/0FWp81Sr45
         zx+XAEWXZaxAayI6vurBWvLuDlM//aFk1sgNaOj0bM1hwIw/1X1vLuMYrEkSt7k+LYx1
         aCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787073010; x=1787677810;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBZk4YT8qgXdmFVphk3af38SH0U45FRNDQkqVdk1COs=;
        b=LtErQDklRf1uI6Zu+DoI23R2sE4tlu1qQbz+w2mIHuNnlavG3zv5breoC5AlLlb0x9
         doOw4vUzU/xP571bN+XQdu90HNjs/AGaIcBLBfbubt3InN+x6+AbNJKyirT3eR7yRRtL
         QLpVpY721YLuDKH9YOcgov8TlR6NIyN8FXJCvkPhYLZc5/Q8keZBxtiG/b3EV6BLxdc8
         evygPg2HGXtvWJ21plNb7wYtmobcn4dx8RxuQihfg3QBge1T42i9lMzUipj3Qus/Axlz
         im9TIWVujGqw9AdmBV05znqilNVw596s2bHkNVvhmGyfEsEoepHfy6vWdEa5kZd0vAO8
         DceQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp59g2SVIpwTQO7KKIUTms+Oio53GEVivEAbhyu3ZCpO88JHMZvHUDuOfsDYDLzE3x/Y/g6cy3pZ0/MQn91Y/uW@lists.infradead.org
X-Gm-Message-State: AOJu0YxYwxQwfZvF30VmfWLHTYGEcqNO68rMCNVc50Xz3p2pTJY1k93K
	7+SXF2tZjAltshlSbXHG+VOjOY6bazqeeu7b3B5erpfsjpixuSu0WzKySVhma7aQp+BKHmogcnz
	8Fs0ulKOqvi54YZXo+8fdqTJSWK7gyDPM1KPiv3FwNQ==
X-Gm-Gg: AR+sD11NsylHa36RLR4SUftpZx6xzYItZf/IP778plRQUrf+xq3aLAj2Gx7FlKw6EHs
	lsC9EvjrbBppJYV7JHicsDeEtdFay036HDoaHlLO2RqsQv0zVtYVU4/xK7qloO8IH0b+mtVT49k
	ztxYwJU7hTGsXhlMKP/4qWRivX67a7asCe3GQHaIf9Hm1afaU9xr+XiI+IV5Z8W8KSmhmJ7/2E4
	vYzlscOQRHvW96dkzCVxPk1GRRaYgtUNNtlj9dgJKQL6W6wpHMraC9leuNyEFmdTWlqF3ZcU+GL
	xO/klCCBPQ3GD+gCcD5ozJhDMS4EWVhyzZpEVrNggDuzUXO3FXapEKHi+Fg0HOdPg+6MmXaVqvk
	/4Cw=
X-Received: by 2002:a05:6402:51c7:b0:6a3:867f:edd0 with SMTP id
 4fb4d7f45d1cf-6a38a927568mr15910469a12.5.1787073009842; Tue, 18 Aug 2026
 10:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260810051907.27136-1-phucduc.bui@gmail.com>
In-Reply-To: <20260810051907.27136-1-phucduc.bui@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 18 Aug 2026 11:09:58 -0600
X-Gm-Features: AcwNN1W0aiakkr2e92E9x-HbBeSLfkJ2O2xbcsCE6IBCSzoDBvWOIXWBuDs1O54
Message-ID: <CANLsYkzHog8P=0Zxnn58zOQZP+RWiVpQxw3EDb4TkPdYxdYMfw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: stm32_rproc: Propagate errors from optional
 IRQ lookup
To: phucduc.bui@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-remoteproc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_101012_862786_172CFBEA 
X-CRM114-Status: GOOD (  19.17  )
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

On Sun, 9 Aug 2026 at 23:19, <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
>
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

I'll pick this up when rc1 comes out.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 632614013dc6..9301e1dab830 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -705,7 +705,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>         int err, irq;
>
>         irq = platform_get_irq_optional(pdev, 0);
> -       if (irq == -EPROBE_DEFER)
> +       if (irq < 0 && irq != -ENXIO)
>                 return irq;
>
>         if (irq > 0) {
> --
> 2.43.0
>

