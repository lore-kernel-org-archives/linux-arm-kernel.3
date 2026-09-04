Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE24C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M7/1IZe8qT3TUnrr4vGL1e5iMYGNJ/zjF5I8kUUEv8w=; b=hh6ym+c5EeMGs83KdHyaudEz2l
	jXHy1UmVVNKL6+S2Va4O5MBFDi1B6/vvtw3ujU127QbF/CjguOInc54HXzTtWPAr5Jsh8lcG3WaUz
	XEWfZ0+i90BwYDuxSuuAQoad+HW4d+UZR5TWkGkXRSIDkCws4SUCWtO86dqWwl1pxkETkhFzsneHG
	0dHUTKv5Ob5TGuskBsZ7dlQyxN990SH4GINPzLas5oWICmsqOHo3ziooYXXOJU2m++L0glEh9RL5U
	CeYaYdZsVSuLifTJDOkB+U20e4y/uns5Uyj5qC6fXwCz8CZGx9bC3FJo3QE6+8REyC3ahZVaAI1h+
	fk/wu5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RCw-00000001fkK-3nct;
	Fri, 04 Sep 2026 10:31:42 +0000
Received: from out-193.mta1.migadu.com ([95.215.58.193] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RCt-00000001fip-2ZdQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:31:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=OLJizthyKrO2zpeWP4eJulHLA4vB+jyIjME5M7weTWw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788517896; v=1; x=1789122696;
 b=AAI87MBb5uqbkHf7mqya7LRTyitjfPgTcL6DSNEwJOkeEAUGdRx0r2SIU647qPHF4/9MSMrj
 ALW5Mokbv/92OaOjdmkY99eaTZBM5vkzApPPfcFRg7TXg7h5AqoXHFvffUI4CNrsZ7IGcS7JGFr
 cOwTVEisY+aJ1j2aL82E/wvU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ae322256d77e21c4;
	Fri, 04 Sep 2026 10:31:36 +0000
X-Mizu-Trace-ID: ae322256d77e21c4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Xi Ruoyao <xry111@xry111.site>,
	Marc Zyngier <maz@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: mpam: Document when to set arm64.nompam
Date: Fri,  4 Sep 2026 11:31:31 +0100
Message-Id: <20260904103131.627392-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_033139_989056_9B6C28E1 
X-CRM114-Status: GOOD (  18.38  )
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

arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
left unwritten, at reset values that are UNKNOWN, and KVM still hides
MPAM from the guest but no longer enables the traps that stop a guest
from using it. KVM never saves or restores MPAM0_EL1 and MPAM1_EL1, so
what one guest writes reaches the next guest and the host. Nor can the
kernel make the EL2 writes unconditionally: they trap to EL3 on the
firmware the option exists for, and TRAPLOWER cannot be read below EL3.

Say so in mpam.rst, and add the rule and a pointer to the
kernel-parameters entry.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v1, the first three from Ben Horgan's review:
     - Put arm64.nompam under a new "Command line parameters" section.
     - Separate MPAM3_EL3.MPAMEN from TRAPLOWER, which v1 conflated.
     - Add that KVM does not save or restore MPAM0_EL1 and MPAM1_EL1.
     - Drop "No functional change intended." from the commit message.
    
    Bradley Morgan's Reviewed-by on v1 is not carried over: both
    paragraphs, the section heading and the commit message changed.
    
    v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/

 .../admin-guide/kernel-parameters.txt         |  3 ++-
 Documentation/arch/arm64/mpam.rst             | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd24..e6d543de3cde5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -575,7 +575,8 @@ Kernel parameters
 			Set instructions support
 
 	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
-			Monitoring support
+			Monitoring support. Only for a machine that does not
+			boot without it. See Documentation/arch/arm64/mpam.rst
 
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 67fe515ed501c..e66b1359d1282 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -87,6 +87,31 @@ The supported features are:
   MBWU monitors can be exposed to the user after support for more monitoring
   scopes is added to resctrl.
 
+Command line parameters
+=======================
+
+arm64.nompam
+------------
+Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
+it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
+CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
+the MPAM system registers from the lower exception levels to EL3.
+Firmware must clear it, or handle the trap and emulate MPAM as disabled.
+Where it does neither, the CPUs still advertise MPAM in the ID registers,
+the kernel's MPAM register accesses trap to EL3, and the boot fails.
+``arm64.nompam`` exists for that firmware: it makes the kernel treat the
+CPUs as not implementing MPAM, so no MPAM system register is accessed.
+Set it only on a machine that does not boot without it.
+
+It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
+the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
+unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
+guests but no longer enables the traps that stop a guest from using it,
+so a guest may be able to read and write MPAM0_EL1 and MPAM1_EL1. KVM
+does not save or restore them, so what one guest writes is still there
+when the next guest runs on that CPU, and when the host does. With MPAMEN
+set, EL0 and EL1 requests then carry that PARTID and PMG.
+
 Reporting Bugs
 ==============
 If you are not seeing the counters or controls you expect please share the
-- 
2.39.5


