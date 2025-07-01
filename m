Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B99C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGl5l4cbrW0oZiz5/Hn8qYIROz+YDPJP8w6FEA4IyCw=; b=wpdRX2lUFAcfuTjZwTSSML8rlQ
	ti8SG9F6cGpJWOHMX0ilqF/EQh7+1JFkrCQhwfu+3TLfn8MbBQcm+qwGyDvoI9wNjn6ye27vx54+8
	H7S1eu5Pe45phDO4zQbVNeXd/bNb+ff3V3s4bWvkllGeZJxI1eaAIKN+C0TIG3HYpIeQ+gseJq+vN
	vMSLpocgmiZpz2xWiIiASGM01nKBe67HUhly76Dhnv/iuDMUIDyolYbnTqMxvr9QVhKt+Xrua69Lk
	Sdw+b+BWXaEpAFYt7m0WFErQtXiDhH2dF6FyvdtguSafqFXpWvcXY3OyRxVcT5oQhQO9WUlYRA3ad
	rEwQUSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWV7z-00000004Eje-3G2X;
	Tue, 01 Jul 2025 07:10:04 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWURB-000000048f8-1RhD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351149; x=1782887149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uGl5l4cbrW0oZiz5/Hn8qYIROz+YDPJP8w6FEA4IyCw=;
  b=mZGD8Rp66jKgMH9uDs9YrZLnCcMUpq18Dd61EH4yQirn5hMLmNwukRkP
   k7hmOlecd8ztuae8nrv/Iu3wBzvh9KPrSnBTSNo7ObJ41SAglQZkq3tuA
   AY29trEVFwBTJS/u8pir2/Lfgt0hm7QLg+Rmuv6jg0vrfswsbkR3WXAeA
   HGJvyvBbtrd9mTyu/9h/v/JADfnM27jTQOj+LK8TOc+eSh3jbrIPFPwpV
   lF+3vVF7gieEqCLVApju2Lh4Y0266ts8ERkAvSGMDk16ZBwHEoailtJ3R
   6Pb0Dsa5AEpImxjbORZC4t4AETAC2lZMc51CtHwjxvcyYYAXl79DwNHnN
   Q==;
X-CSE-ConnectionGUID: kQ0Sl0NvSaKDZ5sTI77HNg==
X-CSE-MsgGUID: HXn+a99eQiC5kBXXehRZ8A==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943389"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:48 +0200
X-CheckPoint: {68637F6C-E-B72BD212-DAE8BA0F}
X-MAIL-CPID: 7E2F37648E5EFC1D7552387AF6DBB2FE_1
X-Control-Analysis: str=0001.0A006377.68637F79.003A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C053316A60B;
	Tue,  1 Jul 2025 08:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGl5l4cbrW0oZiz5/Hn8qYIROz+YDPJP8w6FEA4IyCw=;
	b=H2oCv6OvW1wEnz7TbQS2gzetFzUgFUepcTii1esFbzf5kFGX0YcYR9PwlfT9our+XmHUwH
	87rgW4ir3ixWi1mZI+MENBAZRlJM6En3NSdwgFkelKnqOV1fYvDZ8bUo+UdFZ81UQDr6LQ
	TwmC3TB2me3dbJQ9jLTMYj1ptdu5uobQcU7XoGt6XgwPUNvagm9Aa8LftuYtQHA8+6pbhb
	3C5oblHujUluDWzH+6NZZ//Un1dYLS3xn/XWKNeu1Z5zM6cqcw3yKtrcEat+WgD3gn18Uc
	+69pqjjEoDpx4PaMrBlWeshGqdYcDcRouKEu5hMKjv8OsgrVWFUGn+S9tNemFw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 7/8] arm64: dts: freescale: tqmls10xx-mbls10xxa: Add vdd-supply for i2c mux
Date: Tue,  1 Jul 2025 08:24:55 +0200
Message-ID: <20250701062500.515735-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232549_679286_644EF6E6 
X-CRM114-Status: UNSURE (   9.44  )
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

The I²C mux controller is supplied by 3.3V rail. Add the corresponding
supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi b/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
index 40fa41eadd836..444bbf5115968 100644
--- a/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
@@ -89,6 +89,7 @@ i2c-mux@70 {
 		reg = <0x70>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		vdd-supply = <&reg_3v3>;
 
 		i2c@0 {
 			reg = <0x0>;
-- 
2.43.0


