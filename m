Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED7DCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2Vtp350isE3DGQVRjEr6bw6DiMDiFidqztxNEm7W9k=; b=A3UHyoUDYlc9Wn48Ih5xo7IulA
	CXyPiV4yjRcwFK2fK3j1pktuUdBSUomQ41ekvoifnL5X0pO++tT4p1i3K/Yc9/HI67ShGnnvIikap
	mwtEKMq5y8vHFTTk3uUHekCGGrqjCVdwlVlANvy1NMpYyeak65aEQTt9Iy/VIhUKBxqQLH08knqQ4
	bMDU/gXUDnGrB/lkolItiHz6vMnApRDQ+bgV6uLyO1Oqs6uX6Y52coK45Ga+ST5pYbhJ40/JXB/fL
	rkT/HcxCLYs+idXwr12bIJDz9PJbjVZogK7pz0Ua2fPbwrM6qCHF+jEDQzcCNXW0knXc4WZD+Bbaa
	c5F2qlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8HT-0000000GNuE-1PIj;
	Tue, 21 Oct 2025 09:03:47 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8HQ-0000000GNt4-2LyK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:03:46 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59L93Ld33211352;
	Tue, 21 Oct 2025 04:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761037401;
	bh=C2Vtp350isE3DGQVRjEr6bw6DiMDiFidqztxNEm7W9k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H/+mFcSqsE/upia5nZd2oTsvqsVH+3Ei6Mxyo5Jc3NfF2UlQ52Imk/CGxE+OZo87K
	 gU8ai5ODE74gjFCWQZDlfqoAccUdOI+9o+fitzFDa3SetegW/rS+ubUaad+FlZH5Jd
	 G3/dutBxukVtX5yFozX6uw8iCcJSIsb+oqf4Y9vM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59L93LMD1110909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 21 Oct 2025 04:03:21 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 21
 Oct 2025 04:03:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Oct 2025 04:03:20 -0500
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59L93BYT3520609;
	Tue, 21 Oct 2025 04:03:11 -0500
Message-ID: <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
Date: Tue, 21 Oct 2025 14:33:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
To: Hiago De Franco <hiagofranco@gmail.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <d-gole@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
	<joao.goncalves@toradex.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Logan Bristol
	<logan.bristol@utexas.edu>,
        Josua Mayer <josua@solid-run.com>, John Ma
	<jma@phytec.com>,
        Nathan Morrisson <nmorrisson@phytec.com>,
        Garrett Giordano
	<ggiordano@phytec.com>,
        Matt McKee <mmckee@phytec.com>, Wadim Egorov
	<w.egorov@phytec.de>,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Stefan
 Eichenberger <stefan.eichenberger@toradex.com>,
        Hiago De Franco
	<hiago.franco@toradex.com>,
        Diogo Ivo <diogo.ivo@siemens.com>,
        Li Hua Qian
	<huaqian.li@siemens.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Baocheng Su
	<baocheng.su@siemens.com>,
        Benedikt Niedermayr
	<benedikt.niedermayr@siemens.com>,
        <regressions@lists.linux.dev>
References: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_020344_739655_D3202EEE 
X-CRM114-Status: GOOD (  35.20  )
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

Hi Hiago,

On 20/10/25 19:47, Hiago De Franco wrote:
> Hello all,
>
> After commit 1d6161617c10 (“arm64: dts: ti: k3-am62-ti-ipc-firmware:
> Refactor IPC cfg into new dtsi”), suspend-to-RAM stopped working on
> AM62x.


The above commit is only refactoring changes and should not
cause any trouble. I think the commit you are interested in
should be: a49f991e740f ("arm64: dts: ti: k3-am62-verdin:
Add missing cfg for TI IPC Firmware").

>
> When I originally tested that change, I did not test suspend-to-RAM
> functionality, but our testing infrastructure caught this regression.
>
> See the log below:
>
> root@verdin-am62-15479173:~# cat /sys/class/remoteproc/remoteproc*/state
> offline
> offline
> offline
> root@verdin-am62-15479173:~# echo mem > /sys/power/state
> [   37.798686] PM: suspend entry (deep)
> [   37.805942] Filesystems sync: 0.003 seconds
> [   37.811965] Freezing user space processes
> [   37.819214] Freezing user space processes completed (elapsed 0.002 seconds)
> [   37.826469] OOM killer disabled.
> [   37.829721] Freezing remaining freezable tasks
> [   37.835557] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [   37.843057] printk: Suspending console(s) (use no_console_suspend to debug)
> [   37.953874] omap-mailbox 29000000.mailbox: fifo 5 has unexpected unread messages
> [   37.953909] omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
> [   37.953941] omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16
> [   37.953967] PM: Some devices failed to suspend, or early wake event detected
> [   37.973876] am65-cpsw-nuss 8000000.ethernet: set new flow-id-base 19
> [   37.984655] am65-cpsw-nuss 8000000.ethernet end0: PHY [8000f00.mdio:00] driver [TI DP83867] (irq=353)
> [   37.985655] am65-cpsw-nuss 8000000.ethernet end0: configuring for phy/rgmii-rxid link mode
> [   38.009002] usb-conn-gpio connector: repeated role: device
> [   38.013377] lt8912 1-0048: PM: dpm_run_callback(): lt8912_bridge_resume [lontium_lt8912b] returns -121
> [   38.013420] lt8912 1-0048: PM: failed to resume async: error -121
> [   38.153252] OOM killer enabled.
> [   38.156422] Restarting tasks: Starting
> [   38.163532] Restarting tasks: Done
> [   38.167252] random: crng reseeded on system resumption
> [   38.173031] PM: suspend exit
>
> The omap-mailbox driver returns -EBUSY because it detects an unexpected
> unread message on FIFO 5.  As I understand it, this FIFO corresponds to
> the communication channel between the DM R5 and the Cortex-M4 cores.
>
> DM R5 sends a message that is never consumed, since no firmware is
> running on the M4 (the core is offline).


May I know why you are not running any firmware on the M4
rproc? If the intention is just to run the DM R5 core on the SoC,
you can disable the IPC by NOT including the
"k3-am62-ti-ipc-firmware.dtsi". That was the motivation for the
refactoring.

>  This unhandled message prevents
> the system from entering suspend.


The underlying problem is in the mailbox driver handling,
see below.

>
> This issue also appears on the downstream TI kernel, which I reported
> earlier [1] (for reference).
>
> The following patch resolves the problem:
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
> index ea69fab9b52b..e07cf3290cc3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
> @@ -26,11 +26,6 @@ mbox_m4_0: mbox-m4-0 {
>                 ti,mbox-rx = <0 0 0>;
>                 ti,mbox-tx = <1 0 0>;
>         };
> -
> -       mbox_r5_0: mbox-r5-0 {
> -               ti,mbox-rx = <2 0 0>;
> -               ti,mbox-tx = <3 0 0>;
> -       };
>  };
>
>  &mcu_m4fss {
> @@ -45,7 +40,6 @@ &wkup_r5fss0 {
>  };
>
>  &wkup_r5fss0_core0 {
> -       mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>         memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>                         <&wkup_r5fss0_core0_memory_region>;
>         status = "okay";
>
> Ultimately  this issue is related to the omap driver itself:
>
> 1. We should have a functionatlly to save and restore the messages into
> the mailbox, instead of preveting it to go into suspend.


Quoting Hari:
"Restoring the stale mailbox messages could actually create
problems, depending on how the mailbox messages are used in
the IPC. If they hold indexes/pointers to some other IPC
structures or buffers(remember RTOS-RTOS IPC has notify
messaging in addition to RP messages) created dynamically
could lead to fatal errors."

>
> 2. Or we could not check all 16 FIFOs if the kernel does not own them:
>
> 	for (fifo = 0; fifo < mdev->num_fifos; fifo++) {
> 		if (mbox_read_reg(mdev, MAILBOX_MSGSTATUS(fifo))) {
> 			dev_err(mdev->dev, "fifo %d has unexpected unread messages\n",
> 				fifo);
> 			return -EBUSY;
> 		}
> 	}
>
> Setting the number of FIFOs to 4 in the device tree also resolves this
> issue.


This is avoiding the issue, IMHO its better to flush the pending
messages in the mbox driver while entering suspend as we are
just rebooting rprocs for S/R today. Whenever rprocs can
actually "resume" context from the point they were
"suspended", then we can add support to restore mailbox
messages too.

>
> Do you have suggestions on how best to fix this in the driver, or should
> we consider reverting the DTS change until suspend-to-RAM works again?


List of suggestions/solutions in order of preference:
1. If no intention to enable IPC on rprocs:
      Do _not_ include k3-am62-ti-ipc-firmware.dtsi
2. If intention is to enable IPC on rprocs:
      Make sure rproc firmware is available in rootfs.
      rproc would boot up and consume the mbox
      msg, suspend would be successful. Tested this
      on TI AM62x-sk with commit 1d6161617c, works
3. Add support in mbox driver to flush the pending
    queues.

>
> #regzbot introduced: 1d6161617c


Would not see this as a regression, but rather a new
bug for the omap-mailbox driver...

Thanks,
Beleswar

>
> [1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1557295/am62p-mailbox-channel-is-not-freed-during-r5-remoteproc-stop-call/6069413
>
> Best regards,
> Hiago.

