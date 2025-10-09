Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D020CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoNTmFVBWG81Z8jPkjSyUXyeQNMXRWj30MhKaE6XHgs=; b=N+wWM7EsEGxrl/lHf+XKjsG/H5
	HmVWtlMxUlCa0Otl1JgcM11/4y7B6bwbMmhs9BBYKBKqL2SloxqOcKGrLRRF1Oa2e4A7E6m6euED6
	qrnFEyIPMgRRH5aLbkWlWHEmAog4TcfkkYvzqx4x6lN7DzKDta6Zz2wnrz903B6GC/s76PzKSnfCY
	rBTEz8eQPnzcD7FYmE3ykAI6Iw1h+RicDoQj7J9aS14efW8DZbSLs1bpSUMZUtP++MmujR2YjWoOn
	UnJWrv1l4CyH0qlHJrcE1CCpckKBqmKKyU4MRUGAQBEDIJkjf3dpusIxxYhBAPGoTDTz7irYZVynp
	5vx6XTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xzw-000000078Fj-0bNO;
	Thu, 09 Oct 2025 21:16:28 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xzt-000000078FP-20pQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:16:27 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 623367A0147;
	Thu,  9 Oct 2025 17:16:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 09 Oct 2025 17:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760044583;
	 x=1760130983; bh=IoNTmFVBWG81Z8jPkjSyUXyeQNMXRWj30MhKaE6XHgs=; b=
	AbQFnV+b8ZYeLCRKItywfYNA5Dd8v+oWv3NUzKZXGytsRishs+OLhi0sA0rm2O/o
	QLd7UDaDvd8hSVJ4vm+iknIVqJYiJSRy7aDqvjQRVL1YYEAOch212aL6JwNzYC/0
	gxoOr7MlqPf9OndJYM+XVVd/SCEai5D8Hmd9XH0su6mw6wDTQgCI/UqePc14Y4mc
	8l5dgwhf7fh2PEgzKEIrwnWeveHotomhZGhLcmjKox3ZfACIvUiTqGgZ1BZKZg5k
	rH6LBuYCn4/idKHrU4eBchO+PsK0YajfUBPApSPEMbB+Or4zJlvTkXukaAV5Kd2e
	eQhZTwql/c0TmVPZyliGyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760044583; x=
	1760130983; bh=IoNTmFVBWG81Z8jPkjSyUXyeQNMXRWj30MhKaE6XHgs=; b=E
	HmpTDc5xRJ3TXz5x2hZeE2MXvOu6IUyw1eg8bbYCxTXKXiYskUZ8DWu4XanWSfTa
	4mVZMnmsQBY8o2zfvCFBca1rM1/2eCf5q8tM3QLU86PUKr1sJDvLj2TOgM9YtXZR
	+m8xhJOj78+h/2q1Pf+vtpReNVod1kjOlnbsN2epZt7czSjLRWu6SO5eH+x2Ek4y
	i0boRPEZvm4rj/WSIeFCAAYmnjQZHxS8ClavA6xWC94QXiGS1AOuZIM0au2FDZbN
	lGV1L+3qFBHljpv16lL9InzoDx1Lb/anPYtyCst08ZZ1yzv4CzC/L8UNRn1pVStm
	YLEG5w9AvqANqTEkTL4jQ==
X-ME-Sender: <xms:JiboaKb-MGLsTLhTj9uJL3sd49TdJmleSY92FhFOjenpgIPzMBR9Pw>
    <xme:JiboaINkPGTacipbSrsOVyfF3NamakhSURWRSrnAtvBf-HqcCAlmziHR2w2MWYwO9
    -vPD3gT_jPzdMKeRah0tHFy5Q2UUYPcpLccxeucBuWWyUW8X7uTJNZ1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdejvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegthhgvshhtvghriedvheduheesghhmrghilhdrtghomhdprhgtph
    htthhopehjihhnghhoohhhrghnudesghhmrghilhdrtghomhdprhgtphhtthhopegshhgv
    lhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheptggrshhsvghlsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhifih
    hltgiihihnshhkiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhpihgvrhgrlhhi
    shhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghniheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:JiboaKzjsKO1_WQG04CIprEGKf71yM5hOy-8anD7RRhtZ7ftpo8Wpw>
    <xmx:JiboaGL3T8rgFBUNlNLoEzdCZmZb9R0h6pwMlMFI1IZxisK1gm-jeg>
    <xmx:JiboaJpnfl2MAFwPgIgtocS8kPtCyPmWKUPr_aeHeEkQm7PzoxtkMw>
    <xmx:JiboaMsvj1UUHlfbYdzbwLI2CqHl_ls__C_Bk6sK0L4tGU7FKgSFWQ>
    <xmx:JyboaDdp-OmcX3EnwEF9gbyqZztZszgw7zUa-4n3H4-3GDfifWvXEoVD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 47F22700063; Thu,  9 Oct 2025 17:16:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AIHrVq-NOQMk
Date: Thu, 09 Oct 2025 23:16:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manivannan Sadhasivam" <mani@kernel.org>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "NXP S32 Linux Team" <s32@nxp.com>, bhelgaas@google.com,
 jingoohan1@gmail.com,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, Ionut.Vicovan@nxp.com,
 "Larisa Grigore" <larisa.grigore@nxp.com>,
 "Ghennadi Procopciuc" <Ghennadi.Procopciuc@nxp.com>,
 ciprianmarian.costea@nxp.com, "Bogdan Hamciuc" <bogdan.hamciuc@nxp.com>,
 "Frank Li" <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 "Niklas Cassel" <cassel@kernel.org>
Message-Id: <839e3878-ae62-4c8b-a74b-ac4f6f060d98@app.fastmail.com>
In-Reply-To: <4kvo2qg2til22hlssv7lt2ugo63emr5c4hfjur5m3vnxvpdekx@jcbhaxb2d2j2>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
 <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
 <aOU0w5Brp6uxjZDr@lpieralisi>
 <4rghtk5qv4u7vx4nogctquu3skvxis4npxfukgtqeilbofyclr@nhkrkojv3syh>
 <eba7d968-209d-4acb-ba41-4bebf03e96ba@app.fastmail.com>
 <4143977f-1e70-4a63-b23b-78f87d9fdcde@app.fastmail.com>
 <2erycpxudpckmme3k2cpn6wgti4ueyvupo2tzrvmu7aqp7tm6d@itfj7pfrpzzg>
 <3d480f73-15b4-4fb8-8d2b-f9961c1736ca@app.fastmail.com>
 <4kvo2qg2til22hlssv7lt2ugo63emr5c4hfjur5m3vnxvpdekx@jcbhaxb2d2j2>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_141626_051498_59811659 
X-CRM114-Status: GOOD (  24.95  )
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

On Thu, Oct 9, 2025, at 20:47, Manivannan Sadhasivam wrote:
> On Wed, Oct 08, 2025 at 07:56:44PM +0200, Arnd Bergmann wrote:
>> On Wed, Oct 8, 2025, at 17:19, Manivannan Sadhasivam wrote:
>>
>> That is not my impression from reading the code: At least for
>> the case where both devices are on the same bridge and they
>> use map_type=PCI_P2PDMA_MAP_BUS_ADDR, I would expect the DMA
>> to use the plain PCI bus address, not going through the
>> dma-ranges+ranges translation that would apply when they are
>> on different host bridges.
>> 
>
> Right, but I don't get the overlap issue still. If the P2P client triggers a
> write to a P2P PCI address (let's assume 0x8000_0000), and if that address
> belongs to a an endpoint in a different domain, the host bridge should still
> forward it to the endpoint without triggering write to the RAM.

If 0x8000_0000 is an endpoint in a different domain, I would expect the
DMA transfer to go to the RAM at that address since the DMA has to leave
the PCI host bridge upstream by following its inbound windows.

This is not the problem I'm talking about though, since cross-domain
P2P is not particularly well-defined.

> Atleast, I don't see any concern from the outbound memory translation point of
> view.
>
> Please let me know if there is any gap in my understanding.

To clarify: I don't think that programming the output translation this
way is the problem here, but assigning memory resources to ambiguous
addresses is. The host bridge probe uses the 'ranges' both for
setting up the outbound window and the bus resources. 

If the PCI bus scan assigns address 0x8000_0000 to the memory BAR
of a device, and that device or any other one in the /same/
domain tries to DMA to DRAM at address 0x8000_0000, it would likely
reach the memory BAR instead of DRAM. If for some reason it does reach
DRAM after all, it would be unable to do a P2P DMA into the BAR when
it tries.

If the PCI scan already checks for overlap between the DT "ranges"
and other resources (DRAM or MMIO) before assigning a BAR, this may
be a non-issue, but I haven't found the code that does this.
Looking at pci_bus_allocate_dev_resources() it seems that it would
attempt to assign an overlapping address to a BAR but then fail
to claim it because of the resource conflict. If that is the
case, it would not actually have an ambiguous DMA routing
but instead the device would fail to be probed because of the
conflict.

    Arnd

