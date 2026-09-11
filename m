Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E32C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j387I/0sqjFwB05bkLmHGjAhBNnksazCX9cjre5EQbw=; b=TPzgwnHrhF8mcp/FoMSdKhov47
	Krvp4R3jqCJ645Q9+OcfEwiRTW/vPjI+5GpUpwJJkoaMdye/BCBFm+dsOz+G58MTwd8dbaJzGLIwA
	2U/4/BGaz7PLFs+X8XyiHxGX70ymPT/nTW0v1D4DaY1hijaQSthMtIuFDsnsfh9XfvBB8Xije0klI
	VzS92bkvxyfajNyIIdU2etXe7j/HtzyCRMtGQjtjIYBLSEXoCZKd3bOLIjSxp/oeuocUhk2ZraxIJ
	Z2XpQkfgzjv86O9Xf8bfN+kZwb7ZPK2YS4caUi9LsfsXNnsTSeqSfH7M2Uu+E3eoWG8DNWHeLQ//4
	k1i0XfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54Eo-0000000HEhW-17GP;
	Fri, 11 Sep 2026 16:36:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54Em-0000000HEgo-0oai
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:36:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D572B16F2;
	Fri, 11 Sep 2026 09:36:20 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE6143F7B4;
	Fri, 11 Sep 2026 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789144584; bh=D4N2CYpqGur60EJ1BjNnNqN5DBpOGqb3/wXKxHx+xQ0=;
	h=From:To:Cc:Subject:Date:From;
	b=kZ9mqL+9GLLtVycu6xZF9AIp3+Fog/4VSLxTviBivJQuKDEZiWAu7H3HTyE72AKvT
	 ooXeRwaSZ+i5DlfIsCpRDUZRMokU72uchgIi89zkPR33SdTQlPgcpS1l6XcMNeQR7t
	 2ewIZKQ8NJ/EXAEUght7EvzDq3e1kkilBMC603dQ=
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
Subject: [PATCH v6 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time conversion to be per-arch
Date: Fri, 11 Sep 2026 17:36:10 +0100
Message-ID: <20260911163613.1131447-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_093628_271908_8A9825CE 
X-CRM114-Status: GOOD (  12.35  )
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

Just a small documentation change found by sashiko since v5.

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
v5: https://lore.kernel.org/lkml/a2a7d988-339c-45f6-b910-5d7dd893b45c@arm.com/

Based on v7.3-rc2

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


