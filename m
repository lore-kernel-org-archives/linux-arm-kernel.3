Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6299E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDmS9Ambq1maXFpKniL040Nqs3Zdh9aLWBYPyXwJm2U=; b=sQbFIKxKyStdKfI0b7gkgW9OrZ
	q13jRk72qzYEa630bspwmH4VNMlKJgAl93yjKqWoYSStSAcoV977uHNxbe4zMVxIJHawzEl8Nq4Mr
	t5lCOaV/kHQY6z7jpV6VGaKUW2ykcNEtlPGCMP1Uao5pyJpriGNPihJKSGLrCL28Ft1/aTK4RIGwa
	HEYvP6lD4/RXhg6lQDOy53vG2YxFU1SPVKrTH08ejQml19xp2UnwwFLqcF/XvfFGldrLELz9FEStH
	PXAddjudoXWOxT2qzjKWTVcDHwMgYWuj6XcCH0jS0Jkrac/9KqEtX8/nOS3OPyeHq+thT73pPcmsy
	k4YMzUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaWT-0000000ECQq-2rwm;
	Tue, 17 Dec 2024 16:34:13 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZwD-0000000E3CQ-3bkH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:56:47 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHFCWv3017128;
	Tue, 17 Dec 2024 16:56:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kDmS9Ambq1maXFpKniL040Nqs3Zdh9aLWBYPyXwJm2U=; b=7NQexlbe5zKhhrpU
	N2ofTiGRp+mreCoG4VCHgGu6UaeETr5Bv6hR8B5EXga7t6lsKfxM5hVr/KgHc3OD
	wJGwr2ErWIVvW+zfyiE1NQpCxurX6yV5mxinLY+OVYMCBEyqZ3m91/JOaP6Grg3e
	14GemyeQ+cR0n9qrnV2lfn29TuA1wFw3jMULYMZZBYJBi+zhnYn6Bn8Vyvn+vKL0
	8qavgJkB7Jh7MfgRPut7h1DGnFoMsUXGbBX0Qnu6eJOxZX2nIOoxJ6JhCf7T/iw6
	FmYSwrwyqmSxlIOAGb8TjkFXUMeN+z8TSXoR7FBjNRSGeuWoKJCbPB/nEoOnH3lg
	itsBDg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kbr683r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 16:56:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DB36640050;
	Tue, 17 Dec 2024 16:54:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6BF9276678;
	Tue, 17 Dec 2024 16:53:49 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 16:53:49 +0100
Message-ID: <d976d74c-80c0-4446-bb9b-960a990c552b@foss.st.com>
Date: Tue, 17 Dec 2024 16:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
To: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <bhelgaas@google.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <cassel@kernel.org>,
        <quic_schintav@quicinc.com>, <fabrice.gasnier@foss.st.com>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241205172022.GA3053765@bhelgaas>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241205172022.GA3053765@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_075646_477686_49205750 
X-CRM114-Status: GOOD (  11.74  )
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


> Makes sense.  What about phys, resets, etc?  I'm pretty sure a PHY
> would be a per-Root Port thing, and some resets and wakeup signals
> also.
> 
> For new drivers, I think we should start adding Root Port stanzas to
> specifically associate those things with the Root Port, e.g.,
> something like this?
> 
>    pcie@48400000 {
>      compatible = "st,stm32mp25-pcie-rc";
> 
>      pcie@0,0 {
>        reg = <0x0000 0 0 0 0>;
>        phys = <&combophy PHY_TYPE_PCIE>;
>        phy-names = "pcie-phy";
>      };
>    };
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=v6.12#n111
> is one binding that does this, others include apple,pcie.yaml,
> brcm,stb-pcie.yaml, hisilicon,kirin-pcie.yaml.
> 

On a second thought, moving the PHY to the root-port part would 
introduce a discrepancy with the pcie_ep binding, whereas the PHY is 
required on the pcie_ep node.

Even for the pcie_rc, the PHY is needed to enable the core_clk to access
the PCIe core registers,

So that would make 2 different required PHY locations for RC and EP:

     pcie_rc: pcie@48400000 {
       compatible = "st,stm32mp25-pcie-rc";

       pcie@0,0 {
         reg = <0x0000 0 0 0 0>;
         phys = <&combophy PHY_TYPE_PCIE>;
         phy-names = "pcie-phy";
       };
     };

     pcie_ep pcie@48400000 {
       compatible = "st,stm32mp25-pcie-ep";
       phys = <&combophy PHY_TYPE_PCIE>;
       phy-names = "pcie-phy";
     };

Simplest seems to keep the PHY required for the pcie core regardless of 
the mode and keep the empty root port to split the design

     pcie_rc: pcie@48400000 {
       compatible = "st,stm32mp25-pcie-rc";
       phys = <&combophy PHY_TYPE_PCIE>;
       phy-names = "pcie-phy";

         pcie@0,0 {
         reg = <0x0000 0 0 0 0>;
       };
     };

     pcie_ep: pcie@48400000 {
       compatible = "st,stm32mp25-pcie-ep";
       phys = <&combophy PHY_TYPE_PCIE>;
       phy-names = "pcie-phy";
     };

But I have no experience with multiple root-port systems, I'm open for 
the best :)

Thanks

Christian

