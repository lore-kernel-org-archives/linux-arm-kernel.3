Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E757C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRX2tV0I4E69oy6vP6qOq5WU7oIum9yZL7yNHkbYpOQ=; b=qB4//fJBSR62UwQViXOxmVp933
	BxgGCQ7vhT37MH+rwB3MjPrAxfEmpKugre8QosAVjDRinXbwN7U6YKdNLxkV2ioahUZzlzM8scvSB
	n6Ztk669vKyEo8y2kt3vI31FHUQ04CFu57+rc7W5pf1aBuD+IWHnAKjZScC1UVQitNRbiNk4zaIFR
	5ZM5DoJa7ZPZ5sd/imzjYIdG7nKzoXZ7ZJI64ICm2ZxvJupCuOuUeS1Ltopm6d25resMv0HMQHlYS
	XSIf/NzxI0Zv8iijQv6CIXWL1gr0u5ry4E1pxmMWbb9RI8cIPtm5kcLzzh9AqD8gyEpsZ5IfilNgN
	qana1fOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINcy-00000003I95-0pD5;
	Fri, 23 May 2025 08:19:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINRP-00000003GNJ-09AK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:07:44 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 719BA1F96B;
	Fri, 23 May 2025 10:07:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747987657;
	bh=KRX2tV0I4E69oy6vP6qOq5WU7oIum9yZL7yNHkbYpOQ=; h=From:To:Subject;
	b=ks9UwfuodmbKMAQu9i8FmCAfx9+lFecn0FmZRnlsyHQWPsnk+nlh2unax5n53Dd4A
	 ls8tygk8ro76FNTQ+Sz9vCKAiP+YWhRjSFDP9Dvq2vd5iiw2fbmsY3TZwj3D79wOqp
	 etWGlPr07FXY2Pn2/kLc8YlwCnYfGebWsZyfAw6zUSVoWCMY+nT+RdiehVKvrxjnU/
	 e7G/6xaWUvGOn35xJkVc2a48TUcxG1/k4j+IgrBFGQYw+tbJr6Akr61FtCWdvjoW4f
	 Axie7cYZkJ9/7LAHYOlI2SYpztYAqzOPq6uYvOdrDpLXzOsyJpWYkqbdvprWwFhFZm
	 mKCb5wb0I13Nw==
Date: Fri, 23 May 2025 10:07:32 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>, Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: Kernel WARNING (RCU) with btnxpuart on TI AM62 platform
Message-ID: <20250523080732.GA19643@francesco-nb>
References: <20250408083512.GA26035@francesco-nb>
 <24b28bda-e294-4680-bed5-c44efcb6c455@ti.com>
 <20250410062006.GA7506@francesco-nb>
 <4286c852-c5c5-468b-a8f5-fc226e71d5e9@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4286c852-c5c5-468b-a8f5-fc226e71d5e9@molgen.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_010743_243160_1776E4CA 
X-CRM114-Status: GOOD (  13.95  )
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

On Mon, May 12, 2025 at 04:47:28PM +0200, Paul Menzel wrote:
> Am 10.04.25 um 08:20 schrieb Francesco Dolcini:
> > On Tue, Apr 08, 2025 at 09:15:26PM +0530, Vignesh Raghavendra wrote:
> > > On 08/04/25 14:05, Francesco Dolcini wrote:
> > > > I do have the following kernel warning with 6.15-rc1, on a TI AM62
> > > > platform (arm64), single CPU core, using btnxpuart driver, any idea?
> > > > PREEMPT_RT is enabled, if it matters.
> > > > 
> > > > Either the issue is not systematic, or multi cores SoCs are not affected
> > > > (no error on the exact same image on a dual nor on quad core TI AM62).

...

> Not that this gets forgotten. Vignesh, is your theory still valid with
> PREEMPT_RT not set?
> 
> Francesco, were you able to test older Linux kernels in the meantime?

Yes. The same happens with 6.12.30 kernel. Not systematic.

[   19.908418] Voluntary context switch within RCU read-side critical section!
[   19.908453] WARNING: CPU: 0 PID: 371 at /kernel/rcu/tree_plugin.h:331 rcu_note_context_switch+0x3d0/0x428
[   19.908510] Modules linked in: sd_mod uas onboard_usb_dev optee_rng rng_core btnxpuart dwc3 evdev spidev aes_ce_blk aes_ce_cipher ghash_ce gf128mul sha2_ce sha256_arm64 sha1_ce snd_soc_simple_card snd_soc_simple_card_utils display_connector optee gpio_keys spi_cadence_quadspi usb_conn_gpio tee roles k3_j72xx_bandgap mwifiex_sdio mwifiex cfg80211 rtc_ti_k3 dwc3_am62 bluetooth ecdh_generic ecc sa2ul rfkill sha512_generic authenc tidss snd_soc_davinci_mcasp crypto_null libaes snd_soc_ti_udma drm_display_helper snd_soc_ti_edma sha1_generic snd_soc_ti_sdma omap_hwspinlock ti_ads1015 lontium_lt8912b ina2xx industrialio_triggered_buffer kfifo_buf tps65219_pwrbutton tc358768 lm75 m_can_platform snd_soc_wm8904 pwm_tiehrpwm m_can can_dev spi_omap2_mcspi fuse ipv6 autofs4
[   19.908761] CPU: 0 UID: 0 PID: 371 Comm: kworker/u5:2 Not tainted 6.12.30-7.3.0-devel #1
[   19.908773] Hardware name: Toradex Verdin AM62 WB on Dahlia Board (DT)
[   19.908780] Workqueue: hci0 hci_power_off [bluetooth]
[   19.908917] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   19.908930] pc : rcu_note_context_switch+0x3d0/0x428
[   19.908946] lr : rcu_note_context_switch+0x3d0/0x428
[   19.908957] sp : ffff8000825dba60
[   19.908961] x29: ffff8000825dba60 x28: 0000000000000000 x27: 0000000000000000
[   19.908977] x26: ffff0000011e11c0 x25: ffff00000a5a9080 x24: 0000000000000000
[   19.908988] x23: 0000000000000000 x22: ffff00000a5a9080 x21: ffff00001daa92c0
[   19.908999] x20: ffff8000810220c0 x19: ffff00001daaa0c0 x18: fffffffffffe7a38
[   19.909010] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000048
[   19.909023] x14: fffffffffffe7a80 x13: 216e6f6974636573 x12: 206c616369746972
[   19.909034] x11: 6320656469732d64 x10: 6165722055435220 x9 : 206e696874697720
[   19.909045] x8 : 6863746977732074 x7 : ffff80008122c840 x6 : ffff8000825db820
[   19.909056] x5 : ffff00001da9f888 x4 : 0000000000000000 x3 : 0000000000000027
[   19.909071] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00000a5a9080
[   19.909084] Call trace:
[   19.909089]  rcu_note_context_switch+0x3d0/0x428
[   19.909107]  __schedule+0x98/0x774
[   19.909124]  schedule+0x34/0x104
[   19.909133]  rpm_resume+0x17c/0x6b0
[   19.909144]  __pm_runtime_resume+0x48/0x88
[   19.909158]  serial8250_stop_rx+0x28/0x84
[   19.909173]  uart_tty_port_shutdown+0x3c/0x178
[   19.909184]  tty_port_shutdown+0x84/0xdc
[   19.909201]  tty_port_close+0x3c/0xac
[   19.909211]  uart_close+0x34/0x98
[   19.909219]  ttyport_close+0x50/0x94
[   19.909230]  serdev_device_close+0x40/0x50
[   19.909243]  btnxpuart_close+0x1c/0x9c [btnxpuart]
[   19.909258]  hci_dev_close_sync+0x314/0x7d8 [bluetooth]
[   19.909325]  hci_dev_do_close+0x2c/0x70 [bluetooth]
[   19.909388]  hci_power_off+0x20/0x64 [bluetooth]
[   19.909454]  process_one_work+0x148/0x28c
[   19.909477]  worker_thread+0x2d4/0x3d8
[   19.909488]  kthread+0x110/0x114
[   19.909499]  ret_from_fork+0x10/0x20
[   19.909518] ---[ end trace 0000000000000000 ]---

Francesco


