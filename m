Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3257BCDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gb3l7+RmaQj62IRizU/FL/p+5/dRuUnOWMIn3BevCrc=; b=qMQTL5brteKkN5eqkeb9PAAray
	/rEqfxbMQrVmA6+QLPvXTOtVdLO0+ApgCAabpGgoWGOTTFVpl9DaEhBOXrgxW5OJRTd2kRwq+5VZW
	vzZc/qK5A03IDUgVwcEJcNYP4b2loe6znOWPZMHPUXb5pnLh1tZZC1sLAs//EpK5V+Uik/7d5alZb
	qmVPcFWj5B8s5nmkRCslE0yuTf7490uBOiQP3DnJCGxC77CJV1Hsuav4NEj1d2+4AkWi/UPgbPZUX
	Ppwte9FOBUP7bdKGC5+8NkxB0D/hbIVKg6qaxfcqwSs9AbLH6JF9lJAzs/1XGE1fVJG7DBVYDkB8H
	7ltHFxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKSL-00000007Ynk-18PV;
	Wed, 24 Jun 2026 10:03:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKSI-00000007YnP-19gF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 10:03:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c6bb8a5980so4215145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782295417; x=1782900217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gb3l7+RmaQj62IRizU/FL/p+5/dRuUnOWMIn3BevCrc=;
        b=aXM9vO9py3/4HAY5DDFOQEaUuWDrjI/07fs3nC+9x8mpMgrrrb5FakidEVVPqSSPDy
         tb7bmWRPmZHVdA9PtXJE3qBdjAEW03jS3RlmD4sWvmYUcGhI/kfcZ+UbTWdknvB3XXf5
         tmNrN8+nOLY5lnDGX6LsK6Rckx6CVlAuo4DC2nKuamFjzj82UBk1jeHjZcVD2Y9MUUX0
         EaBx73y4u2nMZ2bBErxgVvcN3IAELMnpBl5/lmSBmkX6pHEL3OD2tVTHCZEDgHO3Wkll
         PdosGpciub/9s+4lx8J2W9CkfCJHDFyuOG42Nwg2jewVpI1QD7DkkrUnynl7PG2lyD0A
         /eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782295417; x=1782900217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb3l7+RmaQj62IRizU/FL/p+5/dRuUnOWMIn3BevCrc=;
        b=ISRNAXw/15Y+xtxutEfxA69q/sCC/STy5I43099MIgmEeF+jIHovenCDFLzNGQpxp4
         UxaX1/xIGYro3Fp3toXR3pGU7tmH590EysQV23+x7Ooxby71/6In+EnIu+pH6hNmQloL
         JidoFwkmUYkxxO40V7zkTmILsFslzf5uoljm+Lsg9IVW6IN90IoJ+nKCezjJJ7ZYlUb/
         6ephZEuBtna1lzHdyBr6osYzCkGzsVRo9elqssIv+Xz4cQgqXsRybVBp+In0OUaFpIK4
         l/yWpJB3cCTlBtEjMPDkYv3IMS44G6fkWZDW+IlkRZmGwwuGhuwP19wumL/i3WpvuNS3
         Gq0A==
X-Forwarded-Encrypted: i=1; AHgh+RpORc0b428uePRE4wpkGe6aYoGWSRBHIRq4b1wEoEFNZsKMzNDGCmxRevuMJbF+4RF06tJYqLRu6Op1WTWJXrYA@lists.infradead.org
X-Gm-Message-State: AOJu0YzPeItBxa3B00p6st1AwuEkGdSQXPDl/+DEeXm+g69mE6c1zT5/
	nCbwObrEiUlb1gf1WUArkzS91kX4SWhKsGwRkTkcGiGMYJyOtJtZqdS0
X-Gm-Gg: AfdE7ckaoeZvfuRj4muf37NJf+6B6r5YM8/G3gW8MXDpe6Ai37/w509M0k2I46NfYtM
	ioz5rZXpQpPqpl1KloSkUdNYctVLvjYIrHBm/hsAEcWO/qcpXISOoUY92XnLyj4rR8xNUQBPc81
	+ARUJjiqwO3gJ83mcvVQk5H9rQvhZ6n0jZZhTyiGD75+OaExxM5wyPybr0qfE3cxuuOkzvN5sRZ
	IfcWvmCFT5XfydqAZiJBmYabR5ruGwu3IYcOTVSs1BPqxMein09y5iXyMM3Jx7x9g2eamogqdao
	bcgkKETZLswOMsd2xNR6u4tLiHoy8peMC+6BSIjjSM9phStQ+OgjjMmYK/OkEfdxWAa+l9qn6dg
	aqGIRyDm8DJxfBwgrlFcyDoN3DiRwP1hoZtWhtPqznW2dq5n/7rHouwH89HgrHQouEQRlY/N3qo
	7h2XJtbNb04S5EnAzkO4IxDLbwXTdJaD9IPnpulitOpEW2XmGAxk3fOpfCIK8i+k8TAVxsLKcZ8
	L2SJJUX/JecnDidb0ftrfWEywuXQQ==
X-Received: by 2002:a17:903:228b:b0:2c7:ef3b:e17f with SMTP id d9443c01a7336-2c7ef3bed39mr3258385ad.36.1782295416767;
        Wed, 24 Jun 2026 03:03:36 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([115.246.20.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe785sm126061495ad.66.2026.06.24.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 03:03:35 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: victor.liu@nxp.com,
	marex@nabladev.com,
	daniel.baluta@nxp.com,
	Frank.Li@nxp.com,
	shawnguo@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [RFC] drm/imx: upstream direction for i.MX95 display support
Date: Wed, 24 Jun 2026 15:33:18 +0530
Message-ID: <20260624100326.413699-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_030338_364807_03161007 
X-CRM114-Status: GOOD (  14.05  )
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

Hi all,

This is an RFC to settle the i.MX95 display architecture before any code is
(re)posted. It is a question, not a submission.

It follows Marek's earlier [1] and Liu Ying's reply there proposing a separate 
i.MX95 driver plus a shared helper library rather than extending the existing 
i.MX8QXP DC driver (drivers/gpu/drm/imx/dc/). That question was never resolved, 
and it gates any serious submission.

The implementation I evaluated is based on the existing NXP downstream 
dpu95 driver. My work has focused on bringing it up on current
mainline, DT integration, FRDM enablement and validation rather than
developing a new driver. I am not proposing to repost that driver as-is;
I would rather settle the architecture first.

The current dc/ implementation is a multi-device component driver with one
platform_driver per block bound via the component framework. The downstream
i.MX95 driver is a single monolithic platform_driver mapping all blocks from
one register base. Unifying appears to require reconciling two bind models,
rather than only adding match_data.

DomainBlend is i.MX95-only and sits on the atomic CRTC path, with no
i.MX8QXP analogue.

The block decomposition also differs: i.MX95 has
dither/hscaler/vscaler/fetcheco/fetchyuv/domainblend, while i.MX8QXP uses
fetchwarp.

There is also anticipated divergence which is not yet upstream (i.MX8QXP
prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX95 blit
engine), although mainline dc/ is KMS-only today.

A single parametrised driver may still be possible, but these
differences led me to revisit the question before preparing a series.

The ported stack is functional on an i.MX95 15x15 FRDM with an IT6263
LVDS-to-HDMI bridge on LVDS channel 1. The DPU probes successfully,
EDID is read through the bridge, and modesetting works at
1280x720@60 and 1920x1080@60. Weston and sway both run correctly.
Tested pipeline DPU -> pixel-interleaver -> pixel-link -> LDB -> 
LVDS PHY -> IT6263 -> HDMI, using JEIDA-24 mapping. DSI is not covered.

One question for Liu Ying is whether the separate-driver plus shared
helper-library approach is still the preferred direction, and where the
helper boundary would be drawn (which blocks/ops are shared versus
implemented per driver).

If that approach is still preferred, I would be interested in working on
the helper-library extraction. Before spending time on it, I would like
to understand whether it matches the intended upstream direction or
whether similar work is already planned.

Likewise, it would be useful to understand whether extending dc/ is still
considered preferable, and how the component and monolithic driver models
would be reconciled given the differences described above.

Thanks,
Piyush Patle

References
[1]  https://lore.kernel.org/dri-devel/20251011170213.128907-1-marek.vasut@mailbox.org/

