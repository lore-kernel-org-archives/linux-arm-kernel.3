Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198C4C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDqIhnfMGOEBsHIK3AXBwKMCBJZkRn86a2UKdEtgzqc=; b=Sdzin18AQmi//J9+ECsnWzSaTA
	A8sBFS2Krb6hROxhNA+DE714rK8aT9V4q8HDvh/LGXhvlDmOzTTtKvGWbAijkKS50HxdBAuRvj8ZS
	AAbHHW71c8CUAQZ5utMw3HSWnNYES8cGA0I41zRIqCwq0hkDI9FoNeO0pviP3xE4LOquMuUy+0bqv
	lZkxWM7y3hqQHiYre4DBXzVKZKLUBCCQILMuQGZzZ9CH927khZHA9iMyMyCd4ynXJ8offkByfNfzb
	LvzZDCvay0Jik0a4w2rAAAXcgFyzHIowkLhanc1F/822V8r2vjXvHSttk7IMleD8A9YKIkPw6ben+
	gN2551Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvylB-00000006LqR-0l2Z;
	Mon, 17 Aug 2026 14:56:21 +0000
Received: from devianza.investici.org ([2c0f:f930:0:4::108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyl8-00000006Lps-0Nu2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 14:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1786978575;
	bh=HDqIhnfMGOEBsHIK3AXBwKMCBJZkRn86a2UKdEtgzqc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Ex2W/buRl2T/xe9fQ1CEv6ToaAvYN4HEWiZzbRq9ZWwYBjQD+MDBLv5bTVHGzC76q
	 Li/v24rtiUHNaM+Q/tjrf4pqPSsSSsUIXJaDoZKEvzwERugUf4q8Iy94+v7FEMyjhn
	 ayAEvkppH/1LRMns6FwAK+YGtKF0YbU6CbPrC9Ew=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4hNwrb2wqTz6vKm;
	Mon, 17 Aug 2026 14:56:15 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4hNwrb037lz4y6W;
	Mon, 17 Aug 2026 14:56:14 +0000 (UTC)
Date: Mon, 17 Aug 2026 15:56:16 +0100
From: Bradley Morgan <include@grrlz.net>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: broonie@kernel.org, catalin.marinas@arm.com, gshan@redhat.com,
 kernel-dev@igalia.com, kernel@gpiccoli.net,
 linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 robin.murphy@arm.com, sonicadvance1@gmail.com, will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64/kernel=3A_Expose_the_run?=
 =?US-ASCII?Q?ning_CPU_of_a_native_task_in_TPIDRRO=5FEL0?=
In-Reply-To: <5c95bd13-993f-55be-4aa7-acb990738d91@igalia.com>
References: <404DF303-5478-4B5C-9DE1-3A7B3B3927A5@grrlz.net> <5c95bd13-993f-55be-4aa7-acb990738d91@igalia.com>
Message-ID: <8D39C503-B4D3-409B-A5CF-0E7E3924CB5D@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_075618_283610_63512D1B 
X-CRM114-Status: UNSURE (   7.76  )
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

On 17 August 2026 15:51:46 BST, "Guilherme G. Piccoli"
<gpiccoli@igalia.com> wrote:
>On 15/08/2026 13:52, Bradley Morgan wrote:
>> Hi, we meet again, :)
>> 
>> Well, I looked at this assembly code until I was blind,heh, and I
>> couldnt particularly find anything bad about it, well, I know I'll
>> probably get these arm pros saying I'm dumb or something for not 
>> noticing a mistake, but I don't see any mistakes asm side.
>> 
>> 
>> For process.c, I really really like your comment, it's, straight
>> to the point, did your LLM write this, or did you write it?
>> 
>> For your patch;
>> 
>> Reviewed-by: Bradley Morgan <include@grrlz.net>
>> 
>> 
>> Note: I hope I don't get plonked, I couldnt find anything wrong, but who
>knows
>> Thanks!
>
>
>Hey Bradley \o
>Thanks for your review.
>
>I wrote the comment myself, but LLM helped me with ping-pong reviews,
>for example, checking corner cases, commenting on potential ideas. For
>example, in a first version I just updated this write_sysreg() to the
>CPU id, but then started to think "why am I doing this if the register
>is updated at every exit?". "Talking" with the LLM gave me confidence to
>suppress this write, due to the reason well explained in the comment heh
>

I Read lore! Turns out I'm dumb for the asm side!

But ohhhhh welllllllll.. heh

>Cheers!
>

Thanks!

