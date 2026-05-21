Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C43ECD5BB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1lZrR+gpFpJstVyUmfC4H07REQpS+NzRWb3so1Ohmk=; b=AegU97G02AmxB9IVYkjRejcOZs
	ctas4SkRpHbZqPsFjBmtbCSEEVLDNnVSsivEm/LdejqhypL7AyHyodevshA68wzCQurf9SXRfGu8O
	KDxCmcvK6M0w+FaHTZBjfAYc+fndViDSDLbQM5n5LHLOIiQPoYa/8+TrX83q+h1nv/wftT8ZQKZa4
	dFVEwIv+NS7J2yIgi20ywjuXJoPhCnqSb5qgH1lpJ7FO+RnqG7PllNvuCvxz0zVu98GqY5veam+eL
	UarWvlEVT9uwHrwKtWjBfLSyZ2s4tyXSo4alwj3p2RYnc+s+as4XtJO+3BrRJ3Onm8m+NCjXa3Efz
	1y0EdEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Q7-00000007s9y-38LQ;
	Thu, 21 May 2026 13:26:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Px-00000007s1Q-1PDE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:26:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 518D23585;
	Thu, 21 May 2026 06:26:22 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 34F663F7B4;
	Thu, 21 May 2026 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779369987; bh=4qNWyG9/rqhhK0Ngv0vgf96xD7URLLi+kRllF+9yecc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C1nmKM0nZ6FdsNb/pGKtxENYrQSpAd8KUAl1CKsARFayP2Q+qHmVucqMCXm3Dnv2I
	 WRSEzR+8DkzhGzEG3uht17kYeK8p2vX2lyVO9zZp9PV6n+UfaWBcrOrOBNNnIAt6WI
	 DzevceyRlRKWTU/Cd5kZZW4XAGTgFhUjbZdAH7cA=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 10/18] arm64: sysreg: Add FPCR and FPSR
Date: Thu, 21 May 2026 14:25:48 +0100
Message-Id: <20260521132556.584676-11-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260521132556.584676-1-mark.rutland@arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_062629_434261_1C48ECF0 
X-CRM114-Status: UNSURE (   7.09  )
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

Add sysreg definitions for FPCR and FPSR.

Some versions of LLVM will refuse to assemble accesses to FPCR and FPSR
unless the "fp" arch extension is enabled, which we don't currently do
for read_sysreg() and write_sysreg(). In general, handling feature
dependencies would complicate read_sysreg() and write_sysreg(), and it's
simpler to use read_sysreg_s() and write_sysreg_s() instead, requiring
sysreg definitions.

The values used can be found in ARM ARM issue M.b:

  https://developer.arm.com/documentation/ddi0487/mb/

... in sections:

* C5.2.8 ("FPCR, Floating-point Control Register")
* C5.2.10 ("FPSR, Floating-point Status Register")

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/tools/sysreg | 45 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 6c3ff14e561e6..fa155cd856a5b 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3790,6 +3790,51 @@ Field	1	ZA
 Field	0	SM
 EndSysreg
 
+Sysreg	FPCR	3	3	4	4	0
+Res0	63:27
+Field	26	AHP
+Field	25	DN
+Field	24	FZ
+Enum	23:22	RMode
+	0b00	RN
+	0b01	RP
+	0b10	RM
+	0b11	RZ
+EndEnum
+Field	21:20	Stride
+Field	19	FZ16
+Field	18:16	Len
+Field	15	IDE
+Res0	14
+Field	13	EBF
+Field	12	IXE
+Field	11	UFE
+Field	10	OFE
+Field	9	DZE
+Field	8	IOE
+Res0	7:3
+Field	2	NEP
+Field	1	AH
+Field	0	FIZ
+EndSysreg
+
+Sysreg	FPSR	3	3	4	4	1
+Res0	63:32
+Field	31	N
+Field	30	Q
+Field	29	C
+Field	28	V
+Field	27	QC
+Res0	26:8
+Field	7	IDC
+Res0	6:5
+Field	4	IXC
+Field	3	UFC
+Field	2	OFC
+Field	1	DZC
+Field	0	IOC
+EndSysreg
+
 Sysreg	FPMR	3	3	4	4	2
 Res0	63:38
 Field	37:32	LSCALE2
-- 
2.30.2


