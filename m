Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF9D106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gfW9TbB0pr3tG11z/s7lmtotrUV3HtI4mdQeu1Tiq4=; b=tXmXhw7trCPHideEWI3eQnh4tv
	yUNz9r2ApdpLHMksZxjhraW0OF0xU4a+dKmFgJMgVk8aLuFsblhAV7u+mk/VDaSGbo5O9Sgt4Ahnt
	VGQ4be6g2cHopg59YHdUAsrvTPmPrSK2dGo55b0M243GC1M2KS/x7Yml4DQjee6SL3osXSKM3QWYp
	VV9aeWJPIZnNqiZ5KwVXBPYoUZkTUIEa4qfIy+VjzX34CU53m5jLukQJu7oSTpdpFcLgIv+tE0fuS
	res29mVlt/c4jPXUoU2sG0l+m2ZMxN0Scn4Q4udZ/gDgDdTOTVarMYqn5hgOa2d+TI+v0fqpvq22Q
	UmVMNs5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcm-0000000GyLC-24Jo;
	Fri, 13 Mar 2026 07:07:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcj-0000000GyHw-01a8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6gfW9TbB0pr3tG11z/s7lmtotrUV3HtI4mdQeu1Tiq4=; b=ETBtXSpnx8SqW5n+Bf5Ex68dCv
	R5qFdowoxuZAg2MuVybgT8sTAd2enWIS0JlZd5Gy3Rv5Iqurmcn8xu21C4R4b4MFZw7AUR62Nh7Br
	XOVulB3ROZJNZJBwUrMjvAL9WmxqiYt5iia1ed/CT/Vp4DvKov+HGPzq7IfqsTajI23ipp59/iOqe
	2Dp44tHewNXz/I3wyWpKW2bgzpUfOJpnGwad7iHWGdkj6GQRnuSDqXssZ/c+SCEEQW6dN27U8SVY5
	zJPaJr7pR6UUQ4PlFZRZOwJp+f/0zxQ1aXPgeJdyPoPpElIFJhZsMBZMexf0bXcSQMQLkZ7saqQnn
	Vdz2jHtg==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcf-00000002ipK-1iNB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6gfW9TbB0pr3tG11z/s7lmtotrUV3HtI4mdQeu1Tiq4=; b=dGbunFiJRZDKwua9IEAY4FZYSZ
	cV4rqzkom/2JrzQOlgIF5qBblpnOv9jLw/aRFpyF3mJVx/0Jq3zBqvG0s7STc8k9T8m8RpWFgizGR
	kbwBPAjq1ppFhU1etLHxriEUi+LNj/nPbuucxR7Wd/W6XDZmZ5w1/lmLdEmtkCRx3gsh+phc5tJGL
	ZSnhXSG6O/hwM7/2OxP28yM5AxRgGH35F+CTbFlawS/D1L57XfzEMPJhALxURoamFxbkgFp29c0J2
	Tljzp+HVIDW5eDJTgL5Ywwl8nxdl4bg2dSyGXR9lFjDi6dDX6azZfMN/B6pDntoTEaxBHlNKYYfGG
	AH6mY+tw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wce-000CWn-34;
	Fri, 13 Mar 2026 08:07:48 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wce-000IYT-10;
	Fri, 13 Mar 2026 08:07:48 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: imx91-tqma9131-mba91xxca: Add parallel display overlay
Date: Fri, 13 Mar 2026 08:07:35 +0100
Message-ID: <20260313070740.585043-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070749_871370_51CAE95A 
X-CRM114-Status: UNSURE (   8.83  )
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

This adds support for CDTech S070SWV29HG-DC44 display on parallel
interface X3 on MBa91xxCA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm64/boot/dts/freescale/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 24d5b0c2ddafb..64fe9487b1003 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -417,6 +417,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
+
+imx91-tqma9131-mba91xxca-rgb-cdtech-dc44-dtbs := imx91-tqma9131-mba91xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo
-- 
2.43.0


