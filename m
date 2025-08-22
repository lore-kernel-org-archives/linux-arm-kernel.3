Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB260CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP/DHTf58DTCbcNJauwgYR8Sundc+v0St2Rk8XfWUao=; b=emW8ff6III1HalslTv2h51gZA6
	gQIDMantMbOMgX55zD6q4OsQVvltLiYdY8+a5al4Cx4eqr64LG/TOngDt09Rrh5d+nm4PYB4UFLhz
	HUNEXJA2xbSZSp4cv01SDAbVj4UtHBUYSRBi1g7MXobC1+IFeqfEJa4jqsIn3SAKd3YhqqqmLloWm
	NcpGeFtgp3RN6JN77kGKPju3gbnxAWw6kCrXogwAkfXocCKIxHrpzUk60qiwzNdGEJC4H2+xrDKih
	x3obNi8LYbH43d8PBJLP8ty5btGDf+Os0d1vYRQHctsdOPZn072k0NUd/GvznxXNft/pyqoB4lvjS
	IRICUHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphm8-00000003zPJ-2Bb9;
	Sat, 23 Aug 2025 06:30:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRci-00000002b1D-3UG1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CF1F44EF1;
	Fri, 22 Aug 2025 13:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3180CC113CF;
	Fri, 22 Aug 2025 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868564;
	bh=vkUXrJvuvl2RSVFcKK7WtTrWq1T1uZYDD4RoHq5N1YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uWJc1YJyV++CB6Cz/TtTfrUhPVxNTPhUIHwKHIqqqCwqoq0Cu+NCpZsQ06uzxwpGH
	 t2pK4FO3dSoxR4bl64qP37S02+9W225g3zCubi6+4UdJ+O1ugoerN/JFbTWktR8/eT
	 C0kztRChb0sF/vXxVT/H8KJUci/gCH8hs1LSuneCrtZv97s0C+FYdkYi9tbUD3tPRW
	 0G80+gjtUZr8vZl1t9WCCbOSgdal6n8CySlIGa+lFkf4nf0gPyWED6+qelg9uhFz1U
	 90iZ2ZAagMmitsmil+aMfeGIYWkBe3zDcd0dlX8hIqwBzz96PWvZ+IGVKXQIe+5GwV
	 +WF68Rx8T4eAg==
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
Subject: [PATCH v1 5/7] dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
Date: Fri, 22 Aug 2025 15:15:29 +0200
Message-Id: <20250822131531.1366437-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061604_888714_BA97E9FD 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

The Kontron SMARC-sAM67 has the same nvmem layout as the SMARC-sAL28. To
To be prepared for any board specific quirks, add a specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../bindings/nvmem/layouts/kontron,sl28-vpd.yaml           | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
index c713e23819f1..afd1919c6b1c 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
@@ -19,7 +19,12 @@ select: false
 
 properties:
   compatible:
-    const: kontron,sl28-vpd
+    oneOf:
+      - items:
+          - enum:
+              - kontron,sa67-vpd
+          - const: kontron,sl28-vpd
+      - const: kontron,sl28-vpd
 
   serial-number:
     type: object
-- 
2.39.5


