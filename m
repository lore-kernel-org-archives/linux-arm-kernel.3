Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8419C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rYOUNaGMGZsPlGyhqLkbebVXqK7qfkK62tQGnVDlaQc=; b=vzFDxe0xJMLoP7ShvxNahwCViW
	vTiqL0ikeTLC1TlVkyY5FWNxHQPROdqa+nWVNsKtqdxJ0GZxXAbbPx9h+k03QGD2OGlbxBkMQZwCY
	Bvll/h4M+0nR2F4DhzaLACm8VYTWwHEfaAeL076KyVcI3+2oMZwrPPhFtdAYj4zbNjTXne2kVWNuC
	uD17WIc4Ellv1lU5nzrMyx0LKiFbRUM1TsGWQGIT9RDIFm4QxOF4+ffY86viZu/mTpaGv8zJ1sqwR
	yYnLfQjS94vvHgPKfIe40INSj3rZDVynmZHmAUm36xsABLL3iCT4jBe7T/1xpoH4SXKflYw7FFAAf
	h/xgJwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDLu-00000003xkb-0hU8;
	Thu, 02 Jul 2026 09:04:58 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDLr-00000003xjC-3OVj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:04:56 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-37d70036426so1028615a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782983094; x=1783587894; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rYOUNaGMGZsPlGyhqLkbebVXqK7qfkK62tQGnVDlaQc=;
        b=eEZFt4RSLNkmuuGhrTaPORPoGa7Fey+PJyHTn1vwK5JQznDCrYsGNl+IHAd6FKnnn8
         N6Hlu6WNHeQ8vJfGYGY2rR4GMLnMY4CF+SlpFQXIBAFbmshlc2m5+ajYeJfZ474LDELC
         rpkG1s7AZ+9y1rJTge+ctPuTv4sZ6iRwB84EAlIQ4zpbEBAcZTcUK7XkFR63QBkPoMlP
         1TJ9UKMUqtHGa3vZk+aQG+7QRoOJdJO+wxBWnLheTtCVb7TM0jnY4oFXE6xhzerBHCxy
         Dw3l4tFGKA/S0NGs5WgP5BWO8GdgyvTADMh66UqZKp7HlRwB8TLSUm/B/1EDfEHz6ItW
         RbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983094; x=1783587894;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rYOUNaGMGZsPlGyhqLkbebVXqK7qfkK62tQGnVDlaQc=;
        b=naoyXrn/LYSYlt37Z+1+WIU2fqwBmRWKe13fdsr0H6QmRRFsGAjtgHdUVtgjoBq36z
         IwZ1V+Eh8iGdlHZfdW7pPOwF48xHd/1+G8eozgvQLTUwkxcwQ+vLraajstcRVsGglg0K
         ZDW50GRPZQ5c0z8qn4+Iwu68KitZhcLlo2lyrxf9I3IU/XThR5fjTxUEFY0AnO5P6inQ
         2UmYmklksIXEeygV18ckvX07doAa22i7vS2/0i9zPRTjC1T+0NEjx5aAIMqFXqfgPN2s
         wKtYV6xXPQb66BFUg5IfwKQSKBo/u4D3K27StaWSZSBrPJS67Sem/f6rrhmmdt3TbMRj
         qxCw==
X-Gm-Message-State: AOJu0YzPqDNhBcVD10ZfkVQvhyWVmPCRW8d46NwpxIIB8TIzq5yONN3J
	FvEd4ryI/Y2aUcK5tXLj8LIG1NCZ38CvBb7IlZg9/NZjhSWRR+kA6yOUFfh3ySR070A=
X-Gm-Gg: AfdE7clJdSINCQwFG8ZwPG3JnZXe1A0rzoZUI7VMwqQn6RqLmLdf9SnHeUFSnc50Nss
	GafPZ8aBa/osZzs/2uklX+geu35toCpdsaprAyd/hCa0rJ4eahMepMadgzbVQgyH0qzp8a+F0ls
	gAHb+Sg15ZCLu8lxlJ85swTi/smB/1fDR2bjBurZlHV5VzVi4qocOYg6shniC0CEISBIBqGv2a6
	eC4o39j0OVG+5/uKbQBditb9uSm+mT0kOY7zsdyLv1ln/OiXQ1jL1sNLlDcj/rEV+n1k1AnUcPT
	zPlN7mXOpV2EI2i1mtNg0fjesf6oqBFFxZJBe+xL+f1Z3hl/j/Mx1V1z/TBTY/MmuqmRynd3hTF
	3ZjafJQvhGacL9buX9SCK1Z7GE9of9byjD9dVlAsy1nKHffrJJoEGUssM1J2dvAU3R8bKxPkYCl
	hQos7mUJzZ6YhvWsvqeK/RBZph6aJ5pn0=
X-Received: by 2002:a17:90b:3e45:b0:37f:d27f:5186 with SMTP id 98e67ed59e1d1-380ba91d167mr4114967a91.25.1782983094001;
        Thu, 02 Jul 2026 02:04:54 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e15c362asm725719a91.1.2026.07.02.02.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:04:53 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Thu, 02 Jul 2026 17:04:31 +0800
Subject: [PATCH RFC] dt-bindings: perf: riscv,pmu: Add interrupts-extended
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-pmu-dt-property-v1-1-a7a7737afb72@sifive.com>
X-B4-Tracking: v=1; b=H4sIAJ4pRmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3YLcUt2UEt2CovyC1KKSSt20NEOjJGPTtFSDtGQloK6CotS0zAq
 widFKQW7OSrEQweLSpKzU5BKQWUq1tQBQgp8DeAAAAA==
X-Change-ID: 20260701-pmu-dt-property-ff12b35fe0fc
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Hu <nick.hu@sifive.com>, 
 Eric Lin <eric.lin@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782983089; l=2327;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=KuUldqSBvNUBw35ye/ZZ9kP2NkGYAK2SlfUkqDDVXZo=;
 b=r6xyJqLl12BSFPk0mVYjvI1fgO5czZqFRAdildvZY941PKjeY6XoAQqsZmgQVjkkNpPNiA/st
 /OSxALCjIC8As7kr5tTMspJ7rxU3VdXQOpNyeo7jc8yONMLS0Jk9Ffa
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_020455_847116_59935973 
X-CRM114-Status: GOOD (  12.64  )
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

The interrupts-extended property is used to specify the connection
between the PMU counter overflow interrupt and the corresponding CPU
local interrupt controller (riscv,cpu-intc).

This property also allows the software to associate a PMU node with a
specific CPU. To support future heterogeneous systems, where different
CPUs may support different PMU events, this property allows the driver
to identify the correct PMU capabilities for each hart.

Reviewed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 Documentation/devicetree/bindings/perf/riscv,pmu.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
index d01c677ad3c7..13aceb3d42b9 100644
--- a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
+++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
@@ -34,6 +34,13 @@ properties:
   compatible:
     const: riscv,pmu
 
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+    description:
+      Specifies the interrupt-parent and local interrupt index for each CPU's
+      PMU counter overflow. Each item points to a riscv,cpu-intc node.
+
   riscv,event-to-mhpmevent:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
     description:
@@ -101,6 +108,7 @@ examples:
   - |
     pmu {
         compatible = "riscv,pmu";
+        interrupts-extended = <&cpu0_intc 13>;
         riscv,event-to-mhpmevent = <0x0000B 0x0000 0x0001>;
         riscv,event-to-mhpmcounters = <0x00001 0x00001 0x00000001>,
                                       <0x00002 0x00002 0x00000004>,
@@ -127,6 +135,9 @@ examples:
      */
     pmu {
           compatible = "riscv,pmu";
+          interrupts-extended = <&cpu0_intc 13>,
+                                <&cpu1_intc 13>,<&cpu2_intc 13>,
+                                <&cpu3_intc 13>,<&cpu4_intc 13>;
           riscv,event-to-mhpmevent =
               /* SBI_PMU_HW_CACHE_REFERENCES -> Instruction or Data cache/ITIM busy */
               <0x00003 0x00000000 0x1801>,

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-pmu-dt-property-ff12b35fe0fc

Best regards,
--  
Eric Lin <eric.lin@sifive.com>


