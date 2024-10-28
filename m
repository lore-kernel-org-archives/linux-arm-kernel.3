Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E95D5B14E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Grz4baRT2sYO7m+zBvvsdW+98xo8S5dFJc3y5JnSN5Y=; b=vd5rlsiMKHthHdpqJPhReIRbbG
	VvLAFtD4diCf3VNU0QkR2knX4xkEhH7RVh+erlhGtf5+zdUjOELm1T/s76khQgzQgZ2em4Meh2Jtx
	6aSvBOL8/2ktxhJlOEVfB3DdE1mZ7IERHT01iY5ehduJZ9d+IObdGmFSWIYiWJGuMV5R6GyDejjfP
	KWCj5RySCt48bROIuXnfB0gyiQUB6dZOifvd/W+V232t0cXRt/g9AUCgjVLChNw5wXd8/GxA+S4Ks
	MzVd+mYgrZBrHqgcTvC5YbkT4pT+fYtdYea1x2X8I/tztKyffsANkFTTdjwayXakF1eu7ZypzsyZn
	fag+zkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wo7-0000000CGlz-18Nq;
	Mon, 28 Oct 2024 20:57:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WJo-0000000C9VP-1DMk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B7A7A42A20;
	Mon, 28 Oct 2024 20:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8E5C4CEE4;
	Mon, 28 Oct 2024 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147187;
	bh=d5RZlEZoZQWLA36Igji31xBn/i/cyogK0e7bQd2Qjxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ca9O+nmc/ULVPHICC06J102/ac23bPptAvij71woBc/CiUdXPY1jqmfSks2EyLu/p
	 LoS16hYAFSVSg8m+bmqFH0fsyEkpBfa0n+GH6QpmZeIUXURu5kTQjPThOEdlQD2Imv
	 XzrKZmNmKWDHAB1XO1bBfIooUH9r6j1GjfB6qTkGaB139mFAMk1UJZSixvqHWYRUeI
	 o/ql74U9c8MYpy4TyuoAIhg2i9g+Enk79ELpXhKqzybDI/bzcnTFQZgqeByyMVxh6a
	 ofzyoMsqm/15ZQ44vVVFWu6/Or5AOlILDQJNRa8doRxvctMITpSRHu/38bL9imYla2
	 hT5iMIVRqS9WQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 28 Oct 2024 20:24:10 +0000
Subject: [PATCH 1/9] arm64/sysreg: Update ID_AA64PFR2_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-arm64-2024-dpisa-v1-1-a38d08b008a8@kernel.org>
References: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
In-Reply-To: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=771; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d5RZlEZoZQWLA36Igji31xBn/i/cyogK0e7bQd2Qjxc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnH/NmtcwIhaUHJF6vujwEbcssTw5+zAnH4nKBXEeV
 7p/j+eaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZx/zZgAKCRAk1otyXVSH0KnMB/
 44tLFchLAec/zksuwpz3Xuq+jtawdVudOA57yX0bSZwwDh1CaftQpmVtcS1++VJj+vTEsSNABNu9ZD
 JPEI5cbOvMO2t3paBegspl6GMFRxFO4HHaAhgnWpKOymESR5O0xNwqx3OVQNLhxpKTIo1OheeU61Vi
 eM+OH3NE+6Awp3naCglIlW53grpKnyfOuDHk1MsDR4vZpilHo9/eWUq68dqU8pyoloRr0PZbn4R1vN
 HfeBayZB6S8JzUiqkoPeMFqQqsvN0b5HafqsJYpuLZ3kNrWjdm2+hsmSVGAFaWxZ/y28S4O4bhExam
 BDS0THEKt/mtt9BA+lSPalvM33K9kx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132628_421550_853C3A2D 
X-CRM114-Status: UNSURE (   8.55  )
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

DDI0601 2024-09 defines a new feature flags in ID_AA64PFR2_EL1
describing support for injecting UNDEF exceptions, update sysreg to
include this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8d637ac4b7c6b9c266156b4a8518d8d64c555461..72d6ff1a9c7588dc4894ec6d673791fde108a857 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1010,7 +1010,12 @@ UnsignedEnum	35:32	FPMR
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	31:12
+Res0	31:20
+UnsignedEnum	19:16	UINJ
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	15:12
 UnsignedEnum	11:8	MTEFAR
 	0b0000	NI
 	0b0001	IMP

-- 
2.39.2


