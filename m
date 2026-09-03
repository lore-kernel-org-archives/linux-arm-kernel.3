Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC115C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg958laBgwitEnJRLR5zerCcOFv7TOffR/ikCii1qAk=; b=34kRhpCw0MtxK7N8FjUI3AbJ6W
	i+E54sVzc/Hr0O/W/kt6b5Ov6KTnxyU5JnLCifcXEBUxXysEguwEM3IfD1ZPyWE2ZI1iZl9xnFwY0
	HudaNeRMW7HM8MOqT1y+gpM4RqzcI1A50sQ95IEcMK2xKcURNQu818ZJpDaYhLOildNfqDi4pKihR
	hckvYWDt0BDOZYGOMRtnIrb1c4xWquQU2DYoK2pWE6gJP2XhDZ84proF33nD/mIcCe/0BKU9RmTNa
	/BStxAB4Qq2c1jiGnM8pcVYmYNHuiE0etoQNKf5C+BJcHuXHUSZ4iX9Zw2Pki9bwKz8gYifJ+pQ34
	UmSWKhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Nq-0000000GtRi-47SR;
	Thu, 03 Sep 2026 09:05:22 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23No-0000000GtQb-3Tpt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788426283; bh=Kg958laBgwitEnJRLR5zerC
	cOFv7TOffR/ikCii1qAk=; b=b81WW1SFqebXsXzvbFKqMA467xaN7TKayRGK7pYw0/DJRLYBUR
	ohIHaM4Ppl76deu+L0QWto+1KMG7GUWEtSQKccsoXL7bu+2y5yg3J/6VP/OGjwCSyuTsvEZiRZF
	wqBQSxlBr6KnEHglprVL3K+mjDw/CPRlxyGHMlfXSo6HO3rRJq3dYLVrqvnZ7f+zPYXQ6nahoj3
	XsdzVj38+JyOXMexpJ/IK6rw5xWm75VZt2Xw70jfJHZeKZaTQGGj2HZvtWRQIY/8qF1MvWMQYFb
	bAHYRm+hxyxgGY3KSNp7KfhuBZ6NqBvbtWvtw5Is1EbdWxDznaDu8tKTpq1RR+ful8A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788426283; bh=Kg958laBgwitEnJRLR5zerC
	cOFv7TOffR/ikCii1qAk=; b=o1ibmwxH0ht/8RuSYCtduPAEy7T5Tcw5XPZwAa61CLu90a4CXF
	RQ3qhI8ro97jq2l774zO3FO0qYKljqSSneBw==;
Date: Thu, 03 Sep 2026 10:04:41 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
 Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
 Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mpam: Document when to set arm64.nompam
In-Reply-To: <20260903084809.2027326-1-fuad.tabba@linux.dev>
References: <20260903084809.2027326-1-fuad.tabba@linux.dev>
Message-ID: <0EBB8E64-5F67-4525-9DE4-1D9A7DEAA701@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_020521_014974_15E95F88 
X-CRM114-Status: GOOD (  16.28  )
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

On 3 September 2026 09:48:09 BST, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
>finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
>firmware has enabled MPAM, the EL2 trap controls are left unwritten, at
>reset values that are UNKNOWN, and KVM still hides MPAM from the guest
>but no longer enables the traps that stop a guest from using it. The
>kernel cannot restore the writes: they trap to EL3 on the firmware the
>option exists for, and MPAM3_EL3.TRAPLOWER cannot be read below EL3.
>
>Say so in mpam.rst, and add the rule and a pointer to the
>kernel-parameters entry.
>
>No functional change intended.
>
>Suggested-by: Ben Horgan <ben.horgan@arm.com>
>Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/

LGTM, cheers 

Reviewed-by: Bradley Morgan <brads@mainlining.org>

>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>---
> Documentation/admin-guide/kernel-parameters.txt |  3 ++-
> Documentation/arch/arm64/mpam.rst               | 17 +++++++++++++++++
> 2 files changed, 19 insertions(+), 1 deletion(-)
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
>index 67fe515ed501c..67c8a95391171 100644
>--- a/Documentation/arch/arm64/mpam.rst
>+++ b/Documentation/arch/arm64/mpam.rst
>@@ -87,6 +87,23 @@ The supported features are:
>   MBWU monitors can be exposed to the user after support for more monitoring
>   scopes is added to resctrl.
> 
>+arm64.nompam
>+============
>+Firmware must enable MPAM at the highest implemented exception level and
>+leave the MPAM system registers accessible to the kernel, or trap the
>+accesses and emulate MPAM as disabled. Where it does neither, the CPUs
>+still advertise MPAM in the ID registers, the first kernel access to an
>+MPAM register traps to EL3, and the boot fails. ``arm64.nompam`` exists
>+for that firmware: it makes the kernel treat the CPUs as not implementing
>+MPAM, so no MPAM system register is accessed. Set it only on a machine
>+that does not boot without it.
>+
>+It is not a way to turn MPAM off. On a system whose firmware has enabled
>+MPAM at EL3, the option leaves the trap controls in MPAM2_EL2 and
>+MPAMHCR_EL2 unwritten, and their reset values are UNKNOWN. KVM still
>+hides MPAM from guests but no longer enables the traps that stop a guest
>+from using it, so a guest may be able to choose its own PARTID and PMG.
>+
> Reporting Bugs
> ==============
> If you are not seeing the counters or controls you expect please share
> the
>


--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

