Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548EDC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRzgkCokkYWeOPF3FDrRjraYcAbGSe4f3k3UbSQ8tck=; b=xci+jEDdpvRj0Q/DOukMTxEkHL
	70fsDVXmJM5DZEn7XPMScAsuvgVTr2t4GCxuU7YLSlIG3Ii0ZuNEyQnznYLgeiDwlVQ5TFjJqPYDL
	Bv7Bm9vqCMaPn+YQsnhasnDeiH66jngCZvnXgYTUNatcMx09PqhmaAAEM0HkUhvzE4xsmgGkUSMxa
	MBhgYG0LMeLmlHmPmeYgWMrlkyu7yfHOaZnMrmU0CiBjOtruiTO9J764dCr/4CF3vKtx4909uzOkC
	k63pdMpIN/3emE1hbe55fgDo28Mru9ML6tqRBq2clU9LbUxNTFDF40J2rkg5m5Ltt5pdj122qficx
	Ai0hCpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0f-00000000gON-0i7L;
	Thu, 09 Jul 2026 00:53:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0e-00000000gNh-1em6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:53:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2EBB6136C;
	Thu,  9 Jul 2026 00:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEF71F00A3D;
	Thu,  9 Jul 2026 00:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558379;
	bh=ZRzgkCokkYWeOPF3FDrRjraYcAbGSe4f3k3UbSQ8tck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DgPNJUm/krhS42h9PWSRuwD5nJ2uzy/kJu9TM86brWrzXwmxi0kHClMZaj+zWU2Jk
	 4EB9dv9xyGyOZ5CmOaAd2oOLKMoXdV6OriRDWbJAttH/7eL1i1U0xE4Gq0TDKWi4M/
	 JeroJkFGC+4vO/rKxtGEl8qIPa243YZP4AoNligXDnFkMi7vYLgiKnEM116PyanRL8
	 RczWQrzUe2nPbHSLWzEXPDxpw7q3U4+n77eIkRHN2NbsN92tVIl1r+6aNtfZPaPbUP
	 XXJSxVTiuTqJ0sGUPrHR7wHCEz8qPWXCMz/tQn/xrKY7GotFN5UAq5clJFZtMtKD5r
	 a3Fagh+8epEIg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:42 +0100
Subject: [PATCH v11 05/29] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-5-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382; i=broonie@kernel.org;
 h=from:subject:message-id; bh=++3RupEjJl/hieRBq4Zb2DcRHMWp0Yu3DKnrxPa5BCI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvC9yq76eGMiMwaDMr7oe2zDUIgL1q2FX4Aq6
 Eo16wMr1deJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wvQAKCRAk1otyXVSH
 0EwaB/9woeMSozzvqL+P4vTBAJ50aS146ENpqdlNNNy+A+UXyHqE932HU1lx5Z52Np7ZpkeCDSJ
 nXhP3ZLJcd+Hu1xP1TgYZ2g+59QyX6x5ZSNq0cVIigfvr5YfewJqBPKWu4ucEmMl5nnS1k70ZJF
 1ncRWZ6rqrTacCbLSOYfLkefbxHS+1mJS+TsAgyCcSz/PfTWSK/YoG/RAr9xSQrV12Kt0M3p+Vy
 vBd6QM7lvLaFqDY3sXHIFopYg9ADRIPgX23VSEd/QCs6WOhIxiX+CJ3N/NcXC/PUtbkm9kJ6rei
 LLlh+Zvir1jVl3hKfHAcNPjrQlOSjQ8smoxfz729ScHdbXln
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
happens with a maximum vector length of 0.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 5c156e2a47ea..7c4e69fd3922 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1277,6 +1277,7 @@ void __init sme_setup(void)
 	 * minimum available VL will be used.
 	 */
 	set_sme_default_vl(find_supported_vector_length(ARM64_VEC_SME, 32));
+	info->max_virtualisable_vl = vec_virtualisable_vl(info);
 
 	pr_info("SME: minimum available vector length %u bytes per vector\n",
 		info->min_vl);
@@ -1284,6 +1285,10 @@ void __init sme_setup(void)
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


