Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1156C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhJmZaJPWu2tGQu9cD5mC0NR8f5AZSYCs6/SZ99TC3M=; b=tRhJ3uNK1ySSeA6KpnLcgZ81Cm
	gcJG9j6YtvEInYfh8oGL0z4pTVgmRw890MS7lD2LgucUw3p0cp+MGF7+olVNopqFMGtsz3E9NwFf5
	G8TyV+347FOzX25UIuXhmwoz3xZfmjokfT9lmtIa6hgE3hONqoT+OzO5N5q1wTxqX3kJgM6GX2aFC
	32wp9EWvv8GhsD/wPlCTg8wlpa+7KnVKlWtVX738fQxWZVdVQQtlHHHibloguYOAHFLvH5qnEwd94
	onIY/QUitCPnRf21rMXwM209olh61pmmQ9BCNvVHrblpbl56dMl799OHSlveOUv6r3aevXyvHxzRE
	Vv+tqlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRVo-00000000G9o-2cek;
	Thu, 13 Aug 2026 09:14:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRVo-00000000G9h-0w7I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:14:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77427600AF;
	Thu, 13 Aug 2026 09:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673031F00A3A;
	Thu, 13 Aug 2026 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786612447;
	bh=zhJmZaJPWu2tGQu9cD5mC0NR8f5AZSYCs6/SZ99TC3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Jb9o2WF4mJul7AfKWjZXxrn422eNlwV0OpD+YUFGaeWd6bV48nwOVrU7hqdRUi+C+
	 MMx4opwElstv+v12Jm6nH90+reZr0lst/MhRIUedGK2xlbjCtlG9nXCuqjcbRYusO8
	 X1lS+eSvLFUyqG9RQZpJPU1Dn9c9K3lMzwNnYQ/HvtF3Gfeh48zxH+XBa6Fb5Yyvvh
	 hFmFH9g0W6IrqIJjg8vT3CnEkPq+B4NO/K7RPYK//Xj76c4UIu2t6NY3pE/WZCVSVx
	 oHcTVrUCMzfVvoO0ByHsO9gTDpn6yo+uhhMAdcX6QxDcfH1IvdyynOvdpX89zJO1SY
	 LEmdUB6XPzQKw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [RFC PATCH] dma: swiotlb: Size shared default pools for memory
 encryption
In-Reply-To: <an2EoONjyp570tvB@arm.com>
References: <20260811134056.756015-1-aneesh.kumar@kernel.org>
 <anxEc8EHmJQywVI5@arm.com> <yq5ajypvioks.fsf@kernel.org>
 <anysnQFVTO_RAYxp@arm.com> <yq5aecg2io0u.fsf@kernel.org>
 <an2EoONjyp570tvB@arm.com>
Date: Thu, 13 Aug 2026 14:43:53 +0530
Message-ID: <yq5abjb6idri.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

>> >> > BTW, why does arm64 report CC_ATTR_MEM_ENCRYPT instead of the GUEST
>> >> > option in realms?
>> 
>> This is getting fixed in  
>> https://lore.kernel.org/all/20260701054926.825925-9-aneesh.kumar@kernel.org/
>
> You might want to bring this early together with the swiotlb adjustment
> here.
>

That is already part of dma -next tree.

-aneesh

