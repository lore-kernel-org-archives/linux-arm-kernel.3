Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AE5CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V4svUo4P4CXlXoJxsKPVlmllse5h4ylOqa1tyiqduE=; b=i3iCUmVPUEZplBvxSFTXa6iyYd
	1NVpejW62IOaFig0sDPcjO+3mGNq4rYe8/9Mir/ot6TZIYeccRIMJlyn1eiWYyWYLMkwzz2916Ai8
	fsfN1fmvv+ANvEraSscEwPulCyq7yHkJIm0UQt/fzsVllHrdaKP+6MTZ/niP65+0XIhtZaVwTP+qL
	2eQiaCS73YIS/ItJNO4CCWDibnkSqMHXjMZ2A9rjryaHrlaYFRdh2qe5Ujp4iCU5lKMteNYCJzZqS
	H7p4JEp3sgE6nk+RbNAHx5XtmDc0Z8nyKLrvz4J0gN2O+xE40Ylw+0HbS94nSkrLNRGbwOLQ3H/vY
	eGLuwWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQpR-0000000HYdM-16wT;
	Tue, 02 Sep 2025 13:13:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPR4-0000000GyWR-2CTb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE43E6020D;
	Tue,  2 Sep 2025 11:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A08C4CEF8;
	Tue,  2 Sep 2025 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813465;
	bh=G6Ht9INfK364jYp0ofZOIq49bsCw7bcFjAmT7TRHKx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SJIhnvVYQuFR9TyxTzl3Kl/dkzJQBx0GRXQOcgm3qAQHYpngqcPgEfq3e2fUJJSm3
	 9+YTHYRmssQPG6azFD5RIRiYQp1nEEx1OnR3iPIflpAdQsTgvPWP1VXqA9QylndJBN
	 qkBofMd3J79V6SMXhwA+XfbQzNLtv20skjt7ab+4gEB09M2gBZbqEyaepbW3zmhztS
	 HZAYmn9NbGk4iBWmrcZN/IAM6XVE0jNZP+ACrXee1aep7KsapDcYGrzMmad8PFwdx+
	 Ys7hXRDF7AcTQCIrO9LROqUI0IBzRCUzgeWOn0a+XtZAFBPx/57if5ic27b4ds/tTN
	 3gyJ0U2QXf8ig==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:04 +0100
Subject: [PATCH v8 01/29] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-1-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=broonie@kernel.org;
 h=from:subject:message-id; bh=G6Ht9INfK364jYp0ofZOIq49bsCw7bcFjAmT7TRHKx8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBotth6k+2hoSImM/h32YbvKVktd3/3yir2UgAmJ
 scXtjTK5UaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYegAKCRAk1otyXVSH
 0NxdB/9u21D4uvIMz1tC7G+VW0wrH0PjUX2Cu34VnLsxk0WqrsW4URtOXQmUKwJvW2ah0BGmP6X
 J5d6odTp5J/yYibDWw7QpAq4zYu54l4fmE8RfTE3Og+W2/fTIdPCTW0uaBYw9WP1oUqfbjdkZCb
 4RUkXRjFP0eb/D8djZouXRY9tFhvXu4pJdiDMdkYQF6io2pEHKE7Ts1pDJnLAmlusopxQxWcQjX
 bEjuhtL+n6AytMok8B6FHRX6YarG3rPC4kUK5qpKn63P5+oaIE/WpAShqzioqYMHZq/XF4iBjSZ
 zxoK7e/peNR8mJJHA1qKO55MoHjS085cXTHp+HlzR4uo+G8W
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

Update the definiton of SMIDR_EL1 in the sysreg definition to reflect the
information in DD0601 2025-06. This includes somewhat more generic ways of
describing the sharing of SMCUs, more information on supported priorities
and provides additional resolution for describing affinity groups.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 696ab1f32a67..9a1adb234ff0 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3659,11 +3659,15 @@ Field	3:0	BS
 EndSysreg
 
 Sysreg	SMIDR_EL1	3	1	0	0	6
-Res0	63:32
+Res0	63:60
+Field	59:56	NSMC
+Field	55:52	HIP
+Field	51:32	AFFINITY2
 Field	31:24	IMPLEMENTER
 Field	23:16	REVISION
 Field	15	SMPS
-Res0	14:12
+Field	14:13	SH
+Res0	12
 Field	11:0	AFFINITY
 EndSysreg
 

-- 
2.39.5


