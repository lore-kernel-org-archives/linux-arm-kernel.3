Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE81C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvX1FkkZsJf9Lb7HwxTn2b2PE4IwhR2wqCju/NgIX8c=; b=CrY8V1cpYmcy8ioUn23anTz+Zx
	qZ21Pk6oitJpTSWavLjHI6pPhaCWiJfdh7WiBZlXMprjXkHo5rXz0w5BWaIIkLZXR9vN6yVzZHYSu
	4sARBC/T2vXb2j7SGOA93/P3/L/MfbnlWELy0udAEKkk+8xpLNeYwo6OlXVSovZYAGR45jy9kYUbJ
	MlNtLz5d9SZegZWn67x82xTv00aPigZanekOnQ9wYekkwiKYjPDsqxhNnwY5rp3tVoAmpkjDFoyyb
	UNekhnfX20tCB7ZjTFv072DfliPCAaCNtWJl2yefsynut42V8QWw1TydtpiRt6QF5YPH0aUC41pcV
	tQX1GlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jat-00000008MBs-26RZ;
	Tue, 22 Apr 2025 19:47:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7H0L-00000007zBH-4BjM;
	Tue, 22 Apr 2025 17:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BADC61129;
	Tue, 22 Apr 2025 17:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4254BC4CEE9;
	Tue, 22 Apr 2025 17:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745341313;
	bh=fWsF0GzHzlvgBL9N9CUgvfUgXQvfItKvtkOWsRSc+bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rss73jhJ0CKIlbRiAaKJHj2//3AaDHJ5IrR8Cd9T7hfaNA1GdgiAIjGp3HUSxWCzb
	 cU2MzG7R0obgILiH3ftg3wxow0dUQS46vFM2fJlQV58NX62gd8SJ0xMvf1re77cXaD
	 3hDzfuPEPSGbXtSYKrGBbJWJFBgWGoW25TvJ4TTbzyYnt3B6qBk/Z/F8NHPkvuq1fi
	 o+JDmN9LrYL6prgG0bW6Dpu7mForovlR48291c/KA1MKQU6Db3ruymz5nNTbi2VSBP
	 /Y/hB+v3PcivBpFx9cXGZPasqJeLNkodMel4JPc164ryHsKoYMklIuDJjgHqlLmMhq
	 ev2eOWEeTzzag==
Date: Tue, 22 Apr 2025 18:01:48 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3] net: ethernet: mtk_eth_soc: net: revise NETSYSv3
 hardware  configuration
Message-ID: <20250422170148.GK2843373@horms.kernel.org>
References: <b71f8fd9d4bb69c646c4d558f9331dd965068606.1744907886.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b71f8fd9d4bb69c646c4d558f9331dd965068606.1744907886.git.daniel@makrotopia.org>
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

On Thu, Apr 17, 2025 at 05:41:07PM +0100, Daniel Golle wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> Change hardware configuration for the NETSYSv3.
>  - Enable PSE dummy page mechanism for the GDM1/2/3
>  - Enable PSE drop mechanism when the WDMA Rx ring full
>  - Enable PSE no-drop mechanism for packets from the WDMA Tx
>  - Correct PSE free drop threshold
>  - Correct PSE CDMA high threshold
> 
> Fixes: 1953f134a1a8b ("net: ethernet: mtk_eth_soc: add NETSYS_V3 version support")
> Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

I agree that this addresses the review of v2.
And otherwise looks good to me too.

Reviewed-by: Simon Horman <horms@kernel.org>

