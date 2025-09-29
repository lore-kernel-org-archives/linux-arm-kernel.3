Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0648CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KUdznDw5vZ05JufQlJyZkuSTNllnaQhlyyX0vFY+xA=; b=g7kHolXZiMOf31TZMxEcOg8Wsf
	bzIkNbQRY21LrkNuXjOPAmnV7eYsrjh3/K1pKfIFe+m0iiyp9KXcRr8d6BOFLpRq+gp+i9JCHvgmh
	HV78zCzUJhxf62/e8g2kjypdz3yi8Z5U4hRDHuY69AUEQvvI9t7yxrOgbXN3nIzyKRi29KqWR+Q5H
	HuxffB8IgPLZc+hjywjXQEZcmcAR2otBNxFOK6zW/oZAuM/FPuAR9rauzYryf64Tiu9fz+3GjyV6i
	1VkOfMsFcy9o7by1Co0uG0f6/IqvYh4qN3RrRisj5uQks19bCWUMnaTJ2PY/JNsxBJxPExIwv2bxW
	KywlThVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AfB-000000024PB-1vZF;
	Mon, 29 Sep 2025 09:59:21 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Af8-000000024Ny-0W08
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 09:59:19 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71d6083cc69so51214027b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759139957; x=1759744757; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2KUdznDw5vZ05JufQlJyZkuSTNllnaQhlyyX0vFY+xA=;
        b=pcuc25u38ynlySDv9udDyJxHNCNvil3idefozZVZxGI3+X/3zqtY1qDUX43uPXvfxA
         to6+DG2cMsww1pa35R0W892aGattymx2CgBNU3yTRXSJbzhZF67OpdNxGslzQGN37fQd
         T6IIXaDm/jSia5fW5Pne47PhtKjnRsUO+l8K9U4kIJHUC6Q3FzssHH34CMKO2q+2e0Wd
         CBNNLM1N5nXuSEhLuR8COcL30SuPVH2rHYU6ado+t2c3OPI+uJkauNhM/GtTJl7yeN4x
         6GN83NbQ8gbBCR57QPyqfCEBxrod6+oXdz7fbZBYv+vDbLZDWYn5dNzlGfjFUHO4LPpr
         v8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759139957; x=1759744757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KUdznDw5vZ05JufQlJyZkuSTNllnaQhlyyX0vFY+xA=;
        b=KVVPw2cd+1PqbIeVuQbLwYWwAiCnXHLUMNPw4asJd3JSy69yvfT1rgyNbtyca4GwTL
         b5TEBqMoY2AWXEtvlLlljZyGKAePMUVTBKTFxcP2ljGbToXjI8SLiCDGJNXnQoC9mCb/
         aRwPhCdRRvfDTbcFhctVnzmBaOcKCGkRUthm3cHYb1Lrm9/MgqoSAcbmNMIlMj8YG8Mr
         K/JG31y7uYRSLmuwqs/MVBi9tKky64TFPaJW5NmcuV1/iE5qD2oj0ktvgg3Psg/2mKfi
         +cU325IWBrBSh/qRwcjTpFP5o8wOjPEsW05znFgmFTeVRWSqLWLVR/Bwl5bouZYkHl0s
         8YBw==
X-Forwarded-Encrypted: i=1; AJvYcCURG+7tdauWyujmyDoya7qHX3fOUYAYfXw3lXZl0picxQ4cQ1F2S1JHiF8Ta1UMg0im0XW+qoVOAh6+EGzb43yh@lists.infradead.org
X-Gm-Message-State: AOJu0YxDLs268QkL/3A9Yh6VkIxekyBX+XQ+jcBsi5rOMhoeQJyE5ebQ
	P5Sza94aUGWmoqJ+6Xt5VY0UikzTLyd8zJOQptNviBUA58aZqux2cLrGJkDwj7azQZVkjWFNAo1
	7x0qBrZ9OMqhiLBB9PSAMDIdyThfSdS5/SLwakL1ukQ==
X-Gm-Gg: ASbGncvbhDg1vCaCf9cqBB2+nB8y4WhXQIaVtLWhQt/aFAMn7TImyBBrXbPX67JitGv
	HJbw4QTkzr7hRWw6JyECdZL/A8I/hZFwrBr+R+7WRR1TB2tLwh27zsnqBeQram+LD69TrP6VYt7
	YYdStgNHcYb8QkaUZJcuturAgToFqn5pl5l6pr1XqpHzXMdOM/f4i4oCsTLamH8JkMS2jUc526H
	fgc5fKr
X-Google-Smtp-Source: AGHT+IHKB6dZwmkkiRTmQMJ6qqV5u+Z5RUcKikaK+UuufgwTUJ8RoCQyTBvf2kQBGXi0WQ0jZXHoQTtqUIZWVWUBjSA=
X-Received: by 2002:a05:690e:1a4f:b0:636:f1d:e26 with SMTP id
 956f58d0204a3-6361a8734e7mr18613222d50.32.1759139956833; Mon, 29 Sep 2025
 02:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-8-6cd63ade73d6@collabora.com> <CAPDyKFpLNJRRxWPm2Eye+Fs8go-LNwWGzPUPPKmNVJkyK5N3Dw@mail.gmail.com>
 <2015216.PYKUYFuaPT@workhorse>
In-Reply-To: <2015216.PYKUYFuaPT@workhorse>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Sep 2025 11:58:40 +0200
X-Gm-Features: AS18NWDi6KooeuuBdFZYN2-L6gygoxiX5visVgVu6hIAQ09WtQulOO0qEvr47Zc
Message-ID: <CAPDyKFoCPkNsbq8s3d6cQXxfFhiYH1kjrocNdq8=v+g+LY8c6A@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_025918_170837_630B9D85 
X-CRM114-Status: GOOD (  20.49  )
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

[...]

>
> I actually have a question about a mystery that has been puzzling
> me as I work on v5: when unloading the driver that uses the PD
> (panthor) and my driver using `modprobe -r panthor mtk_mfg_pmdomain`,
> I see that sometimes detach_dev is called with the pd status
> reportedly being off, but according to my own power-on/power-off
> counting I hacked in, it actually being on. It then proceeds to

Yes, ->detach_dev() may be called for a device, when its corresponding
PM domain is both on or off.

> call my remove, which results in three splats from the regulator
> subsystem as the regulators weren't balanced with disables before
> they were freed, which isn't the main problem but more a symptom
> of the bigger problem that power_off and power_on calls don't
> appear to be balanced by the pmdomain subsystem when a driver is
> removed under certain circumstances.

If the callbacks aren't called in a properly balanced manner that
would be a bug in genpd. Certainly.

>
> Did I run into a core pmdomain bug here, or do I have to balance
> the power_on/off myself somehow in detach_dev? If the latter, I'm
> struggling to figure out how I can determine that the PD is still
> on without doing my own bookkeeping, as pmdomain core seems to clear
> these fields before my detach_dev gets to them :(

When genpd_dev_pm_detach() is called, the device is being detached
from its genpd and part of that procedure means calling the
->detach_dev() callback.

When the device has been detached, we may have the PM domain being
powered-on for no good reason. That's why we also punt a work to check
if we can turn it off (see the call to genpd_queue_power_off_work()).

Kind regards
Uffe

