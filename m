Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1499BC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0u8GW58OtFP1vJS0kblEDCNv4tYQ/aqVCBFjiK0UBrw=; b=4x+tindYFNoyUKVeD0+k+MmFef
	l8wFLXX+viXaU8h1FlluBmibSOHm8FNImwsYdT1MAL3HX9IglBDu+1Rhp/Jz0AkD7O+H/lPQ/SEyf
	G4F1auEaZ5MELZpzwQd6WoKsVrTIUD7mvjQVvBTTrKn9+pMKYe4H7GycTHbyTZn+4aVL9ncznlK1L
	TULKG4+EnWvd/RkZdoQOI4aXlY2UUDxeBG1yAeuVKNAmFDcLWC4KdxN0EYm1/0boq9NnOI4w63lSg
	40V29QJW9psKGXHIIuA9xqjglTC6q2wt91JZyXkROBn/gmMb0+xrdtyPSKDWCbqs/9QDNnHmArvRs
	N/SxwNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCpD-000000023cm-3s93;
	Mon, 30 Jun 2025 11:37:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCX4-00000001zxu-1CPK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 11:18:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 626D05C418B;
	Mon, 30 Jun 2025 11:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31D3C4CEE3;
	Mon, 30 Jun 2025 11:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751282321;
	bh=/zPtV6dESq3W/I9QbMckyTu4GDaEL5TPBWwywPJ32S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgtoOB9vsslvh2n8Etqblw7N5AJFVaQmiRZrFoPCTCh4i54PbjXwP+1ZC7y2HP1qP
	 AkFlhmywwhYYtPjDbPQyjbq6Twn2Wiw2r6TQKe3zb0VmytVO8KInWYObJXlIUPOxeM
	 sxethmiiN5Ne2KMx7N2VEBGnwT7CYc6aST1+rBYyErzNzOZnQYxiIPdhqBGz+OXpeb
	 ZnaGaoK2Eo+AKvWXrjsmmgcH3djTIuhmpxf/Y+/V1H9dxKw0ZC52nN68VnqbX7aPfm
	 0J8u3TdNq9laFK3F5ZA6RqfFMdme1keMqYIZ7pNdzkAMGn3g6R85/uwXYskmzCceEv
	 d/RH8Id6k1YNA==
Date: Mon, 30 Jun 2025 12:18:36 +0100
From: Simon Horman <horms@kernel.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: thunderx: avoid direct MTU assignment after
 WRITE_ONCE()
Message-ID: <20250630111836.GE41770@horms.kernel.org>
References: <20250629051540.518216-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629051540.518216-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_041842_368180_F5CFF1CB 
X-CRM114-Status: GOOD (  11.46  )
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

On Sat, Jun 28, 2025 at 10:15:37PM -0700, Alok Tiwari wrote:

...

> @@ -1589,16 +1588,18 @@ static int nicvf_change_mtu(struct net_device *netdev, int new_mtu)
>  		return -EINVAL;
>  	}
>  
> -	WRITE_ONCE(netdev->mtu, new_mtu);
>  
> -	if (!netif_running(netdev))
> +	if (!netif_running(netdev)) {
> +		WRITE_ONCE(netdev->mtu, new_mtu);
>  		return 0;
> +	}
>  
>  	if (nicvf_update_hw_max_frs(nic, new_mtu)) {
> -		netdev->mtu = orig_mtu;
>  		return -EINVAL;
>  	}

nit: curly brackets should be removed here, but see further comment below.

>  
> +	WRITE_ONCE(netdev->mtu, new_mtu);
> +
>  	return 0;
>  }

Could this be more succinctly expressed as follows?
(Completely untested!)

	if (netif_running(netdev) && nicvf_update_hw_max_frs(nic, new_mtu))
		return -ENIVAL;

	WRITE_ONCE(netdev->mtu, new_mtu);

	return 0;

