Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23736CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 11:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ntgtEMvcQj5lBXisx5rT6ZbhVQHfnuBooqnky1xiy0=; b=wtWiSr8ETc64OB0DOSZBRlsKKn
	KX9G/daOS//lbuTG5UKpAFrzL4yMwVzKQJhQmrGx9BxMDFs3H5rldUi8a245m8DaQAPKbWsZwVxTQ
	/smNtZl6B54Nsdp8UZ1w/6yXBqgi+ff95sPSC09BK+dUS+TKeX+MS7GoeS0ejTed3jxo9BKGaD6//
	hkSUnLVfNQGlVEU/zGcafHmwMgGoCjZprjsU9cLKV/9tnvJ6tqimqlIPAU25+sm1GNajhDHWvjzDU
	kjNaAkvXI2zGsjjWVY1GrkXI7SiMKQgJ5dmXH90IgC3+P5pHYyD3Ekq6W2mUG/7ilQhJZM+QzAP3g
	zy3CcTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQYg-000000042cq-3qY6;
	Thu, 30 Oct 2025 11:11:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQYZ-000000042cO-0ofH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 11:11:09 +0000
Date: Thu, 30 Oct 2025 12:10:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761822660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ntgtEMvcQj5lBXisx5rT6ZbhVQHfnuBooqnky1xiy0=;
	b=U9X+QRUb/N748dXlwxULspa4EVDIWt3d3RMdB1xNf5ecq86ft4ExuSZjUNemFEMRa1NxFR
	/B89iY7SWf9rBmtCaW3HXTT3vhX5BDtkScthNs7FUj67AdKq7fhHBFNBCSar/WNbRZbQ/y
	4vQZjtn4e2xgsAX9/B11gZlE92eBUWNTt1vLuKgTQzvewdnjT0dCQFk9pBTIUjYm0ZBfKS
	MJX9cqyFvU3cEl5gj80tsaCg4d1bV5GhgP8ttKvufIxXfbx2Sn8eLLsgK4t5OtOl569zFc
	3LzRMWt7gixAkNeEIJy4IIbU3cY2+91vJTx0ObPPQj0lb5tJDe3iPMRpoB/+BA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761822660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ntgtEMvcQj5lBXisx5rT6ZbhVQHfnuBooqnky1xiy0=;
	b=X+vK3xicSBKAOBaV1PaN8ZoRGMqKsd9zdg3We+XXvPY2Fh0yiWQ4c/tnBxezIj2cOvTmO/
	I0b9hhdlj2SZQyDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, tglx@linutronix.de
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Message-ID: <20251030111058.TNDQmuHk@linutronix.de>
References: <20251030072339.63vdFNo3@linutronix.de>
 <20251030074507.33863-1-xieyuanbin1@huawei.com>
 <20251030075558.sUBj8_6U@linutronix.de>
 <aQNAEtIoU9sEx3LF@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aQNAEtIoU9sEx3LF@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_041104_235135_CA78821E 
X-CRM114-Status: GOOD (  14.44  )
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

On 2025-10-30 10:38:10 [+0000], Russell King (Oracle) wrote:
> On Thu, Oct 30, 2025 at 08:55:58AM +0100, Sebastian Andrzej Siewior wrote:
> > Arm64 and X86 replaced the stop_machine() logic with something else that
> > does not affect latency in that magnitude. If Arm could something
> > similar then fine but until then I don't see a way around it.
> 
> "If Arm could". For 32-bit, Arm Ltd isn't going to do anything, it's
> old as far as they're concerned. It's up to those participating in the
> kernel community to maintain and look after the code.
> 
> Thus, if there is a desire for something other than stop_machine() then
> it is up to those who care about the issue to do something about it,
> rather than expecting someone else to do something for them.

I fully understand. I've been told by several people to repost my ARM-RT
patches because they ("as in "the SoCs") appear to be of interest in
years to come. As individual vendor promise to deliver their SoCs for
10y+. It also claimed that new products appear with these SoCs. Now that
we have RT support in upstream kernel, ARM is one of the missing
architectures that was supported out of tree.

Having jump-labels disabled is what we had in the ARM-RT queue since
jump-labels were introduced. From around v4.0.8-rt6 it was considered
safe and enabled for x86, powerpc and arm64. From that point of view I
don't see a regression for the users.
And as you said, if there are ARM users who care and have an idea how to
optimize stop_machine() away they are welcome to post patches.

Sebastian

