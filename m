Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812AACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gr+iTa6I2/obiorgX/iYvIq85HArhg0aBMc30DEux0I=; b=mIuQs8MG1yxTtXYO87Rzm8PRpV
	9lyQYPBGZkndspCfInOhVsyKpxKewFVzaSHka35hOkjK6gNPA3MM5C5J/JsYZ0Nn1Ol6vlI0RYhdF
	OmAJ1M5vRhE+D9XtfjafOI7Ilk6KKy/b/soGAbABkaVU5Ei8mTcSi++3uHr44ft+P/2kFmcoMmStg
	ncp/yGC852VJMUssUvB1hg1zh8656J9tiy8SEvTQLzlmroysKQlAGTOIpR7GFoPR785fetU6u7CL2
	MfPvgntQ0hPAhExKybBqoDdcGFJFdip6nDAwRzHbeclAz6zm/T/NCLGF6v7OUKl4MPldu6ByHJm2f
	Q73titOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Ie-00000007GZ6-0bwu;
	Thu, 23 Oct 2025 18:44:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Id-00000007GYO-0HYr;
	Thu, 23 Oct 2025 18:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gr+iTa6I2/obiorgX/iYvIq85HArhg0aBMc30DEux0I=; b=e40IUSNu5q974NZDm0Py1ZNpAz
	/1OLMkKUH3IJ0Mn1CK6yFzCmGpxefM0+t8qNqvj2NXUld9VeyPjHzafZjwXEgLeAKT9E/IntXUkti
	pmzpN+Gte76PMKvAF74i6zKccltqJ0sMtl+NALMvcbcXoSkOx23Wyjiq/dgN0KGVz1B1lx/fbkgLM
	NCwF+7PPZqmNKm+5HOXToiADhNGXngvggojJOdq1PXIkvbD/BRwcvw3OQbGNFJUgcxewE7B4h/Xem
	63zVDWegGFB2WNY/I7HydGxHHeIGz9jDM75xuCM+/xENIfM4nHfjdRCwxH/ZIxJ2p0ioumgQ7LWbi
	vWB4fMVw==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzQu-00000001caT-3uSL;
	Thu, 23 Oct 2025 17:49:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761245054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gr+iTa6I2/obiorgX/iYvIq85HArhg0aBMc30DEux0I=;
	b=Z6JyVVvXaWOYv4K7XWupHxBpzZlYpgf5Va2pTz0xKoekHimqy8m9kpzWJR67k8NTSge6Pu
	pj1eoQeYp8npSoNhcmRFl+wtklkvdSbntGU/+ZU+VkEYhATJ/2w67pfLl6NrKzFL8YkFBj
	tz+RIae+Vg6+/gA7ZwvSAx8jyyfFhHWoerQNsfsX8vZwG++ZSmVquE3u5d9Qky5u/pWhfe
	Z27mkNjesStYEnSIaLWsvH9GU2GdvVJ+/1wsaxCCyTnv7bk0dW7oyVKDPvU36ZH4tGdIz0
	SAAZZgn3S2Kdp9w4d8AFHEvN5ZwXz+cPMrMK16HbkBELjB3xvZYnc/4yMJ00yA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761245054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gr+iTa6I2/obiorgX/iYvIq85HArhg0aBMc30DEux0I=;
	b=k2PqTysZqIKK5wnAuNAF6YkOs1yYrSVeb86wNNECOCJRF4fnFtNx18Z5K79S+1+JpepjUk
	+w4iQ08K50QRq8Bg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, kernel
 test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
In-Reply-To: <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
References: <20251022102427.400699796@linutronix.de>
 <20251022103112.478876605@linutronix.de>
 <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
Date: Thu, 23 Oct 2025 20:44:13 +0200
Message-ID: <873479xxtu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_184905_083212_C50D324B 
X-CRM114-Status: GOOD (  17.85  )
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

On Wed, Oct 22 2025 at 05:16, Linus Torvalds wrote:
> On Wed, 22 Oct 2025 at 02:49, Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> From: Thomas Gleixner <tglx@linutronix.de>
>>
>> Replace the open coded implementation with the new get/put_user_scoped()
>> helpers.
>
> Well, "scoped" here makes no sense in the name, since it isn't scoped
> in any way, it just uses the scoped helpers.

I know. Did not come up with a sensible name so far.

> I also wonder if we should just get rid of the futex_get/put_value()
> macros entirely. I did those masked user access things them long ago
> because that code used "__get_user()" and "__put_user()", and I was
> removing those helpers and making it match the pattern elsewhere, but
> I do wonder if there is any advantage left to them all.
>
> On x86, just using "get_user()" and "put_user()" should work fine now.
> Yes, they check the address, but these days *those* helpers use that
> masked user address trick too, so there is no real cost to it.
>
> The only cost would be the out-of-line function call, I think. Maybe
> that is a sufficiently big cost here.

I'll have a look at the usage sites.

But as you said out-of-line function call it occured to me that these
helpers might be just named get/put_user_inline(). Hmm?

Thanks,

        tglx

