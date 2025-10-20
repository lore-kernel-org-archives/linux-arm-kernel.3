Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3728FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MFGSwFSrgqDr9/3WMg/kXR+n60QLpJskpnlVbbXnq7E=; b=k+NVHfamWOtG/UhcLMHx25g5Om
	nhG3x+jHlAjcIWWPL8vIdHZjHKY0Z925h9aGintoZ2ngYN3FP1PTSGIXcL7itp6jUFVM/n61hqfIX
	nK+zv1enZYqochCz4W8OnMzxWYWwrCwW592dukBEO+Jwk8ooJJC2392rEG1QZwIrvLHhB+egqiKOk
	r6fWPERbyp9T1eqeiIQrwrkHUeahYcPzxFFQSbTKeNFTwUxk2Btbosr2B7D/Y7rPWFpwEGgnE1iqB
	Sn6FsUlGawvYDX5qCEAa7VROybf/G0w/2QqXkxvs3NzgBepY4c8XvkoWzUwbsb+RcP0Xcz255djOk
	bxzAZ3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqhQ-0000000DvkX-1Mzf;
	Mon, 20 Oct 2025 14:17:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqhM-0000000DviQ-31CW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:17:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3968862b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760969839; x=1761574639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFGSwFSrgqDr9/3WMg/kXR+n60QLpJskpnlVbbXnq7E=;
        b=UeCf2bk88BjjzM2T5KoyPu5Zt29yAV92m58QaIbot7K7qVNPS+9OghZT6LbXFo1Acg
         OYUPUNQUftZzB4D4v671tnFLEMGtVLVxmsmu8LxDe3NJGiS5SOha0ocyL8BYomFmwRj/
         ApdoSV25wk8Zyj5chAZD+2OIsZF9nI3H/CjY0uCKM47oU4FDMWDCLIe83deLA1gNLtDr
         zJa0AVDn50ZQLSB06wXsawFALMc3vOj77DMR2EwVSSpabz6z4mdc9jqWUbSHmPxcOk0+
         YxR0YJzkIfu4NtrQfdIWfmb2oOVbCCkEk7lfiGuMWwWBLqGrp47OaFPA38I+UuoacEim
         xCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969839; x=1761574639;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFGSwFSrgqDr9/3WMg/kXR+n60QLpJskpnlVbbXnq7E=;
        b=K+q3JkNQFVkWwCLBf78NYR7b4vQr5Vf7Lu1BeoW2SYQ4SJB5XDz7gh0iKXVY87cH+1
         rOFL3KgQ+HMlqU//4iRa7Kd9JBnRjEvZRMnXbcH9Y1C9Q1xdGSUK78zLtMVUg11AWspv
         VXm9YPwVvFiHtfpw9ZRFGMBCiGpF8lm5spcRJeOHXow4l6GU3IoAbnjhMv+AE28pifNs
         71Yye7XK458E5uVF5bL7suOtSjYrcMh8Vg/meNQezHPaW301F2cUkHQQFkMFI480tHLu
         rXSKCgKua933s+UlO8sw7QlUmcQoExAFMI/X/XsoUSb7tNEU+Yt//ORzof7+uyA6criX
         RzsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXreolo8kGZdFZAHjk7lK9qgj+JD2/t37KFZH7ABVZlxIMP2N/rf4yxfsCh8o9ueuqqhZt08b14zu2R8VFSVSTU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5G28VinQ8y78GvA3QpdELTIV+M4Qaef8cRXL7FNeCmsQP0cBB
	JNxGbwRGWkhhwJiQLlonjPYAgL2xCHm+E87/WmZj9ZTt6Rsr1LL4Zir7
X-Gm-Gg: ASbGncv13efPuXc6zTKk44tMhCXEcsnSzC6bOOM2yY/xklDwAi37eVDErUvahmEIpcn
	0HEkFJ5LCrWLSNHKXLR4sz37Vgt0bd6dCuhIa2Av+xkJ+9ivcX4PWToJO/YwZWsstb7VsroshuU
	HnXPAi98m2PNxmBOWqntIaDWoDO9VzJ8u6Si05ePsm6G27s3biebTaIH2HKIskfwAlmaxVA2tNg
	+uVc+HDj9c7JrbWLhSOhcPWJTyVglWSDJwna42gB2GCiG+fwtcuDueKyqTU1dwKiy00oBM+QkoT
	8QyJ/qM2Z6m3Fvn4WDM5X8fTntYT/pboU6YCYLe/d1tGnU4HRmVgyNPBmoYUD+q6t/gERMBkfY4
	JRMZdaL4oB/YxVoU7UY7vy9QNIDFqolRaGftWYRefVBLe06Aajk1F48pDciYBgo2/DE9V/LGvCu
	L6BLWlW3DjXNcBETGu5IH/+t0Gjc5EFjo=
X-Google-Smtp-Source: AGHT+IEGpqCj48hSlGvE39SucbX6Ouca5PqF+VzauRnJXVW7BvicaDLem8wj36fR99ehw835dYNneQ==
X-Received: by 2002:a17:90b:3c02:b0:33b:6bff:35fe with SMTP id 98e67ed59e1d1-33bc9d1c743mr18185739a91.16.1760969839288;
        Mon, 20 Oct 2025 07:17:19 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c0:fdb0:efbb:1413:f1d2:48d9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5de11601sm8126966a91.9.2025.10.20.07.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:17:18 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:17:04 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, u-kumar1@ti.com, 
	hnagalla@ti.com, jm@ti.com, d-gole@ti.com, b-padhi@ti.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Robert Nelson <robertcnelson@gmail.com>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Logan Bristol <logan.bristol@utexas.edu>, Josua Mayer <josua@solid-run.com>, John Ma <jma@phytec.com>, 
	Nathan Morrisson <nmorrisson@phytec.com>, Garrett Giordano <ggiordano@phytec.com>, 
	Matt McKee <mmckee@phytec.com>, Wadim Egorov <w.egorov@phytec.de>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Diogo Ivo <diogo.ivo@siemens.com>, 
	Li Hua Qian <huaqian.li@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Baocheng Su <baocheng.su@siemens.com>, Benedikt Niedermayr <benedikt.niedermayr@siemens.com>, 
	regressions@lists.linux.dev
Subject: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
Message-ID: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_071720_762352_2CC8463F 
X-CRM114-Status: GOOD (  17.40  )
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

Hello all,

After commit 1d6161617c10 (“arm64: dts: ti: k3-am62-ti-ipc-firmware:
Refactor IPC cfg into new dtsi”), suspend-to-RAM stopped working on
AM62x.

When I originally tested that change, I did not test suspend-to-RAM
functionality, but our testing infrastructure caught this regression.

See the log below:

root@verdin-am62-15479173:~# cat /sys/class/remoteproc/remoteproc*/state
offline
offline
offline
root@verdin-am62-15479173:~# echo mem > /sys/power/state
[   37.798686] PM: suspend entry (deep)
[   37.805942] Filesystems sync: 0.003 seconds
[   37.811965] Freezing user space processes
[   37.819214] Freezing user space processes completed (elapsed 0.002 seconds)
[   37.826469] OOM killer disabled.
[   37.829721] Freezing remaining freezable tasks
[   37.835557] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   37.843057] printk: Suspending console(s) (use no_console_suspend to debug)
[   37.953874] omap-mailbox 29000000.mailbox: fifo 5 has unexpected unread messages
[   37.953909] omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
[   37.953941] omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16
[   37.953967] PM: Some devices failed to suspend, or early wake event detected
[   37.973876] am65-cpsw-nuss 8000000.ethernet: set new flow-id-base 19
[   37.984655] am65-cpsw-nuss 8000000.ethernet end0: PHY [8000f00.mdio:00] driver [TI DP83867] (irq=353)
[   37.985655] am65-cpsw-nuss 8000000.ethernet end0: configuring for phy/rgmii-rxid link mode
[   38.009002] usb-conn-gpio connector: repeated role: device
[   38.013377] lt8912 1-0048: PM: dpm_run_callback(): lt8912_bridge_resume [lontium_lt8912b] returns -121
[   38.013420] lt8912 1-0048: PM: failed to resume async: error -121
[   38.153252] OOM killer enabled.
[   38.156422] Restarting tasks: Starting
[   38.163532] Restarting tasks: Done
[   38.167252] random: crng reseeded on system resumption
[   38.173031] PM: suspend exit

The omap-mailbox driver returns -EBUSY because it detects an unexpected
unread message on FIFO 5.  As I understand it, this FIFO corresponds to
the communication channel between the DM R5 and the Cortex-M4 cores.

DM R5 sends a message that is never consumed, since no firmware is
running on the M4 (the core is offline). This unhandled message prevents
the system from entering suspend.

This issue also appears on the downstream TI kernel, which I reported
earlier [1] (for reference).

The following patch resolves the problem:

diff --git a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
index ea69fab9b52b..e07cf3290cc3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
@@ -26,11 +26,6 @@ mbox_m4_0: mbox-m4-0 {
                ti,mbox-rx = <0 0 0>;
                ti,mbox-tx = <1 0 0>;
        };
-
-       mbox_r5_0: mbox-r5-0 {
-               ti,mbox-rx = <2 0 0>;
-               ti,mbox-tx = <3 0 0>;
-       };
 };

 &mcu_m4fss {
@@ -45,7 +40,6 @@ &wkup_r5fss0 {
 };

 &wkup_r5fss0_core0 {
-       mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
        memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
                        <&wkup_r5fss0_core0_memory_region>;
        status = "okay";

Ultimately  this issue is related to the omap driver itself:

1. We should have a functionatlly to save and restore the messages into
the mailbox, instead of preveting it to go into suspend.

2. Or we could not check all 16 FIFOs if the kernel does not own them:

	for (fifo = 0; fifo < mdev->num_fifos; fifo++) {
		if (mbox_read_reg(mdev, MAILBOX_MSGSTATUS(fifo))) {
			dev_err(mdev->dev, "fifo %d has unexpected unread messages\n",
				fifo);
			return -EBUSY;
		}
	}

Setting the number of FIFOs to 4 in the device tree also resolves this
issue.

Do you have suggestions on how best to fix this in the driver, or should
we consider reverting the DTS change until suspend-to-RAM works again?

#regzbot introduced: 1d6161617c

[1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1557295/am62p-mailbox-channel-is-not-freed-during-r5-remoteproc-stop-call/6069413

Best regards,
Hiago.

