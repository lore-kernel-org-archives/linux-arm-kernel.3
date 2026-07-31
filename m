Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D59C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6yW61SMZr04gIIPBlCEQvBwEJCF0yd/ErxiSOHKrD2E=; b=F2K52ivzfjGCw9
	T4MdZObntYc22XYWVOKDg26idSaqf4kg+TIbdmuUwXDVNz9/rwY1QSUMSBZ2w+A/5+pGmuhuNoZz1
	kX+EjZvx8KrAJelqCC/xubk4go5S9irsoPdwGIJoDLun64wLcm/x8TiIKlfmdLhdtjKgjiqGB4nP7
	CcHZw/WljM7jCF/oNqAqOMF0Dt+1On+ZXO3iHsQfo3ZTiF1rzrYl4BZQ/qIa/XNjs4gagPxJNNGYn
	OWRqVBSy3jVnTv/2ybYKdGWvka7vHXuPq/WET76Tio2tg7bLEOUJ29nJIJM1QBAdwB2U+13Du/2Ax
	GkE7wvhR+F6pr+bjTpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpu7m-0000000DZKl-1Ona;
	Fri, 31 Jul 2026 20:46:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpu7l-0000000DZKU-1U7J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A985600C3;
	Fri, 31 Jul 2026 20:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7BC1F00AC4;
	Fri, 31 Jul 2026 20:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785530792;
	bh=6yW61SMZr04gIIPBlCEQvBwEJCF0yd/ErxiSOHKrD2E=;
	h=From:Subject:Date:To:Cc;
	b=RhT89E5uH9wfvNQkQCaD3r7jsXJWIYCgk07+k8KUc3rvJLcAMedqZmsPc2s/JSeBB
	 lWlQoQdqkrI1Fyw3gS6/y8msYqNVbf6bCIXPSUGMS6OdGSrf0BSfoTDIAY17HoAQSe
	 UVlXiY4TCB7d2pP40Li9MruFvaMHkaURwRU/EQqA/JjQAdqPCvgnH9RBoxZgTePe3l
	 21tFIpLArR7bhFBoewm3mQ2qg+jMahg/L0YUb3WYg/y8Gp3JT7k4vREvVhgzg0mFuL
	 SbWTZ3XKe5n8SAEWVAMpq2ZvRiwvVr1PrjtOW7e9YxZAOiwOuKUFZD2bJdMlfBzXET
	 /Zpv6cNpxINvw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] KVM: arm64: ID register finalisation fixes
Date: Fri, 31 Jul 2026 21:44:44 +0100
Message-Id: <20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD0JbWoC/yXMQQ6CMBCF4auQWTMJNqVVr0JYtGXAUalkisSEc
 HcLLL+8vH+FRMKU4F6sILRw4k/MuJQFhIeLAyF32aAqZSqrbvhaRnQyGp0HoQF7ju6N1gYftPF
 1fXWQv5NQz7+j27Sn09c/Kcx7DLbtDzVMynl5AAAA
X-Change-ID: 20260729-kvm-arm64-idreg-final-77cbc46b558a
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PdJJXOt98kzJz4gtUFAIu6dqJF4USgdFMdWL3Slu3eA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbQmjpvTPrvJBcFud78RS/97Dw9ezyY2aHz2fO
 Vv/3qRYOuiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0JowAKCRAk1otyXVSH
 0I/FB/96JM8c0/VQoss2cShl+HCAfsRCd7T1f+E29p24JbAVPFrCvcvRUnSTfw4i9JqfjX3Go7b
 J7IL+afUmtjwtAqvQAvogbCc0TE0GLNHou6Wg0mjq/6u1ecVxS5kkFHRv1LwluJsvIhuniVS8F8
 XyHrDFvZpV8eVEf6Pprg4oYXskgDvi/hDo08A4w6fUoRR99Rn1mheh7FNvAlS5k1ldq3sn3LATN
 VTajkc+O6YrEo9WaHYCNnvvWPuhaU4boMlStqXsfdtc34Jj1JqXbAAoZkcx02TLBv8zePXcs88p
 O+fg2BNdYOapB+aE8ulcVcmHs72ulkDvo3wHopZmNKXOXkWk
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
Mark Brown (2):
      KVM: arm64: Finalize guest-wide sysregs prior to per-vCPU sysregs
      KVM: arm64: Block ID register changes after we rely on the values

 arch/arm64/include/asm/kvm_host.h |  8 ++++++
 arch/arm64/kvm/arm.c              |  2 +-
 arch/arm64/kvm/sys_regs.c         | 53 +++++++++++++++++++++++++--------------
 arch/arm64/kvm/sys_regs.h         |  2 +-
 arch/arm64/kvm/vgic/vgic-init.c   |  6 ++---
 5 files changed, 46 insertions(+), 25 deletions(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260729-kvm-arm64-idreg-final-77cbc46b558a

Best regards,
--  
Mark Brown <broonie@kernel.org>


