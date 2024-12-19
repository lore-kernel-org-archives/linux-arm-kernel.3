Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39AAE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiqnUGVe/lCTbHA/Hbj2aFzErHkrlGpLBodz7OPWipA=; b=CeJodBv87DwBj2FnnBTun5CJGQ
	9DMZPaGTZ+VXzQH0fv1XWitJF4aOr1sWVL4xR/F8+wAVwKRp08s5+610hvZRaiNMI/0w7xjn9grHi
	N0xH2wfdl2cOLQfGFyUlbI/CbisIJRQZGIVEkdAzN4sUv9uJ/QcF7DeoW+2tQASxdspixqcCzBERE
	2fSH2JKbC7YAZtc6WljK0xVFqe0vkjPNotZcxTqgLdqpeXOW4WUQKlHh/Po9uCNiMDDMLUgwHeupX
	LqiVHf12e+tK0o0M/OAKLUjtk+cVGhJ6rYGGFAAmxdlpRYFcnQ9C6gX+BHtQfrYJxBBIPpn3TnqhJ
	dugHDFcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJWY-00000002Nhm-1Los;
	Thu, 19 Dec 2024 16:37:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJVR-00000002NRO-1okb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA32E5C006B;
	Thu, 19 Dec 2024 16:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2E3C4CECE;
	Thu, 19 Dec 2024 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734626168;
	bh=i7qwNCit3QKYSAzYX+8Ze4W++VaLCtBrN0dc166zRl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIeHtq8wqTqb+0McM63yuiluXBY0IBrVdmvc+j3yxug65zbxXPiYlDAr4dZxnqT6O
	 RIeNGIkE68syYx4zs9a3SIUBZO87trPB69r46G6BacTzyFc5hJDxrFh8PtHHZtKrX9
	 DdHS4oKqNDbY0nED02LOy+xZ0h+2xhyvtSUwfbyQBQKEVMSxBm60ZrQRiu+fWhdGJu
	 9CfvRlG7fimxYUNVg5mm06bs4n9pVqc7Mi4QO/n/Ci8B84SWaNInTmUmbWpQS0b/oP
	 q9ostGD3Itsp5JgfnCxL1qIH7n4g3ysno1yM73C58AIquUFkx21Zt6aiEoX8w3R+QJ
	 tr08Zipuv4mFA==
Date: Thu, 19 Dec 2024 16:36:02 +0000
From: Will Deacon <will@kernel.org>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, catalin.marinas@arm.com, corbet@lwn.net,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 4/5] arm64/mm: Delay tlbi in
 contpte_convert() under BBML2
Message-ID: <20241219163602.GF24724@willie-the-truck>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-5-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211160218.41404-5-miko.lenczewski@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_083609_511664_C9F9CE86 
X-CRM114-Status: GOOD (  12.54  )
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

On Wed, Dec 11, 2024 at 04:01:40PM +0000, Mikołaj Lenczewski wrote:
> When converting a region via contpte_convert() to use mTHP, we have two
> different goals. We have to mark each entry as contiguous, and we would
> like to smear the dirty and young (access) bits across all entries in
> the contiguous block. Currently, we do this by first accumulating the
> dirty and young bits in the block, using an atomic
> __ptep_get_and_clear() and the relevant pte_{dirty,young}() calls,
> performing a tlbi, and finally smearing the correct bits across the
> block using __set_ptes().
> 
> This approach works fine for BBM level 0, but with support for BBM level
> 2 we are allowed to reorder the tlbi to after setting the pagetable
> entries. This reordering means that other threads will not see an
> invalid pagetable entry, instead operating on stale data, until we have
> performed our smearing and issued the invalidation. Avoiding this
> invalid entry reduces faults in other threads, and thus improves
> performance marginally (more so when there are more threads).

Please provide the performance data.

Will

