Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939A3C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCMfbSaOwpMUB5rw9+kLGenKL8wvwuM5x9U65b/I+/M=; b=duzzoEARDMIgPJsfbr/syzWTca
	+NGe8nvBQnWozm8eibX+qY2EIayRX1edfIU8u+GIF3RXJJWQ1RGYElR6vk98Xbj7XURNwLwEDdFwo
	jMWpo0Uid96Ypnii9l0OCUKJnQISBJtDyi3+D64UqV0Sr99w9np9DAMfFR3Ufdj/nNvNKKISl95/7
	yjfXpxYhpttdoei6kVvYCfoyZw+6aTlwuHPpfRKbh1GZUUmUR7m1WD3adruouFREODJBF2rCzpS2x
	ZgvSKvReQbYJM3xAtv5x/3SGQI1JG2iUdqHIPF/XC4GJFfcmxPaxnJxsBX9Vf9lwLlXxxyiyNi+QQ
	FQBYvHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pr2-00000006gtM-2nxn;
	Mon, 28 Apr 2025 14:53:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pdq-00000006f9N-2xjb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:39:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD63D1516;
	Mon, 28 Apr 2025 07:39:22 -0700 (PDT)
Received: from e133081.arm.com (unknown [10.57.20.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F5013F66E;
	Mon, 28 Apr 2025 07:39:24 -0700 (PDT)
Date: Mon, 28 Apr 2025 15:39:22 +0100
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com, suzuki.poulose@arm.com,
	yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	paulmck@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
	maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
	oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com,
	ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	kevin.tian@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v6 3/3] arm64/mm: Reorder tlbi in contpte_convert() under
 BBML2
Message-ID: <20250428143922.GA348493@e133081.arm.com>
References: <20250428143352.53761-2-miko.lenczewski@arm.com>
 <20250428143352.53761-6-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428143352.53761-6-miko.lenczewski@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_073930_784509_7A89E1B3 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
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

Embarassingly, managed to leave around a stale patch when renaming the
commit. Please ignore this patch, the correct one is "Elide tlbi in
contpte_convert() under BBML2". Am considering resending...

-- 
Kind regards,
Mikołaj Lenczewski

