Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0C6CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/u83YnPFnggQ2E/YqF7yyEYzCXsQAILKrvqFHKQdRqo=; b=wzXGoGTqr2xOi4/t9i3UyGlY50
	mKtAemoCYmQesgjFsc0V/814k+2uX2N01yguiNr6P2Y7FgibG1PuqelwHAVFRJnNyG4sHxnKaJ5+/
	Wl6ngzOc2MbSrNL3TWSiSET1/cxBA7Lisf03cfjl9rUytCe85460raRXzWTcrGjoA0P6MeA55pYji
	yJ7a7V8XsP1VzgEmixoBKhyhBBmUEOIlYSuSPJbLW8l0iDy2Bad+ZiZkLnX5WLsgN2qKR7vz+7rKS
	RBz8SD81u0KB13R80gLFL/U2xfO4S/XZLiqBBHK1kEH3pkpyiHJyxdx5jghUvdSllekBDZyERNBNA
	BiMvI7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoPz-00000007F44-41n1;
	Tue, 11 Nov 2025 13:28:19 +0000
Received: from mail-m32110.qiye.163.com ([220.197.32.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoPw-00000007F37-1Y6o;
	Tue, 11 Nov 2025 13:28:18 +0000
Received: from [192.168.61.151] (unknown [110.83.51.2])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29341817e;
	Tue, 11 Nov 2025 21:28:10 +0800 (GMT+08:00)
Message-ID: <6a2bef88-1fe8-4477-a179-e97e1e0b7178@rock-chips.com>
Date: Tue, 11 Nov 2025 21:28:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>,
 Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
 Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Diederik de Haas <diederik@cknow-tech.com>, stable@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
To: Niklas Cassel <cassel@kernel.org>
References: <20251017163252.598812-2-cassel@kernel.org>
 <176101411705.9573.17573145190800888773.b4-ty@kernel.org>
 <aRM1VOodnSpaob3P@ryzen>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <aRM1VOodnSpaob3P@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a731a3b6809cckunm78c1b6a21c673
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQhlLVkoeQh5LGkwZTh1NSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSktVQ0hVTkpVSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
DKIM-Signature: a=rsa-sha256;
	b=PsPV9sygri8khXx7L0KPcrb4K3lnqIauAzyiSn44IFWT66tYJF8tOt8M8HTkNJYXomdo3DjUu1agtzuyIgN8fNm+66ysjTgdhT1k61W8OrhpBpRjLx0R1BGito43W+sxzWEL8IMTlvryifTLmXWvVTHhSn/2DAymXNfo16aYY0A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=/u83YnPFnggQ2E/YqF7yyEYzCXsQAILKrvqFHKQdRqo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_052816_897073_B269AB33 
X-CRM114-Status: GOOD (  21.77  )
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


在 2025/11/11 星期二 21:08, Niklas Cassel 写道:
> Hello Mani,
> 
> On Tue, Oct 21, 2025 at 08:05:17AM +0530, Manivannan Sadhasivam wrote:
>>
>> On Fri, 17 Oct 2025 18:32:53 +0200, Niklas Cassel wrote:
>>> The L1 substates support requires additional steps to work, namely:
>>> -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
>>>   hardware, but software still needs to set the clkreq fields in the
>>>   PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
>>> -Program the frequency of the aux clock into the
>>>   DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
>>>   is turned off and the aux_clk is used instead.)
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] PCI: dw-rockchip: Prevent advertising L1 Substates support
>>        commit: 40331c63e7901a2cc75ce6b5d24d50601efb833d
> 
> Last update in this thread was "Applied, thanks!"
> 
> and the patch was applied to pci/controller/dw-rockchip
> 
> since then it seems to have been demoted to pci/controller/dw-rockchip-pend
> 
> I'm simply curious, what is the plan for this patch?
> 
> I know that Shawn was working on a series that adds support for L1ss for
> this driver, but it seems to have stagnated, so it seems far from certain

Yes, that's because Bjorn prefers to disable it in dwc core intially and
sent a patch which we discussed but didn't come to a conclusion. So I 
still be waiting..:）

> that it will be ready in time to make it for the v6.19 merge window.
> 
> Right now, pci/next branch seems to merge pci/controller/dw-rockchip rather
> than pci/controller/dw-rockchip-pend.
> 
> If the L1ss does not make it in time, then this patch will not have had any
> time in linux-next, which might not make Linus happy.
> 
> 
> Kind regards,
> Niklas
> 


