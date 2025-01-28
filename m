Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B76C02188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 02:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdDW8w3K9zJNlMAeW2psHMPHTPpzQVL/9MfmdoldTag=; b=XVaSqapzJpI7hL6wRc431qYi6e
	9jjOttfoto/qcbDy5px7z6cpFjByrFKiGaIWenIaqhftO5l3zklwJluY9G+3Th5qR2S6mXrDfAR8N
	dIj/9L7YrJUluIla8ev7nNcuyB7K3TlvFAgXR7rtFz5TtB20+4cd34P8qpTScX1+7XVPRFbhCIxUC
	Ym6ROl7g1259Vreu/0rPKaG2pJlSANJhLTbAELoIXA7XXOMSzN6zoREKXO/PKq2dWnOdpd3/QGMH6
	SbgmfbdWI8BmIckU8EXFcJNUAW69JZJmKwCmT5WuqomeZUdKeuvEZUNBMbT45mX+6FEfMqdGgjmne
	ozY/V+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcbYx-00000003z4Y-3nMD;
	Tue, 28 Jan 2025 02:42:51 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcbXb-00000003yxI-0zJy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 02:41:29 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 28 Jan 2025 11:41:20 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id C4C11200C4EA;
	Tue, 28 Jan 2025 11:41:20 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 28 Jan 2025 11:41:20 +0900
Received: from [10.212.246.222] (unknown [10.212.246.222])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 665C8AB186;
	Tue, 28 Jan 2025 11:41:20 +0900 (JST)
Message-ID: <506cfa39-924e-479b-be2d-b032664958a9@socionext.com>
Date: Tue, 28 Jan 2025 11:41:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/3] net: stmmac: Fix usage of maximum queue number
 macros
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
 <Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_184127_394455_2570D602 
X-CRM114-Status: GOOD (  19.66  )
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

On 2025/01/27 18:51, Russell King (Oracle) wrote:
> On Mon, Jan 27, 2025 at 06:24:47PM +0900, Kunihiko Hayashi wrote:
>> The maximum number of Rx and Tx queues is defined by MTL_MAX_RX_QUEUES
> and
>> MTL_MAX_TX_QUEUES respectively.
>>
>> There are some places where Rx and Tx are used in reverse. Currently
> these
>> two values as the same and there is no impact, but need to fix the usage
>> to keep consistency.
> 
> I disagree that this should be targetting the net tree - I think it
> should be the net-next tree. Nothing is currently broken, this isn't
> fixing a regression, there is no urgent need to get it into mainline.
> It is merely a cleanup because both macros have the same value:
> 
> include/linux/stmmac.h:#define MTL_MAX_RX_QUEUES        8
> include/linux/stmmac.h:#define MTL_MAX_TX_QUEUES        8

I was a bit confused about how to choose net and net-next in this case,
but I understand what you are saying.

As I wrote:
>> Currently these two values as the same and there is no impact

this case isn't about fixing what is broken and also not required fixes
for the stable kernel, so I should post this series to net-next without
Fixes: tag.

> Please re-send for net-next after the merge window and net-next has
> re-opened.

I see. I'll take care and repost.

Thank you,

---
Best Regards
Kunihiko Hayashi

