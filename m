Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361A0E64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaHCE9OgIpmErY0WvfeOvesBKFfHCPf1FxQOg4dpST0=; b=KVLlfFD0vGE5pMDcs+ZCeWsuuU
	8Vro9UqNtokKynC/l19mXTuXakM5MpsOnJLE8lw2wiSCATQ0J6AeAkeGIC4tqhyqwyMtiKLUR8Ns2
	6FcEVXwNOHqJ9bs1+JnYxZJM2PzUieK34mMlo4wqqrFy8uCz/+NYnGZ5Xue97gCR9xTqI7jSNAKou
	6KOF3qoOV6MSb1hhPyR7+CcjZTdW9g6zkSZFvguKoZljdTAGy+ALMLMX44gJkwYVEH5GPzVFd9tO9
	pbmmLezX+zC03flrppk66gFsYbJ4FfzjZDbrTvvJKcsbSCa/f2bqB4AtHc8sf+2yJe9ZhfyGCX2NI
	XDdzi6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISQI-00000009Vij-39di;
	Tue, 03 Dec 2024 12:54:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISG1-00000009T6h-3DrY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0339A40D14;
	Tue,  3 Dec 2024 12:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FF5C4CEDD;
	Tue,  3 Dec 2024 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229840;
	bh=EJS6cgRpKX8lhOM9Z2U2OyNni/XrqcdIMqgpN3jOt9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GpFHHavnqh/65aoJp2UGMoEbiC2+a4ajKJxsQoWAUo8ocdkYupQ/zvrrqVtK/87GT
	 rH5iE5BB8RWMmsFzw42kBWbTRCcQ2I7e7xU/6+0HbfA15IZlJfXHz3RQwbTCiaiPhZ
	 9LiSBWGlCc6ev8z5L7afxE2DJoLsJkOSs8y6fEAAYUOjomZLaUgMiuI78EcTxjvfiV
	 Fa/c1xeuPDZYLwZAPe+Zrfy2IduS/zabXq477Pvm5Y3HViRr1KjTQJ/hEPvsnRmNt3
	 JrucnNpGV2YrJ0w/ekJiEt6mO/CC+O/wZiRXLLrx5e+vBKcldLKDq+WscEH+dh9gvV
	 WRwF+5Ss7lRbQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:39:25 +0000
Subject: [PATCH v3 6/9] arm64/sysreg: Update ID_AA64ISAR2_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-2024-dpisa-v3-6-a6c78b1aa297@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=827; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EJS6cgRpKX8lhOM9Z2U2OyNni/XrqcdIMqgpN3jOt9Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvz4GZPk6EOBZUaoV4zRxu7Rli0wsiye0feNwuA9
 7WLttSKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ078+AAKCRAk1otyXVSH0JwSB/
 wNUoK5Q2y/2oZkMqGqP4YcOOfJMOTRiEkdFEKe+7gJk7dpGQDlI3/GFZ/0tU7rpgltEDucIwS8fG+Z
 HxengsD/m5dqC7734pajuHEvwgo+HEOc7xSYMP7WsqfLyTXYBr0lR+JpsfrsyULFkCfdNq9f2sOOjT
 otyDCS0IzRMCXBMyIhp4P/3Ld9UYc4tsCI8wsHVTSdMYqod1+d6pjLw6FZiteF2/qOylLZgxsaEcY9
 cBLGmr5BHilHZrP+LNSKUiEJ3DyW5RRe79Dl9M9HIRSOdPtEy1pLtjr5U/2c/GUgWx5ZVCP8xaDuez
 gNT2lqpUWYGunwmUpN58nQeSqSpXsY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044401_876131_C045D685 
X-CRM114-Status: UNSURE (   9.49  )
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

DDI0601 2024-09 introduces new features which are enumerated via
ID_AA64ISAR2_EL1, update the sysreg file to reflect these updates.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0253d3847aeb2294da04b2b0b3f33f81f32c849f..fe55c04624de74a6c1a5e0be45363b9c46ff1340 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1556,12 +1556,16 @@ EndEnum
 UnsignedEnum	55:52	CSSC
 	0b0000	NI
 	0b0001	IMP
+	0b0010	CMPBR
 EndEnum
 UnsignedEnum	51:48	RPRFM
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	47:44
+UnsignedEnum	47:44	PCDPHINT
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	43:40	PRFMSLC
 	0b0000	NI
 	0b0001	IMP

-- 
2.39.5


