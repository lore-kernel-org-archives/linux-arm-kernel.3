Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8547EC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5J2XktkVZupz+grzl0L3lVM8YCbDvKpOyQ/u9CNoYZs=; b=mUVmod27UrlEPk3pEGMd0IIJ8k
	dWgs/DRUF1ocdGhr9NLOH122zsRd/OTJZn6Uqc33RrXI/x3/i+0i5VyeASugzg2Bono2AtWroxCpn
	6sd1nFLqV9IY9gbki4RB4B8iigkbCE3Qaow89aIYZwRnWw626FHFeWUHP3O5IRn74MElM9xlZvjGo
	wr3R5hUVa/pACfdesD8rJztHBrt6/J+G2k31Ngex55w9Jivds+HmfNDOqf9Lz3kg7axClmlOQDYI6
	Xau6pYFFh/VLwncE1ThXgZm97Q+8UmHDQcGB3+SrvoKmbjJ4eOLRVKp14+1hlRS9mSQ7Tv3qKuWVd
	giG9W0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfX5-0000000BYfL-3ltN;
	Wed, 19 Feb 2025 08:34:15 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfHX-0000000BSvS-0oP7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953091; x=1771489091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5J2XktkVZupz+grzl0L3lVM8YCbDvKpOyQ/u9CNoYZs=;
  b=TyOGTT9IIFLBxuUN5xrpof3ffI+03ShizTTzCN5SkNC4inz7IHYeYi6J
   gTL8dMd2uPXewiewT/7xrqeaj4emY7PA06JLLScFoJ595uE5rKHd2GZFL
   Qj5f35AnJISaWpYbuMTFBJ5ElHNElFeBmpyxptiyRckALW0NpLwapGunI
   +EJ+wwy260z+mZ0CtJcLcNpGoUHvoHfOdd0zd/d6L8wVwaORlrK0XEsV6
   98DxyF2ZxRNnRgp0Q8MUCdzSNIv8Ef98XVYO+8wo3EyoMoAPd60/gZe5v
   3PEenbVXmFgL49wgBwiN3LvsD40FCpFQ7fudnsCAK93dvuXhopCR0MjII
   A==;
X-CSE-ConnectionGUID: /IX5oq6pRaGVwxOo+5u4vA==
X-CSE-MsgGUID: x7HDVl4ESXacCfgnsd69jQ==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945131"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:09 +0100
X-CheckPoint: {67B593C0-30-F75C4246-F0BD6D90}
X-MAIL-CPID: 11E601656B77042673F6C9590D4249A0_3
X-Control-Analysis: str=0001.0A00212D.67B593C1.0074,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D33B16D33A;
	Wed, 19 Feb 2025 09:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5J2XktkVZupz+grzl0L3lVM8YCbDvKpOyQ/u9CNoYZs=;
	b=B4WuRgD1onDLsR8yVDsSyD7ZUquLG274RIqM9VpHZOc8AN2KkgKxbl6zgqMy8zhQj0TRYp
	StTqkH8kBHSKRzknLcvOwrtq3/4nnqjRWfK3HII5yVYeO30gsckK1igPUnyTbnzXKNFWqp
	oBOko5Ni8Ua32w2I/quw9N55KgiaRy8bPErS6SouRsk1yh0NWJmCp5OI+zsxDz7RNKXEdp
	hqUqrcjszganWqJJ0HtU9i14c90l9A8/NBbWSL+vH2V8gmJqKOQyTjuBhDcDjm7rpl0FwV
	roBXzr4wOkjrdClv98+nBaaxL6BGNcj9dbwnyEESpzdc4le7DwQHoiGC3XdqBQ==
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
Subject: [PATCH 2/9] ARM: dts: imx6qdl-tqma6: limit PMIC SW4 to 3.3V
Date: Wed, 19 Feb 2025 09:17:37 +0100
Message-ID: <20250219081748.1181507-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001811_587083_87E41809 
X-CRM114-Status: GOOD (  11.77  )
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

This is a fixed 3.3V rail supplying several hardware on SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 303def00cdfa9..68986fb3b8df3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -119,7 +119,7 @@ reg_ddr_1v5b: sw3b {
 		};
 
 		sw4_reg: sw4 {
-			regulator-min-microvolt = <800000>;
+			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-always-on;
 		};
-- 
2.43.0


