Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1005B105F7A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5zOj3Z8iO55CeP8V0C2jryjOUzeN4EE6DS8J2NpkYk=; b=TqpoER1BJJNDhzcduysz2e89KR
	bN2aSY8fypjl4tjHfmfH4U0FO5mTUkHQqyqsyBPSghR0JMd6fVLOm+n8RTKNYkSLHzxQU7gqTbq/U
	rHnpgyxKo19x7c31usbdUsYUw4Zc477Xm6jRpNniCFkTjALO3WOR7h8TqMqtsOAxOt5qxm37z16ll
	8FJm+xDFhG0svc+fV1yaLoip/WfdeKTMhmKNp8B0gb5yaEb1M05PAO4S1Q0e84PEcmZhvEPJMMkFz
	Zux1SwgXpUXxA/hLEtRimMCwtT3Bwj+CSm7VhJgWSsQplVJj1CTdDx/dgzhJJrECRoAu1xRg6rT3l
	g/3rTneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Hl-00000000BDu-1cmR;
	Fri, 13 Mar 2026 13:10:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Hk-00000000BDb-1xKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 869C560132;
	Fri, 13 Mar 2026 13:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F77CC19421;
	Fri, 13 Mar 2026 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773407435;
	bh=vwogDLBb4glPRani4L2Ss2Ekn/HoYwTUUMhHpHLV/mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MNojZUh+gFaH2QRXBucakHU01BghXFsWk19vCgkM6aew/ebFi5ynWio67QbZFkXY7
	 TCSO3KMjYnEJIOr72QVQ2fRJyHGJGGSFuuGoVhrq0ZRPPdtby2DECkB7hVr/6Wehe1
	 HyKnhRCIY1AlzPWyCpddwDe/y70Npx+H3p7dKsKq11RK0yaA4FbE7tmi3ihbHW2uVy
	 M/IKbO5V7DL8HVxyJUPUwU8lQVs6/3X2pZNnB1oxz5Sjv2N3gmJqG3fKtqzCKtwySo
	 A49STKw1eLCTjH45zFraS5RBZnxV90Jx9o7p9WiwMzn3nyyLW7b3kgbx0n+6yHZjkH
	 OBx7grXCjImhQ==
Date: Fri, 13 Mar 2026 13:10:28 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vadim.fedorenko@linux.dev, haokexin@gmail.com, jacob.e.keller@intel.com,
	sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org,
	daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix memory leak in XDP_DROP
 for non-zero-copy mode
Message-ID: <20260313131028.GA1311528@kernel.org>
References: <20260311095441.1691636-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311095441.1691636-1-m-malladi@ti.com>
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

On Wed, Mar 11, 2026 at 03:24:41PM +0530, Meghana Malladi wrote:
> Page recycling was removed from the XDP_DROP path in emac_run_xdp() to
> avoid conflicts with AF_XDP zero-copy mode, which uses xsk_buff_free()
> instead.
> 
> However, this causes a memory leak when running XDP programs that drop
> packets in non-zero-copy mode (standard page pool mode). The pages are
> never returned to the page pool, leading to OOM conditions.
> 
> Fix this by handling cleanup in the caller, emac_rx_packet().
> When emac_run_xdp() returns ICSSG_XDP_CONSUMED for XDP_DROP, the
> caller now recycles the page back to the page pool. The zero-copy
> path, emac_rx_packet_zc() already handles cleanup correctly with
> xsk_buff_free().
> 
> Fixes: 7a64bb388df3 ("net: ti: icssg-prueth: Add AF_XDP zero copy for RX")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>

Reviewed-by: Simon Horman <horms@kernel.org>


