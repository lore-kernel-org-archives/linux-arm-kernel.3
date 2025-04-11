Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C81C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2VBF7U4OK/J1GiID9ysJnlk4eVCjr2LApspWyWukyo=; b=iwmiYItegUs5Y77xYsKxzfNPav
	cO9FioMNyki1tSR/6zcwkjYr/nGPlnVqW4LfeunouRTprQL1ao+VggCSxhuqZtHFnB8iIieRxDxKj
	uS9gxcb9ZOIdXLC8EVoewQlLgvirYm95CgVNs0gFKMTwMQNOBkstv9xvdxDs1WBGYNX2gbstYBe9Q
	AMlNmdFSyOJVbhHOBFrPwGQkRWo5F4y7SEd5x86bDNeTn/y7WZvMeIq1Eoo8Kjv44EYNCd1pvyBIK
	lFvGTBiqJJtCotwhi/jTw2Yj0/EBJ2+vrNZsnIsztxkb1IC6rmQC0aj2dtusp9SFmeeYRT97Xzozi
	CFeux7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HG4-0000000EMg0-44dS;
	Fri, 11 Apr 2025 16:29:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HDn-0000000EME9-3H1N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 16:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD0E268468;
	Fri, 11 Apr 2025 16:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B78C4CEE8;
	Fri, 11 Apr 2025 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744388834;
	bh=DzmZ98UHOcBa/uDcZVOeIvJFc1PO8euYkm5Q5FQwIOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjurHYzZOQN4uXaLNZNK8RjGupHq3dHjtJ+hzR3/aZ4DOEn7KHKOeXl+L2Lbotkwr
	 9TXYlia3Fy88adO9DQCwSa5bIEoon7tKKpAihh6MVe/jYjsd9mk5aufUgb0bTY9MuG
	 2W3njw3FD2CMrJG16WcPZOdbYddag5vUVNsFwWn6SLY1wKT+93K5kZ+J7OxSUelHsf
	 4odvMCcQ5WXabNegXRZDJuu53hCQAIKnJJ6k4sQ4JWSe5UvuIokMtZedbzM5NV3xJ6
	 nqmd0n9mBEyeM+NqvYR6IuadjG5/s+A0oCPoKCpWVTn5z9G8FijAsMelN6MMHCr6Fo
	 ACNVIagXKA95g==
Date: Fri, 11 Apr 2025 17:27:08 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Tien Sung Ang <tien.sung.ang@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next v3 1/2] net: stmmac: Refactor VLAN implementation
Message-ID: <20250411162708.GL395307@horms.kernel.org>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-2-boon.khai.ng@altera.com>
 <20250410161912.0000168a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410161912.0000168a@gmail.com>
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

On Thu, Apr 10, 2025 at 04:19:12PM +0800, Furong Xu wrote:
> On Tue,  8 Apr 2025 16:13:53 +0800, Boon Khai Ng <boon.khai.ng@altera.com> wrote:
> 
> > Refactor VLAN implementation by moving common code for DWMAC4 and
> > DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> > DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> > for the VLAN ID and VLAN VALID bit field.
> > 
> > Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
> >  drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  40 ---
> >  .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 295 +-----------------
> >  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  13 -
> >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  87 ------
> >  drivers/net/ethernet/stmicro/stmmac/hwif.c    |   8 +
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  61 ++--
> >  .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 294 +++++++++++++++++
> >  .../net/ethernet/stmicro/stmmac/stmmac_vlan.h |  63 ++++
> >  10 files changed, 401 insertions(+), 463 deletions(-)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h
> > 
> [...]
> > +static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> > +			     __le16 perfect_match, bool is_double)
> > +{
> > +	void __iomem *ioaddr = hw->pcsr;
> > +	u32 value;
> > +
> > +	writel(hash, ioaddr + VLAN_HASH_TABLE);
> > +
> > +	value = readl(ioaddr + VLAN_TAG);
> > +
> > +	if (hash) {
> > +		value |= VLAN_VTHM | VLAN_ETV;
> > +		if (is_double) {
> > +			value |= VLAN_EDVLP;
> > +			value |= VLAN_ESVL;
> > +			value |= VLAN_DOVLTC;
> 
> I can confirm that 802.1ad (QinQ) has been broken on stmmac for years,
> and it will be so nice if this refactoring includes some fixes for QinQ

FWIIW, please be sure that fixes are separate patches from refactoring.

