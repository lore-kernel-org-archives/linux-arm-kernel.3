Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A435BCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ZtNrk6Feyb46SX9NsCxGZaoPNBMUhdFMGziOw7Z23U=; b=na68HjktTROebb
	4yOUUZEDygx93kv2LVR+eOHVCR/Q2d59vDZuBJ33M/C/XRonimZF8Pmavbz5cxHthmMynvqYLkup1
	E1OPKHIEmvvurwFTpteNa65WduieWjKetoYNFdLQgQXsLgttpWBNNpMSRg+g/pj+L07tyRYVKGUzr
	7wrPfX6AE3CQkULOL2oHwV6J26pHhRFcEmD2W5sOEJEYihW5jKBRDClGI9gSaUtNNHKAJcrlBJ/0n
	oCyzrnFffhfslzUL7CLyqCSzZYtk+a7E2Tpe/9BWhrUqWYbjYYdAhDObgpS5PR+eY4btaNiXaZj/P
	uXBQthzV8yvQlKCT9L1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWTg-00000003SrM-22oO;
	Tue, 29 Sep 2026 11:58:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWTf-00000003SrG-0OyK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:58:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23B11600E2;
	Tue, 29 Sep 2026 11:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4866F1F00893;
	Tue, 29 Sep 2026 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790683109;
	bh=2ZtNrk6Feyb46SX9NsCxGZaoPNBMUhdFMGziOw7Z23U=;
	h=From:Subject:Date:To:Cc;
	b=XLPSLl//hsV/lQrXXyHVg2sTRVxKvp6MFRqspNnu+geEl68vjOq9iZvgKdd8AYZG4
	 9kAJPNdv1FaaW0dGg5AuXLLsPvphF+YBOI5RRZxIcD8Ri9hMdjP9MYHAu4lNvDljer
	 pSK0EY5n7eUJFCHm8aPCC/YP53VovWjg66gQkS2i3hT8c3FH1zSGYq9reXDkzbTc3A
	 UoCWTzSI159TbR6nmKKLhVdRtgIPPNYbl7M/Hv4Y/3qaMa0SoEfth3n0ViYZTUVDLl
	 yM6jT8PQw/gcQ9ZUXx6d+omsMsbiHCK2awcQvuS026dMZ60LMmkMqSEHoOhqvjRCiB
	 8gp0STOG49l5g==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 0/3] KVM: arm64: ID register finalisation fixes
Date: Tue, 29 Sep 2026 12:57:57 +0100
Message-Id: <20260929-kvm-arm64-idreg-final-v4-0-75296dde994d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWnu2oC/3XOTQ7CIBAF4Ks0rMVQoNC68h7GBYWhxZ/WgBJN0
 7tLq0ljTJcvM/O9GVAA7yCgXTYgD9EF13cp8E2GdKu6BrAzKSNKqCCSVvgcr1j5q+Bp4KHB1nX
 qgqXUteaiLopSoXR782Ddc3YPx08Oj/oE+j5h00brwr33r7k45tPet4PlKx0xxwQzA1QVIhdGi
 /0ZfAeXbe8bNJVEujAlYWsMTYyRRgIHqwUnfwxbmIqsfsMSo4i1igirSkl/mHEc31WJFvBbAQA
 A
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
 Fuad Tabba <fuad.tabba@linux.dev>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3fRHoFrdFC/+mzB3bxZWw4z3Bm5m1AurpfMP4seD45M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu6feKMIrvZsHSK/zFAg3R5tYhRpxnNfzrr2qH
 Zyvimut24GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarun3gAKCRAk1otyXVSH
 0DLeB/448XCpgPI9But5nNSXH4cx69w/oaJ0novPibHHj8MYUFDozhfVSeBKksleTevffKxKmHA
 etGGGl/S3qWJMIg+LVqJX2M8bNZn6ocs4EX4uAUu+1rq7sJYDyR3MyrRvQXm7nOEqsjwQNgkWD1
 RZvgsWadIF4fW8K4NtyPn9XKkswV58cDgTI2I5wcDQKE9sy9xdM0Lgq5hEktxDU4JXypTFwJW9A
 tsduRmSd7eP1dKQU2dwGGB+vUZMH5sRh0J92yR3v9iqiiMjWjfK8Hi+MMPUPEr/pKGpmm+1ewIE
 QKt7SLcO3U3VyC/HKx7EXJzZ2a3z5hrB3xkURcEac4oviJOn
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
Changes in v4:
- Rebase onto v7.3-rc3.
- Add a lockdep assert.
- Update Fuad's LLM tag.
- Link to v3: https://patch.msgid.link/20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org

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
 6 files changed, 154 insertions(+), 27 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260729-kvm-arm64-idreg-final-77cbc46b558a

Best regards,
--  
Mark Brown <broonie@kernel.org>


