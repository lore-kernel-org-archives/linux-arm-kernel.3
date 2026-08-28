Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D826BC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:Cc:Subject:
	Date:Mime-Version:Content-Transfer-Encoding:Content-Type:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cgGl+Ap4qnIwdrgSBfPXcEBcMxukzBkYOFIjzApDzYs=; b=FZoD3SZoZC2xRQEx1c+7DnL9XW
	vIyjdfph6QIA3jq4CFGpqyAdvSMYjAkI6q4YVcV314DTLUzwoEepxXluwsC+0O7NWtZ1RsIZbGP/Q
	y0drWDDcKxaxUSzSZcPeIjH2KYiacuT9G1FGeGXBQlCEOescilzpxlLAx6tRfM9V3ivKn/eCGMBrC
	93JtZzvzCaOsIKEdfubMII0QhH5gVUNHjZk4Ufh43Bn9cBWlstJcU0/N2+87E82qV50aP6hS1hOqx
	ANHUNa2FsWM1LrzyeqJbwKJYDUPLiZAl0JIrXi7S85VYx3cQSDIXiUs3G1uXJ6iCAEy+bzSnKnk3X
	MtWf6mZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw2U-00000005lAH-16Ex;
	Fri, 28 Aug 2026 12:50:34 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw2R-00000005l9m-0A4c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:50:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787921406; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YSt/zhv6UfPubd3hnG3/IhsAAyuB0FC/DVKNycjbf5a8BnRA/Ps6R9g8V7SiOU4SPQ
    Uho4wvrHxOERLewuh72mDPppR0FuAHs8po/7lJVV8R1qbszun+3Hpgz39Y1mcEQrWaZS
    VHZhunPefuK3m0suDeYuR+KWdhiRxivjKa13qubUb10QjRg8Dnw9MHmUG+9iuaHOLn5c
    Y7uLP5NdA1DvU4HRE7lkafmNBWiPhH7pncMOGQ7Q/kIcJgmcrXqiMhegbutgUVU8OZDb
    1l8T+JsXvFv3SQLMD/kSCuBg8pTDnYVVlBciL4G4bMaj0UeMAo7wD4QCa57HffB/P8N1
    k3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1787921406;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=cgGl+Ap4qnIwdrgSBfPXcEBcMxukzBkYOFIjzApDzYs=;
    b=DyLVNRTLIdga2kU7qX/l+1i5w+vFfpWpETHr+hGnBPBNa8zzWyRBhpNPRd2+ZuI4NY
    mydtBXoIDIc5EJaEibzHF9hsh8Svfz/icI9+O1vwZrRopJEO8FNFaRaN4k/GtTSxIdtD
    nGmmAfSAdA20/zbisjWzqxYgk217WeTiBqDtC3HVRrVnlxr6b8ZQcyfvBOUoIqTjgtPU
    vpUlNiudiIpgLehv6iU+gtZZvKp7yiVv30EEIQhikN1cixt+GGLY9iWXicG2cjgujujS
    o3D4IcKsAfj9kulVCxAK2VqywoSSWWNNyc0LIvR2ig4S+dRx1Ohjv3/o+DDAMHLd6fPi
    tfIg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1787921406;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=cgGl+Ap4qnIwdrgSBfPXcEBcMxukzBkYOFIjzApDzYs=;
    b=kNsYvz9whzAeDCMeGREkTd17po/9BU26RKFG9EojJUjPM0IyKw+yztK5mEydvMXyBK
    z/HddyX5pDTWeQZUzDBAgQwjtut+BB+5dh5GgN98BRBGjAoksOgTg4B7q0C2kqGfPbN5
    tY00F7nW3MTrjYxPiF/ablthooorWd3AzNLQATLBc4dp5muPAhi8eM7VDJ24TRdwfcAj
    jURk8prwayXpdkN50S76Gyvd1cD5MfkY8yrjnnSpUSs+qDDzXofEZUXcu+YQhgNTtNIn
    4w0PylRMTqsQHFYuwcHoEHLfSliTsU1dd+eAyZXOsQtyDuhfyLz4M27FBntWJZKH80cy
    t4tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1787921406;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=cgGl+Ap4qnIwdrgSBfPXcEBcMxukzBkYOFIjzApDzYs=;
    b=SQeIFx+227w3jW+IUwE3gMgbsTdLvQfDNJp9p4sV0Xh3dFDKcqnwxXp3sUT5BzL8pd
    Yx8zOis7CNtnKL8x3BCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrTi5pcm8iNh03LRKjUUFR0UuLB2QxsamlNRA=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.2 AUTH)
    with ESMTPSA id Qfefb327SCo5sBX
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 28 Aug 2026 14:50:05 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Date: Fri, 28 Aug 2026 14:49:54 +0200
Subject: [REGRESSION] OpenPandora (OMAP3) fails to boot since v7.2-rc1,
 bisected to b8eeeca5545659
Cc: linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andreas Kemnade <akemnade@kernel.org>,
 letux-kernel@openphoenux.org
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tony Lindgren <tony@atomide.com>
Message-Id: <2013A99A-0502-4128-ACFA-B04886224393@goldelico.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055031_334846_D7CE99DF 
X-CRM114-Status: GOOD (  10.26  )
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

Hi,
I am seeing a boot regression on OpenPandora (OMAP3) since v7.2-rc1.

A git bisect identified:

b8eeeca5545659 ("clocksource/drivers/timer-ti-dm: Add clocksource =
support")

as the first bad commit.

Reverting this commit restores normal boot operation.

The regression is fully reproducible:
* v7.1: boots normally
* v7.2-rc1 and later: hangs during early boot after about 3 seconds
  after reporting
[    3.631072] sched_clock: 32 bits at 33kHz, resolution 30517ns, wraps =
every 65535999984741ns
[    3.643341] clocksource: omap_dm_timer: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 58327039986419 ns
[    3.660430] clocksource: Switched to clocksource omap_dm_timer
* v7.2-rc1 + revert of b8eeeca5545659: boots normally again

What caught my attention is that OMAP already has an existing DMTimer
clocksource implementation in timer-ti-dm-systimer.c, introduced by:

52762fbd1c4778 ("Add support for using the TI Dual-Mode Timer as a =
clocksource")

while b8eeeca5545659 adds another clocksource implementation to
timer-ti-dm.c.

The commit message and patch series state that the driver automatically
selects the first timer marked with the "ti,timer-alwon" DT property and
registers it as a clocksource/sched_clock.

I have not determined the failure mechanism, but the bisect result and
successful revert strongly suggest that the new DMTimer clocksource path
conflicts with the existing OMAP3 timer setup.

Therefore, I would like to ask:
* Is the new timer-ti-dm clocksource intended to coexist with the
  existing timer-ti-dm-systimer clocksource implementation on OMAP3?
* Is b8eeeca5545659 expected to be active on OMAP3 systems?
* Has this combination been tested on OMAP3 hardware?
* What is the solution?

If helpful, I can provide more details or test reports.

Thanks,
Nikolaus Schaller=

