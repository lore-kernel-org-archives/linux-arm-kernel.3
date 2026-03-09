Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3429F3C264
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 14:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AxWEgEPodwF3rnydglTtp7BNVTmuFIWM803BQIvvmM=; b=HmlBrm057Kxtaloa352Oak7etw
	U7ficjKR3KNwDOnpbtNXwx+cYmW8/Z2nMhSW/h5V+ImcZJz/KE8WP9F2PS0JQLH+e2j0pQyzzPuee
	2gKomJZD2JukWCfZrRwe/bkHtR6sKM2AXnXRhI2/KOsKhWu8Fi4TYVjJngNuDKPAKea8LZXqHBMQW
	hKjTDAi5dsuyqrRXoqU6ItTIL3nziqg7V7ysAegTjf638beTLLjku/QHrRWV12JEvMchte3asg0n0
	yK14tLpCqyDvl8Biy6ahalepcpqO3i0o3/D25Vu8SkZEz5MQwq+fKAkHnu4dXiVMvZr5lp1AQTdV3
	DZaf+Jzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbKr-00000007RtA-3JBT;
	Mon, 09 Mar 2026 14:11:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbKq-00000007Rt3-0InD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 14:11:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FAD0600B0;
	Mon,  9 Mar 2026 14:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D789C4CEF7;
	Mon,  9 Mar 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773065510;
	bh=eU3p9YG5GnWj0CimWx09QBU2c22dNqQdlfhvs6jTrCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQ9QDWKHBsALDsFDu+FCDUGjGJQiCXlQr1xtTVG9N3bn7d3Pi4i9BFYVHPC7FwRGD
	 aNVP+dlyfmorKMEQUyV1tsXJYkg3LjdZDkBw9PrabWG3Xx/clUt4JYHO38m1o/beVv
	 OYay9BxCYGCxQSMkt5tB9TBbfNmHsutbFGaDqi3X4CN2K4n68Whe/N3cts23tKZFaV
	 w+a1lYg/YlcxHtt6LEtYLJRziT6dj5b1317DlhTIoEqSCioRDSVu9eRfZ/KCEJlpq4
	 abDpNFn7CRndEsJz77lp7yRQft7jOk7GGa8ZoCA9xoNmOFmScFDdO8CwTOlv7L8eMl
	 UlZcKEcIYZybQ==
Date: Mon, 9 Mar 2026 14:11:45 +0000
From: Simon Horman <horms@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Meghana Malladi <m-malladi@ti.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Add HSR multicast FDB
 port membership management
Message-ID: <20260309141145.GI461701@kernel.org>
References: <20260305125251.1828326-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305125251.1828326-1-danishanwar@ti.com>
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

On Thu, Mar 05, 2026 at 06:22:51PM +0530, MD Danish Anwar wrote:
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

Hi,

This patch is doing quite a lot.
I understand that there is a relationship between those things.
But I am wondering if you considered breaking the patch up.
Or is there too much interdependency going on?

> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 233 +++++++++++++++++--
>  1 file changed, 217 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c

...

> @@ -1077,8 +1191,95 @@ static void emac_ndo_set_rx_mode_work(struct work_struct *work)
>  	}
>  
>  	if (emac->prueth->is_hsr_offload_mode) {

In a similar vein, this condition is now doing a lot:
about 90 lines more than it used to.

I'm wondering if you considered placing the new logic in a separate function?

...

