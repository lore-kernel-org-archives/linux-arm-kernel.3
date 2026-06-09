Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013EBCD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5qCNbZWxJ2eaZKPD0fiX8UMgOwRHPlmfMwkbht8Nv4=; b=bRXByeMC624e1OOG6+8Dl2hPOg
	E85K30xxgnCY8eD43JH2RtTaxd5t4kmSidHMX31Xu5catU8zXHavLQ6wL/ylq7G4DSZegilfZD9oa
	fuL8FPygcbesttQa8JvpZvi7/tW502khqQtPvHvVdZQYXQPqvdUvm9jZ3qocdpPkZmKptz0hN9F57
	P8h9Dg7i+D3y9EvzGl34es2e5LafeXZL8SneZYuJDrgz9wYuhyTpjxeYRLa6coPq3BqMUGdI7QHJ2
	4LNOi6Ad3XB+smB0jGo83VVqWnUTbC4m/+ENDPX4lAIKaCAMd06je/oH7aQpWfXdRLCc3IRGqa0aE
	tPhWibZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYE-00000004nn1-0wuf;
	Tue, 09 Jun 2026 06:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYA-00000004nhV-3JFo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=o5qCNbZWxJ2eaZKPD0fiX8UMgOwRHPlmfMwkbht8Nv4=; b=F7c+K2ajLaE9KJYU+EZsce7Ln3
	9DELCGY9Kle8HHvseTewtuMG1/1KSFqtpYSPGe4TuS4z18Gbh9t3MC1YuL/sk2ZSZ9tqOVHaFpOxd
	S63xdlKIJdMZMlneQHAryr+PKaWxopJWVcRAb+DIeOUYD+f61EowW7lWUHhff1RP+rNaMJFFbuBQH
	7yl5W9dHFQFKZLqNp36cBprar38vCUQMDZqsnEQFg/sScqAe726HBZV7E+5e4T/R3iaEAYyfS8ImG
	ujJQJWM1i1AaaSLaMX5W548FbWXgHt06ZVdmUng9sE9/LszhzyGzuhtH04vvpEbV+6y3flbV6Vzxb
	AxPDROkQ==;
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpY1-00000002020-3ZnB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:02:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5qCNbZWxJ2eaZKPD0fiX8UMgOwRHPlmfMwkbht8Nv4=;
	b=lYn1jx2/wE5iAiy4iduZmTtvXwAlsQ5axkxbKlGh9vtQc3d+NGuM2JrTF37/MfIAPIoAHA
	XgJ+STR11Z/02ZmtSFGrt280FC4AKwyver4Q5S1i3ULozv8TMpvyd5p2pt58dfCfXd3cVH
	1L55260FjkG0HYQZ1YtD0o6e/6lJ418=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:23 -0700
Subject: [PATCH v6 09/21] dt-bindings: riscv: add Counter delegation ISA
 extensions description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-counter_delegation-v6-9-285b72ed65a9@meta.com>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
In-Reply-To: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
To: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070255_554871_A0C25AF3 
X-CRM114-Status: GOOD (  10.38  )
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
 .../devicetree/bindings/riscv/extensions.yaml      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ece3edccee42..2845e8e2999a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,13 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcdeleg
+          description: |
+            The standard Smcdeleg supervisor-level extension for the machine mode
+            to delegate the hpmcounters to supervisor mode so that they are
+            directly accessible in the supervisor mode as ratified in the
+            20240213 version of the privileged ISA specification.
+
         - const: smcsrind
           description: |
             The standard Smcsrind supervisor-level extension extends the
@@ -228,6 +235,14 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccfg
+          description: |
+            The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode as ratified in the 20240213 version of the privileged ISA
+            specification. This extension depends on Sscsrind, Smcdeleg, Sscofpmf,
+            Smcntrpmf, Zihpm, Zicntr extensions.
+
         - const: ssccptr
           description: |
             The standard Ssccptr extension for main memory (cacheability and
@@ -1135,6 +1150,36 @@ properties:
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
+      # Ssccfg depends on Smcdeleg, Sscsrind, Zihpm, Zicntr, Sscofpmf, Smcntrpmf
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
+                const: sscofpmf
+            - contains:
+                const: smcntrpmf
+            - contains:
+                const: zihpm
+            - contains:
+                const: zicntr
 
 allOf:
   # Zcf extension does not exist on rv64

-- 
2.53.0-Meta


