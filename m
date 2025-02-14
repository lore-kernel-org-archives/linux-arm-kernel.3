Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245E5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY0M834itZ9HLuOiFw2PGYbsLAkt0XC2nE/lofGuHXA=; b=ZWJgrrnJdeE8qv/4cM3hp0eb09
	xlrXCL4B02+FEmTmBxMLI2oq3GYQtkAp80922pRoIBKNbFr+XAAjsb4vmWSFyxPN4hcQCUiw/CQAL
	S7R1igy47Zu6BKx9iqiIh9+xN+xnVHfeMhQgVdzS9sueRPAq2MEJu+S/mI4iUXeyhSDrmueSwQFt/
	2LNY9EYBDb5X9IZHTYX4mYKAHef6YlFDBUxai2zXyzrfFqyDm9chV3huykVE4QXk7pKWB781tghzr
	8UECuTtpxpngHh7hxNfWdUqwjvj8nLQ9UqHdqJDaYymC/NBGE6PhLIoWuJ+gU7QGA3lw7Tq+OLqD0
	eXYO1LYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1til7q-0000000DI2W-38M0;
	Fri, 14 Feb 2025 02:08:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til11-0000000DFAa-33KT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC77A5C5D16;
	Fri, 14 Feb 2025 02:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E4BC4CEE5;
	Fri, 14 Feb 2025 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498475;
	bh=+gTXyuJG+4alj7Z8O0ic26r7nPfJ09t8rfP3IksQrNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oppBD8Mh+VgoUav1n0iy4kXmEhWzocHInFGhSjH4xH5LacUhAfLxMhT99I09n0swz
	 S3gZQHI223FPQELhjz21BFDJNMHpQujkpcsyS0NNqRCtbcq5EA+CESYBC4uDbuoR0H
	 pfMZxFREhdANmsuaL4f6oxSchy2rltOiulETeOioZz7POhPb9gdKLsSfQkWKIMnkCn
	 mm+Z5hMrM57sFg6E8khvMiQbdtkGjKbSfOwwkDqoLcagzlEXuFvqxY7SIPZjrC6SfE
	 M4hQHtjDoRieL1WTCWBdg3MJ2IZ4n8z9QGZALeqMzCmk74GuBKoUsYuo/o2/0VHhcI
	 VwKNmdhq3VWsw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:57:47 +0000
Subject: [PATCH v4 04/27] arm64/fpsimd: Determine maximum virtualisable SME
 vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-4-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
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
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2233; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+gTXyuJG+4alj7Z8O0ic26r7nPfJ09t8rfP3IksQrNg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPDRtk2S5+Jo3UtnGjeSFTuDlPifRKhKFHqMatq
 FmIQXBWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jwwAKCRAk1otyXVSH0I9YB/
 4pz+2vM34dF2MTdxTA95WEyw1G7Xxpfkyb07v3+RWTdlzfj5SdfDrYYSb/fCQnO9EmBhmJPacRvMmU
 jtYPs0X/DT42+pIJWkSHMZE4D0vf6Q8F3wovBNyRS7ZQYzShyPAqgFCKog+m9XKSl5Tf5Kdtceewwg
 WqFpG8KfSGzR5FWtoCzabPN6o91I1SJsBVve8Q2poJA4p9wxH+gyfGkDR30b744tZpvGCCX5JYS7GM
 FgHtfPNm5q+GAQHddEEiTrXUBWi/NdPh1LxsOARy0VpCMjUcEYcz9bSvGK5j0odgYti3NUv4TPD5cA
 F832gK8+xTPy5ZxISPVBAfbS6EKU4+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180115_858682_CC42C9BA 
X-CRM114-Status: GOOD (  12.21  )
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
index a97af9daea472cc57bafc0564fdfe4e327924db1..e3ac522977ce68b2330f7be1f4b5a9e7dfe6fd09 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1276,7 +1276,8 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
 void __init sme_setup(void)
 {
 	struct vl_info *info = &vl_info[ARM64_VEC_SME];
-	int min_bit, max_bit;
+	DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
+	int min_bit, max_bit, b;
 
 	if (!system_supports_sme())
 		return;
@@ -1306,12 +1307,32 @@ void __init sme_setup(void)
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


