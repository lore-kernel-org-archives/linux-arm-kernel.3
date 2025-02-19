Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25E8C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwSj9P7cDT8V91YvPThqayUco/hLI2W6VmhoMN33x4g=; b=XIcUR/4bejPFTw4A/7Vs9qtPZn
	WPz0wJJ+xzYVd6EFz64xQ1WKNMqR4hxsR1WgdMBEi8crLZAxFD7o/onN+hY+CZKvB/9UHjLSwcbo3
	r0LzpkzKvPk0d+we4WgjPFFLh+0br68QJOTplnazjnOX2ETM6DSTiO+ibBzXi2ozNDUgjq2wEKpcJ
	rQusUW6JaSPqVhjbI+ppcoKVWWFEEz6u+02mRkSwCQxM9802qaZ+TQFsgt6uAI/SZwRcvNarKF7o6
	f9ueCBtxIPLhKPycWtgbRK/vmqzigYozGmpDH3h0wYhHjKxEVZc4tyFWF1LwmGJAvTmpvjjkbtGMT
	O2bn7otA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfcs-0000000Bapm-37ji;
	Wed, 19 Feb 2025 08:40:14 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfHq-0000000BSvS-3wbN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953111; x=1771489111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HwSj9P7cDT8V91YvPThqayUco/hLI2W6VmhoMN33x4g=;
  b=qcBVPXZxvaZcKFqtsiABOLoYtXoRvxAEpIeQ2L0KAcxGJsvfX5UcEwMv
   K++Lq0C76szzkso8SwJjS4oq27JClfUbcLHXJKEzAs132L6Qj6EoQfMNv
   1DLLXvGrC+p1mzw7kMKCE9oMLSqbxa/AhKu2GKWjPX8h7yTihE9vNUzOw
   ribMmggfD+i+xpJJGTb7HfB5b0bTjnfTx4LhhiQf178YyKoP6nJ1cc66F
   4db4M9pqSVq/hsZJBcCnaqECyJ2f2IVfSS8AVrbkXo2vOHPVuL66RvCCh
   HO612Rj3QhIhQ84Vrbihyp64zAwG1VRxj4TeVsVoHaL9uqocfsuJs6pz0
   Q==;
X-CSE-ConnectionGUID: u9wh4AVUSNKgRYHGd8qtoQ==
X-CSE-MsgGUID: p8R2SHBVQVWnVZ2D+Oa6tQ==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945151"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:30 +0100
X-CheckPoint: {67B593D6-1-B8541F8F-E50F9B0E}
X-MAIL-CPID: 254D9EE434293371C7B2BB799D6CDE2E_2
X-Control-Analysis: str=0001.0A002118.67B593D6.005F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44D3B16D339;
	Wed, 19 Feb 2025 09:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HwSj9P7cDT8V91YvPThqayUco/hLI2W6VmhoMN33x4g=;
	b=CJ3Wviff/oZvSgazQ7MBrBkZ9WyTdPq9Pe6hV7kJKuBTBzVLf8eJ53v6MiE/OfiuB0G2Ca
	k0FJxRGRN25klspCERIFR7oe6486I0qGoKhVkxN2qWQJy9LTe5Dg9KbCmQjyNL9TbLTcRJ
	5FQF90HcsIE77HiwZcCN3lQJ40OjMBv0Gi8Qo9Udt2p25KDFiUKUOk+PN3QkPE3d7DNCx6
	RAOMhn7lo0eHR/0KtKbsajSnnapabhkFXsyicYFraNsL1uG02psP3rbs4CF8R7V3TQ8u5D
	um2BczN6H6gvlDArAN+HORF2SeNS2Q+e2Gku8gXiuodax712Ntma9ECgVKosDA==
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
Subject: [PATCH 6/9] ARM: dts: imx6ul-tqma6ul: Add vcc-supply for spi-nor
Date: Wed, 19 Feb 2025 09:17:41 +0100
Message-ID: <20250219081748.1181507-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001831_283938_4068269E 
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

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
index d63229d8b4655..1e4022cba3cc5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
@@ -169,6 +169,7 @@ flash0: flash@0 {
 		spi-max-frequency = <33000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vldo4>;
 	};
 };
 
-- 
2.43.0


