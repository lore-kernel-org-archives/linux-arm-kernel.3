Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A764DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+KXEI6OfVHvtP8Yf5k0bZWTlMoRiewsHyens3ukaaA=; b=LvOB4985KRuhgHPbAaX/Gf+xvN
	4Wk0namBdtBwV8DqSVfEcuYzhdih6Vh3m6LplshOKOu5EoVcQhZk9DzFTEsdhnj+VsjLN/+7Hw97l
	tEbfh4EHeHMuF+w//ryF+TeVoO4EzMRFO7ZH6WxkQ13nj0Nv2YvugusABQyWdfruqP5C1nM0KK3dE
	hHSn3nBHrQuqf0Fv9BZl8JRECVSnS4sw3yIc9x+VeaVEViSZBULaKSukC8NfEc3oeHBRgJH8HDS45
	CBpr7f0WfB3Xt249Zo5tIeT0tYlf4ii+BYpYn9JtXZP343pRzPHsMFpHgndghFLNPPROMUBSyM1hG
	fkxEB4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nub-00000009sts-0M5W;
	Thu, 10 Apr 2025 09:09:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nU3-00000009mog-335J;
	Thu, 10 Apr 2025 08:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=y+KXEI6OfVHvtP8Yf5k0bZWTlMoRiewsHyens3ukaaA=; b=X3SXzwhrZNjCMiHFIVo/6tYZp2
	J9Eq9+lx5Iy15hkVHSiZzPGG8gDoF/5kc2JgDA3EhmWLY7J4YdoUO97e6h7hNEYqCsIapXpkfBw9U
	Rod8dzIGU5gOE3nSNsgv+X3UkuviVRMtKUt5F3XRnqekucRmVJEW3wqb3lAejccWSxN4C8Z3xOMEn
	P8gNxyGsRd0MKYxVbHLXwtKipGXMxhoNRtJGpMHJ04zu99U3PQGz/RF9g91c3ZvRY6VCmSLtK4PRe
	/dDFXtWqlZShpL+/vApuPsisnRin9YMtDGM5JjbP9jpZJfxjUMC5KdXHa9wH8KqfJHMBSWG2xSluP
	WgEgkf5Q==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nTv-0002qP-DJ; Thu, 10 Apr 2025 10:41:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: Re: (subset) [PATCH 1/2] drm/rockchip: vop: remove redundant condition check
Date: Thu, 10 Apr 2025 10:41:43 +0200
Message-ID: <174427445693.820310.13302074233531246812.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207182247.215537-1-l.stach@pengutronix.de>
References: <20250207182247.215537-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_014203_760555_F39E650A 
X-CRM114-Status: UNSURE (   8.97  )
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


On Fri, 07 Feb 2025 19:22:46 +0100, Lucas Stach wrote:
> Instead of checking the same thing twice in a row, fold the second
> condition into the first clause.
> 
> 

Applied, thanks!

[1/2] drm/rockchip: vop: remove redundant condition check
      commit: bcdc354a0a545e0e78c6f068e5a11c0285e06eeb


Andy suggested a name change for a function in patch2.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

