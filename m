Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B097C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7GNe6eTp1G3kA/XZ7DDz3a0izOI2+yKzXoWm6MVVII=; b=DnQPnIk1AoOpdBKxp3c1jMPlDu
	lJY70SqZjZevcl99ljgZNW5zZV+gYThhFXCigGc1xAMglY2Vy71Lm81n1vPUeuKKx1Kl2E5rknCLE
	IRRvlJzjb3VwNx6Y+z6yBgcF5Mj1qZo8/dSvid/MxZHoTmPwi6AjpVF5xkpnaEpZvjRtT8aytT2j6
	P7htDByfW4PnnOuF1SWQr9IyrOzR1EylpcpnhqTIS3divwZBqxVkRH+vLXzARlRADYnn3JXIQNo2B
	6PqM8f3EICBRRh77YvLf7EPgPpxFgf2pUxlMiMoGBxh9Qw8UhlTUbZve1hl754F3UjTVwuReGYkmK
	kvLKYxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zzN-0000000BkqO-1fF0;
	Wed, 30 Apr 2025 05:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zqS-0000000Bjb2-2dUc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 05:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i7GNe6eTp1G3kA/XZ7DDz3a0izOI2+yKzXoWm6MVVII=; b=b3VYrz2RGqGmjoi04SJ4Go2wK9
	Yk5/aqdwm8umB5MSEGAdRP7T455bQkmGrDgFXB4QfXLeL3/JX8uWU1CBW/ttBRjxcMAKdMpk7cAQp
	5S75HrKDSeX4IjT5KSe8YGKcQiTefdCQSgQrk3NmGE/AF5NUTG2umBBjaCiBTOr3yL9ZTfkIx2kVc
	zv/SpUmtMF+Jigk5g2Nc9dfF/PVl0ZYdXoRy7NkoANml+cu3K79aJdbsjtYfNjRpAyZON9gFJzIWF
	F0wmgOxJsDSYMW76suzKeTU2/1e9NN2005tIdpGSzzZYXt+TMSnFfoBX8gLMdxFpOiMajPCMqOTop
	n3Y3jIRg==;
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9zqC-0000000Dh12-1kn6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:18:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B13A1026CE8F;
	Wed, 30 Apr 2025 07:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1745990314; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=i7GNe6eTp1G3kA/XZ7DDz3a0izOI2+yKzXoWm6MVVII=;
	b=iKrlXY/CC6b5WKwE1KSIci0SwjkQsWLc7FVimqDo3qMWSMR2FV/PIYhF0pbkU6YMB0R88s
	DNrRtMpdI4M+lp+J44tQNiPhhOpBOpnv4JJoJqWBR4Syk6AmXh1Q2DLt2kPGoW+gD9zqUv
	oA4S9VMcnJEz2E7afRnBMbx1u6QUi7e3V5GcEqg7H7kIEV3BRVMmNCKSExH3JHNe0qmG2L
	wa6mrt0Yl3S1IzQRqiLaZDMRAS6ptAI3i7YRmxN3DMUddB/T8uQIypgV98BT2gDhUaAif3
	xjyKsdYZqRzHWIw7c9+3iILDM3h8YkwmnIfj5ehS5lie6kRc4SdjGcBLWCos2A==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>
Subject: [net-next v9 5/7] ARM: mxs_defconfig: Enable CONFIG_NFS_FSCACHE
Date: Wed, 30 Apr 2025 07:17:54 +0200
Message-Id: <20250430051756.574067-6-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430051756.574067-1-lukma@denx.de>
References: <20250430051756.574067-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_061840_706902_93F75A5E 
X-CRM114-Status: UNSURE (   9.89  )
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

It is not possible to enable by user the CONFIG_NETFS_SUPPORT anymore and
hence it depends on CONFIG_NFS_FSCACHE being enabled.

This patch fixes potential performance regression for NFS on the mxs
devices.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Suggested-by: Stefan Wahren <wahrenst@gmx.net>

---
Changes for v6:
- New patch

Changes for v7:
- None

Changes for v8:
- None

Changes for v9:
- None
---
 arch/arm/configs/mxs_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index c76d66135abb..22f7639f61fe 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -138,8 +138,6 @@ CONFIG_PWM_MXS=y
 CONFIG_NVMEM_MXS_OCOTP=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
-CONFIG_NETFS_SUPPORT=m
-CONFIG_FSCACHE=y
 CONFIG_FSCACHE_STATS=y
 CONFIG_CACHEFILES=m
 CONFIG_VFAT_FS=y
@@ -155,6 +153,7 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
+CONFIG_NFS_FSCACHE=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
-- 
2.39.5


