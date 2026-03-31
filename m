Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6D1109B489
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGTb91mpWi0Vk+xK4rlAkEQdHg3AEdVFle70p38K4Eo=; b=f29ZU85A1P+LRfXHy09JSRLT7D
	T9sPQbmNDYroEiSLwZIgLCr6WYDaSgmG1HUk3UETDbri0d8irEkK79K1YfjsXuG18HKgr3MJvB63f
	JgC224qs9XSNyCZ8JQMx+u8UmtmQZZ4XCFQTDhA0krdij6vXEiiDRiPenoIx/o/PJobZWmjgXTOoL
	sXQOVQSWqYMpyDArDWstCSbp2+1Q9blkwWPRaw3/i7OxxvlzEr8w4DiNn/8ryNTeyPUiiMBtHsHK9
	4kLdKtlQkTG5IotyAKXwRSZgnYJH1fNBLo+YVLfmCQ3UGE85q0EQtQtYK2cpM7GT5VV5sjtEmWks9
	KEeX8EtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aza-0000000DB28-2EwE;
	Tue, 31 Mar 2026 15:26:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7azY-0000000DB1s-3WKW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D88A860128;
	Tue, 31 Mar 2026 15:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C72AC19424;
	Tue, 31 Mar 2026 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774970815;
	bh=cGTb91mpWi0Vk+xK4rlAkEQdHg3AEdVFle70p38K4Eo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Ot2831z+FnM2V2mXxSrgb2u5Wf+cfHhmuESyvCLtnsBqwA9eVfTDC0jxdkZ909Vey
	 oSduTf+IzkRMzN80RYex3k6680nbNWjTkDJ8oYER4LWQIKTEINqrtGY54ulwZ+9FYj
	 J9JNaYJ+n5ET/pEW1N2DjwRF3XncxXXzEbeNdlses7djp4gCk33LU6VfVldZNNgsU/
	 FoxZpGQ5qHacyPNe3cMjuc5y91tNffRWlVNf4Z8dCJyUuLbGUCwZ+zhbaL0wQI4NWV
	 deOhQhdmDgjI44HlzyVs1IwEnfZqfNRGFK9iu027aUYrfIolWJp3BN1lUcwntpiB79
	 mBGJ5F6zp+u0Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4AB82F40068;
	Tue, 31 Mar 2026 11:26:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 11:26:54 -0400
X-ME-Sender: <xms:vufLaRnP7jGMDEKs9R6KR-rMhT9NcYC5tkX4aRHLpm_XmY-E_-BzZA>
    <xme:vufLaXp3WUXeNPgx0OP9Snip83-HhlE51b4F0mXvQRbv_0X6PAyvxEqL-f-ui2XGI
    _wOLbzXLMQn_YcH2X5nI10i8Z_U_eaglJIh3pE9DIDaQ_nbeaX7DtE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceuihgv
    shhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieejfedu
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrug
    domhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledqfeef
    vdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtg
    homhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    lhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrrhhnugesrg
    hrnhgusgdruggvpdhrtghpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohephhgthheslhhsthdruggvpdhrtghpthhtoheplhhinhhugidqtghrhi
    hpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgr
    ihgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vufLaSDlpIOvmANuwL8ix1lnr_yqbJILA8Bl3xRrAJrd9TOh5FUcqQ>
    <xmx:vufLaRcEHTqZ1eLDCST-8gypWZwQ72K5LhNbWW7K8CH8yovOc48xKg>
    <xmx:vufLaZ2Xuwik_Dnced0A_4CwLiKHWLeQpUE9SkaLolTZlUZgbUa1IQ>
    <xmx:vufLaQhSdD5W8cRbT3__88924YQ8u-CgV4tyFYv814ldtp9YJNB0tw>
    <xmx:vufLaakZoXFTDdgitJ3HwidQpKshtY8WpFesO1CPSItfAEkNiemJvmUx>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2218D700065; Tue, 31 Mar 2026 11:26:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALlDvrZQNrMB
Date: Tue, 31 Mar 2026 17:26:33 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Christoph Hellwig" <hch@lst.de>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-raid@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Arnd Bergmann" <arnd@arndb.de>, "Eric Biggers" <ebiggers@kernel.org>
Message-Id: <2176aab5-2167-4cdf-9090-0f8e0a6fb5a0@app.fastmail.com>
In-Reply-To: <20260331151653.GA8011@lst.de>
References: <20260331074940.55502-7-ardb+git@google.com>
 <20260331151653.GA8011@lst.de>
Subject: Re: [PATCH v2 0/5] xor/arm: Replace vectorized version with intrinsics
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Tue, 31 Mar 2026, at 17:16, Christoph Hellwig wrote:
> Looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>

Thanks.

> I think some of the intrinsics patches were also in your crc64 series,
> so I'm not sure how to be merge this.

The first patch is used by both series, yes. If this is good to go, we might as well just merge it, and defer the crc work (or at least the 32-bit ARM specific changes) to the next cycle. I am in no particular hurry with any of this, so whatever works for other people is fine with me.

The RAID pieces are going through akpm's tree, right?

Eric, any preferences? (assuming you are on board with the CRC64 changes in the first place)


