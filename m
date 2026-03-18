Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344A7103E176
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlgYJgsDCBdT6+klGD6mIBOkkF0hpYpPSTTnp614c+0=; b=VSr5DPQwuKAEOf0J16IaZyBGUs
	Cg5M+NVNhhoWQ2txWp15IUWN2OevkPzghAlnvf+oHvw/VmyO7sPZHJm4ozAgGSgCIYMTLTaeqZfFF
	85qkBh4+Cjokpaef9LrW02yn+Z5k4+rlRv0eLoFKpL1Wq1zqGelaRMPpRuhQVTwcR1sj5ZMEhh3qr
	NRbgAL+Ng9T28Hz8lKrsR/hZuyizaxQmdq93X3vQsQDnKqy/S6h3XnHXm6fU0i7wtjeV87lrWfFvt
	IqQMQ2Mbz2nDjj60r6TChgUvOUpcdU0seX8sy3wHi941TTjw6crQu8co57Xc/IHSPH6HBJmEHCMLG
	nlmp1TQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qi7-00000008SNU-3a2x;
	Wed, 18 Mar 2026 13:13:19 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qi4-00000008SMz-3kOy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:13:19 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 22852140003C;
	Wed, 18 Mar 2026 09:13:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 09:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773839595;
	 x=1773925995; bh=VlgYJgsDCBdT6+klGD6mIBOkkF0hpYpPSTTnp614c+0=; b=
	kClG5K0voMFVJe0RdNsGoElR6tTjdN/4t57vRI3Wtb1SlFpF/hIhH8yS7ZzEMXnD
	MI+mU0h/Ee5SHKY3oaGxImASkOql/1Tnt+RzVEIJ9mWTVEYS2jylWyR9D49uY0PD
	7bl3uuHGKdo1IDX3KGp94T3Icw6buy2YJPnk8z5Ngr6AA7LnSDDaaZUUCvkViJkp
	A1WzyQ1OXDrc/vp+D0LqxylrdpiKCm0SQWBEFQ4Uy4k/mgrbjeh6a18dirz8zzyL
	jkOyxjF4WZumQZW4ic91+5vMyH2GOYo2ZMwBh9XDFglMOTS52OxxuQ4q9cOi4g2z
	HgaBZW6d5nWm0aBJSP/usg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773839595; x=
	1773925995; bh=VlgYJgsDCBdT6+klGD6mIBOkkF0hpYpPSTTnp614c+0=; b=o
	jjzm/PGl3extuXmk3Ru6u9xenEiU1GUWpuhOjCo1Lc22KCc2phDp9vgElzQAE2sJ
	oC4DZaC0cK4Blf3ex/7qxER9oB3c/PVnrBB03e+Itj70lJYxfUHwo3WNpKsh6dlw
	ambVa59LOZau1IIJ0ZJGKc5PcXCgYGD0X/yhOjz4DWJokcf/RwotR7hxiSguA0MI
	bcyuFstn50Jaq8qAIrrgFw5pmk+TT4XYQdVnGEHoXa4eo9IZt7qOWZmsFIbvJo+8
	d4KlIVBBarm4JIpTeaDXhLcrJBALq0I+JSyJQwq6g62SkeFHB6Kjon5af7fse6KF
	6GyOBEmUJYZv3cUGfPypg==
X-ME-Sender: <xms:6qS6aRqC8tA0UQnXmsSOIx5He35Iiax4kg8YacnNc0uwtcfXJVq1DA>
    <xme:6qS6aeeUqy9TA5xlvVp1MxLDU7LOOGeQ3qqZ1kBuvwRIRkS9GldZDIo9EmiM8_4C_
    wyguBtZY47yILg5JthWCa8gwBJw0csllrPIOjlJFnYr2NxoetosFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghgnhhushdrug
    grmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehmrhhitghonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsh
    hotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmhei
    kehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6qS6aYaDyvZetvab10yx898IsxA_bWHRqm1CTquLmC0OWS7Ltmr3lQ>
    <xmx:6qS6aV9EoKxCH56LXprt-icmkrdYqEXlxKi4nkhRIm7tCQ7StOxMtQ>
    <xmx:6qS6aWlLXG4mQC5mXxW8inX558QE4fqGoj_31wK9OCM6lraLP_9NXQ>
    <xmx:6qS6aSwnZYmhkb15Yr5k5oxtfuH0yun27qAg4ObX_dJChhj9faFP_A>
    <xmx:66S6adQSB0rgHb7crFvRUEGrUS2Gm5T2u2Bz7sUZvVd2ALXppk-lCZPB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D2CD4700069; Wed, 18 Mar 2026 09:13:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYTw_54MFalk
Date: Wed, 18 Mar 2026 14:12:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Konstantin Ryabitsev" <mricon@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>,
 "Magnus Damm" <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-Id: <d8365648-2ee2-40fe-b6fa-c52ed5e42f44@app.fastmail.com>
In-Reply-To: <a4cad30f-0f29-4bf6-b69d-a38ebe05828c@app.fastmail.com>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <20260317-spirited-mahogany-swift-b1ac53@quoll>
 <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
 <0234dc75-b042-4408-bbad-a777c0bddb3f@kernel.org>
 <a4cad30f-0f29-4bf6-b69d-a38ebe05828c@app.fastmail.com>
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_061317_005643_511ED149 
X-CRM114-Status: GOOD (  27.58  )
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

On Wed, Mar 18, 2026, at 13:56, Arnd Bergmann wrote:
> On Tue, Mar 17, 2026, at 10:11, Krzysztof Kozlowski wrote:
>> On 17/03/2026 09:46, Geert Uytterhoeven wrote:
>>
>> @Konstantin,
>> I use modified Rob's script to go over patch/pull queue in Patchwork:
>> https://patchwork.kernel.org/project/linux-soc/list/?state=*
>>
>> I deal with them one-by-one, so when I finish merging, I want to be sure
>> that Patchwork status is updated, thus through the script I mark it
>> "Accepted".
>> Like this one:
>> https://patchwork.kernel.org/project/linux-soc/patch/cover.1773399675.git.geert+renesas@glider.be/
>>
>> Around then - can be just before or after - I push the updated branch to
>> git.kernel.org. I fear that because the pull is manually updated in
>> Patchwork to "Accepted", pw-bot ignores it and does not send the
>> notification.
>>
>> Is it feasible to change pw-bot so it will notify even if it is marked
>> as "Accepted"? Or any ideas how to change the flow to have both:
>> A. pw-bot reply,
>> B. Be 100% sure that Patchwork status is updated (allow my manual update
>> via script)?
>
> In my experience, the pw-bot reply always happens at the same time as
> the update in the patchwork state, we either get both or nothing.
>
> The way I've used it in the past was to let pw-bot handle the replies.
> If anything was missing htere, I would know that I had to send a
> manual reply and update the status.
>
> I suspect that setting the status to Accepted first would stop this
> from working, but right now the pwbot interaction appears to be
> broken regardless of the status update, i.e. it only handles
> patches but not pull requests at all.
>
> Konstantin, this seems to have broken around the time you modified
> pwbot to handle git:// URL rewrites earlier this year. Previously
> it only ever caught commit messages that had the exact same URL
> as the pull request message, IIRC you said that it should now handle
> the case where a git:// URL gets turned into a https:// one, but
> the actual result appears to be that no pull requests get matched
> at all.

Update: this one did get marked as 'Accepted' by pwbot, and
it sent the reply, so either it's back to working correctly,
or there is something else that makes it only work sometimes:

https://patchwork.kernel.org/project/linux-soc/patch/20260316074150.GA2474723@rayden/

     Arnd

