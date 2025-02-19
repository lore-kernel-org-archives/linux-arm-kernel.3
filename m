Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB781C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJCpfFuLYwpfyisJZD4BZNp2s874UbfEw6yfvZepqdE=; b=YGvtfYrhGGPvLfhDwjccVARMdE
	FLKXEh6LESJfk+KlnhoD8rtj0hvv31NP8GMJOSqjkZJck4iTnDIwfd8dA4aJX3eVMNnReODOCoy0i
	2lAMa28NF80Q1f25FTy2DWkE1LIhig1mKjM2vUTWHSMUfJPqg7gakpdblxi5kqpd/aKfsmjK76cLP
	Q9kCqTIiUhG82cgbj7zkJepDh6dBars9nPKG5iwqzv5yvQ7oDnzOxPZB8B7TbVaTVB8bOEq+yNznr
	xt6U8taIcZo2mLFPoUBR80hRF2JnTaSMp9ecpe+vqNJKKijbZu92SwpHWfoJNxrABS+OtjQfPNrt1
	ERb1d2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfif-0000000Bcbi-2Rxn;
	Wed, 19 Feb 2025 08:46:13 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfI6-0000000BSvS-2SN1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953126; x=1771489126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sJCpfFuLYwpfyisJZD4BZNp2s874UbfEw6yfvZepqdE=;
  b=anO2nD9gH3MLBEXoGUf3bhBQR9tDBy41lp8wsdqRTJUkSoKKYkFUTMTa
   nl9NR8I8Sj8QHxZHYGhcxbTvOmr72kseYpSik2G4TkVqzDEU5B34bx+so
   AkLRFRvuJHYu61pSWvoxi/6/2YKhHglLRXQQqYVbwJ8tIhdeyJXeV4DHJ
   CQqQjG6FoB8n6idPNuiOxB2WZnyLnhNbrv0ilW29TqH9OvTcBaRkCuc1L
   +bZZrRFu1ZqgI83eDF6zKuL6rCcMwpVBgdcdva9c9sdI0UZrkcC8mmJ96
   tQTPvS3At5XulIccNURxP9gVUsP6JeK5uRRpc6qkjE1Lzk+23NKRiLwfE
   g==;
X-CSE-ConnectionGUID: PIkwYlt4RYWT1ITq5zOsOA==
X-CSE-MsgGUID: CtiBKZdITmql8A1axdGK5Q==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945182"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:45 +0100
X-CheckPoint: {67B593E5-38-6E0A4539-DBC44C3A}
X-MAIL-CPID: 6D57F2DBFDF88598594366B5F97E1B52_1
X-Control-Analysis: str=0001.0A002119.67B593E6.0005,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE5C316D46F;
	Wed, 19 Feb 2025 09:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJCpfFuLYwpfyisJZD4BZNp2s874UbfEw6yfvZepqdE=;
	b=GwRoyopzItomM2TruwIv/TMEriySQ/CwUMzGt2NqsfLaBvVzNVKrQBP74VhmnqpCeQmiv7
	He/wg+RrMR7ig6zAv04r95MmET2/uVarahSHpmj9pmmUgmuTpZkFOhPkdgZgRS6RSaut8L
	I0h9BztWcpnd05oCdJuuQ2MktdPOBoxztlfLk+ZfUdi6wow2iUEH+vaMFPwhYQnX7k/zq8
	ql6cLIbmQGezhIrRtZ4sWi9Vl3zDibw52HZ1UHuEIcHgKY1GKEYQPKA25ytfHXR8Mww3cQ
	ivxQrieoWVtCQlPZRnG+1HniAhan/sulxI7sQ+EuXbZ8bPcGIIsV8PWKb8DlCg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 9/9] ARM: dts: tqma7: Add partitions subnode to spi-nor
Date: Wed, 19 Feb 2025 09:17:44 +0100
Message-ID: <20250219081748.1181507-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001846_921654_2A25766C 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The bootloader adds MTD partitions in this subnode if present.
Add an empty partitions node which the bootloader will fill with
configured MTD partitions.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 618c3f68fbe25..2966a33bc528a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -266,6 +266,12 @@ flash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		vcc-supply = <&vgen4_reg>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
 
-- 
2.43.0


