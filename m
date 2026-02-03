Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDA4E8784E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpSajIVZjkZZLcEgZT2wYAImlkh3WeN99av2xam9naA=; b=fhQfkvE8LdXqdlTw+6RuR44Op5
	LoVhj46eZjPxGbBhSD++WuQzltKQuQ8b0OzS6IOVQHZ6x1WtPqGOBsocyPNdShFjggpMThko27UV7
	3qzHk2zTAYZLguOSfCQUzB2mrJGx2c0RfnTRRoWwWP+qFUCI8xSFJc97BuIHNKohqAgYoBMTRVOrW
	gJHg8UIwgvxaZxyMXWhh3nT1g15kIipSzR6AJOMZfaJt8i5DJNCyNCjQGQEIkIZ+IJcAy2+2norSq
	y9eiFY+8jxIYKxNiuFzr8KegInHZczQ3zaoILF6vvTD5jY3SMfB6gCP8Z+t1tVA85/iPpSOqu4I6x
	bBHYwn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnK4F-000000072K8-195y;
	Tue, 03 Feb 2026 17:19:59 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnK47-000000072Ik-3vm1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 17:19:56 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3E96F1400087;
	Tue,  3 Feb 2026 12:19:48 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 03 Feb 2026 12:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770139188;
	 x=1770225588; bh=fpSajIVZjkZZLcEgZT2wYAImlkh3WeN99av2xam9naA=; b=
	euWKCmONC965n640l7qWtqVS3FYbGPKjBpEyaztDTFQPBii9umSgtdcBQIjqjmnf
	jW43Dle9DCwQ9rWGrcmpqxuhmz9CU0fGEEtVbWcVxSKRyREcuKY1UPpQabJAUbBs
	CSnx8pl+giDRZgK00FSRed51vYpUNPoyW6RysBQu7Ii4hNwOLWgrH8es38Mx//dg
	Rgen+J+gaIC5PuoLfNdkpPQ7kbVR6QhEtECrz9Z1C9Pk6Miux2+oQlL/guGYmb2z
	6wUdEKw1dSW28xAJg0hAeXZ35dNXPimwRnrne6B9nV1qR/1FqtnKc2wUbnQaqUbS
	5gKMblzG64XE/qmN5F5yBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770139188; x=
	1770225588; bh=fpSajIVZjkZZLcEgZT2wYAImlkh3WeN99av2xam9naA=; b=H
	QJvMqr0ObN97cp+qltQa2RE9+zSX2qqLtSqAF+4Gc0wLqAEwxHy0m6T0iu4DkOMJ
	+/quGG1sOL1BYdEgC8ASzxbI0b8MW6Rpc+jasTxMQYkEdNJ2aaMSy8VRTsQtyMN/
	puRp+swlAgGIQbAcnsIV8zkfI0P5b/lqDSyfA2f+ABrjHwL2C2tnq0gkZA+fvV3g
	qXYPeYkEmFfFwOJularvy64k13GkPykuEKZiRLUd+z4abpKJWtZkypruvjiXydM5
	C6Z7azwVsOHHz2AMwqcD7JzxmVo2O4QmVZImSt7wv/6T4rGtaa19MiCGxKrhtr1X
	gXc4v/WXS6/R7/FSxOlsA==
X-ME-Sender: <xms:My6CaWwxx-o0fnEUSfc2ZpcWoAvF0DdgsiyPH6-jGQZuSN8NuioYzw>
    <xme:My6CadHmVQC48cj1RZzetTQSO1CTzC9RMHmIFpFv5yIT-RCbngJzjUYBen-i1nXHj
    9ZW51y_8v-jzUS2DMpQ9KF-hK7asmlJo7WtLrEVwCoEq1_1Tf87hF2S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedtieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrd
    gtohhmpdhrtghpthhtohepphhrihhmvgdriigvnhhgsehhihhsihhlihgtohhnrdgtohhm
    pdhrtghpthhtohepfigrnhhgiihhohhuudeshhhishhilhhitghonhdrtghomhdprhgtph
    htthhopeiguhifvghiheeshhhishhilhhitghonhdrtghomhdprhgtphhtthhopehjohhn
    rghthhgrnhdrtggrmhgvrhhonheshhhurgifvghirdgtohhmpdhrtghpthhtohepfhgrnh
    hghhgrohduudeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugigrrhhmsehh
    uhgrfigvihdrtghomhdprhgtphhtthhopehlihhuhihonhhglhhonhhgsehhuhgrfigvih
    drtghomhdprhgtphhtthhopeifrghnghihuhhshhgrnhduvdeshhhurgifvghirdgtohhm
X-ME-Proxy: <xmx:My6CaSs-8x-M5Euq5mYm0mJtPzc7Uw3rkmBe_thl3yMLioYZJbDdxg>
    <xmx:My6CaW4-d9kt1Se1Jyq5ocJalsjzDBWT6BNbLdsuoUmK2cn6Oa4aHQ>
    <xmx:My6Cae1tbz8dfv10Ebq7SG_5cDDWctAY62Jc5bfn7Xhz-nYmP3Qb3A>
    <xmx:My6CaRgvWy80k3fPZzTH3NPJ59-iVB_3B9RC7Zqe5uaq5WaAgyI9MQ>
    <xmx:NC6CacAZT5MVaB2eg7jHicvzTU8HwKwUjhpkbJAjLIOM95nEOtlItdMr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 731EE70006A; Tue,  3 Feb 2026 12:19:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdHIckEZVcNF
Date: Tue, 03 Feb 2026 18:19:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yushan Wang" <wangyushan12@huawei.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: fanghao11@huawei.com, linuxarm@huawei.com, liuyonglong@huawei.com,
 prime.zeng@hisilicon.com, "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Wei Xu" <xuwei5@hisilicon.com>
Message-Id: <a8ba1c0b-e7c8-44c5-b785-42752f7f5d8f@app.fastmail.com>
In-Reply-To: <20260203161843.649417-2-wangyushan12@huawei.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_091952_043634_0DD0918D 
X-CRM114-Status: GOOD (  21.94  )
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

On Tue, Feb 3, 2026, at 17:18, Yushan Wang wrote:
> The driver will create a file of `/dev/hisi_l3c` on init, mmap
> operations to it will allocate a memory region that is guaranteed to be
> placed in L3 cache.
>
> The driver also provides unmap() to deallocated the locked memory.
>
> The driver also provides an ioctl interface for user to get cache lock
> information, such as lock restrictions and locked sizes.
>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Hi Yushan,

Thanks for your submission. Since we are in the last week of
the merge window, this is not going to be linux-7.0 material,
but I'll have a quick look for now.

>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  MAINTAINERS                                   |   6 +
>  drivers/soc/hisilicon/Kconfig                 |  11 +
>  drivers/soc/hisilicon/Makefile                |   2 +
>  drivers/soc/hisilicon/hisi_soc_l3c.c          | 357 ++++++++++++++++++
>  include/uapi/misc/hisi_l3c.h                  |  28 ++

I don't think this should be in drivers/soc/, since I want
to reserve that for internal drivers without a user visible
interface other than the soc_device information. (yes, there
are a few historic counterexamples)

I also don't think this should be a hilicon specific interface,
if possible. The functionality is not that unusual in the end.

We had similar concepts using the numactl system calls in the
part, but I don't think we should do that here because you may
need the numa interfaces for other purposes as well, and it
may be confusing to existing callers.

Having a generic madvise() based interface would be great,
not sure if hardware support for that is common enough for that.

> +	/* Continuous physical memory is required for L3 cache lock. */
> +	pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | 
> __GFP_ZERO,
> +				cpu_to_node(smp_processor_id()), NULL);

Since this is a user allocation, should that be GFP_USER instead
of GFP_KERNEL?

> +/* HISI_L3C_INFO: cache lock info for HiSilicon SoC */
> +#define HISI_L3C_LOCK_INFO	_IOW(0xBB, 1, unsigned long)

The specification here looks wrong, please see
Documentation/driver-api/ioctl.rst

I think for your implementation it should be

#define HISI_L3C_LOCK_INFO	_IOR(0xBB, 1, hisi_l3c_lock_info)

> +struct hisi_l3c_lock_info {
> +	__u32 lock_region_num;
> +	__u64 lock_size;
> +	__u8 address_alignment;
> +	__u64 max_lock_size;
> +	__u64 min_lock_size;
> +};

You are leaking kernel data because of the padding in this structure,
please rearrange the members to avoid padding.

It may be better to use a different interface instead of ioctl(),
possibly exporting global data in sysfs.

       Arnd

