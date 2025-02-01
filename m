Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1262C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXottbKrzMtxg7raCfDXdUUAenpabP+oslp6hK4XRyA=; b=tmWWKLmFFamy58yi+ofSgD61ed
	vZtyIbY4THaZ14X1L7MIZE+SwmSsKFFtod6ohrJtCJuT/s8cDcgVRhR6QaRYCPti1cu9U3gXXyW24
	Ptw1QdwFOTo94hALhlIsyD59vJgazoVw29SjbxH2J1+aC+dfXOkAlspxUDbwfJD+xJ+IGWP2oBSYb
	PgyYo2lv5fbLcbOlmV4ePYHo0ibyUgDjPyhTOtN2ZYOvtfbEST4ecO3uDP/Sl932j4ZuYb2zMpamP
	jBcCsKyA7yJE7KACw9MZFei/S+B/d9WrTBxDq/wtFQ5WOuutu3OflzXpKc7i24aXh70GQqWa62agM
	ZAStRNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teIgd-0000000D225-4Bqc;
	Sat, 01 Feb 2025 18:57:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teIeh-0000000D1u2-3aMN;
	Sat, 01 Feb 2025 18:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hXottbKrzMtxg7raCfDXdUUAenpabP+oslp6hK4XRyA=; b=CsDUTUmUU7xfLO1MF1r4UnhbVS
	/+BYdqqVd7ZpFKVZWsHBYN+JNYhOQBKDIDUlUd6eFHCj+Ik4NaxbulnQ+1qREUvEvgR8o7hg6ZaAz
	bpKX3NN9old/Qq7xEbhlA0MWhq259gJljgSainpnvEhBt4wZ0+h25ewONiAaeVlrP9yE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1teIeW-00A2aY-Au; Sat, 01 Feb 2025 19:55:36 +0100
Date: Sat, 1 Feb 2025 19:55:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: Use
 of_get_available_child_by_name()
Message-ID: <3e7538bb-6877-4dff-9cab-5a398884d34f@lunn.ch>
References: <20250201172258.56148-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201172258.56148-1-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_105547_890090_A060B40E 
X-CRM114-Status: UNSURE (   4.71  )
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

> +	struct device_node *mii_np _free(device_node) =
> +		of_get_available_child_by_name(eth->dev->of_node, "mdio-bus");

    Andrew

---
pw-bot: cr

