Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B55FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYJ5lD9qhNL0IAuFdN5B4kbqJL1+zSXn30fdOCHv4fI=; b=Au/cYnGWOVD93pOGUCV8agSO+f
	oB8r/JcZl4mH01ug0ocsKf+AOoA/nLN/B512na7MwQc5rjZlmU6M/MfFk1r6y27N1zumB3Gs/r6wz
	8dhjHAWi3+92sgLIgisDr+EpnyX9smLZcO9pNcMXYCLljDfxWE0dlq37sxoacqoVdTDXmgMlGZ1hI
	jNayTxe4dzRh5ZSAhcfLaD/oNMDVvmuS7i7fQ7m8n5w1yOubk+/HPo9njW3F/HJjWvYcW9DEV48Io
	pxe8u3WEbxCshrNTW6fYqpAUQhSy+UP/4BHa9iokbFpJWNRjuTF999iniL5sDGA8jhpAL6IcGYBcC
	TOqMcsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokuX-0000000EHrX-1EIA;
	Wed, 20 Aug 2025 15:39:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojb0-0000000DzD4-2RMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F01EB45B27;
	Wed, 20 Aug 2025 14:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919EAC116B1;
	Wed, 20 Aug 2025 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699321;
	bh=OQQckPddTneOzG/6ku3q22aHRtDHjLTy5HAplDzg1tg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GNWEv3kRuhJHrg6O8tl9v9XZLUFLD5DX16vsK30S6lje+sJFYSmjGbB5HpZj/VPgh
	 TDjZKX/ifXH7uGh2e+lt7646z7sUlNbnz6+lOCG8Mz8jXy7MI8j1YuGTTbZ6xvJH57
	 jipPJ0uow4hRXRF1c9KdTNVp7S/7eHElmjC41cq9gGl5NWpuyuvWT/+siB4JT/9bLe
	 /aNUEQKLFu8uTm2VkYmAVmqpyepUEFvJtP7oB+4uX3e0gzpo1f3/X+2vkk3/0bUNcC
	 ONwDv7rhR+cpmmZAq0WBuge5vLArgQg88mDxDZj2kF5TweQ54w0nK3wrsLdzD07/Gh
	 iecJL+cNHgT6g==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 15:14:41 +0100
Subject: [PATCH v15 1/6] arm64/gcs: Ensure FGTs for EL1 GCS instructions
 are disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-gcs-v15-1-5e334da18b84@kernel.org>
References: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
In-Reply-To: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OQQckPddTneOzG/6ku3q22aHRtDHjLTy5HAplDzg1tg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBopdhuIy7mFDmV+0H0uG28RgkPLA3n2FYlocioI
 EkRcIIBg3qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKXYbgAKCRAk1otyXVSH
 0EAMB/9fwOu0l6w/AEd6V5PAmGwzmw1euLwLI/cTXKU6biaBsNLRTXJ/0qSF5OuHWpuYaFtAvb7
 5JVxDwGYoBJUtTP4kv7zLeHbkkP1xc3a3HFYU7tMh7YhvCyxsIIFFGT1wIHS2NW00PUT91fY+hy
 OZnNkn2ndCuLB0FXpxCyUhYzLPtOnPai3lWS6jy4CY2PAjpILWDLWIYP9C65647CGACa9rgKi3+
 vE5zmbmP0py0s0vB+n7RJZOPZvS/FoTmL8bZTf0fGuUap+2ssl3Lt8NCHDc3u8Kc+AUZ5qaOdHt
 XS1223r7Fnm1G2lVW4qLxjwGKhlABshmaJQ1tpwiRIKjHWoT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_071522_647554_E2EEAACC 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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
 arch/arm64/include/asm/el2_setup.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 46033027510c..0ac14ea4dbc8 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -355,6 +355,10 @@
 
 .Lskip_gce_fgt_\@:
 
+	orr	x2, x2, #HFGITR_EL2_nGCSEPP_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSSTR_EL1_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSPUSHM_EL1_MASK
+
 .Lset_fgt_\@:
 	msr_s	SYS_HFGRTR_EL2, x0
 	msr_s	SYS_HFGWTR_EL2, x0

-- 
2.39.5


