Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53D9C02199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JviheAOfcGY+fam4/mBliU2Kfgw+lI2qsF7LU6cAtEk=; b=U3ld9cPI9WnEweX6xU+2afEdId
	nGQm4WQs06pV/Pj04/LQMkMxlNLBk5IeEznN2/054K9FKn/zbUS0p2HHK4mo6MhW2LGgSZS/eViG3
	ABbnMbOFm+oVQGU5aNrnDxrqZG1S37+d62jT2n1TGv5Eu4eECyfos08UGLif/G1KqaQTGgd2s4PRx
	qLziVe+0HrFIoK6LtxcL92N5zAlcBhhesXbqvo9SVXSRorGbooYLfkPbjqPp9DwK8i7PTKqjzyrgb
	kjdbXwCDuXvSwE8jAW4G384tMOsjhDXGfcscyJqoIxjydKF0zsZ5SHjEC/JVokjEi42dpbxHYGpyj
	us91oTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVG-0000000497n-3lEV;
	Wed, 05 Feb 2025 17:47:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjOk-0000000481X-3q1K
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 17:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JviheAOfcGY+fam4/mBliU2Kfgw+lI2qsF7LU6cAtEk=; b=UYOofyk7LfpEk66lmnR6ux2Skf
	eeSLTROvLSmOZr4a5/byeIIfY1TeAVVS8ZiY85YLoLLOdRQwDNQ1jIdA/u5p3RJ6d8r8dB0C0E6Lb
	1rPM8aX/sl2lOCwFb9bWdc6sF+8aScLeTHXkc8J55aPP073iJphmL1moi9uKSYE29AxmbShozIR2P
	Nst1BYwP5XQ1aeFI8QCBH3a19AtkahndIGfc5kNGC4MFTPj7RERG07vG/WpzfRjjaOWU8RauMRTJc
	OAWR2/jVrS84DTIFYriZZZILH5sKg48sK6esBwc8uGxGe8l+svHsN0j2nAHl2UbVsNRKXxgMYILF/
	3aFdV1ng==;
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjOh-0000000GjbS-2430
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:41:13 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 822C0254016F;
	Wed,  5 Feb 2025 12:41:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 05 Feb 2025 12:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738777264; x=1738863664; bh=JviheAOfcGY+fam4/mBliU2Kfgw+lI2qsF7
	LU6cAtEk=; b=ZEKOlpeIY1hKtAp2dj02SWmILkEsLYGoHFBIhdaBULcWMVoyQpu
	KzfAjF8pvjtTF4lN4dnc+yfrdQ3gu5VmdclWrtk+RRblOTrTs+RV/ySBTzhYrIhs
	We0em8144KiF7E+I59c4mxMgbxGf905v7Sj55jV6FVhrGpOQ3gjipVswyXq/jPQJ
	U5aUj0w2Vc9yCU+OcHLM3WVcEppDYlKD7L5S9IqaEo2pLfRrVcYtAZWqrThiZFx+
	tAGxot3+aNI0zc1jcVV0hAMD+p1ttK0t6u3P/C/MsUJJOKio/tQ8rD+1e6MA/1IP
	4hF07xGbvjG1PH3qhB/QuswNLbOzdldpHkQ==
X-ME-Sender: <xms:r6KjZ7s7MsnLlVFwDXTvWOa1kjYpINM-exd9-U2Mn05ci8nQd6r87w>
    <xme:r6KjZ8eMZ05c9ssWZuaZ48i2jNVhIGMTzfwk88dv3Hq_gRidwDIAHTnzR7ouXzEcX
    ddkZG1IksiVExY>
X-ME-Received: <xmr:r6KjZ-wSZrt9SGKDgAQk8cUrFe9ZeODH2xbU9scCMJso-3E-rggZonmspkZq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefkughoucfutghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrd
    horhhgqeenucggtffrrghtthgvrhhnpeetudfghfelieetjedvhfevfeduvdetgffgudel
    uefgkeffueeltdejvdettedufeenucffohhmrghinhepihhurdgvughupdhkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehiughoshgthhesihguohhstghhrdhorhhgpdhnsggprhgtphhtthhopedvhedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepmhdqmhgrlhhlrgguihesthhirdgtohhmpdhr
    tghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnih
    hshhgrnhifrghrsehtihdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggr
    vhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluh
    hnnhdrtghhpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:r6KjZ6OC6d3nrGjKvfHfIHaG7SURZuoKgzNUQ3ICfgDIzAEcRrQ67w>
    <xmx:r6KjZ7_VUkzrSRTTwpmM_8MYcyk4CA4pzZxMHqSJs75nyLleEP2aLg>
    <xmx:r6KjZ6U4SRoztKmYfzJCF1g0Osm-g593CwyW0FLZ9MPOZ_Khp2xNOw>
    <xmx:r6KjZ8ftyrqq_5yaaFlEazqMapXDZAQ71v9J3gxNSe2pyx39exlAmA>
    <xmx:sKKjZxPbTGyNchIvuM930pj-PPoTOhF2PZ47K3Ks0DY0owW0elyqGulr>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Feb 2025 12:41:02 -0500 (EST)
Date: Wed, 5 Feb 2025 19:41:00 +0200
From: Ido Schimmel <idosch@idosch.org>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, robh@kernel.org,
	matthias.schiffer@ew.tq-group.com, dan.carpenter@linaro.org,
	rdunlap@infradead.org, diogo.ivo@siemens.com,
	schnelle@linux.ibm.com, glaroque@baylibre.com,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH net 1/3] net: ti: icssg-prueth: Use
 page_pool API for RX buffer allocation
Message-ID: <Z6OirBmdSLuY5YkI@shredder>
References: <20250122124951.3072410-1-m-malladi@ti.com>
 <20250122124951.3072410-2-m-malladi@ti.com>
 <Z5J4jjJ4_arvfF9E@shredder>
 <9287a623-5663-4705-b61a-3ab5f5cb2424@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9287a623-5663-4705-b61a-3ab5f5cb2424@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_174112_071881_1931D43F 
X-CRM114-Status: GOOD (  18.81  )
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

On Tue, Feb 04, 2025 at 11:25:02PM +0530, Malladi, Meghana wrote:
> Seems like none of the pages which have been allocated aren't getting
> recycled in the rx path after being used unless its some error case. Will
> try to fix this.

skb_mark_for_recycle() should help with page recycling when an skb that
uses them is freed.

Anyway, I believe that I don't see put call when tearing down the Rx
ring because prueth_rx_cleanup() is using page_pool_recycle_direct()
when it shouldn't. AFAICT, prueth_rx_cleanup() is only called from the
control path (upon ndo_stop()) and not in NAPI context.

> Also I have noticed, in prueth_prepare_rx_chan() pages are allocated per
> number of descriptors for a channel, but they are not being used when a
> packet is being recieved (in emac_rx_packet()) and rather new page is
> allocated for the next upcoming packet. Is this a valid design, what are
> your thoughts on this ?

The new page is possibly a page that was recycled into the pool when a
previous packet was freed / dropped.

[...]

> Yes I will add PP_FLAG_DMA_SYNC_DEV as well.
> I believe page_pool_dma_sync_for_cpu() needs to be called sync Rx page for
> CPU, am I right ? If so can you tell me, in what all cases should I call
> this function.

Before accessing the packet data.

> https://lkml.iu.edu/hypermail/linux/kernel/2312.1/06353.html
> In the above link it is quoted - "Note that this version performs DMA sync
> unconditionally, even if the associated PP doesn't perform sync-for-device"
> for the page_pool_dma_sync_for_cpu() function. So does that mean if I am
> using this function I don't need explicily sync for device call?

It's explained in the page pool documentation:

"Driver is always responsible for syncing the pages for the CPU. Drivers
may choose to take care of syncing for the device as well or set the
PP_FLAG_DMA_SYNC_DEV flag to request that pages allocated from the page
pool are already synced for the device."

https://docs.kernel.org/networking/page_pool.html#dma-sync

