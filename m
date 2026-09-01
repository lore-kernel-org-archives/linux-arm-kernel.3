Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F501C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5W37ayUUTp9OcZ1NvZJyL332jGmKa7++7rGX5259fQ=; b=4rT6gdwsRexKsVYwfHuirgyW9F
	M3Nt6PzNvUAuKogJBFpmGXH6xuHg1LrqtbBFctZjGwp+LACOMyDycyesr8aj0J17ZgmUBtLlrU0tp
	305QnommDTwPFlngJoNwzQb1ZzjbUbWs2XoirssdXnn5AFwgOjxqT/CEWiIZa+zvrlSC7f5O02Dbo
	3sSjOB5KBzb3DSwMMnwCaFIKV7C4ee9qx7K2bfq9YdAwrAt3FjB9wRKsSQAZngU2giQ0nsCJwE3D1
	WcO2UMaClwZKhvPRxdBP2gW9sV6nMjXWw1qA/D6efBUYs4c6sjmDSmrGiQMKq1/OkN6VUaWLI5mBf
	OteyC9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNQ-0000000DQ7E-0vtQ;
	Tue, 01 Sep 2026 21:50:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNP-0000000DQ6s-3saZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 21:50:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1C4743821;
	Tue,  1 Sep 2026 21:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0341F00A3A;
	Tue,  1 Sep 2026 21:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299440;
	bh=B5W37ayUUTp9OcZ1NvZJyL332jGmKa7++7rGX5259fQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O1tXmJQXdWbHBUSj0QyD/dvMCJh0uMI39ko23jLxCFXoTGrENSFz1UlAfuI9YUjuc
	 nUhT0OHwlouVyx7ci6Bvt6/CAE0Xjap399URkibWTCg8aQ9YIqhWQUoA9vkTyiaMPf
	 MR0Ik6aTSjpDbMaBsvaiZ9geURMncNkCHtfJc34ybgg28JQY0SZbTC5Y8wpCFN2iaY
	 pSwnQybHNe62KCRKMV3ucyrtwFwHyGg885H0ILS6FmCd+nwSO6UyZaggHxQxm8k7Rz
	 oOyOf1/aY1o6PcSynyuikf5PcW3isdYMuiqtIIB4zHVfRrGeIUPoZyo3MI6tH1TLYo
	 8cXDpPuC5wR+w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 22:46:59 +0100
Subject: [PATCH v20 01/14] arm64/gcs: Ensure FGTs for EL1 GCS instructions
 are disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-gcs-v20-1-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
In-Reply-To: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YKCiV3JRnowlUYP4gZAvFvJ+clFyUJvl2G9cB2ncGS4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql0idB4DcdKlt7wJVbB6ROntsyQAta8YhETgGb
 uPxSopq6guJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdInQAKCRAk1otyXVSH
 0NtVB/9mh/8qaJIgJBmwYxhtuRck4ae6qKEoj6g+12jBJAM9deBCHC2GZtOn9jE2Z7vuin2xq85
 3ILDGkDY13HakK2mBhbm+J3OI59twTVJL8325yrcuL2uQpdk2nbGMeHVX6Ugf6dnervIaRcGy3G
 QY/IPBVZL6161pO02IwcLqVE2oyD4ko6+gF7d8nBmPiCGbThC1orRYaXXrGxycYaVmr30CPzPru
 r2M/1x8t5l88fNN89tNdNPjZDI7sczsDoKdDhwPBie51aqMxO02kKPFmPVj41MZOeXHcg3IjZwD
 dvXXlZjQqhY9BsFNeIcyfXp0C1mixuaSokOUzvHcKYAOo8QF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The initial EL2 setup for GCS did not include disabling of EL1 usage of
GCS instructions, also disable these traps.

Fixes: ff5181d8a2a8 ("arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1")
Reviewed-by: Leonardo Bras <leo.bras@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index aa8ec9df8024..d308c6e6757d 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -393,6 +393,11 @@
 	orr	x0, x0, #HFGRTR_EL2_nGCS_EL1_MASK
 	orr	x0, x0, #HFGRTR_EL2_nGCS_EL0_MASK
 
+	/* Disable traps of GCS instructions at EL1 */
+	orr	x2, x2, #HFGITR_EL2_nGCSEPP_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSSTR_EL1_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSPUSHM_EL1_MASK
+
 .Lskip_gce_fgt_\@:
 
 .Lset_fgt_\@:

-- 
2.47.3


