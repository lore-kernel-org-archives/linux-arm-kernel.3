Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138DAC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RB9GJiRFJg6/bN2vnJM4vC1ljE25oPT92TiI7BbGuH4=; b=BfK6ogAl0zDEOOmJNQq2m8Hzjt
	TUDedq5gSeIjCEcZxPC6kR9VzmSKSJuKjswZAP8+zbvT7saAWphOdJ4yamiWxl8Ll1R3F1foeQYwV
	0BAaeSStl2vvfrMtd27a5fztCCXCbMS24gu8m+k/eG4YXwZSxNnbcFh908lrP+P0U9vzZdx8jHAV/
	7UyA1SLOMjiF11ahkiNn/pxApQVAU6KjpOeFE6FMyoFtdK85Y/Q4ynqPQk68UwIQRxqOY/HXEKl/3
	kT767iIIu3SCuam0bfNVlvoQeNZQApiuEe6oej6l3IjlO1AYelZ1iiQcZnZITulViGQ3ZMLzQGVuI
	xMZaOf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3w3-00000005xbx-3Lvt;
	Tue, 25 Mar 2025 13:03:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Zf-00000005sU8-0ifc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 12:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RB9GJiRFJg6/bN2vnJM4vC1ljE25oPT92TiI7BbGuH4=; b=Hhg98WCnsua83pWeyAI5CpUMJ4
	z3rHscl85jBNDm+EvMLR8hNhPqiC5bm92sWWQh8PfKSa73fW7HOL+2rDbGdAPj3l6B/3v3tRFN5Bb
	wdRTuNXLf/+h+PzTi/DSFBqt1Y7I0F6WUmBF2iMLBDI4wGLAVm8p30O59gf0ZaLm+SsSb8lSRhV7z
	83nQUzBDty0pdxIRaqkkdp+x8SR1LjmI78PbonX7WjN4atT/T140IsAojGG46KSVqNCOXgHn6CnhI
	uqJCRpjimPCK4C9EvhsFfxPYAI4MUEglr+wKohmpb0ik91tROKy3ANxup5VWGfuVJ5+ak9FHNKGOu
	3mbSpKuA==;
Received: from fw2.prolan.hu ([193.68.50.107])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx3Zb-00000005PyA-02rM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:40:05 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E788AA05BE;
	Tue, 25 Mar 2025 13:39:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=RB9GJiRFJg6/bN2vnJM4
	vC1ljE25oPT92TiI7BbGuH4=; b=S9dATbHQKVhWMebPspBcq6wTeWmup9sX72Kh
	N6n2EOKfMxJ8hfo0eTHPW1XJagCC0ai0nBmCHIVy4CcHtuy/IXnIgexI30R+GdNl
	duApg87u5HRR6AeTK/YocuQ6l0qO/UdIfXUct1soL8X9PKv9cQq0h1NBt2X0kI5q
	+lEN+F2l2JIQI486Y6hh0CZEyKqP0TkDztsZGjlE3Uso/PHsCX1aGKhdGaqF1Rjl
	+yZcvJGLae6yNEZgZGvIv3HmOOj4JjKAWu/0xAH4uJW4swwIiqcoJFiSrmskdLTm
	7Y8ihLBis0RuF6MM+NSrVlSq4oBw/2dK9YHX3tSsi05orp7W06buvBssdGEA9Ovd
	fZ2XqrL02cu625TnlTkTjrZBBs2DMjBk09f03HHe3wJhNAcqCHG5HmRSwsqLkJ0d
	szXn94T4iai0+JUcFgko07Kg+uYwgI8hpnU+wrH90xaphxeVtGYJzCpqbXd6zy/A
	5z8DotmD6V5RMOrH2eXdQhM8tJTAkLeUyWinSo3HCsKf8NIzqB8pJz95XaMWGHH+
	1PqX1GnooCT3EhMYUffDfPUnOWlwoeOhS5ygusL8nLXtNLTMmYRquF+i7C7zWzVM
	kwqMGcHByQCN9+ea0sgxkir8QTN4PyVDIzYVihd/v0s3gW9o51tuF2S0SEKD2pDk
	+07bpVg=
Message-ID: <bd7b31d8-be25-4dbc-9a81-4b0cccd64798@prolan.hu>
Date: Tue, 25 Mar 2025 13:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] dma-engine: sun4i: Simplify error handling in probe()
To: Julian Calaby <julian.calaby@gmail.com>, Markus Elfring
	<Markus.Elfring@web.de>
CC: <dmaengine@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>, Chen-Yu Tsai <wens@csie.org>, "Christophe
 Jaillet" <christophe.jaillet@wanadoo.fr>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Vinod Koul
	<vkoul@kernel.org>
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de>
 <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
 <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de>
 <7afcbbee-6261-4b2f-be14-a3076746d53c@prolan.hu>
 <26e36378-d393-4fe1-938a-be8c3db94ede@web.de>
 <CAGRGNgU7t85oG3Bq7L3KjKUAbRyd6SHSM6F6BvmdXDVkbNegKg@mail.gmail.com>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <CAGRGNgU7t85oG3Bq7L3KjKUAbRyd6SHSM6F6BvmdXDVkbNegKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.37.248]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526C7562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_124003_336741_3D49D52E 
X-CRM114-Status: GOOD (  28.87  )
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

Hi Julian,

On 2025. 03. 25. 13:20, Julian Calaby wrote:
> Hi Markus,
> 
> I really wanted to keep out of this, but...
> 
> On Tue, Mar 25, 2025 at 8:14 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>>
>>>> Implementation details are probably worth for another look.
>>>
>>> What don't you like in the implementation? Let's discuss that then.
>>
>> I dare to point concerns out also for the development process.
> 
> You're "concerned" about patch granularity, but this is not the sort
> of thing that some random person would raise, this is the sort of
> thing a maintainer asks for when patches are doing too many things or
> are unreviewable. This is neither. It is a very simple cleanup of a
> probe function as it says in the patch subject.

Exactly. That's why I asked if it broke something on Markus' end, 
because it is a really specific thing to nitpick about, especially in a 
changeset this small. So far, he did not indicate the *reasons* why he 
thinks this should be split further.

> Futhermore, this already has an ack from the maintainer of this file.
> This indicates that they're happy with it and no significant changes
> are required. This is also version 6 of the patch, if the maintainer
> was concerned about this, they'd have already provided some clear
> guidance on this. If you check previous versions of this patch, no
> such requests have been made.
> 
> Your only other "concern" had already been addressed as has already
> been pointed out to you.
> 
>>>> Please distinguish better between information from the “changelog”
>>>> and items in a message subject.
>>>
>>> What do you mean? The email body will be the commit message.
>> See also:
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14#n623
> 
> The email and patch structure are following the format outlined in the
> document you link to _exactly_.
> 
> 
> Once again your comments are just noise, and your insistence on
> repeating them over and over and over and over and over again is
> borderline harassment.
> 
> You have been told to stop this nonsense many many times, here's a
> link to the most recent one:
> 
> https://lore.kernel.org/all/92d1a410788c54facedec033474046dda6a1a2cc.camel@sipsolutions.net/
> 
> Please stop sending these emails and go do something constructive with
> your life.
> 
> * * * * *
> 
> Bence Csókás, (I hope I've got the order of your names correct)

Either order works, Bence is the given name, and Csókás is the family 
name (surname). Hungarian and Japanese order follows the scientific 
"Surname, Given Name(s)" order, but commas broke many tools, including 
Git < v2.46, and b4, so I switched to the germanic "Firstname Lastname" 
format.

> Please block or ignore Markus, at best he's a nuisance and at worst a troll.

I'm still open to hear him out if, and only if, he can give *clear and 
valid* reasoning on why he wants to achieve this. I'm a generally 
understanding person. But if it's just hand-waving and linking to the 
same page over and over again with no explanation on why he _thinks_ I 
broke SubmittingPatches, then I will do exactly this.

Lastly, to all other adressees, sorry for the spam. So let's end this 
meta-discussion here and keep the rest of the conversation professional, 
reasoning about the technicals.

Bence


