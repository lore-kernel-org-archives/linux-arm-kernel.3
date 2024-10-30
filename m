Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB4ED5CCB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BcUR4WgMD71KizwO9zUGlZyjt1hViz8r9BhCnOrocU=; b=umGuKR8xNfQ8hitLY8WgWX4Oo1
	GS92jZZ65wjhVTBG7DQl/MpXEwegR2THmcC3KWczz1FNE671kuImlrpQgBQmr2oUIvUpRN307RaGS
	gjnj2XLqOmrsEpLT848PiN/Viypwws6YOPZdsD5/pf2CZD3NaICmdgGToojlM7wpe3FFDm+TqyVjl
	uRWsOdQ29cPmNCPtXN933ZqokZ8AuxLBuO7+YXjQ+nt9bSA8yeHwjGPM9eV3FiSyzj9Hoj+jpGkF2
	Vvf+e76LHpBbWB25in8w7J0Nt8TxeuVut5HX8WG7jJKN1krIq8DjiJH8gvhfT2EW7OJ4hTdRJt+ib
	t+OBfseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Axx-00000000wj0-464D;
	Wed, 30 Oct 2024 15:50:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AoP-00000000uU0-2EYw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5628FA41896;
	Wed, 30 Oct 2024 15:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A47C4CECF;
	Wed, 30 Oct 2024 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730302843;
	bh=7uuIvssgPmNN0rgvBR2HltfMJC/cwbms6ZSXTgQ7BIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G0GEjD5TISJvy742IzGbutfQ4u50fqrtE6HT/1KDZoAqdIwCacF4B+ELV3Phzw075
	 u3xr6eUQMVY1HXbbaMC+KLf1rY/5Xyc4ScbBfRlQXnhu+i3LqUHmgF+UjY5N1BQPYA
	 /uMTmjkpApWqugyNtwMWgsos/pYhliZ7gyQtzCoi0LIGBlqZCbkN0A0bSxXJCF33ne
	 nnYr5Osh52eXcFHZjfHpT9IggF3OYa4eLhYoRwTYS0ISjOPffwiiU7S8VzjXKb9iNh
	 b9JmIr0J3QRrabmxh/Dd8RlaThUcr/+xQzM+iHJ5C5eVCVvF+DinjZ03bEWSwYooU6
	 fG4uqgNRKdJWQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 15:34:50 +0000
Subject: [PATCH v2 5/9] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-2024-dpisa-v2-5-b6601a15d2a5@kernel.org>
References: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
In-Reply-To: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
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
 h=from:subject:message-id; bh=7uuIvssgPmNN0rgvBR2HltfMJC/cwbms6ZSXTgQ7BIU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIlNlmqFXYjzlAlCleWYLZpTb+8rwcSXpB6aLPkxg
 2uJuMA6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyJTZQAKCRAk1otyXVSH0OLeB/
 9tGOp6h37kYClv9jN/aC/4qihyegiYjXXkNcXYiywjXz5HddE36KCbkBr/u9bE0kAQnVEIifc+VgFI
 D+21doIjudj2FKa2h7k8r6AA1hH6wIHCQeZUbNXFeKXuaoXetVWFfb1NW5U64LAQ2bTY0blaltd6Ns
 yvNTNUSGvIy7hswblRPIHrH0R8qxHH0yCermzxKP6x4RqtwyPFI6Yg/7q4bNnuW6y1mgqpHrKJH1zt
 BirZGBvnkL1lwWL9NAwQnNI8r9tx1oosh8eUGJM0zLq9hR40HSmcW+uWRIXLEm0K/ac1mBLNu/EvkW
 QShh2xor+bI2vOKYZn1o/4TGgo0j+h
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084045_693112_E71502BE 
X-CRM114-Status: UNSURE (   8.91  )
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
index d487c78520b97c8f96c70181e39eccb91d6fe1af..808bbd6d3a40a4cd652ac25d686f11ccafc5acf3 100644
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
2.39.2


