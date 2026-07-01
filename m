Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E354C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCjQpneLNRBCiuygsyfB7UCIbsXua9nygQEyYm86NNo=; b=HQGr1Ms1shCfqN3P+U4G/WAxa2
	xw7BUD8NEJ+vlUFDcA/4Q7H4yB45ZL3UBRzqcPz2vwrh8FInmjfrVjA53XKwyYXqusrtERms1eyPT
	wJsgtBGCjylBbXBamNEypu1yE66K4/OslCpyTI0sqkjXJF78o+LnyHkc5oPDcnFkIjecHcw+Nd6nJ
	DOXk3j35Ivb5/QEGnmJ6bnS81/SSkigwCPA3OJR5tD64BbzGBIPsixYVY3xrp/GdpLARKxcX5iL5z
	0T221bKC7OWgauSRPOu8mdmn8mVdtb/eX+c/D7+NmB4ujGnDeBfZOQ8eAxEZN4wDOGMoKJFAichqG
	6hLF8JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqcF-000000014zE-2Czi;
	Wed, 01 Jul 2026 08:48:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqcC-000000014ts-1ZgV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zCjQpneLNRBCiuygsyfB7UCIbsXua9nygQEyYm86NNo=; b=NmdlvIG2/qG0XBDurLtKkcAz+c
	UXOucbU8g+nyavsUCn+tvE0NJgDShkNies9SyUYPHp/njyLEeklAfw86kd565/4HSYMIT27HgV6bm
	il287zvtJVhNiz3/hkvvrMk2t/LMzfaLHRfpoKIStCq160SerBLR+taVw2S+nG1R9PbVWAY6M4Y/p
	V87Rq836fHCQK2qmj8nLLRBdSPBD9/RiGSdvL1U72F0SgrcCSeMXJpU0g11d6MC0Zi/VpT68iFWPZ
	Tc1COHR/gacrtyAggC01BKwT/hvob5J1zSWh8B3TL2g+AB9edpXqVPcyZvKxX1TbyNVGUPs3o7VZj
	e5oVYhVg==;
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqc8-00000002WgR-2HIu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 08:48:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782895690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCjQpneLNRBCiuygsyfB7UCIbsXua9nygQEyYm86NNo=;
	b=GsJnxoaLdmIe9Nx4TsUIlm9oe7OJ9WdgCCop+EWIV7gunJDF4rokwuC5O1qtPrncbnVfAI
	zyiLDFfmrCnZ7ECxO5MjFuzf+PXI7qp4iJZe3QTcr7OUOVSB463Bn43ODKI15bxxXKVFKT
	BdMGsuIucs6x4XEn1SCPqwWM5VwMjoQ=
From: Atish Patra <atish.patra@linux.dev>
Date: Wed, 01 Jul 2026 01:46:58 -0700
Subject: [PATCH v8 10/22] dt-bindings: riscv: add Counter delegation ISA
 extensions description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-counter_delegation-v8-10-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094812_892866_BBD2DEEF 
X-CRM114-Status: GOOD (  11.09  )
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

From: Atish Patra <atishp@rivosinc.com>

Add description for the Smcdeleg/Ssccfg extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2493766e956d..eef5eeb198d0 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,13 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcdeleg
+          description: |
+            The standard Smcdeleg machine-level extension for the machine mode
+            to delegate the hpmcounters to supervisor mode so that they are
+            directly accessible in the supervisor mode as ratified in the
+            20240213 version of the privileged ISA specification.
+
         - const: smcntrpmf
           description: |
             The standard Smcntrpmf machine-level extension for the machine mode
@@ -220,6 +227,14 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccfg
+          description: |
+            The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode as ratified in the 20240213 version of the privileged ISA
+            specification. This extension depends on Sscsrind, Smcdeleg, Zihpm,
+            Zicntr extensions.
+
         - const: ssccptr
           description: |
             The standard Ssccptr extension for main memory (cacheability and
@@ -1135,6 +1150,32 @@ properties:
             allOf:
               - const: zilsd
               - const: zca
+      # Smcdeleg depends on Sscsrind, Zihpm, Zicntr
+      - if:
+          contains:
+            const: smcdeleg
+        then:
+          allOf:
+            - contains:
+                const: sscsrind
+            - contains:
+                const: zihpm
+            - contains:
+                const: zicntr
+      # Ssccfg depends on Smcdeleg, Sscsrind, Zihpm, Zicntr
+      - if:
+          contains:
+            const: ssccfg
+        then:
+          allOf:
+            - contains:
+                const: smcdeleg
+            - contains:
+                const: sscsrind
+            - contains:
+                const: zihpm
+            - contains:
+                const: zicntr
 
 allOf:
   # Zcf extension does not exist on rv64

-- 
2.53.0-Meta


