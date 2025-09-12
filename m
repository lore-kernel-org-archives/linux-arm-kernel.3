Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178FFCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEA72t30VldlFjicHb1hkTnzXTTMollyaDImXI8IrfE=; b=WOdF2+y+Xcol4LHdN/1vTGyiN5
	v2zN6QxXFkgoTPS01AKO9ydPIJ856Fq4z03OW3xoMVNQn1j9+/9l3J1wyC6l4/0uk/WPuVtUzqGsG
	1Tp0p1fjdMYOnZpiiAClai9aOzJMz6+HHKjx/s/PYbxTTAuINXf1LCJHDXTWbICGGJKUAyILIagiR
	vM7uZTai6Ek/YtcfKvcw9Mpjf/axFKvwMEpzpdDQ6z0mWXe1KxOfJHTid2YiMr/2UXeO8HjTwCMKl
	i6vjHAeitohv+1SXyPES9djOYS2KkrTdcDzbjkh3lK/HPtphE5dioecxFLrzgoTt0U+tdE048aqfX
	U7zAflLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1qy-00000008qae-3Qn9;
	Fri, 12 Sep 2025 11:22:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1qx-00000008qZr-2gQf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:22:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10F226023D;
	Fri, 12 Sep 2025 11:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A234BC4CEF4;
	Fri, 12 Sep 2025 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757676126;
	bh=a7v6V+1etb8iiKXRjxUma/LMQuFjf/rSgVqbyq2ZhUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cuzy0Pok0pnKc3GOM8TfILUvN3zFNGTU81T85egu9IGbnz9wAD5TY+L8HQX0VDM7j
	 ESRr0Fs1JEsxFppMDmtchO/4boSTPNNYTGzNmkWRZO5qd88yBlFX6pJcbeL6m3XpNW
	 jfNmyncqV8AtfB4pg3LZ4Y8KQoiLXuyfXZEva3SiccJlSn4t+4umlSggt0aRiPsNBU
	 pIaepVEGZ4caj0HdyFB+c4qfibVe3KBZecmA2SrG4O23NsAoanfmMpNpvLTsxI05mF
	 euoVVXdLwF913xFQit2vdVvu1tjOMlV2Gpf4AQTaNzPFqljsMW3ZrlCgTMjtZRJw7C
	 h1WXntA8WOu8A==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 12 Sep 2025 10:25:27 +0100
Subject: [PATCH v16 1/6] arm64/gcs: Ensure FGTs for EL1 GCS instructions
 are disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-arm64-gcs-v16-1-6435e5ec37db@kernel.org>
References: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
In-Reply-To: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a7v6V+1etb8iiKXRjxUma/LMQuFjf/rSgVqbyq2ZhUg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoxAJUhkh3JG/R0IYWg4xGHGXuPOIYtANMJtlNz
 GPNwWcl1t6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaMQCVAAKCRAk1otyXVSH
 0PtDB/99Zwm9Uj+D9vpqCwCG8A/mNEwCm8ll+dZs/C1WO8VuKkHRz3lQ7BCu/JNDC21jxnMGNX2
 jNsYKkbVoIc1xhbggK84VQ+7733IRrQszs29I/vQML/rFjJCWgULRVDDegp3PxvfsTokwmsszj1
 CWhVkaz8KxJtiFzd00LjQNe1uC7EEjfb7vwQZsjjAfJAZ3i9k0mpCdMsaRfSNVDbcc0NhlKZSW/
 L3o0f7xJmMr05I0Q1Jk9tf5gviEfAepl1WOQIh9wMXPodqfj4I7pn0V96ZBV00G1KI66v4ydpw5
 QMtgL4KrMF9wPxpcZ8vuwC/GHsRdP6FFom4YtRxAPcom4SaN
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
GCS instructions, also disable these traps.  This is the first disabling
of instruction traps, use x2 to store the value to be written.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 46033027510c..d174f405c44a 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -353,6 +353,11 @@
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
2.47.2


