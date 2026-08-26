Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B43C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BSYdpEPt01McAnG4u8lln5Yld57nZzWrLhCayqxD+0=; b=sQrcA7dXCi0INJUWG12bs7OecS
	kujaN1e9n8DzQ5ZdCMgHLTiPiHL1AdyqXIv1t8aem+NKIriaS1HBIT9/JghKt2+g+valHRGL3LeSA
	036DLUAMxT9DqXLSKyUED63YsHa2buZeW0Q29HaxxX/5K+DpZM8EfXqdX/W4QL1lo7Pa5aUOZwIHV
	HxiwuqAQyYzzXbQSv1uOKBr5XXqVBmRigJvYI+UrvSomwo/RAMiX+GCdooOn/pqkb5ULfifB1EadX
	dSRKVGh2haTFNrVoY5EzPpyIE4n+X6zaTOz6vrDBe3qIUbV0cjbFEscr5gi2ezjilmd/2aF6VJgAQ
	rC/oO8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzKhK-000000030uu-3bcA;
	Wed, 26 Aug 2026 20:58:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzKhH-000000030uY-3Ad0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 20:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6BSYdpEPt01McAnG4u8lln5Yld57nZzWrLhCayqxD+0=; b=Gk++gNb7sGZR1YerBxsUPWVOAv
	UOLsd1KSFlgVFGFo/4Dm7AT9R5ueV3ELForjXbWCOik5M3t7GhBzcbhrDpk6H5obJIo838smYoKG9
	390FgaW/u4wyOhISwb+DP4JolTFF9jLWkY8P5JQLIqmEqKIli3ytdmFt7jXYDAAzgGfQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wzKgm-001Zg2-1Q; Wed, 26 Aug 2026 22:57:40 +0200
Date: Wed, 26 Aug 2026 22:57:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch,
	saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com, horms@kernel.org,
	magnus.karlsson@intel.com, sdf@fomichev.me, ast@kernel.org,
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
	guoren@kernel.org, dtatulea@nvidia.com, witu@nvidia.com,
	martin.lau@kernel.org, yoong.siang.song@intel.com,
	intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, leon@kernel.org
Subject: Re: [PATCH net v3 3/3] net: stmmac: document oversized AF_XDP frame
 handling
Message-ID: <0c17200b-105b-463a-8677-45f575c294f0@lunn.ch>
References: <20260819160535.1472459-1-sdf@fomichev.me>
 <20260819160535.1472459-4-sdf@fomichev.me>
 <aoceSoSFMx69Z9up@boxer>
 <aoeoJ6-njBxcWs4w@devvm7509.cco0.facebook.com>
 <aogpDsa8hz6CPpD3@boxer>
 <aoiIarzdjk92RkCN@devvm7509.cco0.facebook.com>
 <20260824111443.34bffe04@kernel.org>
 <dc2ccb14-c7c0-402b-93b3-afba52df78fa@bootlin.com>
 <20260826132043.39fb435a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132043.39fb435a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_135812_342568_F9DE2D93 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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

> Also if you try running driver ksfts - please keep us posted on what
> the blockers are. I _think_ we just need to teach ksft to cross compile
> C binaries?

It would be nice to make it not give out 1000s of warnings on 32 bit
builds. At least that is my experience doing a native ARM 32 bit
build.

	Andrew

