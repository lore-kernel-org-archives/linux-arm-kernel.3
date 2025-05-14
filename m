Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4406C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/b3jKQnjFfCzi+nMXSpxQ6mwboqPa2j12sqkwa/JUXU=; b=IKwFzc6jvb29OYSWfjO8gLcJ7Q
	P/Ytc5Fz3h0H3yryFqAPRqTqhqlJ7roh9o9j1Hkbzn/l1zrmDpZu8R7PUcnx/5L/XKApykjrHLDyl
	hNgJSahSe/VY2twA5CXzR/Rd2uTFiT6lZoSM/XdoUeuUMkrMoaqC24I8a4cGiGsFOWsMg/ixvQj07
	5kQmJK88kBejTg9by0q4nCkh4+6pM5K1MrKSMSjap+ESQViTyLfXXA2IGReRbVZwam9tlWqu5BhzV
	j1PYDEPDiltMzMVJysVKE13Y9pz6N7AzERs0yJMHcSGzxyCILFWS7OJIQ9f1jTJgqmd3l4tgWpaW8
	Cl841fyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXc-0000000FGmS-1McD;
	Wed, 14 May 2025 13:53:00 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8ct-0000000EhmU-2Q9c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747215731; x=1778751731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/b3jKQnjFfCzi+nMXSpxQ6mwboqPa2j12sqkwa/JUXU=;
  b=kmRYOII7fwLDGFl5cO0GepCwGi2uB1VidI12uoQC2NVEgdPQ2p6Tr9l5
   eIOaEILULvPd1AfMkHEZda1ZBSjcbzsMMPEmUbQTFYZLXW7kZ1jRSOUIh
   nDrDeTmNleuAxLCLEfjg79x1BnBd7j0rvryFXeeZ/zuxNuwWz/CmbqjKq
   dYwBpmWfT83UNoNXnU8GTmsnUmZQSfCC82YdBRd4a4N6P7g6G3bZ81c33
   oh5lxRfLAVcJ02U8+iHZgA7c/0meNCxCkPZqEIUCuTIDe9XQ1WlgrVR7p
   NAIErA8xBz/6MtCGGztBGxjZEvIuGcymneIV211sjyTlTxFD+GG5NUYUC
   A==;
X-CSE-ConnectionGUID: pdY1pfZ4S9eNFtVX5MqFBw==
X-CSE-MsgGUID: unBuWKI9RjagjdxTdBfhtg==
X-IronPort-AV: E=Sophos;i="6.15,287,1739833200"; 
   d="scan'208";a="44067210"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 May 2025 11:42:10 +0200
X-CheckPoint: {68246572-20-C7E25413-F4312D34}
X-MAIL-CPID: 929D38BA6E11661DC1AE8B71335B08CB_4
X-Control-Analysis: str=0001.0A006378.6824657C.0031,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05B78169473;
	Wed, 14 May 2025 11:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747215726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/b3jKQnjFfCzi+nMXSpxQ6mwboqPa2j12sqkwa/JUXU=;
	b=AABxyhm3viV2vt+6Cx6039RTmSUeTPK8sCNkgxL+gt6ywRLSYJvihnkLwbNPvrrqqkv7M+
	JaF+58M5P6HeneWybu6IVarHruxlwT29pha5KU72FRJ1l+Ws+572aZ+IQ+NC5UIR5O6zuf
	EjXracL1q2iJmx/dDPAAyZkTjJXOVoCrNdKIRqDVVUAhYhdRP7aLvANg4TZYZCFfgxOneq
	gVJ4ZVZqjYCO7xG06oUclvaFyF9O8QQQVqaxfVZEm2uU5+VJlTizT6tuSE33u4s/SjBOdo
	/Mmvkyztg4ABvw6Ud3jnbkUtBsWQ7uR+gy+UOU65Zk5azy5FgzupEnIXsm0Zog==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: freescale: imx93-tqma9352: Remove unneeded GPIO hog
Date: Wed, 14 May 2025 11:41:28 +0200
Message-ID: <20250514094130.621087-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
References: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_024211_925314_869FE007 
X-CRM114-Status: UNSURE (   8.03  )
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

Starting with commit e6ef4f8ede09f ("gpio: vf610: make irq_chip immutable")
gpio-vf610 supports locking GPIO being used for IRQ. This already prevents
configuring the GPIO as output, so there is no need for a GPIO hog.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 09385b058664c..c2e9c126bd261 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -70,15 +70,6 @@ partitions {
 	};
 };
 
-&gpio1 {
-	pmic-irq-hog {
-		gpio-hog;
-		gpios = <3 GPIO_ACTIVE_LOW>;
-		input;
-		line-name = "PMIC_IRQ#";
-	};
-};
-
 &lpi2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "sleep";
-- 
2.43.0


