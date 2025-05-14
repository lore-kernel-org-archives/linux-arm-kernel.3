Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B4C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVHT2CwJMINyqZxJSS/NSEazmIMrB6XmSZf54ZuDVGE=; b=TvAEBqU1hlU98no9UzjGcvL0U6
	yt+qvgAJoX0p4IrOZmsIytHUiJrWPQY+xYZb1aRlxzilO4M6rrqwda/SwL7xrV89ObSM+MCTmtRq9
	oChSAPwxdnlQvCVvu/bKKcayKJp71NFK1tDCLDg3iP9D56PliinRhu4zsyW0I456PkZK7gxgcoYZt
	VwwoLN6/j0PturUjTb9jpbjV98C9ERIaZFgJAgDpFtwYnaTYkK4Ie3v5QqLWffxt6ZDGYsopK3O2J
	msp9V/TMEpG6QUGRU+8BhRb5IdP93PH2SPPK9TgK4v+t5qhrsa8YdvYiZAk3mDhKtm7NY03qdL/EL
	VnTfQhLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEHQ-0000000FdCr-0QVh;
	Wed, 14 May 2025 15:44:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDiS-0000000FWZ9-166u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2E744A841;
	Wed, 14 May 2025 15:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DACAC4CEE9;
	Wed, 14 May 2025 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235295;
	bh=eoORac1gBP0K24jAQNXvarZwHndAx8L/gcj9v3uvkaE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gtmGolZzqjU/IW/AW8Fo0tSG9niKnfJv/4iEDRupVvGE2fi1Jf7/B4+wfpehDhZqY
	 37EjgzJEIAp1KAXH3cBoaOQlgKe1wCxiayDTft+4lnwMB3A0hVie2UEybV9QbTmhBB
	 DhMFcVmtk9qWHYh04tG7wxdvYbLX5vtbUOU1+LJCBgsHxkhCPxBI9yYmvJ1PPXToXD
	 GWW/lFUMcfzWOgVoP0I/Gje5cTMPdFY0Ldbe9t4WZa1MDM24YveCrkFVAVc7PwPAFf
	 Z+2btScigTXgXV1PpG4b8MHctVfXvbFfJ++r/W0ery9PLDmXNmR+TsWtWEiC0Qw5re
	 6bnjqdNJ3kvGw==
Message-ID: <9c56a24fed529c79f5946f7ddf743b98@kernel.org>
Date: Wed, 14 May 2025 15:08:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 03/11] drm: sun4i: de2/de3: add generic blender
 register reference function
In-Reply-To: <20250511104042.24249-4-ryan@testtoast.com>
References: <20250511104042.24249-4-ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Hironori KIKUCHI" <kikuchan98@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Philippe Simons" <simons.philippe@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080816_322831_B307EA28 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
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

On Sun, 11 May 2025 22:31:12 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

