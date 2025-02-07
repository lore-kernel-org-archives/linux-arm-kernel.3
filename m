Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55183C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q07+0sWsjfRrPwe10nk7Hyp5HKfjtydEgr35TwjuA2Y=; b=GOwk8PiaMAbZLcKeHJ6ke1djNn
	ffyBMoQ3UHadSllWX54Frj815VVWzckBKGTDj3GuJ8XCR8v/reS3zrou+1KyH+1nmUc9TzevIkYPb
	0Q6I8Bt2Q3Pywma79lQhwLxwESPn6eHR27JO2OsdaoE9iti745ep753eZf79CQjJe8KU0iS2zvsLb
	SY+XIGUW8FkUbi2i1c/09aDVbyHT9ACwoCkOtkPmEBE2845eC95NwqU0QEHwG0XAwbZKkEl68YbdN
	h2+KN49V4z/5GpFuJXN4JBBd9I4NFNanxbhbaYPjjoOZsGTvxhuotK0LTP2EhdL07sf6AXK596iU9
	gPdehHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL33-0000000971G-0BtF;
	Fri, 07 Feb 2025 09:53:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL1f-000000096pu-1ckb;
	Fri, 07 Feb 2025 09:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AE955C273B;
	Fri,  7 Feb 2025 09:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7713CC4CED1;
	Fri,  7 Feb 2025 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738921914;
	bh=pGp9qmyuezgS3IHcjWS1ZLSejdTrShrKN2qIfrysIzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBBuhvBr4yJ59FMW5bgFBDQz6RpDE9LmaYDwu20N5kZRPUKW8HAgyQvKKHX/edC6O
	 lKP+TlJni+ZFh9y+8xRARleZbWjY1sHQzgmED/NPyZ+6FNSWSC+9z+zbfrTCTBmcrt
	 GgWybv88IJEBO/XF2swByM/A8YWmRh5JRWkc+8j+OBz1SiDpsk1VAWDfSVZrISbv7g
	 Z6U0hsgBcUBdh2c887D2NHOBnwC9fo4OX/x/RDDihl272pLVGvgHawMAGwg3x0EXC2
	 NIu58nAMAEhEFAZf5OlgoQXx5PwriWdaPCwxZfQAHyefPxaVL7W0VMvUrQeqdcK6YE
	 1ouXbHCZS7e8A==
Date: Fri, 7 Feb 2025 09:51:49 +0000
From: Simon Horman <horms@kernel.org>
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
Subject: Re: [PATCH net-next v2 4/7] net: ethernet: mtk-star-emac: Use
 of_get_available_child_by_name()
Message-ID: <20250207095149.GF554665@kernel.org>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
 <20250205124235.53285-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205124235.53285-5-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_015155_467190_98D34920 
X-CRM114-Status: UNSURE (   8.18  )
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

On Wed, Feb 05, 2025 at 12:42:24PM +0000, Biju Das wrote:
> Use the helper of_get_available_child_by_name() to simplify
> mtk_star_mdio_init().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  *  Dropped using _free()

Reviewed-by: Simon Horman <horms@kernel.org>


