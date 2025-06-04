Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5956C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8AKCIoAa/d1XSYeACl75HYH/kq79WoVL90DxYrmfW4=; b=Zq9IQw38SKVNSQilFEVZb/eF15
	wcwQ5S7lwCWjrcGiXeHvzEnUskVOtNUoKuSI018bsoXt/tegtatle6hV0+9pChGpVqjzJXbHR+1tT
	vC4iZth4RHQVKMug65E3kP2BoYW+DCR7SGlLKtUJ7uwE5wtOSND+nKxmrHyhhUjhLo+WtUhwt9gab
	BEVWrY3JM4eYZ+vJ4yafTlrl+rncgR2mRwyUCWkYHhiihjfqwAe252EGeJLI23hLyXSHyUkjY2e65
	QYtCPJFS3z8Pd/lV9GgKQ1oYczE+s9ppyYvZCGrbydyzskiNP81G+uWLau44Iap1A7sgHQOjaSVPX
	XnVlak4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqt0-0000000Dmfr-2D5c;
	Wed, 04 Jun 2025 16:22:42 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqp8-0000000DmLB-3Inr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 16:18:44 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4a5851764e1so14789441cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1749053921; x=1749658721; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P8AKCIoAa/d1XSYeACl75HYH/kq79WoVL90DxYrmfW4=;
        b=ILw51NnBQPDRgMFwQgifO74eiES0QNaB6urUVMTscF8RH1qfsA400O3WWpk5Lv0b7R
         AAFh+iYNJ+Ydw8tLxNAN3/irLOazRV8kqSk/5vH8SF5jmw/rD5Z6UbiGQ01/TziSfZbB
         gq7BOFERbm+s4xZrpwNMjWbZMzVA7WrPjgkId5f3/JEFOGHmjrQaUCTu3sd8vWPJNdXT
         F833Gkn09V9bmWgiRPX2O4i0U+zHYmEaJNlGae+K0VgUmQrPDuDN5HFim7SX7p88dXI1
         NIDWAcwuDBQRDZ345F9awnwY17w8Rm/gUQ7aqKU0kFCB6bzcEimuAsNdhhMHsC4o1z2C
         GqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749053921; x=1749658721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8AKCIoAa/d1XSYeACl75HYH/kq79WoVL90DxYrmfW4=;
        b=PeoJl+5v31pigcAioxf08vSsJjCBqO91LuZf56vZbrbVi8ZMKWXhHW+zToonFnQvvJ
         f+9OnnrEoOe2mZIVowjLCQapcxUzX/EYuwxfTk4T4BOqPc1DBZd+79zwcfya0PoKKSfX
         qRHWDxmQo+A+baFjKO0gqJmUwyBQY31roeKaXk68thIEndAgr2rWbsWVBumdpcBxEZDJ
         C541dOC8HXrztV7WsCjMcfoZQZcLryM/ogndb5wG7Rgbf4nouO8Cf1OT/MWxalJ4NzzQ
         kkmaY5wZyha/LmY9oZ8T1LjiZBMGtJw9kRSdcgMvOd6/tisjqGH+fdKKq3wqdgYUBdDG
         YS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv4ZDohREchd1nvuO3Q91Skh+Hx+GZtm26qoo847U8AqUQNUGjnEONcc+n7r/N+6q6Q8NwMkiHPCB3XMjggTS6@lists.infradead.org
X-Gm-Message-State: AOJu0YwKKsnYSa40Ku7C5guABI4pgKtLXFzpdcG29714o/NR395oXAOH
	K8MEM1hlVMLdxM4o4zbT4j9crQkYQZcv/AJkwmVzP26PAakRpSSecUjB2GVdIfV2oK6gnT8A9Tj
	My65NJT+06LQk6nNrdwCiQxq+MWJZfoK7CCbJpreybg==
X-Gm-Gg: ASbGncs9ejm40OT+0kZRqLFeYAsd4vCBkM4XL7tXmIkDS+Aryg3x0M/uB+1gPKP3Ovy
	eSAnOpR7m2hTSqmrqbq4amXhLTwxJkbr3xz6n1O7Jhm6ILc8zHzXUMFRGnUvnRAgU9qlXvmwFvu
	QTJJdZRvVRqE7a0NZG+DM+hEeZ5eWJcSIxrPDucCGcMdv/NBr/iqcepvXo/K3oteXGLVXzdQ+Cw
	W79rw==
X-Google-Smtp-Source: AGHT+IHKumrpYp7KXj3Oppwg97YrZ8QLTUdlX7sch68BDDJcICEIYXc2OCGtCAc7AHX04x4oGqNiMhls5e1iB1AyII0=
X-Received: by 2002:a05:622a:4d44:b0:48b:4f9b:fcfc with SMTP id
 d75a77b69052e-4a5a57559e0mr54446431cf.22.1749053921456; Wed, 04 Jun 2025
 09:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net> <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 4 Jun 2025 17:18:29 +0100
X-Gm-Features: AX0GCFspq72tjQe2nH9NHC6pMzIvIPvg3yffH3OtDe0wEz2aVsnXcTNMk1xSlik
Message-ID: <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_091842_826186_3238AA14 
X-CRM114-Status: GOOD (  21.50  )
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

Hi Tomeu,
I have some bad news ...

On Wed, 4 Jun 2025 at 08:57, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +       [...]
> +
> +       /* This will map the pages to the IOMMU linked to core 0 */
> +       sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
> +       if (IS_ERR(sgt)) {
> +               ret = PTR_ERR(sgt);
> +               goto err;
> +       }
> +
> +       /* Map the pages to the IOMMUs linked to the other cores, so all cores can access this BO */

So, uh, this is not great.

We only have a single IOMMU context (well, one per core, but one
effective VMA) for the whole device. Every BO that gets created, gets
mapped into the IOMMU until it's been destroyed. Given that there is
no client isolation and no CS validation, that means that every client
has RW access to every BO created by any other client, for the
lifetime of that BO.

I really don't think that this is tractable, given that anyone with
access to the device can exfiltrate anything that anyone else has
provided to the device.

I also don't think that CS validation is tractable tbh.

So I guess that leaves us with the third option: enforcing context
separation within the kernel driver.

The least preferable option I can think of is that rkt sets up and
tears down MMU mappings for each job, according to the BO list
provided for it. This seems like way too much overhead - especially
with RK IOMMU ops having been slow enough within DRM that we expended
a lot of effort in Weston doing caching of DRM BOs to avoid doing this
unless completely necessary. It also seems risky wrt allocating memory
in drm_sched paths to ensure forward progress.

Slightly more preferable than this would be that rkt kept a
per-context list of BOs and their VA mappings, and when switching
between different contexts, would tear down all MMU mappings from the
old context and set up mappings from the new. But this has the same
issues with drm_sched.

The most preferable option from where I sit is that we could have an
explicit notion of driver-managed IOMMU contexts, such that rkt could
prepare the IOMMU for each context, and then switching contexts at
job-run time would be a matter of changing the root DTE pointer and
issuing a flush. But I don't see that anywhere in the user-facing
IOMMU API, and I'm sure Robin (CCed) will be along shortly to explain
why it's not possible ...

Either way, I wonder if we have fully per-context mappings, userspace
should not manage IOVAs in the VM_BIND style common to newer drivers,
rather than relying on the kernel to do VA allocation and inform
userspace of them?

I'm really sorry this has come so late in the game.

Cheers,
Daniel

