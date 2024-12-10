Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE73E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nf1alUKYDHbJzrOQtPD7/2cDvoI+WL/sLXAyfBpVNbU=; b=u/KSaq/38OgUYqNUtlychAYm1g
	wb5Jc9ONmanlEsujylzPmcSGSKBztmG5AB0MNVidJ+xK75UWmkO2Fz6QtAj22nzDGzq2OpKdH3GcD
	14pKFeDVGCcaE2vlzhV9w1dUSwUhzUc5t4bc1aBhoYB8B5dK6jSkN/d7ksRBsdG06yJxZCI7jgqw7
	PHMDhX8jsueqr5wg7a1yjVUeNGpzXBvd92Glxvvl5c6v/AH33G9rQF+ybdrlK47jqUHQQqpWtgKwH
	cXpemdmC7Kf1/G2ONs2lPjWZ+EaVCP6F/A84vdTIGoBR/EC74Tfwz9VfWIzMjiN7Eg8C57B7jbY8u
	jKH7Lj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0sv-0000000BgPH-4AhU;
	Tue, 10 Dec 2024 14:06:45 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0oy-0000000BfTm-3p2j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:02:42 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so5236901276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733839360; x=1734444160; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nf1alUKYDHbJzrOQtPD7/2cDvoI+WL/sLXAyfBpVNbU=;
        b=vvI/rX+zdUg7T2yhjsklCwM3NdWoCqcvs0B8msdwDYATkgKF1x7ckqBPQ44BuqEXFJ
         G5XdApXoOlV6vMwOk01+GUXrASFVb/4p1FQ1Usz1SFKT0EuUho/kAAMopqgDgHKFB1y4
         tNJqkas1QQihroUTRnVnNjMyoJfRWhG+tlDOqtkR+m6dsl+l/CVriayVvCfxX3dMWFeS
         DyO2NCmF/fjFkiZ/i6WtvTdlqjZmFvN6OqS0kr4k5hqE+UvbBxTSNcmlNOO2phS0ihgO
         SDJXyNGPsrdiAX+3NZKCdSQv5of+qFFExnQwT0yXGcD/SIY12LjLtnsaVcWQCPN8HFyi
         CAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839360; x=1734444160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nf1alUKYDHbJzrOQtPD7/2cDvoI+WL/sLXAyfBpVNbU=;
        b=uAvYHMpXO/iCN3aFmBszwEMTnAVmEfOSm0VlqeSR7bXKIlWjXnE0/EBjdF+lLiSozd
         Oqx49DtNJ+5qHkNtcWegehqoMCpG1Vr591IdNpSSV85h+gAqsAP7wMFaQ/H0pV9C8aS9
         GL9/9akCJaHQpCpXbTelKJI+Ehfo4zvXHY8VkPDUfgAPNnb2oIfL9hVKqcj9b4tid7sj
         3rBspYneVcpyMqCQMMOKqg+lxmiAJEcezdA2om4q0430rebN5zTdek1fW6erRnCsECsU
         7nzQrU7Wx3T7aqCzfFJBmfThQo6h+KPkUZ+5KdlTJMOAN8ClW1aZSKigmspb12mAC7hI
         C/oA==
X-Forwarded-Encrypted: i=1; AJvYcCUy5WLplQB5XbO5nK91xhEhAdAbq8px7wz5127nFH5POV/wYPoOP2xu0N2YuEq/u8/emGRsX+/GCzez7nF6Y+OU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6caUiiJ76tSo4QHMbjtPBuKwniHl2A8b26NUhTosQaDZwgQu4
	L6f/RuiAGXNhuNOq+jv+16MAYRFD64enFTHtz08SFzlQcHBHpp6OWdcZ6CZHgNo9CUJ7VEXt9u9
	TvtChMIbBdEMa28cOsjGfcdhx4vsPAtuF6OjUXA==
X-Gm-Gg: ASbGncsKU4RRMUa4p3IvkTwv5rl3vIG6/2JdmK47xV4JaUHlXheVodX7TQhrGYr9bJ1
	Rb24OONt3VhA2Wyjsd4QbkRTqYTBf5xepdbyf
X-Google-Smtp-Source: AGHT+IHLRbGi59lCkKe21fHCD52MhJo63vY1GxLN7FsYIjyR+ox+8Qq2xjQAj0m60a2wLlxdHI5Bsw1heijOTMpYZdc=
X-Received: by 2002:a05:6902:1ac3:b0:e38:dfe:3c88 with SMTP id
 3f1490d57ef6-e3a0b0bd7cfmr16666843276.12.1733839360151; Tue, 10 Dec 2024
 06:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
In-Reply-To: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 15:02:04 +0100
Message-ID: <CAPDyKFo9N8M73Z6Ltsbnd-WR-jYAqBedAHndViSD7YaKKYgBsA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] pmdomain: ti_sci: collect and send low-power mode constraints
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-pm@vger.kernel.org, Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
	Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_060240_950859_33253C29 
X-CRM114-Status: GOOD (  26.07  )
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

On Fri, 6 Dec 2024 at 23:13, Kevin Hilman <khilman@baylibre.com> wrote:
>
> The latest (10.x) version of the firmware for the PM co-processor (aka
> device manager, or DM) adds support for a "managed" mode, where the DM
> firmware will select the specific low power state which is entered
> when Linux requests a system-wide suspend.
>
> In this mode, the DM will always attempt the deepest low-power state
> available for the SoC.
>
> However, Linux (or OSes running on other cores) may want to constrain
> the DM for certain use cases.  For example, the deepest state may have
> a wakeup/resume latency that is too long for certain use cases.  Or,
> some wakeup-capable devices may potentially be powered off in deep
> low-power states, but if one of those devices is enabled as a wakeup
> source, it should not be powered off.
>
> These kinds of constraints are are already known in Linux by the use
> of existing APIs such as per-device PM QoS and device wakeup APIs, but
> now we need to communicate these constraints to the DM.
>
> For TI SoCs with TI SCI support, all DM-managed devices will be
> connected to a TI SCI PM domain.  So the goal of this series is to use
> the PM domain driver for TI SCI devices to collect constraints, and
> communicate them to the DM via the new TI SCI APIs.
>
> This is all managed by TI SCI PM domain code.  No new APIs are needed
> by Linux drivers.  Any device that is managed by TI SCI will be
> checked for QoS constraints or wakeup capability and the constraints
> will be collected and sent to the DM.
>
> This series depends on the support for the new TI SCI APIs (v10) and
> was also tested with this series to update 8250_omap serial support
> for AM62x[2].
>
> [1] https://lore.kernel.org/all/20240801195422.2296347-1-msp@baylibre.com
> [2] https://lore.kernel.org/all/20240807141227.1093006-1-msp@baylibre.com/
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> Changes in v6:
> - fix build warning on arm32 when building with W=1 and CONFIG_PM_SLEEP=n
> - rebase onto v6.13-rc1
> - fix latency units: convert usecs (PM QoS) to msecs (TI SCI)
> - all dependencies are now merged in v6.13-rc1
> - Link to v5: https://lore.kernel.org/r/20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com

v6 applied for next and by amending patch1 to deal with the sorting of
include files, thanks!

[...]

Kind regards
Uffe

