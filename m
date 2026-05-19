Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B9FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyxSie6iGAWz0pB/vmjQiqcUpqr3MLIifYDTqIoI7Q4=; b=BIC/jq6Az5wD+HsfS7hRpGLBxA
	DHlw135hS5FGttVuum6y+9N/+Qltw4Ke6sNdWmoNkxAJKIpV4pqOxvb2VK1mUbhyW0x9lN2pqci8L
	fLvmFmx4qux8viSn2yUvIPfX+ed10ckgttiZOj/CTHkd9t4S63iOEiYHMh1IsywmIJOIxXW7d27uH
	YV+IrfeXGCwMcxI5/OLVvZ61BO5KkPSviV1m3GwPHoZoSj5OqZ6Tg7IwqZV7lEneHxrgskaHKMPOr
	b6skO0B0Z/nu4reITBhhXfHxFZ994dQCRibUlSCuSwHaZjfUuvIeOnV4iDqsaRQbBIXmYjcoP4OL1
	cLgtqXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPH1f-00000000z59-3Euu;
	Tue, 19 May 2026 09:46:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPH1d-00000000z4U-3Dlz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:46:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE19644131;
	Tue, 19 May 2026 09:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5585C2BCB3;
	Tue, 19 May 2026 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183968;
	bh=1q56YkIpKB4JqZI01BH4FGFKZ+NyxhaqIasZhEiOaEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+k1LzZVosvKUbvNbN5b7ee5QQzUzDzCg7R0bOFvcIBc9zv8fxG1IKt8wpE3vxcK7
	 0Svy7Bv0lPxEA8cGkTJvQPRQX7RHXpAd97lsRPuUc6JCAKiapNDITY1TloGy+RyO8N
	 0fqGHQG9m00DmltF7HavJO7VF5V7knoRs2fXXvGR2vv3Fp7wiSm/2VGQavt95f++Ja
	 VM0ySeFlulqA0TqL18E2k6uQ1IFtr52gBJbxxzYTuc8w6aDxYHL2RLz4w7xsnRTH/s
	 GtE5V8nYWAApzu3U+W2jfOB98Dbn2lxziJKb1HkgsKedebfpcoVlDKuCXLmm2gQnll
	 ofmfQgOwiNHMQ==
Date: Tue, 19 May 2026 10:46:02 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 00/14] coco/TSM: Host-side Arm CCA IDE setup via
 connect/disconnect callbacks
Message-ID: <agwxWlORbd5F9N4N@willie-the-truck>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
 <agsNO9cc7H-b0H8L@willie-the-truck>
 <afca6cdd-f9e3-4b5f-9f70-940c8dbb7a80@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afca6cdd-f9e3-4b5f-9f70-940c8dbb7a80@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_024609_825636_3BF43881 
X-CRM114-Status: GOOD (  13.95  )
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

On Tue, May 19, 2026 at 09:24:07AM +0100, Suzuki K Poulose wrote:
> On 18/05/2026 13:59, Will Deacon wrote:
> > On Mon, Apr 27, 2026 at 12:21:07PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > >   arch/arm64/include/asm/rmi_cmds.h         |  85 +++
> > >   arch/arm64/include/asm/rmi_smc.h          | 168 +++++
> > 
> > Curious, but why does this stuff have to live in the arch code? Wouldn't
> > it be better off somewhere like drivers/firmware/ or
> > include/linux/arm-rmi.h?
> 
> Good point. RMI interface is only available for arm64 (not in Arm32). That
> said, it is indeed a firmware ! ;-) interface. The APIs are closely
> integrated with the KVM Realm management. If the general consensus is
> to move them under drivers/firmware (like PSCI), we could take that
> approach.

I'd certainly prefer that as it means it's co-located with other firmware
interface code and also means that the arch maintainers don't need to
worry about changes to driver code :p

Will

