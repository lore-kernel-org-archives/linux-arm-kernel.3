Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D97C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA8i50LRXySSnq9O4752aSrUJVnRatE8qCQ0iqDdKyo=; b=eb9EtE3amFxxNBZsAnNedyObyX
	Z3wZH31SdxjxctfK1T4ryPbfF3SehHh70jnxNDtI0qGvz37sFU09d6Nco6uEt0/Uz12E/aKbL/H6x
	/cSL/n1MbGKPY4enOeWnTuhYd6K8BSAPAWVs4jQ3yMgpsHAXAmQR0AAt4VUkj+m7Qf4J/Z8+CFkgM
	DHfwnTTHdngBmKlpqTGlh+YOoJYGfWpV9oHGmHo5nNJZ/9c/1zVjVuSKTh18N4Hd8PMX9puCnx7RW
	Cib+ah01MyPT8Tu11LWHjul1jUR0ULbWnT7gA8TfKPSFGq8QyOLhH19pua1z8LkdI/MceGaAtBbNs
	u9p20haQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuFw-00000009BHN-3iem;
	Wed, 19 Mar 2025 14:18:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuEF-00000009B3c-46MO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:17:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0872A4910D;
	Wed, 19 Mar 2025 14:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6DFC4CEE4;
	Wed, 19 Mar 2025 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742393826;
	bh=SZgZgjOKi8q48V+T+EuPhMfJGe10Z7y4FRnPXxKBK/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ul+QWaPXdGOmm/uqkJGFNkNPjj9Qnm9bJR8CrPr/KVsEDZfxvDA8ejiJkALbfsUC6
	 wLKpt2ujWKp7NuFh+18eZb0wUMzjnMnJlqHHD1xVpbwmHEktopZdw5hJfD5kL+LkLd
	 H7bi7J5zwoaYOOret/fifvn7Ga/zZ85Unszj8fwjrPhiKdZQaAinqoXW1ggVC8llae
	 EBJxb5RzhBHnIsBb7wiJV7vwUz5mdzu81es56IzC1EgxruNe9WTJ813my4PPL4+Xb8
	 9Hl3yYV36hrWwL94UWRC/JXs6d6N23fT6eFnyB0dRUcLXW4Eiop5FiRYrtxVuSVF3U
	 4gno9LzUFSIRQ==
Date: Wed, 19 Mar 2025 14:17:02 +0000
From: Simon Horman <horms@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Sai Krishna <saikrishnag@marvell.com>,
	Meghana Malladi <m-malladi@ti.com>,
	Diogo Ivo <diogo.ivo@siemens.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net] net: ti: icssg-prueth: Add lock to stats
Message-ID: <20250319141702.GF280585@kernel.org>
References: <20250314102721.1394366-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314102721.1394366-1-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_071708_076468_801CE415 
X-CRM114-Status: GOOD (  11.27  )
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

On Fri, Mar 14, 2025 at 03:57:21PM +0530, MD Danish Anwar wrote:
> Currently the API emac_update_hardware_stats() reads different ICSSG
> stats without any lock protection.
> 
> This API gets called by .ndo_get_stats64() which is only under RCU
> protection and nothing else. Add lock to this API so that the reading of
> statistics happens during lock.
> 
> Fixes: c1e10d5dc7a1 ("net: ti: icssg-prueth: Add ICSSG Stats")
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
> NOTE: This was suggested by Jakub Kicinski <kuba@kernel.org> [1] to get
> this as bug fix in net during upstreaming of FW Stats for ICSSG driver
> This patch doesn't depend on [1] and can be applied cleanly on net/main
> 
> [1] https://lore.kernel.org/all/20250306165513.541ff46e@kernel.org/

Reviewed-by: Simon Horman <horms@kernel.org>


