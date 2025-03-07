Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11844C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGLk51Ky5dSS6wWeyeF4QhXTbKSNe/oHZOVTDo/a4Ls=; b=uWsryxOkofODZA78zfjbFDkRwy
	dm1YLUBsKkqoZAJJUn0HHPfkS93lh7OJgwsEjG97KeFXrbtWWU81jUpYCbSil63wCu0T+Xm6gyqhE
	wGG7Gxoayl+K23bLwF9pq4cpXMP2PIyWfK6cBkDUNgbFBWPI+6hTRFPZYp+qiqEqXsmjMCF6XZlky
	qZ0+b6ErRuPudj6FuzQNlQDVKnQaXRvKv95NgBQ8u0OgRWZUfiIFFWFUGDER0z3x0CN7lRXwX40BX
	ioiBsJgJwMDPBtuXsCj+9rPoc0ORQO1zhVl6aXqR3TctlIX2uN1mXizFnT+zC8mvZbgVX7D0CMT5X
	m9yVcoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqalb-0000000EwHu-3dAF;
	Fri, 07 Mar 2025 16:41:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqajy-0000000EvrI-14Tr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29E755C5422;
	Fri,  7 Mar 2025 16:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADB6C4CED1;
	Fri,  7 Mar 2025 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741365600;
	bh=HOeJpd1r+tua3PHtEh6C8x0ozDENLgAh0S3dq7OosLc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HlA/2tTf49Drh9dXoRuX4+ksLB0ISVkvOod9RvdmQMyAiFTikLxbVABO5cI+KhZ6+
	 /yo7hwScdT7/+NiRTQt8gSjN9+h1nXclYB/sy68vJmxmQsS4yg0YyPJU4ld+Cb7O6H
	 5iiym06QWuGMruMU4kug65VmbU7/QNCL+cdwqmu7YkMuO3iEeLwqvQWUDce66hbt1F
	 r+4hleY9aa1viPBbcx1WYlg6mZ9ieQufN8m4i9l8l1cPN6jny0xAtq99DawzUCfFLJ
	 tlRMtH6PEAXztFhtXfPCGDVACS7QoVtoFSe84hzEQbkQAex5AIHjWvyYrFRIy8ksr0
	 T2d7l4acdNG6w==
Date: Fri, 7 Mar 2025 08:39:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Meghana Malladi
 <m-malladi@ti.com>, Diogo Ivo <diogo.ivo@siemens.com>, Lee Trager
 <lee@trager.us>, Andrew Lunn <andrew+netdev@lunn.ch>, Roger Quadros
 <rogerq@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Simon Horman
 <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Add ICSSG FW Stats
Message-ID: <20250307083959.33098949@kernel.org>
In-Reply-To: <3931a391-3967-4260-a104-4eb313810c0d@ti.com>
References: <20250305111608.520042-1-danishanwar@ti.com>
	<20250306165513.541ff46e@kernel.org>
	<3931a391-3967-4260-a104-4eb313810c0d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_084002_413856_C4124EF9 
X-CRM114-Status: GOOD (  28.58  )
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

On Fri, 7 Mar 2025 16:00:40 +0530 MD Danish Anwar wrote:
> > Thanks for the docs, it looks good. Now, do all of these get included
> > in the standard stats returned by icssg_ndo_get_stats64 ?
> > That's the primary source of information for the user regarding packet
> > loss.  
> 
> No, these are not reported via icssg_ndo_get_stats64.
> 
> .ndo_get_stats64 populates stats that are part of `struct
> rtnl_link_stats64`. icssg_ndo_get_stats64 populates those stats wherever
> applicable. These firmware stats are not same as the ones defined in
> `icssg_ndo_get_stats64` hence they are not populated. They are not
> standard stats, they will be dumped by `ethtool -S`. Wherever there is a
> standard stats, I will make sure it gets dumped from the standard
> interface instead of `ethtool -S`
> 
> Only below stats are included in the standard stats returned by
> icssg_ndo_get_stats64
> - rx_packets
> - rx_bytes
> - tx_packets
> - tx_bytes
> - rx_crc_errors
> - rx_over_errors
> - rx_multicast_frames

Yes, but if the stats you're adding here relate to packets sent /
destined to the host which were lost you should include them
in the aggregate rx_errors / rx_dropped / tx_errors / tx_dropped.
I understand that there's unlikely to be a 1:1 match with specific
stats.

> > This gets called by icssg_ndo_get_stats64() which is under RCU   
> 
> Yes, this does get called by icssg_ndo_get_stats64(). Apart from that
> there is a workqueue (`icssg_stats_work_handler`) that calls this API
> periodically and updates the emac->stats and emac->pa_stats arrays.
>
> > protection and nothing else. I don't see any locking here, and  
> 
> There is no locking here. I don't think this is related to the patch.
> The API emac_update_hardware_stats() updates all the stats supported by
> ICSSG not just standard stats.

Yes, I'm saying you should send a separate fix, not really related or
blocking this patch (unless they conflict)

> > I hope the regmap doesn't sleep. cat /proc/net/dev to test.
> > You probably need to send some fixes to net.  
> 
> I checked cat /proc/net/dev and the stats shown there are not related to
> the stats I am introducing in this series.

You misunderstood. I pointed that you so you can check on a debug
kernel if there are any warnings (e.g. something tries to sleep
since /proc/net/dev read is under RCU lock).

> The fix could be to add a lock in this function, but we have close to 90
> stats and this function is called not only from icssg_ndo_get_stats64()
> but from emac_get_ethtool_stats(). The function also gets called
> periodically (Every 25 Seconds for 1G Link). I think every time locking
> 90 regmap_reads() could result in performance degradation.

Correctness comes first.

