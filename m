Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16E4CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 23:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYWbA7j46aueWZEJm8bnihGWxOjtMrOMmpHf9Fu5Y7A=; b=wVuxE4V/92ejzgnfFzIdBRMBp0
	LpcomNbXeKkblYpctbWYIkY19yCfeIGF7P8IQmCy+x18AO7VgV2STQirqOXf87IF56xbftWY00RTg
	zbLdBCj9b68h7sq8YptYfNbqqdpNG3VtLd5WPghHqtVfahBxDXjCUH55jpnDULwkE8Y3kwI9+vm68
	kmzjaUOhEgNule6089YPV3lP+vSdPwcApOqjZzDu30NOF2WIefo/m/fzzI/BmVAUSkwEfW0oUHt+O
	VTeXEfQ9O/CdsokUyBKJYsCoha6vZJokwa9ISdphL26BnNorbz4cfFIGRHwqXuX6ytCdwe9/66ooA
	kU9gmk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUIt-000000036HJ-2L6c;
	Tue, 19 May 2026 23:56:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUIq-000000036Gh-3yXF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 23:56:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4815540510;
	Tue, 19 May 2026 23:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458CC1F000E9;
	Tue, 19 May 2026 23:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779235008;
	bh=yYWbA7j46aueWZEJm8bnihGWxOjtMrOMmpHf9Fu5Y7A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=INtNDhNNwgCAkz3ew87JMcdeZl6c+E1ryD+QFvS0NJQGxosUfkWGVZgyOiriYretc
	 Y0AyKreTS1Ey0kji8T8wdYsuU1aUND9pI4BtwVhxE5Nh7XIscCq+4ICKXho4j0dn6K
	 BZRkQoQRub0KZUMvFEB+Th0vMXgmiX5RNvtHPaFb/zOd5MgQPRHL907oVn5Zt3n7bL
	 3X/A72M3Ub7C/EqQ86i6FtCOZWj2MYTwGJoJlXmr+LbG1dG3cqIabGsEchb1dno/Im
	 bc0JnXGz1TW8HIipXfAy0B8T7OPqSfeb9cmLFLoRm6u0kFDttm3AD79iki7P2H8GKU
	 RtO/BLJ2FDRXA==
Date: Tue, 19 May 2026 16:56:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: MD Danish Anwar <danishanwar@ti.com>, Felix Maurer <fmaurer@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Meghana Malladi <m-malladi@ti.com>, Jacob Keller
 <jacob.e.keller@intel.com>, David Carlier <devnexen@gmail.com>, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg: Add HSR and LRE PA
 statistics
Message-ID: <20260519165646.09b0783f@kernel.org>
In-Reply-To: <E30AAC96-01D2-4A23-B562-126087DEB7FA@linux.dev>
References: <20260514075605.850674-1-danishanwar@ti.com>
	<20260514075605.850674-3-danishanwar@ti.com>
	<20260518184506.694c584e@kernel.org>
	<E30AAC96-01D2-4A23-B562-126087DEB7FA@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_165649_038679_542A09F2 
X-CRM114-Status: GOOD (  30.48  )
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

On Tue, 19 May 2026 07:55:55 +0200 Luka Gejak wrote:
> On May 19, 2026 3:45:06 AM GMT+02:00, Jakub Kicinski <kuba@kernel.org> wrote:
> >On Thu, 14 May 2026 13:26:05 +0530 MD Danish Anwar wrote:  
> >> Add new firmware PA statistics counters for HSR and LRE to the ethtool
> >> statistics exposed by the ICSSG driver.
> >> 
> >> New statistics added:
> >>  - FW_HSR_FWD_CHECK_FAIL_DROP: Packets dropped on the HSR forwarding path
> >>  - FW_HSR_HE_CHECK_FAIL_DROP: Packets dropped on the HSR host egress path
> >>  - FW_HSR_SKIP_HOST_DUP_DISCARD_FRAMES: Frames with duplicate discard
> >>    skipped
> >>  - FW_LRE_CNT_UNIQUE/DUPLICATE/MULTIPLE_RX: LRE duplicate detection
> >>    counters
> >>  - FW_LRE_CNT_RX/TX: LRE per-port frame counters
> >>  - FW_LRE_CNT_OWN_RX: Own HSR tagged frames received
> >>  - FW_LRE_CNT_ERRWRONGLAN: Frames with wrong LAN identifier (PRP)
> >> 
> >> Document the new HSR/LRE statistics in icssg_prueth.rst.  
> >
> >To an untrained eye these stats look like stuff that could 
> >be standardized across drivers. 
> >
> >Luka, Felix, others on CC, do you think we should expose these
> >from HSR over netlink as "standard" offload stats different drivers 
> >can plug into or not worth it?  
> 
> I think there is a case for standardizing part of this, but I would 
> not standardize the whole set as-is.
> 
> The LRE counters look generic enough to me, especially:
>  - unique rx
>  - duplicate rx
>  - multiple rx
>  - rx / tx
>  - own rx
>  - wrong LAN, PRP only
> 
> Those are protocol/LRE concepts rather than TI firmware details, so
> exposing them from the HSR/PRP layer sounds useful. I would expect 
> both the software implementation and offloaded implementations to be 
> able to provide at least some of them, with unsupported counters 
> omitted or reported as not available.
> I would not put the firmware check/drop counters in the same standard
> bucket, though:
>  - FW_HSR_FWD_CHECK_FAIL_DROP
>  - FW_HSR_HE_CHECK_FAIL_DROP
>  - FW_HSR_SKIP_HOST_DUP_DISCARD_FRAMES

Thanks for the breakdown!

> Those sound more like implementation/debug counters for the ICSSG
> firmware pipeline. They are still useful in ethtool driver stats, but 
> I would be hesitant to bake their exact semantics into HSR UAPI.
> So my preference would be:
>  1. Keep driver-private ethtool stats for the full firmware counter set.
>  2. Add a small HSR/PRP standard stats set separately, limited to
>     well-defined LRE counters.
>  3. Make the HSR layer expose them, with offload drivers plugging in via
>     an optional callback or offload stats op.
>  4. Define the counters carefully, including whether they are per-HSR
>     device or per-port A/B, and what PRP-only counters mean for HSR.
> 
> I do not think this patch should blindly become the UAPI definition, 

Not at all, the unique / multiple stats gave me pause. We should
only put in the standard API what can be easily and unambiguously
defined given the protocol spec.

> but I do think it points at a useful follow-up. If we want to avoid 
> adding driver-private names first and then standardizing different 
> names later, then it may be worth asking Danish to split the 
> protocol-level LRE counters out and route those through a common HSR 
> stats interface.

As a general policy we ask for standard stats to be added first and
ethtool to only contain what didn't fit in the standard ones.
There are some technical reasons but it's mostly a mindset thing.

