Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE98C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SeUU/CcKteCzk5JgAiW0vYeJCZs4uk8xMONzg4FEjlk=; b=ps4r7dMAVLunN92UbF9RWKMmKI
	benB1wB4rrooLNAYzhtOFru7kT0KPy/9l5Mt6ypkkMhvVel5HnPMwFoEvq2+YID0I4UbpEpxHSMVJ
	mQ1zLDdzZiQ3MiZcN/KlzNC04E+/dSTqNUbittbrkrc4W3sue8k2au5CxPKZNE6lngvGyg6mCu75T
	P7eXjIB3HLNsxXNr0dKw8cGp3H32eW2CUDfg9iHIays4AXNLdjwQzvV56GEoRzkaUBp9Piht60/7K
	pXU2FrwMQybtDV++GeK+CSjsna1+n7WkCLsmOtC8ATylUlEPqOk5d2AnjMg+fJ1SeeI6omoguEba4
	G+WE5k+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrnX-00000005f6C-0dGU;
	Mon, 20 Jan 2025 13:26:35 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrmG-00000005enX-1HS7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 13:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737379516; x=1768915516;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SeUU/CcKteCzk5JgAiW0vYeJCZs4uk8xMONzg4FEjlk=;
  b=gjvP8hG88afd4gnZWA6/9lBbI+UQ0ac8tNU0WYZHncvNqCRdUW82c9eS
   2VYijdJeRAZ6XhZ6lzlB/5q4OBRHqxbeS47q9l8eUdTFx00irDtVhLgvy
   XPIyFNouHkanDLPmCRVkhuBJLWVNgQ+93dzfyhgsh0OtxQOiMh7kQhpk9
   ijcdkyrFbZ3S/56mTWxcBNi4R/FUL9mIC+F/mvgOr6HaSMTn6JEwZ84bE
   NFGRIw76oAa/dHAX/Unib64PafS71Jy3m49LbsTzfiEyJV0aDgT448cMZ
   tYpuuxPg7M3SmxUlP5FbzK9i3sxpQtIysgZCMtkjA2cY4vDJI9WWReEaD
   A==;
X-CSE-ConnectionGUID: r6r3dsEWRAWv+EZTFPLoyw==
X-CSE-MsgGUID: ua6OEG7KTFaJba6J/fFTPg==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41177837"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:25:11 +0100
X-CheckPoint: {678E4EB6-1E-9B2B6168-EB6F31C5}
X-MAIL-CPID: C04F1E62FB708A570CD8B49F55B412AD_5
X-Control-Analysis: str=0001.0A682F1F.678E4EB7.008A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46A8816EF42;
	Mon, 20 Jan 2025 14:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737379506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SeUU/CcKteCzk5JgAiW0vYeJCZs4uk8xMONzg4FEjlk=;
	b=cW9ibBmaBKVsCdSYNj6/g+sSxif7ygs/R3unlvLpidfp1lzIV5YLiunDz5C3WsUqPGHoO0
	62ms8j6bDZpn8nRcMGrj5jak8k+97hIoGWuERtUcg+UpZMM0rNX62/YS5TjslTZIMeH0H2
	4mmk94Ub7WIRHyar8ZrmEg7KkrdIkyXv16EaMK2MHicPiqgTzKbtfMRjeEAsOmluvcIWrA
	b1ULVTJYGZQacIGSThBEaS3MteuWNrYje8MlkJ0SFJbBKVq8h8htU7aAMt+od7rCZBTr53
	27pagVGZcB65tbS4V0yhKjvSmFH0WjYYIWHKWkLRmsa5XTGZ29Qo34IgPE9Z3A==
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
Subject: [PATCH 1/5] arm: dts: imx6qdl-mba6: change sound card model name
Date: Mon, 20 Jan 2025 14:24:58 +0100
Message-Id: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_052516_503346_AFD7B6AE 
X-CRM114-Status: GOOD (  12.30  )
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

The card name for ALSA is generated from the model name string and
is limited to 16 characters. Use a shorter name to prevent cutting the
name.

Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
use the same codec with the same routing on board it is a good idea to
use the same mode name for the sound card. This allows sharing a default
asound.conf in BSP over all the kits.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index 8ba3ec27bee07..7b2bad5f2f0ba 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -124,7 +124,7 @@ sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_audmux>;
-		model = "imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&ssi1>;
 		audio-codec = <&tlv320aic32x4>;
 		audio-asrc = <&asrc>;
-- 
2.34.1


