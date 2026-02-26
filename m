Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF2FC5908
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7NQVeDljRoPgpojRwN+bpaAJ+lzNR5Llcq92e8JUDs=; b=YEk+7HHJG5/0vLzipr2XXk0Lpz
	qPcJ3XXOKMKS+oHvYp2zZ5OmbqifFKOsJxylHo5ntVaFYjgzWI6GO8yxINSSG0tHLw6wPnsP8w5hg
	vQIPEYbrCySluhwSqAmgLD4Jw2L1nio7aF8rwDjpY1kTU2ejts0796tInMKY8zDEc8ta71f40hAqm
	zjdHTNzq9xuBG5udoS9HEbx+AbXZ24WcbTnYw+fgig3k24ZBNeaQzbGcZk46ujmrwt/JW31pEtgrz
	P1iKUj6LD2JfMS09UCspusrdC3ECvCBphL7QG1A0ytLqVHN6QT78utpAmXCGRWoCKb9UTp7MWMAf9
	RCIVLwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWdx-00000005dy9-3pfC;
	Thu, 26 Feb 2026 08:22:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWds-00000005dw3-43UE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF76E40A91;
	Thu, 26 Feb 2026 08:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C736CC19422;
	Thu, 26 Feb 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772094159;
	bh=y10uzK8X5izzFDoyVUpNZndKCD/o1x7AcgSEzhBkctU=;
	h=From:To:Cc:Subject:Date:From;
	b=q7821CvzQH3+P3IMDV79YpS2y5m+zSAq31/V7HiVYTKjE0o7gf2Cz54DMSgNig9Pc
	 e/M4TDwDbeweGslPzRA+1PBm79/TqHtcwamWJQwLu34Lpacq0fCiIBP303mA2E1991
	 wdzsG2eUx2i8EznbXcNqh2WWrgeg45IyfxaV3qTSY3yKBBElY8OuCurgU6M33jT+q/
	 PlpS42hIDyfsHJtyCIcxwXog8VUDcDZP3MfOe+fiwAgwnIiEvPy3C/KoLAwUJ4izku
	 b5hfXhnSBFoULuc9FIH1QHn/T1CkI6FovXGruzl0Hhkb3Hp4a2AqpqHZ5gr/Ntp4d6
	 GI4kSHGxkSbBQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vvWdp-0000000DyFd-2rrb;
	Thu, 26 Feb 2026 08:22:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 0/3] arm64: WFxT fixes, take #2
Date: Thu, 26 Feb 2026 08:22:31 +0000
Message-ID: <20260226082234.26707-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_002241_025434_7A3F479D 
X-CRM114-Status: GOOD (  11.88  )
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

After my previous WFxT fix went in 7.0-rc1 as 29cc0f3aa7c64 ("arm64:
Force the use of CNTVCT_EL0 in __delay()"), Ben reported that it isn't
playing nice with preemption, due to the use of the timer workaround
percpu variable. This series tries to address this, and propose a
hopefully better alternative.

That alternative is in the form of a new "virtual counter" accessor,
available in the same way arch_timer_read_counter() is, except that it
is guaranteed to be the virtual counter. This helper (a function
pointer, really) is updated on each CPU boot in the same manner the
counter accessor is.

This is then plugged into the __delay() helper, providing the expected
guarantees (and resulting in a much nicer code gen).

Patches on top of -rc1.

Marc Zyngier (3):
  arm64: Fix sampling the "stable" virtual counter in preemptible
    section
  clocksource/drivers/arm_arch_timer: Expose a direct accessor for the
    virtual counter
  arm64: Convert __delay_cycles() to arch_timer_read_vcounter()

 arch/arm64/lib/delay.c               | 5 ++++-
 drivers/clocksource/arm_arch_timer.c | 5 +++++
 include/clocksource/arm_arch_timer.h | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.47.3


