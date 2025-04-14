Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A1C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 19:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Q1p3SoV9fj9HQbqaNCm0CDhPwNjm8pWMFbjGasjMes=; b=aFGjkogPlz/c3YCNeu0C3h3Dgr
	bNF48E4JiAtphT1t0E/eQlJUDSsOrS5BX0mLWYbLl7ZWON4N/sbv9jZyRlp0/nbIsfzCP1zH28+ja
	JbqSlRGY/fA+DAq6yKMVSJIM0TSPVL4kYTS7jkCFhWd4kE4KvV8xXqAeXk8RCpO9fr6n6FRAfpQvs
	EItl4iqbgOi5UPB4BKGkE+TLYhQLPAvrGa5o7cp+XqVoJB8KuGdVFDMAb4vTn+UsUM2fSsHwvSscS
	5ltxOMB57LYUSUTTTiWB9LHWJ4VZJGDLT2hr1Y5RzXjetvKotPvlXKz+uw8S39A0n5Xnpu7QEVbZC
	uHOp5eNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PCl-00000003EV8-16lK;
	Mon, 14 Apr 2025 19:10:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ocs-000000037Qa-0af0;
	Mon, 14 Apr 2025 18:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6Q1p3SoV9fj9HQbqaNCm0CDhPwNjm8pWMFbjGasjMes=; b=yBqLlOBv3qyaA7CLZ4BZMWHM6t
	NzdK8UQt7WEVrI8DSvBtHl3QK/tWZJPuKoFK9hbzx4pDhEU6Ey4dObR5j1wWRxQOIIOh0LcYtD9QP
	gDCzqX2MzratlnYF8yOk+zp5ODLN8t18YdZNEGioy/r+IvsffSk7LzLYsBhwhqS7KR9w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4Ocb-009FfA-H7; Mon, 14 Apr 2025 20:33:29 +0200
Date: Mon, 14 Apr 2025 20:33:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Bo-Cun Chen <bc-bocun.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 5/5] net: ethernet: mtk_eth_soc: convert cap_bit in
 mtk_eth_muxc struct to u64
Message-ID: <7d990c0a-c9d3-4d07-bae7-70e4438fd6a2@lunn.ch>
References: <08498e31e830cf0ee1ceb4fc1313d5c528a69150.1744654076.git.daniel@makrotopia.org>
 <dde46bff10fc0ac5e7c6facd1bab018b147356d9.1744654076.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dde46bff10fc0ac5e7c6facd1bab018b147356d9.1744654076.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_113346_177238_1EA4A884 
X-CRM114-Status: UNSURE (   9.32  )
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

On Mon, Apr 14, 2025 at 07:12:53PM +0100, Daniel Golle wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> Wihtout this patch, the mtk_eth_mux_setup() function may not correctly
> search the Mux.

This commit message is not particularly good, especially for a Fixes:
patch. Please could you expand it.


    Andrew

---
pw-bot: cr

