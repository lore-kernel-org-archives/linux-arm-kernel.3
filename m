Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1969F483D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSyoTiRnJUfGsVyiEwE4Z5PyD37fLTvbyWvBNROP73A=; b=t5wcyWc7SxOn5Krq0cwfVBbbx+
	dDVWx0ylF6wIKCbIxbokn6221YI7VCTrfxXY2ilUSFcaGaoq0ywODMk3J9efzYJ+uoUn0TCdOmSvJ
	gJn2HG8JOhimUGehjCDdOaHTLb5XpxXhenjVmpl3nMZ640UThelKQnCXaqK7TDc2GGOPCeCf1k7yG
	42KasHAid0Xzi7DVHhs8R6WiAtsWg0UsI4m8UKcqK37sPT3kSCk9WOL697FdROEovEF9+v3Yr1gBl
	0fF5vhq3PMIAwi4p83OVUmqwCK2XsKXSpmCsPfeojZgDL9WNatEdNKTkqWqeX7vmH4S6H3ebbSkZT
	1vdEkntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iUq-0000000HAaU-0ykW;
	Mon, 23 Mar 2026 16:51:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iUn-0000000HAa2-1LiD;
	Mon, 23 Mar 2026 16:51:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F49F41A9D;
	Mon, 23 Mar 2026 16:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF57C4CEF7;
	Mon, 23 Mar 2026 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774284676;
	bh=WdjcxPTcT4Y1PoQE6XWTl+XVkmHgqj7rjddA4gBZ+fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYBaKdSK6Rwh8nA7QIeDktYYeXxlL+ZSi7aXvMooTqNgyaRLPpymvsOHWKiHf+8EY
	 LRYBHuC6zk6xNtVsgPwaKNNjxKmfo9a9fZID0sbEKqJqMf3HYrS02XiAzeed6vGHff
	 NxE84qFs61x5Zu3CaiOGwx2MKU2F691PpHUOs+k6MYqbEGYMJW2tXakmoLAPurQDM3
	 WSNZqr94++bGnXOGE5wWPlcmObWMgio4pm8LnQMGfjNV2K7dx0wvvcPPOLuwI3w0+J
	 MhklBAuGx2qCp0o1w6kGDDOWqH279aIalL0YZsJNVXjLQlzprSSj9ML4Lnvc8YzJCR
	 p93PZUE0SnVHQ==
Date: Mon, 23 Mar 2026 16:51:12 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Rework the code flow in
 airoha_remove() and in airoha_probe() error path
Message-ID: <20260323165112.GA137813@horms.kernel.org>
References: <20260321-airoha-remove-rework-v2-1-16c7bade5fe5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321-airoha-remove-rework-v2-1-16c7bade5fe5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_095117_384940_54DE6521 
X-CRM114-Status: GOOD (  11.20  )
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

On Sat, Mar 21, 2026 at 03:41:44PM +0100, Lorenzo Bianconi wrote:
> As suggested by Simon in [0], rework the code flow in airoha_remove()
> and in the airoha_probe() error path in order to rely on a more common
> approach un-registering configured net-devices first and destroying the
> hw resources at the end of the code.
> Introduce airoha_qdma_cleanup routine to release QDMA resources.
> 
> [0] https://lore.kernel.org/netdev/20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org/
> 
> Suggested-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Fix eth->napi_dev leak if airoha_hw_init() fails in airoha_probe()
> - Link to v1: https://lore.kernel.org/r/20260320-airoha-remove-rework-v1-1-adeef7e3c01f@kernel.org

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>


