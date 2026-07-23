Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803FFC531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0+Dds94k3kKFRsIETTe3NLyFQQqe/ZYPqy6VWenGsE=; b=IwF3th9aSa/UuGlC3EZV83bVNC
	BrCrmu9hA0FLTc/uU2VkovogaIUyhENUAJc9N42/MuhoOra+kTPmxdtrwR0dARQchS1mwKlQxVz3m
	yEbDSSQW/oQEkt/0AqQd2MF9eM5kcB0CZ4ZOfl8KGTyHXZwlH9+mfYvMqoWfOmmQbc9X8zuOxNny8
	pnz1KsUVoG1g5Iw6reAlo/EM2dJwQu7zg17wGmRMNImHaJAbXz4//gLIa0OeY2Oa0RAYu8n+kC9C+
	eJHCQBxSyZ0JvSDhXboSPiFXyRXm82VGmCF2s49rUgFsc4Mrgi+qbagybOlchuryhzwSB//1PNVr1
	eOOFWWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvIT-0000000EbEY-0LeO;
	Thu, 23 Jul 2026 15:25:17 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvIN-0000000EbDa-11T3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:25:16 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260723152507euoutp01aa2b2ea0723cfe88cf649fd059b97e7a~E9Jz6_48q2619726197euoutp01u
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 15:25:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260723152507euoutp01aa2b2ea0723cfe88cf649fd059b97e7a~E9Jz6_48q2619726197euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784820307;
	bh=r0+Dds94k3kKFRsIETTe3NLyFQQqe/ZYPqy6VWenGsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z53GhoWTtFb8HbB+vpPW1apeC/v+bvuMgmaqwFvovB1tCAvU9yF0ZkqPxlTqPIcnX
	 UKptLoXaTf/ha80lztFsIJQTgx7ZQvMpdnO7iBYxw3MWnOfD+C0uz9zM7PzB6ztGsK
	 tbJcmcNnNM/9iZq4FuLnSeOZUDGaQG7jFz1g8wnA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260723152506eucas1p1a29e976831a01873f677f02fe9d05669~E9JzicgTr1906719067eucas1p1F;
	Thu, 23 Jul 2026 15:25:06 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260723152506eusmtip17ad2aedb5e984e537272d33d6d72f158~E9JzFZs-v0480504805eusmtip1f;
	Thu, 23 Jul 2026 15:25:06 +0000 (GMT)
Date: Thu, 23 Jul 2026 17:24:58 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v3 0/2] net/stmmac: Secure against failures of DMA
 memory allocation
Message-ID: <amIySsYvx+ZhOXzm@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260723072352.6db4df7f@kernel.org>
X-CMS-MailID: 20260723152506eucas1p1a29e976831a01873f677f02fe9d05669
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----F80QVkSs0AhR68Zg0oSW-b5-i4-oaHVRPVEJevbh2s58A1oD=_81ef1_"
X-RootMTR: 20260715123609eucas1p276498c4701060ffbb6789cb096696a31
X-EPHeader: CA
X-CMS-RootMailID: 20260715123609eucas1p276498c4701060ffbb6789cb096696a31
References: <CGME20260715123609eucas1p276498c4701060ffbb6789cb096696a31@eucas1p2.samsung.com>
	<20260715123602.51950-1-j.raczynski@samsung.com>
	<20260723072352.6db4df7f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_082511_892625_B44767CF 
X-CRM114-Status: GOOD (  21.97  )
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

------F80QVkSs0AhR68Zg0oSW-b5-i4-oaHVRPVEJevbh2s58A1oD=_81ef1_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 23, 2026 at 07:23:52AM -0700, Jakub Kicinski wrote:
> On Wed, 15 Jul 2026 14:36:00 +0200 Jakub Raczynski wrote:
> > This series fixing two issues related to fails of
> > __alloc_dma_rx_desc_resources(). Original issue from 1st patch is related to
> > page_pool that has happened in testing env, while second was requested by
> > Sashiko to have similar change for DMA allocation. 
> > To have complete fix for all failures of __alloc_dma_rx_desc_resources(),
> > merge two fixes into series.
> 
> Clashiko is not impressed by the second patch.
> Is it possible to avoid calling the functions in semi-consistent state?

Again clash against AI lost, damn you AI. Although I cannot say its wrong.
My bad I didn't really respond to it sooner, especially 13 character Fixes tag,
wonder how that slipped past internal review...

Now being serious, regarding calling in semi-consistent, it is matter of
symmetry between open/close or alloc/dealloc paths.
Since __alloc_dma_{tx/rx}_desc_resources does full initialization,
__free_dma_{tx/rx}_desc_resources should be able to handle whole cycle.
So if __alloc_ failed in the middle, __free_ should handle that state,
whatever it might be.

One thing I will say that AI review is not even about patches themselves,
but about
"If the intent is to make __free_dma_rx_desc_resources() safe to
run twice on the same queue, [...]",
which is the point, although original patch was generated by
real issue that occured. Other issues it reports are valid but did not
trigger.

So AI is right that everything should be handled in one patchset when
this is touched, but funnily it didn't report it previous review.
Will send another version that will fix all these issues/complains
at some point.

BR
Jakub Raczynski

------F80QVkSs0AhR68Zg0oSW-b5-i4-oaHVRPVEJevbh2s58A1oD=_81ef1_
Content-Type: text/plain; charset="utf-8"


------F80QVkSs0AhR68Zg0oSW-b5-i4-oaHVRPVEJevbh2s58A1oD=_81ef1_--

