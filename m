Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C58C02181
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 00:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BflIRwBzht/YtITYhUyspn6aU2NVQQiTlhYYOKDXi6c=; b=vxsniiIk5A0QM5heo9W2Y4Tfh2
	4d7pOfFNkj+aERUPjCUB18/uldnHmcIc98xpX1wWjEX4Cy2uq7S8NUclEj0RhP+vU4Qr9EGQWfk6k
	4fHtOh2v6GU77x/8xACYG6s7nvcnkSsdlUzKJ79lQAbY3yxnStjlTRx+AgDVpjjvH7xof8P4rlp9w
	Yd1RaRFuRPprsYJp7mLNA+Wq8Oj6T1neEgyfGG86nW6AZi7k16CkDAkATTEQle84q17jzhb0r1qfv
	u/wO+mcEAya4xNroU3ogU642RCYrhRXylAefSHEG7/585xbn5aRsnkJy1QaQk5gkHUArL42rLv+Pu
	2z+6wgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta1yc-00000006cTQ-0D0x;
	Tue, 21 Jan 2025 00:18:42 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta1xK-00000006cO5-07nJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 00:17:23 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 21 Jan 2025 09:17:19 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 3E39B201548B;
	Tue, 21 Jan 2025 09:17:19 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 21 Jan 2025 09:17:19 +0900
Received: from [10.212.246.222] (unknown [10.212.246.222])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id B36CFAB184;
	Tue, 21 Jan 2025 09:17:18 +0900 (JST)
Message-ID: <c0fc9c74-1ea6-463a-85c1-be9152c41009@socionext.com>
Date: Tue, 21 Jan 2025 09:17:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: stmmac: Limit FIFO size by hardware feature
 value
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
 <636bad71-8da8-4fda-a433-1586d93683a5@lunn.ch>
 <6aa0671d-beb2-429b-a34e-cb35651e1c12@socionext.com>
 <0c54a6ef-83ab-4739-bf2e-414c4d4621dc@lunn.ch>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <0c54a6ef-83ab-4739-bf2e-414c4d4621dc@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_161722_182952_4C466582 
X-CRM114-Status: GOOD (  22.62  )
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

Hi Andrew,

On 2025/01/21 1:29, Andrew Lunn wrote:
> On Mon, Jan 20, 2025 at 02:20:23PM +0900, Kunihiko Hayashi wrote:
>> Hi Andrew,
>>
>> On 2025/01/17 5:16, Andrew Lunn wrote:
>>> On Thu, Jan 16, 2025 at 11:08:52AM +0900, Kunihiko Hayashi wrote:
>>>> Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth"
> from
>>>> the platform layer.
>>>>
>>>> However, these values are constrained by upper limits determined by
> the
>>>> capabilities of each hardware feature. There is a risk that the
> upper
>>>> bits will be truncated due to the calculation, so it's appropriate
> to
>>>> limit them to the upper limit values.
>>>
>>> Are these values hard coded in the platform layer? Or can they come
>>> from userspace?
>>
>> My explanation is insufficient and misleading.
>> "From the platform layer" means the common layer of stmmac described in
>> "stmmac_platform.c".
>>
>>> If they are hard coded, we should also fix them. So maybe add a
>>> netdev_warn(), and encourage the platform maintainers to fix their
>>> platform. If they are coming from userspace, we should consider
>>> failing the ethtool call with an -EINVAL, and maybe an extack with the
>>> valid range?
>>
>> These values are derived from the devicetree and stored in the stmmac
>> private structure. They are hardware-specific values, so I think this
>> fix is sufficient.
> 
> But if they are coming from device tree, the device tree developer has
> made an error, which has been silently ignored. Do we want to leave
> the device tree broken? Or should we encourage developers to fix them?
> Printing a warning would facilitate that.

I think that developers should fix the devicetree, so I'll add a warning
message if the specified value exceeds the hardware capability.

Thank you,

---
Best Regards
Kunihiko Hayashi

