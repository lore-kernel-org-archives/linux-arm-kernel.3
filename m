Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A10C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS9bNunJIYcGp7pM+GGsfoUYEDKOWl8+J/XHzg82dRU=; b=1FaPdly4tw7erZLR7GaY/jZwd6
	tDCSRN9zaBO+q7dP9RkC1iTTXvAr6CDqkSq82e4seGYXjxscGk0Oj2JkZ2V2dQMH4SDYf/d2ihcTu
	HUZ5GMSYj740a7CeUHHuim6YkzrVHHdyT812X3C1Vyhl83rsdX6UG2HRqCmcn7LiU1AnVbub7mjvM
	/Gh0OvYx1nItqcxOIWJeOCompdx0viYGGn5efI3KTtrgNN8mVrnVmxTz/h2tSjPOLDzIUwPusqaYT
	KEgX1JgFj0HysDvgRxftbNc6gwSJAMhP/uU9YkxqbnzKPHBCCJ0KMblNThm73/WRGgsgq5g0x7OqV
	cUxYflXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMC1-0000000HOKh-0vgI;
	Thu, 16 Jul 2026 13:32:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMBz-0000000HOKQ-23td
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:31:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 432BB40743;
	Thu, 16 Jul 2026 13:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905941F000E9;
	Thu, 16 Jul 2026 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784208719;
	bh=yS9bNunJIYcGp7pM+GGsfoUYEDKOWl8+J/XHzg82dRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KbqUptLjSwHbPDnl6EODLgtr0+4G+Vr/GtLsN8uL1R0gJIbcJrT9INA5Bsp48xFc7
	 uBGW/ISebTiRPnsimApzUl9NclYX2xh1l1X4NXZZjnAeSSSFNYTRMypcY/rUhyl+X1
	 /7F6szx0dZdEkzpjdZXEZE5GDp4nGDRMG6wLJU1JgK7vImT0swvx9wF8O4ht7g3joe
	 kDDXkZm0rqfhR/CQny+02fMgaTBpKdu49C8Yx2xuJ87zFpVlntVhAzq2XjsDAJ5/eD
	 MgCdvius755vFAuRCD11n+E/RU74UcgR42ez7mpfqR5l5mHGTHiYGsp1W8i6LKucW6
	 B2mW+krILaKHg==
Date: Thu, 16 Jul 2026 14:31:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, damon@lists.linux.dev, iommu@lists.linux.dev, 
	kasan-dev@googlegroups.com, linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, kvm@vger.kernel.org, 
	Russell King <linux+etnaviv@armlinux.org.uk>, Ackerley Tng <ackerleytng@google.com>, 
	Kai Huang <kai.huang@intel.com>
Subject: Re: [PATCH v2 00/33] mm: make VMA page offset handling more
 consistent
Message-ID: <aljdJD9TNWYCQ3HL@lucifer>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <c2fd5114-74d0-4996-8035-311ba976b3eb@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2fd5114-74d0-4996-8035-311ba976b3eb@amd.com>
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

On Thu, Jul 16, 2026 at 12:03:41PM +0200, Christian König wrote:
>
> I only skimmed over the set but should there be any changes required to DMA-buf, amdgpu or radeon driver feel free to add
>
> Acked-by: Christian König <christian.koenig@amd.com>
>
> and merge upstream through any branch you feel fit.
>
> Regards,
> Christian.

Thanks :)

Cheers, Lorenzo

