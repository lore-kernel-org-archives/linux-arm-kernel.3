Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C466105F7A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeQo0CPJIJMydU8RkQeA+jd1TL+DTx6MtFkmSKkGNCs=; b=QG0KevcnKOmiOOrCPZRRDfLD6x
	JdRpFKxzVltD+SywKalNUJv6dOh48zp2Bx0llFBu+7TsCeC7mlPADt0EEdY+joVGDep7eX53qhYf6
	Tw+KL49S6Quga9JY4r2TaSqjRkdllIvMIjuzsjp7AFiZuHCfgWoAiJsZzGRlqxThN9v2C6tgdGl6K
	y0/sjCJhvDkqQ2zv3z8eDYUUNP+zr6OSTKPzm/WtSnXwGHhsTF1MbmwL4lDWxyfJd7lR90wpoolQn
	wFP4dq+cuX8X0Ou4/NsJ1Jv97YiL0DZYCXoRo6959cHNxnFS8a6sgZq5k22p7C80wLNQLcvX/u4tl
	eLPB/+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12br-00000000FNQ-0fg2;
	Fri, 13 Mar 2026 13:31:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12bp-00000000FNI-2Zfo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A83AE60142;
	Fri, 13 Mar 2026 13:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FCAC19421;
	Fri, 13 Mar 2026 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408680;
	bh=rjDxboEbN9PBbRfJRIEBNS24aeg6irTXidxj5ateeII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWjdx58wOVYhoSoJR4FcnGaavF+YH3YlsFNH428rWhwV0xwvYXeoC869SDVfXZwTV
	 k53lIQ2crmAWyD4Vq2fPYN8YQuTVYH8DI6zS1tR1CzNYAmfob+s2zJlrQWfRulxhd7
	 hZdlFqRNnD5avftUsauqGZR39Wb3yioCecz+S2tAttstBnRtH+aSno0VoWFHU3Dg++
	 2idSw6g9i9+IEUCcxJprhjvWvqrYsAabqzSXznSVLkYGSOZIUi6m308foPG42kniva
	 k8yuh6rGI1K0lbpatLeDoDhHh/jhKLTsd+hg27bIbr28jhSGSzYY1ey74u6ay6kpMo
	 VS9g4dUeIKZKQ==
Date: Fri, 13 Mar 2026 13:31:15 +0000
From: Simon Horman <horms@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Meghana Malladi <m-malladi@ti.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Add HSR multicast FDB
 port membership management
Message-ID: <20260313133115.GY461701@kernel.org>
References: <20260311082923.2962937-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311082923.2962937-1-danishanwar@ti.com>
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

On Wed, Mar 11, 2026 at 01:59:23PM +0530, MD Danish Anwar wrote:
> In HSR offload mode, multicast addresses can be added via HSR master
> (hsr0) or directly to slave ports (eth1/eth2). The FDB must track port
> membership: P0 (0x1) for HSR master, P1 (0x2) for slave port 1, and P2
> (0x4) for slave port 2. When the same address is added from multiple
> paths, memberships must accumulate.
> 
> Implement a hybrid approach using __dev_mc_sync() callbacks to track
> basic add/delete operations, checking netdev_hw_addr->synced to
> distinguish HSR-synced addresses from direct additions. Post-process
> to handle overlapping memberships by checking refcount:
> - refcount=2 with synced=1: HSR only (P0)
> - refcount>=3 with synced=1: HSR + direct (P0|P1/P2)
> - synced=0 with P0 set: HSR removed, clean up orphaned P0
> 
> On add operations, accumulate new membership with existing ports. On
> delete operations, remove only the specific port and clean up orphaned
> P0 bits if needed.
> 
> Add error handling for icssg_fdb_lookup() which can return negative
> error codes (e.g., -ETIMEDOUT). On lookup failure in add/delete path,
> default to no existing membership. In the post-processing path, skip
> the address update to avoid corrupting FDB entries with garbage values.
> 
> VLAN Interface Handling:
> Add support for multicast addresses added to VLAN interfaces on the HSR
> master (e.g., hsr0.7). These addresses require P0 (HSR master) bit to be
> set along with the port bits, since VLAN-tagged packets use separate FDB
> entries per VLAN ID. Without P0, the HSR master would not receive
> multicast packets on VLAN interfaces.
> 
> Track whether the add/del operation came from a VLAN interface path and
> set P0 when in HSR offload mode with VLAN interfaces. Update orphaned P0
> cleanup logic to preserve P0 for VLAN interfaces.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
> v1 -> v2: 
>    Added a helper function as suggested by Simon Horman <horms@kernel.org>

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>

It is unclear to me why this is marked as Not Applicable in patchwork.

