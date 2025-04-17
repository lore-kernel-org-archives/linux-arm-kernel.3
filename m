Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D290C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQzclTKLI3van/CH/5ZiT8li8vzwRaoxSxml69VlxEw=; b=Z+yXkloxrkin1K3fmDeeYNznRB
	323+96BFoiTWp0/8wz0q17H55g0IXZYfxtCAG01zdscBtJPvRd1tmrw1GNUlVTm1dNLCxQ8GqUo4w
	Png4J9aYvkLP/0mN1TZR49DqZxHSLWsoBSG9Bva0nUEsFesml12hUVNzFoE09NCXGqTimq7ghRQkV
	dJ51RMZ7tYn6Lkky8rs+ROK7+qD1MvrvP+uYVF/uDLc59Gf8DIRbjV88AJ9P52WkDDgWYzuBkwKV/
	E32QP8HQ7OZe8gEMg1I4obPPAXzq1WoUGH0M2BZrujySGEKNvv9ZfsrCEbOyd03mudaQ7Hs5Gwgwl
	THk2NDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TqC-0000000DzzA-2U83;
	Thu, 17 Apr 2025 18:20:00 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TT4-0000000Dvwn-05tx;
	Thu, 17 Apr 2025 17:56:07 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1744912563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WQzclTKLI3van/CH/5ZiT8li8vzwRaoxSxml69VlxEw=;
	b=hRLFZPO07cDgA65qQ6Ex8y4itgzRLJrCdRGXla7hzcdJ2bZtAl2K252nfYlMRrLC1CBaZ/
	HSzqVO6xkyyOCsDUpv0m4jK60IlPyKwjwzyqIKBHEPhZHnQ8947c4rjoXGk5ZE2WQ4nxe+
	GbdZ3O1gHH9pUyJ6WPVnblqXQhtRzE72NXorS+eLaZsWkOSUTT0NF03aPj2JKAquOFdr2M
	cCxI3paLbEDVmylA0EkDCu9ogUg8txWgEtYOg2P7fUCJbfWwW6fp2tpXCXe8FXC8Nfhytt
	SfXmXK+o/jXqiyfUY0v2ovkSGr5JDtH0wEEYYLclPWT49Y0ymKCKoj5fYW/cXQ==
Date: Thu, 17 Apr 2025 19:56:02 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy?=
 =?UTF-8?Q?=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, Shawn Lin
 <shawn.lin@rock-chips.com>, Niklas Cassel <cassel@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] PCI: dw-rockchip: Fix function call sequence in
 rockchip_pcie_phy_deinit
In-Reply-To: <D992W9V9ZH2J.2Z2OLK00N0FIU@cknow.org>
References: <20250417142138.1377451-1-didi.debian@cknow.org>
 <3e000468679b4371a7942a3e07d99894@manjaro.org>
 <D992W9V9ZH2J.2Z2OLK00N0FIU@cknow.org>
Message-ID: <ad4b2140f5a4bf20b199ab092f28def7@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_105606_426246_B1460B4C 
X-CRM114-Status: GOOD (  26.95  )
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

On 2025-04-17 19:09, Diederik de Haas wrote:
> On Thu Apr 17, 2025 at 6:20 PM CEST, Dragan Simic wrote:
>> On 2025-04-17 16:21, Diederik de Haas wrote:
>>> The documentation for the phy_power_off() function explicitly says
>>> 
>>>   Must be called before phy_exit().
>>> 
>>> So let's follow that instruction.
>>> 
>>> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host
>>> controller driver")
>>> Cc: stable@vger.kernel.org	# v5.15+
>>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>>> ---
>>>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>>> b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>>> index c624b7ebd118..4f92639650e3 100644
>>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>>> @@ -410,8 +410,8 @@ static int rockchip_pcie_phy_init(struct
>>> rockchip_pcie *rockchip)
>>> 
>>>  static void rockchip_pcie_phy_deinit(struct rockchip_pcie *rockchip)
>>>  {
>>> -	phy_exit(rockchip->phy);
>>>  	phy_power_off(rockchip->phy);
>>> +	phy_exit(rockchip->phy);
>>>  }
>>> 
>>>  static const struct dw_pcie_ops dw_pcie_ops = {
>> 
>> Thanks for the patch, it's looking good to me.  The current state
>> of the rockchip_pcie_phy_deinit() function might actually not cause
>> issues because the rockchip_pcie_phy_deinit() function is used only
>> in the error-handling path in the rockchip_pcie_probe() function,
>> so having no runtime errors leads to no possible issues.
>> 
>> However, it doesn't mean it shouldn't be fixed, and it would actually
>> be good to dissolve the rockchip_pcie_phy_deinit() function into the
>> above-mentioned error-handling path.  It's a short, two-line function
>> local to the compile unit, used in a single place only, so dissolving
>> it is safe and would actually improve the readability of the code.
> 
> This patch came about while looking at [1] "PCI: dw-rockchip: Add 
> system
> PM support", which would be the 2nd consumer of the
> rockchip_pcie_phy_deinit() function. That patch's commit message has 
> the
> following: "tries to reuse possible exist(ing) code"
> 
> Being a fan of the DRY principle, that sounds like an excellent idea 
> :-)
> 
> So while you're right if there would only be 1 consumer, which is the
> case *right now*, given that a 2nd consumer is in the works, I think
> it's better to keep it as I've done it now.
> Let me know if you disagree (including why).
> 
> [1] 
> https://lore.kernel.org/linux-rockchip/1744352048-178994-1-git-send-email-shawn.lin@rock-chips.com/

Ah yes, you're right, thanks for reminding me about that patch.  I saw
it before, but I totally forgot about it for a moment.

I agree that keeping the rockchip_pcie_phy_deinit() function is the way
to go.  Yes, it's a short function, but maybe we'll need to do something
more in it at some point, which would then be propagated to all of its
consumers, instead of having to change all of the "dissolved instances"
individually.

