Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA3C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCKMLvfrG58EXYW/q3xMdTa1ro6Bjgf7O9LMZV8k7Fg=; b=FgpbPiYRDLOeltD7L1TJ0A7cbH
	8OANJqkmX+uA5noiD+xUDoHH4Ta8II5GDt0jAEKyl32S6PnM6M0Ztvm/hzBh2dnz0hqBrcXTEKvSK
	ZpngXMjqi7OzQNY6uX7hCRmadNafmbxLIRXziFDNTyYVcL5M2sZ/MIJEPTqJHc3FfaMUfTVfg/1pm
	2fyI/5LZgcR+18Q9ry3COFMqwfZiTm4KBf2rPpY7NZix02X9Y6nMwKwU8hXFf7JQ2GhSOYhPoqZPW
	3T9rkWB0jQFGae99cLMI5WN9alcIp0kAanE4f7AZzahIOTkRGBDRdNttMyDWZXEmcueSYT1amsPaf
	0aw1KIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoph-0000000DWwK-11gO;
	Wed, 04 Jun 2025 14:11:09 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMona-0000000DWjX-2BPp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 14:09:00 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e817ac96e87so711777276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749046137; x=1749650937; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bCKMLvfrG58EXYW/q3xMdTa1ro6Bjgf7O9LMZV8k7Fg=;
        b=ZpWvBcjBN+MrrGPrM3Tx8hhyl8gW7Xvz29XKeq1efNYAgq4j/quC91RGukYkuRD/WV
         PXPaQyh5/VE15aupxf1OC0rVoLoY4fZCT+CjkJad+/iz/rwa7eoGN1Fie5J0YbijJWPN
         D71gtH73MDk9Dd5BrvIaCFWo2mlIXyvcDqlU9JX8p6i1WDpEKo2SA4i7THctt7NbdWmP
         IS1B2xWz2/tlXYUZj2QnJt/DM+3dt643SZdSFonSgkhTp0UeoyCkumKbN7nj+kzZThJ0
         908loS5xoVXjMppHDdRwsNccLtxACAwzqF41xQc24cWBe9zR9dhIDHBAMRP3koQSWfzI
         /BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046137; x=1749650937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCKMLvfrG58EXYW/q3xMdTa1ro6Bjgf7O9LMZV8k7Fg=;
        b=I6o1XNeYToane4Aig05R41buNCR9E/DgcL2OUCHzDwjd+FwRmG92YQhN3sflzNcWzN
         z0KI90Jxfvv323dHzIwdepwArNq2wdbnYlHMmnJsEj/Bu/wKepe8D+o88TyQCAePAHbi
         fBXrZG8L69V8EVDfFnfH78zzHl34YocA9eaPISYL2eQFRzcCfZYaSLa/0OBdovHWKVoW
         Xo3inNa6Fle/kFRBR4Q+n39yqZ0QLsz80PGT/YKP+cqZUlTMCb1hgbLvGgf7Qw2qAil/
         haeZ4TQELCjdW8NHsnQEufddk8HMPCDNb2siD02vvstiiZJ9LbZwpCCCev7XRn0uOutF
         kKWg==
X-Forwarded-Encrypted: i=1; AJvYcCWLOocSwCFjfJESBKC2xrWxWuZxf5ydcUqqhhtafulLq8Uby2M2jZTU8lY+YyP6gdOui5kBk4k1qo0fuFYehMeP@lists.infradead.org
X-Gm-Message-State: AOJu0YxfwxJ/1PnuiV3Y4ldeukjN1vEn8Fo59ok4axa8A3C1egJGnPA8
	X7GZ81D33mzxZ2yAaEJwR13DS0V4FgaHcJKznvmkazAj27FRHbLgRPvUcGQ8+1Pb43/IWyHv1Vg
	jmIbER9TOFLaKOAOjm7I3riKBkk87mCtekNkptDQRYA==
X-Gm-Gg: ASbGncvolaGDugLGNGKegK06bF33Hgeo3acZT9P0PTZloXkusPqVtGM1kDID8Pl/RKM
	ZzLgUOUVTHSYpMdSHL4Y+SdoSAQw+xUm9tvMap7sIf5iwoyoHXcHYfWIL81q/az09mgBFZv/YWm
	ecItWkyg4rSDbWVzauXKKiFQaL3k+fD3CWDA==
X-Google-Smtp-Source: AGHT+IH1uN9PQBI4TxvQgOMEHLZAQqYAI1FFT1QA2Z54eVoaJJVTZCIulnmyyn43PiYP3CgChRHTn+sbXKdyr+ZK87c=
X-Received: by 2002:a05:6902:2291:b0:e81:8639:c5aa with SMTP id
 3f1490d57ef6-e818639ce67mr1014126276.32.1749046137370; Wed, 04 Jun 2025
 07:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com> <20250410-sets-bxs-4-64-patch-v1-v6-5-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-5-eda620c5865f@imgtec.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Jun 2025 16:08:21 +0200
X-Gm-Features: AX0GCFvzY5vbkEIzVaD80QV5URTGeK5dhN_mN9Qk3_Vhcas3hbWoHL7IT58BST4
Message-ID: <CAPDyKFpKkSb=kGn4y18uFy9uhxFkjt7Gi2bUAzzqGnyUtTAoMg@mail.gmail.com>
Subject: Re: [PATCH v6 05/18] drm/imagination: Add power domain control
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, 
	Darren Etheridge <detheridge@ti.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_070858_562152_54B055F2 
X-CRM114-Status: GOOD (  26.63  )
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

On Thu, 10 Apr 2025 at 12:12, Matt Coster <matt.coster@imgtec.com> wrote:
>
> The first supported GPU only used a single power domain so this was
> automatically handled by the device runtime.
>
> In order to support multiple power domains, they must be enumerated from
> devicetree and linked to both the GPU device and each other to ensure
> correct power sequencing at start time.
>
> For all Imagination Rogue GPUs, power domains are named "a", "b", etc. and
> the sequence A->B->... is always valid for startup with the reverse true
> for shutdown. Note this is not always the *only* valid sequence, but it's
> simple and does not require special-casing for different GPU power
> topologies.
>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Frank Binns <frank.binns@imgtec.com>

Realize that I am a bit late to this, but I was recently pointed to
this commit [1] by Michal.

[...]

> +
> +int pvr_power_domains_init(struct pvr_device *pvr_dev)
> +{
> +       struct device *dev = from_pvr_device(pvr_dev)->dev;
> +
> +       struct device_link **domain_links __free(kfree) = NULL;
> +       struct device **domain_devs __free(kfree) = NULL;
> +       int domain_count;
> +       int link_count;
> +
> +       char dev_name[2] = "a";

It's certainly good to use a name to be future proof, but we should at
least try to pick a somewhat descriptive name for what this PM domain
is used for.

Moreover, this requires a corresponding update to the DT docs.

> +       int err;
> +       int i;
> +
> +       domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
> +                                                 "#power-domain-cells");
> +       if (domain_count < 0)
> +               return domain_count;
> +
> +       if (domain_count <= 1)
> +               return 0;
> +
> +       link_count = domain_count + (domain_count - 1);
> +
> +       domain_devs = kcalloc(domain_count, sizeof(*domain_devs), GFP_KERNEL);
> +       if (!domain_devs)
> +               return -ENOMEM;
> +
> +       domain_links = kcalloc(link_count, sizeof(*domain_links), GFP_KERNEL);
> +       if (!domain_links)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < domain_count; i++) {
> +               struct device *domain_dev;
> +
> +               dev_name[0] = 'a' + i;
> +               domain_dev = dev_pm_domain_attach_by_name(dev, dev_name);
> +               if (IS_ERR_OR_NULL(domain_dev)) {
> +                       err = domain_dev ? PTR_ERR(domain_dev) : -ENODEV;
> +                       goto err_detach;
> +               }
> +
> +               domain_devs[i] = domain_dev;
> +       }
> +
> +       for (i = 0; i < domain_count; i++) {
> +               struct device_link *link;
> +
> +               link = device_link_add(dev, domain_devs[i], DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +               if (!link) {
> +                       err = -ENODEV;
> +                       goto err_unlink;
> +               }
> +
> +               domain_links[i] = link;
> +       }
> +
> +       for (i = domain_count; i < link_count; i++) {
> +               struct device_link *link;
> +
> +               link = device_link_add(domain_devs[i - domain_count + 1],
> +                                      domain_devs[i - domain_count],
> +                                      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +               if (!link) {
> +                       err = -ENODEV;
> +                       goto err_unlink;
> +               }
> +
> +               domain_links[i] = link;
> +       }

Most of the code above (and the error/remove-path) can be considered
as boiler-plate code and can be replaced by using
devm_pm_domain_attach_list() instead.

[...]

Kind regards
Uffe

[1]
https://lore.kernel.org/all/a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com/

