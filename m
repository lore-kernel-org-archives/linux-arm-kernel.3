Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB9C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YN3sYYqWGZlKjkA6gYrQ6pElS4/hhWwv629F1RQvukY=; b=rKWCBQ2lXqKVyUpErTJbCrIzQL
	VPC0POOpgdQzjMMdFSSbYYOURzt6AaBueQzqUJUPvIDYbtdDlIBInnpBmKXpsU1DNwaXG9cFx/OaJ
	Tk8xEyu5QV64sUw8Q157eAceawfUeX6Xeldhsxc83+FplIdT7Uh3HVj6hnQ5xRsr6S30ZArhBkcg6
	J9IMjkcFmJ+VSUJGALmXlSxB6Hg+xinmlDy7G7iWXf1lznu8Ct24ERCKg8OLEUR5nzoDWiE7Pp97U
	7VRVvcNTDcxJcmAaKLTbse2IAobFf8yVM3tUgUbCoFm/mevicO35otF0CgeGG84dE2B38eDShTMgv
	YNGJDQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUgI-00000009pdD-2bK5;
	Mon, 12 May 2025 15:03:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUFB-00000009kTH-3XPq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:35:03 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747060500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YN3sYYqWGZlKjkA6gYrQ6pElS4/hhWwv629F1RQvukY=;
	b=UfV4s2uuq/z+B6gS8GmEjQaM/Q0ckAF+itZ4WtgikrFbrgn5p6yu5IEJMDC8RxLB7Q3SmA
	ZXSfe/5Gs+/OmW+CFT1/FqLHhH2M1RW5UWttnFAXT5fWEeUoYN/+5FnkgycR+F+iewtaOg
	xOI7w0m+FTsO2wVtg1oGgpbile/2c5SVIiUyP4zjWive7u6nbKpQB/fIPxrZZeqwpkntYi
	RcbtGkJjX63liuBXYTQQiJn6ZkGH3BRheGvTanVPS6VmLk6ysUozCM4J6B4zhKHN4h4Qen
	a0cfiSnMg3q0gMm9LGBQjWfscYhYpjAMQ40dkrmH9Q+dSEaIU6PlsACG70z7Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747060500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YN3sYYqWGZlKjkA6gYrQ6pElS4/hhWwv629F1RQvukY=;
	b=jPprHUwRCrf3AUAZZXINoE6jX97SSMwFoXA9i6t1odHUBOSwC4Z/plitwsIx2iY1VKSIp2
	IBsoCRO8oOdigeBA==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 2/4] irqchip/gic-v3-its: Implement .msi_teardown() callback
In-Reply-To: <20250511163520.1307654-3-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-3-maz@kernel.org>
Date: Mon, 12 May 2025 16:34:59 +0200
Message-ID: <87ecwtlwx8.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_073502_028119_11998187 
X-CRM114-Status: GOOD (  16.90  )
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

On Sun, May 11 2025 at 17:35, Marc Zyngier wrote:
> We currently nuke the structure representing an endpoint device

How is we? We means nothing as you know :)

> translating via an ITS on freeing the last LPI allocated for it.
>
> That's an unfortunate state of affair, as it is pretty common for
> a driver to allocate a single MSI, do something clever, teardown
> this MSI, and reallocate a whole bunch of them. The nvme driver
> does exactly that, amongst others.
>
> What happens in that case is that the core code is buggy enough
> to issue another .msi_prepare() call, even if it shouldn't.
> This luckily cancels the above behaviour and hides the problem.
>
> In order to fix the core code, let's start by implementing the new

s/let's//

I really have to understand why everyone is so fond of "let's". It only
makes limited sense when the patch is proposed, but in a change log it
does not make sense at all.

> .msi_teardown() callback. Nothing calls it yet, so a side effect
> is that the its_dev structure will not be freed and that the DID
> will stay mapped. Not a big deal, and this will be solved in the
> following patch.

Now I see why you added this incomprehensible condition into the core
code. Bah.

Why don't you add this callback once you changed the prepare muck, which
introduces info::alloc_data?

Thanks,

        tglx

