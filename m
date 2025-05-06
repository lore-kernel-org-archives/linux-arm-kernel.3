Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DABC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm9nOwv/cimLQAKfnZq94uwXphAbyInRVUA2BK10teA=; b=CY6L6Nd6IIPfDVSOMWtKWGoM9A
	7iY0f4MFaKO3XZJf4TZ7nZ2BEperHOYWvxrTA5usgMtQ5c8AfJiE2LiLa2yo8g3WKOFofVq3ndq9x
	KDYU+5Yc73nKtxty0jdqIAQZYNbc4PQwB//ueRRLFvslvW17lgOSLfqvxIdR6gVaEkBEhoSwaoDYh
	CI/ne7h9Na7rDbtVrWMlzFX6vhmT6Bs0qI1Ha+HMgQQwQgb4Yyk2ynPUUne0rM7kxPpSEiI/LP5DX
	fNJzacya9fFU793ZHdbrVUQpjCCxw0siOHhgtTVI7y0DPJ6zJyXhVNOe1lMkS+aznNQO8rFt0TvVC
	tax1nSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNvZ-0000000DE5u-3eyi;
	Tue, 06 May 2025 19:26:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKBB-0000000CULl-1Udm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18695A4D602;
	Tue,  6 May 2025 15:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D32C4CEE4;
	Tue,  6 May 2025 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746545155;
	bh=8n38TSBJmBwvs64PRmlNU+Hw9KwwnaLfXu8Gxhr7I4A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ibZ9lgxmL6bmeZofnWidzB/nTKHyL2JhpdcpMZYM5tAbA1gdfeEbbCaWIZeIUrZKJ
	 BydPQgKYEEHIo7fdhSvv2L7/x7fE3kD/0v1cllQB1S2kgLRAqoJEvdxm6JHhhUHJHg
	 OnGCkLgbOo9CE52Jsk7ZJBpgp2bDCcq4NKZIbhoJnkDZz0D2EGah6quZaFK2/CWJDt
	 CA5WtciN71wqTGrCn3PVAKFfMKscX/y8LHf9fG969X1rfYU8ugWiHjGZXTs2uKsuNB
	 tRO7EDY1h7b0MoSMglrL2Z9PEak9Jp0q/+1YPRKTGXG0Un/+6BMbF/H4dJoNy3elgT
	 wQT1k2qgYD4/w==
Date: Tue, 6 May 2025 08:25:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov
 <ast@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Jon
 Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next v2 2/4] net: stmmac: call phylink_carrier_*()
 in XDP functions
Message-ID: <20250506082554.75959fec@kernel.org>
In-Reply-To: <aBnK4i52tEHs3jm_@shell.armlinux.org.uk>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
	<E1uAqYC-002D3p-UO@rmk-PC.armlinux.org.uk>
	<ed54d4e5-ecc3-4327-8739-3d41ca41211e@lunn.ch>
	<aBUG6Z_Crs31W45x@shell.armlinux.org.uk>
	<aBnKKafHHjkL5iP-@shell.armlinux.org.uk>
	<aBnK4i52tEHs3jm_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082557_465691_7A4846AB 
X-CRM114-Status: GOOD (  12.06  )
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

On Tue, 6 May 2025 09:40:02 +0100 Russell King (Oracle) wrote:
> > Well, this series has been discarded from patchwork. Shrug. I won't be
> > posting another version, stmmac can remain broken. I don't have a
> > suggestion on better names for these functions.  
> 
> ... and in any case, Andrew's comment would be a *separate* change to
> the subject of this series, so is not appropriate to be part of this
> series.

Right, I think the state is purely due to the typo in kdoc of patch 1.

