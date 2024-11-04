Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB51D132A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrBMF+uepwwER16iMh3Tc9DMPJGlXiQwEYl2Z21Ai0s=; b=V6mqO9zbUyIlN2jpJoG3p+jFQK
	h8JYzjyz9NLsYxc2Yj0Puj9WKxkkRWCSENArt4sFqV135rU33mMPo44mk95bcXjvBe0PS7lXotGlY
	iO192hNmlOTZ/t74/f9sYRdgB2npxYiGODdzCYyRI9/EAAaZUNYkxRL/rNdvJAT8Q06cjKwlobfv7
	HPk+xYkLMlNIlffdTkKeh0rmGUQ9M/0AtF/RYxy5UDT7EpmThFups7hDRseYNe4Dlrs1qYzSbn/XY
	Ctd8a9jg56noPJ5MN0QquO4v5ZD9m+kjF18OX8xm3dItvBus1CLHHqQcw8HV9L6wdbH2B/+HlevxH
	dxbbjjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7twU-0000000DFWL-2QZw;
	Mon, 04 Nov 2024 10:04:14 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7thh-0000000DD9K-2Dui
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730713737; x=1762249737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZrBMF+uepwwER16iMh3Tc9DMPJGlXiQwEYl2Z21Ai0s=;
  b=khTS79nt0pCgez7XrwSjkCyvy6RAaGMYLCecPvQ1i02bR0YFpBHKfMoo
   Rp98mXzcvAcvqr8MR8bQQiQozSuPhmrF8+fqJ+D0i6fZ5gTd7AHtd/cB/
   zW0dz2np4sRJpWI2kHV3BMmotiYXo/rp6aMzESyms9H6TlgOnswlweJtb
   hkvEEzA3TZCrKohmu8tcRfvc1JBJrHjqBP7JP2rHM8HDr/Yog3nz1g9X6
   NR20uTUWVyQT2kNbZo0tbY+V7/pouxBG1sl3U+B5yRB9y+OhxI8YEkGvD
   d7SQuo9n9wRxvLgY22Mz6Ykee9Qq9KnexSey8LAS6F4VJxCvum/9SVaGp
   Q==;
X-CSE-ConnectionGUID: LIOKSFLDRy+Ivy51jVf4dA==
X-CSE-MsgGUID: VrCq4X79RkySfycBxZbAYg==
X-IronPort-AV: E=Sophos;i="6.11,256,1725314400"; 
   d="scan'208";a="39827144"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Nov 2024 10:48:56 +0100
X-CheckPoint: {67289888-36-1E10F2A5-CC0651E5}
X-MAIL-CPID: 767AA39CC074AF12199F979CAE3A44A8_4
X-Control-Analysis: str=0001.0A682F17.67289888.00F9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A58CD169DA4;
	Mon,  4 Nov 2024 10:48:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730713732;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZrBMF+uepwwER16iMh3Tc9DMPJGlXiQwEYl2Z21Ai0s=;
	b=elA341p4HCyIFuBhl+0BplAXOHPm8VFR87oZJNAGTqWPuS7EwnpFrbHasGHqx0vz+xUz51
	vUJ2zlZo40nDATGAFhhzEIvVsJzv9VuGo4lBAJKdDv9PSUWUX7k9mvgKkgI5puSKB47Mvt
	11oMrL4GO3l9J+I2VJTmsF/s2LBuDkx+iEUxoD13jRntqwQE0pZQc93OnNQxV4Zlm/Y6UA
	X8pEJJy9Zo7Fq1y/9b6/e8v69YWRLSpZXVvm0oIYtdiwAVh5KEB7Qfs6/tOsu0rhVVOmUO
	USa7zDwD3B4oJcN0F2mh1hInylX6DtNaku6cMLDP98xPYHE9cgX+gtgC4PT6OA==
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
Subject: [PATCH 3/5] arm64: dts: ti: k3-am62: Add DM R5 ranges in cbass
Date: Mon,  4 Nov 2024 10:47:26 +0100
Message-ID: <08da3463b14d51c620292d574c01d29901987019.1730299760.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_014857_765821_AE6D34AD 
X-CRM114-Status: GOOD (  10.81  )
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


