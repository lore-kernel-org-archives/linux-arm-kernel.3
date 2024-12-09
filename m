Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71306E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrBMF+uepwwER16iMh3Tc9DMPJGlXiQwEYl2Z21Ai0s=; b=AEfgJdFgr/X0QFvb6GgzHOWFJm
	oXwgv9yFG+1LrrchO9ZCWRc2noY+YosgQWtLM3XfzpqFUy53KYuUM8Ykg/gvKYrdN6Bc0pyKwsuae
	bB6pU8bKKVrgXSR4rtGzKs0QzXYqS1XUPL6Mz+8JWksYW0X7OAUPPR2xgranOXQb/UXlGCY+45e6I
	GbBVCHmmP4WV7pRgOCYf5i9y4Yryv2a/c/sq4lSCEbUmB+vlomxBcj2jcbkvXRtJVD9w5YGcazEKd
	M8ZRA7ioFtGfchrlyUgcwEegj62NlF8b2FPq8lkmrRy89u/59PuKgGlxNNxoLgP3NjqtwaNvg77rw
	6Hzn8E3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKann-00000007FGo-3dES;
	Mon, 09 Dec 2024 10:15:43 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaRO-00000007A1b-3Uz9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733737954; x=1765273954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZrBMF+uepwwER16iMh3Tc9DMPJGlXiQwEYl2Z21Ai0s=;
  b=egEzgqaJBallkxkTUmfahNYBhgKBB9TZmwIl5QtWWVTn2aDjW5B/XiTe
   0OSyjlZ/oNPBhCQF04G0QOVgzg/szLXirukxsOQO0+qxzu/xI4bC9mVFu
   AQarlh1eLpeQyAB4ZthnMiGLCkIHIWhbzGr90/A42K9pvPMelLZ6f/BDU
   HF4dPMebqr07KS3TFfGY78TWBFCyxkwI2eFwDDTYaXXKF5+EeoTjTy003
   G4v7AAyGbSRH6CxUwkIOOhui2QgjxDNBA033G2H9scs1FE2glLhJiV6iK
   epFN8tmsFsPFZSoiuJpCsKbNRtMp8RZyMOWq/+J0w+07IRN1p3KLil1k6
   g==;
X-CSE-ConnectionGUID: oSYvtfyuSkupLwQwn2bcpA==
X-CSE-MsgGUID: P736M27rRyyQwtveoRH5tg==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40481353"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 10:52:34 +0100
X-CheckPoint: {6756BDE2-3-90CD5875-E0265C0B}
X-MAIL-CPID: 2739E13F82B87DEBC461CF3D2DF1E092_3
X-Control-Analysis: str=0001.0A682F15.6756BDE2.0052,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBB231665D3;
	Mon,  9 Dec 2024 10:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733737949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrBMF+uepwwER16iMh3Tc9DMPJGlXiQwEYl2Z21Ai0s=;
	b=YPb8j5r8q9X7Ign/5O2ob7Dy1VXmGWAUQQq+svfw21q4+m5uV8xy3JCtN2xPuQqk6VsICE
	mOrPfhxtI7pTm04JaXAh4oPOYYc8qOfvWRunVDyI49ajx3ZOZyfYII/6FMN8z9uZfuCBOR
	kN+8PmWgq4w2jH3Xbw+Hkn/Gc5pmM+L+U99ibqvPo7bljuTR7b5Bai18KT3lj6d6d7bu0f
	q6Ta9ndbaChjPQWD5gQ4Hr09XDRCTIUy1qHdbfcbFE66c6GKFU1LSd9U72SAmiMab50fAZ
	g+O2TIzvenVSPVbPUutkUyyPH4HDL4JueFqinM3iO5LtfS4U+pyby4NgL9vSbQ==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>,
	linux@ew.tq-group.com,
	Dhruva Gole <d-gole@ti.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 3/5] arm64: dts: ti: k3-am62: Add DM R5 ranges in cbass
Date: Mon,  9 Dec 2024 10:51:34 +0100
Message-ID: <641475ca5720fcd24bcb41af36b69781a0a86df4.1733737487.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015235_169385_8C6420FD 
X-CRM114-Status: GOOD (  10.24  )
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

From: Devarsh Thakkar <devarsht@ti.com>

Add DM R5F ATCM and BTCM ranges in cbass_wakeup and cbass_main.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index bfb55ca113239..f01a594ba7f89 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -86,7 +86,9 @@ cbass_main: bus@f0000 {
 			 /* Wakeup Domain Range */
 			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
 			 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>,
-			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
+			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
+			 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM */
+			 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM */
 
 		cbass_mcu: bus@4000000 {
 			bootph-all;
@@ -103,7 +105,9 @@ cbass_wakeup: bus@b00000 {
 			#size-cells = <2>;
 			ranges = <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
 				 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>, /* Peripheral Window */
-				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
+				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
+				 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM */
+				 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM */
 		};
 	};
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


