Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5EFC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKA5zhqFYGJHApG3LHZ1wsad9XAvKI/FIK3QKmiMCpI=; b=tngiHtuUVvIPEHyC8yvlfBQq2o
	UOCYcNiMZu1tjbCd6N2qREWsvOks4mCsqtQxPbkgWWCYogRoIOQM6X+yqkZhWUfKiKENYTL8isYnj
	5ZUpRzalJt3fW1k0GhmS+dM6OLrUwDWtNqEp/T45XSOdd1d5hIbypjKHQ5h/+u1/8TCcgYd5MJaCs
	8RneFEx/mP8ZE0Bam8HDXskxcLLjQIMyW4bn4VFmRwTf2Wikp8GjfpA0icdTB4LDqLGFYPW9LZcDu
	pLfzSb7BpHCJqHVEg4ey+TW69396F5dVT739LJhE/cYxIve5VUM9FbCX0LAbY18EeGhQh3Ybwa2FE
	w6XfWgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOf8-000000036Va-1zbL;
	Fri, 08 Aug 2025 15:05:42 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOYd-000000035Mh-3BQY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 14:59:01 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578DVG8N014777;
	Fri, 8 Aug 2025 16:58:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NKA5zhqFYGJHApG3LHZ1wsad9XAvKI/FIK3QKmiMCpI=; b=WbnCVx14jjeuJHN6
	GJIn+Fy7uBInALd0yOmv8xY1N92s1MboPmYDOVGOfKlyJ1dR9TdIdZfZZ4z7u230
	hOZgX2ZobRFpBIOy2vaW04NBtp7pze1/toMUiVE1RtWulxbwt1s/1hMJbrSvEsKM
	mv8O0GZCz25MOCQgGka/uT3VEShhKKugQsfHOZnGaYcy6pyoWjDb679PqL8ypGYf
	RLUCtOMzNsz/XeURNPf+0IqflqC3ZDk4Ifwp9S9Vi0zr9ltkc3dOgbgt3l/YYUuW
	ArazUWAES+HMyrjVVRVsnQhgUvAFXTm2W7oQM/aPTere3xJqK2sqyKGuQm7MwPo8
	C4I3tQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48cq00pdk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 16:58:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A8D2340046;
	Fri,  8 Aug 2025 16:57:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7F79727648;
	Fri,  8 Aug 2025 16:55:57 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 16:55:54 +0200
Message-ID: <e7cd764d-bc6d-4e39-aa03-0eee8e30d3e5@foss.st.com>
Date: Fri, 8 Aug 2025 16:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v12 2/9] PCI: stm32: Add PCIe host support for STM32MP25
To: Bjorn Helgaas <helgaas@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>
CC: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <p.zabel@pengutronix.de>,
        <johan+linaro@kernel.org>, <cassel@kernel.org>,
        <shradha.t@samsung.com>, <thippeswamy.havalige@amd.com>,
        <quic_schintav@quicinc.com>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250807180951.GA56737@bhelgaas>
Content-Language: en-US
In-Reply-To: <20250807180951.GA56737@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_075900_087877_B5D72612 
X-CRM114-Status: GOOD (  12.75  )
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



On 8/7/25 20:09, Bjorn Helgaas wrote:
> [+to Linus for pinctrl usage question below]
> 
> On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
>> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
>> controller based on the DesignWare PCIe core.
>>

>> +
>> +	return pinctrl_pm_select_sleep_state(dev);
> 
> Isn't there some setup required before we can use
> pinctrl_select_state(), pinctrl_pm_select_sleep_state(),
> pinctrl_pm_select_default_state(), etc?
> 
> I expected something like devm_pinctrl_get() in the .probe() path, but
> I don't see anything.  I don't know how pinctrl works, but I don't see
> how dev->pins gets set up.

Linus knows better, but the dev->pins states are attached to the dev 
struct before probe by the pinctrl driver

/**
  * pinctrl_bind_pins() - called by the device core before probe
  * @dev: the device that is just about to probe
  */
int pinctrl_bind_pins(struct device *dev)

Christian

