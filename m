Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13CFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8d+wooMnY2WYKP9i1iBb2mStniBrlOevQvWAQwCUla8=; b=HYKFFVOP7CGMdcRiN4h8cDyzfR
	ZmmwuI4s8Yc3z3oErzH9Dt8Q1GnZ7mgImmDKnLf4oXkAcw03Yvf8ztEgTgOptg1eCCV9Ah2qBLzlk
	cMx4Z044BSvh7bmCeHGkouv5ZKKRcQCfR7LS5yOMpulF9Ets3fNsxTlCiqrU3Zk5NtrsXDSV2jpOJ
	X8ARIq9B+VVJASJJhqURgITSDFXD/uJbF2IMV2cq6NWpgJEwNnJocK62Lt86SO/M3Y5IFCRWxYHyD
	yYUGG/O9TbXEChvk/FRKxZ0rNGk2v+kj7xrMjcBe5Zwx3vMuNCTzXCbXNc6s48eddvUnlLTqjO7DO
	1rOWMuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURmH-000000094hA-0K2N;
	Wed, 25 Jun 2025 15:11:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOFS-00000008Shv-2fJ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B57E45C270F;
	Wed, 25 Jun 2025 11:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EE6C4CEEE;
	Wed, 25 Jun 2025 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850701;
	bh=d5H7XLcR4Rtj+Rj6OZQAl1e1bSehEWOuVd1drKJeL5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sfW3mKV7Ytdx8hMQecRd1Vqsdsyv9tMqqvbXxxGz4vUcj/8dYYK1Nw/GxPDn09xtS
	 Buyl3MoaZdLtapEnnidcsQ7KflQc3XNl4ri0lGuoViKl7CKqAYA7z3KjXdEd/TcHHq
	 BSHvp6QSKvGWiwX+N3pfDZiQbWMfhXYdHP9KZ+rywoDtJ6AaVzV0Sy6Lu6XLAeegDH
	 RtC8YQt9PBtfM66e4odB4QQADewstFig8Z2HueAjD+DnhdEvyH+pLEQvetjbs7CPiA
	 RXRNNKlDt47VJXbzkmF/6o6Mi+sV1ynjcwuNp0947wXcX9VD2qRF5zK2Au3wyRhwjv
	 HvVaeTGt0eytA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:47:55 +0100
Subject: [PATCH v6 04/28] arm64/fpsimd: Determine maximum virtualisable SME
 vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-4-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
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
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d5H7XLcR4Rtj+Rj6OZQAl1e1bSehEWOuVd1drKJeL5c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9xo98IrSXv5WTcOKPpKcGTvEVAPF5A7vwGuy
 5NSYUKsOk6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcaAAKCRAk1otyXVSH
 0CLQB/0a9lvwCPmsjyKYw7c9zx/gaw7CFvWQ2jEkPLj6mcsahRGzA3bvQ3D2/eT05lo4pEItT7X
 ssPLYuvowOxyFN3ALLOqFxNOqUVFXV9n03XVCyq1YpfLQ/7UFVVsGaEG58kP4nw5ssnu6LpYBKU
 P4fBVhvlTkH1sR8eiVT1K8cimB6v/OEt+a5ZeFILF0wtFHHjKeC8btXlloGN5hj0x61Ds7U6YO6
 z1KkgnahzMu5Ns7s7lINHiqrxK3EmZ2AAMPiH/UXFgVXJTtiqj2sjELzP+Xh6Jq2DHZwfSg/ZTK
 dDsKGYYeeBJqO1Qz3B2zni0kZkP83slF5/ShVXQ1IwawPTS3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_042502_760082_48DE8618 
X-CRM114-Status: GOOD (  12.73  )
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


