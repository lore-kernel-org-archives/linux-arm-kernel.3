Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85159C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5wffDtbIhvi7tGvDJiT0+V8rWPwFnrokGOJCr5whKvk=; b=Sz9RG5TNRjpnfp1Jd5XcLtJnNn
	bhBnvMUi0PNu3G99RmOyrkIKOXGedvF/ZGaGQY4gZEUOeq8j9rl+eYQYB3r2Hvz5q02RYsv+ANWn4
	q6b8KopR8Japc1c0XHAFfRoJV+RbOF//lC730d48bVWnztLNcyqCa5g13WqSAGCEUUx1ebdY7mCK+
	WH8kXP+IWpHEsQziPf8WfHl97gxWRoGch4+RJACH1Bfp5MNjt3dRyAH4kR8pQupeJI8DTBdvtVNLN
	sNqev7Av3nckOpqDjnBW5ZtTFGR8oT1D9J78OZRWewp0w0IZljm/h6Ed1KWbNK+Iyv91EPBqTJfwB
	Aqz6E/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taew8-0000000Avx7-3elH;
	Wed, 22 Jan 2025 17:54:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taepO-0000000Auk6-0ZBQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 17:47:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52C041007;
	Wed, 22 Jan 2025 09:48:11 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0407E3F66E;
	Wed, 22 Jan 2025 09:47:41 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 0/3] arm64: proton-pack: Add Spectre-BSE mitigation for Cortex-A7{2,3,5}
Date: Wed, 22 Jan 2025 17:47:33 +0000
Message-Id: <20250122174736.1560714-1-james.morse@arm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_094746_216025_02DFD8A9 
X-CRM114-Status: GOOD (  12.83  )
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

Hello!

Spectre-BSE is a variant of Spectre-BHB that abuses a power-saving mode
on some older cores to dodge the BHB mitigation applied to the branch predictor.

Only A72r0 actually needs anything doing - this is basically a bug in the
published BHB mitigation sequence that was published for A72r0. This
series moves A72r0 to use the WA1 firmware call for mitigation, and adds
the necessary reporting parts for user-space to discover which parts of
BHB/BSE are mitigated or vulnerable.

WA1 is used instead of WA3 which was new for BHB because we can't rely
on hypervisors not to use the 'local' workaround, and for Spectre-BSE
we don't need to worry about discovery via. (Which is why WA3 exists -
for cores not vulnerable to the issue mititaged by WA1).

Arm's description of this vulnerability can be found here:
https://developer.arm.com/Arm%20Security%20Center/Spectre-BSE

This series is based on arm64/for-next/core, and can be retrieved from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=spectre_bse/v1

Backports of this version can also be found under spectre_bse/backports
of the above repo.

Because this vulnerability is hard to expoit, but the cost of mitigating
it is high - the mitigation is disabled by default. (see the last
patch). To enable the mitigation, a command-line argument is needed:
'spectre_bse'.

This series adds more things to the vulnerability reporting file:
| morse@adam:~$ cat /sys/devices/system/cpu/vulnerabilities/spectre_v2
| Mitigation: CSV2, BHB, but not BSE
or:
| Mitigation: CSV2, BHB, BSE


(KVM maintainers are on CC as this changes which mitigation KVM enables,
 and there is some hypervisor reasoning in the last patch)


Thanks,

James Morse (3):
  arm64: proton-pack: Move the loop and firmware enable sequences into
    helpers
  arm64: proton-pack: Add Spectre-BSE mitigation for Cortex-A7{2,3,5}
  arm64: proton-pack: Prefer WA1 for BHB on Cortex-A72 r0pX

 arch/arm64/include/asm/assembler.h |   4 +-
 arch/arm64/include/asm/spectre.h   |   1 +
 arch/arm64/kernel/proton-pack.c    | 230 +++++++++++++++++++++++------
 3 files changed, 191 insertions(+), 44 deletions(-)

-- 
2.39.2


