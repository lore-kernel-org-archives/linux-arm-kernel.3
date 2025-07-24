Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30A9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9y6lMVKoGSGbAQ4r7YRTQAIypLEALnPa938lwZnu4s=; b=Im/tSr8vuOkbYB20xIpFRKpXJa
	g04+NY7W3Dn2diRKiyVWpflT7Nttb8Ufypg1l+o+buXlglpGTYsFOWZUK/3TKzVSKitEKrYsrbTYM
	MJ+CiSOH/sAHrVRD1EIHqka/5oehfaxVZTAeozcQE16JdJF5v4HZQ3yhXB/HTLtBMDLjV+ibSsQM0
	ac31tEx6ekjt3prke1m4CnCu/S6ap4/5dPStD0j6zWJUvTic4l0afIGkYGG35gNXWMGs6oPv6m/Zu
	/dINu+uQpQe6thu+lDWNaYB07qZkhCnBt5wAVANi+UN3h935BTxcMTf+/7BDkVRFpPxX01n0yqAFw
	AGmkcEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPZ-00000007dcv-29Al;
	Thu, 24 Jul 2025 13:55:06 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewA9-00000007X4L-1JEO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:39:11 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ODAgol018828;
	Thu, 24 Jul 2025 15:38:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	w9y6lMVKoGSGbAQ4r7YRTQAIypLEALnPa938lwZnu4s=; b=8DuW1mVWb5Zmz+q0
	7RKe020XQCaScSNVrCjpPnmByr2ryfDEsJqHwQPObJeuAtdyS46qENjf789qB2Gn
	Y9jkz0gnExfyBxnDdCXcKF/U1bvmXiPSL0WnENoFzkBrzJOHYylmsIvuGCerLywl
	ZaA9oZ7lKwFoF195X342XP1lYemLrGWn/qjVkHL6zChh+CpYuigHX7/+E62GiSba
	SVAHo4H6Hei4POCBjTIbbBtR678I3fMIdBg41DlglPcRw9/urX+wij9vSihPDcRp
	TxPHyIN2JW2TvS5/OuWkzhrAFqWa9uAwPyPD4tuvxnn6RfeIub6Uo+oLKBm8zZIJ
	H13+MA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g91e0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 15:38:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4750C4005D;
	Thu, 24 Jul 2025 15:37:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 594A6763978;
	Thu, 24 Jul 2025 15:36:56 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 15:36:55 +0200
Message-ID: <99737d4f-488d-4208-91aa-83ce52957147@foss.st.com>
Date: Thu, 24 Jul 2025 15:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 0/2] Add pinctrl_pm_select_init_state helper
 function
To: Bjorn Helgaas <helgaas@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>
CC: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-pci@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
References: <20250723210753.GA2911683@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250723210753.GA2911683@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_063909_832271_20A4E24C 
X-CRM114-Status: GOOD (  23.20  )
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



On 7/23/25 23:07, Bjorn Helgaas wrote:
> On Wed, Jul 23, 2025 at 01:32:52PM +0200, Linus Walleij wrote:
>> On Thu, Jul 17, 2025 at 8:33 AM Christian Bruel
>> <christian.bruel@foss.st.com> wrote:
>>
>>> We have the helper functions pinctrl_pm_select_default_state and
>>> pinctrl_pm_select_sleep_state.
>>> This patch adds the missing pinctrl_pm_select_init_state function.
>>>
>>> The STM32MP2 needs to set the pinctrl to an initial state during
>>> pm_resume, just like in probe. To achieve this, the function
>>> pinctrl_pm_select_init_state is added.
>>>
>>> This allows a driver to balance pinctrl_pm_select_sleep_state()
>>> with pinctrl_pm_select_default_state() and
>>> pinctrl_pm_select_init_state() in pm_runtime_suspend and pm_runtime_resume.
>>>
>>> Christian Bruel (2):
>>>    pinctrl: Add pinctrl_pm_select_init_state helper function
>>>    PCI: stm32: use pinctrl_pm_select_init_state() in
>>>      stm32_pcie_resume_noirq()
>>
>> If Bjorn Helgaas is OK with it I can apply this to the pinctrl tree.
>>
>> Otherwise I can also just apply patch 1/2, but that doesn't solve
>> any problem.
> 
> The stm32 driver has been posted and is on this branch of the PCI
> tree:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/dwc-stm32&id=5a972a01e24b
> 
> but it's not in mainline (or even in pci/next) yet, so you would only
> be able to apply patch 2/2 if you took the whole driver, which is
> probably more than you would want to do.
> 
> I haven't put it in pci/next yet because it doesn't build when
> CONFIG_PINCTRL is not defined:
> 
>    https://lore.kernel.org/r/20250716192418.GA2550861@bhelgaas
> 
> I don't know enough about pinctrl to know why stm32 needs this when
> nobody else seems to.  I doubt it's really unique, so maybe it's just
> not doing the right thing here.

The STM32MP2 is unique because the core clock is gated on CLKREQ#. 
Consequently, it is not possible to access the core registers from DBI 
when no card is attached, causing the board to freeze. I don't know 
another platform with this limitation

To fix this, we use a GPIO to de-assert CLKREQ# during probe and restore 
the pin to its default AF mode afterward. This works perfectly for 
probe, but we lack functionality for PM resume unless we explicitly 
select the state with pinctrl_pm_select_XXX_state().

For reference, the init_state functionality was introduced in
https://lkml.org/lkml/2015/10/21/1

If we prefer not to extend the pinctrl API in patch 1/2, I can fix the 
case in patch 2/2 only with something like:

in stm32_pcie_probe()
      pinctrl = devm_pinctrl_get(dev);

      if(pinctrl!= -ENODEV) // PINCTRL is defined
           pinctrl_init = pinctrl_lookup_state(stm32_pcie>pinctrl, 
PINCTRL_STATE_IN

in stm32_pcie_resume_noirq()
    if (pinctrl) {
           ret = pinctrl_select_state(stm32_pcie->pinctrl, 
stm32_pcie->pinctrl_init);

What do you advise ?

thank you

Christian



> 
> Bjorn


