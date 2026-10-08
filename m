Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CC2CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmRkJrFy7UYNSRUq22nOk7LyP+X+ALUnS3ucJY6ilFU=; b=YuB9yvjfPhReyPW+jOTtt4VQJF
	bQvgXT/9BrEAjRN8YTfMkzwc2Yp4KWvwzJM/FVo7vRiHc9A0cctbveLmMKxg8GJEbbQOSWKIXeJ60
	x2MhqXvvlyHeBxYVQh0aW9rNXr2ajRuRIwiQw+E3QFIhSfa1I5Net/+/WdnnLkSgBJhJHVFKkbLos
	/e996yY6dursF65Grd1a0+5LccQr0uaJ686tLLhsNd/PRD1bvhmhsdUzpgoQGXGtecwUkaEVolKEc
	xwkiXpaMiQYMtJpyURsPsdVf1IwK49GNJ8R/jxWsdWYa0DYDPiyRBbn5xEeD12ck20RDd3OBmvCzv
	IUekoO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEq5r-00000004c29-0yzn;
	Thu, 08 Oct 2026 15:31:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEq5o-00000004c1h-2RzA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 15:31:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-487049569b6so2249305f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791473494; x=1792078294; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hmRkJrFy7UYNSRUq22nOk7LyP+X+ALUnS3ucJY6ilFU=;
        b=e/mxm2ojxcBuCTxrjC3kgWnOevFyT6fXKyEiZzZjxM4oARNlHDQ9OlP+psMQAmCVB6
         E49v/BDQ13Usq7fbTpycuKSr1L0TnbqLaH5YXOBu86GEngnlNLEJCJ+dYPqOMus3oJ6e
         E67gCyssqcLCB4SiytjqkoQQKvw+HyeDdzFhV6iJfvg1fM7EPNwDTv7OGH8FZfvcbqJ2
         LTZmgxzXbgAd2YYFLh4KldCg4yrmqCryZEFjeZWe/QeUTMfJVXhKidTCMI9N8ukaijnI
         hSp1II65/mERDtESodBR6hbd4krNstDe7BnFke1+ebousguqIeuGxO3Gyy2dU1gI8IGx
         YG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473494; x=1792078294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmRkJrFy7UYNSRUq22nOk7LyP+X+ALUnS3ucJY6ilFU=;
        b=i2nF9XCx/I9QEN4Z3hHZybDS1o+fuhts5AvY6YSUMF2sIMPZVLKnPAPa57oaV8IfeO
         1itwYpqhQ0NBxeYeCrsT4OWMFJK4+skfz+WH7gN7wY5XMGkLlyqzP/4qaTgysvCEAoE7
         Z/yEYlB2fFH6oSDLnZE8yohMCiriZX5VshlUA1Czq19oMbUBzk0QIWNGc03oskhrh79a
         BrW5T/xn9zAuoXAZG1IREn4TIWv3IkGeFpGm6LbgqyZzCI1B1HesvxMyEoVyPMHMRaUL
         2dAnx0XxgcpI+0PEVWrstadnY4NRMdDzkprM+srOBqVeX0KCXFNaFoCkUHr4lvXVQVuF
         TSjQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6hc1Nfkoa9BFc97tgJ8f36IIpofr9lKvGvCetoZXuzHlchRms+5pFJNJJh079TTP54HYnIua0UU4uPX4GzR+R@lists.infradead.org
X-Gm-Message-State: AFuF++m788XBqXFRLdmx4JVPqnLV/8HwxF/HgC9SZr6FM/3GmEqkiJIe
	OPd1i3warCJBzdDE6oKwVX628wnxNTs3B8nCA0Uu+BtEEHVS+LpWivyuKBgF/j7QxTw=
X-Gm-Gg: AYBFou3x6mXMw90yeomlFvxYpe0aBGIbETPrNFvlPenVob/6w2COk77yIFw0DpnziCH
	CMxiAMal/eha5yCa/Wb7beSkjO4V2dc5G9iUf92Byz8lr2H9pn6ASgggAVFvoexmW738TsulYRZ
	7OsuJexkHKmmqBNU7kSBEhfD95aBCpyMCkoVPofAdE4vWg2nYzuZwYxu1SkTSY80uurJf941Kk4
	BhFvJfgFxVCWLd49B1J3ANole3KvUnmvixw+yrSq5O9q+GxaA78D1+24E1om8oHbZMIcaTlcrGL
	qW2RVH4Jvrejiiqq7+NCfMJmGoZtAZsmcBdZJh4p89Od1xjy4v+CCPALKschDGm1B6Q5kgsO+cj
	cLtzMUOKN2G8REQH6sRVMIwdfQkuZH4j42LGEE+/XPDpCBz7iylx6+gbgbPpDKzR2bXvaMx/dcm
	3vJeJmPkpJzXuNGvnjDZ+7qWAfbDd+/qIYSyDXPibOIAwWlmeYynw6BVEoDZ6Vh3eJB62Dhb8qv
	YUNvlTefLBUI44ul56hHGxiORvhCZulsdUMgHM87CnaXkj1Y7XS55vbSPnFs0cEhUUZCOoXcmS5
	NqYU2D1gxi+ckXpgbr++sFjiKMgAAZpKAJ0HsUxuqO/9bMNsIX9uB5ALDWc=
X-Received: by 2002:a05:600c:810c:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a180424680mr108117585e9.14.1791473493755;
        Thu, 08 Oct 2026 08:31:33 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abfbdsm74991645e9.4.2026.10.08.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:31:33 -0700 (PDT)
Date: Thu, 8 Oct 2026 16:31:30 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: add tc mqprio hw queue
 priority offload
Message-ID: <ase3UrUehtLY6b_5@aspen.lan>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
 <20261006-stmmac-mqprio-prio-offload-v5-3-d7da93419784@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-stmmac-mqprio-prio-offload-v5-3-d7da93419784@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_083136_906312_59AA9ADA 
X-CRM114-Status: GOOD (  13.73  )
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

On Tue, Oct 06, 2026 at 12:46:27PM +0200, Lorenzo Bianconi wrote:
> Implement the offload of the tc mqprio hw queue priority in the stmmac
> driver. When the mqprio qdisc is configured in channel mode, the MTL TX
> scheduler is switched to strict priority, and the PSTQX/PSTC priority
> bitmask of each TX queue is programmed from the set of frame priorities
> mapped to the owning traffic class (qopt->prio_tc_map).
>
> The channel mode offload requires the DCB hw feature and a 1:1 TC to TX
> queue mapping, with a single queue per TC. Configurations with AVB queues
> are rejected, since forcing strict priority conflicts with the CBS
> algorithm. The CBS offload is refused while the strict-priority scheduler
> is active, and so is a channel count change that would enable an AVB
> queue.

I don't think these CBS offload checks are necessary. It's quite reasonable
to mix strict priority on low priority queues with CBS on higher
priority queues.

In fact on the hardware I have (TC956x) the lower priority queues don't
implement CBS so mixing AVB and DCB queuing (whether SP or ETS) isn't
just reasonable, it's pretty much unavoidable when using CBS!

As a concrete example of combining mqprio and CBS, the following works well on
TC956x (when I tested an older version of your patch):

--- cut here ---
tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
    map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
    queues 1@0 1@1 1@2 1@3 mode channel hw 1

# No CBS for TxQ1 means we can't offload this (h/ware stays in SP mode)
tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
    idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049 \
    offload 0

tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
    idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296 \
    offload 1

tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
    idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419 \
    offload 1
--- cut here ---


Daniel.

