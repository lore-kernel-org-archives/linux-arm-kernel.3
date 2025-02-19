Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B24C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlDaEXwA98E5yip/4WkX62llBCpH4fE7hTiQtGBXBKQ=; b=hNI/fOv/ps5GYf+kzYL0w0Gl/y
	nquIY3igyXMNSI7QmXz4VcrDokWvs/C9/87WdSihUzdycv7O9sTCHcxlp/ERX2nZJHIO1DNOpJ0pn
	jfx9YOHqMOicf7Ow8y3JwBnYH5c1z7SBm365OIWvP03SLltSlsJ+Uhvs+3iZklhAcOjfrLuGrlp2k
	TqX+RTeG4WmKoUX/x4Hoaoe8ULoexNAd+jmedE0mZQ/5G9uddDxLKEVcyB8QWy1K7Gsw0vilzpeqe
	EeP9hkrud67sf4PREvytR79cnMTPxlxGV7GvKgqpICIgbOczpDXC/pj3tt2slP/D0mbPDABeykpyx
	9pvYmhjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfVd-0000000BXva-0U7K;
	Wed, 19 Feb 2025 08:32:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfHR-0000000BSsj-2xxz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953085; x=1771489085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AlDaEXwA98E5yip/4WkX62llBCpH4fE7hTiQtGBXBKQ=;
  b=d5QJY9+OnDPhwvfACvwbWhBJt9qcwCd8kYUFgRBBSl2vD1wkGgMWzksM
   IKOpaBVJU4QpkRvXodnTgcLhUCAbLIGFdkY6ufUwxQA4gGoQBCr8gJgps
   AB+qyhx947ZW8m92ME8GmdyTT/g+8KN02nhxapTDaWSCvuC61PXOu3YnI
   uD9tAwFr9Y+qRdnffrptGBPW3FhlgZpjgxmyF15t3f+2hfstelVPfTjiJ
   o1dxpy1Bud9sExR7hAtXf4U4ZWrqmQJ5dGt2SCHyliFuhskAVgSOmu3qN
   ieVBSMVJJT8Q3LG40qWuckbZUZvaUCiWfBJavQ5j2QfySljC9DPMlBJib
   w==;
X-CSE-ConnectionGUID: YaF0d2HXQdCoCojK7HXmsg==
X-CSE-MsgGUID: nqNTARlOTnmT2NCFhaYhsQ==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945127"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:03 +0100
X-CheckPoint: {67B593BB-2D-28232521-C0C2250B}
X-MAIL-CPID: C0229471A839A1E2B4E661868D99E2AD_4
X-Control-Analysis: str=0001.0A002116.67B593BC.0024,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECDAC164350;
	Wed, 19 Feb 2025 09:17:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AlDaEXwA98E5yip/4WkX62llBCpH4fE7hTiQtGBXBKQ=;
	b=Kf3hXjJdxtM2+VfLohPbeMmt5afm2Y3D+1wBSHvLioVi0f1affUmzKtXNne7IxVVDKUCT1
	J31v2a1RPrthYDMrfNrja4w44a+pW7U6faPMZyTxPewTtdTmZeQ2kfcmXB8kUfzB3Aa5lk
	43ZE4BAHUxubxvHIZwUHi+7ygQz6bHcIwKk2G8IfvKNFdelJH4iewtzSaSicJprJYbCm5c
	pKhF6SbC5zVez+AxSScg7QjKg9XNI9La2MBx1TsdjoFDpbei7UUHDg3x45Pu/GDPq/1MFu
	5QB8402KuF27Sjq3xBoI76dofV0cRYRGJVynfwscZb4SPfl8KRmF+Er4Ch4s3Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] ARM: dts: imx6qdl-tqma6: Order DT properties
Date: Wed, 19 Feb 2025 09:17:36 +0100
Message-ID: <20250219081748.1181507-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001806_065080_A0236CF8 
X-CRM114-Status: GOOD (  11.29  )
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

'compatible' and 'reg' are put first.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 6152a9ed47682..303def00cdfa9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -25,8 +25,8 @@ &ecspi1 {
 
 	m25p80: flash@0 {
 		compatible = "jedec,spi-nor";
-		spi-max-frequency = <50000000>;
 		reg = <0>;
+		spi-max-frequency = <50000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		m25p,fast-read;
-- 
2.43.0


