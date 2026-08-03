Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6B7C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BEW95Jao0151ROBkWIkQ/c3IVqod1+b1uzS5PXnlhQs=; b=kZoPxtjnnpZ+cZ
	1gqPSs5QtC4DvdAkqi52YEIMSE5wHwq7UI3L6VKsTTVnT+UnZki5B1CaJzRiXtQg2z1mqTY8TlLif
	tlWyaZyWEqUs53JSPkUhdQ7Hpumo+sT2GRJ0cHfQm4pTQexq1nZExUCNeQWu6uIy85Z9qfed+Av+a
	f9C9Ypmluz/iiO+bflCR7Uh3UuASQXHTLHOFwNT3lwfnGph3rwc2WKjiLdXz9UtiiVIyRioC+vsKv
	9l4xFfYDWqm4kZE3L/RjOmZSUpNWEGzYq6KUFzToVCzuT09dIW3cqwZlTscSECcMl5Xdn+GgLtOFv
	7hzlhT29rrZZ3YTQXmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1YT-00000000dMo-2bkI;
	Mon, 03 Aug 2026 22:54:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1YS-00000000dMY-3GOJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:54:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAA5E60A62;
	Mon,  3 Aug 2026 22:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E408B1F000E9;
	Mon,  3 Aug 2026 22:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785797683;
	bh=BEW95Jao0151ROBkWIkQ/c3IVqod1+b1uzS5PXnlhQs=;
	h=From:Subject:Date:To:Cc;
	b=S0xaIsmkwE9+7yCcnSMQJWK3J7F0OFInFjkXFlV+P+ty4SKfWRu9i7HDhapYLa6d6
	 vRWdDaocM0jmLWzWtEAB862KxgBmcvRsEvemV0QUeizbiJkIR6+/o9KFs+uhiqe5n9
	 mCQZvOJQC+078BPfo/cmmHKGefu9a3ZDbMo067PjMBQwXkjRcWiNM6WPG02b9pXVY6
	 AP55PhwnsUz/pMfHOD05FkOfcO1JY+WPOSpKUqpaEG23gXbGRMECP6T21xFP9T3UZJ
	 QnMOLMA5qGqKTIuspcItXv+1WeaQEdeB1PoCqwtIMSqFppxL384RfQEdnRR6erC3qF
	 WJNzdKpSeQUEQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] KVM: arm64: ID register finalisation fixes
Date: Mon, 03 Aug 2026 23:53:52 +0100
Message-Id: <20260803-kvm-arm64-idreg-final-v2-0-d7d7e4efc640@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAccWoC/3WNTQ6CMBBGr0JmbQ0tUNSV9zAsShmgAq2ZYqMh3
 N2Cbl2+fD9vAY9k0MMlWYAwGG+cjSAOCehe2Q6ZaSKDSIVMS3FmQ5iYoknmMSDsWGusGllZ6lr
 nsi6Kk4K4fRC25rX/3qov+2d9Rz1vZ1ujN3529N7FgW+9nyPjfxyBs5RlDQpVSC4bLa8DksXx6
 KiDal3XDwurGW/NAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=broonie@kernel.org;
 h=from:subject:message-id; bh=V4qHD6wmZpYcTYENc2vY0BXAauqtQOOFlUChMEa50ew=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcRwu+9cjYoT+wsVjiSdM9k9zLaEiXyPB7wQbW
 h4C6otVi+SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEcLgAKCRAk1otyXVSH
 0GQKB/9JXGkNVh2kHc2ud+7IKZzXysC2frp1oeRF51FTY7Uw2yhaXEYIOvTGwXRPuMA1Yr80peS
 msZ4MU51slV8qN0Vuo38Uz6zmX5+FZtAle/WTnQYhi8HhI2icVVe14FzgKgqA5EtGogNWJO+vMU
 P5NuJNOjnM8vO+jYZhvqHjrWS0FtB5pZ57Z/3P6I3qpwkuo1jJdZHHCzzBp2bY6Y2Cgw4QJlJW3
 /NM6oC6xs2KciSP/d1eG1ftIDlpWd6A0TOKLOMgBOb8v/1CV62YjvHuFTP63WESQNSLstBQW3Fk
 OlQaCNc2Eoe5bxRG+slGHIQCC9meMndC2LZBzUhIuV/QT9yR
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
Changes in v2:
- Also replace the kvm_vm_has_ran_once() usage in kvm_set_vm_id_rg() and
  kvm_vm_finalize_sys_regs() with kvm_id_regs_final().
- Link to v1: https://patch.msgid.link/20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org

---
Mark Brown (2):
      KVM: arm64: Finalize guest-wide sysregs prior to per-vCPU sysregs
      KVM: arm64: Block ID register changes after we rely on the values

 arch/arm64/include/asm/kvm_host.h |  8 ++++++
 arch/arm64/kvm/arm.c              |  2 +-
 arch/arm64/kvm/sys_regs.c         | 57 ++++++++++++++++++++++++---------------
 arch/arm64/kvm/sys_regs.h         |  2 +-
 arch/arm64/kvm/vgic/vgic-init.c   |  6 ++---
 5 files changed, 48 insertions(+), 27 deletions(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260729-kvm-arm64-idreg-final-77cbc46b558a

Best regards,
--  
Mark Brown <broonie@kernel.org>


