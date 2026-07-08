Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43774C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtEIand9GnbkU6Gmk6cHJc/OJJrgfSZv10wVu3h9OTs=; b=H0l2UIg1mp+Ok+TkbdS1Hos9Bv
	iWyZYj4GxJuGTuYvLonk12mENZgU9zR4DZoWnQXcDnyC8lxV4YCXgBspKuvojHKkXu/Btz3HLFxGe
	JP4g+7hsGmoTvScu56M/8b+s4Xl/xxP0uZaxuR2KuOykqJC2CTO1FGTdmO9uO8h0B9H5RHsmbkS4m
	lyj8rWBaL9xYs233E0BTi/l8fWU9ROEHW7uH1pTDh/Gg+JnCSYVwCAgOq6VHF97HMwYDP6kH3JbqR
	r+uclKdD6HO00mEY4SYj3DDIVhs9UJvkZBADhLfNPSHJLfWPCorCxUXZfVlCzm3hKHR0GRTmSv5X5
	N46z+OrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMYU-0000000GU7s-17lC;
	Wed, 08 Jul 2026 07:18:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMYS-0000000GU7a-1S3R
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Jul 2026 07:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:In-Reply-To:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NtEIand9GnbkU6Gmk6cHJc/OJJrgfSZv10wVu3h9OTs=; b=kqDsnWkl5YaRkrA5/tyUGYvvbl
	xCc1CajvStPLQY0SnB0QFiSqnKHR2R1IByMBo0/7rIkuvRu4hsU6vj5/vKhNIWrKqLcnZPQitsmPy
	OgPpnyhfWd4WgwP3sWY00ZzsmV0aigwXSOlbTeY8pWGsblU/reCZXBYcQZEua1qpg4pUhDdQVu2Iz
	C4uuiFw3IIC5zfvQVzaqlXP/QHfX1y6H9yuXsx1G7DzWQW0BsCPPQN1+B0TuLFSdL6QaliNCzyriy
	4XVGaZmEwHBqakc/UdlImamZLHb4t16/Rq4IBp5DN848PkerzXjydaXKa9JPqu65mldh0PuqFsU4T
	nM925jYg==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whMY9-000000085K5-1yhv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:18:43 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260708071821euoutp01197a477a194867bc0748f58cb17eb1a0~AP1hvkZ4s2193121931euoutp010
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jul 2026 07:18:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260708071821euoutp01197a477a194867bc0748f58cb17eb1a0~AP1hvkZ4s2193121931euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783495101;
	bh=NtEIand9GnbkU6Gmk6cHJc/OJJrgfSZv10wVu3h9OTs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dqgy0tx6XfSS9ZQOmJv6oBqEiBm18HkmXtHwlF7mqVY+2G9fPOU4A7YwzY/BuPI+g
	 R2WivM4MbVng3qen7ibHCFcwIDme3asMvIy6ZRahvtdLWQdQiAzRV3Yw0KMzd8X8Sr
	 plnn1GtrAunRxeJ1NVIECjQgsaLmaU30x+99Ef3c=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260708071821eucas1p1781d839e4c171db030e3cc100140a18b~AP1hX0Igg1688916889eucas1p1b;
	Wed,  8 Jul 2026 07:18:21 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260708071820eusmtip236a9c2dfa6bc4bffa3c1d0aa81ba9c6d~AP1gt38kQ3160531605eusmtip2G;
	Wed,  8 Jul 2026 07:18:20 +0000 (GMT)
Date: Wed, 8 Jul 2026 09:18:17 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, k.tegowski@samsung.com,
	k.domagalski@samsung.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net/stmmac: Protect against zero queue DTS
 config
Message-ID: <ak35uSDb8YGJDixt@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <d4fb7a9f-c0bb-4ced-8428-14bd2aa66d85@lunn.ch>
X-CMS-MailID: 20260708071821eucas1p1781d839e4c171db030e3cc100140a18b
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_131043_"
X-RootMTR: 20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee
X-EPHeader: CA
X-CMS-RootMailID: 20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee
References: <20260707174431.1264520-1-j.raczynski@samsung.com>
	<CGME20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee@eucas1p1.samsung.com>
	<20260707174431.1264520-2-j.raczynski@samsung.com>
	<d4fb7a9f-c0bb-4ced-8428-14bd2aa66d85@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_081842_047616_6586F5C5 
X-CRM114-Status: GOOD (  23.13  )
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

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_131043_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2026 at 08:57:28PM +0200, Andrew Lunn wrote:
> On Tue, Jul 07, 2026 at 07:44:30PM +0200, Jakub Raczynski wrote:
> > Commit 8a7bca6de6de protected against inputing number of tx/rx_queues_to_use
> > over kernel supported limit in DTS config. AI review mentioned that we also
> > should protect against zero queue input, because this would cause issues
> > down the line. Missing config is not an issue as stmmac_plat_dat_alloc()
> > does apply '1' by default.
> > 
> > Fix this by adding check for zero queues input during DTS parsing
> > 
> > Fixes: 8a7bca6de6de ("net/stmmac: Apply MTL_MAX queue limit if config missing")
> 
> I'm not sure a Fixes: is justified here. Does this bother somebody? As
> far as i understand, for this to actually do something the system is
> broken anyway?

Yes, more below

> 
> >  	if (!of_property_read_u32(rx_node, "snps,rx-queues-to-use", &value)) {
> >  		if (value > MTL_MAX_RX_QUEUES)
> >  			value = MTL_MAX_RX_QUEUES;
> > +		else if (value == 0)
> > +			value = 1;
> 
> If the DT is broken, don't we want it to be fixed? -EINVAL would make
> it obvious.
> 
>     Andrew
>

EINVAL would be better, I agree.

Mentioned patch changed U8_MAX -> MTL_MAX_RX_QUEUES (and TX), because
inputing more just panicked kernel and there was already verification for
that, so it was fixed by silent fix of incorrect value.
We triggered this while were testing XGMAC hardware that supports 16 queues
(current driver limit is 8). Original fix having EINVAL would also be good.

Inputing 0 is much less honest mistake but rather some testing how kernel
handles other/incorrect values. So at the very least, this should not be able
to panic kernel. But as above, I agree EINVAL actually would fit better here,
that will be for V2, and so it would for original 8a7bca6de6de.

Whether it justifies Fixes or not, I am not sure, it is real possibility to
trigger panic if system has dynamic DTS loading (CONFIG_OF_OVERLAY) on
system with wrong permissions.

BR
Jakub Raczynski

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_131043_
Content-Type: text/plain; charset="utf-8"


------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_131043_--

