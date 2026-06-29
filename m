Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E65CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 21:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thqCYPRl2r/uPWS1HtNvi/sQhkIC0Eju0+NcpOz/h1Y=; b=XeaTPv5acDi8SsDDCFl+rRrZWk
	9IrsEeeWuTAQ9JlrYXnN4vQXrDz2oAcdMM0jL/gw2dDh1unJV5P1sEBjsZSAIQvddKZ35d9lb2Eg1
	x4HDRRxTlilX5LD+H+YY+iD6MjqVj77e3gXQvkGnwFg8sPQ1kGDNlvQjdE8IbHOxmLfPoeby8YR8D
	TkRZxqkEEquPkBsO8LJU3x/nPhAPEbBP41Vrs+MUeQewgTEXTiuLvzWe6mWVzEcJJ3bOi3Faafk88
	OvH2m2ANBh9CociNLpRFOxZraUQPzzz2zu7JLBuhLPjI6p5qjcC53ooFpuOvOAVA1Jg600eDjLWq8
	+rVLTTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJL4-0000000FUWt-2xIy;
	Mon, 29 Jun 2026 21:16:22 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJL0-0000000FUWR-3K2Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 21:16:21 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-664a09bc459so3507169d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782767777; x=1783372577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thqCYPRl2r/uPWS1HtNvi/sQhkIC0Eju0+NcpOz/h1Y=;
        b=P3gnM+H4LvHOR+EBVhWsKljMszGvEY/dzDtM8kpgufJKBkG+utoCAjmVOwkcNPFKO1
         1K5EtENvgk3g+9hCLcz2TYyxfzUDR8NmvUaEUbSCEqd+uD5p/24celxGkIHI2XiM/Pra
         rDZrIUo6tx6EndfuMZscfCmpYFAQRy6RBtzY1bH1Nn2X2UPXeSUKpDFehF/8oXlDWKEu
         3WxOrV9G09QY2MVnvNAK6kgfaG/J0a+s8GDZ7ZB6yHLD13A8Gb7M6QnUTQh5zCm0AbJf
         rHanLliiJsQOXLcSldXem3EWp8SFwOcxgmkLKIsl4qeXkAUZznFQjZFKI58ZUjz0vYH2
         MBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782767777; x=1783372577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thqCYPRl2r/uPWS1HtNvi/sQhkIC0Eju0+NcpOz/h1Y=;
        b=gX+YP7AQ0sLlHZbRUGQHjU+mj1gN78VqIrnUfq+VYyHZtiJ2CpXoTEYITZ8ea3lp/J
         K1fozaT8UyFoFUnbKMAGZEh5IRmQHffvwMkgzmvbyoMJfAsjIMQLrneulg1r6qSnlna6
         JmwZB6u5aIek2Wo3fomKHvGK1IqnfW/V2swFFJJ7KUPHNRI11ewOOY0A6kD8AOEuQ2MP
         eHEJXJYkvbTKhGmx8P5pnEPP23Ym+qGES6CNEHWiRmCCruU6RHle+B6MjZV/vIHel71L
         WuaxW6dWeqgS+SDAfFi7CeO3Qh4Du81O2UeQF8eVCE1AEXmACiJhzrUSNo7AmsTuZsP+
         xs6w==
X-Forwarded-Encrypted: i=1; AHgh+RqfTgvpNQMo9wi69sdUpWgu8zFgOPx28lpvgNV/S4va7Nc2rAodl2hNwrSIjOia925e2ecHUIktERNOL/QsAJom@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5G9Ekx6WEt2etFqRy7phegCgJF/cdXFvCwdNC+vKbCQDWALo
	4xcNtrZyvT2WDiysZ9/wt+L2DM7vIfBvpr7LMnoboSfuMQx8bjQ1hXxr
X-Gm-Gg: AfdE7cnW9wMam1k/jYGbL/vjsX5iAuRhPD/EPm5Sjw+Yg5r8snS95SdU9G4/UtGU1rg
	hPB/8uptQgokS3bYaQIzUfo8gEHbY6EyNk22XzfDT7oxSGF57X0UAfi9M9JNnR2aePagmpGIqb6
	dfyVQ5j4G/1SUR/7yBcSVY2BkMVjw14WLQQkd/Xl7K/MkUbFQ1WvtqzHWfJb786mLCUpAfesWje
	4eZqHK3odCSluRyq2883M8V27IRc2OHCWhBcgR8E/ygLNPvm95AzhT9Szvw2XAGvop6FjIScbt5
	6q6xAlzrFQh23ZTqLRWD9MVbUqhDki0N9AAY7FmTTASHQbbsFPeSRu7nYWQMxsZhgO5+aCnPsLi
	VOVYnKxntBqWI40GQKvXq/N2irwQFds/bKI+dzycEIYzSdb77v+xyQpbkuCTMPJaJFIuCunCu23
	1TqHa/+zD7LHHcILMcCPXI0HRjZOMT74JFR7fUS82HWnCizgzs8oDSYd+GHVQRcEOovnhm8gU=
X-Received: by 2002:a05:690e:43cd:b0:660:460e:2558 with SMTP id 956f58d0204a3-664f9a33d9amr1010562d50.43.1782767777025;
        Mon, 29 Jun 2026 14:16:17 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-664b8d0842asm4023556d50.19.2026.06.29.14.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:16:16 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: krishna.chundru@oss.qualcomm.com
Cc: bhelgaas@google.com,
	bjorn.andersson@oss.qualcomm.com,
	jingoohan1@gmail.com,
	jonathanh@nvidia.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v5 5/5] PCI: qcom: Add D3cold support
Date: Mon, 29 Jun 2026 16:16:14 -0500
Message-ID: <20260629211614.6942-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_141618_961035_792B0499 
X-CRM114-Status: GOOD (  12.72  )
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

Hi Krishna, and Mani,

Turns out, this patchset causes issues but only on some machines.  On a WDK2023
(Volterra), this breaks suspend, and on *my* X13s, it also seems to when using
the command `sudo rtcwake -m freeze -s 300` when resuming it crashes the
machine.  Interestingly, it does not crash on another user's X13s.

Included is the info from Volterra's lspci -vvv and further down will be my
lspci -vvv - my X13s has a WD_BLACK 2TB SN770M in it which is not what it came
with from Lenovo.

WDK2023:

[alex@volterra d3-bug]$ cat volterra-info.txt
Linux volterra 7.0.14-gefea59a29f1a #17 SMP PREEMPT Mon Jun 29 14:47:59 CDT 2026 aarch64 GNU/Linux
Windows Dev Kit 2023BOOT_IMAGE=/@/boot/vmlinuz-linux root=UUID=a8f7fb76-9ae0-49af-a830-09025b783224 rw rootflags=subvol=@ loglevel=3 efi=noruntime clk_ignore_unused pd_ignore_unused regulator_ignore_unused arm64.nopauth
[alex@volterra d3-bug]$ cat volterra-lspci-vvv.txt
0002:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c20000/pcie@0
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupts: pin B disabled, MSI(X) routed to IRQ 182
Region 0: Memory at 3c700000 (32-bit, non-prefetchable) [size=4K]
Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
I/O behind bridge: 100000-100fff [size=4K] [16-bit]
Memory behind bridge: 3c300000-3c4fffff [size=2M] [32-bit]
Prefetchable memory behind bridge: 3c500000-3c6fffff [size=2M] [32-bit]
Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
Capabilities: [40] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
Address: 0000000017a50040 Data: 0000
Masking: fffffffe Pending: 00000000
Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
DevCap: MaxPayload 256 bytes, PhantFunc 0
ExtTag- RBE+ TEE-IO-
DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
MaxPayload 128 bytes, MaxReadReq 512 bytes
DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
LnkSta: Speed 8GT/s, Width x4
TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
Slot #0, PowerLimit 0W; Interlock+ NoCompl+
SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
Control: AttnInd Off, PwrInd Off, Power- Interlock-
SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
Changed: MRL- PresDet- LinkState-
RootCap: CRSVisible-
RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
RootSta: PME ReqID 0000, PMEStatus- PMEPending-
DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
AtomicOpsCtl: ReqEn- EgressBlck-
IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
Capabilities: [100 v2] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
HeaderLog: 00000000 00000000 00000000 00000000
RootCmd: CERptEn+ NFERptEn+ FERptEn+
RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
Capabilities: [148 v1] Secondary PCI Express
LnkCtl3: LnkEquIntrruptEn- PerformEqu-
LaneErrStat: 0
Capabilities: [168 v1] Transaction Processing Hints
No steering table available
Capabilities: [1fc v1] L1 PM Substates
L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
T_CommonMode=70us LTR1.2_Threshold=136192ns
L1SubCtl2: T_PwrOn=60us
Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
Kernel driver in use: pcieport

0002:01:00.0 Non-Volatile memory controller: Silicon Motion, Inc. SM2269XT (DRAM-less) NVMe SSD Controller (rev 03) (prog-if 02 [NVM Express])
Subsystem: Silicon Motion, Inc. SM2269XT (DRAM-less) NVMe SSD Controller
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupts: pin B disabled, MSI(X) routed to IRQ 183-191
Region 0: Memory at 3c300000 (64-bit, non-prefetchable) [size=16K]
Capabilities: [40] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [50] MSI: Enable- Count=1/16 Maskable+ 64bit+
Address: 0000000000000000 Data: 0000
Masking: 00000000 Pending: 00000000
Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0W TEE-IO-
DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-
MaxPayload 128 bytes, MaxReadReq 512 bytes
DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- FltModeDis-
LnkSta: Speed 8GT/s (downgraded), Width x4
TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
FRS+ TPHComp- ExtTPHComp-
AtomicOpsCap: 32bit- 64bit- 128bitCAS-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
AtomicOpsCtl: ReqEn-
IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS+
LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
Retimer- 2Retimers- CrosslinkRes: Upstream Port, FltMode-
Capabilities: [b0] MSI-X: Enable+ Count=17 Masked-
Vector table: BAR=0 offset=00002000
PBA: BAR=0 offset=00003000
Capabilities: [100 v2] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
HeaderLog: 00000000 00000000 00000000 00000000
Capabilities: [148 v1] Power Budgeting <?>
Capabilities: [158 v1] Alternative Routing-ID Interpretation (ARI)
ARICap: MFVC- ACS-, Next Function: 0
ARICtl: MFVC- ACS-, Function Group: 0
Capabilities: [168 v1] Secondary PCI Express
LnkCtl3: LnkEquIntrruptEn- PerformEqu-
LaneErrStat: 0
Capabilities: [188 v1] Physical Layer 16.0 GT/s
Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
Capabilities: [1ac v1] Lane Margining at the Receiver
PortCap: Uses Driver-
PortSta: MargReady- MargSoftReady-
Capabilities: [204 v1] Latency Tolerance Reporting
Max snoop latency: 0ns
Max no snoop latency: 0ns
Capabilities: [20c v1] L1 PM Substates
L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
PortCommonModeRestoreTime=10us PortTPowerOnTime=60us
L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
T_CommonMode=0us LTR1.2_Threshold=136192ns
L1SubCtl2: T_PwrOn=60us
Capabilities: [390 v1] Data Link Feature <?>
Kernel driver in use: nvme
Kernel modules: nvme

0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupts: pin B disabled, MSI(X) routed to IRQ 237
Region 0: Memory at 30300000 (32-bit, non-prefetchable) [size=4K]
Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
I/O behind bridge: 1000-1fff [size=4K] [16-bit]
Memory behind bridge: 30400000-305fffff [size=2M] [32-bit]
Prefetchable memory behind bridge: 30600000-307fffff [size=2M] [32-bit]
Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
Capabilities: [40] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
Address: 0000000017a50040 Data: 0000
Masking: fffffffe Pending: 00000000
Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
DevCap: MaxPayload 128 bytes, PhantFunc 0
ExtTag- RBE+ TEE-IO-
DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
MaxPayload 128 bytes, MaxReadReq 512 bytes
DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit Latency L1 <64us
ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
LnkSta: Speed 5GT/s, Width x1
TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
Slot #0, PowerLimit 0W; Interlock+ NoCompl+
SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
Control: AttnInd Off, PwrInd Off, Power- Interlock-
SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
Changed: MRL- PresDet- LinkState-
RootCap: CRSVisible+
RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
RootSta: PME ReqID 0000, PMEStatus- PMEPending-
DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
AtomicOpsCtl: ReqEn- EgressBlck-
IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
Capabilities: [100 v2] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
HeaderLog: 00000000 00000000 00000000 00000000
RootCmd: CERptEn+ NFERptEn+ FERptEn+
RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
Capabilities: [148 v1] Secondary PCI Express
LnkCtl3: LnkEquIntrruptEn- PerformEqu-
LaneErrStat: 0
Capabilities: [158 v1] Transaction Processing Hints
No steering table available
Capabilities: [1ec v1] L1 PM Substates
L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
T_CommonMode=70us LTR1.2_Threshold=76800ns
L1SubCtl2: T_PwrOn=0us
Capabilities: [1fc v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
Capabilities: [2fc v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
Kernel driver in use: pcieport

0006:01:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 Wireless Network Adapter (rev 01)
Subsystem: Qualcomm Technologies, Inc Device 0108
Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0/wifi@0
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupts: MSI(X) routed to IRQ 245-276
Region 0: Memory at 30400000 (64-bit, non-prefetchable) [size=2M]
Capabilities: [40] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [50] MSI: Enable+ Count=32/32 Maskable+ 64bit-
Address: 17a50040 Data: 0000
Masking: fe023c00 Pending: 00000000
Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
MaxPayload 128 bytes, MaxReadReq 512 bytes
DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
LnkCap: Port #0, Speed 8GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <64us
ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
LnkSta: Speed 5GT/s (downgraded), Width x1
TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
FRS- TPHComp+ ExtTPHComp-
AtomicOpsCap: 32bit- 64bit- 128bitCAS-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
AtomicOpsCtl: ReqEn-
IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
Capabilities: [100 v2] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
HeaderLog: 00000000 00000000 00000000 00000000
Capabilities: [148 v1] Secondary PCI Express
LnkCtl3: LnkEquIntrruptEn- PerformEqu-
LaneErrStat: 0
Capabilities: [158 v1] Transaction Processing Hints
No steering table available
Capabilities: [1e4 v1] Latency Tolerance Reporting
Max snoop latency: 0ns
Max no snoop latency: 0ns
Capabilities: [1ec v1] L1 PM Substates
L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
T_CommonMode=0us LTR1.2_Threshold=76800ns
L1SubCtl2: T_PwrOn=0us
Kernel driver in use: ath11k_pci
Kernel modules: ath11k_pci


X13s:
cmdline.txt: BOOT_IMAGE=/boot/vmlinuz-7.0.14 root=UUID=dc44a82f-6d97-490e-a4be-4c3bceacc658 ro arm64.nopauth ipv6.disable=1 clk_ignore_unused mitigations=off cfg80211.ieee80211_regdom=US efi=noruntime printk.always_kmsg_dump=Y efi_pstore.pstore_disable=N quiet splash

lspci -vvv:
steev@finn:~$ sudo lspci -vvv
[sudo] password for steev:
0002:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
        Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c20000/pcie@0
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupts: pin B disabled, MSI(X) routed to IRQ 215
        IOMMU group: 14
        Region 0: Memory at 3c700000 (32-bit, non-prefetchable) [size=4K]
        Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
        I/O behind bridge: 200000-200fff [size=4K] [16-bit]
        Memory behind bridge: 3c300000-3c4fffff [size=2M] [32-bit]
        Prefetchable memory behind bridge: 3c500000-3c6fffff [size=2M] [32-bit]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
                Address: 00000000fffff040  Data: 0000
                Masking: fffffffe  Pending: 00000000
        Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+ TEE-IO-
                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
                        ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
                LnkSta: Speed 8GT/s, Width x4
                        TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
                SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
                        Slot #0, PowerLimit 0W; Interlock+ NoCompl+
                SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
                        Control: AttnInd Off, PwrInd Off, Power- Interlock-
                SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
                        Changed: MRL- PresDet- LinkState-
                RootCap: CRSVisible-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                         FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
                         AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
                         AtomicOpsCtl: ReqEn- EgressBlck-
                         IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
        Capabilities: [100 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
                RootCmd: CERptEn+ NFERptEn+ FERptEn+
                RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                         FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
                ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
        Capabilities: [148 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [168 v1] Transaction Processing Hints
                No steering table available
        Capabilities: [1fc v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
                L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1-
                           T_CommonMode=70us LTR1.2_Threshold=86016ns
                L1SubCtl2: T_PwrOn=10us
        Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
        Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
        Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
        Kernel driver in use: pcieport

0002:01:00.0 Non-Volatile memory controller: Sandisk Corp WD Black SN770M NVMe SSD (DRAM-less) (rev 01) (prog-if 02 [NVM Express])
        Subsystem: Sandisk Corp WD Black SN770M NVMe SSD (DRAM-less)
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupts: pin B disabled, MSI(X) routed to IRQ 253-261
        IOMMU group: 14
        Region 0: Memory at 3c300000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [90] MSI: Enable- Count=1/32 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [b0] MSI-X: Enable+ Count=65 Masked-
                Vector table: BAR=0 offset=00003000
                PBA: BAR=0 offset=00002000
        Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
                DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s <1us, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0W TEE-IO-
                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <8us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
                        ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
                LnkSta: Speed 8GT/s (downgraded), Width x4
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
                         10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix-
                         EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                         FRS- TPHComp- ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                         AtomicOpsCtl: ReqEn-
                         IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
                LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
        Capabilities: [100 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [1b8 v1] Latency Tolerance Reporting
                Max snoop latency: 0ns
                Max no snoop latency: 0ns
        Capabilities: [300 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [900 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1- L1_PM_Substates+
                          PortCommonModeRestoreTime=32us PortTPowerOnTime=10us
                L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1-
                           T_CommonMode=0us LTR1.2_Threshold=86016ns
                L1SubCtl2: T_PwrOn=10us
        Capabilities: [910 v1] Data Link Feature <?>
        Capabilities: [920 v1] Lane Margining at the Receiver
                PortCap: Uses Driver+
                PortSta: MargReady- MargSoftReady+
        Capabilities: [9c0 v1] Physical Layer 16.0 GT/s
                Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
        Kernel driver in use: nvme
        Kernel modules: nvme

0004:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
        Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c10000/pcie@0
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupts: MSI(X) routed to IRQ 217
        IOMMU group: 15
        Region 0: Memory at 34700000 (32-bit, non-prefetchable) [size=4K]
        Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
        I/O behind bridge: 1000-1fff [size=4K] [16-bit]
        Memory behind bridge: 34300000-344fffff [size=2M] [32-bit]
        Prefetchable memory behind bridge: 34500000-346fffff [size=2M] [32-bit]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
                Address: 00000000fffff040  Data: 0000
                Masking: fffffffe  Pending: 00000000
        Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+ TEE-IO-
                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 128 bytes, LnkDisable- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
                LnkSta: Speed 2.5GT/s, Width x1
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
                        Slot #0, PowerLimit 0W; Interlock+ NoCompl+
                SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
                        Control: AttnInd Off, PwrInd Off, Power- Interlock-
                SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
                        Changed: MRL- PresDet- LinkState-
                RootCap: CRSVisible+
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                         FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
                         AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
                         AtomicOpsCtl: ReqEn- EgressBlck-
                         IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
        Capabilities: [100 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
                RootCmd: CERptEn+ NFERptEn+ FERptEn+
                RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                         FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
                ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
        Capabilities: [148 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [168 v1] Transaction Processing Hints
                No steering table available
        Capabilities: [1fc v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                           T_CommonMode=70us LTR1.2_Threshold=0ns
                L1SubCtl2: T_PwrOn=10us
        Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
        Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
        Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
        Kernel driver in use: pcieport

0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
        Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupts: pin B disabled, MSI(X) routed to IRQ 267
        IOMMU group: 35
        Region 0: Memory at 30300000 (32-bit, non-prefetchable) [size=4K]
        Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
        I/O behind bridge: 100000-100fff [size=4K] [16-bit]
        Memory behind bridge: 30400000-305fffff [size=2M] [32-bit]
        Prefetchable memory behind bridge: 30600000-307fffff [size=2M] [32-bit]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
                Address: 00000000fffff040  Data: 0000
                Masking: fffffffe  Pending: 00000000
        Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+ TEE-IO-
                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit Latency L1 <64us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
                LnkSta: Speed 5GT/s, Width x1
                        TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
                SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
                        Slot #0, PowerLimit 0W; Interlock+ NoCompl+
                SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
                        Control: AttnInd Off, PwrInd Off, Power- Interlock-
                SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
                        Changed: MRL- PresDet- LinkState-
                RootCap: CRSVisible+
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                         FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
                         AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
                         AtomicOpsCtl: ReqEn- EgressBlck-
                         IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
        Capabilities: [100 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
                RootCmd: CERptEn+ NFERptEn+ FERptEn+
                RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                         FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
                ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
        Capabilities: [148 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [158 v1] Transaction Processing Hints
                No steering table available
        Capabilities: [1ec v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
                L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
                           T_CommonMode=70us LTR1.2_Threshold=76800ns
                L1SubCtl2: T_PwrOn=0us
        Capabilities: [1fc v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
        Capabilities: [2fc v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
        Kernel driver in use: pcieport

0006:01:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 Wireless Network Adapter (rev 01)
        Subsystem: Qualcomm Technologies, Inc Device 0108
        Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0/wifi@0
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupts: MSI(X) routed to IRQ 288-319
        IOMMU group: 35
        Region 0: Memory at 30400000 (64-bit, non-prefetchable) [size=2M]
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] MSI: Enable+ Count=32/32 Maskable+ 64bit-
                Address: fffff040  Data: 0000
                Masking: fe023c00  Pending: 00000000
        Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend+
                LnkCap: Port #0, Speed 8GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <64us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
                LnkSta: Speed 5GT/s (downgraded), Width x1
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                         FRS- TPHComp+ ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                         AtomicOpsCtl: ReqEn-
                         IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
        Capabilities: [100 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [148 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [158 v1] Transaction Processing Hints
                No steering table available
        Capabilities: [1e4 v1] Latency Tolerance Reporting
                Max snoop latency: 0ns
                Max no snoop latency: 0ns
        Capabilities: [1ec v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
                L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
                           T_CommonMode=0us LTR1.2_Threshold=76800ns
                L1SubCtl2: T_PwrOn=0us
        Kernel driver in use: ath11k_pci
        Kernel modules: ath11k_pci


Sorry for taking so long to reply about this, Konrad suggested we provide the
info now, as I have been applying the patchset to a 7.0 kernel, but I know the
patchset is already in -next (maybe 7.1?)

-- steev

