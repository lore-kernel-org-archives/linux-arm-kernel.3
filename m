Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86BAD5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dvR6Zn9v7+U/7Jyl0JHa1NXj7t5sABKJh1DbNdnrQU=; b=QnCfIutXvWpS359vvUgYH8J99N
	gnN0gFhh/eodDpPEe+QPr6HN821EnL1XvY9cwAcCJZ7dwV6RY2pz+zUEZt3h1j9pyosc1jEG9bCbz
	pjGNkfMi9UqCx3OviGn0nJoomEQQhVwMEcOK0l8mhWy87+E1QjDe3ZtlBDpcnDSVvL5LlEyA0QTpe
	iQEkSK+sjXFTXHD8Ug3XJ0iwq7YPJ4zM6tD5zm7QU+SvdvawMpr9+wy0cKDr9DBbIB8228rbJTnNk
	bbS7Bk/GilSWVMeWWPzQJfW66gNJMNRQgAq3m57XoRDM65MqI1/lV2j9QIGS8QpvvGKVdG+taLMe1
	U8DyPFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Is-00000003l2s-3IXM;
	Mon, 15 Dec 2025 14:11:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Iq-00000003l0D-1E4p;
	Mon, 15 Dec 2025 14:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 403D443E9E;
	Mon, 15 Dec 2025 14:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54174C4CEF5;
	Mon, 15 Dec 2025 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807915;
	bh=JCdGuaJKJaJZynKZlHlxSVrlzoFaBengO+enakJZ+U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJQvjIL6gxdZ9lq7hBcRDLXcvO2lqxdFeLCu31Zjbir9N/GPDiOkhsZS/lgGCdoKS
	 sa06tO1xqWcY1TkRyiFkUzRxxZftHTIbBFtA9bMJ2AByXx/9gK0FpdXpdIbTgmVsw4
	 MXs3RRCfOX9BNl2NLNtzJxDOHfEqC4TidFh52fq1STTO+oLaBIbGObT/LhCrEuM0S9
	 5zqeo+FID4dgFjSJPlnC98fBsAaCU6DzicsCYpd0jYznYQvL0tzkLUGGmMHpsIOPDm
	 OSKBVViV8JUA9nemO+lqTzTG2fcFMbV3q3xXHL5aHm+hSNWEe/egnX8tarAgHSe0El
	 AeNM1+zxFB+6w==
Date: Mon, 15 Dec 2025 14:11:51 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Move net_devs registration in a
 dedicated routine
Message-ID: <aUAXJ01iHnSJtItt@horms.kernel.org>
References: <20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061156_355266_DE49689D 
X-CRM114-Status: GOOD (  13.10  )
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

On Sun, Dec 14, 2025 at 10:30:07AM +0100, Lorenzo Bianconi wrote:
> Since airoha_probe() is not executed under rtnl lock, there is small race
> where a given device is configured by user-space while the remaining ones
> are not completely loaded from the dts yet. This condition will allow a
> hw device misconfiguration since there are some conditions (e.g. GDM2 check
> in airoha_dev_init()) that require all device are properly loaded from the
> device tree. Fix the issue moving net_devices registration at the end of
> the airoha_probe routine.
> 
> Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

As a fix this patch looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

But I am somewhat surprised that the netdev isn't unregistered earlier
both in airoha_remove() and the unwind ladder of airoha_probe().

