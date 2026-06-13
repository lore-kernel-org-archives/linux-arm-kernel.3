Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701EFCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Syw7ULXdB5dW8ZcIfM7qGgtXBrTWdNGVXAYsbJq7l1s=; b=CAPS005jv1WKYGEzUsrQM2m/2w
	xoZePSftTwue/YKnhVy3NrOdIxF1KeYo5PmNP+VYq8am41/bA5y9pSfRTUBpb8gB0PW0NT7zcknrZ
	z6skTw0ZJ+/yJmyTif6sxd7TFQoCScIf8zY0+IB/n9MHt0E6jG5U7qx7l+Phc2BbpArArFhPDiJzI
	orSBp8kbdRhrUPaa+keeImxgox5IebZYPhCeej0dGpk8cftnmARHilWCaPpSyAy10PLQphHsTMq92
	iHkOnlyJzRvpmI/SdnDZK3DZ/wCbr2/o0WLZ0vhgAy8s3zfivvE/+hRy12383Lp88JzYRu6r6Svr/
	99SDzf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYHWS-0000000BzGM-3Mxg;
	Sat, 13 Jun 2026 06:07:12 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYHWL-0000000BzFg-3ABz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:07:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781330818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Syw7ULXdB5dW8ZcIfM7qGgtXBrTWdNGVXAYsbJq7l1s=;
	b=M880zC7u2byTFN+N4Gq3ygEGJV6uJ/y323l98Uq2VwiDsDKwwbe3KSZIsE6fswnZXAIDQM
	ncME5PeWmLbP9V5sIdSHUE8XEIhJI9+8OEhIAu5FhcUJagvyZNVQOVT5s3ZSRIrP6Q0Swr
	Ebk61m5Zsus12EN++gCjPlzL6R/lrYY=
From: Lance Yang <lance.yang@linux.dev>
To: dev.jain@arm.com
Cc: ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	kaleshsingh@google.com,
	21cnbao@gmail.com,
	david@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at allocation time
Date: Sat, 13 Jun 2026 14:06:37 +0800
Message-Id: <20260613060637.40039-1-lance.yang@linux.dev>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_230708_118070_93C352B0 
X-CRM114-Status: UNSURE (   7.47  )
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


On Fri, Jun 12, 2026 at 04:44:22AM +0000, Dev Jain wrote:
>Introduce a boot option to tag only at allocation time of the objects. This
>reduces KASAN MTE overhead, the tradeoff being reduced ability of
>catching bugs.
>
>Now, when a memory object will be freed, it will retain the random tag it
>had at allocation time. This compromises on catching UAF bugs, till the
>time the object is not reallocated, at which point it will have a new
>random tag.
>
>Hence, not catching "use-after-free-before-reallocation" and not catching
>"double-free" will be the compromise for reduced KASAN overhead.

Hmm ... do we also need to teach the KASAN KUnit tests about this mode?

With kasan.tag_only_on_alloc=on, free-time poisoning is skipped, so
some UAF and double-free reports are skipped on purpose, but the tests
still expect them :)

Cheers, Lance

