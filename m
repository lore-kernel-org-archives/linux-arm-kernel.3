Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C94CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxHls+mvYMga7q55+aIvfUsybLdFRk1lb/ASdVVdilc=; b=fKHc9qA+imT0zaJm8CqZLgTx7l
	qzejnfWawzR7ud7WtM+R7O/7gtvw6gRrBVIhfv0izafPTFZZSIwEgn1V62uOfzCp3+BpoU2XLHPzT
	OdtAm3dUHXgw8aagdn2DyDDyVNjZVS5N8+/sx1uge6YkfY0bFjWbVBIKrCC83Sx5T2g4ijBhjJ8f7
	R2hwK71+sKrlD3CyTpQzSmFsJNdUCG6LQwVqyfBgu3l7BlZq+sqmG1kTOYLYa5GyJGFQ66ubv0oUD
	NO/6LpTjrleuhKdos++XYQGddEnXJkFGJBUKg+5689lsNa79ckC4n9l66gsykCnEobjCcPIe+WHK4
	dHbg/CsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8lI-00000000u4L-284V;
	Thu, 18 Jun 2026 09:10:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8lH-00000000u42-1FRo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:10:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B606B6012A;
	Thu, 18 Jun 2026 09:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EFF1F000E9;
	Thu, 18 Jun 2026 09:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781773810;
	bh=qxHls+mvYMga7q55+aIvfUsybLdFRk1lb/ASdVVdilc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UgoBVbxzGIUUQ6cAtRfdVkrJ2rsSgVY/ScZtJ7SG+5Aafgevh00svnwfE08ooiOjX
	 b49oxw1IR95axsZQiIl1Xhf4+KaxY8OZnF/su7GVVAPWVaSS/TvEKyM41LCbwVhY8U
	 XvAXyTBeHdB9EcbARwAEP/A/BtaqPRoE3dMSxWlFZrwk08yjveqPEyYVZWF7iVDQs6
	 OPUNKTXf8KpafqXbtfE1TP0juYfjDmF6He9zX0hXzimvu8e61vQuCP80ZcTwpuQ/TM
	 6Z3r7x+4QiYtP/ofsEGQ0D8WlCH6BMS8lfQdRQgxzdjM6bAzY+TJbReMXglfuDggVN
	 t9qprRxmJWM6w==
Date: Thu, 18 Jun 2026 10:10:04 +0100
From: Simon Horman <horms@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Cc: netdev@vger.kernel.org,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	danishanwar@ti.com, rogerq@kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Carlier <devnexen@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>, Kevin Hao <haokexin@gmail.com>,
	Meghana Malladi <m-malladi@ti.com>, Paolo Abeni <pabeni@redhat.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: ti: icssg: guard PA stat lookups
Message-ID: <20260618091004.GG827683@horms.kernel.org>
References: <20260616143642.1972071-1-dev@pschenker.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616143642.1972071-1-dev@pschenker.ch>
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

On Tue, Jun 16, 2026 at 04:35:34PM +0200, Philippe Schenker wrote:
> From: Philippe Schenker <philippe.schenker@impulsing.ch>
> 
> icssg_ndo_get_stats64() unconditionally calls emac_get_stat_by_name()
> with FW PA stat names regardless of whether the PA stats block is
> present on the hardware.  emac_get_stat_by_name() already guards the
> PA stats lookup with `if (emac->prueth->pa_stats)`; when that pointer
> is NULL the lookup falls through to netdev_err() and returns -EINVAL.
> Because ndo_get_stats64 is polled regularly by the networking stack
> this produces thousands of log entries of the form:
> 
>   icssg-prueth icssg1-eth end0: Invalid stats FW_RX_ERROR
> 
> A secondary consequence is that the int(-EINVAL) return value is
> implicitly widened to a near-ULLONG_MAX unsigned value when accumulated
> into the __u64 fields of rtnl_link_stats64, silently corrupting the
> rx_errors, rx_dropped and tx_dropped counters reported by `ip -s link`.
> 
> Every other PA-aware code path in the driver is already guarded with
> the same `if (emac->prueth->pa_stats)` check.  Apply the same guard
> here.
> 
> Fixes: 0d15a26b247d ("net: ti: icssg-prueth: Add ICSSG FW Stats")

nit: no blank line between tags

> 
> Signed-off-by: Philippe Schenker <philippe.schenker@impulsing.ch>
> 
> Cc: danishanwar@ti.com
> Cc: rogerq@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: stable@vger.kernel.org

Reviewed-by: Simon Horman <horms@kernel.org>


