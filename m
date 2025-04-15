Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C24C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCsUjldb4db3iq2Cf3MidpG2bUQw4RzaBYc+Xse0Bc0=; b=AyjJxkOaTKZNQlFHhVVsWEnM93
	3zPXh0R58s0uk4gUp4Ktesmv33g7zrQslD4UCDmg+vrPpSQpnjabAycDtJYB/55G4H3bx3LRHsVrd
	5+gWBbnbvJzBWUsrZbmY+oXFO4Ycib64TYmNP9kt6IEaZTQ9sGn4VNJ1zXiO+JC6eIqwOgcOohvPQ
	B3RCkLWrh7rQ7NmHUsAkEe4N6wx9t19rcRTF6FOWj9FhfoKmbGis3yv+3huveLrVAlav3aRCUIZWu
	IWtBQS/9KE7ijsDqFuw9fSxOnODgSVOZFZVvkUou0hp4J6vR6TRrAoZ9EJjR4/za/Q9xoFsJutDus
	2PGCJB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fUG-00000005l4k-17Rp;
	Tue, 15 Apr 2025 12:34:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ebT-00000005ZkP-48zE;
	Tue, 15 Apr 2025 11:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744717042;
	bh=LL2E+u91dO99wB41wuqyXT2j19QaB9gNRGI2R7/b5YQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OIw6Wy9e+R7VZf18fWQAN7uWonzzfJXvfUPULmxni+zAEvAbUSPu4wFgV1x8Jo/YN
	 2KVmpk3L296/aMW+vmusHHvUCiqcInGNYexO+3bITYSFxCGwZR7Imge4ArE94dvKih
	 25NKYIeh0R6M+wXAv/fdnZ3IcFn/W4FQBrtWVy2ri4bbm42RPIt8dN2c5ZzbmkGz5c
	 U50PruUlqwudkueNNS1OZI+XqxqHoh5TMf0a1Sj/R7zopgf4NYYDKLD8zuk6DbJE9P
	 O+Lku6ssL0tg6mpKFuBIENzpjYgrX9NIOS/zKOK3cLwMzfZu/Bpm1laYEZRQeLotaH
	 tqtYa/LZCXtcg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B9AD17E03B6;
	Tue, 15 Apr 2025 13:37:21 +0200 (CEST)
Message-ID: <c648c4f3-f20a-4255-93eb-69a80c695fa7@collabora.com>
Date: Tue, 15 Apr 2025 13:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older
 controllers
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Hao Chang <ot_chhao.chang@mediatek.com>,
 Qingliang Li <qingliang.li@mediatek.com>
References: <20250415112339.2385454-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250415112339.2385454-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_043724_193567_6EF816E1 
X-CRM114-Status: UNSURE (   8.82  )
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

Il 15/04/25 13:23, Chen-Yu Tsai ha scritto:
> When EINT support for multiple addresses was introduced, the driver
> library for the older generations (pinctrl-mtk-common) was not fixed
> together. This resulted in invalid pointer accesses.
> 
> Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
> what is now expected by the mtk-eint library.
> 
> Reported-by: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn/
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


