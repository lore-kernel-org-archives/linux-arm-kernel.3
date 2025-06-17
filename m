Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E06C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaE2hWQu9326rZk3Yfx6EAOukTWYc/yWzyPuwYJ97XA=; b=b5xYlLxZwRJzELrxfybtiJ44nu
	WHEnJQGiAyGYwJLemSk1MvPt2BJWaIfN0cMmDDAFbDQyKCU7m026OaN2KlTX5RXwOhRGbqaZ+0qi4
	+IDl8clFCIvlbD+/fpvw0pWkFZHsP1ddAdEp/k0uu9R4O7uQ15GOy15cA0JPkJcB40Ubak0Cey4Ii
	2mjut1E7uJw//WJuTaJhunhv7Nhpk8Hufhb7Vbjq7Aqe8AYGlT47BIKskM8sayezwog7xIsy6VDCe
	z9f1/lNaAhlE0PkuQ0RRSZ9Comf/MhjgYfJ4YsDX9k5I2M7x05k3V3Mm/uOSlvxy/ez6GPu0QqWtc
	tPOfu0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTrd-00000006xqQ-0xqZ;
	Tue, 17 Jun 2025 10:48:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTf6-00000006wGR-0A5Q
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 10:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=aaE2hWQu9326rZk3Yfx6EAOukTWYc/yWzyPuwYJ97XA=; b=oSG0jSpu9kuoMT5PU/YwK8x5rC
	h3aepqQS5JuANsKz2feaFh2mDogIL5abvtJhTR4+GxIby+F4uGD9PPL6Fe2hpCiqy2uzm4dadbSU2
	WzGYqITBqhQYxuY4+XjroOyu9MlXFzYC6AZ2HLTKvvQ5iiTS0n4flJkHaTG+W4N3Nk3oukWe+Cqz3
	QAaSS9EiheqMgHJK1+IcfZDIElyAWatxQ6QtRr6yr0SxjAsMDAvb5pKzW1fLRImgvb83mHLa8p5V0
	dHzgsyTFwhd2jO++uXwxWE0JKFnQ1dhjK5380nYL0S/IRXDPd4OXLvwmgX1sYJ9ITVTWnl39Xw/94
	XCRxeW3A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTf3-00000003mJc-1r9i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 10:35:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0810C1596;
	Tue, 17 Jun 2025 03:35:01 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62CF73F58B;
	Tue, 17 Jun 2025 03:35:19 -0700 (PDT)
Message-ID: <f9cf869a-7f86-4600-a2d1-b9092551105f@arm.com>
Date: Tue, 17 Jun 2025 11:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] arm64: Add BBM Level 2 cpu feature
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 ryan.roberts@arm.com, yang@os.amperecomputing.com, catalin.marinas@arm.com,
 will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
 joro@8bytes.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 james.morse@arm.com, broonie@kernel.org, ardb@kernel.org, baohua@kernel.org,
 david@redhat.com, jgg@ziepe.ca, nicolinc@nvidia.com, jsnitsel@redhat.com,
 mshavit@google.com, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-3-miko.lenczewski@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250617095104.6772-3-miko.lenczewski@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_113525_718232_46486120 
X-CRM114-Status: GOOD (  10.14  )
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

On 17/06/2025 10:51, Mikołaj Lenczewski wrote:
> The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
> and this commit adds a dedicated BBML2 cpufeature to test against
> support for.
> 
> To support BBML2 in as wide a range of contexts as we can, we want not
> only the architectural guarantees that BBML2 makes, but additionally
> want BBML2 to not create TLB conflict aborts. Not causing aborts avoids
> us having to prove that no recursive faults can be induced in any path
> that uses BBML2, allowing its use for arbitrary kernel mappings.
> 
> This feature builds on the previous ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
> as all early cpus must support BBML2 for us to enable it (and any later
> cpus must also support it to be onlined).
> 
> Not onlining late cpus that do not support BBML2 is unavoidable, as we
> might currently be using BBML2 semantics for kernel memory regions. This
> could cause faults in the late cpus, and would be difficult to unwind,
> so let us avoid the case altogether.
> 
> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


