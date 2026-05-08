Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C553CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 22:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGhV4tJhhFITtip7RIJj1HklpJJ78N/H5BhAF01FN7c=; b=kvLo8A0PC5Rt85SdAtd3QtaOoC
	RXrQsk7r1e3hOR1975qcSpujNKCOv2wubhEDjKKtJcB3a2vnvNS/Sd485OIOtQCmIMW4e11o/fJkJ
	5talYBl5aV7WzJDdoi1GeGauA0WD98JYsoMYNBiSX7UxtF1z2kjZvQLcYYserzaHGm4R+oA119oPE
	xFh5BBL71PlFHivDO5eWH+758C1rkisjliTYnsMDExJ+NQBhAxGftrgw1FxPdfJzRfk4wsjV8uS/S
	uKA/2NFi7sXp/mxTkBC5VTDt+CDjNU7e3oEgtWtkwX7QrvnheT7i46mwU2X89DvdQy80+iu+d0Tq4
	F84KMWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLTog-00000007ejV-3Pw7;
	Fri, 08 May 2026 22:37:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLTof-00000007ejA-0zX0;
	Fri, 08 May 2026 22:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 510256024D;
	Fri,  8 May 2026 22:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AB5C2BCB0;
	Fri,  8 May 2026 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778279824;
	bh=doWXpAV8i1KIsPVSpwySS7aiXUQtAtR9+ap1JLqiNmY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nXG85BpPsxRXtTy9vRquN4aUado99x7u/EAuFTgMICFe+wwITf2rfcVrYZgAwlYya
	 Mxy4a2RZCeIctfJAwSRe8W2bhDgn79oPsVSdbGG+Pygl/yXbYVRJ8gHhO6TaHl/4no
	 B9PgioG6LhM1bT4qyMVEUCU8FkaCHv9N959BnZLI903mRcw/uhTnM2YoGPrP7XYK4l
	 5dLH4A9DVNHAze0vKfR6FttTjSVFm/cfddtjE9p85vol/yodgVTNfqw2p6xNHX0btk
	 APfG6Y8z/NZzpVCZ5S1qtUXva0YGZUcXb1gix9GmLarkB/L6SFNKFx5+vFD1rCDKIl
	 fI643HKC3DtaQ==
Date: Fri, 8 May 2026 15:37:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Frank Wunderlich
 <frank-w@public-files.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mason Chang
 <mason-cw.chang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [net-next v7 3/3] net: ethernet: mtk_eth_soc: Add LRO support
Message-ID: <20260508153702.69b89021@kernel.org>
In-Reply-To: <20260506192806.143725-4-linux@fw-web.de>
References: <20260506192806.143725-1-linux@fw-web.de>
	<20260506192806.143725-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed,  6 May 2026 21:28:03 +0200 Frank Wunderlich wrote:
> - fix u32 vs. be32 reported by patchwork check

Have you tested this? I still see an extra sparse warning
(install sparse and build with make C=1)

It'd probably be good to fix the pre-exisiting warnings as the first
patch in the series while at it.
-- 
pw-bot: cr

