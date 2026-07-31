Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7350AC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWlLd/PWbYINVwpXcYMDnYu5TnVLNXcprwUMzPtexF8=; b=rDneZiNwelzWA31YLyJvtYWL+a
	6h34phPoUqnbw3HVAVEsPNRLWmYyp377mu40H5zm8TfrKi3s3qqCOO0gm5dWrv3vZBuaNXQ2MBfnu
	M4TIemrabZ9JxCHC9xrQa4B6kSH2TXFpOri2OufWMMptCuyHvYjZ3PEpwADgOn4D3xiD6NFodh2YU
	6oEwp42v7Ao+QG6c7C1Ql6brkti+8oUhI9eBUo9UEQT/zgxbdjVmjO9jere0vzHymCBcO2UCwEUsq
	SnDV+35ynC8KDrQQ65dhNLr0dz7UFqVnaCwBxR34W81DFJvdNpBxOIFKpc8Weo0fADXKGAToUsNaF
	MwXjwYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUg-0000000CUZT-1mPD;
	Fri, 31 Jul 2026 12:37:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUc-0000000CUXq-2012
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:37:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A8DA600C8;
	Fri, 31 Jul 2026 12:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772C71F00A3A;
	Fri, 31 Jul 2026 12:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501457;
	bh=YWlLd/PWbYINVwpXcYMDnYu5TnVLNXcprwUMzPtexF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=egRCpJ+H6L+w3dfFkKpNxYqBDFcAfJamNTxxvLvPTRHAwFJhD0+M4T+jLanaPb/nR
	 8Y5XiOe+qRVfIzEfyEh7SSoc3HWPyVbs4ZdfcT77E6STAMlIWQotJIbfb/DnCb/sjc
	 ybBn1SxXXceQOaH7zwKnf7VD7K6itJbzENMDW8Lp+eGb1uW7msVkqXsUqBrR45Cf7d
	 P6YW4iDZK6HnMqcSfbcnqJ1YyqPBE/DOGPwnR9HmBIsSu3mXzkHmsu/GGFDdYRZJrO
	 4RoAN/GxacZnShtYPam+C6GAJOIvJ0s91srYxH40hX36YlcyjDpTRtpp1WynQ8rU1m
	 47gPHf7Hb8Z2g==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 13:25:40 +0100
Subject: [PATCH v17 02/14] KVM: arm64: Fix FGT mapping for
 HFGITR_EL2.nGCSEPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-gcs-v17-2-5e39ca01b14e@kernel.org>
References: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
In-Reply-To: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cmvAQBxB4SuCRvDZjmRe7yIsmwDDWXuwPP1P7cDHpHg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbJb9ryZUssM2383dLfuqVg1a8N+tHrx4BX//v
 ut2+kHJBKmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamyW/QAKCRAk1otyXVSH
 0DYtB/99NhOxMegqJU3W95X2zE4hKONTVBnxagZmtOjar4WNxeGTnynGNqBFkuofmHROtVyR5qf
 RAVtiM/OlvilZ05gDNa7FYxJhYS2QEItKQsJgVeePGFNnxwGsW+ECl4pxhIaDWIWX7RO/1uZtyq
 g3m8ftYPH8/Sx8H5b5rGxxQzZl83CUdL4KoBCcgcsmwXMXxYFbMwqLtfIBgzfFN9BEdQZFxdWUY
 970pEYgMRmcfV2MC2lzC8SJihKVDVRwAVOMVKFeus7PajV/x5MLoIR4sEgcIrEhWC31rQijnM4y
 2LbswYOhx37fuy9jIVWFVH7UJwvNEOcZoJ2Yp6Jly73SDTes
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

The encoding to trap mapping currently maps a FGT on OP_GCSPOPX to
HFGITR_EL2.nGCSEPP but as per DDI0601 2026-06 this FGT controls trapping
of GCSPUSHX and GCSPOPCX, and not the separate GCSPOPX instruction.
Update the mapping to reflect the architecture.

Fixes: 863ac38984a82 ("KVM: arm64: Add missing HFGITR_EL2 FGT entries to nested virt")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3c82f392845d..b32742d9dd73 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1432,7 +1432,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(OP_AT_S1E1A, 		HFGITR, ATS1E1A, 1),
 	SR_FGT(OP_COSP_RCTX, 		HFGITR, COSPRCTX, 1),
 	SR_FGT(OP_GCSPUSHX, 		HFGITR, nGCSEPP, 0),
-	SR_FGT(OP_GCSPOPX, 		HFGITR, nGCSEPP, 0),
+	SR_FGT(OP_GCSPOPCX, 		HFGITR, nGCSEPP, 0),
 	SR_FGT(OP_GCSPUSHM, 		HFGITR, nGCSPUSHM_EL1, 0),
 	SR_FGT(OP_BRB_IALL, 		HFGITR, nBRBIALL, 0),
 	SR_FGT(OP_BRB_INJ, 		HFGITR, nBRBINJ, 0),

-- 
2.47.3


