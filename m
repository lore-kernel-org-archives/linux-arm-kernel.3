Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E64C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAT0vxHvZGnQFghigS3BsjoKQVyxGb6u1tpbTaYnWoA=; b=K+IDPEJ7cYSX3Jx5fOJF0reP+v
	/s8JBBTh7Ff5J363gmSc7sB63784o2x1rMLa0ErWyi1ENK21PiZk5ijyMOru+nG2oGh62hzjJWeHQ
	o0vnsNN298TpR9toiv5f+RCehK5NnhKLkEhhFATCB+As5tdCSIP0kGd5z/P+r7mkXuHgRJFZknQO5
	A34ysNd0opeu8VvdZk0UJkny433A+Fz6/7lsY6Naa9y7KxxjGDe/FCBPbswySKv4/F81Hp1BWVCj+
	bAFy6WuVDpMPYne6gPYaZui/i2CJII2Mj7P+edq5+U7qX9vr1FharwyICypYmG2unj17LsvcpuRLF
	v0271tjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMgd-0000000GVNp-36ar;
	Wed, 08 Jul 2026 07:27:15 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMga-0000000GVNN-2P4J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:27:15 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260708072708euoutp0102b120b3abe2d86c6fef3d6ba97300e3~AP9MX4JEn0059200592euoutp01R
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jul 2026 07:27:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260708072708euoutp0102b120b3abe2d86c6fef3d6ba97300e3~AP9MX4JEn0059200592euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783495628;
	bh=AAT0vxHvZGnQFghigS3BsjoKQVyxGb6u1tpbTaYnWoA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C8KSUpY/JfVGmDRu7STwuADaSziCHaNIIg1/sjBVa/o2LhIGB2vi/x8rLiSD37/+P
	 AsJTC2cxhc9t7lo1v9hzAt5Wbf5vAiBxaBUMYDdJYBxwHVSlg8iYZiuKIVnnITnGV5
	 uWFPg3H7vc9UzQq6aaST3GlttX+WpMuJlX4wjFVc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260708072707eucas1p2dce9de593df0be3855839c4f41f61f2c~AP9Lj3STQ0421304213eucas1p2m;
	Wed,  8 Jul 2026 07:27:07 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260708072706eusmtip1a9d4958030b6902d17d42dbb46221419~AP9KjxNiX1151911519eusmtip1i;
	Wed,  8 Jul 2026 07:27:06 +0000 (GMT)
Date: Wed, 8 Jul 2026 09:27:06 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, k.tegowski@samsung.com,
	k.domagalski@samsung.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net/stmmac: Verify provided DTS AXI setup
Message-ID: <ak37yhQjA32gI0kr@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <ee504cab-b1da-4584-8693-70ed5cd943c7@lunn.ch>
X-CMS-MailID: 20260708072707eucas1p2dce9de593df0be3855839c4f41f61f2c
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_"
X-RootMTR: 20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056
X-EPHeader: CA
X-CMS-RootMailID: 20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056
References: <20260707174431.1264520-1-j.raczynski@samsung.com>
	<CGME20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056@eucas1p1.samsung.com>
	<20260707174431.1264520-3-j.raczynski@samsung.com>
	<ee504cab-b1da-4584-8693-70ed5cd943c7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_002713_460913_60336185 
X-CRM114-Status: GOOD (  27.51  )
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

------FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2026 at 09:04:00PM +0200, Andrew Lunn wrote:
> On Tue, Jul 07, 2026 at 07:44:31PM +0200, Jakub Raczynski wrote:
> > During parsing of AXI setup, there are few issues:
> > - 'axi_blen' array is uninitialized value on stack without zero-init stack
> >   configured. This can result in random AXI burst length config if
> >   DTS config provides shorter array than AXI_BLEN.
> 
> What does the DT blinding say about the length? Is it allowed to be
> short?
> 
> Are we talking about:
> 
>       snps,blen:
>         $ref: /schemas/types.yaml#/definitions/uint32-array
>         description:
>           this is a vector of supported burst length.
>         minItems: 7
>         maxItems: 7
> 
> So it should be 7. Are there any in kernel DT blobs which don't pass
> 7? Can we just error out when it is not 7?

Erroring would be fine, as wrong amount will pass.
Same as previous answer, I start to agree more and more that code should give
more errors rather silent fix stuff.
This is mostly Sashiko complaining but I have seen this being incorrect in
some internal forks.
But, as a code is currently written, this does not have to be 7 and
documentation is merely a suggestions. I doubt wrong DTS would pass to
mainline linux so it is merely 'internal' fix.

> 
> > - In case of failed memory allocation for AXI and error, there is no handling
> >   of that. Fix it by checking if AXI config is error and return if so,
> >   as this can only lack of memory. No AXI config, although is probably
> >   wrong in most cases, is not treated as error, as generic config is mostly
> >   provided in drivers.
> 
> This seems like a different fix. Maybe put it into a patch of its own.
> 

Got that.

> > Fixes: afea03656add ("stmmac: rework DMA bus setting and introduce new platform AXI structure")
> 
> Again, does this bother anybody? At least axi_blen issue seems to be
> that the DT blob is broken, so i doubt it actually does. Are there
> reports of memory allocation error and resulting Opps.
> 

Only internal and quickly fixed. No public reports.

BR
Jakub Raczynski

------FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_
Content-Type: text/plain; charset="utf-8"


------FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_--

