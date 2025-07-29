Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04034C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 21:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJ4rOAtMjiwSvK3BeKtpeLgPAvhclObv4HE99KIDdoM=; b=C/O19FJV9F57ux8JwaEKyH7Aet
	uNvbRHhUrxw4TWLpgmyO3YGyPmMBgMK2p1iT7/kNaemMiCCOmOwrwSa3jl72UPozsg+WtJuLm6MGw
	MSrw3YpuPs/xJ6vnMvGtAEfSxUdDom+C4sGTdNLHnAyXeY3QmSARvL/W+2qRkD3N3qc3piuyK4CbO
	b9ravUBeJuX6VgEe057zvsFUzcJZ5PSBdzMBp9tgc7s5/dLmHBYy+iHcE+KagNBNJ1fumTPOulqgF
	qI5Mt7EwaPhDP9Gz8BMRy5JAWp6kLPkSvJWWPW+Q0PjkGp/PWGcjyQQ07jTdLtnBrU4imxG9rm83a
	61bHpfIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrQg-000000005c8-33XH;
	Tue, 29 Jul 2025 21:00:10 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrJN-000000004sp-2Sfz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 20:52:39 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 494CBC0003CF;
	Tue, 29 Jul 2025 13:52:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 494CBC0003CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753822354;
	bh=B1GjCFdZePkk9UeGd4mGcZnBu7IW/DNI7O5djpAHT7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ME5Xm7qtzSSjI/wyYZ/tli8EyollOzuxwlI3CUnhMrSbomUzS9l0aQfTsWYvvSUkD
	 1vi7xS78ZwqXqpUdE49XiAh+xV3Q+V0NTLWE3OsWvCyyZHAiSD3lzbAnUvts5+0XMo
	 Wh5tGyeKsKBXkfwevP9moX2iEKIJccp1u4q6jETo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E42C018000A61;
	Tue, 29 Jul 2025 13:52:33 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 1/2] dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
Date: Tue, 29 Jul 2025 13:52:12 -0700
Message-ID: <20250729205213.3392481-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_135237_699073_67C89F6E 
X-CRM114-Status: GOOD (  10.28  )
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

The older MIPS-based chips incorporated a memory controller with the
revision A.0.0, update the binding to list that compatible.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
index b935894bd4fc..3328c8df8190 100644
--- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
@@ -42,6 +42,10 @@ properties:
         items:
           - const: brcm,brcmstb-memc-ddr-rev-b.1.x
           - const: brcm,brcmstb-memc-ddr
+      - description: Revision 0.x controllers
+        items:
+          - const: brcm,brcmstb-memc-ddr-rev-a.0.0
+          - const: brcm,brcmstb-memc-ddr
 
   reg:
     maxItems: 1
-- 
2.43.0


