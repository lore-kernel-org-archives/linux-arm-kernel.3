Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uE4IWleZqdvv7KCr9CrJRzZ5cr0T6rRxWZKKOvrK1Ws=; b=OP5W0KHhbCCH97FY9qRoL6ScR/
	ia0F7xsbIbzm3sn2EqSBceAFjPUQNb/QIU41MX00O1c07y+qHJWf27216ZIOYiyhhV/LVyA8AHPuk
	WIiy0YPCWS6L8CpnZy1xIGzhGzHgJlg7kjutf3flQyxm8lymxYv8VFuQdT4FOYkmoWN0I2AMCZHmw
	8ebgPwj8zOQGqwN6Rcu7gomvy0arH+KmOOPQBorzTVN+bG/qms+Hxm3ZKsP88bmbS4T/Vj0CGBt2V
	maYnS3lnrySmK8zVvn6uLgK1GClI8VWQCNe5Eqx8T1CahSmeSpmXH7OwARW5a9sXAebnovnifLjJE
	d9PPm+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk4s-0000000ChT5-0ctE;
	Mon, 06 Jul 2026 14:13:42 +0000
Received: from mail-24427.protonmail.ch ([109.224.244.27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk4p-0000000ChQt-3Hu6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783347214; x=1783606414;
	bh=uE4IWleZqdvv7KCr9CrJRzZ5cr0T6rRxWZKKOvrK1Ws=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gGEGkS5izSCVrJStEsw/vK3WRXGpkUCg6G0Ke60Ph4BilLhEbxUTLJnAJy37on5JL
	 BqfFTCwiOXp1Mak9l7PMheax17Ppqd8KqnJjTNGcdRJ6x89iTNB396Muv/j8ijnn5y
	 rFtPgG1tqTCXWepRmRadWa7VFV7on4BMdNJ8N/9CW99qYEoxt9SauoBxsNXUkQPksF
	 6pXHR1+0DTDrXP6y6MlloWV0sNMSwFdLSgGOvDUKHkvpdj5zLR6ZRkVqiRJ5vg2EJ0
	 AyaDx3B6VF5Q29/BOtaQl2idzffiMYnYRpd5j3z39YATxXkmKEtsXGHlBkvyL0HzJY
	 Gb3j6ANh+4pkA==
Date: Mon, 06 Jul 2026 14:13:27 +0000
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Ivan T. Ivanov" <iivanov@suse.de>, Stefan Wahren <wahrenst@gmx.net>, Andrea della Porta <andrea.porta@suse.com>, Peter Robinson <pbrobinson@gmail.com>, Stanimir Varbanov <svarbanov@suse.de>, =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Gregor Herburger <gregor.herburger@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>
From: John <therealgraysky@proton.me>
Subject: [REGRESSION] Raspberry Pi 5 (BCM2712) hangs at boot since d87773de9efe  (arm_arch_timer: default to EL2 virtual timer under VHE)
Message-ID: <oTZ1wsFlcf4l8zMuD8DYCCvff35nVbFn7gTb5_vrUPSJtjVBSTmGti8S3KnbVdVWJEzP1QRbWma6UYYXyi6v2J0fl61khniPROEhsdxMIz8=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 350a441ca159c5210a100d3d20d946c897da99d8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_071340_472476_CD387564 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

Since commit d87773de9efe ("clocksource/drivers/arm_arch_timer: Default to =
EL2 virtual timer when running VHE"), the Raspberry Pi 5 (BCM2712, arm64) h=
angs during boot on v7.2-rc1 and later. Reverting that commit on top of v7.=
2-rc2 boots reliably. Found by bisection.

Environment: - Raspberry Pi 5 Model B, arm64, device-tree boot (no ACPI) - =
CPUs start at EL2 with VHE - Mainline v7.2-rc1 and v7.2-rc2

Symptom: - Silent hang early in driver probe; no panic or oops. Boot banner=
 shows
  "arch_timer: cp15 timer running at 54.00MHz (hyp-virt)". The first blocki=
ng, timer-backed wait during probe never returns because the EL2 virtual ti=
mer's interrupt is not delivered on this SoC, so clockevents are dead. The =
softlockup/hung-task detectors can't fire either, since they depend on the =
same dead timer.

Cause: - BCM2712's timer node lists five interrupts including the EL2 virtu=
al
  timer (GIC PPI 12). The new default trusts that entry and switches to the=
 EL2 virtual timer, whose interrupt is non-functional on this board.  Befor=
e the commit, VHE systems used the EL2 physical timer, which works.

Possible fix / workaround: - Removing the EL2 virtual-timer interrupt (GIC =
PPI 12) from the BCM2712
  timer node makes the driver fall back to the EL2 physical timer (the pre-=
commit behavior) and boots. Whether the correct fix is in the DT or in hard=
ening the driver's PPI selection, I'll leave to you.

#regzbot introduced: d87773de9efe1df6fe2ba379926f9df92f1a5913

