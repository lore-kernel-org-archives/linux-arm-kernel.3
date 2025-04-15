Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687B1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3mgdLsAzzZaK/mOx+qOWZRMUeWUqc13Mm441pFDAiY=; b=DNJARzpHJFCljJHoai5lP8dxwj
	mubCvZCHz/4PZExaaHHyRwV9E1/zko0d7zh0QLaTBfeRRf1qDHNWZabfVe6BR2sA08FR+ZS9Oo2pY
	HemfU81QJgDKN+BUkn2UnIt6qKUXoAu5W/jmPNMxfumleloMeauGZMy7P4c3YNRgML4D++x0ceQTn
	8AVJHNQKXO1GLAkUTvl/Zt9UpO9oZW92MaruVzHsz2/I5UCxa1kqrl84DkiQaOABNPd96LBmyMjsp
	nEfAKbsuYkgqhHQDNgzrIJIZf6TFYrlVqm6UqbTh5hJ8bjc52ySu4H9OiWqZ9pkDONRRII+i9/Tbl
	0satU9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4daW-00000005LMy-1FkZ;
	Tue, 15 Apr 2025 10:32:20 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dNw-00000005Ioc-0IlW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744712359; x=1776248359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L3mgdLsAzzZaK/mOx+qOWZRMUeWUqc13Mm441pFDAiY=;
  b=kPN22pZXr0yjR4y2MofA2Qy7xHS6kAHJfHZ9YlaIgYxsLFklfLTX0oQF
   CvFee56r0/lFhqagoL1A6Ib54K9w688fUunwYNOwHhrg4I/hnzKMyKGcR
   H8wURW4AHcqekHjTQ4ZpiY6IT3FHNZ56dILM6rhDUT8JWO6+gETtUHq6l
   DGAQsnEAkeH4aNl/qmRtUNv19t37/C/ppsHNfNv/82T9b2ws1CIpiPCvz
   NLbvdZxPgXIc1V4KM1/Z8eDRW/JufRhyAG13Pg1pmx7RH8LJ4Z1YSuRo0
   bNJiHLg5wIsowUNCgyHht7SG3je9lDei7tSIcaaEkbElAxXufh9cYzVON
   A==;
X-CSE-ConnectionGUID: IwmrXv6VTCSAI3p/xks4FQ==
X-CSE-MsgGUID: 3bL/W/GHSWOL+S5bi73eFg==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43537792"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 12:19:16 +0200
X-CheckPoint: {67FE32A5-B-7141A0B0-E6EDEC14}
X-MAIL-CPID: 5C0A9FF98528448249FF1B25666F25D4_3
X-Control-Analysis: str=0001.0A00639F.67FE32A3.002A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB06016489A;
	Tue, 15 Apr 2025 12:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744712352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3mgdLsAzzZaK/mOx+qOWZRMUeWUqc13Mm441pFDAiY=;
	b=KS5my13jufA8VQYzVUolMCKej6Q6tnssyGOSXTJ5vvYPOztf4WkrwHSB161oYHAaXSR5Di
	LU0epMxqooehsceu3dwjHl2Te7f8qmll6KsaNXzfcPOEmAqcr1APAsOPDup/VWeZu3J2r/
	VRahVBSu+/J7QqeEoucuEShtkKDdob90Qex2OofXap8YdqpdwwUollbCo2cVBlYfg7pwHz
	FYpxJD67+pTSdEZpd4q0U15HUuNstBYn0YdDGFZ8bIfRgFGO2nnkHeNh+t6TstazSpGo2G
	o7a0U9Ac5NsiMfKrEJn98eJefYeWxc0nD+814nZJxy9Z6c+ckH30du2wfZIj/A==
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
Subject: [PATCH net-next 4/4] checkpatch: check for comment explaining rgmii(|-rxid|-txid) PHY modes
Date: Tue, 15 Apr 2025 12:18:04 +0200
Message-ID: <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_031920_275636_44B2E101 
X-CRM114-Status: GOOD (  14.16  )
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

Historially, the RGMII PHY modes specified in Device Trees have been
used inconsistently, often referring to the usage of delays on the PHY
side rather than describing the board; many drivers still implement this
incorrectly.

Require a comment in Devices Trees using these modes (usually mentioning
that the delay is relalized on the PCB), so we can avoid adding more
incorrect uses (or will at least notice which drivers still need to be
fixed).

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 Documentation/dev-tools/checkpatch.rst |  9 +++++++++
 scripts/checkpatch.pl                  | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index abb3ff6820766..8692d3bc155f1 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -513,6 +513,15 @@ Comments
 
     See: https://lore.kernel.org/lkml/20131006222342.GT19510@leaf/
 
+  **UNCOMMENTED_RGMII_MODE**
+    Historially, the RGMII PHY modes specified in Device Trees have been
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
index 784912f570e9d..57fcbd4b63ede 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3735,6 +3735,17 @@ sub process {
 			}
 		}
 
+# Check for RGMII phy-mode with delay on PCB
+		if ($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*(phy-mode|phy-connection-type)\s*=\s*"/ &&
+		    !ctx_has_comment($first_line, $linenr)) {
+			my $prop = $1;
+			my $mode = get_quoted_string($line, $rawline);
+			if ($mode =~ /^"rgmii(?:|-rxid|-txid)"$/) {
+				CHK("UNCOMMENTED_RGMII_MODE",
+				    "$prop $mode without comment -- delays on the PCB should be described, otherwise use \"rgmii-id\"\n" . $herecurr);
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


