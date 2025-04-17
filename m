Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D08C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 00:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IB6KnCvyFKqWNjlIplI1rCDtKPJIZDEzjKTpGji8Gcc=; b=SJInooBvWzW0Pa3RR+eCIGyROI
	jikCkdeTWmdIFNBjXA6PcOxXWx50oVGv5/B/zEq+F/2YdGtvm+z2IEHW1dZkaLPNrGz2CDbqfCc7F
	XCEre7tKJdNutMobVTt75zVMwat64iN4HTEuFI02+7zZCUEi2yLRuoF7rYEbxBt9j0HcAbDr9h/j9
	+iIfBZWjBln3AYgpu3YiCddTeuZv81+NAgnCET2bLPKcMKcSzNGEmiLbuInFc2+B77Dp2r1FEqfNT
	dTUA1f4pwjRiRQ3VMqbeOppnCu4kp9Zu3NI1Y07sFFC/ztPvOuQFogK1aAzR262zCqRaDBQIe4XUB
	LTx/RtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DEB-0000000BJyj-20Tf;
	Thu, 17 Apr 2025 00:35:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D4r-0000000BGmF-0O5n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 041DAA4A89F;
	Thu, 17 Apr 2025 00:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40CAC4CEED;
	Thu, 17 Apr 2025 00:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849560;
	bh=pnmYCJgE/nkEzGjN1xsLpA3poTKMJm9x0l7BvusSFAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fDCEzTo6k8vauX6QZxob4zR5IdBqfQG9/LBGploL4Rw+4x37UEeadqXly3TOiCVkk
	 +rc/7SpLVfLlXaWO5avohmEd0zWsW7chf+tfFiui1MOvDAKWbtRuE/bG1D45hk2nRJ
	 q2bozicBrs/jrCYU9bW1pv5DRRPspE3j0z1YSZxkNQJc4koA51pjqCmeYNbR9TOVX8
	 1v2OG4o2khssaslvIoGBly2Ses1hhT5kPVqAG2CnrP7cOdcEwU7tR1dz6WM0JklhYK
	 9NGPQaA/Oo+z/dvz5qH0/yq/Xb7EevIr8sHdI3r7c2MU6sdabqz59NGx+xyTdoFQcK
	 oU7g9N6g64oaA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:08 +0100
Subject: [PATCH v5 04/28] arm64/fpsimd: Determine maximum virtualisable SME
 vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-4-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pnmYCJgE/nkEzGjN1xsLpA3poTKMJm9x0l7BvusSFAg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEpyqJW6FEgBtMbN9D20fjorXEvsb+J367A9+HaO
 cv+12yyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKcgAKCRAk1otyXVSH0K9iB/
 9iHNXyxCnCRC0GZoAVZ9Oz/0hMNvuJ1p2hmggRPj+Gwl4uhW6bFIUlM7MFA23oCUn3BvukVr0GHTj1
 2uurVbhQ2uo01VD3KNMo95lOpwCJXGeLCB3inYPJHev8JKn4YioCNAXPBS462JwaIsp+yFCSFzPoqb
 +mCfioy7NElEABy/s7QWoC8oRbSaFFLtXaJ0qQbgMowrEME6NNMXCPOUG2vM85UF21DPAJhMtGE8cn
 nmYbHCxUNkoMLIsknnNAdVaIrBVQJ8KGi9M+Y/AxqB9h4c08CDV1VPH8xrCX9xUVZaTDz844lzC9nS
 gUr8MKjjYwMzWEJ1WVz6erXLVwYHBS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172601_267943_DB83C4B4 
X-CRM114-Status: GOOD (  11.84  )
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
index 83a4f8d3e895..31b3ca061bb2 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1249,7 +1249,8 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
 void __init sme_setup(void)
 {
 	struct vl_info *info = &vl_info[ARM64_VEC_SME];
-	int min_bit, max_bit;
+	DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
+	int min_bit, max_bit, b;
 
 	if (!system_supports_sme())
 		return;
@@ -1279,12 +1280,32 @@ void __init sme_setup(void)
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


