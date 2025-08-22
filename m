Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E14CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8d+wooMnY2WYKP9i1iBb2mStniBrlOevQvWAQwCUla8=; b=NOrXLsj8P4bWegcNnsUCg/PVha
	SkwJgTqbqS8J1w78c36GGSiGlPEJSyxYwPMsKUxHyAOdYFQKIVCJIY3bRPJmpf59KfkGvdM75NybL
	8U2lNMfdLlPQ5Hg9Rn67Dqj4iw5T9yDTB6jaSrSe5nVboH7MwjVvBcZcoHczL1d1Q0U2Dxrr3AQAn
	zxa25v9nzz1qIp5ecc4BOHKdUJ8/5RCva4mwv60itMbsvZ9U5l+gSENdZTC0VTaiJTA1F0O9g4kcR
	bluzkGujd87HtnjTXljQNSfOZym6+bfW9mgRESFJaAqmPRjtpt/AP+QvrjBDud5TBWl3ssCcS3nrY
	IG7gMN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLNN-00000001htd-11dj;
	Fri, 22 Aug 2025 06:35:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGzP-00000001BWH-2s4a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF60DA58767;
	Fri, 22 Aug 2025 01:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3040EC4CEED;
	Fri, 22 Aug 2025 01:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827686;
	bh=d5H7XLcR4Rtj+Rj6OZQAl1e1bSehEWOuVd1drKJeL5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tibW+k5SwC+EQm8WETK8o5ITo8euhu5ASLP6FreYV63JafnswXALSlNjA5fe0BBUF
	 utSEukgiYNWb9rkXIO1sltM19IZux+zjdKo0ghJcqZy0BsXULblGupdC9rsILKQea0
	 2hZfYIXE/paPuG6XPOM2M0JIoK4FfC365vCZICUQXTx6pf+6npuiMla1120UivYIVd
	 NemCtEqTe6FSaaDKfTJaI1d0A0ki2CHwZOsLUgNo+qKCmB554CAH0lar8dKJuLNxjd
	 e0YazioxY9CAmiA4qZvtRpX9RW3W2s/DHxZyT4dQNgmwFYnNZEhpy7MQO789AGnIXy
	 nywxNayD6D5iA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:34 +0100
Subject: [PATCH v7 05/29] arm64/fpsimd: Determine maximum virtualisable SME
 vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-5-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d5H7XLcR4Rtj+Rj6OZQAl1e1bSehEWOuVd1drKJeL5c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop8280CPUlyvzjydHYRql5QRxrmhiav3FGPaDs
 n+EnHbXasCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNvAAKCRAk1otyXVSH
 0KRVB/wPGSAtQ4s7ogb6sHyi03Q7frhO+eVSnrjqlh6UjiulblrEjYQ7wSeyZTfca1wam4DKPI0
 95VzhCW05qMVQMxAgL+SQwE9ACbEw5rW4lirttju1CI9uhSLeXZo0FA0BIthS1Q6mIa3Jqd6Np2
 FN/aBsF3co7dWb2CoSuHOGxiBnVPnkbRgTtECO3aqeIuqHpQPUV2tFQ1bdw40kFH3qxfgoQD/1/
 6a+WWCldm9UV/yNVifW+6Oz2or7emXDQRckHyCcI7TPwl20PoJ5RaZr6b6Za4BQ/1XUSR5nCvHw
 U3UjS069dgR6Prii3dKV1mKfBMZzLPZmAFu3Z1D/Cp5AZcqa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185447_860373_694AC2E7 
X-CRM114-Status: GOOD (  12.76  )
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

As with SVE we can only virtualise SME vector lengths that are supported by
all CPUs in the system, implement similar checks to those for SVE. Since
unlike SVE there are no specific vector lengths that are architecturally
required the handling is subtly different, we report a system where this
happens with a maximum vector length of -1.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index de2897d6208c..fbc586813f6a 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1244,7 +1244,8 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
 void __init sme_setup(void)
 {
 	struct vl_info *info = &vl_info[ARM64_VEC_SME];
-	int min_bit, max_bit;
+	DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
+	int min_bit, max_bit, b;
 
 	if (!system_supports_sme())
 		return;
@@ -1274,12 +1275,32 @@ void __init sme_setup(void)
 	 */
 	set_sme_default_vl(find_supported_vector_length(ARM64_VEC_SME, 32));
 
+	bitmap_andnot(tmp_map, info->vq_partial_map, info->vq_map,
+		      SVE_VQ_MAX);
+
+	b = find_last_bit(tmp_map, SVE_VQ_MAX);
+	if (b >= SVE_VQ_MAX)
+		/* All VLs virtualisable */
+		info->max_virtualisable_vl = SVE_VQ_MAX;
+	else if (b == SVE_VQ_MAX - 1)
+		/* No virtualisable VLs */
+		info->max_virtualisable_vl = -1;
+	else
+		info->max_virtualisable_vl = sve_vl_from_vq(__bit_to_vq(b +  1));
+
+	if (info->max_virtualisable_vl > info->max_vl)
+		info->max_virtualisable_vl = info->max_vl;
+
 	pr_info("SME: minimum available vector length %u bytes per vector\n",
 		info->min_vl);
 	pr_info("SME: maximum available vector length %u bytes per vector\n",
 		info->max_vl);
 	pr_info("SME: default vector length %u bytes per vector\n",
 		get_sme_default_vl());
+
+	/* KVM decides whether to support mismatched systems. Just warn here: */
+	if (info->max_virtualisable_vl < info->max_vl)
+		pr_warn("SME: unvirtualisable vector lengths present\n");
 }
 
 void sme_suspend_exit(void)

-- 
2.39.5


