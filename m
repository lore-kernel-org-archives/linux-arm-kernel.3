Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA71E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDEweB5JCoIzGEE9E+n61alYHZz6R1aO4hhVvfXk1Kk=; b=V87nKm6J14A3SLaJ+4dS/SwOac
	IytL7jZBlECGIY8Prlj6v0+fkqaA59g9S/R5IsxZU3X5KIxysP+DVw2BWYdxo4/j9tI2KBTu5q9OG
	uGT/FgycY4k3o49s2Y60ITVI30Q8X7bVg8s7Lc0BfUXYSnEX8fYH6snE6hbc+XiJf0n0d2rLWz4yO
	2dyZmgTlVrMYhFOzwwTY70vgkZ/9q4NYSHHS0ndUQUAsMOCRwJ0DlTBFkLJCA1DEMAqH5P8r2qEWz
	Y/Lx5dpqe/YfXpTD0tsPn8fjSzhO7ZuUK3/MBLgIMCUXYwFRmbw7Bu96Z/NlTYCxdR3QtA33MFrV9
	QdpIQrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0v1-0000000BgsI-39vT;
	Tue, 10 Dec 2024 14:08:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0ty-0000000Bgen-48fI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9133A41507;
	Tue, 10 Dec 2024 14:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C73C4CED6;
	Tue, 10 Dec 2024 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733839669;
	bh=hEUtZzuBGTA2NOGk9ts8sazRmir1XBBr6jwB7hoMZlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avoEUmP1d9QdOaaXSiVgk6gC/OtmdYD96h4aD1/i0n1hksL6RqcyxtUApsBkJ5JYS
	 Urna5iTGqdKjzfW2PJPIZ3NjTei6K3Z+Z4EFbejBnOhJxEvUF5ZVUdAumLpk3uolqX
	 j5MwOyag1LeUKWgGlKxTknXH7zfto8kVef/uXuqs8oFurGsx49ugNXV1AVQy7SsgqI
	 +JqZMkepFbwmr51yoOOitu+kyqBGgeEMmvU68j9B6ljmZK4OjIj29wePjEErWpf0vy
	 qfXgHDZtFknnb90gAqURUgSVmoXqAwVn4fRAkX+RRxvcKwiS/K+041IbGMprBfqlfA
	 qtJbfIspuwQ1w==
Date: Tue, 10 Dec 2024 14:07:40 +0000
From: Will Deacon <will@kernel.org>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
	acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
	danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com,
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/1] KVM: arm64: Map GPU memory with no struct pages
Message-ID: <20241210140739.GC15607@willie-the-truck>
References: <20241118131958.4609-1-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118131958.4609-1-ankita@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_060751_089407_8714BEA0 
X-CRM114-Status: UNSURE (   7.72  )
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

On Mon, Nov 18, 2024 at 01:19:57PM +0000, ankita@nvidia.com wrote:
> The changes are heavily influenced by the insightful discussions between
> Catalin Marinas and Jason Gunthorpe [1] on v1. Many thanks for their
> valuable suggestions.
> 
> Link: https://lore.kernel.org/lkml/20230907181459.18145-2-ankita@nvidia.com [1]

That's a different series, no? It got merged at v9:

https://lore.kernel.org/all/20240224150546.368-1-ankita@nvidia.com/

Will

