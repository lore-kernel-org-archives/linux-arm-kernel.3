Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A452C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 20:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqFpRE1TaLcYQTYUmiej5bLJgJn3ouN/OqeUA5dEOaw=; b=3IZ2LyX19ThyLUZD2JuX3E869+
	G7ln5AjU+GYnV68UOGPBNokmr+pN1ZQo/RV+TGsVJ3fi1y6c8Y3t9XOmusuIoc0yVvrXK+geZeUPV
	SkcD4hSeS0SDqSsXAICdqZOLALWlQMCeirrXDwrYwwGMiUbq3G1I0GLS0pn7GbQQvsERihGcgXoYN
	OrIges7J/wgqAhUBTCjAT6KpqXmcJ0Ke6z8dDRP61ERC0knM0JjeOx9qywzPzbJGPHHiqPoQ/hFAa
	B0FiDHIAXbGseDBl+qDltvHUmKH7xR2/boj/8cFuJqHIV5312aY8tP4NlxoAGSHRsD2+2trBelm/P
	J0G0B+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wootr-00000006FRC-3nx3;
	Tue, 28 Jul 2026 20:59:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wootj-00000006FMY-2hgX;
	Tue, 28 Jul 2026 20:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yqFpRE1TaLcYQTYUmiej5bLJgJn3ouN/OqeUA5dEOaw=; b=J4rTOcH7idYaNPYf9IxBN9iBK1
	+pgSZX/JVqtfpxFdxcrnlkdTajLxcpWhUJTqpSdas8gQukLcT1Fh6EY8YRpiSEvXYz91uFzXI7DX1
	93tHrRWfSU80vrl/md7l3WXvPqVHeZUQBaydmyLI9tyBSsI6v46mNngkXDaDaBjX1c2E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wootT-00EhMm-LT; Tue, 28 Jul 2026 22:59:19 +0200
Date: Tue, 28 Jul 2026 22:59:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/3] net: dsa: mt7530: error out on failed reads in
 ATC/VTCR command polling
Message-ID: <0c740a09-fd5f-4ca3-b940-9e034519304c@lunn.ch>
References: <cover.1785213071.git.daniel@makrotopia.org>
 <eea1d8f15c54375b3770c23e09fb3217df487169.1785213071.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eea1d8f15c54375b3770c23e09fb3217df487169.1785213071.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_135935_686616_04E5CC79 
X-CRM114-Status: GOOD (  11.91  )
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

On Tue, Jul 28, 2026 at 05:52:21AM +0100, Daniel Golle wrote:
> mt7530_fdb_cmd() and mt7530_vlan_cmd() poll the command register
> through a helper which returns 0 when the underlying read fails. A
> failed bus transaction thus clears ATC_BUSY/VTCR_BUSY and is treated
> as successful command completion, and the subsequent ATC_INVALID and
> VTCR_INVALID checks are defeated the same way.
> 
> Poll using regmap_read_poll_timeout(), which stops on read errors and
> propagates them, and check the completion status read as well. Take
> the MDIO bus lock across the sequence as the switch regmap is set up
> with locking disabled.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

