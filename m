Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SG2xL1CiX4vgrfPuGcN2Yn4i0g3CE3oiaV07cL/bPPg=; b=yl0Icy6vgjvoygePOoBqkTx7Vg
	z/TP31BcZvkXTneDnl8rSKZAos0n6NZt7MXBFiZQ7qgkcZ0YIDW8xYf8uY/NbOIM3HU5xnT5EDnwe
	f9kRW0yLbNWx6sbb1DJwcrCsXgG++R3kfkkcCU/nJNDs+S5DdLpuJE1+5cd1tmvh9ykXrJwAN2GMG
	wgrEClDH8bDsiGklrPvluugla37QZiB3Cj05taJm/wwxLCG6Gh9xBO+CxPSYAlf5ekl8A7dN5Ke1o
	mWyye4KvehFtz/PQSavIDla8bgq6HZl2r9yT/3zfqYI2OYXKmfKUUz5zEwY2vyGx7Gg7ctjuXHyyw
	8cMdVF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEfZ-00000004U7m-2JR9;
	Sun, 09 Nov 2025 23:18:01 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEfW-00000004U2F-0Ogp;
	Sun, 09 Nov 2025 23:18:00 +0000
X-QQ-mid: zesmtpip3t1762730204t3edc6cc7
X-QQ-Originating-IP: npHRBpKwnAwySazKA74UV1ZQZ3eZ4yRcC40xaKcCCYc=
Received: from [IPV6:240f:10b:7440:1:64e0:6ba: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Nov 2025 07:16:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16272229036353482617
Message-ID: <E739D84F1F86AA6E+92a19e8b-ce67-4fb2-aa74-f5e5b0a075d3@radxa.com>
Date: Mon, 10 Nov 2025 08:16:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Damien Le Moal
 <dlemoal@kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
 <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
 <6e87b611-13ea-4d89-8dbf-85510dd86fa6@rock-chips.com>
 <aQ840q5BxNS1eIai@ryzen> <aQ9FWEuW47L8YOxC@ryzen>
 <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
 <aRCI5kG16_1erMME@ryzen>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <aRCI5kG16_1erMME@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NpfbsqbTlzxU7u/7ZygKn8X0jLE+d2QGMOYyBxOT1xrpTDxYlDv9/ood
	GFj6Ltw1HrhRtyeqr6HW+puDxY4C8d/ih7T25y/K1oskuMpblWm4d56CBMgEmCma75fXJhq
	HdNMtfOW6GBdynaIQTolF0FboSE+BKe9HwzdIwD30TVk6Vs4IqAQtHymDOL0It/EXcVO5dP
	4BXaFLRPY1LiLlqy1r96gwcHHrSms8U5vqOY5puRyqGiFWcqJOSf6tX3MKvtMYtcmbvu1pN
	GHG6nA+xPrqtJipUe6iNnQCKtjR4g1PTErJ6CcE68FhzmBA0l2oR0qs0XtYk09i2cgoOWaj
	SBAi3sdVue6sxPkhpCKP8Y+F648VDQLiDTuJ8opPcK+E0eT+1mDRfRiD/g0GTvcopZ9uJlb
	Pj85Pe3zxnnSrNnrSEUQ7FXCwFw5KqCyTQSUX5LqQ7IhENKeu8RTXCTgdrFxRk/PwDeXksp
	nVN5Aa5utUIQ0b0edQHLmQUzz0GZMWDkYb0FThel23EkCeioLJNXZ//jNEcn+XxYeKTG2Kr
	iGjkEgg1KFE2oFvUy+yb2nT5WCyKkdYxONqLVsGN6agbAsuJyT9vkdZNajZap/mVtUksPvY
	iwVHPKsoukQd0hVAQQvNlTcW352MH1KxCQsBkdPzAlEy16GTXN2pvfUpvXDF7jDf08bzX/9
	4JAADSuRlwM3G3RMwcUA+kllnUCTE1NsjdmM/inVRr4x+x1YE47KFVuBm/YgwjWDKvy7w9p
	mxtm7+pXEdBrfFP5aZwRzSqPpaLDX6Nqpk11iFBR/N+w+hufFYTOM3xkpWoyTuNVMJBHgBj
	UxlEfXJwtRqJpIwGzcdH2XOu+v4OZkX28uMXXY0ppCzHpCjnrSqfXBMM6gChBIewfez+UKT
	ZVsHD0oOL+VVY/2Aw7xQ+ZDtnG+tEJOP1+A+MDpln+tfdezzhlNGVfeUuudrGMjULq8G+ET
	94rkv1cHqQZk2sViJZL/Xly34Pa3WmBmFNUC7mzdbp/Siow==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_151758_643005_30FF79A7 
X-CRM114-Status: GOOD (  21.63  )
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

Hi Niklas,

On 11/9/25 21:28, Niklas Cassel wrote:
> On Sun, Nov 09, 2025 at 01:42:23PM +0900, FUKAUMI Naoki wrote:
>> Hi Niklas,
>>
>> On 11/8/25 22:27, Niklas Cassel wrote:
>> (snip)> (And btw. please test with the latest 6.18-rc, as, from experience,
>> the
>>> ASPM problems in earlier RCs can result in some weird problems that are
>>> not immediately deduced to be caused by the ASPM enablement.)
>>
>> Here is dmesg from v6.18-rc4:
>>   https://gist.github.com/RadxaNaoki/40e1d049bff4f1d2d4773a5ba0ed9dff
> 
> Same problem as before:
> [    1.732538] pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.732645] pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> [    1.732651] pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.732661] pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> [    1.732840] pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.732947] pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> [    1.732952] pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.732962] pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> [    1.733134] pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.733246] pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> [    1.733255] pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.733266] pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> [    1.733438] pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.733544] pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> [    1.733550] pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.733560] pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> [    1.733571] pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> [    1.733575] pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> [    1.733585] pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> [    1.733596] pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
> 
> 
> Seems like the ASM2806 switch, for some reason, is not ready.
> 
> One change that Diederik pointed out is that in the "good" case,
> the link is always in Gen1 speed.
> 
> Perhaps you could build with CONFIG_PCI_QUIRKS=y and try this patch:
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..ac134d95a97f 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -96,6 +96,7 @@ int pcie_failed_link_retrain(struct pci_dev *dev)
>   {
>   	static const struct pci_device_id ids[] = {
>   		{ PCI_VDEVICE(ASMEDIA, 0x2824) }, /* ASMedia ASM2824 */
> +		{ PCI_VDEVICE(ASMEDIA, 0x2806) }, /* ASMedia ASM2806 */
>   		{}
>   	};
>   	u16 lnksta, lnkctl2;

It doesn't help with either probing behind the bridge or the link speed.

> If that does not work, perhaps you could try this patch
> (assuming that all Rock 5C:s have a ASM2806 on pcie2x1l2):

ROCK 5C has a PCIe FPC connector and I'm using Dual 2.5G Router HAT.
  https://radxa.com/products/rock5/5c#techspec
  https://radxa.com/products/accessories/dual-2-5g-router-hat

Regarding the link speed, I initially suspected the FPC connector and/or 
cable might be the issue. However, I tried the Dual 2.5G Router HAT with 
the ROCK 5A (which uses a different cable), and I got the same result.

BTW, the link speed varies between 2Gb/s and 4Gb/s depending on the 
reboot. (with or without quirk)

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> index dd7317bab613..26f8539d934a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> @@ -452,6 +452,7 @@ &pcie2x1l2 {
>   	pinctrl-0 = <&pcie20x1_2_perstn_m0>;
>   	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
>   	vpcie3v3-supply = <&pcie2x1l2_3v3>;
> +	max-link-speed = <1>;
>   	status = "okay";
>   };
> 
> 
> 
> Kind regards,
> Niklas
> 


