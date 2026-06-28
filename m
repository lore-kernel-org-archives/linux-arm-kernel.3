Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AA9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 20:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVw92rIIwsB+/dRIhQRFa/XtQVyju/v7TrbT6PfzFSE=; b=NKsz8DN7auPtVZqMNVzLYGeI5S
	K+D2AmbKQT8OuR3kvHiX1vwzL4WhjkDkl41XH9nXsyHm8GuCdQ1SHRoDqd/1GC1hJd4qha81M4fP7
	GCHKWPf1JdU9nOJb2WwlendhkvV8oR0clmdVD92sqD8Kmymee9EofVwyar6ueUebTIBd9dYvRHjtd
	/9/gVJ7NIZFDhzvocalmoeaf5PRaSTJInmf5Ue4e5rsYcJgm2RNX1z1sgSvOOPFyTBN9+VR/YPIOu
	uFM1dh6uvcrHbs31gQSSeYWuJSyozynRbOmXl+g17BE/YmGR2RWuove38/egsboMBg6zo85UTCvd+
	NMZ0syog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwYF-0000000DNQ9-1bIM;
	Sun, 28 Jun 2026 20:56:27 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwYA-0000000DNNp-2aAd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:56:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4704d652e9cso809298f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680181; x=1783284981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVw92rIIwsB+/dRIhQRFa/XtQVyju/v7TrbT6PfzFSE=;
        b=kmesJ063Ia0t8poF4ppruShyux7IORADvwEgCONJ+fR6sP/BQ7fjpqy/q82/EPKTT4
         kFJRN2VRI5IoyaSrYDHE6X0My64yRpvKUab3w7z7LkdhXkxKY9ElK7DPOdzBKZRJAFZ0
         oNVGQZ/bJJhXU4xvMUiR8g+RMh2zkONpJybzlHMmNZSSMV4YzkADG7KvsQ7NqgBs+k98
         KgGHPpLJc7F9dXt7TmPBx+eFJXlfos5vw+Km0pxeJeoTquvY0OVgSCFgS+q9Q1rUrEWn
         GT+lfIoX9TCpeKZxxZwH9rXI0C75DGsMkrJis9UadpQurN9mVSmbW9B1VZh0h7joCZwl
         /DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680181; x=1783284981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVw92rIIwsB+/dRIhQRFa/XtQVyju/v7TrbT6PfzFSE=;
        b=EXnnrPS4cuBo4jZK0IU6YMiFskswDInLc660bBfq/pKTQ3uWYteAdbTlLSbzbfGAYF
         lxVRMCwkxAWEbxHEW4SXLrNMcrG0AtZwPNHxA8vnzJBFlai3ll4fVnqt+Lp2pq4YWB1T
         B3aHSK0oTwSx8qN5k9p8TgKKtK5T6/a07oBOjAnaUkMvXkhDWRA/tOvTYH6bYge/luQf
         FdaSZAZVy50b9Yt68b74K6gvf4MuRbwIVflrRcyO7SoZ8oqhjHwz3W5JvL8ChuE6Td5e
         t4VHiWO1zP6kFwDZQVhja2i98hvxeT20Aoj6TIo9kcnIKOK+QQE3JZdGugs1fICOd5Fd
         ihgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLaXqxTUFqb4n0jNdsJmDOyM0j21w3vqK77OiM2FQSnejix1MUKwMadN/fiQ5xcJqYTmzbFVbQeqZ3df4OCYZJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwS6oCMeU52RSt9u7blpbF9qoqcV8NEvB7hm/aQqxuyIrNpJWWw
	MD9Ox3dS7nSjGHGJ0GIlPPakTIBJAHbIa2MvAN8TKujtiWEBJKAPkXtv
X-Gm-Gg: AfdE7ckuDPLJp6MZz1pc3zx3fKOXgdg7cFG3SpE1hzDR0+J5S/p6RauDRs51fELgYFC
	4/m6D/szqE57RTVA4xONq6GBX6KCe+OHjoDgWei8HQ3YaRJ+ej+zTBtP+4YvvRIMq50I6T+0WiN
	X5PYfrzmDTmwzDFvYQ3L5oApAprPuGtWkdfwf/Ald859XX3GxjLWyEkbnfPG8LjvDD44q9b8fZy
	Kg1HtE1AB8PgNO2m5uPgnnV9zRhOBCsdfXoXoWsdY/GcRsEl9Hhn26LFZ3HmP5VwWr/2WJpKTSm
	MxQoKgu6qmpQYeuWfiGgd1q431Qad5cyqYYDGV79BinqW5xf/I/V9vWj3tb45Spl1Wl8bwjtkR4
	86tOgQZkiBGAe6/gCr4cMW9rOB0OqsAaW1eMYRORq9q27l5RlFltvHwtB8mWtsSxdlmZ9E/ABlb
	pRSSvkn5+OWU73fyETBkFyJMVNvFPWkTsux1di5mgp9x85GZptL8Bf+BnkO39TlkTmYJuxY/bIL
	KB33sierReezZALHQzd7bxoi7snOHIi3Fam
X-Received: by 2002:a05:6000:1881:b0:460:3234:4472 with SMTP id ffacd0b85a97d-46dc1b9c1bbmr23489048f8f.40.1782680180424;
        Sun, 28 Jun 2026 13:56:20 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:20 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/4] arm64: dts: ti: var-som-am62p: update audio codec configuration
Date: Sun, 28 Jun 2026 22:56:06 +0200
Message-ID: <76e49b33e7810b7cf6452cf827d88b5d0f04ba3b.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_135622_673372_1F714435 
X-CRM114-Status: GOOD (  12.72  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Update the WM8904 audio codec configuration on the VAR-SOM-AM62P.

Set the audio reference clock rate to 12 MHz and add the codec DRC, GPIO
and DMIC configuration required by the board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Remove wrong dmic property

 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index ca2483a04b9d..8a8dec80cb30 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -152,7 +152,7 @@ simple-audio-card,cpu {
 };
 
 &audio_refclk1 {
-	assigned-clock-rates = <100000000>;
+	assigned-clock-rates = <12000000>;
 };
 
 &cpsw3g {
@@ -203,6 +203,23 @@ wm8904: audio-codec@1a {
 		DBVDD-supply = <&reg_3v3>;
 		DCVDD-supply = <&reg_1v8>;
 		MICVDD-supply = <&reg_1v8>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
 	};
 };
 
-- 
2.47.3


