Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3392DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J/amYTKuN5haorsgwaKpTG+QmBMHe7keeBZMV8QJ3hs=; b=BT/DbZ7/A0OtlR4lC+qPBHyAMs
	3rciQALCo3kCFlAf37c+4mGzo/7LlvOudOgy0OjB7OkTIayW7Tv7ZtS9LYsoOt9CSk76agqKdGRfg
	qGoe83pfiKlEhZ2hQSAaK9htp56IWcGArcTdA6yi90vC9UyD24mAYIFaMhKjPB5yo2+nN7j2U2GD+
	JMgfYjyfOdIgzHrZjwVGjdSc9XjlVbpfl/Lpj578kXATJtv9CAoo7XlQMdaIc+kmYGE6uOvXbz3Dz
	KV1Jojz0R7xIOmAuIiO7UsmUqkvSBPgq6iXd60g9Ti2cAyb0/kReMzP0X+x0ELr6yjcQ1Z0QfmYPc
	ctTrfMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whl6M-00000001lhn-3hDJ;
	Thu, 09 Jul 2026 09:31:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whl6J-00000001lgW-3Dxk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:31:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB37E357B;
	Thu,  9 Jul 2026 02:31:17 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 174E33F66F;
	Thu,  9 Jul 2026 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589482; bh=Blzkef+vFl6oEiCGDH7RYNN90UCJTQHPs7D692yzfSs=;
	h=From:To:Cc:Subject:Date:From;
	b=MHc9sccaZKDuO9jTgaSCj4DUQqaXcPUV6zIdVrtUfAkiInpOEHfpQmc0altcLjCc7
	 qRZc4URa30EJElenTdeE1MJucDI+aJlYnFxq0V3x5hiylzJ0Bf25FH/jVoHmFTM3ap
	 CVSw5Ucc2uWJTazHfjN/jbpyxOzb4Db1prLxN0v8=
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
Subject: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time conversion to be per-arch
Date: Thu,  9 Jul 2026 10:31:08 +0100
Message-ID: <20260709093111.367851-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_023123_851626_90B9ECCA 
X-CRM114-Status: GOOD (  12.82  )
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

This version fixes a couple of non-functional mistakes in v4 pointed out by Reinette.

The patches should stay together so please could this all go via tip.

Changelogs in patches.

From cover letter of v3:

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

v3: https://lore.kernel.org/lkml/20260515140612.1205251-1-ben.horgan@arm.com/
v4: https://lore.kernel.org/lkml/20260706160639.2136674-1-ben.horgan@arm.com/

Based on v7.2-rc2

Ben Horgan (1):
  arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()

Dave Martin (2):
  x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
  fs/resctrl: Factor MBA parse-time conversion to be per-arch

 Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 drivers/resctrl/mpam_resctrl.c            |  5 +++++
 fs/resctrl/ctrlmondata.c                  |  6 +++---
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 5 files changed, 42 insertions(+), 11 deletions(-)

-- 
2.43.0


