Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B27CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqKFwJTtAHqh86lEqRIcwq3CBA+ub4FQsb9uC2nRB3g=; b=M/g3Gxe9qqaOY352tfxMyL02CV
	weHnxye9DpSJLjWOsI56L3LuR34CS0OXPP4Bn4jPklUe7oMx63efVRLMeLH1iyDsNNfZEvuxtobQK
	Dusa/eQy44Y/E5H63imUKvaswhIC8km3Rr8tddt2iuHVhzMANHliBcFA+YOykELtjY/S/G4WMCQOY
	cucUW9rw/7YtGqfqaRl7mPx4XqZwo1aQYhsUbmw18UArjMpENeOM2mfYDXByhzvm1D0ZXAAeeZVnF
	G2VLYf4Dh14A7zNegVdgWeCFwW/1/25gY2pqz4S5RZ8VPrV9mDz/Z4a7WJM47+oj53msL+Jd7BONV
	jb6bgtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6Vo-0000000G1uc-0Omo;
	Tue, 21 Oct 2025 07:10:28 +0000
Received: from mail-m49209.qiye.163.com ([45.254.49.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6Vj-0000000G1sN-3eNK;
	Tue, 21 Oct 2025 07:10:25 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26a04dd28;
	Tue, 21 Oct 2025 15:10:15 +0800 (GMT+08:00)
Message-ID: <6e87b611-13ea-4d89-8dbf-85510dd86fa6@rock-chips.com>
Date: Tue, 21 Oct 2025 15:10:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Damien Le Moal <dlemoal@kernel.org>,
 Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
To: FUKAUMI Naoki <naoki@radxa.com>, Niklas Cassel <cassel@kernel.org>
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
 <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a059ab03d09cckunm368fe7546378e8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlMHlZMGEkdT0oYHUhDQx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Xos0oDM9U+/0NylMEL8BB6RuBd69z3lnV+GumxjkBut/AP4cPRzd/vEwQFu9Y0yZl9ylfTifD4WYmtQLfDFSTfDUOm6IrlAU9x4wRdv7I2pZ6NGG00jyiBi+qLpg8afql3x9baCOQsYhc1URYAHef4Q4vfCHixVaDZf/eS4A/cQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FqKFwJTtAHqh86lEqRIcwq3CBA+ub4FQsb9uC2nRB3g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_001024_099032_AB69AEDD 
X-CRM114-Status: GOOD (  29.84  )
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

在 2025/10/21 星期二 12:26, FUKAUMI Naoki 写道:
> Hi Niklas, Bjorn,
> 
> I noticed an issue on the Rockchip RK3588S SoC using the ASMedia ASM2806 
> PCIe bridge where devices behind the bridge fail to probe since v6.14.
> Specifically, this started happening after commit 
> 647d69605c70368d54fc012fce8a43e8e5955b04.
> dmesg logs from before and after this commit are available at:
>   https://gist.github.com/RadxaNaoki/fca2bfca2ee80fefee7b00c7967d2e3d
> 
> I have confirmed that reverting the following commits fixes the issue:
>   commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we 
> can detect Link Up")
>   commit 0e0b45ab5d77 ("PCI: dw-rockchip: Enumerate endpoints based on 
> dll_link_up IRQ")
> 

Then these two commits would like to reply on link up irq instead of
fixed delay in dwc framework. Here is a not very precise timeline
description.

time(ms) |  dw_pcie_wait_for_link（）     | sys irq_thread() | Hot reset
-------------------------------------------------------------------------
0:       |  dw_pcie_link_up return false  |  link up irq     |
1x       |  Physical link up happend      |                  |
90:      |  dw_pcie_link_up return true   |                  |
100:     |                                |  msleep(100) done|
10x:     |                                |  pci_rescan_bus  |
1xx:     |                                |                  | <==occur
190:     |  msleep(90) done               |                  |
19x:     |  pci_host_probe                |                  |

What if the hot reset happens when pci_rescan_bus() starts. I think
scan devices possible fail when seeing 0xffffffff from cfg read. But
a 90ms delay perfectly avoids this event in dw_pcie_wait_for_link(), and 
by the time the 90ms delay is completed, the link is actually in an
accessible state.

> On v6.18-rc2, the cold boot behavior has changed somewhat, and I have 
> observed the following three behaviors so far:
> 
> - Probe succeeds
> - Probe fails
> - Kernel oops
> 
> There seems to be no pattern to these three behaviors. During a warm 
> boot, a successful probe does not seem to occur.
> 
> If commit ec9fd499b9c6 is reverted on v6.18-rc2, I have observed the 
> following two behaviors so far:
> 
> - Probe succeeds
> - Kernel oops
> 
> "Probe fails" has not been observed so far.
> 
> The dmesg for the kernel oops is available at:
>   https://gist.github.com/RadxaNaoki/4b2dcd5e41b09004eda2fdeb80ae5e15
> 
> Can you please help me with this issue?
> 
> Best regards,
> 
> -- 
> FUKAUMI Naoki
> Radxa Computer (Shenzhen) Co., Ltd.
> 
> On 1/13/25 19:59, Niklas Cassel wrote:
>> The Root Complex specific device tree binding for pcie-dw-rockchip has 
>> the
>> 'sys' interrupt marked as required.
>>
>> The driver requests the 'sys' IRQ unconditionally, and errors out if not
>> provided.
>>
>> Thus, we can unconditionally set use_linkup_irq before calling
>> dw_pcie_host_init().
>>
>> This will skip the wait for link up (since the bus will be enumerated 
>> once
>> the link up IRQ is triggered), which reduces the bootup time.
>>
>> Signed-off-by: Niklas Cassel <cassel@kernel.org>
>> ---
>>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>>
>> ---
>> base-commit: 2adda4102931b152f35d054055497631ed97fe73
>> change-id: 20250113-rockchip-no-wait-403ffbc42313
>>
>> Best regards,
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/ 
>> pci/controller/dwc/pcie-dw-rockchip.c
>> index 
>> 1170e1107508bd793b610949b0afe98516c177a4..62034affb95fbb965aad3cebc613a83e31c90aee 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> @@ -435,6 +435,7 @@ static int rockchip_pcie_configure_rc(struct 
>> rockchip_pcie *rockchip)
>>       pp = &rockchip->pci.pp;
>>       pp->ops = &rockchip_pcie_host_ops;
>> +    pp->use_linkup_irq = true;
>>       return dw_pcie_host_init(pp);
>>   }
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


