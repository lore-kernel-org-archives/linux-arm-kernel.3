Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E521BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 13:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62kg7EpBQjINxHjvuuwUC/l4ka3K2AOXJOa+OBonMKw=; b=HIEhASRI9/PSWDEYx1Z/zTM23q
	bJWYdD6QyQ9GI8Wfiwkg2/jI6F3GY20qeYJWMbmvXArZi6fmzVmM9jzxlCz/iticNEuRATGvpoP//
	UztEPTDhWZ1NDueU1S/03B4PIBAmaS6O01SdQIgYdx1ioaY4g+Y9VVgyhHtv94KA+ET94AoHMdZ+V
	24fZ8B4kyuRckm6E0/bejlqWoty3Q4ePMq7M312chL0ossDgwm68+nFu85o/pph83GZVV/rWziqFm
	xzYllTxoGRt94GXgVIGHcG5zaxM7lGjxcsTY37rvnGFylWqLAD9uYDonTILIuNsZrXsfyA3ysi50Y
	q8sCJQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrol-00000005fKB-3LQ9;
	Mon, 20 Jan 2025 13:27:51 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrmH-00000005enx-40Sv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 13:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737379518; x=1768915518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=62kg7EpBQjINxHjvuuwUC/l4ka3K2AOXJOa+OBonMKw=;
  b=ZkAAcf9hUyCrBgsJH/A4aGRcLR6gF5T1Ck6YYeeNqyjLjW+ztcXpYGeb
   RVafIAdtUqYOt8mEINE3h8lQNnyXmnct4et1KEForgwQIpYg35BtZaa+d
   uQ1eGzATUcmJyCWBqqM+VH6zRkOgFogehjSSES0dfMoTSKYkq3/A92zho
   zoQdGRAjibxNfkec/igN4Yw6idl0/zeE2JJzzwZn3sDJmfTmd2mxM2Xh0
   I7ehhQqk1CFxtM03yGMSUsT8Ey2sBEQmPARnO4mFdIXjy9aRrPtFCz5kz
   2Bkg7xQ4hvwv+7+KqKtxBB4arRj+OjNwXez0axoWcGqn2L/FREll2Moo5
   w==;
X-CSE-ConnectionGUID: vJKdMvUmQZ+I1OIzU1z5+w==
X-CSE-MsgGUID: tNHpwoO0QrqNYrhfcuCJXg==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41177840"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:25:16 +0100
X-CheckPoint: {678E4EBC-E-31397509-E321C4C4}
X-MAIL-CPID: 20ECB963B1329CA933C8A2EE1026F022_0
X-Control-Analysis: str=0001.0A682F1F.678E4EBC.003E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EAE4161460;
	Mon, 20 Jan 2025 14:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737379511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62kg7EpBQjINxHjvuuwUC/l4ka3K2AOXJOa+OBonMKw=;
	b=R/vecpW2z8/EyRmq+gjB7rIc72cV0QLajZMZjAv9QfaL9/JKTzkyM4jUtiKHSgwYE1YkZe
	8KvF33mRpc6Axyxy4Hk/VzimE/hb4QbDDXgQKF9sHHCLDMqFv5kaVHgq6oTZDwKKWBH/nB
	CqbcoSCYSem30EDt8sLKaYB/16PWxNB/9CddKXCbR/e9gJ/Lp369aJnT0YTxvJQYz5D3Lh
	E4PvJi9sA/m78+PLJyx8DlU4+yKaLyzuHLNo3PTqT93mpwz8AYgt4k1lTlyM2XQVt27dTG
	/QuGNRy9Paz84Gzpp7FuBSHWWdwd2kBE2T1y+yomO1CTObEVdr92Xsl+WaBLvg==
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
Subject: [PATCH 2/5] arm: dts: imx7-mba7: change sound card model name
Date: Mon, 20 Jan 2025 14:24:59 +0100
Message-Id: <20250120132503.556547-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_052518_300575_8129DD3F 
X-CRM114-Status: GOOD (  12.95  )
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
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 98956d78c9a18..954739f82d86b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -238,7 +238,7 @@ reg_audio_3v3: regulator-audio-3v3 {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic32x4>;
 		audio-routing =
-- 
2.34.1


