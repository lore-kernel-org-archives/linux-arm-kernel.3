Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC0CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t36qDepR8M2DCIZbR0pCgjLUAnazHFDPHVI50t3UlR0=; b=d9C7uF8n9f+/ixWFoPi7a9pB8r
	eX8zHiJRX6V2GJQus6++lb4/q5/SDwYw2Ud8g48sCkoCXhyJ7WwI38sC/UzznxWvUzIBnQ+SMuOSF
	Ian/Tp/V5AhW8VRS/npevnxhmKWv3HWCMShha3mM6YNEMvZcrkj1GCBnW2ge/D4VOzNrGSypnzpQh
	FostaEv+dFpt9HeAdkSMEjzOuEcADWnTNVnUI20Gg+3+RXsXLKF69W/uBGatzIVypMZk8Vf0fkagF
	tobGDEtMvzcyh5tbUXTLBTO0EL72W3OORLzOuyd4FZg2lnCE1wQKk5B8I9nJRBJn45WJIKufoHHQL
	AD4V5U3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g4L-0000000AO00-06uS;
	Mon, 22 Sep 2025 12:55:01 +0000
Received: from flow-a8-smtp.messagingengine.com ([103.168.172.143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g4H-0000000ANxD-1GYm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 12:54:59 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id B4DF41380189;
	Mon, 22 Sep 2025 08:54:55 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 22 Sep 2025 08:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758545695;
	 x=1758552895; bh=t36qDepR8M2DCIZbR0pCgjLUAnazHFDPHVI50t3UlR0=; b=
	Byx+4gU0eym5kWVlcDXwUEDI2l9mrErWD5C903u60dnEyaLum9cP1ZuS5KIp+xgV
	ZPhoSR2eD/GkgL674LQAABX9NWS2vtfKwaGvmIMh7dn5zMpqei4YDaKF6Sg1lPqM
	/QYUc0VveyM9znhOFNe0I0Peulxx/MpOzCUQKlSEgPHlsEhuUOD2y6mRk3lDEj02
	VonOHqKY3rqz628mNujxcDBLfdikoS4DkYJFuSM7iVjrVgPyCF1G4xzwHAbC28ak
	vvUqx1uImSJZ0/2d1CaWpImUIRc3GyUcfQGlUAGQNOWn2gPJHn5TvlH9sflGdsBd
	Q080PKF/+Wx2IOzfgFAq3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758545695; x=
	1758552895; bh=t36qDepR8M2DCIZbR0pCgjLUAnazHFDPHVI50t3UlR0=; b=H
	0IPFaD0Bba71iIapHDtSV1s5vKNTmSWg76ZWGgJDWMeMe2uVZv93YLpC6F+3M7WS
	7WR8RZqD6IX9RfHdr78aWjw7DCVCJJDQQAyQV579FYFi5N053564JuPCiuOaoK7E
	jCNWhlk6xzOLMU//k4yHk7ANSniWbtRW6bN+QjnKeFTwCD651tkhjiL2UZK6FT4a
	N+e/Yd+67opM9BzKp4zMCF1uEB2IdBcU4BDnt7dF2IYQtXXKkU2s8zbUPCs7FRgT
	esVXVJWVpb7ki7wYLCkfM9rz4wm7rTHNen16vLJGDFL/xHUUzNYiuVSL2AtqWUoo
	LzUsfYTN6qltg5PEeMddw==
X-ME-Sender: <xms:HkfRaIhwl2BmHC6VY4isyWFya-k04jD6ylI2zmgaqD6hV2yhCcrcAw>
    <xme:HkfRaBA26ySSRAPgSQvT1XYEaaJYts20E0XhpKyqZSIXJCR2OE9jzNtNSAFz8UVQR
    HSJ4LKxnkBuSkZFk1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjeeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopehrmhhkodhkvghrnhgvlhesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pehnrghordhhohhrihhguhgthhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosh
    htvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehsuhhrvghnsgesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtoheplhhirghohhhurgegsehhuhgrfigvihdrtghomhdprh
    gtphhtthhopehlihhlihhnjhhivgeksehhuhgrfigvihdrtghomhdprhgtphhtthhopehl
    ihhnmhhirghohhgvsehhuhgrfigvihdrtghomhdprhgtphhtthhopeigihgvhihurghnsg
    hinhdusehhuhgrfigvihdrtghomh
X-ME-Proxy: <xmx:HkfRaCigs8Fbeh9nddaAG96q7IyZQvw3aeIYEeOmKg-CRsa1QbL_6Q>
    <xmx:HkfRaCv2xmbmRFslevLLrkDTmmKL1-lKBkFUSXaessp7GPqBHtniAg>
    <xmx:HkfRaE64XxBzr53OG3J0xus2BYuY6_ti3fdW9pt59OdOalF9khdfew>
    <xmx:HkfRaNtIkKJV0zAg5uDGA1LBG8hBH_va0vo4RVrbVfhnUgCeeDvgOQ>
    <xmx:H0fRaKVMmb-oKkRydhvIG9b_njKCBCZyzUrTrxLNyaHqA221GeTlQIFn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3037D700065; Mon, 22 Sep 2025 08:54:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AFFCV0QGVXfF
Date: Mon, 22 Sep 2025 14:51:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Xie Yuanbin" <xieyuanbin1@huawei.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Dave Vasilevsky" <dave@vasilevsky.ca>,
 "David Hildenbrand" <david@redhat.com>, "Eric Biggers" <ebiggers@kernel.org>,
 "Kees Cook" <kees@kernel.org>, liaohua4@huawei.com, lilinjie8@huawei.com,
 linmiaohe@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Michal Hocko" <mhocko@suse.com>, nao.horiguchi@gmail.com,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Steven Rostedt" <rostedt@goodmis.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Will Deacon" <will@kernel.org>
Message-Id: <9c0cd24c-559b-4550-9fc8-5dc4bcc20bf7@app.fastmail.com>
In-Reply-To: <20250922082843.26722-1-xieyuanbin1@huawei.com>
References: <727caa4f-5be5-4b59-a10e-8dc9bbc384bf@app.fastmail.com>
 <20250922082843.26722-1-xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH 1/2] ARM: mm: support memory-failure
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_055457_692522_D83682B5 
X-CRM114-Status: GOOD (  25.92  )
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

On Mon, Sep 22, 2025, at 10:28, Xie Yuanbin wrote:
>> It would be helpful to be more specific about what you
>> want to do with this.
>> 
>> Are you working on a driver that would actually make use of
>> the exported interface?
>
> Thanks for your reply.
>
> Yes, In fact, we have developed a hardware component to detect DDR bit
> transitions (software does not sense the detection behavior). Once a bit
> transition is detected, an interrupt is reported to the CPU.
>
> On the software side, we have developed a driver module ko to register
> the interrupt callback to perform soft page offline to the corresponding
> physical pages.
>
> In fact, we will export `soft_offline_page` for ko to use (we can ensure
> that it is not called in the interrupt context), but I have looked at the
> code and found that `memory_failure_queue` and `memory_failure` can also
> be used, which are already exported.

Ok

>> I see only a very small number of
>> drivers that call memory_failure(), and none of them are
>> usable on Arm.
>
> I think that not all drivers are in the open source kernel code.
> As far as I know, there should be similar third-party drivers in other
> architectures that use memory-failure functions, like x86 or arm64.
> I am not a specialist in drivers, so if I have made any mistakes,
> please correct me.

I'm not familiar with the memory-failure support, but this sounds
like something that is usually done with a drivers/edac/ driver.
There are many SoC specific drivers, including for 32-bit Arm
SoCs.

Have you considered adding an EDAC driver first? I don't know
how the other platforms that have EDAC drivers handle failures,
but I would assume that either that subsystem already contains
functionality for taking pages offline, or this is something
that should be done in a way that works for all of them without
requiring an extra driver.

      Arnd

