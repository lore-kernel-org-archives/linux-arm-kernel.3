Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F333AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6phfOWLFdcwVnYF12rPCHS2viJVLOqHNfc3nToPxDvo=; b=GdKVXbDdct6N0kMDgZenyI0RKu
	bRedqx500442Rkg9X85udu7OuIuMt4/MKPGNqDmMZ7EGH6FM7bZbwXjCLWHHrLcTz8MEH4zTTjLvI
	C3Ls7ihvpTRTm/vwLIX5KCk/dYXYcPmhZEyJWnhjCsczpMrNvfklVNX1or/Q7IBtsbPymgwberjf2
	ehSOZYN243uAgtWL/PPBCWOj6f3tRCM38Nz/QEUWhU7Ecx5kdkj0vM4kLE6qrSHB5+31a7jIUfa2R
	mRBLVx2kVmceB5x5GuwqbiZrmLZ1TjI0p7OnlYrmRlpqw6khd2PS+7eH5r5Br856c7FYPa/hmfpiM
	YZ8O3QPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwtF-00000005qXO-3lfC;
	Fri, 28 Aug 2026 13:45:05 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwtC-00000005qWC-2TNk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=6phfOWLFdcwVnYF12rPCHS2viJVLOqHNfc3nToPxDvo=; t=1787924702; x=1789134302; 
	b=gXGnrFQcmcuA749FkxKbJjtZMYXviH05N293zWd6BRDDUr2tuwF/sqRWG89HBrg/NpUA6MAGmqC
	CyX7/WrTq7kPTz4bXuscq75+Z3o4h7z8Pgf7tf+Caq+/QE2MK3vYhL/0uhCZ2CdTz6jU9j0rfJNEZ
	nwg3Xgxpnaf7EG2EJqN1EKRwqJvch8Ultc7MMQOZqM58d9NF48TBcER/uZ/hD6sHAmuncSETHaobJ
	N9Rad3G5f5wUwBzFso6lZPp6qaTPXC06toN2WFtYJ6yz06UtwpVQJJmN83WahMXwRhi/2+JaVxKqT
	jBU5HTpqYOngYxyIClk+6fTPcBjHegDtCDCA==;
Date: Fri, 28 Aug 2026 15:43:37 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tony
 Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org
Subject: Re: [REGRESSION] OpenPandora (OMAP3) fails to boot since v7.2-rc1,
 bisected to b8eeeca5545659
Message-ID: <20260828153902.49aa3772@kemnade.info>
In-Reply-To: <2013A99A-0502-4128-ACFA-B04886224393@goldelico.com>
References: <2013A99A-0502-4128-ACFA-B04886224393@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_064502_637247_63658456 
X-CRM114-Status: GOOD (  19.21  )
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

On Fri, 28 Aug 2026 14:49:54 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi,
> I am seeing a boot regression on OpenPandora (OMAP3) since v7.2-rc1.
> 
> A git bisect identified:
> 
> b8eeeca5545659 ("clocksource/drivers/timer-ti-dm: Add clocksource support")
> 
> as the first bad commit.
> 
> Reverting this commit restores normal boot operation.
> 
> The regression is fully reproducible:
> * v7.1: boots normally
> * v7.2-rc1 and later: hangs during early boot after about 3 seconds
>   after reporting
> [    3.631072] sched_clock: 32 bits at 33kHz, resolution 30517ns, wraps every 65535999984741ns
> [    3.643341] clocksource: omap_dm_timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 58327039986419 ns
> [    3.660430] clocksource: Switched to clocksource omap_dm_timer
> * v7.2-rc1 + revert of b8eeeca5545659: boots normally again
> 
Same on GTA04, also OMAP3. I have seen some OMAP4 fully booting with v7.2.

> What caught my attention is that OMAP already has an existing DMTimer
> clocksource implementation in timer-ti-dm-systimer.c, introduced by:
> 
> 52762fbd1c4778 ("Add support for using the TI Dual-Mode Timer as a clocksource")
> 
> while b8eeeca5545659 adds another clocksource implementation to
> timer-ti-dm.c.
> 
> The commit message and patch series state that the driver automatically
> selects the first timer marked with the "ti,timer-alwon" DT property and
> registers it as a clocksource/sched_clock.
> 
> I have not determined the failure mechanism, but the bisect result and
> successful revert strongly suggest that the new DMTimer clocksource path
> conflicts with the existing OMAP3 timer setup.
> 
> Therefore, I would like to ask:
> * Is the new timer-ti-dm clocksource intended to coexist with the
>   existing timer-ti-dm-systimer clocksource implementation on OMAP3?

Why a new second ti-dm-clocksource is introduced at all?

> * Is b8eeeca5545659 expected to be active on OMAP3 systems?
> * Has this combination been tested on OMAP3 hardware?
> * What is the solution?
> 
I would suggest, reverting that offending commit together with adding
missing pieces to timer-ti-dm-systimer.c

Regards,
Andreas

