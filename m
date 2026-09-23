Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A10C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLmF0v8QtglTj6lhzt+VYTF5WKRtG/i0I5+a8Z9D+Pw=; b=FvUGtQhvunDkGc0jchnHNFxJEv
	2xInIJVP7rMO7NZSYneMvk8NO++XJqh0JTEMfpZaDDgduuc0EFW2OyzIwcMD347Zn9csO8LJWdvgz
	zWsMU56tVfq5Rt2SEJFJdN6+jT/IDm6o9250LrQ9/8bx1imGdaqAX5Mu1QN+Y6xWoqeaHnh9Z3j4d
	574g1R3ezCg1pAxvdKz+96+t+F6MH5dpKnz/Iid6bsQr0BddOby4ivKs38B4bOvEirRNMRyBxpgoo
	TqaOgcI27Io6M9FuLeCqExhOpWufr4NsU39aXJtLKz+YGEqP8Cb9vklLzJdNOtdtgQS1bwBqdIs7O
	EeR2OYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F6o-000000079ZP-19Bp;
	Wed, 23 Sep 2026 05:01:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F6m-000000079ZH-1fCA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B5016020A;
	Wed, 23 Sep 2026 05:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57C81F00893;
	Wed, 23 Sep 2026 05:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790139687;
	bh=QLmF0v8QtglTj6lhzt+VYTF5WKRtG/i0I5+a8Z9D+Pw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=f+uE8f473BmHUYPtfP+DSAO/2PPTToyTXGdy7kfluD3JI6wZ+WhsIKuDhHY7DM1/8
	 8ZZr/GE9D1f3n3vrsWRuTKMphi/wltWB6A+RgrE/kkVzrKvtCG/cAAfOkdo1qhFlsJ
	 C0cfngBRQ7EtBdiv1INAQ0CaK9I24pB7EgRU91x9GMj8oVqTPcXJh+IpX9RezahEYN
	 Qn8foUFcTCPV47tgDPfVx9L3JIY9oSXWCbzZf7oOWji2Xaba5fxpWohjWmQbDitrRc
	 iCd3KNeOHayR5T1B1pSqdr5WwP7wXk6fvgr5Qpiz1psLOZAezZipEBGm3rXdKoz0sx
	 rFU+XdHdMPX8w==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment
 for shared buffers
In-Reply-To: <20260918165754.GG11599@ziepe.ca>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <aq1sT2EDsGaomqST@arm.com> <20260918165754.GG11599@ziepe.ca>
Date: Wed, 23 Sep 2026 10:31:19 +0530
Message-ID: <yq5ao6do36jk.fsf@kernel.org>
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Fri, Sep 18, 2026 at 05:52:31PM +0100, Catalin Marinas wrote:
>
>> TBH, I'm tempted not to support this configuration at all, just fail
>> gracefully if the realm page size doesn't match the host's. However, if
>> that's a real world configuration, 
>
> realm != host is going to be fairly common.
>
> host > realm is probably not that common, I would guess.
>

Wouldn't it be more common to run a distro with a 4K page size as the
guest on a custom hypervisor with a 4K or larger page size?

-aneesh

