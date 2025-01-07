Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4462E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqjJdV7+kK8vKHeKq23znRgVHAQyQQt1dTWhmw3rvT8=; b=V2U4hjOu27M87dluNfTFly4ObL
	PQTdHUBZkncIjyGwF3sigOWGS5ALFUc8qqKrU6WFBB0/7srHYLNcpkcUa/nbhfTJ7r/1kDmE++bbi
	P1a5kR5i/sW9DiHmowyKYmbIo6RmLXM8JsNRCy2t5FOl/mPaqeIeDWtqykptFG1hG3SaWfvxODEQ1
	i8gxTME/IOy1hB3IfVYxUrwBhECSJrRxphSyxdkByHD+m1m19UdXQOBqfkE7i85DUk3aQG+pQ6diQ
	vWy1M7J+bgZPdB6msQLSbrdzLP6DEOUGRscai5CDlkA98Blxl2xAiMHwRHFOxBY7uhMT52sD/WhvE
	q1JQN80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6n0-00000004Kxt-2LVY;
	Tue, 07 Jan 2025 10:26:22 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6S7-00000004G5c-01s5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:04:51 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-85c41442fdeso2841780241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 02:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736244285; x=1736849085; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JqjJdV7+kK8vKHeKq23znRgVHAQyQQt1dTWhmw3rvT8=;
        b=fTLPPkjrI71uVQB4rHPmnyUoiJIEhI+7JDqYKQXCbYUsMgxQWxVsOwG/yJuV2mKp3K
         9w72o8Q3wAYVD8svtaGXLm/JGpJfYKOkVR9zG5jaP/gmAUekCXkLI4LkoCWSaLq+qAha
         mmHBQDumX+dpT36JAiR59ENRb9VY+7ksOaEfaG9++G1qROzvT4sCRAUhGkDFf8X+FYZw
         fJRuqC8/f5HiV3uSaxF7rKLazxeEdymj9WKKUebgmdSVOqbL8NMGz2scxucMscNQbRXw
         EyCoeZ5waU8n/STXUTUIwAGZ2rPOMBtzn49sgBIRe6MArtbvMvuTx0iZvGyJ7FHYJqfa
         IL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736244285; x=1736849085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqjJdV7+kK8vKHeKq23znRgVHAQyQQt1dTWhmw3rvT8=;
        b=jmJFYiJi7tcEhh1LC0mh+AQWs0K1GMHyHYqoYN7fBiY9bVyHis80/V01DfqEFqH/gU
         Qi3Zv4cb1pjjkngSpJKONwXCRAFToMRsNS7Y+Lisod/O6qGCrBdLe38EhoqC4JtU4/cu
         QyZwJKO+tnsDJfs/SrzDNHT1s5a3K/COM4F4DZTrG1l02a7LXR1IJLxKXEoIZUbeV1vQ
         JJMpqULXdtzZQnj+ucNPO9awpr1i0VFC0rt3wk7AnU1vpQ7KctQST4LM3zHm84ztMJCv
         dkKJnbpoGg94HCiPR4fVQT+o70fG1f6CX12y7ujyW3B/nR7IoMm0WSvBUH7XzsCrXC/p
         e2uw==
X-Forwarded-Encrypted: i=1; AJvYcCV7CQKPLEiQLKqK0MP4Ycs3OT1S21dSxgaUSb5s90gkflww9eS8JFWn4aZN9/lUiCfGpIh+3DbLpyIy+fPRzn0t@lists.infradead.org
X-Gm-Message-State: AOJu0YxIMZtKXC9SzCrmnK+Un9dVNypS3fuFgsjMtTMJT33gpDw6MYNU
	IFYrQuaXLM53Uyp7kgH3UPi5diuwbM7l1XfMwD8wSI4b+ARLef9mqSaU/yx5+ipf6Ify8X7xRjo
	6iEdBWsmUI1uE2Dx+fPO93Y6/Fd+juUC0dH+YJA==
X-Gm-Gg: ASbGncvGwRD2k6JpFIaPPYDh7sedE4XyRMARRBPlwaWDOEiocxMR4S4khOPTHvyO+lO
	7p6r7ojbDwkSVgcnerZEQmAPscOx+5kxNCcXT9Qqktk6lsO24qWpNUZ4G1BxME2ZVL/11yw==
X-Google-Smtp-Source: AGHT+IEYMByI1CukCp7+iU0syJyZYbdniyVUEgJCNZPn5nkOFjq/RC1n8WyIEN8fhtVYgKMQr1lagY71gxRkt7rKOM8=
X-Received: by 2002:a05:6102:cc8:b0:4af:ef85:dae4 with SMTP id
 ada2fe7eead31-4b2cc313a2cmr45181605137.5.1736244285299; Tue, 07 Jan 2025
 02:04:45 -0800 (PST)
MIME-Version: 1.0
References: <ee21345c-6baa-45fb-8807-1c836ac36963@gmx.net> <fc99b12d-b8b0-44d7-ac23-07454164fe79@broadcom.com>
 <c2b6aa36-69f9-4056-84fb-8c6e0b3cc84c@gmx.net>
In-Reply-To: <c2b6aa36-69f9-4056-84fb-8c6e0b3cc84c@gmx.net>
From: Jonathan Bell <jonathan@raspberrypi.com>
Date: Tue, 7 Jan 2025 10:04:33 +0000
Message-ID: <CADQZjwcjLMTLZB1tzp+PYKK9rm=Ke7a-KoGKMKb9zoWodcRK-A@mail.gmail.com>
Subject: Re: pcie-brcmstb: failed to enter low-power link state (L23)
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Stanimir Varbanov <svarbanov@suse.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_020447_219991_0421CB89 
X-CRM114-Status: GOOD (  27.53  )
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

On Mon, 30 Dec 2024 at 20:42, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Florian,
>
> Am 30.12.24 um 19:47 schrieb Florian Fainelli:
> > Hi Stefan,
> >
> > On 12/27/24 04:44, Stefan Wahren wrote:
> >> Hi,
> >> I did some experiments with s2idle on Raspberry Pi 4 (8 GB RAM,
> >> arm64/defconfig) and noticed that pcie-brcmstb fails to enter L23 state
> >> during suspend. I don't have any clue about PCI or this specific IP.
> >>
> >> Here is my current working branch [1], because s2idle on BCM2711
> >> currently requires some quirks.
> >>
> >> In order to help, I just added a simple dump of possible relevant
> >> registers at the begin of brcm_pcie_enter_l23():
> >>
> >> [   46.822440] PM: suspend entry (s2idle)
> >> [   47.050887] Filesystems sync: 0.228 seconds
> >> [   47.152159] Freezing user space processes
> >> [   47.154443] Freezing user space processes completed (elapsed 0.002
> >> seconds)
> >> [   47.154472] OOM killer disabled.
> >> [   47.154475] Freezing remaining freezable tasks
> >> [   47.155742] Freezing remaining freezable tasks completed (elapsed
> >> 0.001 seconds)
> >> [   48.797565] PM: suspend of devices complete after 1641.374 msecs
> >> [   48.797580] PM: start suspend of devices complete after 1641.829
> >> msecs
> >> [   48.798059] PM: late suspend of devices complete after 0.473 msecs
> >> [   48.810510] brcm-pcie fd500000.pcie:
> >> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY: 00315e12
> >> [   48.810519] brcm-pcie fd500000.pcie: PCIE_RC_CFG_PRIV1_ROOT_CAP:
> >> 0000000f
> >> [   48.810523] brcm-pcie fd500000.pcie: PCIE_MISC_HARD_PCIE_HARD_DEBUG:
> >> 00200000
> >> [   48.810528] brcm-pcie fd500000.pcie: PCIE_MISC_MISC_CTRL: 88003480
> >> [   48.810532] brcm-pcie fd500000.pcie: PCIE_MISC_PCIE_CTRL: 00000000
> >> [   48.810535] brcm-pcie fd500000.pcie: PCIE_MISC_PCIE_STATUS: 000000b0
> >> [   48.846632] brcm-pcie fd500000.pcie: failed to enter low-power
> >> link state
> >> [   48.846640] xhci_hcd 0000:01:00.0: Possible wake-up device;
> >> regulators will not be disabled
> >> [   48.846725] PM: noirq suspend of devices complete after 48.628 msecs
> >> [   48.846730] PM: suspend-to-idle
> >> [   53.672017] PM: Triggering wakeup from IRQ 25
> >> [   53.672032] PM: resume from suspend-to-idle
> >>
> >> Does BCM2711 support L23 mode?
> >
> > AFAICT it does, but the end-point might not, and this is not
> > considered a fatal error, in fact we should probably demote this message.
> Agree, this match my observations with the CM4, which didn't have any
> PCI end point connected and didn't show this error.
>
> In case L23 state is optional, i agree this shouldn't be an error
> message. Maybe the comments for this functions should be extended.
>
> I reported this issue, because i thought this is the root cause why the
> XHCI controller isn't available after resume. Seems to be a red hering.
>
> > Would you have the lspci -vvv of the XHCI controller, too?
>
> Sure
>
> pi@raspberrypi:~$ lspci -vvv
> 00:00.0 PCI bridge: Broadcom Inc. and subsidiaries BCM2711 PCIe Bridge
> (rev 10) (prog-if 00 [Normal decode])
>          Device tree node:
> /sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0
>          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>          Latency: 0
>          Interrupt: pin A routed to IRQ 39
>          Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
>          I/O behind bridge: 00000000-00000fff [size=4K]
>          Memory behind bridge: f8000000-f80fffff [size=1M]
>          Prefetchable memory behind bridge:
> 00000000fff00000-00000000000fffff [disabled]
>          Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- <SERR- <PERR-
>          BridgeCtl: Parity- SERR- NoISA- VGA- VGA16- MAbort- >Reset-
> FastB2B-
>                  PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>          Capabilities: <access denied>
>          Kernel driver in use: pcieport
>
> 01:00.0 USB controller: VIA Technologies, Inc. VL805 USB 3.0 Host
> Controller (rev 01) (prog-if 30 [XHCI])
>          Subsystem: VIA Technologies, Inc. VL805 USB 3.0 Host Controller
>          Device tree node:
> /sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0/usb@0,0
>          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr+ Stepping- SERR+ FastB2B- DisINTx+
>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>          Latency: 0, Cache Line Size: 64 bytes
>          Interrupt: pin A routed to IRQ 41
>          Region 0: Memory at 600000000 (64-bit, non-prefetchable) [size=4K]
>          Capabilities: <access denied>
>          Kernel driver in use: xhci_hcd
>
L23 entry for a PCIe endpoint is optional. Using PCI PM signalling to
enter D3hot, then turning power off, is sufficient for functionality.
It may be the case that the VL805 ignores link L2 PME handshakes, and
that's a valid thing to do.
I'd suggest testing CM4 with a network adapter that supports wake-on-LAN.

RP1 does support L23 entry and L2 exit through in-band signalling, but
the BCM2712 Videocore firmware probably won't correctly maintain or
sequence RP1's reset pin through platform suspend.

Regards
Jonathan

