Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3DFC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v/+gO/eDzqiwoj1Zge9Nk2I670NLxBB25O6xAQ9lBnE=; b=FrCUAhOGpukqLBlzRaJshYiwZu
	p1MnpdnocmmvzzFgeUjYAWZF09052H7pz/B/mSHDKNZR5VzRYTRdYh1CTqEM0bdCtS7XJPqgK0Ilv
	myYvJw+eM9BhU8bWu5p8b/THAQMMhNaEiHnvaAgmAfEK+4PkZpximFzYH89FWhKAfhEf93fO2xY51
	ldNpehG6v0RCZkZLJpOm7RN33UrsovOV5TRDC6nMpKH3P+0Ges3DDvcUq9/5+TsjeBSDDG7DQZPTU
	grHm5Z87o1YojkwdFCNyZdFPLckD9dK4F1DRqM2ixxiG94Lxg1dmSzsUKVGZcgetLz8NHuCN+njXo
	WnjUaF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29jl-00000004LYA-2hGA;
	Tue, 08 Apr 2025 14:15:37 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29dV-00000004KCs-0uCH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744121349; x=1775657349;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v/+gO/eDzqiwoj1Zge9Nk2I670NLxBB25O6xAQ9lBnE=;
  b=OFMcVlxeO4iRVtNGtuVjoE1+Fk7hBNrGuclTcFhzyEKvcTQiaq6+L1nF
   rgYJjtJIGo7ZP9hhhm+Yy4rMLZdmAifvhFfkrxcRRIu1AhEbNFL7o4fYu
   T5ced933P+h1GN7O/0h5a4wcZreNTbjDCb8ja+MOwZEidkux+lsIqkYK+
   KbUD37E2xfTryw8gdWEJnVE6BkzSykOtDqo3lR9ufUHquzrlxSDlMqCQU
   EhJmKl3kd1TbQAfN2bqvhI8xary8jRg9Y12ef5UHGGE9lTFZeQrfe0q10
   5saohgqczrqnb11fzJSPlrhFFATSgoEQ3pSYk/pHLME7LuWZfk5a+w1GG
   A==;
X-CSE-ConnectionGUID: zjMQrJlkQkWcpQZUvIOG0g==
X-CSE-MsgGUID: +nLC5QXzQlSqn/wuiTVC1w==
X-IronPort-AV: E=Sophos;i="6.15,198,1739833200"; 
   d="scan'208";a="43405800"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 16:09:06 +0200
X-CheckPoint: {67F52E02-1E-903EAEAC-E04C76C8}
X-MAIL-CPID: 5A79930083A7B365114DC689F0D41E81_5
X-Control-Analysis: str=0001.0A006374.67F52DF3.0056,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 413701621A9;
	Tue,  8 Apr 2025 16:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744121342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v/+gO/eDzqiwoj1Zge9Nk2I670NLxBB25O6xAQ9lBnE=;
	b=O2NHqlNxp5QNXDjVYtpGLSWdOKX/ELTWx7c0ZkMlBrZ6jfsrZTKAtW0urzHAC5VSs1TGDR
	l5pxaOE01iUdjI7Y2sRKMWfRCqSENvTXuVQxC1xZO4292d8bXyMkHE4jp8dIa3/7okOlpb
	1E4zSFZalXoUlvf3VxrzS40BFVS7D2jZ8EGB5ONcbdVSDHTY/6z6hXuAtTX6MAThWOuAQR
	/OHjID+4VjpmKvTpTPs75X8ndO37jpVLiMWvLh/yApSaWMUs63PjKs5u8THXw1Xukr85gs
	5USJ/OvTaNlXFg5l2j4CvOMoxYMI9+LI9rtThOoXI4Weh0Ij1z6B6kuTZ9WfDQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name
Date: Tue,  8 Apr 2025 16:08:55 +0200
Message-ID: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_070909_584571_F3177233 
X-CRM114-Status: UNSURE (   9.53  )
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

This platform supports several displays, so rename the overlay to reflect
the actual display being used. This also aligns the name to the other
TQMa8M* modules.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile                        | 4 ++--
 ...s.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/boot/dts/freescale/{imx8mp-tqma8mpql-mba8mpxl-lvds.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} (100%)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 93cbd8d5081b3..38ce3d1c41c10 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -263,7 +263,7 @@ imx8mp-tqma8mpql-mba8mpxl-imx327-isp1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8
 imx8mp-tqma8mpql-mba8mpxl-imx327-isp2-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isp2.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
 imx8mp-tqma8mpql-mba8mpxl-imx327-isi1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
 imx8mp-tqma8mpql-mba8mpxl-imx415-isp1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isp1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx415.dtbo
-imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
+imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtbo
 imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb  imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-ov9281.dtbo
@@ -277,7 +277,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isp2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isi1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx415-isp1.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso
rename to arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
-- 
2.43.0


