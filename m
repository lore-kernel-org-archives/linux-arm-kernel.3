Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B19EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cpStAr6k7XetnbU5fKbj58a2ZRw9CKJ+3G33iwY1+M=; b=IZIGBad2gkorlaJddVr+G0lXOh
	FUh1XFAsOenKQpNBvUTgW0eYyBGL/lkeHPPiNQ+Tha7uH8e97oorqzZZsBl84cilH8uGxrZWYFQT9
	vosHtFV1o7YCAkxqQ9UzovMNyk56NV0ln20wU0qG53sCypRZZFIGt1x7+nPOBlv51CmSKeIx+NRJq
	sIDnGC5k8LTOd9FS+S7neX5NMD6b8KAQY0W+q8g62zK8VnvExwzlO1AwdprqMBeGOoYroSJoi5OtH
	x+X/6GcUtgmFsOTbprZCC+G47p9E5Ay4vbbaWiDh8ABnuJZnTNfRiZILzil8ET2luUiNSLUlqfFcj
	/ZgaQwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1mR-00000005QaW-1GiC;
	Tue, 24 Jun 2025 11:25:35 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1IU-00000005McL-1Sz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750762478; x=1782298478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2cpStAr6k7XetnbU5fKbj58a2ZRw9CKJ+3G33iwY1+M=;
  b=YvZ4T4B6trB6Rn1jEYpJsWZSpXi/OEec86t5nvi77XchykFe2tGff5uj
   y413T/Fa8U9+EHUKRbGFhcVb/tzI/WVQqhnLkbGrT3rJl3AEqna7ViGzi
   6t1lQx25J5P3Nmpw7s65WXq4W+ZUpO876OOv9LaI/wvv0fY59VcGxX//f
   hkyR1jY4CX3AupM7OnqVpReUVV+0M59XGgV8tlEVDJalxotqHdj++Arh3
   z5CZ2znIAmXjL/fjjljx20SEnGQTo0dRnzSG/rAtGlDetQmGqRPPLQ9ry
   Kg9Tb0SH0Wj2coBjgAhdK+n4+v8N+emSQsefFGJNV8lNVcqNYmPGPS9wj
   A==;
X-CSE-ConnectionGUID: HsnVMn02TZKNlmym4byIaA==
X-CSE-MsgGUID: JkffxU5oTOOyULapxLFXuQ==
X-IronPort-AV: E=Sophos;i="6.16,261,1744063200"; 
   d="scan'208";a="44816899"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jun 2025 12:54:37 +0200
X-CheckPoint: {685A83ED-F-ABFC28F4-D6731B76}
X-MAIL-CPID: A25C1993D7B21E6C5F4D086DADF8A3C0_5
X-Control-Analysis: str=0001.0A006377.685A83F8.0088,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84239165D7C;
	Tue, 24 Jun 2025 12:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750762473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2cpStAr6k7XetnbU5fKbj58a2ZRw9CKJ+3G33iwY1+M=;
	b=SbnfxT7Ef893QSiAOwEAj4WRHi9CGMIPVPw0+jarCIUVMDi5tQGggIXLEIA08aQuIChHUn
	f7mBIWwtuSlkSaW4AhGak1WeASuzESsiZkpb8ARK5vidb+7nHPV0NIv83guJxPyVkWGAXU
	4e7qCLilOFhbPO/HOEQjE7JTrTF4m2GkqmX+EeVg+VFZn/oPb2gAy2Grym4GpMSWsr25U/
	DEb0fMTBJqlyrM8IJbnVnJffnoy1zj1OSMDx/04aMhXJo2bjGAD5aBrT15eJFzhjRRBJfu
	q9eiTdNBTHc1Q+XugRUaj5yjA6AZJbPD2HI1kdhSBxnJplUEji6GjISE7sBRYA==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v2 3/3] checkpatch: check for comment explaining rgmii(|-rxid|-txid) PHY modes
Date: Tue, 24 Jun 2025 12:53:34 +0200
Message-ID: <bc112b8aa510cf9df9ab33178d122f234d0aebf7.1750756583.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_035438_693358_3320A5C7 
X-CRM114-Status: GOOD (  14.23  )
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

Historically, the RGMII PHY modes specified in Device Trees have been
used inconsistently, often referring to the usage of delays on the PHY
side rather than describing the board; many drivers still implement this
incorrectly.

Require a comment in Devices Trees using these modes (usually mentioning
that the delay is realized on the PCB), so we can avoid adding more
incorrect uses (or will at least notice which drivers still need to be
fixed).

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 Documentation/dev-tools/checkpatch.rst |  9 +++++++++
 scripts/checkpatch.pl                  | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 76bd0ddb00416..d5c47e560324f 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -495,6 +495,15 @@ Comments
 
     See: https://lore.kernel.org/lkml/20131006222342.GT19510@leaf/
 
+  **UNCOMMENTED_RGMII_MODE**
+    Historically, the RGMII PHY modes specified in Device Trees have been
+    used inconsistently, often referring to the usage of delays on the PHY
+    side rather than describing the board.
+
+    PHY modes "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock
+    signal to be delayed on the PCB; this unusual configuration should be
+    described in a comment. If they are not (meaning that the delay is realized
+    internally in the MAC or PHY), "rgmii-id" is the correct PHY mode.
 
 Commit message
 --------------
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c2..f597734d83cc0 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3741,6 +3741,18 @@ sub process {
 			}
 		}
 
+# Check for RGMII phy-mode with delay on PCB
+		if ($realfile =~ /\.(dts|dtsi|dtso)$/ &&
+		    $line =~ /^\+\s*(phy-mode|phy-connection-type)\s*=\s*"/ &&
+		    !ctx_has_comment($first_line, $linenr)) {
+			my $prop = $1;
+			my $mode = get_quoted_string($line, $rawline);
+			if ($mode =~ /^"rgmii(?:|-rxid|-txid)"$/) {
+				WARN("UNCOMMENTED_RGMII_MODE",
+				     "$prop $mode without comment -- delays on the PCB should be described, otherwise use \"rgmii-id\"\n" . $herecurr);
+			}
+		}
+
 # check for using SPDX license tag at beginning of files
 		if ($realline == $checklicenseline) {
 			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


