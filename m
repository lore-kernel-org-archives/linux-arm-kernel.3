Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248B310F9313
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxUAsrfsXuu7Y+QFoGYJYIzbo+xO3Ql1RR0QzEM3dHU=; b=iRXh7D6O9fm2TGud/dRmxhQ5N8
	cveNT/Jn3oJ7lGX7ZpBM9UiMpMJdhCYxJzJQUZOhtanloGXRX8uI3F+3ZsifTSxHQrcNq+qB9EQjb
	JCCgl7b8A/PJghVGQ5xAQH5zawXVjOLH+cVUcz03/8WTe0wZiolg8R5hlH23DkzCR9A1ijiJATacc
	/pku8YcYUaGkVKd+WMWX1EO6QDNgL0JEPCiWpKnwALJ6yCPiGlQKYCRkI/tEL8ueEPAfkuBW0Eq2r
	t7DSyYmQJyHFPZMHd1wlwzGmHz86+sBICvtutAmCB1a1yLZssdDwgaLk7K7ZHHth54H4rY9KemJRU
	mqiMm4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w804A-0000000FwUU-04vY;
	Wed, 01 Apr 2026 18:13:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8049-0000000FwTx-2fOB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TxUAsrfsXuu7Y+QFoGYJYIzbo+xO3Ql1RR0QzEM3dHU=; b=F4kaVeLXj1pUNs5D/EzwAdZ6AQ
	KFt6pfr01nF4bOljUE1eURLBj9Z4szAgw5h7++rBy7rXRsMG2CC/dG+Z4cn6GlDMNqPooQJZ3RT/a
	qUmfgJz1QvKSJkPe3hz75c3T3Nrf2F4O6ZyiEAVzWW5EELvqV1KAGCFBisQjWesydIyiY2NZZXTaR
	8seqXi8fYFO11cVDEQP3mKSIqKLp6DKw0YFTWwPhG7ETqsoXrbGj8awpHTKxn38VfGZo/hXx8FuS5
	pQ5FM+LUOdGnY3FrFI0BS9vzkEAjOiJFx7gy5VdH3dK74/wHMGDACUqBfvkivUh6xi2dBBNNBwaUN
	nLjikvOA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8043-000000015Lr-2HwD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:13:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D41F932CF;
	Wed,  1 Apr 2026 11:13:07 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E7D23F7D8;
	Wed,  1 Apr 2026 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775067193; bh=xO+oNGapxnpIxH7G9eLSajTym0rjg8WUOulNd4jDDj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aa7rUyo8guBjnAI7GaGn7R8L8gWMzmhIDqE+bfDsUaauQPjV7MtHyd9sl5JIH2O0W
	 EmnejY6y7YP6cN6QcycAffkM7hvu7YpRYmgaqgKs/9zRQq/cCQxzOvgSnGYjCuoDER
	 InW9IRbWbm3NqySxtY80y2msDifqHyeNtti4xWcU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 0/2] arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
Date: Wed,  1 Apr 2026 19:13:04 +0100
Message-ID: <177506718416.2865936.16472759188021766964.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309025725.455004-1-anshuman.khandual@arm.com>
References: <20260309025725.455004-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_191315_755047_6B11F76D 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, 09 Mar 2026 02:57:23 +0000, Anshuman Khandual wrote:
> This series enables batched TLB flush in unmap_hotplug_range() which avoids
> individual page TLB flush for potential CONT blocks in linear mapping while
> also improving performance due to range based TLB operation along with less
> synchronization barrier instructions.
> 
> It also now rejects memory removal that might split a leaf entry in kernel
> mapping, which would have otherwise required re-structuring using the break
> before make (BBM) semantics. But kernel cannot tolerate BBM, so remapping to
> fine grained leaves would not be possible on systems without BBML2_NOABORT.
> 
> [...]

Applied to arm64 (for-next/hotplug-batched-tlbi), thanks!

[1/2] arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
      https://git.kernel.org/arm64/c/48478b9f7913
[2/2] arm64/mm: Reject memory removal that splits a kernel leaf mapping
      https://git.kernel.org/arm64/c/95a58852b0e5

