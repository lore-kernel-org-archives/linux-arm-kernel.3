Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EAFCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qidRa2FBgCR2y0sBJPJyGy5f82k6s8UrQ9M/kGZ7II=; b=o6lWGSh+PohWEDRmf6jO0dLaof
	URfVxyAhfCZDPKJaxhYeSRLyzCl72AS+9iuFBeA9N+uvAfz3Wft6bQO/rYEzxYNr2NliNM5S5HoNU
	j7VpqoR2DllqaUsMQR/+14KY9Qs4XJFFeKLBnPp1A5Pqgyt4SyrLIeHtcKu13tjy6Jnd66orc4VmL
	Rnt/Zo0/BB0Ow5qTmvkpZIploqL+JGW3DpkBTR+XEFkTjlNEuhQG1BFAoqmHMUzt63Kn/eCwwtnOm
	H1BZ4S93NdkZWBygwdx54rRmfyGjjgKNPasGM9LKOPcDUmZcp7EKlxVLATPKSSpyJ9SRDBzocgi5T
	P+4dTFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkj2-00000003Q6J-14G0;
	Fri, 16 Oct 2026 16:24:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkj1-00000003Q6D-0Bfr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9qidRa2FBgCR2y0sBJPJyGy5f82k6s8UrQ9M/kGZ7II=; b=kG5O99WWx57bXaQoe8GXAjlUHc
	72OqcLqM0sb1J7jxYTUDhvOp/q5rhKXd/TDxxD/K9LKhsVGK7sghSfDchwMTcUbaEzalE77OWZpBn
	4RiIZ0Hf6yM284cuCbQA5DcjIdyzuwgu4P+azlhZ7H815Hld8UZtOlR4oG+Cwk3lZy2PCz4qlSkiZ
	TZnHITeuQzg++SKwnyVCBt74U35WBzAl6qqYPgj8TJkT863Q/4Ri0KIM/zWhP4uee0LfQ5Z77SYh6
	lMsBqP+h1OCuv4eqm26oPFd8wsIVqNy/ghkoXfVMwXChaGry34lt6iZBJ29Al6NDy9X50BtJ40F5J
	Z2rg7wvw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHkix-00000001jEL-3Prr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:24:05 +0000
Date: Fri, 16 Oct 2026 18:23:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792167838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qidRa2FBgCR2y0sBJPJyGy5f82k6s8UrQ9M/kGZ7II=;
	b=DKozTNJEW2AwvZQuAgQg2+mTJJGqe+kkw/MO1d4Yqtn+W9a/xKdX3KFkLlnxMvjL2+pQg8
	dbyE11B6RrL1FCd2fRh4+97Ce5LXbqRmzoasHYW1ZD11taY+6lc56+dnqdpvZCHvu58aMK
	LcdH6V8qt8R9XEBaTR7+jhsH4xa26S/l2heU/8P1OiKbMUsMFmJVj3TBbjBpMU0i45hY+J
	i62t/yY5DOV9iYt265DWMnjMwGlPVrY0xgLrB6lVpB2w8STHezLO8cFe4y7qQrxvI63BvL
	0+G3pQaRkxI2+I5D2BubbY8CohV3UtJbdWjwKtnR6ZsE4h6V4Pa9mGZI02mPOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792167838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qidRa2FBgCR2y0sBJPJyGy5f82k6s8UrQ9M/kGZ7II=;
	b=qYj/q64n/vggtFXpYq0P7zeGT3FC4Vf5ih14OTPFnqEExbJEnVjqq8Ol4VxNbQt+7y26aT
	89OYe8ZEwBZ4vgCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: tanmay.shah@amd.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Harini T <harini.t@amd.com>,
	Saeed Nowshadi <saeed.nowshadi@amd.com>
Subject: Re: [Q] zynqmp-ipi-mailbox and SGI interrupts
Message-ID: <20261016162356.m2X9jbCa@linutronix.de>
References: <20261015083937.8SDbdK8P@linutronix.de>
 <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_172403_959871_8CA09ECA 
X-CRM114-Status: GOOD (  15.46  )
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

On 2026-10-16 11:10:29 [-0500], Shah, Tanmay wrote:
> Hello,
Hello,

> Thank you for your email, please find my response below:

Thank you for your email, too.

> > So is this SGI-IPI a thing or not?
> > 
> 
> Yes it is. Ideally, TF-A and Linux can share the IPI. If the IPI
> interrupt is used by the TF-A and the expectation is that Linux mailbox
> work on the same IPI (because all other IPIs are busy) then the work
> around is, TF-A will generate SGI for the linux mbox driver, and the
> mbox driver will use that SGI via device-tree.
> 
> It is a vendor specific use case. So the dt-node for this use case, may
> not be available in the usptream kernel, but can be enabled if correct
> SGI is configured via the device-tree.

And it has to be a per-CPU interrupt? It can't become a regular
interrupt which is not per-CPU? Does the driver at some point access
per-CPU registers?

> Thank you,
> Tanmay
> 
Sebastian

