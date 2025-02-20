Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B3CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pAp6aTU3MDvbZXbMddmb4brUtJ96X0DNMEe6D505W3o=; b=SBd8dHDX7Ntu2Eg1E/P/aq3Lko
	Dxh21FOnPKXo5Edfb9uehVAro1W6K69QWRP8M7xgvQ8dTwPcWAYCn0oIGeFRbS9DDv6YRKTmKSAIe
	zxuox3zlLZbeb0oeerCjMxIS8HSUmYeFEoqAwn/odVX3UV+ylZDm8QKFKISXlGFuer4ZYqUTEh8ZF
	4pwc694Z33hDGoI3yo03gszN6tAQx21rJ9vRKhxk7+RsDc7Hn6lg7/QCESJeUl7XeB+TfcnqhqgkV
	8+aahqtCdWE0/FpZQOJfJIxfdLvjokJ1ydAD5aROzzIrBOKxUVYDcCrl4zT2q+BVgVrupF0L8cQpZ
	8UYbj+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGEF-00000003NV3-1f8P;
	Thu, 20 Feb 2025 23:45:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGBH-00000003MjX-47bS;
	Thu, 20 Feb 2025 23:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pAp6aTU3MDvbZXbMddmb4brUtJ96X0DNMEe6D505W3o=; b=zCqaZdRKtbRWquJ7RUr0725Q8Z
	I/iBTPCptWUcH5wEXytEHhz2afiedCNckgIwT9zaXryJoyr6p5yqlkSKt6t7ZaPjLao9BP51innAv
	KfCeUfpKW77sGdUEAkra71ijEsmWnLUeMtbDOBZGIKDHokiS4v9zSuTaGwly0JC2Z71j8wk8wPXTN
	Ov/jv/6j1h6jje4W6XGmZnoXwgI/oSXjaziHOAs1o03piA/GsPqRHhhEqHU3TN43AUEF/ZPDpSWt6
	KwojoeoLXNvEVPucII/ufJtPBqkD41ArbWRd7O4ovDSm4+oRpbay9AIX/1QBwsCuPJfCfv2dIF0Hk
	ktE/4Vlw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlGAx-0004Wc-Q9; Fri, 21 Feb 2025 00:41:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: gregkh@linuxfoundation.org,
	heiko@sntech.de
Cc: rafael@kernel.org,
	dakr@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de
Subject: [PATCH 0/2] Fix the shutdown callback of a drm component device
Date: Fri, 21 Feb 2025 00:41:39 +0100
Message-ID: <20250220234141.2788785-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_154212_010778_61D1B5C5 
X-CRM114-Status: UNSURE (   9.95  )
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

Probe deferral can cause the platform-data we access to be freed already
causing ugly splats on system shutdown.

Fix this via a small component-helper and adapting the rockchip-drm
shutdown handler.

Heiko Stuebner (2):
  drivers: base: component: add function to query the bound status
  drm/rockchip: Fix shutdown when no drm-device is set up

 drivers/base/component.c                    | 14 ++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  6 ++++--
 include/linux/component.h                   |  4 +++-
 3 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.47.2


