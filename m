Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2BCCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNMIfVK1t4JwfaOevWXD8LztlJ1NDF/MO/IaQ8lcPZc=; b=d7EhBLzzxQ72C2yjQr9s58K3A4
	CRTPpFdK0owclVAbRLiEUvEg6IXDldaQJV6WaakA2AEcfk7a+22Xsr+r1luJ9BLe3ScC2tpl29tqy
	e+yAoS49H6xFLA/jnJvDiUzWympkXX6IZLU5G17E/yjnnuDd5Bt2u/8ttzNnu2ET1p93ZJcEh+t0q
	1QA8gT67xrST3v+jsn//oL0PzJGvy9KTHYtV4wKQCI+AhcrlkNJWFLW9HeIJB1z59KUP6Krj/wM3H
	nSK3hyy11kK/Z/tfows/itZpRQ2BWuTAUxlanZJn2t5bjfEoAuzywIPl0Ti8oIC6BgEuttNcW5mUi
	l11SlQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPimN-00000004yOa-3kXV;
	Wed, 20 May 2026 15:24:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPimL-00000004yNA-1UcY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kNMIfVK1t4JwfaOevWXD8LztlJ1NDF/MO/IaQ8lcPZc=; b=Zy4qsVk2VIEMXyiH3/0AgPbuHI
	imrSS+xEi3g3I8muamtJQPNS4ZyzploNR06neqgcgrMmWdqIYg2XD3fTQzJVwxjjqkH9WpftUKUBf
	7nIsN1zJrRIkh0soZxllX1rlIq1bwo8hbvr1LEeswq5t6/p93YFrEKT6IW0naIzUkRGg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wPim7-003r0s-Jl; Wed, 20 May 2026 17:23:59 +0200
Date: Wed, 20 May 2026 17:23:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: dev.taqnialabs@gmail.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: mmc: Remove duplicate mmc_rx crc
Message-ID: <bd8efd40-e203-4cdc-af25-12b1e2727922@lunn.ch>
References: <20260520-xgmac-mmc_rx_crc-cleanup-v1-1-7133f529859f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-xgmac-mmc_rx_crc-cleanup-v1-1-7133f529859f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082413_393577_76F0FC71 
X-CRM114-Status: GOOD (  10.00  )
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

On Wed, May 20, 2026 at 02:25:12PM +0000, Abid Ali via B4 Relay wrote:
> From: Abid Ali <dev.taqnialabs@gmail.com>
> 
> Double read of mmc_rx_crc_error in XGMAC is removed.

The commit message should explain "Why?". I can read the code add see
what the patch does.

Why remove the double read? Why is this safe to do? This is hardware,
maybe it has latches values? Or clear on read? Maybe two reads are
required? So the Why? Is very important, more important than the code
change itself.

    Andrew

---
pw-bot: cr

