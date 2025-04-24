Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E1C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zxld5MK5nl7RVPnOXXCg5A1OmUF2muw/uPgyMfoYRo=; b=dDGkIOtGvJrECdnnKmDiqKbfE1
	IusL+eH31ACklQcWtLMCCDeekmf+YiwBhVdUiGxILB+bkKcLV2y4zdrvUVAxSNM0Gg5FZt1bHCZEY
	xmB5ATnfc7JRP66uxbhaaAqFxnpp12QvW52RuDCGD3124siQhhRvKY9bBtYpBI/XtY4qh2y7XYkMX
	y5Gulnud0Kx/3ElPtI5uuOFGSMwdbuvKoMXMbJ4zGv6lQ8AMOtAD4gi0T1pUfuYzDhxijud/4njJD
	SAEI+tkQX/egrp0Q1b76Bs3GnHgd+UdOatDq0U7ne9OtBcUQajjvU5wsnqoZtc7uzq30d88FwChPH
	7bTpqkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v89-0000000DvIy-1pnu;
	Thu, 24 Apr 2025 11:52:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tnM-0000000Dft2-3kAc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9zxld5MK5nl7RVPnOXXCg5A1OmUF2muw/uPgyMfoYRo=; b=oV/a6iSmOYi22AO1OcrFpgvDOm
	+A/JOCEwZTPthBpq08NPF2Bah037Bh3Av36MBAEwKi8SPXt7TQS1OVyXTujfN6CRAwzq0hqaTLu/s
	dlXyFOwDNsNCZCj6EuffCuEYYEYoqP0Z5GKkNu1+ua6HU0B+v3fnqrHeG0VCHGVPtSYDqNRaZX0Ev
	GwSUuvdrE+WPFddTVUy6tjK79IExDGSUPBcpsaWowLRNZTRd9SKhwdtbXCaPx8ZMDhf1cC5/bfq/1
	jnagqkCUd0IIMrWxeEdeavxxblf3/z3s7KQjyd79oSUHFfHSz1rYXv3f8xSnnj9EED1AdpGZUojJp
	INPJldaA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tnK-0000000BjbW-0ep7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:27:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 153984437E;
	Thu, 24 Apr 2025 10:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BA1C4CEE3;
	Thu, 24 Apr 2025 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490420;
	bh=9zWp7WGj091+ZG2FSlP0T7J3sn+1tw+UEtNEfbmUjxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qu6UUhQJCxqYrr81iVHhuMy20mqGqJVGW8zuJFIytlavKi7iQx+8yg7t1RAJtkjNu
	 epa1dTe1TlH89+QxPE4kyA5f6+Cd1JwbDbZgAH69e5BfgGi9OcvNamQ/0zxihvopph
	 i8Pdp6H4U6q/b9oDTWJN0PGh5BWMUU4ZlYvmH60jH2z9/96R8inXgyXFfVviEksIiK
	 ZqPUuLPL0GkKiiGHJU+bNKNJUkW4bN90Bgg8vxa1c1YMF2aSqCoEg4U11xu2tR5FF7
	 GB8q7rJ9JP2R7srQvfsynukmj6W5Zge5asiMBp984NlJuW7HmlS7MMyHBZwJYfBwpk
	 bcSLUsbM7+z+A==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:25 +0200
Subject: [PATCH v2 14/22] arm64/sysreg: Add ICH_HFGITR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-14-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112702_408852_878BD5CE 
X-CRM114-Status: UNSURE (   8.08  )
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

Add ICH_HFGITR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1b519e35000be328acfe26d51e098059f9cf9ef2..5af0dea6e775ea680686dbe4bc836b5f5b69fbc7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3616,6 +3616,21 @@ Res0	1
 Field	0	ICC_APR_EL1
 EndSysreg
 
+Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
+Res0	63:11
+Field	10	GICRCDNMIA
+Field	9	GICRCDIA
+Field	8	GICCDDI
+Field	7	GICCDEOI
+Field	6	GICCDHM
+Field	5	GICCRDRCFG
+Field	4	GICCDPEND
+Field	3	GICCDAFF
+Field	2	GICCDPRI
+Field	1	GICCDDIS
+Field	0	GICCDEN
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0


