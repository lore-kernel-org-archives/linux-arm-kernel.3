Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A174FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2E02G4WK/YmamUQGewM1TUlvL1hL8wBguhuxwHCIF9w=; b=XWerT+h3MJnLitmNzE8vefEjAQ
	HS4qE0GiOWusHbF54NvyAsKAYYbtcseBlcvoEIIp6t/pAzajUK0UypH5Ap9aGjveKt8kf0TtsLU06
	qLw3tFlcKg8aB5wnh+NsaldgNNissYNwzqlo6IiXoCECWbi1W0yMXjpEr+ZMEFeMbMiEjnzixMJzI
	TPoLkjeT9uIrfz67x7ZtGmpncifc4EUNYxicp6y94Cf6kWV8MdCIPVIBNwnaTTxMtSt7ctAY7ahgP
	q2D9AC0nWJRIsII7hOUXOglJzEEZmpm/c3IUmzxN1RG2HbDVgiZeVMaujzIuKvRNjM2VX8JYFqa0O
	UWkGrz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIdL-00000006U7l-2qAX;
	Tue, 07 Jan 2025 23:05:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIZc-00000006T9u-0ako
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 833765C2738;
	Tue,  7 Jan 2025 23:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D01C4CEE0;
	Tue,  7 Jan 2025 23:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736290879;
	bh=Tdj0gsQusE+OTNKaaxYQHJeLR3638cCJdDZCEhI+hKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZDC2cPsURmmI0WKlaTZfael4OflXSNL6zsjL6pGHTSAdjvcCqZSN03jo8fBFY9nl
	 YTjMdEqIkH+5gJKFF9MoleWuxlurlneP+i8CpmR17WE2Qis2kzR+TeoQjLXucGTaii
	 W+LOlkau/vrklBxQF/ONTSMG9+kv1LXgBRKjks+IPMXusaD5QFYcsa+Ye2K55OCqVC
	 FH7mdF2qEjQhA2I0yEzA5j6QRpn0m6qPOyC2uG0nb5easgWmQx3AONMOofefDwlEig
	 Ao7mMtIEnyhhk6MMiPE0GXphAM6eETwbrtzh85tMiELfHEnBymGUZNyJnn2XnRvlo8
	 gj28QfAfxvncQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 07 Jan 2025 22:59:42 +0000
Subject: [PATCH v5 2/5] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601
 2024-12
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm64-2024-dpisa-v5-2-7578da51fc3d@kernel.org>
References: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
In-Reply-To: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Tdj0gsQusE+OTNKaaxYQHJeLR3638cCJdDZCEhI+hKA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnfbIyGLWxt+KD7zEe3ZkNYsyIxEbNBf+rpjPYk5T8
 qV5MPOKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ32yMgAKCRAk1otyXVSH0PvPB/
 9cO0dEz2VOmNK+2Wb0VSKbYqBEbmaBg1yBtY9V0pWZPGRmqcseLTnhSHAMtM80dj04aROvUXe31pZJ
 eKME0dQZco5A/L4EyoJnZ1uQhm6FYfuNiruI2udbw7BoJ/qSpq6uI2Mn9GD5mUg404vRAv4QlrwyMs
 fwKFDwwUbtdAcUT2HSZn3r80jQYcF2HI7xfOpTsCLJks7113bypfzIiehnOlFl29N2gAXQu9PrcLU1
 5PEMN0LyQTJ0LMs9wkypBY9/Qs4lthHfRHzGJ4kCqNp+3hTvjmtBXIrwRIXN0a9vu00ZhxGFI9Uq8H
 /OJyGo3p3aQzfI3895IWAE4hGCbpfu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_150120_228547_99FE6D20 
X-CRM114-Status: UNSURE (   8.37  )
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

DDI0601 2024-12 introduces SME 2.2 as well as a few new optional features,
update sysreg to reflect the changes in ID_AA64SMFR0_EL1 enumerating them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8c2db201665fd5d44eb937549d25421924569498..94ca9cdb0b167f88d79e23ea4cef1abaeea5c13c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1113,7 +1113,7 @@ UnsignedEnum	59:56	SMEver
 	0b0000	SME
 	0b0001	SME2
 	0b0010	SME2p1
-	0b0000	IMP
+	0b0011	SME2p2
 EndEnum
 UnsignedEnum	55:52	I16I64
 	0b0000	NI
@@ -1177,7 +1177,29 @@ UnsignedEnum	28	SF8DP2
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	27:0
+Res0	27:26
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


