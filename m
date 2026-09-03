Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276DAC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R58VpJgoXa38uUjUSX0dFmlVfqjdjenKtXhLCcCh34E=; b=phfgD8okPoERwAHL6HEyajoXYt
	HCYozddEqvqhA5c6BCavz7lzr3F387ulFGiL0rspxVL0io+kqJ2KPiwMk5h6OYK7G5k/2V259uCSs
	ZjIaAzlyKsFOsY8Ij8SWWSKAHCEp3dFTFG531jd4lmgGe4zKWfEmRwB9MUlRNJNsVl4E2cUKlcj4O
	PLGnUqh3c1wtEm24QC+FoFI5vJvBnEGqreAiilmoQXOsO1O/RytZDkgps7SPVssUdut1AI3e25I3q
	/ngkUyXWbvjm7nsYhDezbg0m9biCNHnntXpXE6TvF0YCg92JvUeaN1I2wXNACaX+7ZhdiMbCduh7F
	EbnYJ04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23d0-0000000GvNq-42Wh;
	Thu, 03 Sep 2026 09:21:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23cz-0000000GvNi-2aDh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D4CE600D4;
	Thu,  3 Sep 2026 09:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F011F00A3A;
	Thu,  3 Sep 2026 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427260;
	bh=R58VpJgoXa38uUjUSX0dFmlVfqjdjenKtXhLCcCh34E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mT78I1gFIY4l4WwOgJH7IieNz0sn6nIuBxmmWb3IyS/Mic/VyR47jeWT0UemhLBUa
	 lRbZdGhDE2zSzr7DaWqqQLtoGUQfdKckmB/8wBvY5rWRi4ed0Wn+HCJuTQl3uDx/zm
	 3a1con5c7Eb8RkywRL2qLIFxohlyLZvZpntWOzWcIqNDf4vHwtOXM3D7rblgOnvvja
	 sSme+E9Kv/MA4YfeqImXUQpOxNsfMxLKND+i49gTTDw1ieTM2cycEnWKeRlHUIOZfR
	 IMAH8aGv9LL60jzFAH81CjVa4mrqHve3323I9WwMeV4ItZ/ijS3UyCzDhc2bOIypsF
	 h2BdPR38VizVg==
Date: Thu, 3 Sep 2026 12:20:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, usama.arif@linux.dev,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org,
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org,
	peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Message-ID: <apk775HfHg_DXpiW@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <5026dbec-0b71-4408-a78a-484a4b8e77dd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5026dbec-0b71-4408-a78a-484a4b8e77dd@intel.com>
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

Hi Dave,

On Wed, Sep 02, 2026 at 01:59:15PM -0700, Dave Hansen wrote:
> On 9/1/26 08:18, Xueyuan Chen wrote:
> > +static inline int set_direct_map_ro(struct page *page, unsigned int nr)
> > +{
> > +	return 0;
> > +}
> 
> I still really think the stub here needs to return an error *or* the
> thing needs to just be void and tell folks that they can't know whether
> it worked or not.

All other stubs return 0 here when an arch does not support set_direct_map.
I'm for keeping them all consistent and fixing that technical debt as a
whole rather than creating a one-off here.

-- 
Sincerely yours,
Mike.

