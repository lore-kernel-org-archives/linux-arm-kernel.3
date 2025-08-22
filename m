Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3E1CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuCWXc551jP9/CTapflI64ev+xSiaxnhjFIjDMHW8WA=; b=oQlwali2V3Dk/24fT84EDN4vHI
	Rirk1oWhz36m4lMVnmoO0B2pUgpGTeKbAr00YLRdI5n63H3dDmSuskk+7mXoum3v3ACKEaZGun/Mk
	pmJU5SYV51oNcUoJSH1C1u7+izZNbMgs0Dv0y4I+ZCtetInZvYFwuvgr5p3NVL07BwKL9dvEJGubw
	G8cab2Uvw1qde2xauD/znxPEqpXjNjjFTlQLP79XVpWAM2hD2GMMW5ZGXt3E6zqBatJlM+hTlBB01
	9TURD4LIhIY5S/0fyFDJFTlCPzwF7JBiYJxwnsFm41BCaQgAsWlPLrUv8EfX3gjtaczRh6xpGb6sI
	cjZpQkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdq-00000004SEA-0MhC;
	Sat, 23 Aug 2025 09:34:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRcf-00000002b0n-3ZtY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1779AA58A52;
	Fri, 22 Aug 2025 13:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81802C4CEED;
	Fri, 22 Aug 2025 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868560;
	bh=pI+PMnpowITNEY4uEFepulTLvkZKfkdPFKnomSd53g4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tDgv7D7I3ypU/cZ863v2Z3/VmVIsgxI7gXlZtLqRkqo+9NC2Z1GtKAhWkm+eX/FgM
	 SH/cDX0ltWG8Gkj3QdFK4n9X3+oVET/rlA5Ab790Yfe9ZDAVrxO0AmFxbBBrLXSRRc
	 NIjv/XK0qLeDBvmgaMkoMlrhm5WuKqOCVnJl2dHW9V6W4KbgRqI4w6UJqtug3LCOzF
	 HT4LvvLKFKoSHkaCoJhnhFiRb237R44HESMNhaNDkeBtlz3qBU3VjPRm56EPTfgOH4
	 bx2KZOd/nJGEk022CJ51QmQ0H8GwhEt2LQu3OpvyGan2X0yLu1xnBzaH4/aRHmL5NL
	 Pl6/lusyR6AEw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 4/7] dt-bindings: watchdog: add SMARC-sAM67 support
Date: Fri, 22 Aug 2025 15:15:28 +0200
Message-Id: <20250822131531.1366437-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061601_954374_EA957DBB 
X-CRM114-Status: GOOD (  10.58  )
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

The SMARC-sAM67 board has an on-board uC which has the same register
interface as the older CPLD implementation on the SMARC-sAL28 board.
Although the MCU emulates the same behavior, be prepared for any quirks
and add a board specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
index 179272f74de5..b5b624e85468 100644
--- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
@@ -18,7 +18,12 @@ allOf:
 
 properties:
   compatible:
-    const: kontron,sl28cpld-wdt
+    oneOf:
+      - items:
+          - enum:
+              - kontron,sa67mcu-wdt
+          - const: kontron,sl28cpld-wdt
+      - const: kontron,sl28cpld-wdt
 
   reg:
     maxItems: 1
-- 
2.39.5


