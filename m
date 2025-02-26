Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A5FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 01:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AjpPUgwyW35ZlY25/RBMK6h76d3ORQR2twl+cHmmAE=; b=1MgZwS+hqaVVe4H7THQsoEwjS0
	akNSH6nPW9wl5AAClNs2Uo2vQX8pkGziZUxvSRI6VKwUJvBwWvdki5oExj2VacNIgl3x+CCAc+7ps
	Eii4y+ZkNm3ApVJ74JpxKOEdH/HLowAIZYFnljRg6RuoZOw4mb0ucttdiflhDg9tcA7suo3dKsIRx
	p0qw1fHj74tvJxYtAMBSxnGsNExIlI5vYVIaOc191qsFq5C4LFmyHyznypOYyETLFn0w6C4slagzk
	T2Zes2BpyyviP+ObikmzERPSoIAn4+5XQQ0WHtjDxJ0IioGRO+5H/TTVxNv5W/8YOWmrnjojQtval
	MPkyC7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6hO-000000024Cm-0lw2;
	Wed, 26 Feb 2025 01:58:58 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6fm-000000023jx-2Tko
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 01:57:20 +0000
Message-ID: <3db2c2fd-5125-4664-83d0-a0706ef2050f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740535034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AjpPUgwyW35ZlY25/RBMK6h76d3ORQR2twl+cHmmAE=;
	b=vuy8I0AX2kkd1NjVZbGg37cUhDQeJMeKe5nEoM65o5UfhKmbIqzYuU9pBMUWsU4YmLjjI2
	gjcRzkpsMyaCXuTGcI8mbvFGA+9gy8a/YMGgFP3LeKxcEvr+aB1+fNGWNe/JLmacQq47RQ
	FKRd9rCECzhjSHl8Z1zYg+AfqpPSUeM=
Date: Wed, 26 Feb 2025 09:57:03 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 2/4] stmmac: loongson: Remove surplus loop
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-4-phasta@kernel.org>
 <437d4fad-6cd4-4f90-a1bb-07193d015cad@linux.dev>
 <7df6e1846ed6932c789a913c6a10aa8df5e26519.camel@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <7df6e1846ed6932c789a913c6a10aa8df5e26519.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_175718_829380_58A967B6 
X-CRM114-Status: UNSURE (   9.48  )
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


在 2/25/25 5:15 PM, Philipp Stanner 写道:
> On Tue, 2025-02-25 at 17:06 +0800, Yanteng Si wrote:
>> 在 2/24/25 9:53 PM, Philipp Stanner 写道:
>>> loongson_dwmac_probe() contains a loop which doesn't have an
>>> effect,
>>> because it tries to call pcim_iomap_regions() with the same
>>> parameters
>>> several times. The break statement at the loop's end furthermore
>>> ensures
>>> that the loop only runs once anyways.
>>>
>>> Remove the surplus loop.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> It seems that the fix-tag has been forgotten, next two patches as
>> well.
> Not forgotten, I just think that patches 2-4 are code improvements, not
> bug fixes.
>
> The issue in patch 1 would cause actual misbehavior (a useless debug
> information print in case of a resource collision), whereas 2-4 are
> just ugly code, but not actual bugs: the loop always just runs once;
> and unmapping the PCI resources manually is valid, but obviously
> unnecessary.
>
> Agreed?

You bet!


Thanks,

Yanteng

>

