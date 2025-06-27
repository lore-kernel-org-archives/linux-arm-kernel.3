Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF36C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwYMREdsoquOfaH8DwftQzll55uDY1tNpCkxnAXYMU0=; b=Sb0IQEpN6nKc8zil+hqyd7oQLz
	XR1UZrqW6KOKegOLXxPCUREc2i1X4JZ/5IikX5PAbminp6nJQjMXqdEvUjibyRl7MD0vZ+aOebD/6
	I7jsj+wF6d5OeuyLFLI3tep/zvrsD9Kv+KAiIn5f+ADvS8SWfzp907hsD5/+AvyTZw0H871WRiR2l
	ENfVd4vj0rJhapu/lJLv28pxYL3cfM6/+ThzzZlXqaE1bxm/4C55ItBstuvlNXVHTtObJsNxUhmGM
	xrPLtqGwq0XImAjte/fNa9vBUVxgBEYlKrpoApRKez5vLa9VgqxQKd8J2waaaiSvf9LiQOWgwDpfb
	b2zag6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA4v-0000000Eutt-2eCj;
	Fri, 27 Jun 2025 14:29:21 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9NH-0000000EoIF-3jzW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:44:17 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id EC73AEC02AB;
	Fri, 27 Jun 2025 09:44:12 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 27 Jun 2025 09:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751031852;
	 x=1751118252; bh=MwYMREdsoquOfaH8DwftQzll55uDY1tNpCkxnAXYMU0=; b=
	Zxk6VSsdo1LsAyRcgfOPdlN6RiCgCoP7JgQDkhQXuvUusPfN3QyZ4l6kCYtkbtMp
	DjS9G6iNLmvC660VnspQ3dxD+qH/iotPzz8R9AQH10Bs+C+wLwuKKazEWWTVVNlF
	AvRlbg2FHhq+D3X2fl9KsYcofbNxo+xD3cba4tortPc86Idy9DLgNdaa5UaAvwwd
	n+QT0FN7wqRPTQFsYb8+d7DTF8E0qhV3Rl9SMLkyLxpu8QuPIltED8QznFyPiY5g
	dLJCH+7DTM8o9c3HJAqdODDYnqRiwSSEFCFnwj7SGevW8D4BUijNl5HqCNfHk8qf
	HYy/qW96uLDjhVOO/tMaZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751031852; x=
	1751118252; bh=MwYMREdsoquOfaH8DwftQzll55uDY1tNpCkxnAXYMU0=; b=Y
	MlvIMbOlITqfMyLwBykRnbA/BXk1s7ugPjpkaoqqGE6i/JOQELaKG1PbUbm46ycl
	LvW51Chgb04N6XOX8Gkc0yvEMn1eYuVuIZbV4bWZ2E9Not9loXiD2nOUTeT37EHp
	39mrnkrpM+xqZiCGdGA9jhBaOo9sWHi12jxfQVeYc8NyPxXN5sqGXwSsVUdq/8DZ
	JHZs0jRM79xueSuA4hoR2bCDjVWNeFcdt+vMWD+Qp2g3LTZIPjxqZVcNdIdknM7s
	9fuOUSkcDH9z/ioBsAoEpx3Q+q2iuFv65IVWdABW40LgGuRwxgC4ksOO3bgHMthr
	R+PoBq8odXtudeooO4RfQ==
X-ME-Sender: <xms:KqBeaPU8h5RoYcHy4fl35wVMfqSg_k9j8UKaiyWHDPq8kRO_4WOK_w>
    <xme:KqBeaHkuK66dRi-PToEoZ-i9j4b_XxgmM7e_d2liIJKivyDT_B6i7mzb4IFN4yR9i
    y42E-V6fptTjA51iEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehgohhrughonhdrghgvsegsshhtrdgrihdprhgtphhtthhopegsshhtqd
    huphhsthhrvggrmhessghsthgrihdrthhophdprhgtphhtthhopegrnhhgvghlohhgihho
    rggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpth
    htohepsggvnhdrtghhuhgrnhhgsehgvghnvghshihslhhoghhitgdrtghomhdrthifpdhr
    tghpthhtohepvhhitghtohhrrdhshhhihhesghgvnhgvshihshhlohhgihgtrdgtohhmrd
    htfidprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhr
    tghpthhtohepphgsrhhosghinhhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsh
    hhrghntghhuhhnuddvudeksehgmhgrihhlrdgtohhmpdhrtghpthhtoheprggurhhirghn
    rdhhuhhnthgvrhesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:KqBeaLbXD7Fuyd7wgKIt6ZtxHzzvwSeXxSYnrf5Rv4AEjO4vCXwbKw>
    <xmx:KqBeaKXIN5Qh3uGeBHX7HTGVVr6YYXhSbsZUpbc5AUUvfpQwq9bh8Q>
    <xmx:KqBeaJlwZIR_cY_XjkhIljx9f9M8MWUGjfIMwjnO8w95Z6F533yXew>
    <xmx:KqBeaHcD4JdP6c0Wcair0bofHudvv6yK1Zz0267UNbRtc_cpsv0dqQ>
    <xmx:LKBeaKZ1JFmVwyzmIn7NwZV1Eyk_ijJFUDDfHY-n-OcH3z8pBpg73cbY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DA76D700065; Fri, 27 Jun 2025 09:44:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tedb66c89affcaf60
Date: Fri, 27 Jun 2025 15:43:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Adrian Hunter" <adrian.hunter@intel.com>,
 "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "gordon.ge" <gordon.ge@bst.ai>
Cc: bst-upstream <bst-upstream@bstai.top>,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Victor Shih" <victor.shih@genesyslogic.com.tw>,
 "Shan-Chun Hung" <shanchun1218@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Peter Robinson" <pbrobinson@gmail.com>,
 "Ben Chuang" <ben.chuang@genesyslogic.com.tw>
Message-Id: <5c0909b4-f3f6-401d-9a17-8560c5a1d7c0@app.fastmail.com>
In-Reply-To: <b6bf0b53-8812-4099-b5d3-39e7fd264777@intel.com>
References: <20250528085453.481320-1-yangzh0906@thundersoft.com>
 <87619781-629b-4393-8c14-b34483a7c734@intel.com>
 <202506271822530452465@thundersoft.com>
 <b6bf0b53-8812-4099-b5d3-39e7fd264777@intel.com>
Subject: Re: [PATCH v1 5/9] mmc: sdhci: add Black Sesame Technologies BST C1200
 controller driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_064416_273634_2D5A746C 
X-CRM114-Status: GOOD (  21.21  )
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

On Fri, Jun 27, 2025, at 15:19, Adrian Hunter wrote:
> On 27/06/2025 13:22, yangzh0906@thundersoft.com wrote:
>> Dear=C2=A0Mr. Hunter,
>>=20
>> Our platform supports 64-bit physical addressing, but the eMMC contro=
ller's SRAM-based DMA engine is constrained to a 32-bit address space.=C2=A0
>> When using the standard SDHCI interface, which allocates DDR-based DM=
A buffers with 64-bit addresses, thedma_map_single() operation fails=C2=A0
>> because the DMA engine cannot handle addresses beyond 32 bits.

dma_map_single() should always succeed on arm64 even if the buffer
is outside of the dma mask: On most modern SoCs there is an SMMU/IOMMU
that implements the actual mapping, and in the absence of that
there is a fallback to SWIOTLB, which is always built-in on arm64.

> SDHCI controllers can use 32-bit DMA or 64-bit DMA, however even with
> 64-bit DMA it is possible to restrict the DMA addresses to 32-bits
> by setting a 32-bit DMA mask.
>
> If the host controller capabilities indicate support for 64-bit DMA
> but you want the driver to use 32-bit DMA, set SDHCI_QUIRK2_BROKEN_64_=
BIT_DMA.
>
> However, if you want to use 64-bit DMA with only 32-bit DMA addresses=20
> you can instead implement sdhci host op ->set_dma_mask() and in that
> function dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32))

I would not expect an standard SDHCI to be broken like this any more,
and if it is, I think the SDHCI_QUIRK2_BROKEN_64_BIT_DMA quirk is
more appropriate than overriding the dma_set_mask() operation.

What sometimes happens though is that the SoC integration itself is
broken, and a 64-bit capable DMA master like SDHCI is connected
to a 32-bit bus. In this case the DMA limitation should be
described in the device tree, using the "dma-ranges" property
of the broken bus node. The SDHCI code then still sets the correct
64-bit DMA mask according for the device, but the dma_map_single()
still uses an swiotlb bounce buffer or the IOMMU to work around
the bus restriction.

>>  To resolve this hardware limitation, we implement a bounce buffer al=
located via >> dma_alloc_coherent() to satisfy DMA addressing constraint=
s.
>
> The bounce buffer should not be needed to satisfy DMA addressing
> constraints.  It is used when SDHCI ADMA (scatter/gather) is broken.

I wonder if the actual problem here is not the addressing limit
but instead the coherency protocol. If the DMA master is cache
coherent but listed as non-coherent in DT, or vice versa, there will
be data corruption for all addresses, and using a dma_alloc_coherent()
bounce buffer may hide this.

       Arnd

