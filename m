Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2649E64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qF03MGWzKt2dNrQaiEew4jRp+5LIZpA4cbs+c26rKpo=; b=19cOlAOfEWUOtIWVnEeSYI9kRN
	6a+7MLUNVstMk3Cpc2GXaw6ZHHTOxh6ReQHGsgmsSugaTZ5gaXVSJV4Bsjh2Ve4//5Zi8Q4ptVhv5
	BQ5V9KdGEesJ4ib7NTRN3ZaY5BMbPwkcW8erTUxAh3gfJtoVrcJzZ/FIEO2IJqINlPUgN9a3A2FnO
	kur0EI5eegiyG2ylG7avSGTepsJOV0CRV0PokrLTQ4eL9V0ZHyokplksaRikYMQokXMEAmFYT1hcI
	XzEUQtQHqChytKlAFMwh942xg5TuDhJWEZxt26UdB6Iy7gau62HKuGMmepD5Y1J5C2Ue2slkvuyXi
	b1st+dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISMN-00000009Uu6-3RbC;
	Tue, 03 Dec 2024 12:50:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISFp-00000009T0y-2gK9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93EF3A40D14;
	Tue,  3 Dec 2024 12:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3D1C4CED9;
	Tue,  3 Dec 2024 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229828;
	bh=/R3T2dCUOvRsYvV0jA+tDFl+fxMd64EFAAAyTy0FGKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S1vFpBrE+KOjDQhX9btmNlDoQ7n2hTH1UMCBPiTEZu5fJndDDozTJeMOcWSu9viyz
	 Rck/tX7VRhK7HcZHVuzRL7BF4ypcbHrAZgL3VCosPx0EzKQBeGGZDgVzqNi2DauqZG
	 YnRKDwdjfxKG/x0QZ68vZuERobCN7rhX+blJmKvgSZp2oIH2wr+sgL+UUhUleZvBej
	 zezd5vvQpohWyUsvzkhwsMfFp1A+Tue0iVe29fDxSZHuFZnRYgldYWMTXvexLjB39K
	 3y0hWhh+HhmHogJCk2Z2CBw7tw//w3aOsSHHkojHDrJcnuCPslDAkixcVDS8Hdwob1
	 uNxmXg4YqrMNQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:39:21 +0000
Subject: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/R3T2dCUOvRsYvV0jA+tDFl+fxMd64EFAAAyTy0FGKE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvz1m8jaBl4lRtzxxJijmwJtl0qRMO2NKOfX07of
 PveHS9+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ0789QAKCRAk1otyXVSH0BK7B/
 4jbxft2DQuYdbfgTfcFjX9jH+XzlOieTzA/ksj8rFkCcphq/fO/RAaGhLDT5tcDNBWQakCvBJ5vFIq
 iX4SqEGf7NtgaSsjV5tFnKLg8Y2MRpCWuZ6tFgVdooRFxsoRbuyx4sfR9EbL0GFthB+8wm7WFtcMJB
 odzwdRAkRXLvzphBAsoZMNkCVicDDdv/J5FCbGO6IwqvTQZ37gYeFhaTzsSqss/oPLWj507smCyfg5
 Id19FyEr+bsySDaTPyKlr9rS/5vNUOiYGlyBnwYlI7zkqgcPICMrhfclEBr9p0UnN7PTp0PkZfmcOz
 OaDXOFVJyFdNczMl5uC4W4PyYEeQIf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044349_759649_D7B99B0F 
X-CRM114-Status: UNSURE (   9.14  )
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

DDI0601 2024-09 defines several new feature flags in ID_AA64ISAR3_EL1,
update our description in sysreg to reflect these.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 911f16c82ebd3ee98ffed965b02a5c6b153bc50c..c5af604eda6a721cedf5c9c68d6f7038156de651 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1566,7 +1566,23 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64ISAR3_EL1	3	0	0	6	3
-Res0	63:16
+Res0	63:32
+UnsignedEnum	31:28	FPRCVT
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	27:24	LSUI
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	23:20	OCCMO
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	19:16	LSFE
+	0b0000	NI
+	0b0010	IMP
+EndEnum
 UnsignedEnum	15:12	PACM
 	0b0000	NI
 	0b0001	TRIVIAL_IMP

-- 
2.39.5


