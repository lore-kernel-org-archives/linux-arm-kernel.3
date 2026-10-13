Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3998CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rxgTdFn4wgamFZpg7QouSby7GtMQYVAfmS3ph5FsFxs=; b=cv0/Bnm3CU7KgjKKz/7OON7zzs
	+q117fr0HUXz5qRZXUih3qbdfq+0QOUq6CFRjMZ2paj483oWrVmvbnzelZLU3P1mEedUQGdN6b/ym
	o0T1VO38OJNUj6IyZWUQ7XODEPVndX3MpV2GqMA90hSGtvT4sUOIPk+nUC/lSznaO7esRdACvHpr0
	OlgHEyAxHtAjy+FQ1tLz4Wg5kCpmOuiLM0aSuTOmPhHYtDS8qOYymqKwpS+3HZxhUN4BChVsH+SUy
	NPgWC010N5HEnO11iNKrbzYYOPptix6r82Aoh/JgsxVWCk+gnocYmCpn9fe80NwyJ9+mzCWCJjSTi
	6hf4psAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc9i-0000000Ctka-38d7;
	Tue, 13 Oct 2026 13:02:58 +0000
Received: from out-77.mta1.migadu.com ([2001:41d0:203:375::4d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc9g-0000000Ctjy-2mro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:02:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZrqN4SwiMfEFjFMJxxaia+E+p360c/BMd14mXe0AmBE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791896574; v=1; x=1792501374;
 b=UvoO1oKvm6CIs2UP34wYbPATNuM6vw+boI/0tuolMfoYR2G6PTWd4dYTgAIUgaRu0RCtx+gS
 Egx9v9DAUxGKKu5AFUw4DU0Ms8HirR3asnLEQ7amTJyNTTYTXqR6z0ASx66fAD5sPppRRmEZx0b
 RogMUI7aWPUcGM7lcCfHuIvg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5eb0838c8443a40b;
	Tue, 13 Oct 2026 13:02:54 +0000
X-Mizu-Trace-ID: 5eb0838c8443a40b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: sysreg: Bring field definitions in line with the spec
Date: Tue, 13 Oct 2026 14:02:43 +0100
Message-Id: <20261013130247.4135515-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_060256_995825_954494EE 
X-CRM114-Status: GOOD (  11.29  )
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

Hi folks,

Fixes to definitions in the sysreg file that don't match the current
spec: three wrong enum values, two misspelt field names, and fields the
architecture has dropped, including leftovers from FEAT_TME. The last
patch also removes the BRBE driver's check on two more such
fields (BRBINFx_EL1.T and LASTFAILED), the only functional change in
the series.

These came out of the pKVM feature-bit audit, which led me to check the
whole file against ARM's register descriptions.

I plan to look at turning that check into a linter under
arch/arm64/tools, along the lines Will suggested [1], so the next
batch doesn't depend on someone reading the spec.

Based on Linux 7.3-rc6 (a90ee4305c4a5).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241211224015.GB17836@willie-the-truck/

Fuad Tabba (4):
  arm64: sysreg: Fix three incorrect enum values
  arm64: sysreg: Fix the names of two misspelt fields
  arm64: sysreg: Mark fields the architecture dropped as RES0
  perf: arm_brbe: Remove the check for TME transaction states

 arch/arm64/kvm/config.c         |  4 ++--
 arch/arm64/kvm/emulate-nested.c |  2 +-
 arch/arm64/tools/sysreg         | 28 ++++++++++------------------
 drivers/perf/arm_brbe.c         | 18 ------------------
 4 files changed, 13 insertions(+), 39 deletions(-)


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.39.5


