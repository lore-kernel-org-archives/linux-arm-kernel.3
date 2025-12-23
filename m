Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3168EE6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stHLiOmMrjV6LFItOQEj3eGYD++ibGwV7vFvzZd0AB4=; b=yV6zF69Mz4peG1f470LGHC4C1F
	5qgTnq1NEPPPdxXqunp3PVgsJgIWV4kcRB85yZad1m4Yn5/2VsgSe10XzFOkq8ImujZyAguXliZid
	i6NZ9JZOEX+ONr7Q88MCmr8m/dmGiLrBzVkW87DlDXeF2iTIzVMuKWaIHdQsUCik6LAmBgmtMwNqm
	LyRN6VqJ/tgWNkkWZFlg9bfHax0PErHgjIovlWbVy3J1fFx7t+d4ZzrUaVCh1fb4I2XvgvRmSlGdl
	vNaquk4EUqw8OlwyuWrtHNAoZh7WcWzEc2QRVIyu8JyvwnAMxkfA5xv9wi6XI0EQIzfwf6FQ8ZLqp
	M8bWnOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr66-0000000ELO3-22n3;
	Tue, 23 Dec 2025 01:21:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr65-0000000ELMP-0I5E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80CAC60188;
	Tue, 23 Dec 2025 01:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6453EC4CEF1;
	Tue, 23 Dec 2025 01:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452916;
	bh=4+FJ7+9SNzMFsLU/lZOfnlAHMAOz0MdKHDvJ4fcVrRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bI+mGMvr6H4pr6+RIaS0/WHsc0UELxttOk8dVJWS5Nj5KiDQ5QjlDUbESX/gqp37i
	 nn4gaNLTaNR/L3s4rttanfzayaZj+zjOeQMmrVRqhkbA5FFjBIf16Hju+lRhHDuBWu
	 mJmgFDdqBNMFab5QkSlKI/drSfNEeAgnDfMOVmeNsPJp++6JAMWSlkeePFCC5uM/86
	 jLicmnJIJmaveoG79JK8Nwzi+NCyC6+q38SkZT3spDsVITMSbtXvCmQqEbAzBWemnp
	 c5SKFyLNjMlNiQLJHADQJUz5clv/LEy83QyshgnoiANMBt7JCrekEOVycqDSSBftrr
	 XgoHwImiQIDiA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:20:59 +0000
Subject: [PATCH v9 05/30] arm64/fpsimd: Determine maximum virtualisable SME
 vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-5-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4+FJ7+9SNzMFsLU/lZOfnlAHMAOz0MdKHDvJ4fcVrRk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6G94IqpPKtBF6i+APEEZA50ZuCkXbJI1Xmp
 pNNMT4DhmeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnuhgAKCRAk1otyXVSH
 0HaOB/9t0imWZqpN/qCLBUFVBTic1DgibgESyXd44hvr7rrNUUATGfqFo7hScqgfof9CTCj8b0T
 0HC0+QtAtf3fPAeEJskjJ3iHr5P/Y7Gjspj8/s5XFxnb36iDbMmfWIqmciRJrA+fxvgL4MWnUXj
 6R7artS98h2mfiYUmUiTI6DbVtuOdvf/JuC/keSkmAq2fUvOPCDfoau1lQaBGjg0cL6q13SL5MY
 3mXBUVldRK31z4cr7dYMuRrjBh5jmOQsr4vZuunAniObziCOLEVnATLq8yeznT7qLKczgEbtV10
 Tg2LzX5o6dP/i+kzgBmU66U2x3YWTqPeEsjj3Nh1Htyls4z9
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
index f4e8cee00198..22f8397c67f0 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1257,7 +1257,8 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
 void __init sme_setup(void)
 {
 	struct vl_info *info = &vl_info[ARM64_VEC_SME];
-	int min_bit, max_bit;
+	DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
+	int min_bit, max_bit, b;
 
 	if (!system_supports_sme())
 		return;
@@ -1288,12 +1289,32 @@ void __init sme_setup(void)
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
2.47.3


