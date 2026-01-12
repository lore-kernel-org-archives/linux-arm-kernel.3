Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B712BC9EC97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KH+B1TrgJ+pmHNDI6mOnDVhgHwLKAlUMqvvlaKosWw=; b=331AL9oiS0AZsPbiw4zfgRwka4
	MajNatJ10DK7Pdm6ucXdzbrjhp6K7QG/jRnawgOVbruyT5ONjrnA2aPPAg2Rj5xc375mCZN6FVAKG
	a2uGDAF91xWLE8Z/oopZiwSbJjGn88zdld+DR9xOfB6gZTE805DWHlggWh82dqdbeo/qwz7+pgNsi
	wmNCw7hPOOJNm8thwGRrl5gk4zJaH9wD7jy5n729f1MvOzAFYgRTfiab6oyWP89ET48eKrPCXp0X8
	auSZ+CPTMoHotdPw6xJ0YXSrIXH8hjFJDCly5OOd54vz4bh/cdkW80PvcGlwPdOdL1O9/YmFd6sN3
	PQXwxI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJoa-00000005dmO-1CqC;
	Mon, 12 Jan 2026 15:26:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJoY-00000005dls-0MgP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B006B44267;
	Mon, 12 Jan 2026 15:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D07C16AAE;
	Mon, 12 Jan 2026 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768231600;
	bh=sl2zm1e8Xq0C8os/T82of2ab0lap0J3S5GZLuulyDb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMgY08iKCGvYXO0xquWj3zGWAf1+lPX1wT5sJkOUXKw8wHMLGXXL3pX7OfJurCeuu
	 uhRIcHMuE5FkVFmKePGuC+Rkfw3N/Sc7Uk+Pc4d4TXlFT2NX/XnRtiCExy3lrmmpMv
	 viPo65VWzeR9ElfqRCjsaKEttO7jeR6lrSTeCI7kMaOtqtgimshvazNP9kPk8EPRvT
	 yMZfZjvleM5RwPDgfS5CYbaqf2r6AdP3Jl5y1sEtVr42UYRcBsZQLb0Zcmn7mRqPpC
	 sU7+BckoguXjGIv2CmJPr28c23q1R+QxBK6PQoEMQzYk6ts1+2c9A4RIxWIvj4T07w
	 bfSI8o3QLOA8w==
Date: Mon, 12 Jan 2026 15:26:35 +0000
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: stmmac: convert to use
 .get_rx_ring_count
Message-ID: <aWUSq925KrWXh0Rg@horms.kernel.org>
References: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_072642_147217_BB57BC8F 
X-CRM114-Status: GOOD (  12.26  )
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

On Thu, Jan 08, 2026 at 03:43:00AM -0800, Breno Leitao wrote:
> Convert the stmmac driver to use the new .get_rx_ring_count
> ethtool operation instead of implementing .get_rxnfc for handling
> ETHTOOL_GRXRINGS command.
> 
> Since stmmac_get_rxnfc() only handled ETHTOOL_GRXRINGS (returning
> -EOPNOTSUPP for all other commands), remove it entirely and replace
> it with the simpler stmmac_get_rx_ring_count() callback.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changes in v2:
> - no change from v1. Basically resending it now that net-next is open.
> - Link to v1: https://patch.msgid.link/20251222-gxring_stmicro-v1-1-d018a14644a5@debian.org

Reviewed-by: Simon Horman <horms@kernel.org>


