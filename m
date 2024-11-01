Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F796E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiT8EfJOMyPEs4Ofrdl7qs5hu6G3ir4nXFOyI3wPwUA=; b=dKd/DfZ0AEqsRIP1QFprH9NiZI
	q3mE7sDCyZt9krkc3McERmxAr93VATVDD5nqo24Bu7hMBDTO3T83belvJQyHaKhnHJIFR7JlvUCnJ
	ernCokzyE1XODKmCrLH4YTFBNxVpjKzrfNxHQrivP4NV7D9orH0GMLRC6ADE4xTaKGzCPBynaPK0Q
	DelumykHDG3H4ggGIirbqiRj7WOBB55LmdlhTpCNoztod1FadOc9hxegK/qc3EJDbERtWH8e+IsOr
	pCyZ6tHnJAZrssHkQbxgmCEWpk6hIkOPxh0UfxgEuVVXS3hLQZD1b7ztEz/8rtKeb3GKSUnkioMC0
	xytv3e5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u9c-00000007bPG-0PyB;
	Fri, 01 Nov 2024 16:05:40 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tsT-00000007YiN-3Mcn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:47:59 +0000
Date: Fri, 1 Nov 2024 08:47:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730476074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiT8EfJOMyPEs4Ofrdl7qs5hu6G3ir4nXFOyI3wPwUA=;
	b=ODort3/ngL4QSo6UzvOQ7df0QpGpils2XhqGhVqXzjYocBR7ABHsElMMd+SsWfa4l8mkaB
	YnyRd/7BozGZQhpBI7W7uiu+jqbqnOUxMkm6ZTqI0QGysF3Bz8ccgXa7oEUNN6TxU8HnqH
	IHhNm3Lmh038u+7jOUZOqeu1Cxwnskk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] arm64: Expose ID_AA64ISAR1_EL1.XS to sanitised feature
 consumers
Message-ID: <ZyT4JG1Nec_xPCHH@linux.dev>
References: <20241031083519.364313-1-maz@kernel.org>
 <ZyT1Tblp624a79CD@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyT1Tblp624a79CD@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_084757_998991_647C0ADB 
X-CRM114-Status: GOOD (  13.65  )
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

On Fri, Nov 01, 2024 at 03:35:41PM +0000, Catalin Marinas wrote:
> On Thu, Oct 31, 2024 at 08:35:19AM +0000, Marc Zyngier wrote:
> > Despite KVM now being able to deal with XS-tagged TLBIs, we still don't
> > expose these feature bits to KVM.
> > 
> > Plumb in the feature in ID_AA64ISAR1_EL1.
> > 
> > Fixes: 0feec7769a63 ("KVM: arm64: nv: Add handling of NXS-flavoured TLBI operations")
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Happy for this to go in as a fix via the kvm tree but let me know if I
> should pick it up instead.

Thanks Catalin. I think this can wait for 6.13, would you mind grabbing
it?

If you do:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

