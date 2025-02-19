Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7843BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOres0ehnZAsK3fceV+yF/DaChLI/9SaBHpoi6QvURE=; b=TDdTtw1s1iwE12weJ0vRkNXYWK
	9076xdS/FjrP5D3Bdi3mbBLC7y0neMpdDNUnxG1tjGE+ZESebE0TUguJf4ruJbbDHLKwe+LcZj/hZ
	dkdoNYXgfTGpp3tLvohNisb10sgFlJzaJZNI7el5mGVqpxpXwrtIhSLnE2+3U6v43HxePMjBQpR8V
	C1Nn3LB7s96lMNVaByQHjUQM19H6BYws2ojnFUXZ154cqAMb4+9dsLLiGJ3+cY9EpQUT43/REpvJx
	8T/QD8ovn1SKBQQTYGa31u0foMTQie5gFAiY+DecdEcms0zPHGKSAEzh6byaN/OPHBCKe+DwGrY80
	L4GQfrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksNR-0000000FOlO-0FFz;
	Wed, 19 Feb 2025 22:17:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tksIE-0000000FNK0-44Qx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:11:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 424095C0782;
	Wed, 19 Feb 2025 22:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9EFC4CED1;
	Wed, 19 Feb 2025 22:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740003106;
	bh=dZyIn3+mJ3vnANHwYSZe/NwWp//PvNFWn3w/6m5Atxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GWdUaRWWkN7u/XVvl76z7LF+/W9dJl32hpLYgoRV03/xud0VwajoKJhKmEAfxue8A
	 8U/i8V82GDdusExHr2lFgiQAH3qZgZyQuL6+tcAEMENBo9xn5gunplxyEF1TtVMGTe
	 g4nTmRBpkwQOfWe1bNhR7uxMdvpa+NEMSsZV8Tyh99wVdInTKnWNIrV3K8dBcyhhG/
	 FrPQK+qEz590c2POkLp1YOFPzFcKnLhNHq1S8eczJEXhYuKgbhlPKUyHO6lpHs8vNo
	 ErLbrZJ859VcxuqEz/sgoRnLSx3SGDI000CsrANPJdFQQORlWE9OnJ9X1dADj/ZBxu
	 Ps0BxWJmXA45w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tksIB-005zA8-Qj;
	Wed, 19 Feb 2025 22:11:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH] KVM: arm64: Fix tcr_el2 initialisation in hVHE mode
Date: Wed, 19 Feb 2025 22:11:38 +0000
Message-Id: <174000308842.546972.9338900665339093067.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250214133724.13179-1-will@kernel.org>
References: <20250214133724.13179-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, will@kernel.org, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_141147_054817_1BA2FFE2 
X-CRM114-Status: GOOD (  15.48  )
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

On Fri, 14 Feb 2025 13:37:24 +0000, Will Deacon wrote:
> When not running in VHE mode, cpu_prepare_hyp_mode() computes the value
> of TCR_EL2 using the host's TCR_EL1 settings as a starting point. For
> nVHE, this amounts to masking out everything apart from the TG0, SH0,
> ORGN0, IRGN0 and T0SZ fields before setting the RES1 bits, shifting the
> IPS field down to the PS field and setting DS if LPA2 is enabled.
> 
> Unfortunately, for hVHE, things go slightly wonky: EPD1 is correctly set
> to disable walks via TTBR1_EL2 but then the T1SZ and IPS fields are
> corrupted when we mistakenly attempt to initialise the PS and DS fields
> in their E2H=0 positions. Furthermore, many fields are retained from
> TCR_EL1 which should not be propagated to TCR_EL2. Notably, this means
> we can end up with A1 set despite not initialising TTBR1_EL2 at all.
> This has been shown to cause unexpected translation faults at EL2 with
> pKVM due to TLB invalidation not taking effect when running with a
> non-zero ASID.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix tcr_el2 initialisation in hVHE mode
      commit: 102c51c50db88aedd00a318b7708ad60dbec2e95

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



