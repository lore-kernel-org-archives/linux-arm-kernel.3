Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EDBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPAvt4qaBDMoIurCHx70ouodE4Ai1NaWhHP67n45SmU=; b=q39hvYj5UApIJ9L+xN/Wf3s0Qt
	Z2nho8H0kUS4/JLHYrjDTnwwp/eTVXMCn8tzUKzXP80ILUXVzsubatA6x7tml2b/I1LUVGo7Vb+4Q
	hgGOLLQ+YK3MakOHbg67LeZxhhjRyW9P6BVl8d7DlfbPC4py5zpZP7XANBcvjDXy9J0IkhPuqk4JB
	kqTwVu1WLpsOd6OIQ3ozf7qk1wnB5wBF495yvAq/hXmNU604JT93AHKpOor00sIxRDqZSBvKL7Cjc
	Nm4qoFzaombWR7jRgp8utxc/IxmBeRlA87KiE/C8XajGO05fRuwtJ0hFIqNZKoWtX/TeysHil2ku2
	Ta/PCJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAQj-0000000EU8B-3DxX;
	Mon, 29 Jun 2026 11:45:37 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAQh-0000000EU7i-2pau
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=jPAvt4qaBDMoIurCHx70ouodE4Ai1NaWhHP67n45SmU=; b=5jj+/jM8kzonl4B7
	XJdz4oWYE8E8yYUtrOmNyccKZxdT86dDo5mmb/lELsNfM2q4/9lPJrbgSPCbq0l9hhS/Ic4FNhWRm
	CQ6tIi760AvxADxXVzgVttzly7dQbzSaSYCD7FRCXlXSxXSHpT4dNMMDMaSLeJa/acNYBioYmMAlt
	9tnhVQdD6TMQPgAj/PWazeEsVbgwCjdVNB2VcaOFtnRASUZCr9YwJ1Hicjf0p13qPTK3q65+dZ1to
	cACsKcRR+VVeoNZpIZhKOtE4YIlvukMcAo9NQQzktprBzN+uVg9Y918AEDVoFXuIAXEE4t3paW22/
	+fbV6rq/AHfYOFXDyw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1we9tN-000PL2-9D; Mon, 29 Jun 2026 12:11:09 +0100
Message-ID: <74e05f3d-39a6-4a4c-8bc3-d4f23a54ef69@codethink.co.uk>
Date: Mon, 29 Jun 2026 12:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: fix missed le32_to_cpu()
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
 <b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
 <20260624192205.4485cd61@kernel.org>
 <2a92fd9d-42b3-4564-b784-ec504d4d82b8@bootlin.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <2a92fd9d-42b3-4564-b784-ec504d4d82b8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_044535_743828_42F80B96 
X-CRM114-Status: GOOD (  14.14  )
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

On 25/06/2026 08:07, Maxime Chevallier wrote:
> 
> 
> On 6/25/26 04:22, Jakub Kicinski wrote:
>> On Mon, 22 Jun 2026 19:51:39 +0200 Maxime Chevallier wrote:
>>> Hi Ben,
>>>
>>> On 6/22/26 16:37, Ben Dooks wrote:
>>>> The print in ndesc_display_ring() sends the des2 and des3
>>>> to the pr_info() without passing them through the relevant
>>>> conversion to cpu order.
>>>>
>>>> Fix the (prototype) sparse warnings by using le32_to_cpu():
>>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorrect type in argument 6 (different base types)
>>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected unsigned int
>>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restricted __le32 [usertype] des2
>>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorrect type in argument 7 (different base types)
>>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected unsigned int
>>>> drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restricted __le32 [usertype] des3
>>>>
>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>
>>> I agree on the principle, but this isn't a fix so this'll have to wait
>>> until net-next re-opens :)
>>
>> Humpf, why are we not seeing this on x86 allmodconfig ? 🤔️
>>
>> $ make C=1 W=1 drivers/net/ethernet/stmicro/stmmac/norm_desc.o
>>    DESCEND objtool
>>    CC [M]  drivers/net/ethernet/stmicro/stmmac/norm_desc.o
>>    CHECK   drivers/net/ethernet/stmicro/stmmac/norm_desc.c
>> $
> 
> Heh good point indeed !
>    
>>>> Fix the (prototype) sparse warnings by using le32_to_cpu():
> 
> Ben, what's this "prototype" sparse ? a custom tool of yours that
> you used to find that ?

I have an RFC to add variadic and thus also printf/scanf formatting
to sparse. This is waiting on review after the original got re-worked
to add scanf and a few other bug-fixed and shuffles.

Ref: https://marc.info/?l=linux-sparse&m=178185274600679&w=2


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

