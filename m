Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51134C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLf6c6c5ft8eN46VJWzZEfTcLHZ/iFnsmavl08qDxwU=; b=qnz8XKUkDaPjHnbm0F9N7s0UcM
	U/L92Igypn9IBvEQ4GfusDspMOnGtqyl9k7oRPN6+StE+MP1+RgUraQSShSWH4Lo/wlFA02nTow3F
	xdu04fMMjzNojh6j9TLV1Av2X0NRzLEI8UqBKiIcJYMMI2k57/2lJKxWTDwIhRHdIX7yRMM14Qrt9
	sQXSaCLDDfMrAMDQ70R1OyJFyRsT6IgghCena0LV98oI4sYg4VYwwK8EcGPhkYRTLT/8zAhUX504c
	P3680HbNqaXthyAgSsUdY8qF9s8hKbbU4vUGgQ/QPj/6UrOyLSx25pTMOvcRI1uHIBpC/pbbhg15v
	7CWnlwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e7q-0000000BMHZ-1qSL;
	Wed, 23 Apr 2025 17:43:10 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bxR-0000000AxPq-0vep;
	Wed, 23 Apr 2025 15:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=fLf6c6c5ft8eN46VJWzZEfTcLHZ/iFnsmavl08qDxwU=;
	b=Cp0hA+IpCX8WlV1svNV2MyHKPXjl4LoFaXE7Xrw/Badl8BO+C+hHZwx+ElOkcQ
	eqscdFuprmIXObh56TRVMM7UNOB9XYAOuXyt5vptI36gOtPLW2cXYqMpWSy29JsW
	I9URNWxVX2J5ZPX6Bj4iY0vFHAtrO5y0QAwoayJE6hVwI=
Received: from [192.168.71.89] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnfGf9BQloLLNpCA--.43427S2;
	Wed, 23 Apr 2025 23:23:42 +0800 (CST)
Message-ID: <9212f2ee-9562-4409-a378-20e41fe30325@163.com>
Date: Wed, 23 Apr 2025 23:23:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] PCI: dw-rockchip: Reorganize register and bitfield
 definitions
To: Niklas Cassel <cassel@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250423105415.305556-1-18255117159@163.com>
 <20250423105415.305556-3-18255117159@163.com> <aAjufPQnBsR6ysAH@ryzen>
 <352e40a0-65e2-499f-a7dd-904a4a7b19da@163.com> <aAkDRIqIOjLo7haw@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aAkDRIqIOjLo7haw@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wDnfGf9BQloLLNpCA--.43427S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4ktF47Gw18Cr4UtrWUJwb_yoW3trgEqr
	4UArsxCryqgF9xWa93Jr1jyFsIk3ykuw45urykXr4Iyw1agrs5Kr429rZ3JFy8Ja13GFs2
	kw15Aa1ruryS9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjqjg3UUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWw44o2gJAM5KAgABso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_082417_634878_8856F31D 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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



On 2025/4/23 23:12, Niklas Cassel wrote:
> On Wed, Apr 23, 2025 at 10:14:57PM +0800, Hans Zhang wrote:
>>> I can see why you renamed PCIE_CLIENT_GENERAL_CONTROL to PCIE_CLIENT_GENERAL_CON
>>> (to match PCIE_CLIENT_MSG_GEN_CON).
>>>
>>> But now we have PCIE_CLIENT_MSG_GEN_CON / PCIE_CLIENT_GENERAL_CON and
>>> PCIE_CLIENT_HOT_RESET_CTRL.
>>>
>>> _CTRL seems like a more common shortening. How about renaming all three to
>>> end with _CTRL ?
>>
>> I saw that TRM is named like this.
>>
>> PCIE_CLIENT_GENERAL_CON / PCIE_CLIENT_MSG_GEN_CON /
>> PCIE_CLIENT_HOT_RESET_CTRL
>>
>> Shall we take TRM as the standard or your suggestion?
> 
> Aha, so the inconsistency is in the TRM... hahaha :)
> 
> Probably best to keep it identical to the TRM.
> 

Hi Niklas,

Thank you very much for your reply. Okay.

Best regards,
Hans


