Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1987E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jl18VJ/+szJiCfvy7E8i7qqjtUKoZbatSUCN8/Ew5cA=; b=Ey2KWWW/RWUCqV54ZdnZR+zXUz
	70A9AQCca+XJwzDyIKGR4KljGq3AluxyUU+xBI6WYFvwGfaTmRbhqygfS9bDLpHN7pvuSrFhKmL8u
	CNmVBEx+OgcdrlSH9403UlLCZ+ZVgIsuGLdIi/bSBj6T0qaSYRZWb81spoaiRfP9Hd/JBBQ9W29jX
	ShSKObGoXpoomQFQa9wnHS5owzpJSt4maMClYxEJaJKHm95GweorviUMtfnlDWPhzUEfflxf+4iIT
	zE91rsCj9Ac0m71FM+a9K6uhOldXvajw9ZrJaPuuag6HnjmCbrt1X5A2FQ5WEWwLrDXXFrY/+925o
	4RRpU65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBCW-0000000DNC3-1YAg;
	Wed, 11 Dec 2024 01:07:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLB9T-0000000DMNy-3LWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D244F5C648B;
	Wed, 11 Dec 2024 01:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC8FC4CEDF;
	Wed, 11 Dec 2024 01:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879071;
	bh=+YQiNGxuReZbhRyHsK58fKXnEHlrUTfoqeBLUdyrvis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YXs6NC4+lw95Qtea2tDdeLyYZjrmzDf7dE0QQBYikfky4j9y2GANmtaw8gty4xY6c
	 QtgUSU7EM6rbJWWA3gIGOl+Q9n4yMFa9VZ6HxJ/uxc4uczU3zyLn9DyzyDS0p80dAS
	 R2Xk9/rkpCTNOXVRQwfGr1LbqhJt1kBH9fIl5CQLGLqlhxYJme+Lphlcsv90zBHAek
	 4hePp9W79W/EeNQbUBRUyhrQT/iAxH2fq2nNvbB3VKwJjXmC5Zgbd3xKjDsAYBjHiW
	 OKkWco9WWQRR8C3480D+D/3FzI7a3szGoGkVxsPDYJ1cGTe/VFy9C0F8tG8czcwLUY
	 YTGeDr7G2WMrA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2024 01:02:47 +0000
Subject: [PATCH v4 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-arm64-2024-dpisa-v4-2-0fd403876df2@kernel.org>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
In-Reply-To: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
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
 h=from:subject:message-id; bh=+YQiNGxuReZbhRyHsK58fKXnEHlrUTfoqeBLUdyrvis=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWOUQ80C4Zub4NZs2VfYDJhImH82ICyjvpEDJbvB7
 SG7v4NSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1jlEAAKCRAk1otyXVSH0EC6B/
 0RFPGutI+vIH8jF5EGtW53cB1rpdiueDzb2YaCdcmLCEeHrVcXPhy9KfpTuHIs8/8yAdMarcNbH1nJ
 33zwvJ/vpMdTP4n8uUAo4U0vnlYBf5QsoVaHrbzwYsG34N6BtnZsQoNG0upCM8xWMzAeClowxv6aWM
 K7W7JKC7GIj2sZOGIpIYXJdDLIr3eocL//sF1KCGQYqvQHMyi8vc6j4YlEtjr0Ler+zemOhnr98vs/
 FV9AFIl8uA8hQfiV4d+sGXE5rb9aKRH6RRxxitYpq1mLAcf1Zlsm1q+Bg6Ia5x6DleEHtoBa46iKd0
 pVEadGgrT5qQjFTf9HSWqdyo9MMqB9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_170431_884566_6F0E917D 
X-CRM114-Status: UNSURE (   8.49  )
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
index 911f16c82ebd3ee98ffed965b02a5c6b153bc50c..6273068fd4fdef145cb7dd49e2d9bee4db467975 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1566,7 +1566,23 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64ISAR3_EL1	3	0	0	6	3
-Res0	63:16
+Res0	63:32
+UnsignedEnum	31:28	FPRCVT
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	27:24	LSUI
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	23:20	OCCMO
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	19:16	LSFE
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	15:12	PACM
 	0b0000	NI
 	0b0001	TRIVIAL_IMP

-- 
2.39.5


