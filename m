Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354EBC624A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 22:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5G8JRjlxGCNVPL20NU83Vmnd/Rd61iQlcigmotfGCwc=; b=nvhf/MNCOYF+HAm0Ag/qK2+H0g
	yaOX3D62XJDu99N1klPpUwJM05vs8ptrqDs5nWiNE6k9hTDc1mqFA148H4oyqApvGQzY1VKF8SWZi
	um7ZWjZxr4IbmyRHeaOBpzwU7uDfVHVAnSlA39JPE3Aom1w0jN3XE+xnh6rU5ONU6tverJK80ESeI
	BtOLMSN79qyOfeLnmY+56Phdvt2Sz+RvT4SnWfNWhq9u5OaTGTT15uk/3t/QOnHqa8Zs0NvwiXL4A
	vEA+tzwWyrQiuLD6HnB2gjhwLutR9tpIottM+0j5pPGxRQ90L8EBfZxb/n0eeGD5k0LQzlp7+AgzU
	OjRx2Sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtvIk-0000000GLPI-16r2;
	Sat, 21 Feb 2026 22:18:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtvIh-0000000GLOw-0WDb;
	Sat, 21 Feb 2026 22:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5G8JRjlxGCNVPL20NU83Vmnd/Rd61iQlcigmotfGCwc=; b=b+rmIAzOZjJYW0fhqCHdeknoHm
	NR8sefHy6NWRf8AJ9dNhp3Wl6Pv1sXllbPAhxNZqV45idrcA717eyxxf4hwbdykzR9NP/192Y6CzG
	SKaMSW6MTNMTzAiV/KxR2R/hvvS2BfAbYoL43BgJgDgG+Aa2mTxX4Kb2sHKOvyzrdBUzSThiMF5/o
	587tOcqNS4ejmT6jnMeGmlZiRoSH9LDN6KpFvjrEnIxpzbeY8YMbevX+KX31L/c+6u0/BhgmmTWsv
	r2kVajQAe6r00V//xE6hndmZ8mHc0iYNQPNyFSlKvqxleMvTVHn9ZgLPih7vMU3CgcRekJS6Rqr6+
	fU8p518g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/rockchip: vop2: Use drm_err_ratelimited() for wait timeouts
Date: Sat, 21 Feb 2026 23:17:57 +0100
Message-ID: <177171224753.1745786.18151725646832759281.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260209161621.6136-1-hungen3108@gmail.com>
References: <20260209161621.6136-1-hungen3108@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_141811_324609_958BE209 
X-CRM114-Status: UNSURE (   7.54  )
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


On Tue, 10 Feb 2026 00:16:21 +0800, Hsieh Hung-En wrote:
> Replace deprecated DRM_DEV_ERROR() with drm_err_ratelimited() in the VOP2
> register wait timeout paths to align with current DRM logging helpers and
> avoid flooding the kernel log when timeouts repeat.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Use drm_err_ratelimited() for wait timeouts
      commit: f33a0a7f902d0715c1c09d7a128b1c94c09fcfc1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

