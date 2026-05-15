Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDF5CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Kb8W8Z3so5mGE+XFjODV2PPXlgtaQH5TFZ6b6DcJB4=; b=RyYMUwIBTYWvajI90OWUsLo0oq
	dllF+/ZlMxGtDbi/nBR+TY9br/+o+5QKOWIhJlfrmPdqbZY6Mc0BZzY9FHhwMUKNrTNcoQLKSoXII
	tBfpojLLzMHbFSinXDMK0st/3GIcUpdd1IkFkCr/QY1IWFud7pD9HFnu8SIvr2sgNpG3YwdCLvQwx
	TvjswFViTEhBglyFZKp2EsNTKPPjdmMVc+MmsNzmGMIf9EyFS+T2xx4LLUm6ujpYQ87VNEbB3vFws
	veoZqgWOQEzA74nNC6ks/C/6tZQSzubWa6f9+I1P9JliYO0A60YRbXQmZDrgHOcnse7h6v56ysPzH
	qyHo98Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtBQ-00000008Wc2-3ZPl;
	Fri, 15 May 2026 14:06:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtBO-00000008Wb2-397J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 14:06:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49DDA2923;
	Fri, 15 May 2026 07:06:20 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 464683F836;
	Fri, 15 May 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778853985; bh=92FbUOwThLkQI1YMirCwdfld6AI0F1cy25HxoL3c/k4=;
	h=From:To:Cc:Subject:Date:From;
	b=r0N9wc1aiLGjVKxRj0SczgEXdtXj+o6V04WIR5xn2JOxphg3trzVBX0jrt1J6nGJ6
	 1nB6ZvM8mygUEPKLwlM66unrHynqDu9gVB9eYqLkgQGeIu3hAZ6Ez3EzGq74yOmEAQ
	 pGrtGWpkfSCtSihXnlQ/uZjQeAqlK7Q+tdtrRyFw=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	dave.martin@arm.com
Subject: [PATCH v3 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time conversion to be per-arch
Date: Fri, 15 May 2026 15:06:09 +0100
Message-ID: <20260515140612.1205251-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_070630_905871_D1E72A79 
X-CRM114-Status: GOOD (  11.55  )
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

This is a new version of Dave Martin's patch [1] to delegate rounding of
bandwidth control user values to the arch code. As there is now more than one
architecture using resctrl, I split the original patch into two, a core resctrl
patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
break down and ordering is sensible and whether the pattern should be followed
for any future similar changes.

This does have a user visible effect on MB schema when using MPAM hardware
with 'bandwidth_gran' greater than 1. I'm not sure if MPAM hardware with such
coarse controls exists in the wild but it is spec compliant and I've tested it
on a model.

[1] https://lore.kernel.org/lkml/20251031154225.14799-1-Dave.Martin@arm.com/

Ben Horgan (2):
  x86/resctrl: Add resctrl_arch_preconvert_bw()
  arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()

Dave Martin (1):
  fs/resctrl: Factor MBA parse-time conversion to be per-arch

 Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 drivers/resctrl/mpam_resctrl.c            |  5 +++++
 fs/resctrl/ctrlmondata.c                  |  6 +++---
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 5 files changed, 42 insertions(+), 11 deletions(-)

-- 
2.43.0


