Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E92AC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CM3Dw6fk0gSQNr36cfugEFxzFt86GurJoNVnL/gx6DQ=; b=Wng4y2m++92LybhzfeYGrduSUF
	9qBDlBLmKgZ6xuvZJBxGVPHi9ktLll0peCbEjaZwD+LT+NjpYnalMOgVFY4hO8FkXctCQHZn21scY
	uFNtG1yA/E61A8G5LmWnST3IWPyGnW/OThOC4Rvx7eqNMSN2PPztvIE/mQ59yi2FJWjEslP9i1GQy
	vurKQ6s/zy6U8HPOdV9NdSXO7zmbBVCd+AN0alE1tEV6lr841nd13uGa11BCvTFssci0GmRLn9IvC
	EUQDhS9DQyMxU7qiee7zCXO7+mu9iZkorAhNkLMXzsSQg/y0zDE+fEUg74v+s8BzLWe0mIDeJdtoD
	Vlb/3cEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxGo-00000008PRz-37IF;
	Wed, 02 Jul 2025 13:13:02 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxES-00000008PBh-2M0l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:10:38 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 76C7E7A011C;
	Wed,  2 Jul 2025 09:10:34 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 02 Jul 2025 09:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751461834;
	 x=1751548234; bh=CM3Dw6fk0gSQNr36cfugEFxzFt86GurJoNVnL/gx6DQ=; b=
	OxJo/61J9FxWBD5vXi51ni4VO3YDjHIsSBVAI1jDDpHYnFBAVYW+lcRzpOhHKJ/L
	FDRH5eroTw9O8Vol6a/LcRcPGdSQd/VJu0CV/uBp0K2wx9W3XO/yo3ehYO1ZzzFl
	/VE6KY1I4YU5aKjdcjrp6hKwTI6FbAc6NzqCY8qi9038GWPAroOJ1qvS1RbZ3bxk
	hMDOZgasYMA3Kzw/dY9me9pZjGES+x0hWnzAjOxMcJETVZs7ck3GrDwWI2WdYkZZ
	NOXrrvGQal52e26lbILJWmHz15Q/98duAYC3PZv5irq2pSK81pS+3qsUdfwYfdep
	B3GmKnD7dk0bApFwVV8Pqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751461834; x=
	1751548234; bh=CM3Dw6fk0gSQNr36cfugEFxzFt86GurJoNVnL/gx6DQ=; b=O
	ioy0nL0UuuH/VEUCszIpHiwpflPl8+BXJ816b/fzc9Jp/RTFeZKdsQoIplenPgBS
	AfP7YF9hlZsZCXXxRWp5sT789xeYk/625OGxxhRrc3Fw/rG+T7dj8lkEq8AO+YQp
	sJCYVVB6NtOj//m0bfOCFdCVapIGPF2IBbqqH2i5mx97VEe8zTGXRql24q/FIjVT
	SBUbNrEtoGsaV8FMlA96CCEhBS1frY9ryRX981Tf1ufnoxOmYG/JzY8yMv27fAlQ
	w0Cj0vqdiRKtX38OuCnYjLzAHO1wVWRng+5tgGS+FyyWtJkI1nyn2uCEbr/ZzdJE
	toxKktTfKs+HjCJrKC4bA==
X-ME-Sender: <xms:yC9laH3rtdKfBplfWPFJcQbY5j5AKXtVIWrfLx-N7hyea5W56mf3eg>
    <xme:yC9laGGuOe4L0aNp-mefHz2cjYFE6UfxUJMuhnr1LoDh0tJk4fCdWuX3JQm4gIxiI
    aNz2KMooFRX-jupWxs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehsrghs
    tghhrgdrsghishgthhhofhhfsegrrhhmrdgtohhmpdhrtghpthhtohepthhimhhothhhhi
    drhhgrhigvshesrghrmhdrtghomhdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhg
    rdhorhhgrdgruhdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpd
    hrtghpthhtohepjhhonhgrthhhrghnrdgtrghmvghrohhnsehhuhgrfigvihdrtghomhdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjh
    hirhhishhlrggshieskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yC9laH69BhhdIzMOjdAALm72oNgRutcG7Q4g4hoSRIetagBiwpVjHQ>
    <xmx:yC9laM1OKYIG1lJfC1tCMaok8A9Eo361dNg47oYEE2W6vej_M0sFzw>
    <xmx:yC9laKF_oi88OqTJZV_fCnh3MYBsX-Vnbiyp-bA95w3kd0U_xYKz-A>
    <xmx:yC9laN-ZLQ6oSxli4TXPq31FzgpUCl6ph9hE5TdtWMUBl1fyGr9SPQ>
    <xmx:yi9laEmXJtgcOFm7oVPKQmrrLqGk_gvqYdiWuvDo3A679EPdanbb0P1v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D2377700065; Wed,  2 Jul 2025 09:10:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T8b561bdf24069c70
Date: Wed, 02 Jul 2025 15:10:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Will Deacon" <will@kernel.org>,
 "Sascha Bischoff" <sascha.bischoff@arm.com>,
 "Timothy Hayes" <timothy.hayes@arm.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Jiri Slaby" <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Message-Id: <09dd654f-c7d7-4046-92a7-ee4e9f8076d3@app.fastmail.com>
In-Reply-To: <aGUqEkascwGFD9x+@lpieralisi>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
 <20250626-gicv5-host-v6-20-48e046af4642@kernel.org>
 <20250702124019.00006b01@huawei.com> <aGUqEkascwGFD9x+@lpieralisi>
Subject: Re: [PATCH v6 20/31] irqchip/gic-v5: Add GICv5 PPI support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_061037_118243_29CB7A18 
X-CRM114-Status: GOOD (  20.62  )
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

On Wed, Jul 2, 2025, at 14:46, Lorenzo Pieralisi wrote:
> On Wed, Jul 02, 2025 at 12:40:19PM +0100, Jonathan Cameron wrote:
>> On Thu, 26 Jun 2025 12:26:11 +0200
>> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
>> 
>> > The GICv5 CPU interface implements support for PE-Private Peripheral
>> > Interrupts (PPI), that are handled (enabled/prioritized/delivered)
>> > entirely within the CPU interface hardware.
>> 
>> I can't remember where I got to last time so if I repeat stuff that
>> you already responded to, feel free to just ignore me this time ;)
>> 
>> All superficial stuff. Feel free to completely ignore if you like.
>
> We are at v6.16-rc4, series has been on the lists for 3 months, it has
> been reviewed and we would like to get it into v6.17 if possible and
> deemed reasonable, I am asking you folks please, what should I do ?
>
> I can send a v7 with the changes requested below (no bug fixes there)
> - it is fine by me - but I need to know please asap if we have a
> plan to get this upstream this cycle.

I think the priority right now should be to get the series into
linux-next, as there is a good chance that the added regression
testing will uncover some problem that you should fix.

I had another look at all your patches, mainly to see how much
of them actually change existing code, and there is thankfully
very little of that. Without actual gicv5 hardware implementations
there is very low risk in adding the new driver as well: anything
that still comes up can be fixed on top of v6 or a v7 if you send
it again.

I assume that Thomas will make this a separate branch in the tip
tree, given the size of the series. If he still wants to wait for
more feedback or changes before adding it to tip, I would suggest
you ask Stephen to add your latest branch to linux-next in the
meantime.

    Arnd

