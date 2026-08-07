Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9515C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSyM0jx2ZULPKz+yUIhCrtjTjYl/ed++j97PAJ68moY=; b=o+68DZOSt0Rqc/0++j1LSCZjS7
	FM7pynYMnZhAZNZkMLe152GYZ8uLiAqQQx4Yn1GCxHZUrrSbpw17DbIFTc/CVjpNHlye6Dxnkq/+l
	VGumw17FToMpermQvAJRDGk5TJsY6DCEQuhazHfkf+vgt0tGoDMrL3wwaqA+p2DxoSrlETgcmohhk
	vJXVasUGJnHOXHMau/NshKz8wDh4ASdNK4J5+jkhoezwH/7bhY1tVzgLpPyN2V3ATMpCWmnBNqqBn
	wH5MUmr3Um0MmG0JNbhobV7wwvSO0Rmj4A1edrJcCLM8M1saJin6/oVLQbP90KzQGxdie6BHG/2ja
	TmcpxrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeD-00000007LHf-2kup;
	Fri, 07 Aug 2026 08:09:45 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeA-00000007LBb-2prx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:09:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSyM0jx2ZULPKz+yUIhCrtjTjYl/ed++j97PAJ68moY=;
	b=XHR0jnljj1zJs9QYeAhOAtz+STgQ3kT6acB7mg81ppPFCOQrR4IwkzKNCfzPiAl7dF8sHm
	zVH/Xr8l3FMCH9/1VRrp2WJljWRvI2ahAfGMgGtunDRyQmybwA+Xt/OnBcXU0jBCz2MKmT
	8OOTNmYoU5jlDhFjQJtQALM1cxKUmS0=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:02 -0700
Subject: [PATCH v9 07/20] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-counter_delegation-v9-7-58658104e487@meta.com>
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
X-CRM114-CacheID: sfid-20260807_010942_872265_82AFFC2C 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Atish Patra <atishp@rivosinc.com>

Add the description for Smcntrpmf ISA extension

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-7-7909f863a645@meta.com
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ccff2be1224d..eee65cf73d6c 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,12 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcntrpmf
+          description: |
+            The standard Smcntrpmf machine-level extension for the machine mode
+            to enable privilege mode filtering for cycle and instret counters as
+            ratified in the 20240326 version of the privileged ISA specification.
+
         - const: smcsrind
           description: |
             The standard Smcsrind machine-level extension extends the

-- 
2.53.0-Meta


