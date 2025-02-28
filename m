Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFA9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4xpv/ITCQVc5/v0GvACNExtMNarxnP6j7WMPuEJg4g=; b=bxUTZ5AVowawBv3LkTNqMiJy2s
	PLAKInvYZnAcDQQJOvbsCa/vD1pOtwbL4ZyBHDyonVQyNt3F2EwxJkxYE0n6VTyYg/YeIHUHtwpPt
	zmgoi2nJeQSAU1+TrMf80HOWSSJtgRz3aprsy4m1djHDwMLnY77BECrhYydg3sfLExXWt7tmyGbRi
	qScHjE/aGwvGNH5mSFSiAKmjGLxpaPIaaFWJArOlnvb6jbOTIKJ0Ec4O8IhsrNNMEQROFeR1RcbYF
	5KWR8Krt1lospU1Mwt1sL6gSnSe2K1nrBcRVTY9YkniMwAp4UdFuk84STb1LxuDc227h/WwcXn1nY
	0nAh1sNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpxK-00000009TIQ-1VPW;
	Fri, 28 Feb 2025 02:18:26 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpur-00000009SwE-0cJm;
	Fri, 28 Feb 2025 02:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABE2B6113B;
	Fri, 28 Feb 2025 02:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99AAC4CEDD;
	Fri, 28 Feb 2025 02:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740708951;
	bh=4vQwX6AqJ6dlNwK2Yq55c2nDqD8BOonS119QXzs28cQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=otQ+Vh2O/0zvPXfsp8NIol+zuQGEnYbWZnLOYmcX93at3/Ocij07aq7TXGZwI6cX6
	 koYbjA8BBK2KrG6DLzyXGP4A1WyHJsjZMOxoVp0rBLJU/aw+vA/gnFxbW2Sj+rhi57
	 7qMiwdXAR4a1xL82eF0qy1p/ujxQKYQDSpqgW1fLjBz7PByIKoniNDIn9DuuOJd4GD
	 Vv2BWw+C7QqgVdT2Ts8TfnRKGFLvJCMlx5sPTrv2iIeI8AKsGkbargv3DG7sDBG4/E
	 8EELXiY7K2SrXh6bmc8pE/SOoiRqu3Rm2TpZIbhCcmT69XfPPZnVozvvFd8UOwGILV
	 /OPBetdR/mlhA==
Date: Thu, 27 Feb 2025 18:15:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <zhangkun09@huawei.com>,
 <liuyonglong@huawei.com>, <fanghaiqing@huawei.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Gaurav Batra <gbatra@linux.ibm.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, IOMMU <iommu@lists.linux.dev>, MM
 <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <netdev@vger.kernel.org>,
 <intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next v10 0/4] fix the DMA API misuse problem for
 page_pool
Message-ID: <20250227181550.07e429f5@kernel.org>
In-Reply-To: <20250226110340.2671366-1-linyunsheng@huawei.com>
References: <20250226110340.2671366-1-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 26 Feb 2025 19:03:35 +0800 Yunsheng Lin wrote:
> This patchset fix the dma API misuse problem as below:
> Networking driver with page_pool support may hand over page
> still with dma mapping to network stack and try to reuse that
> page after network stack is done with it and passes it back
> to page_pool to avoid the penalty of dma mapping/unmapping.
> With all the caching in the network stack, some pages may be
> held in the network stack without returning to the page_pool
> soon enough, and with VF disable causing the driver unbound,
> the page_pool does not stop the driver from doing it's
> unbounding work, instead page_pool uses workqueue to check
> if there is some pages coming back from the network stack
> periodically, if there is any, it will do the dma unmmapping
> related cleanup work.

Does not build :( Always do an allmodconfig build when working 
on subsystem-wide interfaces..
-- 
pw-bot: cr

