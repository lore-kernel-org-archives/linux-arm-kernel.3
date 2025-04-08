Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA46BC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gfwchwxJDdgDcSoZFTokynG6UUosgKT0k4GbNON5KM=; b=ITusRnmQ7px1dPcpS7Vck5RI3x
	c757+YEzbTf/d7jyAF0ppvFv+638QF6RX3CEAYBhhG9Ti/WtYM9K2ns4OlPdvo+uboIkb+6vVuKT9
	U7Lr4nu+md91TtXwrVl9Iw76wkW0zBdzsHrrBzmfKqAlj4mKhtur6qZ+lFXKeP+2og5Hi4euQFDdM
	vPKM/rxpxC0C2ZN0OiZBwQn1F8qAEPY4q7FtKOhQkHo1UgpEEYkDNhJb29HNK+72JBkfz2pH+Z8Ix
	TeTCcK+O3+sshSAs7ulyEmAqnmu3YkRUk6lRsnHSR9NUTKvjlTRvGnOF2YdGjzkd/AG6v6LPtuvLT
	KPVCW5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EGb-00000005C02-0egi;
	Tue, 08 Apr 2025 19:05:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E93-00000005Asp-3vzd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 18:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0gfwchwxJDdgDcSoZFTokynG6UUosgKT0k4GbNON5KM=; b=jfSHCAjjj3dPKIv4wogzDGe1uz
	MKEBuA48louN1K1znRakqnVdIHpK7fm2dK4fcOHXvLzVVsEEYCwyd3AbUddmRO7L3foNIiCOwFtV3
	v5rnLeu6iE3CdUx+rrbrjzSMAq91POj/9S1zSZ+mxppcvnxrsK7SfW+HiKCm1JOO3oGnd8WftWTHp
	dGp/iWyeviGHqpj5BPE2TMsyrqXCvCy6Y7I9+6YyTpfxZzxapV3PYvRn2IgKN9sWHc33ee8Rkt+u9
	1oRbmKtQBaHzSb67ceFruCW5qhxWcjYtnqcAIcPdVNtonYDDAsmRFXKTgyMo9c8fdSPvKtPZmxWU2
	MkNmhmPQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2E91-00000008OyP-0TME
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0gfwchwxJDdgDcSoZFTokynG6UUosgKT0k4GbNON5KM=; b=a4KBoK7dPs4hT8znWpfHyHI+Bd
	vP+De4SHKeYDGD24EIpO457Yg3dXKvCStm4aST1IgdAai4ChDgfJ1Pvqr+eiwR6RWfT5etV/cKpgW
	74J7FTnWxkGTooY8ReJTdSK6B0Ed3nz4LHq/dFybXcnMDHpMoLkUjqpK9ZOyNp1NCgvo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2E8x-008RIb-6g; Tue, 08 Apr 2025 20:57:55 +0200
Date: Tue, 8 Apr 2025 20:57:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next 4/5] net: stmmac: remove eee_usecs_rate
Message-ID: <b1cb1b0d-03a1-4ffe-935a-c179e722e528@lunn.ch>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
 <E1u1rgY-0013gv-CL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u1rgY-0013gv-CL@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_195759_284161_ECBC2B7F 
X-CRM114-Status: UNSURE (   6.99  )
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

On Mon, Apr 07, 2025 at 07:59:06PM +0100, Russell King (Oracle) wrote:
> plat_dat->eee_users_rate is now unused, so remove this member.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

