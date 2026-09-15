Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43122C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=; b=Gikd2TzgZnL4kGSh6QQ4I+bAtJ
	QN5SUnUtuA455f/Vi1oSpCTOdmBWXNwOnHo2BkoEEn14wFmzKL5ht0NCIDCJvBPlZmlYN/SPi7nDN
	UhGXFySLxpuo32qtuA47fBXHd/h5sFu8bCEasFpR1l6fKz/z0adX/WCSdR78twEEdCIXRULMGECb3
	txe0S+xA5n5lq5GR/9Pnns3WnChVEJ61N4RnQG6JhuG7TrZGU1VFPFp6Go6e+NHG/K8QOSUgWMPLh
	xURXm7rrIa4tH2UsyOxpiqrDTc/bbE0OTsC9ybJvlTufBpvfyASrHrmVW1tFHI3x8lueG3r1Na0tH
	ieAURUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QaO-00000005wvF-33u9;
	Tue, 15 Sep 2026 10:40:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QaM-00000005wtq-1LpY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:40:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso752777b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789468821; cv=none;
        d=google.com; s=arc-20260327;
        b=Sf9gCKll8JirhIqUde/CQFMZMBLOPzc9otej3bRU3Hpa2G3zmP0ABFTT6p3FMOJTtL
         Oy+MEM+5lgP8j9juCW37UOMZrSdDN/oypAdCiGb+LGL8A5kJqyzNzY6z6tdnOUndy5aZ
         gRXVByONl9KL9tEsxNMdl2wH4qCU6aXFYbH35Ny76OM/mUCdbl8BdBbILNPFdbBv8axM
         vSpB3W99DXLGec8s1KdDYWTm28Et/aGxjg9je9DAEmfnRaSXhY7eT4QDp43XPS2GY3Ai
         dhJLsElMS6ZHlZM8WFWSH5gmbJZG6s6zlz+Imzf2QRCtC0atjfvsGfZAZJXUIopCmFOZ
         uKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        fh=en6c3r6k17q2dmNLvEs5Q7do7POSwtS/pyi7C6QemnY=;
        b=ETIPXaGaGInf0uRMmLMBp1zVQTinglPeWqQlDUhtczww9h2QYDMltNhpbiYpF3yLL9
         dJXjHu4ijIcUq/b2W27MztiTvwQj29WM+eZJEtfxj8tmUX/2giPhLfo8pWM1p7QJWip2
         LZDy6C8owXCszOz96k2RG2sVlxkKNDZ0+AgmVq+EzUP3JtLaMU48qAIj1BT0rIy7fYDQ
         NnJj1txbx7+1ja9rS2l9PEj0B1MGaX1RAQJ2AW/x0Wkp3ipwKMWJwjOv4oKh7yDyxXqv
         5FW2HHP+AdCwVXlmtWoxSlT9t0Ens1/VvnEjTkGGTyNFxQnWSnZnpvWSP9JnBRYaYiij
         9/UQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468821; x=1790073621; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        b=HWtTa66E9tDx91m8uC8qat2jFkQrEh6WMA8WzgAKx0gcftmF+fvaSSrRP+k2zzFgjv
         6mys6IPeoy6X8nni+hGVFe1/DI6Q8a2ALiPu3P53zqBSWWOnv6ZSUvQ3xsmf/qd34qCV
         vwKXhDxrwQ249cH0wLxHrxlVzBUQw9oU/f1LJjivERRWU5tFcINc2axVKLeOQqkVOF6D
         YM0mhA7UwBEKcDC9FBA1wv77mQXJFDhWOvgHRFfyqCZ/XWq0Y6Z1dzvDcR8ZSUoHOqPR
         qudJxXQYaXDNAMTv6SlXpCBFgiiazGjd4Bw0epmAtsbxQd2/CMmLMIfGnfnIQEKPPUcT
         PICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468821; x=1790073621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        b=mwhEmu0OGlekw3EH0Y/p9u+qheqLm3fBiMbRat0hw/EIQaex9myOprfZTD6cHRqBFq
         BKz15rvjt1KF54BZyGgi6SAvZbNSg+aapp0CwETTays6DNUn3AE+VcsHj1ZaDrO9mbmn
         9SKFQFzhbRwwBo6ebtgCS4S+c9Y8yIrU+jVFogQO87cbzhtH/TiVrA3liKDWqV8jhpEI
         RTC0v3WLB/qaCATcVjLBEgekiWTaa6wvxS5gwtTunwTQ9zXMC1sGKMJ8j6/oGNma6oF7
         rhimDCH/FZSwhw+RKXo1XV7j4Pw7UZHdhjUoFDm0mzX33Viouznx5nsjx/k2hZ5cRabr
         cW1w==
X-Forwarded-Encrypted: i=1; AKwUvBzVIXANuiwFgxpeOj7++2JA1odWC3EADD5FV7ZVsXGU6HWRgVJn2FMFdhbCjhzuCMPNG4AeGdbzv1mu/bO/FQ/q@lists.infradead.org
X-Gm-Message-State: AFuF++n7gWLmtOWYAz2bxxa6vv0i4R2ivCJgy9olM4qMkJ+8bbi1z8JX
	xXl4lK3Y+VyJ75XV+oMeZGBIJXuERFrvpV5SyiFB8zJA6dMjP6SV7O6ExzII3j4KW+kt9AzILVi
	qytCfIHSOSoGrFpDT7kGEQoyOcZKVFrA=
X-Gm-Gg: AYBFou37xJCdYVLU7BRKlB4rIKD2sKY68EQM50L05VCnT9bPGOddqy363hgcFaxm3hl
	DK1RGbNvKqQEfL22JNKEk5KVK9rcP18jZUzXod7lG+ANatKvJ3MkFueevpY1ZNic08TOnHTe1Bz
	DHCxrfWs5a7xMg1ENxTdyKGYewP57csEQsUh+XNKj39wL4zyZp55QsgLqZWOA6yXrI1X5BCM+p2
	14217AW8BJdSWcA/2NRsRvTsURgav71eI4wlsK9FMt2+3rOyqZ+Pq3tAXQOeBDNhAbiJSDS3HhM
	PBNNcOX/bJJDQtbPQGc8E9EskdZGYH6Q8sQ38AfhUvRHrPGszde+7+SmaH2s6fEu+cv/wXr/EfF
	3nxpDSqSP+f1SOqrcFCwfTj34GDMhFc2gEETgGdFyUxrENGdyb2rGOyEw9Ssj7bh7my8=
X-Received: by 2002:aa7:888a:0:b0:857:73c3:4469 with SMTP id
 d2e1a72fcca58-8708c367516mr4031436b3a.24.1789468821304; Tue, 15 Sep 2026
 03:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com> <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com> <aqf-pqvBNQ21EQZx@sirena.co.uk>
 <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com> <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
In-Reply-To: <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 17:40:08 +0700
X-Gm-Features: AcwNN1XiIsKmvO7R4Fhz5E7d9MTMT7jOpXuiLatg0K19TloBrHHj0Z2OJFenKUg
Message-ID: <CAABR9nGWG8hpkvQP_0d+JytRpW7oRYPDW8RvUOTxL9kuXyEN+Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_034022_372098_81E1DBC2 
X-CRM114-Status: GOOD (  24.45  )
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

> You have reasons, of course, but have a wider view and check the full picture:
> apll{1,2}_enable() is called only by mtk_apll_event(), which is a DAPM supply.
>
> That call can only happen if the device is not in suspended state, so can happen
> only after a call to
>
>         regcache_cache_only(afe->regmap, false);
>         regcache_sync(afe->regmap);
>
> is done in mt8189_afe_runtime_resume().
>

I don't think runtime resume always succeeds.
However, with the code as it is now, it can indeed return success as
you described.

> > If that assumption were ever violated by a bug elsewhere (
>
>
> > a PM race,
>
> That would have worst consequences, and your system won't be saved by this error
> check because it would crash way before reaching that...
>
> > wrong resume ordering,
>
> If limited to ASoC, that would break most (if not all) sound drivers, as that'd
> happen at the API level, and would get fixed immediately since that'd affect way
> too many platforms and architectures.
>
> > a register missing from readable_reg, etc.),
>
> ..and that would be a driver bug, which is not the case here: the error check
> though would be useful during development where you definitely want to paranoidly
> check for literally everything, even "useless" things... but this driver definitely
> is not in development stage, is it? :-)
>

Oh, being upstream means it's already past the development stage now? :-)

> > this is where it would
> > get caught and reported,
>
> ...but then you still wouldn't be able to do anything about it during runtime, as
> there would be no way to handle this and fix it: the driver would still act in a
> broken manner.
>

I agree it may not be recoverable at runtime, but returning the error prevents
the driver from continuing as if it succeeded and makes the failure
visible to the caller.

Best regards,
Phuc

