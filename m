Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598A9CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kfveeodqv3j9Bffb+MIDQPUwWqgDujoXKKaTrsg8OK8=; b=QQlHtxVeOIgO4DaZsZSZ9ugJJ0
	AFMOqJRBfwc7wrCgeF+R2rktbpl5tTdcOXdX92RzEvtmioWG/MNZT7HdT7xWbFY5rEjuE0fs4oHdJ
	zl+v8U/ov4nlb4rTG2ZpKjyFKuqLtn+b0WCRCZ6BK6libjlOJI5q8qb5QukPnKXJdDGwfAZpMx6uO
	IpINMpQV9GvWPhYxvvyHHN0shz8jdUjwlBu1bjk0rF/Pby4GX9tsq6GDcocRmVPzINyq6F6lBj9Dt
	ZW9truOPYVgrhVuh61V8h+W/eJIwk6ClsxZneMboG+PZ3nJ3spq7gjtmCG5iM94HfG5GolS03KQaH
	qzNY00AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxZX-0000000FjiF-2RvD;
	Mon, 18 May 2026 12:59:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxZT-0000000FjgI-0pN1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0783D43D1B;
	Mon, 18 May 2026 12:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169D4C2BCB8;
	Mon, 18 May 2026 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779109185;
	bh=pHjLGDYdRaAdVxh0pgGrolDY1QWcj+3GpztGTtENOpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ss9om4+yiEIvQj1iIweQ35VPNZ04FVWz6PuG2qgvbTt2NKFKhRsZTbIdkHGmlESD7
	 xBVx7iYmGzjT1QP2/oTmO1bDll5g3wYwbLMG4Y0CxzKJU/A9RuJtIDOiY+k5GOt74n
	 hsn72PRULGT3K6T6bLfokcqMOleWr+HykmcJCvRvC02+LBQk9RdAc0lwVecTJu1rSn
	 J7FVterz5IBxae4A1t0dkvX7dCOLY1RlUQozSY/0OywfeFFq1xAxcTg+nYgW/lLKBB
	 7d3QtzxqrfzPFaObeDsb38Oa1JhpRUJVfDEd+PAdXrAPLIa/c7+oLyg3MrfmAxqw9/
	 1LnnXrAF0EAVQ==
Date: Mon, 18 May 2026 13:59:39 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 00/14] coco/TSM: Host-side Arm CCA IDE setup via
 connect/disconnect callbacks
Message-ID: <agsNO9cc7H-b0H8L@willie-the-truck>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427065121.916615-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055947_253685_368A52C8 
X-CRM114-Status: UNSURE (   7.04  )
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

On Mon, Apr 27, 2026 at 12:21:07PM +0530, Aneesh Kumar K.V (Arm) wrote:
>  arch/arm64/include/asm/rmi_cmds.h         |  85 +++
>  arch/arm64/include/asm/rmi_smc.h          | 168 +++++

Curious, but why does this stuff have to live in the arch code? Wouldn't
it be better off somewhere like drivers/firmware/ or
include/linux/arm-rmi.h?

Will

