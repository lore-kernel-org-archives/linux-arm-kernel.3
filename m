Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CFEC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DZ17nkwaOQX1Ry75B96jb+3IYC5o9lJGyP6gefePd1A=; b=JwxY+IH+mtaPPA
	JuyN5C9dCbKO+73MkrxILVDgiImq2xg7483AZpaz6IJLeq7DNZZVKY1V1g08qI/o+oNs+wDJ7hH4z
	3ry+TUOnYgLgr04xHojwI+DXjx0+T5NCz4APo7JeDd2f3R+dDpXCf4UKpOtQw8NJonp4gPI+3a95E
	mxBZvXXfVrV/p4efsPJTeaQoDVEoXFw+0+18ZPfMiArp6NgiHV0lUopO2xvDrfIgg7K1G2d9LfAep
	MqopCR5bmP6b4CEa7qMRObzaL2HCn/3FXMmBiBbf7/urZDOyOz3zNTzq/emvwcb9nWqjhw1RzacRy
	tkhfqYsdbEprJZHPRmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TDj-0000000Cxde-3iRx;
	Tue, 01 Sep 2026 18:28:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TDi-0000000CxdJ-0yyP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:28:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A5126024D;
	Tue,  1 Sep 2026 18:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B831F000E9;
	Tue,  1 Sep 2026 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788287309;
	bh=DZ17nkwaOQX1Ry75B96jb+3IYC5o9lJGyP6gefePd1A=;
	h=From:Subject:Date:To:Cc;
	b=MjmMF6LFQchdLUm35LTdJETPmUmy20Nu47wIcj0y7wC0krD1lr0WW2OkWk6jezp8B
	 x6D3cB6wsbgqRIOymvfbHk2wKqoCRpHggkc/1HIm1k7MO+hrDRHZzr34DvpO3qqIWw
	 /TeW5YE/tcveclgZQqgW8J6L6ugMsHsmUCfGVgfhsQZc6s3iL+45/VVh0wfEJGP9CL
	 DArEIQ67X/hhWiN2dAttGHmhDExhH8icE2KOjfAuOycW//e3PpM2kvtUclpkPJNcoD
	 CwIGEUprMnbcK+tCBc19Pt5W0RBTLmRORxPOVSc77PeyUt1zeAhEC4oYh8VDGpVnIM
	 AeWHYwSQ5fHYA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/3] KVM: arm64: ID register finalisation fixes
Date: Tue, 01 Sep 2026 19:18:47 +0100
Message-Id: <20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgXl2oC/3WNUQ+CIBRG/4rjORoggvXU/2g9IFyVTGxgrOb87
 6G1tR58PLvfPWdCAbyFgI7ZhDxEG+zgEuS7DOlWuQawNYkRI0wQyQ64iz1Wvhc8HTw0uLZO3bC
 UutJcVEVRKpR+7x5q+1y958uHw6O6gh4X2bJobRgH/1rDkS67byOnG41IMcG5AaYKQYXR4tSBd
 3DbD75BSySyn6Yk+ZaGJY2RRgKHWgtO/jTzPL8Ba8ltlBQBAAA=
X-Change-ID: 20260729-kvm-arm64-idreg-final-77cbc46b558a
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+dFE+7EzLEkiE6jfGPnSNlrfWwJnRwYhHXPMgBHmCRg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxlF4j+HJbcm36H8e+fO16hvAP+CQkFxtceyx
 QRcMD8OOgmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcZRQAKCRAk1otyXVSH
 0GtnB/9CJKtdJM0ZJQ3JlXNsXyLGUEZ4O/AhMabNvUlAN2I+gO/DTilSBKbKHcIvYyFLmsYAgpi
 5RGLFKUmRRlljz53ZDxmsO0JV8QXo5kauMbsKxm4dU5bksgsHHO9Rwn+K5b3s10SFn5DswiLMY2
 xfuYqxTTSyYWHzowRy0g1DOLyTOOtfmcmVcT93HITBp10o1U5omF0MIN34uHHQ9EHL6ii4UXxh9
 P+GSUlvmidWZd65XE3XTciM7nRWkmUIzcpuNuHg+PK279HEWxh/ehwdUdqyxQPJxedWZfzqofuE
 kheSILhI57YL8JOrxat4qCPUJ8zdxf29wRxl5b0y+mVG5Ese
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

While looking at some feature enablement I noticed that there are some
scenarios where we can end up with an inconsistently configured vCPU due
to finalizing configuration based on ID registers before we have blocked
writes to the ID registers. This series aims to clean up these issues.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v3:
- Rebase onto v7.3-rc1.
- Explain why KVM_ARCH_FLAG_ID_REGS_INITIALIZED is not reused.
- Pull in Fuad's test cases.
- Link to v2: https://patch.msgid.link/20260803-kvm-arm64-idreg-final-v2-0-d7d7e4efc640@kernel.org

Changes in v2:
- Also replace the kvm_vm_has_ran_once() usage in kvm_set_vm_id_rg() and
  kvm_vm_finalize_sys_regs() with kvm_id_regs_final().
- Link to v1: https://patch.msgid.link/20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org

---
Fuad Tabba (1):
      KVM: arm64: selftests: Check ID regs are immutable after a failed run

Mark Brown (2):
      KVM: arm64: Finalize guest-wide sysregs prior to per-vCPU sysregs
      KVM: arm64: Block ID register changes after we rely on the values

 arch/arm64/include/asm/kvm_host.h               |   8 ++
 arch/arm64/kvm/arm.c                            |   2 +-
 arch/arm64/kvm/sys_regs.c                       |  57 ++++++++-----
 arch/arm64/kvm/sys_regs.h                       |   2 +-
 arch/arm64/kvm/vgic/vgic-init.c                 |   6 +-
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 106 +++++++++++++++++++++++-
 6 files changed, 153 insertions(+), 28 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260729-kvm-arm64-idreg-final-77cbc46b558a

Best regards,
--  
Mark Brown <broonie@kernel.org>


