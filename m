Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20502C02188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 02:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meBOfZ2CZngxq6R63JxYBgfkmE4In1ZvAzeZx/wD+7w=; b=KJfZJzSYqVxjulfjR76JrUIQo4
	yNFs9ZJEUY/NrVDZJNGiUjrZBxCbeMYcxa3Qr/qNsGYgRGgoT0IfGSjNZZ2+xXPWPQ3ImGJomxxa+
	FuAMucfarfJ7Qi9jjKgD+GZPVP8JBbt+ukAXplJ46yECSftPCXf26megGo6sCQvimguqto2G6EVnW
	8TCxXvtQ04x0Stv1vt9r2ubN6m8YxYzxlZI8y+GBSDfuS9D0rBMrUr9AkkHB19BbKkJvCcf8Gaq+Q
	FBkVeGCISg5xYdjLdJJWLdrF3MC7tN3UUkgEwoHa1THcaJAKNbbnF9ibAVYP8MYBOo+9d23tafaj3
	NTbRpSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcbaF-00000003z9X-2IJd;
	Tue, 28 Jan 2025 02:44:11 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcbYT-00000003z1E-10G9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 02:42:22 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 28 Jan 2025 11:42:20 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 6BDC72007046;
	Tue, 28 Jan 2025 11:42:20 +0900 (JST)
Received: from iyokan2.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 28 Jan 2025 11:42:20 +0900
Received: from [10.212.246.222] (unknown [10.212.246.222])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 99E4FAB186;
	Tue, 28 Jan 2025 11:42:19 +0900 (JST)
Message-ID: <336580ad-e8f6-436a-bf62-adcd348c553b@socionext.com>
Date: Tue, 28 Jan 2025 11:42:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/3] net: stmmac: Fix usage of maximum queue number
 macros
To: Huacai Chen <chenhuacai@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
 <Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk>
 <CAAhV-H78fbK+jAsootOaZW=eQ3RPna3VQTxHd33vDSueYkyYtA@mail.gmail.com>
 <f1912a83-0840-4e82-9a60-9a59f1657694@lunn.ch>
 <CAAhV-H73FNTzhjwkZwO4RAZFF1Ri6EzpJL3jnWW4rPRFZQRZZA@mail.gmail.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <CAAhV-H73FNTzhjwkZwO4RAZFF1Ri6EzpJL3jnWW4rPRFZQRZZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_184221_391215_A5B4CAEB 
X-CRM114-Status: GOOD (  25.27  )
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

Hi Huacai, Andrew,

On 2025/01/27 22:47, Huacai Chen wrote:
> Hi, Andrew,
> 
> On Mon, Jan 27, 2025 at 9:21 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>
>>> I'm not very familiar with the difference between net and net-next,
>>> but I think this series should be backported to stable branches.
>>
>> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> According to the rules a "bug" should break build or break runtime or
> a security issue, but shouldn't be spelling fixes.
> 
> But from my point of view, this series is not just "spelling fixes",
> and not "trivial fixes without benefit for users". It is obviously a
> copy-paste error and may confuse developers, so I think the patches
> really have "benefits".
> 
>>
>>
>>    It must either fix a real bug that bothers people or just add a
>>    device ID.
>>
>> Does this really bother people? Have we seen bug reports?
> No bug report is because MTL_MAX_RX_QUEUES is accidentally equal to
> MTL_MAX_TX_QUEUES and it just works, not because the logic is correct.
> And Kunihiko's patch can also be treated as a report.
> 
>>
>> There is another aspect to this. We are adding warnings saying that
>> the device tree blob is broken. That should encourage users to upgrade
>> their device tree blob. But most won't find any newer version. If this
>> goes into net-next, the roll out will be a lot slower, developers on
>> the leading edge will find the DT issue and submit a DT patch. By the
>> time this is in a distro kernel, maybe most of the DT issues will
>> already be fixed?
> Goto net or goto net-next are both fine to me, I just think this
> series should be backported to stable branches. There are lots of
> patches backported even though they are less important than this
> series (maybe not in the network subsystem).

Currently both macros define the same value and there is no critical
break for previous kernels.

When different values are defined for these macros, this can cause
problems, however, I don't think that these different values are
adopted (backported) in the current stable kernels.

So I think it's reasonable to repost this series to net-next.

Thank you,

---
Best Regards
Kunihiko Hayashi

