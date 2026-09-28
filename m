Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95528C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTPIj+A/kdxPu3UNXQlL6Hsn+maL+UgLjUd7u23pb2U=; b=xHSft8d9o6rNdwqLm/tI2LC1XC
	VvxliTflFUlAkLLw7yIkfoabjrUj86PKl92Ou2ZZ/5OLrkgB0kb4qRZow3q/U5wf+rd7ih4gQLqAM
	clJVQhWwTq+hVAn5ejrQ7cUKXlBjvEmEgeYddy6IY63p9dEv9sGgaaZ3M3utuZGm54eTYyUO1YkCT
	HnupSPXab0W8YJH4/lfhB/l5yXahfHVDFEQbQMCrLBbUuP7YFSmgni1mBW7avF3wSbI0robHwV2ze
	ibMIO1+fuA6U0Gx5sGUGq4h6Mt/JxG596qQczjneBlygATdxUHuwlEjP/J55Hufc3uu8qMMYvGJP7
	L/ZMLVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBApu-00000000bJJ-0eLi;
	Mon, 28 Sep 2026 12:52:02 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBApq-00000000bIg-1C4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=DTPIj+A/kdxPu3UNXQlL6Hsn+maL+UgLjUd7u23pb2U=;
	b=in8AMUEIsjWOJ7MpIDhT/wxSAhUAmg+wKdqWDfD1kzYmTC4E/0W0ICSgmeRgmZ
	dAAxodCUyDee3xouXqLlVeChEJfg4ymQVaEb4e2n8mkx9a8bt+CJkjLLzqJ/asxM
	ZmCQ7UjzxYHLISuB8IpqhZ71WC6Po1phw8n5Kp+KTQvgw=
Message-ID: <382899bd-1502-4e65-8c38-67924def204b@126.com>
Date: Mon, 28 Sep 2026 20:51:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] net: stmmac: do not keep the new TSO MSS cached on
 mapping failures
To: netdev-bot+sinfo@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
References: <20260928123422.1698785-1-xiaolinkui@126.com>
 <179059916708.31693.15841769312205825846@kernel.org>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <179059916708.31693.15841769312205825846@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PykvCgDXv8a+Yrpq6_ltAg--.55804S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyrGw15ZFW3Xw4kAFWkJFb_yoW8uF48pF
	Z0k3yqkF9xJF1Syr4vvw40va4rtrs3GF45Gr4UKryYyws8GF1agrsIgr15uasrGr97Za4F
	9w4qq34qvryDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZZ2-UUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqQAS6Gq6YsCWTgAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_055159_995661_A4B4D4E9 
X-CRM114-Status: GOOD (  18.86  )
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

Hi,

Thanks for the reminder. Here is the missing information:

How discovered:
The original issue was found by code inspection of the error paths in
stmmac_tso_xmit(). The v3 regression - deferring tx_q->mss = mss until
the context descriptor OWN bit is set - was raised by the Sashiko AI
review of v3, which noted that a concurrent stmmac_tx_err() could reset
and clear tx_q->mss before the deferred store republished it. v4 avoids
that by keeping the store in place and clearing tx_q->mss on the DMA
mapping failure paths instead.

Triggered:
Not triggered on real hardware. This is a code-inspection/review finding.
The ring-wedge part requires a DMA mapping failure in the TSO transmit
path; the stale-MSS part then requires a later TSO frame with the same
gso_size to take the mss == tx_q->mss path and skip the context
descriptor. No stack trace, error message or syzbot report is available.

Testing:
Not tested on real hardware. No hardware test was performed.

On 2026/9/28 20:39, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by code inspection). If it was triggered please include
>     the symptoms, like the stack trace or error messages.
> 
>   - What hardware the change was tested on. For driver fixes please
>     mention the device (and if relevant firmware version) used for
>     testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.


