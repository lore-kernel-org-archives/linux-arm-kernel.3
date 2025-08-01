Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 17:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CeWhdWQUjjY6qtmHWK9NWvqGGMpBxisoCeR/n+R6EY8=; b=MCrPHyfbSJKTpxO6MZbnFU6+C6
	taV7vUR1Nfb/qKxHul6Vwm150c4B61vkf4nHrwrTVBSNCJn2VgzYp7+venE3bvvpTgyOqSpZ2B+jB
	A0lyN/7iHSRZG5Yqy45z/mZF2ePeYakLk/dJQzbnx8AA1RkV44E5TNZxGGebFHAnhJvRb73VK6tRD
	FolJz/72wmDe8Igs8tLKRgVSLodnf1cVwcmu5aJx+hntgHARSS1Z1c49rVJhY/BZFEqzYL1Y5ecuK
	Qai/uuso/VQK7ByDWhP/PQZRVaFEeNfJjJSNd5b8piz7wVKXmRR8p62hFxUBiZs1y4RDvwuGm6FWA
	TFL9P0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtwT-00000006aXh-0vyt;
	Fri, 01 Aug 2025 17:53:17 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtmx-00000006Zff-11Hk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 17:43:28 +0000
Message-ID: <53f6d267-62af-4dad-8fa7-a2a497b22636@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754070202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CeWhdWQUjjY6qtmHWK9NWvqGGMpBxisoCeR/n+R6EY8=;
	b=J4cBhHlkUCErWxEVkMQqOgbDi09LfhUv5VpBBaW8Umpyw/gu8cOX25rq1jlpyV6ZqIbt9b
	BVL8ge/2NGwtCduHs+FR8ZiB7zL7SVilXSgyGsSHrImPZMVbYEmSGwabJ1DE1+f21EkSiw
	AXjHTwgciEhzf0QATa58jRP/xeGU4Bw=
Date: Fri, 1 Aug 2025 13:43:19 -0400
MIME-Version: 1.0
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
Subject: [BUG] pci: nwl: Unhandled AER correctable error
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-pci@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_104327_439899_B26F9A60 
X-CRM114-Status: GOOD (  11.67  )
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

AER correctable errors are pretty rare. I only saw one once before and
came up with commit 78457cae24cb ("PCI: xilinx-nwl: Rate-limit misc
interrupt messages") in response. I saw another today and,
unfortunately, clearing the correctable AER bit in MSGF_MISC_STATUS is
not sufficient to handle the IRQ. It gets immediately re-raised,
preventing the system from making any other progress. I suspect that it
needs to be cleared in PCI_ERR_ROOT_STATUS. But since the AER IRQ never
gets delivered to aer_irq, those registers never get tickled.

The underlying problem is that pcieport thinks that the IRQ is going to
be one of the MSIs or a legacy interrupt, but it's actually a native
interrupt:

           CPU0       CPU1       CPU2       CPU3       
 42:          0          0          0          0     GICv2 150 Level     nwl_pcie:misc
 45:          0          0          0          0  nwl_pcie:legacy   0 Level     PCIe PME, aerdrv
 46:         25          0          0          0  nwl_pcie:msi 524288 Edge      nvme0q0
 47:          0          0          0          0  nwl_pcie:msi 524289 Edge      nvme0q1
 48:          0          0          0          0  nwl_pcie:msi 524290 Edge      nvme0q2
 49:         46          0          0          0  nwl_pcie:msi 524291 Edge      nvme0q3
 50:          0          0          0          0  nwl_pcie:msi 524292 Edge      nvme0q4

In the above example, AER errors will trigger interrupt 42, not 45.
Actually, there are a bunch of different interrupts in MSGF_MISC_STATUS,
so maybe nwl_pcie_misc_handler should be an interrupt controller
instead? But even then pcie_port_enable_irq_vec() won't figure out the
correct IRQ. Any ideas on how to fix this?

Additionally, any tips on actually triggering AER/PME stuff in a
consistent way? Are there any off-the-shelf cards for sending weird PCIe
stuff over a link for testing? Right now all I have 

--Sean

# lspci -vv
00:00.0 PCI bridge: Xilinx Corporation Device d011 (prog-if 00 [Normal decode])
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 45
	Bus: primary=00, secondary=01, subordinate=0c, sec-latency=0
	I/O behind bridge: 00000000-00000fff [size=4K]
	Memory behind bridge: e0000000-e00fffff [size=1M]
	Prefetchable memory behind bridge: [disabled]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [60] Express (v2) Root Port (Slot-), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend+
		LnkCap:	Port #0, Speed 5GT/s, Width x2, ASPM not supported
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk-
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 5GT/s (ok), Width x2 (ok)
			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt+
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd-
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Device Serial Number 00-00-00-00-00-00-00-00
	Capabilities: [10c v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [128 v1] Vendor Specific Information: ID=1234 Rev=1 Len=018 <?>
	Capabilities: [140 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
		RootCmd: CERptEn+ NFERptEn+ FERptEn+
		RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
			 FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0
		ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
	Kernel driver in use: pcieport

