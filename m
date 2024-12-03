Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98687E64A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zbo/8+oOrMEZrKAI/JRn8w0xKDD58+wGuVd2B//a0c=; b=ePEgE58d5WMey70G95PkJgDaUj
	NyYNjhKbZMJA0/P4YW3z6L3+rH2R03KrDTzOE6NpVHWaDUvM1WPPxAro4NCRoyYwLSeup2x63MNhe
	Ty6j9NxpjNqSXCdV3+02FMfhhjVM+u2kOoxF2hHEpBSjq0amTYYkocFdTPKkv7IH8WCsvKPZiAjva
	KAmclhAZPqnf2eixPJv5dzTIHacBymcLALbv69971armF53k4Un8dYFpRpk81H5td//RuI6eY+diM
	PnzwlP4p0u3Ivwy3xZr5fkH4BBgqzzsdpp3lQ/1OdBUOBVtE48BSHAsIGfIkZbNCtWaBgkkCv2rJ7
	wqKcAirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISPJ-00000009VYy-2y3C;
	Tue, 03 Dec 2024 12:53:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISFy-00000009T5g-2sj2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:43:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8DBDA40D14;
	Tue,  3 Dec 2024 12:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1565DC4CED8;
	Tue,  3 Dec 2024 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229837;
	bh=nGzXFLHUtSGAowAwdsTt+9naVqkMumDIsYiDbB9NiH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qnbkMRck+kyQ9PtPjTyp3TVn4T1IVMzrmuTb/oURMkMNdG6T8cyH9NvjyfxqHYGZN
	 FnRSsrKiET0Zs+tSO6Q3Msf0AbssJyOW7BL1vYIaM31Jm3pyEPt+NXVroDRps19Q9+
	 FV+lFcNab2NeUxN2lO4+zZNlVPggkK/gbRDzP+J0L2krJCDzn2KfKjDVrOPGo2QO9T
	 qdu2JePbWzjdDO2KILRFOKo8QbLevi3HlX5i5AGgWIjAVvIKAqrvfVAm1bNehImT8i
	 rokGUrnlhAqV6yVBzukErV8g/lejFXoVQJrZ0n1dlbJ63mXtuaBTwy1YRdYi9GKF3K
	 1/TDC/Gor4N9g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:39:24 +0000
Subject: [PATCH v3 5/9] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-2024-dpisa-v3-5-a6c78b1aa297@kernel.org>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
In-Reply-To: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nGzXFLHUtSGAowAwdsTt+9naVqkMumDIsYiDbB9NiH0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvz3ZPOwLYB9ZKu+MSGvTZ/MxA7HOiPtWwGV7TE0
 v2MMmSuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ0789wAKCRAk1otyXVSH0GxyB/
 9EBth00BZv1Jvd5qY+tk6M+ginHQh1VcC6op4eFE/bWLA7wjN+oRIGFB27JnyxJXFcTYFvp63KAvwP
 l1mxHQXBYlMdIhVz+zJaNDOn6WeIvsBvukDCnbdJ/9NeCq1P+w42JVYQ2hOx9lEmx/nv7WCwg80cJR
 uukxXB/8vHWVSZa/OVkjGm4xpJg2iK8KcwOBAK/bQZMgyn/tl+EEAYOWQ2I4JptfMZKhjQDbj7v3pV
 0dE2JtJMRAzkJFRKqLQbPbPJfVqdOOvglbbE0+BnYAAWuQJxLkfd98seAsdexuOSDq/uWK7F9ltAZ7
 Ecs3y79C8JXS6tmwSJYzkD7kpjvY/h
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044358_788113_3FDF1B98 
X-CRM114-Status: UNSURE (   9.09  )
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

DDI0601 2024-09 introduces SME 2.2 as well as a few new optional features,
update sysreg to reflect the changes in ID_AA64SMFR0_EL1 enumerating them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7e6b204e83270daabd0036c8109b2fdb0e9b700a..0253d3847aeb2294da04b2b0b3f33f81f32c849f 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1105,6 +1105,7 @@ UnsignedEnum	59:56	SMEver
 	0b0000	SME
 	0b0001	SME2
 	0b0010	SME2p1
+	0b0011	SME2p2
 	0b0000	IMP
 EndEnum
 UnsignedEnum	55:52	I16I64
@@ -1169,7 +1170,36 @@ UnsignedEnum	28	SF8DP2
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	27:0
+UnsignedEnum	27	SF8MM8
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	SF8MM4
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	25	SBitPerm
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	24	AES
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	23	SFEXPA
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	22:17
+UnsignedEnum	16	STMOP
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	15:1
+UnsignedEnum	0	SMOP4
+	0b0	NI
+	0b1	IMP
+EndEnum
 EndSysreg
 
 Sysreg	ID_AA64FPFR0_EL1	3	0	0	4	7

-- 
2.39.5


