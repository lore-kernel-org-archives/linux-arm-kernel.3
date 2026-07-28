Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE62C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 20:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pPCJpmxouqYb2+iO4LLS66Umd/QQeZr0uempkZHs5Y=; b=ColUO/PAW1rmYzyRQw7KjN1xAx
	dZkiNcQOnaeKTLmDj0KpKL8Sc6NNMvB3IqbdjCkjKitVFGXiqSHoaCXeDAn6OfMWdwfhPgzoblu06
	7vmjBvbJFYQc4lXsBibN36eKuOqp80YkKmmXxWfFJ+aP0lQxBKnbsJK2V5hVoH56GZEmuY4QYCvgW
	icy+m4jto8cTGDLbCq3Wy2rwepdSuBF6GyCDbg6DtUieln7Cr0Gm9Pc0XF0LeM9vscVvPocwc+I2W
	ZEgxCGLxp7P74nh0y6SAtJSIRdN6+4tzxh6jZ7+cQmp1wnDR4jyNnPVJtxJVcQWrTo4BAIZggVXF/
	HpErUOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woorm-00000006F3I-0B6M;
	Tue, 28 Jul 2026 20:57:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woorj-00000006F2o-1DqP;
	Tue, 28 Jul 2026 20:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7pPCJpmxouqYb2+iO4LLS66Umd/QQeZr0uempkZHs5Y=; b=pl+pnjYYiKYC++aDrkiufkaS/F
	USyFANcNKazsHm1WMrEYn5mO7oKjGKBcNjVRUqNhd+SwqLrchSAaulh1Uibhbz9O8qAobeCdiZE2l
	vQLAmQ831jly0vEkuK+ZkOV8MBPHKluBiOJqT59AUYcEGhpPQPk4QxeiewK7jqG1Rpak=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1woorP-00EhKZ-F9; Tue, 28 Jul 2026 22:57:11 +0200
Date: Tue, 28 Jul 2026 22:57:11 +0200
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
Subject: Re: [PATCH net 1/3] net: dsa: mt7530: check bus->read() errors in
 the MDIO regmap backend
Message-ID: <c2ad091c-e594-436d-a245-9b3abf17de94@lunn.ch>
References: <cover.1785213071.git.daniel@makrotopia.org>
 <3c628e48276c2e5522c8795a6be60d11c7a76a7d.1785213071.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c628e48276c2e5522c8795a6be60d11c7a76a7d.1785213071.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_135731_336933_85CCC1CE 
X-CRM114-Status: GOOD (  11.73  )
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

On Tue, Jul 28, 2026 at 05:52:14AM +0100, Daniel Golle wrote:
> bus->read() returns a negative errno on failure, but
> mt7530_regmap_read() assigns it to a u16, truncating e.g. -ETIMEDOUT
> into 0xff92, and returns success. The garbage word is then consumed as
> register data, and read-modify-write cycles write it back to the
> switch. Check both reads and propagate their errors.
> 
> The same defect existed in mt7530_mii_read() since the driver was
> introduced and moved into the regmap backend unchanged.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

