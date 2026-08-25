Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FB0C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0O+oUQUX+jAxuxBxQW9D024AeP68nNqnUC52RYABhqI=; b=DtWkwn7kbfsKOoSFTS+tFDVEnz
	G64o29dkNYpXgUah+m5cL3io1QkSPfmXa7PmbDWfvl/e9Gsbst1LSKzNx+oSlXDpL6RWMi3GaLtD8
	1ARMvWrR/8v5oQO2733p/XGGiMDt2xNYstVT4AhITTIFetb5UrE3xISFAO+6Jw3b/2UmjiPsttI4p
	dF81JqVwKlqdeWltzwnTU4JkWPwSAObvH7PfQ5ptppm4AzLXcFFAGJO0vfFJHOCEVq3X9nMzeocFz
	xDgUBElY9uwuAErsn6scrVlqPPqXhx4kssY+IvccNhmEvp0AEd8ua12cZwKNY3yRLThhZiouqpG1w
	9so4Ifiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyES-00000001Ssl-1uPI;
	Tue, 25 Aug 2026 20:58:56 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEI-00000001SnW-34pB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691520; bh=0O+oUQUX+jAxuxBxQW9D024
	AeP68nNqnUC52RYABhqI=; b=QyLp5iTET0O75a6RtR+b3mTEuGBLCQeXHoGKptbBxQEt4mL8BC
	QPwDPXEP4ZCad2fpMaHeojT6bGC573aTEGvlNKvu2k0vC5upwT8oMOE+KQUpg3OXX07qrjvLYyG
	/ZnC9VOHWT63QfVLycW0SaEWw2xj99rLYoNbMeOIhiikmBM3yx3W/QSkfp31z45yZVNyI5nW10B
	ikqzyE89853N/ho90xueXcumM8DWEw+hIztEqJnD68BPvl64YXm5x6MXqb38kG6sjsDYgVBBIvU
	t5y9L13b+XjL5qoTV9ajMV8llZG2V8HgyEhBV8Sktba3sVLGcz0YGzCfVGDs1bUEEpA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691520; bh=0O+oUQUX+jAxuxBxQW9D024
	AeP68nNqnUC52RYABhqI=; b=ie7YX5QJ/U1UgthPO/32NMOn81LBn1MM4WV1iYwlWBRdiqji9m
	n3ZBqR0jCQaCIesagDO3PjPwoFrpk3v29WDA==;
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Date: Tue, 25 Aug 2026 20:58:32 +0000
Message-ID: <20260825205839.14571-1-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135846_971544_AADD5385 
X-CRM114-Status: GOOD (  10.43  )
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

This comes out of the hibernate resume discussion where Will asked if
the restored kernel's hyp vectors are reinstalled before we come back
from swsusp_arch_suspend() and free the reserved pages. Rather than
answer with a one off fix, this series reworks resume to look like a
resume from idle, which makes the answer fall out on its own.

The series leans on Mark Rutland's old work for inspiration, he had the
same end goal in a branch from back then:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup

The short answer to the question: yes, but only because the rework makes
resume look like a resume from idle. We enter cpu_resume() at the highest
available EL with the MMU off, and the resumed kernel installs its own
hyp stub vectors into VBAR_EL2 through init_kernel_el() before anything
else runs, so by the time swsusp_free() releases the trans_pgd copies
nothing points at them anymore.

The series is structured so the first patch stands alone as a stable
worthy fix for the missing hvc arguments. The rest is the cleanup: the
stale init_kernel_el() comment gets corrected, MTE tag pages get freed
after save instead of leaking on failed hibernates, the fragile
_cpu_resume() calling convention gets split, and the last patch reworks
hibernate to use the regular cpu_resume() logic end to end.

Everything object compiles and passes checkpatch and sparse. I could not
boot or run a hibernate cycle on real hardware here, so that still wants
doing before anyone gets excited.

Bradley Morgan (7):
  arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
  arm64: head: correct comment for init_kernel_el()
  arm64: hibernate: free MTE tag pages after saving
  arm64: hibernate: fix _cpu_resume() calling convention
  arm64: hibernate: use dcache_by_myline_op
  arm64: hibernate: only clean to PoC
  arm64: hibernate: use regular cpu_resume() logic

 arch/arm64/include/asm/suspend.h  |  1 -
 arch/arm64/kernel/head.S          |  6 +--
 arch/arm64/kernel/hibernate-asm.S | 87 +++++++++++++++++++------------
 arch/arm64/kernel/hibernate.c     | 66 +++++++++++------------
 arch/arm64/kernel/sleep.S         |  6 +--
 5 files changed, 88 insertions(+), 78 deletions(-)

-- 
2.47.3

