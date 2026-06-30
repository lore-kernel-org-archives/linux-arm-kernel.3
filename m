Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiHhD9IKo187vZS4YzdCS2BpTjSk43R73dB7HjTainE=; b=XGZDrsOgbokOAM1Hqshcj1w07b
	J4lZEtRiRnGv/S/Y1qjMYrGLElFRuZnl+20lcRugV99epff339/OGa+UtR3TiNilMbwFO5a17IKM6
	8I0j7hiEGgBUp2s+aV85wf+BQ7h2Q8vwuno9YVKZqmO+yboO8WsRVNGsPjFGQG2B4EanJs6X78LEo
	chlu/16ETH+CPw3AeJnoU95SrfR1AQwMcOfeVQVBYLzs4bYC/jiuHYdDAHTntxkzkKTWV4rshMi3k
	lSqdD1kt0OTdaVuRXRWC1z7rtmzhO6qHbP1LjXzsa+6hefhYc3n2NhUEYa4pW8yOidSDbhqXW5v35
	II3XEl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS0H-0000000FwVZ-0lrg;
	Tue, 30 Jun 2026 06:31:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS0D-0000000FwVB-30bC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:31:28 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CKxv999626
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiHhD9IKo187vZS4YzdCS2BpTjSk43R73dB7HjTainE=; b=c6ArBMGBUXKghJ7z
	nzIsn5DVHzzeXAxjXdAJ2AIwkLWQUiwMttHUEbnwlwgHTzF5nFDDi3Lx+rma9Y0Q
	n3gjuWAmaeQOQJYu52jOKOY0PXai6QA8QDafwCqrqP0hlDmPUsQ9Nd/tkb0pEh45
	VArN6b+F/lKVK5qUXSDRqY7A45CIGSEq3fIiuESHXiL3cZn98hL+Fve2WAV4Aen8
	TOI8ALjDWR32LReYKusDC8HUcLLDMWsKnwOj+9TOT6IQR3lNC8VpUFqv0b2WFrbW
	ACIOBuynbtQKyc/4oBuaKHh/z/V9U1+vCS/8yBf9K1EahAgXuLD/BE6vx4ohjVoK
	xctdeA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j1ve1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:31:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9ae1da340so46791165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782801084; x=1783405884; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiHhD9IKo187vZS4YzdCS2BpTjSk43R73dB7HjTainE=;
        b=i8qvPTnWTzBXLTCwBjNLZUT4w7fSH6EX5ebgMt1cYoLOZst95V46PoZUXBJdtBcX32
         eW56Sv1C5muO6g2GLATsPjjxTnezOs9WuGhsisCj6AKeEPSHyrZkjRNy59L9dW/x0D11
         2aF837jqAFplhXvDCLoux6zDJ7tQ/ia9zEtAUCjaUajQegeoSECSqps6C/b6vtDqJHr3
         oQkIOLGzNKjn0Dkfvt2UuKJku1EdJEIhvPaErahbsqSG70FH1E3qZ0tQ0k13RCdONPdz
         AiykoTWaIop3ebCNMuOG23nKMgro9b7Mgu50ODDatPF5J4LBtG8nJCjYZNlAKFOiFTyw
         Kclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801084; x=1783405884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiHhD9IKo187vZS4YzdCS2BpTjSk43R73dB7HjTainE=;
        b=fOpE4stggAJtgKpbuiZAafzWp3BITaNLnEKJzTvViMZHscOwDdpv1orQZI23XoUTbQ
         6M/sWjL8Y27iuCvxY/WkGt/ZgVoC96zCx6imGPKvs+etrneVEfKIGWYpUlgzIGY/9kcp
         Sz1CXTc53fkT4MLFTQyLrlP4fb8kx4d664inAUDY6pI2zCK0K8XtpR5Fo2PoD+BDaYBL
         +Eu2mnI6hhiquKwjRLWIc9/CGEGt6f0MIISYpnXIMdZI6b1QsVfkErte1/sCdqfRB9au
         VS5kFVAeldUwpuxSAKaeIVX6/ldlOmO28oVE4wmm5Qb6jEM5baP6mKhu0yxxACd0PsoS
         uaPw==
X-Forwarded-Encrypted: i=1; AHgh+RqPBWTf9CL0O6IXkeWdjSdumqDNWNWRusjCzR6aApbnWRBFikgyrKaFcK2Myb4pwPFV9TIrzewyMUE4BvNmH3gb@lists.infradead.org
X-Gm-Message-State: AOJu0YxQrlS07Z4g3XvyiOw2f3hd75ij0RX5Xh4eTtmec41ms/5h6g2A
	9VvmGYJLu8Sxy0F6QaRVSuB1SakEmxrxxFuNBoujlzrKUdoCwVe0QFWD2Co8v3w3fCNjcVJmgLv
	v0PyAAVkrDUUqhrsigMX4NgaGczYa8MukujvU3/gN8sa2UyUZr81eNcvC0eXtbyoHZG1DK4fUf+
	XBl1xBixsUWg==
X-Gm-Gg: AfdE7cmmNfu7G9JSDRNn6qrV0vuHahurhkwYMNDoHWT1jNsc4XOjl1vnRJXFvAxOort
	5eW2+H6QCxtIGhvYzTj1XxOdy0fCG8M8IiAkPVwDolCmXs2ic0GRjKhNenc2C/4niYPlw2Ebhm+
	vfjbIRb0noiKUG5D0yPf4hGp1vXFEM1QXQsMDTSGkXRdq12Q1r6J0VM2thzLJ2Vh1V1Nz7XZDgw
	vkVH+WlPta624I8W7jAyHoFUQszzUVFZONZ7M0ia0u869jhsu3si0LFh0BhE/ECtcQB7KU1URZs
	oe5Tes/iKkYMJmN7SEp4qf0F769K78MGiFOcLh1rqTgF51lzb/SJyVE9RWPYrHCkbJI//GHltfQ
	G46eNNi2H+vW4kpHjTJOW6d/OTlz9uWGq6j4QfQpu8wg=
X-Received: by 2002:a17:903:1b6d:b0:2c9:e9c4:82c1 with SMTP id d9443c01a7336-2ca2e71cfa7mr18253475ad.26.1782801083713;
        Mon, 29 Jun 2026 23:31:23 -0700 (PDT)
X-Received: by 2002:a17:903:1b6d:b0:2c9:e9c4:82c1 with SMTP id d9443c01a7336-2ca2e71cfa7mr18253095ad.26.1782801083060;
        Mon, 29 Jun 2026 23:31:23 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828b10csm6361215ad.40.2026.06.29.23.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 23:31:22 -0700 (PDT)
Message-ID: <bc3cb302-5463-4e43-9b92-d141cafa2b8c@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:01:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] PCI: qcom: Add D3cold support
To: Steev Klimaszewski <threeway@gmail.com>
Cc: bhelgaas@google.com, bjorn.andersson@oss.qualcomm.com,
        jingoohan1@gmail.com, jonathanh@nvidia.com, kwilczynski@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org,
        will@kernel.org
References: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
 <20260629211614.6942-1-threeway@gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260629211614.6942-1-threeway@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BYsmVvJDHKLOdm5tpvbRNFakVdtbPM0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX/6AzDI4k5Vw8
 9+FMPi7VvnScWTynyzABg6JTrvXLj9cdR5GNS7HqSDSZ0PdvfAWtrrokTszqEG1PenLCXlX2C+Q
 XYBdgdWjDNA0bDCWHHfOKW12p6Q9ETQHYZkDlfTXi+xI3paF1CRou1x+EN1gXjuvcYJTdaax1l/
 p49hIyIj5ymtzalcMkpe0F2gyBWEYmYhyxhk3Ak6bQMV+YEbu312MonNXqYdpT3SioQjkPFP2gA
 hTN/hedJhD3dmbpeaPKp2TGcc6+zqXgvNknc0zCOZk45pGQxbR30WChsNvZvXhfsCYxAVjRz2UY
 WPG+nnCDZOV8NHmB0p8ep0KST++ho9UQzHf9FyQYxh6IVaWi37C11RtppgHHfhhPi3/o5yxG+kX
 VJ3V/7Dk5ekpHIoUZVKv11kM8eBcE0oaUotMGe98CGFBQlaj1P0We9ClRO5EqhSFOY92jWo/ppJ
 IPjv7ZHnvofY45jYzgg==
X-Proofpoint-GUID: BYsmVvJDHKLOdm5tpvbRNFakVdtbPM0k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX7nelSQg/72h5
 5ss+WEMeDJvBuSia+lhk01wcEPOS634Q4aeqYOOzOxP2qk4+ei1PFfhnF8v5wpIQqgoyaXqDgit
 sekU2E+I+Zn223iP+pY7fUHKS8LWkDQ=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a4362bc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ZQGdKSwLNShbWPe5TB0A:9 a=uz0CFkoBDNAz_8sc:21 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233125_793377_DA7AFF0C 
X-CRM114-Status: GOOD (  20.09  )
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



On 6/30/2026 2:46 AM, Steev Klimaszewski wrote:
> Hi Krishna, and Mani,
>
> Turns out, this patchset causes issues but only on some machines.  On a WDK2023
> (Volterra), this breaks suspend, and on *my* X13s, it also seems to when using
> the command `sudo rtcwake -m freeze -s 300` when resuming it crashes the
> machine.  Interestingly, it does not crash on another user's X13s.
>
> Included is the info from Volterra's lspci -vvv and further down will be my
> lspci -vvv - my X13s has a WD_BLACK 2TB SN770M in it which is not what it came
> with from Lenovo.
>
> WDK2023:
>
> [alex@volterra d3-bug]$ cat volterra-info.txt
> Linux volterra 7.0.14-gefea59a29f1a #17 SMP PREEMPT Mon Jun 29 14:47:59 CDT 2026 aarch64 GNU/Linux
> Windows Dev Kit 2023BOOT_IMAGE=/@/boot/vmlinuz-linux root=UUID=a8f7fb76-9ae0-49af-a830-09025b783224 rw rootflags=subvol=@ loglevel=3 efi=noruntime clk_ignore_unused pd_ignore_unused regulator_ignore_unused arm64.nopauth
> [alex@volterra d3-bug]$ cat volterra-lspci-vvv.txt
> 0002:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
> Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c20000/pcie@0
> Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Interrupts: pin B disabled, MSI(X) routed to IRQ 182
> Region 0: Memory at 3c700000 (32-bit, non-prefetchable) [size=4K]
> Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
> I/O behind bridge: 100000-100fff [size=4K] [16-bit]
> Memory behind bridge: 3c300000-3c4fffff [size=2M] [32-bit]
> Prefetchable memory behind bridge: 3c500000-3c6fffff [size=2M] [32-bit]
> Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> Capabilities: [40] Power Management version 3
> Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
> Address: 0000000017a50040 Data: 0000
> Masking: fffffffe Pending: 00000000
> Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
> DevCap: MaxPayload 256 bytes, PhantFunc 0
> ExtTag- RBE+ TEE-IO-
> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> MaxPayload 128 bytes, MaxReadReq 512 bytes
> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
> ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
> LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
> ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> LnkSta: Speed 8GT/s, Width x4
> TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
> Slot #0, PowerLimit 0W; Interlock+ NoCompl+
> SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> Control: AttnInd Off, PwrInd Off, Power- Interlock-
> SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> Changed: MRL- PresDet- LinkState-
> RootCap: CRSVisible-
> RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
> RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
> 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
> AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> AtomicOpsCtl: ReqEn- EgressBlck-
> IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
> EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> Capabilities: [100 v2] Advanced Error Reporting
> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
> HeaderLog: 00000000 00000000 00000000 00000000
> RootCmd: CERptEn+ NFERptEn+ FERptEn+
> RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
> FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
> ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
> Capabilities: [148 v1] Secondary PCI Express
> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> LaneErrStat: 0
> Capabilities: [168 v1] Transaction Processing Hints
> No steering table available
> Capabilities: [1fc v1] L1 PM Substates
> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
> L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> T_CommonMode=70us LTR1.2_Threshold=136192ns
> L1SubCtl2: T_PwrOn=60us
> Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
> Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
> Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
> Kernel driver in use: pcieport
>
> 0002:01:00.0 Non-Volatile memory controller: Silicon Motion, Inc. SM2269XT (DRAM-less) NVMe SSD Controller (rev 03) (prog-if 02 [NVM Express])
> Subsystem: Silicon Motion, Inc. SM2269XT (DRAM-less) NVMe SSD Controller
> Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Interrupts: pin B disabled, MSI(X) routed to IRQ 183-191
> Region 0: Memory at 3c300000 (64-bit, non-prefetchable) [size=16K]
> Capabilities: [40] Power Management version 3
> Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> Capabilities: [50] MSI: Enable- Count=1/16 Maskable+ 64bit+
> Address: 0000000000000000 Data: 0000
> Masking: 00000000 Pending: 00000000
> Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
> DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
> ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0W TEE-IO-
> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-
> MaxPayload 128 bytes, MaxReadReq 512 bytes
> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
> ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
> ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- FltModeDis-
> LnkSta: Speed 8GT/s (downgraded), Width x4
> TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> FRS+ TPHComp- ExtTPHComp-
> AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> AtomicOpsCtl: ReqEn-
> IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS+
> LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
> EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> Retimer- 2Retimers- CrosslinkRes: Upstream Port, FltMode-
> Capabilities: [b0] MSI-X: Enable+ Count=17 Masked-
> Vector table: BAR=0 offset=00002000
> PBA: BAR=0 offset=00003000
> Capabilities: [100 v2] Advanced Error Reporting
> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> HeaderLog: 00000000 00000000 00000000 00000000
> Capabilities: [148 v1] Power Budgeting <?>
> Capabilities: [158 v1] Alternative Routing-ID Interpretation (ARI)
> ARICap: MFVC- ACS-, Next Function: 0
> ARICtl: MFVC- ACS-, Function Group: 0
> Capabilities: [168 v1] Secondary PCI Express
> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> LaneErrStat: 0
> Capabilities: [188 v1] Physical Layer 16.0 GT/s
> Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> Capabilities: [1ac v1] Lane Margining at the Receiver
> PortCap: Uses Driver-
> PortSta: MargReady- MargSoftReady-
> Capabilities: [204 v1] Latency Tolerance Reporting
> Max snoop latency: 0ns
> Max no snoop latency: 0ns
> Capabilities: [20c v1] L1 PM Substates
> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> PortCommonModeRestoreTime=10us PortTPowerOnTime=60us
> L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> T_CommonMode=0us LTR1.2_Threshold=136192ns
> L1SubCtl2: T_PwrOn=60us
> Capabilities: [390 v1] Data Link Feature <?>
> Kernel driver in use: nvme
> Kernel modules: nvme
>
> 0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
> Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0
> Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Interrupts: pin B disabled, MSI(X) routed to IRQ 237
> Region 0: Memory at 30300000 (32-bit, non-prefetchable) [size=4K]
> Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
> I/O behind bridge: 1000-1fff [size=4K] [16-bit]
> Memory behind bridge: 30400000-305fffff [size=2M] [32-bit]
> Prefetchable memory behind bridge: 30600000-307fffff [size=2M] [32-bit]
> Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> Capabilities: [40] Power Management version 3
> Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
> Address: 0000000017a50040 Data: 0000
> Masking: fffffffe Pending: 00000000
> Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
> DevCap: MaxPayload 128 bytes, PhantFunc 0
> ExtTag- RBE+ TEE-IO-
> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> MaxPayload 128 bytes, MaxReadReq 512 bytes
> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit Latency L1 <64us
> ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
> LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
> ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> LnkSta: Speed 5GT/s, Width x1
> TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
> Slot #0, PowerLimit 0W; Interlock+ NoCompl+
> SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> Control: AttnInd Off, PwrInd Off, Power- Interlock-
> SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> Changed: MRL- PresDet- LinkState-
> RootCap: CRSVisible+
> RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
> RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
> 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
> AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> AtomicOpsCtl: ReqEn- EgressBlck-
> IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> Capabilities: [100 v2] Advanced Error Reporting
> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
> HeaderLog: 00000000 00000000 00000000 00000000
> RootCmd: CERptEn+ NFERptEn+ FERptEn+
> RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
> FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
> ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
> Capabilities: [148 v1] Secondary PCI Express
> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> LaneErrStat: 0
> Capabilities: [158 v1] Transaction Processing Hints
> No steering table available
> Capabilities: [1ec v1] L1 PM Substates
> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
> L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> T_CommonMode=70us LTR1.2_Threshold=76800ns
> L1SubCtl2: T_PwrOn=0us
> Capabilities: [1fc v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
> Capabilities: [2fc v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
> Kernel driver in use: pcieport
>
> 0006:01:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 Wireless Network Adapter (rev 01)
> Subsystem: Qualcomm Technologies, Inc Device 0108
> Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0/wifi@0
> Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Interrupts: MSI(X) routed to IRQ 245-276
> Region 0: Memory at 30400000 (64-bit, non-prefetchable) [size=2M]
> Capabilities: [40] Power Management version 3
> Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> Capabilities: [50] MSI: Enable+ Count=32/32 Maskable+ 64bit-
> Address: 17a50040 Data: 0000
> Masking: fe023c00 Pending: 00000000
> Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
> DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
> ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> MaxPayload 128 bytes, MaxReadReq 512 bytes
> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> LnkCap: Port #0, Speed 8GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <64us
> ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
> ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> LnkSta: Speed 5GT/s (downgraded), Width x1
> TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> FRS- TPHComp+ ExtTPHComp-
> AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> AtomicOpsCtl: ReqEn-
> IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> Capabilities: [100 v2] Advanced Error Reporting
> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> HeaderLog: 00000000 00000000 00000000 00000000
> Capabilities: [148 v1] Secondary PCI Express
> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> LaneErrStat: 0
> Capabilities: [158 v1] Transaction Processing Hints
> No steering table available
> Capabilities: [1e4 v1] Latency Tolerance Reporting
> Max snoop latency: 0ns
> Max no snoop latency: 0ns
> Capabilities: [1ec v1] L1 PM Substates
> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
> L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> T_CommonMode=0us LTR1.2_Threshold=76800ns
> L1SubCtl2: T_PwrOn=0us
> Kernel driver in use: ath11k_pci
> Kernel modules: ath11k_pci
>
>
> X13s:
> cmdline.txt: BOOT_IMAGE=/boot/vmlinuz-7.0.14 root=UUID=dc44a82f-6d97-490e-a4be-4c3bceacc658 ro arm64.nopauth ipv6.disable=1 clk_ignore_unused mitigations=off cfg80211.ieee80211_regdom=US efi=noruntime printk.always_kmsg_dump=Y efi_pstore.pstore_disable=N quiet splash
>
> lspci -vvv:
> steev@finn:~$ sudo lspci -vvv
> [sudo] password for steev:
> 0002:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
>         Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c20000/pcie@0
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: pin B disabled, MSI(X) routed to IRQ 215
>         IOMMU group: 14
>         Region 0: Memory at 3c700000 (32-bit, non-prefetchable) [size=4K]
>         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
>         I/O behind bridge: 200000-200fff [size=4K] [16-bit]
>         Memory behind bridge: 3c300000-3c4fffff [size=2M] [32-bit]
>         Prefetchable memory behind bridge: 3c500000-3c6fffff [size=2M] [32-bit]
>         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
>                 Address: 00000000fffff040  Data: 0000
>                 Masking: fffffffe  Pending: 00000000
>         Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
>                 DevCap: MaxPayload 256 bytes, PhantFunc 0
>                         ExtTag- RBE+ TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
>                 LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
>                         ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
>                 LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
>                 LnkSta: Speed 8GT/s, Width x4
>                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>                 SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
>                         Slot #0, PowerLimit 0W; Interlock+ NoCompl+
>                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
>                         Control: AttnInd Off, PwrInd Off, Power- Interlock-
>                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
>                         Changed: MRL- PresDet- LinkState-
>                 RootCap: CRSVisible-
>                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
>                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
>                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
>                          AtomicOpsCtl: ReqEn- EgressBlck-
>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
>                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
>                          EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
>                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
>                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
>                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
>         Capabilities: [148 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [168 v1] Transaction Processing Hints
>                 No steering table available
>         Capabilities: [1fc v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
>                           PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1-
>                            T_CommonMode=70us LTR1.2_Threshold=86016ns
>                 L1SubCtl2: T_PwrOn=10us
>         Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
>         Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
>         Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
>         Kernel driver in use: pcieport
>
> 0002:01:00.0 Non-Volatile memory controller: Sandisk Corp WD Black SN770M NVMe SSD (DRAM-less) (rev 01) (prog-if 02 [NVM Express])
>         Subsystem: Sandisk Corp WD Black SN770M NVMe SSD (DRAM-less)
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: pin B disabled, MSI(X) routed to IRQ 253-261
>         IOMMU group: 14
>         Region 0: Memory at 3c300000 (64-bit, non-prefetchable) [size=16K]
>         Capabilities: [80] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [90] MSI: Enable- Count=1/32 Maskable- 64bit+
>                 Address: 0000000000000000  Data: 0000
>         Capabilities: [b0] MSI-X: Enable+ Count=65 Masked-
>                 Vector table: BAR=0 offset=00003000
>                 PBA: BAR=0 offset=00002000
>         Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
>                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s <1us, L1 unlimited
>                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0W TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
>                 LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <8us
>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>                 LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
>                         ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
>                 LnkSta: Speed 8GT/s (downgraded), Width x4
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                 DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
>                          10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- TPHComp- ExtTPHComp-
>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>                          AtomicOpsCtl: ReqEn-
>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
>                 LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
>                          EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>         Capabilities: [1b8 v1] Latency Tolerance Reporting
>                 Max snoop latency: 0ns
>                 Max no snoop latency: 0ns
>         Capabilities: [300 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [900 v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1- L1_PM_Substates+
>                           PortCommonModeRestoreTime=32us PortTPowerOnTime=10us
>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1-
>                            T_CommonMode=0us LTR1.2_Threshold=86016ns
>                 L1SubCtl2: T_PwrOn=10us
>         Capabilities: [910 v1] Data Link Feature <?>
>         Capabilities: [920 v1] Lane Margining at the Receiver
>                 PortCap: Uses Driver+
>                 PortSta: MargReady- MargSoftReady+
>         Capabilities: [9c0 v1] Physical Layer 16.0 GT/s
>                 Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
>         Kernel driver in use: nvme
>         Kernel modules: nvme
>
> 0004:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
>         Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c10000/pcie@0
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: MSI(X) routed to IRQ 217
>         IOMMU group: 15
>         Region 0: Memory at 34700000 (32-bit, non-prefetchable) [size=4K]
>         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
>         I/O behind bridge: 1000-1fff [size=4K] [16-bit]
>         Memory behind bridge: 34300000-344fffff [size=2M] [32-bit]
>         Prefetchable memory behind bridge: 34500000-346fffff [size=2M] [32-bit]
>         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
>                 Address: 00000000fffff040  Data: 0000
>                 Masking: fffffffe  Pending: 00000000
>         Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
>                 DevCap: MaxPayload 256 bytes, PhantFunc 0
>                         ExtTag- RBE+ TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
>                 LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <16us
>                         ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>                 LnkCtl: ASPM Disabled; RCB 128 bytes, LnkDisable- CommClk-
>                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
>                 LnkSta: Speed 2.5GT/s, Width x1
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                 SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
>                         Slot #0, PowerLimit 0W; Interlock+ NoCompl+
>                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
>                         Control: AttnInd Off, PwrInd Off, Power- Interlock-
>                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
>                         Changed: MRL- PresDet- LinkState-
>                 RootCap: CRSVisible+
>                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
>                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
>                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
>                          AtomicOpsCtl: ReqEn- EgressBlck-
>                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
>                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
>                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
>                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
>                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
>         Capabilities: [148 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [168 v1] Transaction Processing Hints
>                 No steering table available
>         Capabilities: [1fc v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
>                           PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                 L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>                            T_CommonMode=70us LTR1.2_Threshold=0ns
>                 L1SubCtl2: T_PwrOn=10us
>         Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
>         Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
>         Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
>         Kernel driver in use: pcieport
>
> 0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
>         Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: pin B disabled, MSI(X) routed to IRQ 267
>         IOMMU group: 35
>         Region 0: Memory at 30300000 (32-bit, non-prefetchable) [size=4K]
>         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
>         I/O behind bridge: 100000-100fff [size=4K] [16-bit]
>         Memory behind bridge: 30400000-305fffff [size=2M] [32-bit]
>         Prefetchable memory behind bridge: 30600000-307fffff [size=2M] [32-bit]
>         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
>                 Address: 00000000fffff040  Data: 0000
>                 Masking: fffffffe  Pending: 00000000
>         Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0
>                         ExtTag- RBE+ TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
>                 LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit Latency L1 <64us
>                         ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>                 LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
>                 LnkSta: Speed 5GT/s, Width x1
>                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>                 SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
>                         Slot #0, PowerLimit 0W; Interlock+ NoCompl+
>                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
>                         Control: AttnInd Off, PwrInd Off, Power- Interlock-
>                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
>                         Changed: MRL- PresDet- LinkState-
>                 RootCap: CRSVisible+
>                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
>                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
>                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
>                          AtomicOpsCtl: ReqEn- EgressBlck-
>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
>                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
>                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
>                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
>                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
>         Capabilities: [148 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [158 v1] Transaction Processing Hints
>                 No steering table available
>         Capabilities: [1ec v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
>                           PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>                            T_CommonMode=70us LTR1.2_Threshold=76800ns
>                 L1SubCtl2: T_PwrOn=0us
>         Capabilities: [1fc v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
>         Capabilities: [2fc v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
>         Kernel driver in use: pcieport
>
> 0006:01:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 Wireless Network Adapter (rev 01)
>         Subsystem: Qualcomm Technologies, Inc Device 0108
>         Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0/wifi@0
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: MSI(X) routed to IRQ 288-319
>         IOMMU group: 35
>         Region 0: Memory at 30400000 (64-bit, non-prefetchable) [size=2M]
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable+ Count=32/32 Maskable+ 64bit-
>                 Address: fffff040  Data: 0000
>                 Masking: fe023c00  Pending: 00000000
>         Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
>                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend+
>                 LnkCap: Port #0, Speed 8GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <64us
>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>                 LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
>                 LnkSta: Speed 5GT/s (downgraded), Width x1
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- TPHComp+ ExtTPHComp-
>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>                          AtomicOpsCtl: ReqEn-
>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
>                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>         Capabilities: [148 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [158 v1] Transaction Processing Hints
>                 No steering table available
>         Capabilities: [1e4 v1] Latency Tolerance Reporting
>                 Max snoop latency: 0ns
>                 Max no snoop latency: 0ns
>         Capabilities: [1ec v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
>                           PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>                            T_CommonMode=0us LTR1.2_Threshold=76800ns
>                 L1SubCtl2: T_PwrOn=0us
>         Kernel driver in use: ath11k_pci
>         Kernel modules: ath11k_pci
>
>
> Sorry for taking so long to reply about this, Konrad suggested we provide the
> info now, as I have been applying the patchset to a 7.0 kernel, but I know the
> patchset is already in -next (maybe 7.1?)
HI steev,

Can you also share dmesg logs also with console suspend disabled mainly
suspend resume logs, in both the cases.

- Krishna Chaitanya.
> -- steev


