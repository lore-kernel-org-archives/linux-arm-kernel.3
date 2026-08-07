Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521D8C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iACMJvZAVFPzMdaIbiNx0YBOSsoIX50arEbNv1yc504=; b=Y6TdAesZWC1+0LCKtXmXQwQ08h
	FoslWXQCL0k86fLN1/GS4QN6+C+hlu55aKNnMqWBXtHkmsNLgytUh2yMXO8KAIM3bVSTSgupGqXDB
	fYH+2pwuuoI6Z2cdHXqNwKmgX8nfP0rggSZEv60lUqcpGXG8HdKJsjgjMNsofdeUwBSTqNxIJK62E
	yI9xGOoVQvlTX6NgTqZ+PmZMqX8JorU8r+vX89DWP4eqJsjzqMCJa+qZKuyVdF2alFKtLJUpMoZEi
	E1GH/D2MMvfiGKK+Qfi2CkLo55mXo994frs5PrvU8SlnZBaubctBVtCOmxsdLB6Hhfz7lRaUb/a9A
	s8ud08HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeU-00000007Ljt-3Ari;
	Fri, 07 Aug 2026 08:10:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeT-00000007LhB-3SCX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iACMJvZAVFPzMdaIbiNx0YBOSsoIX50arEbNv1yc504=; b=lrIxlpfFTc8yrTS6I5Bta1HuU/
	EPOPaC4v5e7f6KN68hJRHMFBT/wHttcZ2MO1KXlQCj5YnXITf9oI+5kH2V2+hxVp1gEPE3NbYiy2I
	qtXynHekkzv72DZXJoyDqi0DDtc0HCUshjmW+m5RtMRJ+wzg5+UiSwbhzUekCZ0pRMR04KCZSUYEj
	wcR1Qw+FEC/pAUR5x/VwWmAuPsZ/UjSZmU7sjLzV2mQ3NOhnhiPnV4LjPrUnxLsjiQ5cccV0V46Bu
	rC1SiFOJDg+qHZYBz7nbKqlF/G9wkPtz7LQPkPStBs0r/qLCap8aFKnmzJmGYa56itu+XAgwHfS5c
	OkdhQrJQ==;
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFeP-0000000CAhP-3SwM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:10:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iACMJvZAVFPzMdaIbiNx0YBOSsoIX50arEbNv1yc504=;
	b=pH8Hp+Ex04b6RUdXsRauIzzemzxoXCn5Bts1Q5PpyQnR+Q8dUnqYlUAGq+VVJEFLuaLen4
	9aqxe6JUsVSwig1vae44jh5rW1Izu2ZMq2q2pjLWPpq6JPp9HGty3fWLLG6TV/5kpQr6O2
	0/b0NgBkRLG0f2no8SqiMG7Qd/XXodo=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:05 -0700
Subject: [PATCH v9 10/20] dt-bindings: riscv: add Counter delegation ISA
 extensions description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-counter_delegation-v9-10-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_090958_258715_D752F780 
X-CRM114-Status: GOOD (  10.60  )
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
Link: https://patch.msgid.link/20260701-counter_delegation-v8-10-7909f863a645@meta.com
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index eee65cf73d6c..24efd3e1cf8e 100644
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


