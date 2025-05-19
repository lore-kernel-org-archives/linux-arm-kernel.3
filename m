Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C911C54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/ChxHNdxHGa7PCVkQKYWwIJ8o1DVV/3CQmBnmO0tpA=; b=brWp1tKHKg2cvqqHmbIar472Ui
	2yLUKGhm05c6+wK9e/GM18QYS4v03vCBvvGYknYjpuMU/eex+QKpD3yg81YYepChEVRPSjfxyZuwe
	IRE7F1ViwS3QQ3wgEibDGUVuLMP+SC/pdpSTl/flD1iVRbSBn2psFRVirwVys+GUVd6HUflAx/shZ
	e+4lZfHS4x4sll/S8x1od8LrBkZBTErSccZ4/ZcOJMuDxq/ob1yOoN4Jmr8S9E/yV9xaqIDhxb1Kj
	SqaO9ctj06Sx99fdxbHIwSqsV9qBbZHD7N6CNMscmbXiM1sTExAx3VwKdNRcfWAdktcpXXYFu7lXu
	vDFxoEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6bD-0000000AJlA-1Rzv;
	Mon, 19 May 2025 19:56:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH67h-0000000AEIy-34IB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 19:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V/ChxHNdxHGa7PCVkQKYWwIJ8o1DVV/3CQmBnmO0tpA=; b=iuWJLgsFIr7a0Dbf6xa4akBst0
	BCqtmhb5x1fVYRVfOWGLUAeWIJlJ5YQ3vValSwGCPoQ1XhwMvY8f7GqB/sqUVcJ6uxGryxGRRMEdx
	PJTcmjCdqSu0hjAlGsGe4/gY0Lwhm70YQaovrG4Yr/aPtr7g4m3Af1HRnjI8Qp+DjlGI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uH67b-00D38I-Gg; Mon, 19 May 2025 21:25:59 +0200
Date: Mon, 19 May 2025 21:25:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH] net: dwmac-sun8i: Use parsed internal PHY address
 instead of 1
Message-ID: <d89565fc-e338-4a58-b547-99f5ae87b559@lunn.ch>
References: <20250519164936.4172658-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519164936.4172658-1-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_122605_770490_70CBD480 
X-CRM114-Status: GOOD (  14.56  )
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

On Mon, May 19, 2025 at 06:49:36PM +0200, Paul Kocialkowski wrote:
> While the MDIO address of the internal PHY on Allwinner sun8i chips is
> generally 1, of_mdio_parse_addr is used to cleanly parse the address
> from the device-tree instead of hardcoding it.
> 
> A commit reworking the code ditched the parsed value and hardcoded the
> value 1 instead, which didn't really break anything but is more fragile
> and not future-proof.
> 
> Restore the initial behavior using the parsed address returned from the
> helper.
> 
> Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Have you validated all .dts files using this binding? Any using
anything other than 1? The problem with silly bugs like this is that
there might be DT blobs with the value 42 which currently work, but
will break as soon as this patch lands.

Just stating in the commit message you have checked will help get the
patch merged.

      Andrew

