Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20045606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CqbMG8an;
	dkim=pass (2048-bit key, unprotected) header.d=fel.cvut.cz header.i=@fel.cvut.cz header.a=rsa-sha256 header.s=felmail header.b=I8qhYii5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:References:Cc
	:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zd7yJ/RnWTOCBnaUFHbPGYWo73OWzFvn3QDUHe+308g=; b=CqbMG8anUd7ensDTuJlW1R6VZn
	rNoNttu7P6RBJEmMLdyrewYFtnyMI8Yq6nYcMx+POxv7pU0baHPtNho2BxSO1SA9gVohnl1Hy7rhg
	UiH4ZFJ36k1BQ2tRb4ghQRSjo47TnvsptqdKTucpc8ea1o2UHMazMECHfMtGj23omBnZdAg82MEvP
	Xat6450j8hygtzc1l9lGmND1b0IyZhXYJZicYzBXqBO/3NKhla+c8ZwnAogDzxdOvP8ugylbjxLHI
	IfVV+QuBSqLppDDFrE/2YGWNI05EaRDvrLCYDACJ2VqvOLUYVdqEq9OCMNnnntDHytW38tM49tFTU
	4NnkJrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsOa-0000000E85g-275C;
	Thu, 22 Oct 2026 12:59:48 +0000
Received: from [147.32.210.153] (helo=smtpx.fel.cvut.cz)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsOW-0000000E82Z-0AlL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:59:47 +0000
Received: from localhost (unknown [192.168.200.27])
	by smtpx.fel.cvut.cz (Postfix) with ESMTP id 20FFBBDE9;
	Thu, 22 Oct 2026 14:59:38 +0200 (CEST)
X-Virus-Scanned: IMAP STYX AMAVIS
Received: from smtpx.fel.cvut.cz ([192.168.200.2])
 by localhost (cerokez-250.feld.cvut.cz [192.168.200.27]) (amavis, port 10060)
 with ESMTP id JmNNU5Z5_G85; Thu, 22 Oct 2026 14:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fel.cvut.cz;
	s=felmail; t=1792673975;
	bh=zd7yJ/RnWTOCBnaUFHbPGYWo73OWzFvn3QDUHe+308g=;
	h=From:To:Subject:Date:Cc:References:In-Reply-To:From;
	b=I8qhYii58iF3YZdY4dAY9cqR+sAtngsqX9pRUO4BAu0ivzS3/slJhgVNd1GUFhQBL
	 NWf8tA58Oi4i8+5HIr+hUwQwzpZ63wHTgJSqsouy1K9DQjqZ1D1Q9n/tHjn5UBo7CR
	 16/3fDMKXh4LTZKJnJLlR+iVNMu17QxSqye1MDgj1yAbiR5R1dOI9LTYcbWxdTSOfx
	 86zqW3/K1POZGdnU3xcYKbvHBoxiMjiDixRLZHCLCtUgeDrx3EVZPWl88P+24rTRT/
	 Mk+Lp5pnQdpXtgoaiEAQWdaVbMlJibG391UWaUKel1to/GoZL5rtxdoG4PkebRnp4I
	 ni+V7YcRHddhg==
Received: from [147.32.86.168] (unknown [147.32.86.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pisa)
	by smtpx.fel.cvut.cz (Postfix) with ESMTPSA id 22EF3C0E5;
	Thu, 22 Oct 2026 14:59:34 +0200 (CEST)
From: Pavel Pisa <pisa@fel.cvut.cz>
To: Patrick Zhang <patrzhan@amazon.com>
Subject: Re: [PATCH 1/3] can: ctucanfd: enable NAPI before starting the controller
Date: Thu, 22 Oct 2026 14:59:33 +0200
User-Agent: KMail/1.9.10
Cc: "Marc Kleine-Budde" <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>,
 linux-can@vger.kernel.org,
 Ondrej Ille <ondrej.ille@gmail.com>,
 Harini T <harini.t@amd.com>,
 Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Jiri Novak <jnovak@fel.cvut.cz>
References: <20261021205924.2538511-1-patrzhan@amazon.com> <20261021205924.2538511-2-patrzhan@amazon.com>
In-Reply-To: <20261021205924.2538511-2-patrzhan@amazon.com>
X-KMail-QuotePrefix: > 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202610221459.33827.pisa@fel.cvut.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055944_680113_CD170623 
X-CRM114-Status: GOOD (  24.07  )
X-Spam-Score: -5.3 (-----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Patrick Zhang,

thanks for the problem finding and patch.

On Wednesday 21 of October 2026 22:59:22 Patrick Zhang wrote:
> ctucan_open() starts the controller and unmasks RBNEI in
> ctucan_chip_start(), prints "ctu_can_fd device registered", and only
> then calls napi_enable(). A frame that arrives in that window raises
> RBNEI. ctucan_interrupt() masks RBNEI and calls napi_schedule(). NAPI is
> still disabled, so napi_schedule_prep() finds NAPI_STATE_SCHED set and
> the schedule is dropped. napi_enable() then clears SCHED without
> scheduling anything. Only ctucan_rx_poll() unmasks RBNEI again, and it
> never runs. The interface receives nothing until the next close.
> Transmit still works. The RX FIFO fills up and the core sets DOR, but
> the overrun is only accounted in ctucan_rx_poll(), so rx_errors and
> rx_over_errors stay at zero and nothing is logged. Every re-open (ip
> link down/up, a driver rebind) runs the same race again.
>
> The netdev_info() in the window makes it much wider on a slow console.
> This can be reproduced by sending continuous traffic with cangen from
> another node and repeating "ip link set down/up" on the test device.
>
> Enable NAPI before the controller starts, so that an early RX interrupt
> can schedule the poll. NAPI can be enabled while the controller is in
> reset, because nothing schedules it until an interrupt arrives. If
> ctucan_chip_start() fails, disable NAPI again. Otherwise the next open
> would call napi_enable() on an already enabled instance and trip the
> BUG_ON() in napi_enable_locked().
>
> Tested on QEMU with the ctucan_pci device.
>
> Fixes: 2dcb8e8782d8 ("can: ctucanfd: add support for CTU CAN FD open-source
> IP core - bus independent part.") Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Patrick Zhang <patrzhan@amazon.com>

Acked-by: Pavel Pisa <pisa@fel.cvut.cz>
Tested-by: Pavel Pisa <pisa@fel.cvut.cz>

I have added patch into our CAN latency testing system

https://canbus.pages.fel.cvut.cz/#can-bus-channels-mutual-latency-testing
https://canbus.pages.fel.cvut.cz/can-latester/

See in the log for both master 7.3.0-gcac8667a979c
and RT tested branch 7.1.1-rt2-g1661cb7f80a0

-> Running pre-build script /var/lib/latester/patches-dut/apply-script.sh
Applying: can: ctucanfd: enable NAPI before starting the controller
-> Setting up build dir

I have spotted problem appearing in out-of-the-tree device tree overlay
driver build which is consequence of CAN unrelated this night change
in mainline which required next fix

--- a/dtbocfg.c
+++ b/dtbocfg.c
@@ -263,7 +263,11 @@ static struct configfs_attribute *dtbocfg_overlay_attrs[] = {
     NULL,
 };

-static struct configfs_bin_attribute *dtbocfg_overlay_bin_attrs[] = {
+static
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0))
+const
+#endif
+struct configfs_bin_attribute *dtbocfg_overlay_bin_attrs[] = {
     &dtbocfg_overlay_item_attr_dtbo,
     NULL,
 };

As for fully-preemptive kernel testing, we have been on the git

https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/refs/heads

at the branch for-kbuild-bot/current-stable but that seems to be no longer
active to track latest RT development above stable branch so it is
time to switch to some else branch or master. Ideal would be something
above next with lattest RT fixes applied before they reach mainline.
But we probably switch to mainline with RT config if nothing better
to catch possible RT deviations (changes in latency or some bugs)
is suggested.

For the curiosity, we have run CTU CAN FD IP core on 64-core
RISC-V with 7.3 kernel and drivers to control motor servosystem
based on ESP32C5 over CAN FD on the SUSE booth at Open Source
Summit for most of the days and it performed well

  https://social.kernel.org/notice/BBBNKOIUZ3NnMKcsXQ

Best wishes,

                Pavel

                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    social:     https://social.kernel.org/ppisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    RISC-V education: https://comparch.edu.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home

