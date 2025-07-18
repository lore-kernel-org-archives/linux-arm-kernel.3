Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F975C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 03:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAEW8nh82M3n6oKElIg12pDpIa7tqdkjZDGaRgfT/xk=; b=W5YAx0ct9Uph+a4DgNW7xx+cJE
	mBRUv4OOPAKZxJkK0T17bBhWz+5LZj3ChRyvU8jfdnuBzjEi7oOOwNZwgelcEHbXDgIBV/JSpeSNI
	azmGnozXJs5dfh8++Vv8zsVa5X2aJnzJ5cAnhxmMeNkdIbiilLar6Z0EQvcVhSDHzqiGKE2IIe5D/
	FUe67B1ElbDH9VzdgYsMkO0AgQ6PnWmYzGxxqk8SomYZTQaKFCXwqE7a/KyKU1CMN36bgjM6w0GiD
	VlN6kDTfsdJT5XL20FwTKNDFFdk3auQwtc4/ku/ilXMPF2AV8zimuJqTNkEc94o9IONioWCrYZxGm
	UHGdsO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucc6H-0000000BcSS-1CbM;
	Fri, 18 Jul 2025 03:49:33 +0000
Received: from mail-m19731118.qiye.163.com ([220.197.31.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucc3o-0000000BcCi-1QRc;
	Fri, 18 Jul 2025 03:47:02 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c6eff80b;
	Fri, 18 Jul 2025 11:46:42 +0800 (GMT+08:00)
Message-ID: <067e1833-8527-4c66-90f5-d284f7d2ca5c@rock-chips.com>
Date: Fri, 18 Jul 2025 11:46:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Hugh Cole-Baker <sigmaris@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
 <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
 <ac48d142-7aec-4fdd-92a4-6f9bc10a7928@rock-chips.com>
 <aHnAcbXuFqcMXy_5@geday>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <aHnAcbXuFqcMXy_5@geday>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgdTVZDTBlKHUoaSB9MT09WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a981ba430bd09cckunm6356e98e1fd4594
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OS46FAw4AjE4M1YKNDcBKgMu
	OEwKCk1VSlVKTE5JQ0pLT0tITkxCVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU9JT0I3Bg++
DKIM-Signature: a=rsa-sha256;
	b=hogjkqICVDrRageskiwzn6+yGseT8QcNqZBVNH6DKYgPt1bTvPWF0EL4YFgvxFZDCUTkLfrPHhj+4nVKFbYlZ6NxPSDL8CIQSY9YbPsW1bRv9jWhGSCOeXn8PhMHs/JmrrLMyX/CRLKidBSv7XNHHuO6MKKbL6Ktiuh03Wz3bO4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=tAEW8nh82M3n6oKElIg12pDpIa7tqdkjZDGaRgfT/xk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_204700_876164_EF5ACBE2 
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

在 2025/07/18 星期五 11:33, Geraldo Nascimento 写道:
> On Fri, Jul 18, 2025 at 09:55:42AM +0800, Shawn Lin wrote:
>> Hi Geraldo,
>>
>> 在 2025/06/11 星期三 3:05, Geraldo Nascimento 写道:
>>> After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
>>> N10 through trial-and-error debugging, I finally got positive results
>>> with enumeration on the PCI bus for both a Realtek 8111E NIC and a
>>> Samsung PM981a SSD.
>>>
>>> The NIC was connected to a M.2->PCIe x4 riser card and it would get
>>> stuck on Polling.Compliance, without breaking electrical idle on the
>>> Host RX side. The Samsung PM981a SSD is directly connected to M.2
>>> connector and that SSD is known to be quirky (OEM... no support)
>>> and non-functional on the RK3399 platform.
>>>
>>> The Samsung SSD was even worse than the NIC - it would get stuck on
>>> Detect.Active like a bricked card, even though it was fully functional
>>> via USB adapter.
>>>
>>> It seems both devices benefit from retrying Link Training if - big if
>>> here - PERST# is not toggled during retry.
>>>
>>
>> I didn't see this error before especially given RTL8111 NIC is widelly
>> used by customers.
> 
> Hi Shawn, great to hear from you!
> 
> Notice that my board exposes PCIe only via NVMe connector, and not
> directly via a proper PCIe connector, so it is necessary for me to
> adapt with inexpensive riser card that exposes proper PCIe connector.
> 
> I say this because while I don't doubt that the RTL8111 NIC works
> out-of-the-box for boards that directly expose PCIe connector, the
> combination of riser card plus NIC has a similar effect - though not
> entirely equal, as described above - of connecting known good SSDs
> that simply refuse to work with Rockchip-IP PCIe.
> 
> I admit that patch 1 looks a little crazy, but is has the effect of
> enabling use of presently non-working devices or combination of devices
> on this IP, at least on the board I have access to.
> 
>>
>> Could you help tried this?
>> [1] apply your patch 3 first
> 
> Sure, I'm always open for testing, but could you clarify the patch 3
> part? AFAIK this series of mine only has 2 patches, so I'm a little
> confused about exactly which patch to apply as a preliminary step.

Patch 3 refers to "arm64: dts: rockchip: drop PCIe 3v3 always-on and
boot-on" which let kernel fully controller the power in case firmware
did it in advanced.

> 
> Also, since you're asking me to test some code, I think it is only fair
> if I ask you to test my code, too. It shouldn't be too hard for you to
> find a otherwise working NVMe SSD that refuses to complete link training
> with current code. Connect this SSD please to a RK3399 board and let us
> know if my proposed code change does anything to ameliorate the
> long-standing issue of SSD that refuses to cooperate.

Sure, I don't have Samsung PM981a SSD now, but I could try to test all
my SSDs to find if I could pick up one that won't work.

> 
> Thank you,
> Geraldo Nascimento
> 


