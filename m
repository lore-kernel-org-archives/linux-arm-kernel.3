Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A82C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=md4bqo9lrPIQh9DmWhpKBzj25JjTaf6ntyRG1p0pW68=; b=FaVT5cFTSpxfBPv0BQCqOPaAvH
	/hfjJe/5rADRu6/TIiBLk20Dady+KmlYpzxwh329IZMXpPYYwkcmjMMgREqv/gVnGxXC+JoNwjAze
	FrQjvaFV2sZXCgRm75KCgTPPpci++ezIavBPQtZKQS3poxgTw4+vCmfhfuvDbTiQu2VB6E97jIH1k
	pvbjpLdiphhG4HDvGa+jbzhWrjFxnKha/dkzCYNLupfh6uw664a6OHWwuR/TtvvcXicu0nU5nNtDz
	xvyNfgtcudCI0blqi8KyYmdg7JTBLjjRKLPHNm3i3saD9tohbzLNxY6uNvb2sPj2qHivb30kdgN8w
	QNQJHZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x237I-0000000Gq9E-1qbw;
	Thu, 03 Sep 2026 08:48:16 +0000
Received: from out-51.mta1.migadu.com ([95.215.58.51] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x237F-0000000Gq8H-0WdB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 08:48:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NWMRK+GPEMa03FgrNppDLMXx2SicTPa6+EtTE3P7NXs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788425289; v=1; x=1789030089;
 b=vQS2tlsVHL2HyZcYCZvITy5RYNIG79AxOYEVPnXooabg3qtz34Rd7i4bnm3JAHHFqocIQNae
 8RCWXpAdd/IpGt6UKmNo/jfu5qlN4eWpki8GVd7IgOXrBZO7L4IpU3kPrmfCoTZ/HQxL4en9vsp
 xh6VuOLoDM4zWKDBp97TbLhw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 57dd58152e2447bb;
	Thu, 03 Sep 2026 08:48:09 +0000
X-Mizu-Trace-ID: 57dd58152e2447bb
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
Subject: [PATCH] arm64: mpam: Document when to set arm64.nompam
Date: Thu,  3 Sep 2026 09:48:09 +0100
Message-Id: <20260903084809.2027326-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_014813_304645_949F3362 
X-CRM114-Status: GOOD (  14.48  )
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
firmware has enabled MPAM, the EL2 trap controls are left unwritten, at
reset values that are UNKNOWN, and KVM still hides MPAM from the guest
but no longer enables the traps that stop a guest from using it. The
kernel cannot restore the writes: they trap to EL3 on the firmware the
option exists for, and MPAM3_EL3.TRAPLOWER cannot be read below EL3.

Say so in mpam.rst, and add the rule and a pointer to the
kernel-parameters entry.

No functional change intended.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 ++-
 Documentation/arch/arm64/mpam.rst               | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

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
index 67fe515ed501c..67c8a95391171 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -87,6 +87,23 @@ The supported features are:
   MBWU monitors can be exposed to the user after support for more monitoring
   scopes is added to resctrl.
 
+arm64.nompam
+============
+Firmware must enable MPAM at the highest implemented exception level and
+leave the MPAM system registers accessible to the kernel, or trap the
+accesses and emulate MPAM as disabled. Where it does neither, the CPUs
+still advertise MPAM in the ID registers, the first kernel access to an
+MPAM register traps to EL3, and the boot fails. ``arm64.nompam`` exists
+for that firmware: it makes the kernel treat the CPUs as not implementing
+MPAM, so no MPAM system register is accessed. Set it only on a machine
+that does not boot without it.
+
+It is not a way to turn MPAM off. On a system whose firmware has enabled
+MPAM at EL3, the option leaves the trap controls in MPAM2_EL2 and
+MPAMHCR_EL2 unwritten, and their reset values are UNKNOWN. KVM still
+hides MPAM from guests but no longer enables the traps that stop a guest
+from using it, so a guest may be able to choose its own PARTID and PMG.
+
 Reporting Bugs
 ==============
 If you are not seeing the counters or controls you expect please share the
-- 
2.39.5


