Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22650C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73z56ARiWAajHm4TNmQqERQoOiON/2+ANSDO87Bc7AA=; b=SuQtQJd5Q+Jo9PY2us+edM4pqy
	ulDpm8Gk+rduyLKKlXUt7kO4qJGEWyLnXeDRpRJWmgU/XwaqNBRgG2Il6VTheolCcE6HT3Y9sNchk
	P48hNZyTQFcuuuz7XrhtGC8ko5XGeuEizIAU5XwbgvnUYlPg8NIuFlX0fTkWNy/SS/9KrYaR8h7E7
	HA9bAzd++AIeBCJc+sVwndMO2yXfppsfrfejt8v3jioYdd4iEKJT4CymxxxZrfxvsvdBNcVeDnVux
	vtfKV2OQLiTz9kkxeySfnllc68dgqEGYUiuJGlNw8UTh0j1b/7yUCeqSPeVEq2I5PZWIDtFlf7MVW
	qYFYCPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMil-0000000ERZY-3o4V;
	Thu, 16 Jan 2025 10:03:27 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMhV-0000000ERMp-0Fmj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 10:02:10 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Jan 2025 19:02:06 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id E0FA42006E93;
	Thu, 16 Jan 2025 19:02:05 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 16 Jan 2025 19:02:05 +0900
Received: from [10.212.247.91] (unknown [10.212.247.91])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id CBDDE1A8;
	Thu, 16 Jan 2025 19:02:04 +0900 (JST)
Message-ID: <da65b8e2-bbc9-4d9b-9d78-4a32775c465b@socionext.com>
Date: Thu, 16 Jan 2025 19:02:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: stmmac: Limit FIFO size by hardware feature
 value
To: Furong Xu <0x1207@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
 <20250116105011.00003206@gmail.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20250116105011.00003206@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_020209_212207_64D917D3 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Furong,

Thank you for your comment.

On 2025/01/16 12:04, Furong Xu wrote:
> On Thu, 16 Jan 2025 11:08:52 +0900, Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> 
>> Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
>> the platform layer.
>>
>> However, these values are constrained by upper limits determined by the
>> capabilities of each hardware feature. There is a risk that the upper
>> bits will be truncated due to the calculation, so it's appropriate to
>> limit them to the upper limit values.
>>
> 
> Patch is fine, but the Fixes: tag is required here.

I see. I'll find original commit and send the patch with Fixes:
tag next.

> And if you like to group this patch and the another patch into one series,
> it is better to add a cover letter.

Yes, I omitted to add a cover letter.
However, this patch has no dependency on the other one and
needs some consideration, so I'll send it separately.

Thank you,

---
Best Regards
Kunihiko Hayashi

