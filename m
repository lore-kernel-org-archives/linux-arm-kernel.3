Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F404CC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 23:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqSMQv43Ny77SHf94e7R4UsEgWA5Ic7Z9DHRZuUb4NY=; b=HzlN9PyBANfeW5rwirMY8euMv3
	3nli2rNyk+lPWJPAqeAh9DZdcgReDgw1dDH3gPRV5GSHHPptjJb28PknhhI0avthRuMGeBoLR6otE
	r/ZTI93ODLqOBaJ7VttB3teCOJ3UYxF23zUJ0m/tu4eNJ+hpOMx4T83D0sT/8l4ptz2tv5uCM2W5D
	p4R8UUP+6H4xLyS8bpURGUvtn24p/WjfiXPAHkEyz/OXDJOB+cTsijxtG3JSupg19PR2llE0gSiGe
	3K6bP0uT5mKs/ozF2nFDGfDj68NCPb8E7MHJfA2dFGDEBKEDMO+Ln3dB/U30/BvHnP4upA9uZE5zi
	EiBSh1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOfw-00000002vfv-2cjP;
	Tue, 04 Aug 2026 23:36:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOfu-00000002vfj-3Kn4;
	Tue, 04 Aug 2026 23:35:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17E07600AA;
	Tue,  4 Aug 2026 23:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B5C1F000E9;
	Tue,  4 Aug 2026 23:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785886557;
	bh=qqSMQv43Ny77SHf94e7R4UsEgWA5Ic7Z9DHRZuUb4NY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=W9pa1dn5Cz5qL/i7r4WcyaBfi3EanadOrI+Ib2i5ftXpBzAmp+tDpfJbBDPHZQutj
	 bWSTKnYWJfu52h+dpHBHA6ECJblz/Wiufass2MhiwIRo6cSbMYJl9I7xJKZHFqdBVI
	 Gd0vv1qLOXqO9NSfoqntg615eEf1Ev50ldxaA/FdqzXNUCwnD6d5dN+Ir11ooO1WgV
	 WCZve5HJ/I25Lud6ufyJN6YW+jFJ12sUs/NEnR+oXDAY+gYgtqf0SCqOQxBnImVin7
	 ivD9HvWaS0ETbbfOQt+X/Xgog+QxkrcWql54g/14/LbSgdHb/IojI3qfi3K9K/X/te
	 4+d4Zl6i+zd4g==
Date: Tue, 4 Aug 2026 17:35:55 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 02/22] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
In-Reply-To: <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
Message-ID: <3d1f698c-6b76-5252-4e8f-b61671e309c7@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-5439955-1785886557=:1346571"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-5439955-1785886557=:1346571
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds definitions of new CSRs and bits defined in Sxcsrind ISA
> extension. These CSR enables indirect accesses mechanism to access
> any CSRs in M-, S-, and VS-mode. The range of the select values
> and ireg will be define by the ISA extension using Sxcsrind extension.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Reviewed-by: Clément Léger <cleger@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks.  It's easier for folks to grep and cross-reference if the official 
RISC-V extension names are used whenever possible, rather than something 
like Sxcsrind.  Queued the following patch for v7.3.


- Paul


RISC-V: Add Smcsrind and Sscrind ISA extension CSR definitions

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds definitions of new CSRs and bits defined in the Smcsrind and
Sscrinq ISA extensions. These CSRs enable the indirect CSR accesses
mechanism to access any indirect CSRs in M-, S-, and VS-mode. The
range of the select values and ireg will be defined by the ISA
extension that are based on the Smcsrind and Sscsrind extensions.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Reviewed-by: Clément Léger <cleger@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-2-7909f863a645@meta.com
[pjw@kernel.org: clean up the patch description; use official RISC-V extension names]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/csr.h |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..7f09e54a0f9a 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -347,6 +347,12 @@
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151
+/* Supervisor-Level Window to Indirectly Accessed Registers (Sscsrind) */
+#define CSR_SIREG2		0x152
+#define CSR_SIREG3		0x153
+#define CSR_SIREG4		0x155
+#define CSR_SIREG5		0x156
+#define CSR_SIREG6		0x157
 
 /* Supervisor-Level Interrupts (AIA) */
 #define CSR_STOPEI		0x15c
@@ -394,6 +400,14 @@
 /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
 #define CSR_VSISELECT		0x250
 #define CSR_VSIREG		0x251
+/*
+ * VS-Level Window to Indirectly Accessed Registers (H-extension with Sscsrind)
+ */
+#define CSR_VSIREG2		0x252
+#define CSR_VSIREG3		0x253
+#define CSR_VSIREG4		0x255
+#define CSR_VSIREG5		0x256
+#define CSR_VSIREG6		0x257
 
 /* VS-Level Interrupts (H-extension with AIA) */
 #define CSR_VSTOPEI		0x25c
@@ -436,6 +450,12 @@
 /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_MISELECT		0x350
 #define CSR_MIREG		0x351
+/* Machine-Level Window to Indirectly Accessed Registers (Smcsrind) */
+#define CSR_MIREG2		0x352
+#define CSR_MIREG3		0x353
+#define CSR_MIREG4		0x355
+#define CSR_MIREG5		0x356
+#define CSR_MIREG6		0x357
 
 /* Machine-Level Interrupts (AIA) */
 #define CSR_MTOPEI		0x35c
@@ -498,6 +518,11 @@
 # define CSR_IEH		CSR_MIEH
 # define CSR_ISELECT	CSR_MISELECT
 # define CSR_IREG	CSR_MIREG
+# define CSR_IREG2	CSR_MIREG2
+# define CSR_IREG3	CSR_MIREG3
+# define CSR_IREG4	CSR_MIREG4
+# define CSR_IREG5	CSR_MIREG5
+# define CSR_IREG6	CSR_MIREG6
 # define CSR_IPH		CSR_MIPH
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
@@ -523,6 +548,11 @@
 # define CSR_IEH		CSR_SIEH
 # define CSR_ISELECT	CSR_SISELECT
 # define CSR_IREG	CSR_SIREG
+# define CSR_IREG2	CSR_SIREG2
+# define CSR_IREG3	CSR_SIREG3
+# define CSR_IREG4	CSR_SIREG4
+# define CSR_IREG5	CSR_SIREG5
+# define CSR_IREG6	CSR_SIREG6
 # define CSR_IPH		CSR_SIPH
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI

--8323329-5439955-1785886557=:1346571--

