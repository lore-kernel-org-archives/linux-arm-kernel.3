Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C36606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QjTaT8Gt;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=F62jzXyu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YpZccUebiwLvkcSt+36evL7VK3urd4ZWtr16WFWktIc=; b=QjTaT8Gtl7IEyi
	FvbvaBupC8FzVYnaHekQ5zYemMJNVEIOKWPSDMcZaTFZIuxZlddT7z7G55n61QT57KwCdwFJUHoHv
	PrRqMdGYi+PY4eCZujL7CcisiEkMCu7XYonK6X+b1x2+mZowZs6xfKM2H44/7pFQDIO0fL+BMGlQL
	Jx3yB5H98J0/Q96s4iSJbenWHDO8yCnb65uGCr6SK231bWdgAAurRokHEY3a+6WQg8rSrubVsq0zy
	0U/dfmopr4HBlbB5p0VDQGd4tpNVd7VDs/cmO2yiNV4Qv+5TtMVRmgd0SYgYVPzlVfzBsA8iI61mb
	+9JtWrzIeML/hZBTkugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwHj-00000008qbW-0Iv7;
	Thu, 05 Nov 2026 12:09:39 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwHV-00000008qRT-1Jee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:09:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6902149656B;
	Thu, 05 Nov 2026 13:09:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793880599; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YpZccUebiwLvkcSt+36evL7VK3urd4ZWtr16WFWktIc=;
	b=F62jzXyuXB1IS5lwHAwrMrIE0XRsNhJi3/xuJnYTq1IRIieM/PkFMxbt2YQOGsnIt5tbb9
	cd+zbKrduazgcxKRNX0xvZIVIFSpr0Pfoy16wQC0k1RRvJECrouaKFN10BXoEFpLoka1Zt
	Wahzdo4/8MWDil/SR6pJPNY4/hEfvjVQSO/vx5EJExtKYuVxyMTvTRrE8vjIyN00P6VjY5
	dICpj7qo9ArhN8Z9YqJMwvLTpvuQgWaWNB+mWCKgkRlrm8TRfeGmeup0th7gS1zXRsueX0
	EZnybYX4YZzTvOuyyb+y5D71Jf8fa2LBdbazL7kCFTItBJux+fIoElsk1L8iBw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 07/16] dt-bindings: nvmem: microchip-otpc: Add required clocks
Date: Thu,  5 Nov 2026 12:06:43 +0100
Message-ID: <20261105110715.2486432-8-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040927_772164_E923FAB8 
X-CRM114-Status: GOOD (  12.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The OTPC requires both the peripheral clock through PMC and the main RC
oscillator.  Seemed to work without explicitly enabling those clocks on
sama7g5 before, but did not on sam9x60.

Older datasheets were not clear and explicit about this, but recent are,
e.g. SAMA7G5 series datasheet (DS60001765B),
section 30.4.1 Power Management:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Confirmed by Microchip based on vendor internal documentation (see link).

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Add clocks to the required section of the binding (Claudiu)
    
    v3:
    - Removed clock-names (led to confusion, and not used by the driver anyways)
    - Removed redundant example
    
    v2:
    - new patch, not present in v1

 .../bindings/nvmem/microchip,sama7g5-otpc.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682e..bef0246a79f16 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -27,14 +27,22 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: main rc oscillator
+      - description: otpc peripheral clock
+
 required:
   - compatible
   - reg
+  - clocks
 
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
     #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
     otpc: efuse@e8c00000 {
@@ -42,6 +50,7 @@ examples:
         reg = <0xe8c00000 0xec>;
         #address-cells = <1>;
         #size-cells = <1>;
+        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
 
         temperature_calib: calib@1 {
             reg = <OTP_PKT(1) 76>;
-- 
2.47.3


