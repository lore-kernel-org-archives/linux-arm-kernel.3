Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED6AC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caYvtvJqNEqdShPosNv6lO8f+Vtj++Kp5DISf3ZYdDA=; b=gkze6u2nODb3HDAQjI+wXtLOdp
	bMyUjgRuQlesFrg7Z93ILCxws2Xyw/dKXy2pW5xJ+KHBAMJ9xmjJUKQhGnsqpyc+yj5bh5c8Ka/hp
	AHOPExnDhDwAzqrYD9oZ9/W4gG69jdZ6Bmo9DRX6sEghLWcmv9VqEJFZxohnUtRRZkwUvjyW++bX9
	x61uG0bQsXUCgdJI9wdPhjDjLMD5Gg4zYBj2fZl9S1Qf3sX7ns7dX40xC2FfSW+iOzrnuEa3bXZzc
	gy8mFsH6BiSqGXm5n7jWcpF/lj1aAqwmUpi2Oz8pV+L/VQontV+U7B+3nRC7hCGubyHdzhY7b9V5f
	MFJm2trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2psv-0000000ABBQ-3Ree;
	Thu, 10 Apr 2025 11:15:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2noN-00000009rJH-3JNN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Apr 2025 09:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=caYvtvJqNEqdShPosNv6lO8f+Vtj++Kp5DISf3ZYdDA=; b=qgNEx1wqkZBX7r8UWViBlJU0YR
	2xzNRtAqzBK+kxBpR+123PEikSkZ7xQ7O/T197MPnC5d8RlvXRIGFc3k8tUIIF/emDZVVwYk3fX/1
	xYtemvYfOVMHqLfSgIdGBuxGz0bGQu9K4SoqjHhMr8uaQSdrbPq+0YXvVHgN//QgTI9E7oTMc5W7w
	+dY9AyX4XRV0mD9po8eRSDEFYFM2HHcaCqQt/JSjDF/hqECZgnNB2JQg8mq/6H56GumpI3D36itNq
	PeL8dbPuoalc2hQK6LKc8dmNOg/fz5mna8slftzf0yJCeQwey+czscmrrNyY4t/Kb+52exmHRFODk
	pvuTKPRA==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2noK-00000008mfL-2Nfb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=caYvtvJqNEqdShPosNv6lO8f+Vtj++Kp5DISf3ZYdDA=; b=NY+vFVyQU7mS7bW90afhYAskNO
	18+jk1PZNwbpDNhTYinjfjYj54qksCZkDPjEKpSGL0gxKTOZ1dxcVR0++ccpu7faKCzzLqwdE040Y
	7G+SEm7UjWtle0rhGx5nsHO4tPq7jAd6deSLrwNW+Bj6CzZEDEPgsKCyMXVOfdQHHN/26gjvZQV2C
	J8DFEoiKA2nV7Jzsh5SjtN1/7MOX8Y2d/+H4JDWXtn2cKaDnaUrKZzDe/bYLXTA1cD1cdZWZkIKlK
	4mRmObxQgr1eYDg+NGX0rMMNMuAHmm8Wc/+xY2SgRxgB6YN9adRDc+6IYnydGpSATwy9/8k+Rr6iD
	N8yJZRjA==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noK-000Djj-27;
	Thu, 10 Apr 2025 11:02:59 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 07/13] arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card write-protect
Date: Thu, 10 Apr 2025 11:02:45 +0200
Message-Id: <20250410090251.1103979-8-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410090251.1103979-1-primoz.fiser@norik.com>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_100300_947377_00B39615 
X-CRM114-Status: UNSURE (   5.73  )
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

Add disable-wp flag (write-protect) to usdhc2 node (SD-card) to get rid
of the following kernel boot warning:

  host does not support reading read-only switch, assuming write-enable

Micro SD cards can't be physically write-protected like full-sized
cards. Thus disable this feature.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 902b523fc92c..3d5cd0561362 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -48,6 +48,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
 	bus-width = <4>;
 	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	no-mmc;
 	no-sdio;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
-- 
2.34.1


