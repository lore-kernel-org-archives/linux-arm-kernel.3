Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5093AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6Wb+5iWOd1a9wYG/H92CM/zaVBKIBkdm5Dafxe4iQQ=; b=vhkHu9vNOS12Pu/Pi6t+8ynpfx
	L79ecdcF9oGuKpoC7/Qy8mZKK1qeJNomTuvqpLP7FRe4OfQxOS54QR5v0P6l3UOJbcnKdm+4PnC2L
	nDObfr942Tk7sUc/FHaZG8e+Cr4iO35hbM2vKuEADt/tEwpdZEZSuCvqk8CIGkTezqNx1GzVJqczh
	7k13Vky4w9LmahMixP+KjxTVcNmzVZGn/TRtt2mN+aVC0zPRmXhkf8Y2Rf7oYY/IKs2dJ5OeyGp6U
	Tiv/geyBenCEkiThf8B79zcpDkBj1vJ5x/ty1eDXoE6BczJC1mymX2bumTFOeC6mSzsTbR5zvedC6
	0GUzelAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfw0v-00000005W2F-0KuC;
	Thu, 06 Feb 2025 07:09:29 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfvxL-00000005V7D-0DfG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:05:48 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 06 Feb 2025 16:05:41 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 139D8200705C;
	Thu,  6 Feb 2025 16:05:41 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 6 Feb 2025 16:05:41 +0900
Received: from [192.168.1.141] (unknown [10.213.44.71])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 14A9CAB188;
	Thu,  6 Feb 2025 16:05:40 +0900 (JST)
Message-ID: <ac319cf8-5501-40f2-bf23-fc04a91d4f1f@socionext.com>
Date: Thu, 6 Feb 2025 16:05:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Yanteng Si <si.yanteng@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Steven Price <steven.price@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, Petr Tesarik <petr@tesarici.cz>,
 Serge Semin <fancer.lancer@gmail.com>, Xi Ruoyao <xry111@xry111.site>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk> <20250203142342.145af901@kernel.org>
 <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
 <Z6N4J-_C3lq5a_VQ@shell.armlinux.org.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <Z6N4J-_C3lq5a_VQ@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_230547_203801_E114055E 
X-CRM114-Status: GOOD (  17.50  )
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

Hi Russell,

On 2025/02/05 23:39, Russell King (Oracle) wrote:
> On Wed, Feb 05, 2025 at 10:22:00PM +0800, Yanteng Si wrote:
>>
>> 在 2/4/25 06:23, Jakub Kicinski 写道:
>>> On Mon, 3 Feb 2025 11:16:34 +0000 Russell King (Oracle) wrote:
>>>>> I've no opinion whether the original series "had value" - I'm just
>>>>> trying to fix the breakage that entailed. My first attempt at a
>>>>> patch
>>>>> was indeed a (partial) revert, but Andrew was keen to find a better
>>>>> solution[1].
>>>> There are two ways to fix the breakage - either revert the original
>>>> patches (which if they have little value now would be the sensible
>>>> approach IMHO)
>>> +1, I also vote revert FWIW
>>
>> +1, same here.
>>
>>
>> For a driver that runs on so much hardware, we need to act
>>
>> cautiously. A crucial prerequisite is that code changes must
>>
>> never cause some hardware to malfunction. I was too simplistic
>>
>> in my thinking when reviewing this before, and I sincerely
>>
>> apologize for that.
>>
>>
>> Steven, thank you for your tests, Let's revert it.
> 
> https://lore.kernel.org/r/E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk

I'm sorry to bother you. Thanks for posting revert.

There are variations in the capabilities that the hardware has, and more
hardware needs to be verified to show that they work correctly, so it had
to be handled carefully. Reports that the change patch "worked" or
"didn't work" on any hardware are helpful.

I apologize that posting this change to "-net" was inappropriate
because I added a completely new feature.

Thank you,

---
Best Regards
Kunihiko Hayashi

