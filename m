Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3897DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AENnf3CgBOghgCPCO6AUYPMH/oVpMZNd906YezBjWG8=; b=Dgb065NY8raihdGd2OsFoKYUoM
	di6GttbX8A61nqmDD2nQCKxYhec2qQ+HRYjpLP9kFkUhviVWtGpPhn7RPav+8Xng0PLaLol+TVyXL
	Db/+n+WQ1hbgj03CRvuTn9oJsDyc3Ht0VFxPzVv/UFQ+jFGNHJ/JRVe9Wbhvk97rI5sqxtM6PcIWf
	c4Sc5lhi8X+s5c0mRgF7kPuJNTAds0IassKaEwrx1IP5DJ3loXASeQ5slguxPzMlCyvfNaM17P/dB
	LKYRhvX9VpiW3n54ElCHpOc+b2DA7gV4MtmNQ81Il9N1edWADZQs17bHJhqJZoTq9pQpjSoe3qxNb
	g9KPtXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfhD-0000000BcAj-3Jht;
	Wed, 19 Feb 2025 08:44:43 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfI1-0000000BSvS-1cCY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953121; x=1771489121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AENnf3CgBOghgCPCO6AUYPMH/oVpMZNd906YezBjWG8=;
  b=gD+Y+40Nl5R7Iu3yxOTuwQITZmWHBbb80qP5YPr3uQDBS/hwnHhD192p
   IxQUVplIEXg11zjzdLGgICtGaaurYRL7Jmxw1MFjzFLoLTM14PBSVgWcT
   kiJMSoghN9PD3ti62FpEIzM/Lg3PVEJT2gfb5nB6E+odzmPnAJ9IYAkI+
   uoy7bg8ViY94RINXYIyFi7lJEW2++7DKdJj5lXzJZqRQqaDab28rkfCHV
   wrZexqJAyILdVBxIs1fnhot+d5tNvlpCTdmp87KS18WIAdghXQJqwOXaM
   bY095FC2hdFL1839PLKp2eS5DWH8f+uDYhd17ocHnsDw3mbIcvM6atzFl
   Q==;
X-CSE-ConnectionGUID: ePkEWgcZSWmPLQ96I4NdvQ==
X-CSE-MsgGUID: ifjATzQ3RmyROuGkezU3hg==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945176"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:40 +0100
X-CheckPoint: {67B593E0-23-EBA888C4-C1AC8B84}
X-MAIL-CPID: 228EAB8CE74423764938FA9A084C0A86_0
X-Control-Analysis: str=0001.0A002119.67B593E0.00D2,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B70FF16D460;
	Wed, 19 Feb 2025 09:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AENnf3CgBOghgCPCO6AUYPMH/oVpMZNd906YezBjWG8=;
	b=BBMFsjuKVv7H2WEZzDsfIOuutjd2xtCvQWGB29tj625HnZJlmmbEPVw8+UFMPzcA+BFQuA
	Ra+Nrm9VWi4Ih1C6wbcy5MVtVNVSL1UF3BkROUgVS3tSHhcSxCwWIc2MuCZWy2l/XRfbrM
	wKP1POTxQNVzZ1yWdVj+rAL8x9H9FgOM7bDDmUz8yz8AcRDESRRKIb/sjXMK8E29sB/Hkm
	dbG4jl2MYduDehK/AWrVX2r0gJJnHAzvBsdA7gattAT2/HqEE2Bb14szcOH8oi/t7ZJsMi
	7y6YopzzGXKzU5U+kgr94Hg0ysKF6+XZkzT+lztmMEVZjMpg9pYiEK/6LX4ouA==
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
Subject: [PATCH 8/9] ARM: dts: imx7-tqma7: Add vcc-supply for spi-nor
Date: Wed, 19 Feb 2025 09:17:43 +0100
Message-ID: <20250219081748.1181507-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001841_726296_87E332F9 
X-CRM114-Status: GOOD (  10.52  )
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

(Q)SPI NOR flash is supplied by 3.3V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index aa8f65cd4adf7..618c3f68fbe25 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -265,6 +265,7 @@ flash0: flash@0 {
 		spi-max-frequency = <29000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&vgen4_reg>;
 	};
 };
 
-- 
2.43.0


