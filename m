Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D20AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUOokMrKASXdzZOA3VRoZ7fdfSIasrczhgZC+ARdsyE=; b=yUyk2xKk6R+vL9W30JVdXB+E10
	ZaEkMtoWLNj8va5zRE/t+0uqmi5dsivAsZDy1Ux7CwtmDpKAs76GHeiE5QiCojhX/f0SCW2i4FgV2
	dZYja2voV5TkubK25QJ7fyk3gt8BqmCLLhzgWVpjmfcOUoCfy/nIHxGyMXt4RmSHDKCAJ/E6n6YWN
	1iaxhBQWBCUByGT/tqFpsc1bYMMntltpiP553vGAMaRXDOn32R5w5zMzbE4LvkSMFQBDNzr25v0rS
	3WuZeG3xE8ch+wXSou0C31SX5g6OxK/H8dB1vpIHRRbi3/2l7T2Q9zU3IjGU+g7Kw8IFtsABdN0KT
	zPJjHUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHtR-00000008YCM-24aj;
	Wed, 12 Feb 2025 18:55:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHrf-00000008Xel-0stv;
	Wed, 12 Feb 2025 18:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oUOokMrKASXdzZOA3VRoZ7fdfSIasrczhgZC+ARdsyE=; b=RQsJzdIo4sjdvkb3W0fwkdFRaa
	O57YRtnEq+Dfi18rN1QQwUuBy8dYpnMr5IQlIOiChqEyQR5T5MXOqbangz7v/EBYWW/HkX+P8uxVd
	idVVcsVuC1PGXaAK7beZ2GFCmN9Y3Y8pSbs17s98gPhCfsWxM/EmI7xjeGTmmG7zZ3FYar1vcZ1GW
	h55laSfKYbPWaVvzr2P1udrViDnu1von3OwcqpmZgx3g3jQPH5tdQFFtQN3ZwqwAF5L+Oug9GX7y+
	ZjNB66u0s3SGCr440I3G2m1FDfd3d+xBpNUtfFXpL6XIDVSPSq0qiSv8tjXfWua6lN4yAYuGQBmSo
	eK0Oz+Zw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHrZ-00000005dDY-05Hq;
	Wed, 12 Feb 2025 18:53:33 +0000
Date: Wed, 12 Feb 2025 18:53:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	zhangkun09@huawei.com, liuyonglong@huawei.com,
	fanghaiqing@huawei.com,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Duyck <alexander.duyck@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	IOMMU <iommu@lists.linux.dev>, MM <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v9 0/4] fix the DMA API misuse problem for
 page_pool
Message-ID: <Z6zuLJU7o_gRsQRu@casper.infradead.org>
References: <20250212092552.1779679-1-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212092552.1779679-1-linyunsheng@huawei.com>
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

On Wed, Feb 12, 2025 at 05:25:47PM +0800, Yunsheng Lin wrote:
> This patchset fix the dma API misuse problem as mentioned in [1].
> 
> 1. https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/

That's a very long and complicated thread.  I gave up.  You need to
provide a proper description of the problem.

