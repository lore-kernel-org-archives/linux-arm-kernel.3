Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A630C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC+CFVWd/VWYy7402scfBHaFNOZ1+z4P3lAFBCgGdWQ=; b=Bk8up9myxBHprldGl3WnTQLWVD
	gIEKfFRwxd39FDwG96f/CIKjzsNMUS+973OtpT1WRY5L6OI2vdx/ryN5/YeNFepbzIhsjvYojebx6
	5iZskhlHtH4U7ogGsNtjWGyrumiaJaqx4sZibwwbqohrZWsF6fqERn3AWRTYXGlHNxwTR7PwOljra
	j5S5CHMojbwArF8YIb9srXmG650fQGZRoTdbhvMqmpokxRhXKxJtSXJrCg7XlHrdcN/5st2iIYeQg
	YRkTQr87G5RibgXOBH41X66BPywuYKlDoejn16EfCii2BltCAfyNrXUrBfNHQ9QU8LsOtgieAYSYh
	GaKu/0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCbR-00000001L29-3dkT;
	Mon, 14 Jul 2025 06:23:53 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCMq-00000001HvZ-3KIn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:08:50 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 75D78EC0453;
	Mon, 14 Jul 2025 02:08:45 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 14 Jul 2025 02:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752473325;
	 x=1752559725; bh=RC+CFVWd/VWYy7402scfBHaFNOZ1+z4P3lAFBCgGdWQ=; b=
	aDQRSUNAXm+/DcRr8JHFpYax0uaM0MtbIvLQBkPE0LGP414DcT3gKnoamV8T8SEN
	xYDBlC2feBCzsPE8RIOl9gJX/ikFb2POYxKMPEA05S+M8ypfatJ8ALGNrb5cALTL
	KDCKokVRPEcA/wH7mmkvLR21BSJnfsWKsmCPIHbSqW3OM967bPW7ofJ0SSVIqSJx
	3LMnM/KApSyk04F8E1kcEeNy8Yh8Bz3/lpnj04X5uLq2XaQLMgFVQdx3k352jNpu
	6MHc13Lzk98yPzAMgNkUOlqeSsAqcThKlOyCRgE+3WdAUM9G2skt5RrdeoJrr4+v
	WcchmnE45GeMCekZhRbOAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752473325; x=
	1752559725; bh=RC+CFVWd/VWYy7402scfBHaFNOZ1+z4P3lAFBCgGdWQ=; b=N
	MOIB9oIK4aFGz/MAFD2nsL3q6bVhYxOa+1rkg2f7yWSgVHnNep35yY+c0xwQzgsP
	vMRwxeJnGvzwwxmEaQjimrah2ANgib3/waRIs7J0MBff5JWK2BuRG3V/gs48X2mH
	vlSX0MrI8YV61X2YvowWrBpkGbPwwZgKMONU56Du0DBDjQ5pvBmdCMh/Ak6cISlM
	7YxINbF6R4HK3hpbeP6adI/ZbzcjdrSk1IZzjIJr2ToCdWjW9MBjV3kknOLRcbC1
	bAbloGmDZcko0XSzOVQtxTfXl9rd+Dx5DcSZgsIirq7CM+sIpLRzc9Enub5Y6Rzk
	eo+eEwiVAq6EJ3fdKbTeg==
X-ME-Sender: <xms:6550aNISqkL_c_gKSI1GS6zwoONBMO-j0aQrHirsA-Dx9-qhip8wJw>
    <xme:6550aJLL4Ox0N4jUEaYXAg0enHEgZ0Hvj03HUlMKvtRESzvOZlCtNu5UrKmGPZXjZ
    N-Z2U0G_l8VX-cujzE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopehvrghsrg
    hnthdrhhgvghguvgesrghmugdrtghomhdprhgtphhtthhopehrohgsihhnrdhmuhhrphhh
    hiesrghrmhdrtghomhdprhgtphhtthhopegsrghgrghsughothhmvgesghhmrghilhdrtg
    homhdprhgtphhtthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdp
    rhgtphhtthhopehmshhhrghvihhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprh
    grrghnsehgohhoghhlvgdrtghomhdprhgtphhtthhopeiihhgrnhhgiigvkhhunhduudes
    hhhurgifvghirdgtohhmpdhrtghpthhtohepugifmhifvdesihhnfhhrrgguvggrugdroh
    hrgh
X-ME-Proxy: <xmx:6550aCsD6On8GiPFBuhmhjg2cQ8kX7cKAjv83xfvNnNf8nYQRggg1w>
    <xmx:6550aKpYGV3_6_Cw9r9zZqL9Q_5umAHi98hyl4oNeTYJZsfFeuThwA>
    <xmx:6550aEmSWAshMXkV1Pf880BQ9xBOxPKTnOyiXYTu6frVsoV0UZLpTA>
    <xmx:6550aCT8AC-3Qk2ejJ1a-d5tfh-z3Z7Ik7HcexIq2X1piS7MnP9Efw>
    <xmx:7Z50aC55r5eujMz0Dvb8Ej99ArwfSU_zftLIRLdUgHJFaXhmzaUc6tH4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AB571700068; Mon, 14 Jul 2025 02:08:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T0ce86a4a9bc2801a
Date: Mon, 14 Jul 2025 08:08:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolin Chen" <nicolinc@nvidia.com>, "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Kevin Tian" <kevin.tian@intel.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Bagas Sanjaya" <bagasdotme@gmail.com>, "Will Deacon" <will@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, vdumpa@nvidia.com,
 "Jon Hunter" <jonathanh@nvidia.com>, shuah <shuah@kernel.org>,
 jsnitsel@redhat.com, "Nathan Chancellor" <nathan@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Yi Liu" <yi.l.liu@intel.com>,
 mshavit@google.com, praan@google.com, zhangzekun11@huawei.com,
 iommu@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
 patches@lists.linux.dev, mochs@nvidia.com,
 "ALOK TIWARI" <alok.a.tiwari@oracle.com>, vasant.hegde@amd.com,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Baolu Lu" <baolu.lu@linux.intel.com>
Message-Id: <db221336-2694-4fcf-a2b2-8fcb46ba3c9e@app.fastmail.com>
In-Reply-To: <9a888a326b12aa5fe940083eae1156304e210fe0.1752126748.git.nicolinc@nvidia.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <9a888a326b12aa5fe940083eae1156304e210fe0.1752126748.git.nicolinc@nvidia.com>
Subject: Re: [PATCH v9 17/29] iommufd: Add mmap interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_230849_132851_F4765067 
X-CRM114-Status: GOOD (  14.92  )
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

On Thu, Jul 10, 2025, at 07:59, Nicolin Chen wrote:
>  EXPORT_SYMBOL_NS_GPL(_iommufd_object_undepend, "IOMMUFD");
> 
> +/*
> + * Allocate an @offset to return to user space to use for an mmap() 
> syscall
> + *
> + * Driver should use a per-structure helper in include/linux/iommufd.h
> + */
> +int _iommufd_alloc_mmap(struct iommufd_ctx *ictx, struct 
> iommufd_object *owner,
> +			phys_addr_t mmio_addr, size_t length,
> +			unsigned long *offset)
> +{
...
> +
> +	/* Skip the first page to ease caller identifying the returned offset 
> */
> +	rc = mtree_alloc_range(&ictx->mt_mmap, &startp, immap, immap->length,
> +			       PAGE_SIZE, PHYS_ADDR_MAX, GFP_KERNEL);


This produces a warning on 32-bit targets with a 64-bit phys_addr_t,
in practice this would be ARM Cortex-A15 or -A17 systems:

In file included from include/linux/overflow.h:6,
                 ...
                 from drivers/iommu/iommufd/driver.c:4:
drivers/iommu/iommufd/driver.c: In function '_iommufd_alloc_mmap':
include/linux/limits.h:11:25: error: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Werror=overflow]
   11 | #define PHYS_ADDR_MAX   (~(phys_addr_t)0)
      |                         ^~~~~~~~~~~~~~~~~
drivers/iommu/iommufd/driver.c:61:43: note: in expansion of macro 'PHYS_ADDR_MAX'
   61 |                                PAGE_SIZE, PHYS_ADDR_MAX, GFP_KERNEL);
      |                                           ^~~~~~~~~~~~~


The mtree_alloc_range() interface explicitly operates on 'unsigned long'
address values, so I don't see an immediate workaround for this that would
make it work on these machines. On the other hand, 

At the moment, the only drivers that select CONFIG_IOMMUFD_DRIVER
on 32-bit Arm systems are CONFIG_PDS_VFIO_PCI and CONFIG_MLX5_VFIO_PCI.
It's probably fine to make all three symbols "depends on 64BIT" for
now, but I don't know if there may be more drivers like this in the
future that actually could make sense on embedded systems.

     Arnd

