Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094F5CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRTsv9FG3U4ybrglnAgKP4GtX39SQERoznL6ypXbkIM=; b=DNN+7yaiTU/mYuEm7JTdo4Wsn6
	vBQT5Rj5aHR/sKC03QDGburGm9OOAjRntfZyelRRhFwHVWV68TUP2dHiAiHJj4TYRzu5beN2j9k2N
	vKo+/F4m/0IrZgwelWY0DcVXxJZ6ykN43t0MoHRDmtPWxc67vL/576K1+WoXx6BGQYjd+LOK14NHF
	ej/fqBSaNjJBDVRarOUTN3XXlIdh/K6+OkNgQpUV0tJb7iP8q+b7/1UyIPBhg9S3EOww94bATpALD
	jzo+LpNDjtVChkYVkTkOHsYhv9kG7IErRKwnxxv02YrVPfAHvVfkQfklOhXct42N5xrbEiQ8q4BUV
	yLxwLssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aBT-0000000906i-4A0P;
	Mon, 22 Sep 2025 06:37:59 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aBP-0000000905N-3NiP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:37:59 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id CCFAA1300076;
	Mon, 22 Sep 2025 02:37:51 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 22 Sep 2025 02:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758523071;
	 x=1758530271; bh=oRTsv9FG3U4ybrglnAgKP4GtX39SQERoznL6ypXbkIM=; b=
	ube5lV/e9Fiat19JzRP/DHcXurPxbkdd8gTPAEUq6Ffs1FJXVENctoAeO7N2TPFH
	a7vzVB4q3bJuTW5bXvD3vEpXjY0wn88R2Vj+8DMppvdSoK0H31eVa7+EV7Bq7NlN
	voXhivc8lqXXbTJlAi7PNyEb9Gj++SNGdJrP4uQegscFH1ww+cmvFLG97VP5/7S7
	lhCm8rbmXrqiVaF/dK+M+75/8lQiJpfAX3S2YJPedCtSmfsS4yXz9DknVRtriD5b
	4hLC7UkdD8neLAAwwA+N61yoloBXch39dSs6RXBFlVU53H2wDbhp9+u/+uwCIFp6
	D6/Nkbkz1gzAfNKS6mEaCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758523071; x=
	1758530271; bh=oRTsv9FG3U4ybrglnAgKP4GtX39SQERoznL6ypXbkIM=; b=H
	WkKCQABcikKJJwPFToeLddMVwzFfr5YjTeBWD0KOhkBpbdDLCYa26hETGIpVWeU9
	lTrJ52EBR71niW7a5TVY8xGLAP2purRmJQn/EWMJsxVW2zUlU8VcwSQNUefunoAH
	4/Q3NWQ8Bkwu42fsqjwkEg28a+lkOuWoYQn2Wk1/xxz9bEKDgOgc9V7gbJxetKsf
	lBTDFWaeGXry604w7kZdsAJ2sR6ZoHjAIfROQ4e12WawP6guIvhbN1JsepvQr7jo
	XOBtE3jLR8yXWmifeLSK39NHzMAZZihunXeRKqpW1VWYz8pbtTKT8YodIzuewwXw
	IWxqaNgEJsJ3D6LuKC8jQ==
X-ME-Sender: <xms:ve7QaLXgBdFM6Y1TtCJBlITrjLFVzeXnRS4obxmx0q8GChHn_YLLxQ>
    <xme:ve7QaDlnNax_QJ4BhqfKLe8ENI29gzRizviDFzOgEj0JOW0BeK5cIRgBsBn-ygKsQ
    YtoUajvAv7ZkMUJ2BM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjeduhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:ve7QaJu1tJyg9opP58GfgasJD9sSXHsTqnju42GwxkMOIF_P6AK17w>
    <xmx:ve7QaKRQTwey9OWjnR3DcYzNr2pVQCP5-vQiomV_czkcIwLTgEJOUg>
    <xmx:ve7QaIJGrVhMtb1fhwJg9TgSuBwX5gcW-2hgQ-2vtyXaur0VR8yrtA>
    <xmx:ve7QaKApvFUTjcYv8LxTffxsGW0ep-tayNt8fr6F6TNe1rZdcBaXjQ>
    <xmx:v-7QaGQodd7zGczHNjLut5G5XMvTRVF9QOaKyyfnP7xgZ6JApudok0O7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD408700069; Mon, 22 Sep 2025 02:37:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AFFCV0QGVXfF
Date: Mon, 22 Sep 2025 08:37:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Xie Yuanbin" <xieyuanbin1@huawei.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand" <david@redhat.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 linmiaohe@huawei.com, nao.horiguchi@gmail.com,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Eric Biggers" <ebiggers@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Kees Cook" <kees@kernel.org>, "Dave Vasilevsky" <dave@vasilevsky.ca>,
 "Peter Zijlstra" <peterz@infradead.org>
Cc: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, liaohua4@huawei.com,
 lilinjie8@huawei.com
Message-Id: <727caa4f-5be5-4b59-a10e-8dc9bbc384bf@app.fastmail.com>
In-Reply-To: <20250922021453.3939-1-xieyuanbin1@huawei.com>
References: <20250922021453.3939-1-xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH 1/2] ARM: mm: support memory-failure
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_233756_375043_BDAC7CA0 
X-CRM114-Status: GOOD (  11.73  )
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

On Mon, Sep 22, 2025, at 04:14, Xie Yuanbin wrote:
> Memory failure provides the ability of soft offline pages,
> which is very useful to handle the memory errors such as CE in ECC.
>
> Although ARM does not have a user interface like
> `/sys/devices/system/memory/soft_offline_page`, memory-failure still
> provides some exported func that can be used by some module ko driver.

It would be helpful to be more specific about what you
want to do with this.

Are you working on a driver that would actually make use of
the exported interface? I see only a very small number of
drivers that call memory_failure(), and none of them are
usable on Arm.

     Arnd

