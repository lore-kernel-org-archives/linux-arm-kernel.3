Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A3BC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3v4cd4TMfIKWMhvlqeuZ2JjyuPQMdC/A2P+VNln3tQ=; b=qryhJ9wFcMfJxf7PKHf51BUVSn
	D3yyW/KgQUXsVYgmfQKTdaKO+Vuxr3jB2U9qTKFsFbAdOUVB4Gu1WVet+XUzNc0UNn4ad3oxLm1u8
	iSQiUve1V/Uy5LmEDoE98kN8MVeWo1//wRh27EGhF08cGPskCHPxtJG/93E1WXf7XJNt4QjVFLCoq
	IQXp295kJ7tfaQR5YtU8DgMosBe6rfke8gKnuXQ1HmqR9aA/Aeax0CGkg3vhbg6/XlnO+5IdChMOA
	wcE9F1rW8XKmtfZVOsta//tgnUbwCITpsqzo1G0zPNKFs/AdIBRfU4yQj5BJ0z16bCKVTPzLLY3JI
	eY5GmdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BKG-00000004iUu-18DI;
	Tue, 08 Apr 2025 15:57:24 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B94-00000004gGM-11Li
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:45:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538FjVYa727315
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 10:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744127131;
	bh=d3v4cd4TMfIKWMhvlqeuZ2JjyuPQMdC/A2P+VNln3tQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ffk711svConoIJeUGaH3fq63oFmHtY8IsZLZYXIb5wuHsjnrsc3CNpOJhwGm4pImG
	 lwmE8dpT9slAygh7sfbSD7EVEi/DCKZxfur6m04NeYKQ8flHcc2fH+oan8ZXNrWdfX
	 QqT3Bko5Vt1ZC7v9QTQ+qC/CDJQpQxRjAvWdw3dE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538FjVGN016850
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 10:45:31 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 10:45:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 10:45:30 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538FjR2t004072;
	Tue, 8 Apr 2025 10:45:27 -0500
Message-ID: <24b28bda-e294-4680-bed5-c44efcb6c455@ti.com>
Date: Tue, 8 Apr 2025 21:15:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel WARNING (RCU) with btnxpuart on TI AM62 platform
To: Francesco Dolcini <francesco@dolcini.it>,
        Amitkumar Karwar
	<amitkumar.karwar@nxp.com>,
        Neeraj Kale <neeraj.sanjaykale@nxp.com>, Nishanth
 Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar
	<ssantosh@kernel.org>
CC: <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-serial@vger.kernel.org>
References: <20250408083512.GA26035@francesco-nb>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250408083512.GA26035@francesco-nb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_084550_422723_DE621064 
X-CRM114-Status: GOOD (  12.59  )
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

On 08/04/25 14:05, Francesco Dolcini wrote:
> Hello,
> I do have the following kernel warning with 6.15-rc1, on a TI AM62
> platform (arm64), single CPU core, using btnxpuart driver, any idea?
> PREEMPT_RT is enabled, if it matters.
> 
> Either the issue is not systematic, or multi cores SoCs are not affected
> (no error on the exact same image on a dual nor on quad core TI AM62).
> 
> 
> [   23.139080] Voluntary context switch within RCU read-side critical section!
> [   23.139119] WARNING: CPU: 0 PID: 61 at /kernel/rcu/tree_plugin.h:332 rcu_note_context_switch+0x3c4/0x430
> [   23.139172] Modules linked in: uas onboard_usb_dev optee_rng dwc3 evdev btnxpuart spidev aes_ce_blk aes_ce_cipher ghash_ce gf128mul sha2_ce sha256_arm64 sha1_ce snd_soc_simple_card snd_soc_simple_card_utils optee spi_cadence_quadspi tee gpio_keys usb_conn_gpio display_connector roles dwc3_am62 mwifiex_sdio k3_j72xx_bandgap mwifiex rtc_ti_k3 cfg80211 tidss sa2ul sha512_generic snd_soc_davinci_mcasp authenc drm_display_helper snd_soc_ti_udma crypto_null snd_soc_ti_edma sha1_generic snd_soc_ti_sdma omap_hwspinlock lontium_lt8912b ina2xx snd_soc_wm8904 ti_ads1015 industrialio_triggered_buffer kfifo_buf lm75 tpm_tis_i2c tps65219_pwrbutton crc_ccitt tpm_tis_core tpm rng_core tc358768 m_can_platform pwm_tiehrpwm m_can spi_omap2_mcspi can_dev bluetooth ecdh_generic ecc rfkill libaes loop fuse ipv6 autofs4
> [   23.139459] CPU: 0 UID: 0 PID: 61 Comm: kworker/u5:0 Not tainted 6.15.0-rc1-0.0.0-devel #1 PREEMPT_RT
> [   23.139471] Hardware name: Toradex Verdin AM62 WB on Dahlia Board (DT)
> [   23.139478] Workqueue: hci0 hci_power_off [bluetooth]
> [   23.139615] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   23.139625] pc : rcu_note_context_switch+0x3c4/0x430
> [   23.139647] lr : rcu_note_context_switch+0x3c4/0x430
> [   23.139658] sp : ffff8000819fb740
> [   23.139661] x29: ffff8000819fb740 x28: 0000000000000000 x27: ffff0000079d2010
> [   23.139673] x26: ffff0000011e7810 x25: ffff000001c2c200 x24: 0000000000000000
> [   23.139688] x23: 0000000000000000 x22: ffff000001c2c200 x21: ffff000001c2c200
> [   23.139700] x20: ffff800081083ec0 x19: ffff00001da9fec0 x18: fffffffffffe7e78
> [   23.139712] x17: ffff7fff9ca1c000 x16: ffff800080000000 x15: ffff00001da9f8c0
> [   23.139726] x14: fffffffffffc7e77 x13: 216e6f6974636573 x12: 206c616369746972
> [   23.139738] x11: 6320656469732d64 x10: 6165722055435220 x9 : 206e696874697720
> [   23.139750] x8 : ffff80008113f040 x7 : ffff8000819fb4e0 x6 : 000000000000000c
> [   23.139761] x5 : ffff00001da95888 x4 : 0000000000000000 x3 : 0000000000000027
> [   23.139775] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000001c2c200
> [   23.139788] Call trace:
> [   23.139793]  rcu_note_context_switch+0x3c4/0x430 (P)
> [   23.139813]  __schedule+0xa0/0x7dc
> [   23.139830]  schedule+0x34/0x11c
> [   23.139841]  schedule_timeout+0x8c/0x110
> [   23.139861]  wait_for_completion_timeout+0x78/0x14c
> [   23.139873]  ti_sci_set_device_state+0x120/0x1fc
> [   23.139886]  ti_sci_cmd_get_device_exclusive+0x18/0x30
> [   23.139899]  ti_sci_pd_power_on+0x28/0x54
> [   23.139916]  _genpd_power_on+0x98/0x188
> [   23.139927]  genpd_power_on+0xa8/0x168
> [   23.139940]  genpd_runtime_resume+0xc0/0x298
> [   23.139957]  __rpm_callback+0x48/0x1a4
> [   23.139974]  rpm_callback+0x74/0x80
> [   23.139987]  rpm_resume+0x3b0/0x698
> [   23.140000]  __pm_runtime_resume+0x48/0x88
> [   23.140012]  omap8250_set_mctrl+0x2c/0xbc
> [   23.140030]  serial8250_set_mctrl+0x20/0x40
> [   23.140046]  uart_update_mctrl+0x80/0x110

I think issue is that uart_update_mctrl() holds a spinlock:

	uart_port_lock_irqsave(port, &flags);

and then omap8250_set_mctrl() calls pm_runtime APIs which on K3 SoC
needs to talk to a Firmware to enable pd. This IPC call is a sleeping
call leading to scheduling with IRQs disabled.

I guess this is what RT linux is complaining? I dont have a solution
though, maybe serdev delays pm_runtime_put till the port is closed?

> [   23.140062]  uart_dtr_rts+0x104/0x118
> [   23.140079]  tty_port_shutdown+0xd4/0xe0
> [   23.140092]  tty_port_close+0x3c/0xb8
> [   23.140103]  uart_close+0x34/0x98
> [   23.140116]  ttyport_close+0x50/0xa0
> [   23.140137]  serdev_device_close+0x40/0x5c
> [   23.140150]  btnxpuart_close+0x1c/0xa0 [btnxpuart]
> [   23.140175]  hci_dev_close_sync+0x304/0x7cc [bluetooth]
> [   23.140243]  hci_dev_do_close+0x2c/0x70 [bluetooth]
> [   23.140309]  hci_power_off+0x20/0x64 [bluetooth]
> [   23.140379]  process_one_work+0x148/0x284
> [   23.140403]  worker_thread+0x2c8/0x3dc
> [   23.140414]  kthread+0x12c/0x208
> [   23.140426]  ret_from_fork+0x10/0x20
> 
> 
> Francesco
> 
> 

-- 
Regards
Vignesh
https://ti.com/opensource


