Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C75BD5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg87C69KDoANHttxY5/rYmwSNvXQD1N6oOe5W7TAlAI=; b=bnribvIpubqCXX/dLVdsVRf/tI
	KoQxNYnsm7QqzvSxAFMKKvHnL4LlzLRLgYyUOFWz5ajCLFbuCUUQ9K02wnVu2u6aCR92W/xWogcyi
	8wFAcBaWmzgoRsf/qCVxZbDkvOhEvaAV5yWSmxO7M8bHWInuZWgIT/xh1XPpP5T8bYBkZcjkBJJlB
	5qdCM1AxMX7vOuqwxvAfM5bElb11/DI0NFyEZD+c6t1tBXUW47h6iqoGGsB/RDjMKt8CR6rPf5OaB
	IQfjF1gOlUIZ7An0tTrYlpm/lTcKtab0g/loDYHM37R4hTgmizKScmjIpchlb5Et7ZQVuWQz3b+uA
	aT7fUEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUpCB-00000002bIJ-0BoR;
	Sun, 14 Dec 2025 16:43:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUpC8-00000002bHg-3LQD;
	Sun, 14 Dec 2025 16:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Pg87C69KDoANHttxY5/rYmwSNvXQD1N6oOe5W7TAlAI=; b=OH22I2afa/RvDGRyP4pUNGZexE
	s3zZ09oxoSnT2SMGDFZwpgX7vgx+7Osdl4DtoZqAYXTwpaZTLBXFLRgMBJpVp5GqhZAciNWMJLptG
	OmtC9f9y8GFogObl0EPK/8EdOtttGgE5HO18j2oUE8pgEVWo4gUMDMVgr230kxbfKwKE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vUpBg-00Gvjt-F5; Sun, 14 Dec 2025 17:43:12 +0100
Date: Sun, 14 Dec 2025 17:43:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mason Chang <mason-cw.chang@mediatek.com>
Subject: Re: [RFC net-next v3 2/3] net: ethernet: mtk_eth_soc: Add RSS support
Message-ID: <cbe399db-11b9-4176-b842-a50956df7d26@lunn.ch>
References: <20251214110310.7009-1-linux@fw-web.de>
 <20251214110310.7009-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214110310.7009-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_084340_858845_EBAF4EFD 
X-CRM114-Status: UNSURE (   6.24  )
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

>  bpi-r4.its                                  |  16 +-

I don't think this file belongs in this patch?

> +#define MTK_RX_RSS_NUM			(eth->soc->rss_num)
> +#define MTK_RSS_HASH_KEY_DW(x)		(reg_map->pdma.rss_glo_cfg + 0x20 +	\
> +					 ((x) * 0x4))
> +#define MTK_RSS_INDR_TABLE_DW(x)	(reg_map->pdma.rss_glo_cfg + 0x50 +	\
> +					 ((x) * 0x4))

It is bad practice for a macro to access things not passed to it. At
minimum, pass eth & reg_map to the macro.

    Andrew

---
pw-bot: cr

