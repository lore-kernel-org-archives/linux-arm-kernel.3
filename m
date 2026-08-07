Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B18C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnCL2oewL8fPMTSPu5C0Z8R5fjSg3NbeV9/zE9L/QkQ=; b=bOYgmicli/a4QuLlTYCRARf0id
	pSMCcIu6xrgVAAVHD3P3HDtbfRcu60DFG/Wp514gbcCeTIpg2mqj+erD3KO3w42Nm8FCAdIs5fvX3
	cut/DTFQiuSgQEo4n9IGZOc+kuf3zoDKnlijRiObtqMxodxY1if9/5dPGDaQaIlTuYxKUBywjPNJw
	KQX1Eio/R27kA13RdjZ5HV6oRFEqiL+CxMhSMG/j/rY9QGEKCnZXyZjRByARdUTZ62sCOl5i9/+3R
	m8NboLNY1Hs/ZntkvUw0arVgVAxyNfJMGTU3nsEXX18mAxYZNLfHY6ooc5ocx4mHTbWzRB0SfTpGB
	CGNVTcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFe3-00000007L86-2lb7;
	Fri, 07 Aug 2026 08:09:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFe2-00000007L6d-0k4Z
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EnCL2oewL8fPMTSPu5C0Z8R5fjSg3NbeV9/zE9L/QkQ=; b=LN6XD6gCcApqpKoLNEhN3B7QZH
	tbq6Mz+CwX6IqVuEfbYxDcOow9ChAuperJktHPO5tVuL+j51sZRlXBEJ5t3EMawTap9J9ZpUhqNhN
	EMQuLfOEy8xq4Oa2LV3j/PLlJCs+W0BM0svhaVS4KtjUXdPiYH21U20rqNub6pTwtGRNpPzjoGkR3
	Mvler/uobrorQwUFdfT9aAe5eNtKT3LdVNW09gP5JdHv7AmOZvZwWUGmBkpq3tQOHzId/UlSpEEaf
	s3BzVXgXBVIWzkOx2eJVJCk/dwnJu2unZTDjA23sgH0f+EYTDMlU5F/AgM/s6GNpr7RjCaxuyJQrU
	qLFnkwUQ==;
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFdz-0000000CAa4-0Fmp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:09:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EnCL2oewL8fPMTSPu5C0Z8R5fjSg3NbeV9/zE9L/QkQ=;
	b=V6dEFOUGWoiJWnKWr40BQ0nMO9QluHTu9nnp9MkwPSnAioY8YSmLsNq3rVZkQvFi2bdoBu
	8lIIF+lmkuRVdR/IcovxARaTh6BxCxS1OI4fK4tyPZYyYdrC6XucNg47mxvHZ2lWCdlzEb
	Q1MKrwdl2uwCVW3EwmMftpjvEJioU6U=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:08:59 -0700
Subject: [PATCH v9 04/20] dt-bindings: riscv: add Smcsrind and Sscsrind ISA
 extension descriptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-counter_delegation-v9-4-58658104e487@meta.com>
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
X-CRM114-CacheID: sfid-20260807_090931_388639_6F90CFBB 
X-CRM114-Status: UNSURE (   9.15  )
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

Add the S[m|s]csrind ISA extension description.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-4-7909f863a645@meta.com
[pjw@kernel.org: use official extension names in the patch description]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c0..ccff2be1224d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcsrind
+          description: |
+            The standard Smcsrind machine-level extension extends the
+            indirect CSR access mechanism defined by the Smaia extension. This
+            extension allows other ISA extensions to use indirect CSR access
+            mechanism in M-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -226,6 +234,14 @@ properties:
             Profiles Version 1.0, with commit b1d806605f87 ("Updated to
             ratified state.")
 
+        - const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Ssaia extension. This
+            extension allows other ISA extensions to use indirect CSR access
+            mechanism in S-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: ssnpm
           description: |
             The standard Ssnpm extension for next-mode pointer masking as

-- 
2.53.0-Meta


