Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09137C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJ5O+OMRxzlXnTpP7WXm8UGKXRpHVfEKgrPFOTuwCuk=; b=V4cefrWQuNLvDHTH/7g3pCJP3J
	nLBchWwpTw3mGj7HWJuMXs+sSZSI5bn0hbjewGTGluwBIiehgtAa5rzPH98CNVZ6JI/xtK9EG5qk3
	+Qeuf1RVjijtPwx3ckE2IZO+3yLQtqAw7FFataE8QbyeN5dRKHWjm64pyAkvz5nm837fFLP8rV3k4
	5RXlXctpixV5oEcMtXL5hSLYImhTdE3+2icOtkJcr2c38RCx7Z+W3yNOZdl4RMrGmRXLyHivkgDIS
	bkPu6PyNJzh9rYQToairlgkXj9rjHxYnGL1RqYPf0S/2hEBDFsPbuPKP5Wbve8QjIiJeI9/MveZlx
	mnR0uJyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGy-00000001gs3-0Ykr;
	Fri, 04 Sep 2026 10:35:52 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGu-00000001glj-3XUK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788518125; bh=IJ5O+OMRxzlXnTpP7WXm8UG
	KXRpHVfEKgrPFOTuwCuk=; b=jLUK3urokkvA+3WXiyGtulLBSDkDFdht2Lj6bcSwqDpVmxW98N
	Yu9dbgsRUm2l6QSpO2yRj/xkrf236hfanDk0cU5vnO5VrBzX0fUUcODN5Y3/C9dFSKlgo+APRf3
	I4l7PFxshiTtPGU2A1wplMk4uMJi8dnRE5uCY/W3MBxXNyGhWUjJ/8/Hc65izm5vWnIrwzPvzsQ
	tGek0x4adSvGpNAIKXxj6ELJuejVd8O9ahW2Dh4mK1andFDNwWZyEqmiHjMSpku52jbcCW34/WJ
	dk2hEqcbKqwmLMZFZayOWoLAND+1GgK7z9WeSVHgLytfL/EZWkwc62qxa9Shr6BIOcg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788518125; bh=IJ5O+OMRxzlXnTpP7WXm8UG
	KXRpHVfEKgrPFOTuwCuk=; b=ieSebnxfCjP2z9WpDNu8VXn4gIzMcBrPQm1phBnVhyUeH+ZAEw
	1nrSLfq2B1wWQfyHphQ+QuL91OE1tE34hIAA==;
Date: Fri, 04 Sep 2026 11:35:25 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
 Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
 Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: mpam: Document when to set arm64.nompam
In-Reply-To: <20260904103131.627392-1-fuad.tabba@linux.dev>
References: <20260904103131.627392-1-fuad.tabba@linux.dev>
Message-ID: <9CE4CF72-74D6-493D-9F92-2D14CDC05C68@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_033549_035721_1F5DCFD6 
X-CRM114-Status: GOOD (  22.13  )
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

On 4 September 2026 11:31:31 BST, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
>finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
>firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
>left unwritten, at reset values that are UNKNOWN, and KVM still hides
>MPAM from the guest but no longer enables the traps that stop a guest
>from using it. KVM never saves or restores MPAM0_EL1 and MPAM1_EL1, so
>what one guest writes reaches the next guest and the host. Nor can the
>kernel make the EL2 writes unconditionally: they trap to EL3 on the
>firmware the option exists for, and TRAPLOWER cannot be read below EL3.
>
>Say so in mpam.rst, and add the rule and a pointer to the
>kernel-parameters entry.
>
>Suggested-by: Ben Horgan <ben.horgan@arm.com>
>Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>---
>
>Notes:
>    Changes since v1, the first three from Ben Horgan's review:
>     - Put arm64.nompam under a new "Command line parameters" section.
>     - Separate MPAM3_EL3.MPAMEN from TRAPLOWER, which v1 conflated.
>     - Add that KVM does not save or restore MPAM0_EL1 and MPAM1_EL1.
>     - Drop "No functional change intended." from the commit message.
>    
>    Bradley Morgan's Reviewed-by on v1 is not carried over: both
>    paragraphs, the section heading and the commit message changed.

Still LGTM, the only arm device I own is pixel 7, and also a modern arm
test-peoples-crap box. So from what I recall, my tag stands 

>    
>    v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
>
> .../admin-guide/kernel-parameters.txt         |  3 ++-
> Documentation/arch/arm64/mpam.rst             | 25 +++++++++++++++++++
> 2 files changed, 27 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>index 68647ff4bdd24..e6d543de3cde5 100644
>--- a/Documentation/admin-guide/kernel-parameters.txt
>+++ b/Documentation/admin-guide/kernel-parameters.txt
>@@ -575,7 +575,8 @@ Kernel parameters
> 			Set instructions support
> 
> 	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
>-			Monitoring support
>+			Monitoring support. Only for a machine that does not
>+			boot without it. See Documentation/arch/arm64/mpam.rst
> 
> 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
> 			support
>diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
>index 67fe515ed501c..e66b1359d1282 100644
>--- a/Documentation/arch/arm64/mpam.rst
>+++ b/Documentation/arch/arm64/mpam.rst
>@@ -87,6 +87,31 @@ The supported features are:
>   MBWU monitors can be exposed to the user after support for more monitoring
>   scopes is added to resctrl.
> 
>+Command line parameters
>+=======================
>+
>+arm64.nompam
>+------------
>+Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
>+it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
>+CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
>+the MPAM system registers from the lower exception levels to EL3.
>+Firmware must clear it, or handle the trap and emulate MPAM as disabled.
>+Where it does neither, the CPUs still advertise MPAM in the ID registers,
>+the kernel's MPAM register accesses trap to EL3, and the boot fails.
>+``arm64.nompam`` exists for that firmware: it makes the kernel treat the
>+CPUs as not implementing MPAM, so no MPAM system register is accessed.
>+Set it only on a machine that does not boot without it.
>+
>+It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
>+the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
>+unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
>+guests but no longer enables the traps that stop a guest from using it,
>+so a guest may be able to read and write MPAM0_EL1 and MPAM1_EL1. KVM
>+does not save or restore them, so what one guest writes is still there
>+when the next guest runs on that CPU, and when the host does. With MPAMEN
>+set, EL0 and EL1 requests then carry that PARTID and PMG.
>+
> Reporting Bugs
> ==============
> If you are not seeing the counters or controls you expect please share
> the
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

