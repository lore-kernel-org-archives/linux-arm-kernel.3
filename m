Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F046C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8/ydxRgcdYRL7f64fKb27vbnom2TzUpJVder2TaeJE=; b=tR+uGnmcCv7I86TAAUL3zkDF/v
	ZDDvSmWXi8UWViY5WDSamqp1tfxcrvdnzVyqwIph1ytvhhny0/EeBxDKnjcWW374O4DN8fcQXZCfX
	impqfUQj3d7/y7Aw5txv9+irH+8fCe2b9CNMvZ8EdtXhcAidV/2vCDeaLHXi25jZC+AX4LXklqRHv
	f9/FQ6MyJo32cLPHf8LFH24HZl1SsHUb4zs+EcuG8jOvmPYpDZsr3bC/eIf0BT0fLTtQ7RTXjXNHC
	t/qV7IerPc5r+kBTlkfN878v0TORebG6f8NSNqbs4Vn72zl9qu1lpEMIJ61CpjvLnciPI/Pk31SnH
	j48dsiKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaEr-0000000EGEI-0uNU;
	Mon, 24 Feb 2025 15:19:21 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZwc-0000000ECZH-2NFr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740409230; x=1771945230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e8/ydxRgcdYRL7f64fKb27vbnom2TzUpJVder2TaeJE=;
  b=VqJ8XJQoApmpDc22FBVUt3aVnedP8OUAkXEP+nBu44R3Ni8f9WW8aC2S
   B3khQAQrYHAAZ1oMIP9wn82AnMmikLLSqeBkzbZwP1IO9t1LeahNe3nvu
   1R3XEjAKceIC7Joa9YfW0TfLaGJOfULUZ6Ga3yUU/AHK0rp85gFKmdsti
   xBAftNYqHnGJ9hQpcCZCKiqoSWU+THPAC5bXld1MypAOcgMonXHNln6G4
   IRa1vk5DXy2zv/VOyI4UCJSs4nLtlgEWKVN50X4LstCLADajoxqtCRJvr
   BepTx74BIhVNEReAXmYoUlvXjtESi2sTjSsTy2LhhUcf+sClFh4reBnDR
   w==;
X-CSE-ConnectionGUID: GtB3/u73ThO5yGqLUAfFVg==
X-CSE-MsgGUID: u8ZSgRgVQRiTH9FfvFtmtQ==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42043008"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 16:00:29 +0100
X-CheckPoint: {67BC898D-59-F75C4246-F0BD6D90}
X-MAIL-CPID: 061B8945113C4A86B8FEABC2A0018200_3
X-Control-Analysis: str=0001.0A002117.67BC898C.007E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A53BD166E70;
	Mon, 24 Feb 2025 16:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740409225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8/ydxRgcdYRL7f64fKb27vbnom2TzUpJVder2TaeJE=;
	b=ltmyAaFQZ7yPxaTU7F0jRIPKVy7zPrZh0mMUK5o4Ly+IYj6cgVXUNGoO1e5fkFDmN+um6a
	8ZeD3YC6P8EKnpLca8+gkhE7mIdDP7HrZbqZ8PtI7LRlfu0YkG5At5MDmjI9DPhz2CMny5
	Wo1z1tmVdw8fZvPqD6gX/smaUc8eJITpt8/wz9Z06sAgPnWHs+dFR0qtJN6SvFK9YIYCp6
	lrmxfDJsAbQ6SFi9N2VZPoxuNoq4dj9XkulULQojMWjhblM1t7+7lvD2KLpErLXIchqy8g
	VobIKQpah4fNk7xb2ZhBkj2Gm2pdNZYnb1fioxoTJKXffcR8iUUCS4XP8loC0w==
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
Subject: [PATCH v2 2/2] arm64: dts: mba8mx: change sound card model name
Date: Mon, 24 Feb 2025 16:00:15 +0100
Message-ID: <20250224150016.499055-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224150016.499055-1-alexander.stein@ew.tq-group.com>
References: <20250224150016.499055-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_070030_900835_6A92CBF1 
X-CRM114-Status: GOOD (  12.91  )
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
use the same model name for the sound card. This allows sharing a default
asound.conf in BSP over all the kits.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 58e3865c28895..7ee1228a50f4f 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -138,7 +138,7 @@ reg_vcc_3v3: regulator-3v3 {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
 	};
-- 
2.43.0


