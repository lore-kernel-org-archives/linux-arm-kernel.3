Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686A2D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOeDZ2TXBFfx3bPj/EsWbj23uHO8mEbz9SFRHsOW8l8=; b=2mquBK+AfOcUaxTt4khsnRYiN9
	XFaV5sQyYDSDS45WnA9IEK5L8VhRTHvzLm/2CWjxLQeAGFsK03HDtj9OX+H21FYkWXmE7pIt2nCVo
	8AR6dO85JtKzysnItHXWtVjVy/xh9rjIuHWyqrfz5WrXdt8WDe9aTfz4xrL4DcErD+gqbvEjw6Kxp
	JVd+M/LbGBDBmZsmIm9apMJavPZNnXTL7t4wSyWGnxHFiwFHr894WEvvoRx61IDNv4m2ouLrWA5J4
	UvJN7MJvlFb8kJ6dxuUxDYlLowRhz4ifEQWK4IfB0w9NMZ0d5FReugS0IBR6PWZVHxeKihRHB/+ii
	iTfCIflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SkL-0000000BVpG-43Ga;
	Mon, 28 Oct 2024 16:37:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SDH-0000000BPU0-2PGx;
	Mon, 28 Oct 2024 16:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730131405;
	bh=UAtXx8qAoDQ9W+4K7wOWE4RA1ILQKmo8M8HZpFnFRl4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=LnDS4jMoeFC0t2aQWoYE+GGV+R+znjtyR+I4fqlUdFzXDENxMbydGAO+2AYQ6JujI
	 Nrus3ld2aPMBWrL5IK+hiwv9Tnf+UHNun5BVByxU/cV+zj0JHd0Hw+j9vvSTrxXdpT
	 d2OpMK9x5FqyOO43J5pNqMvU76QPmJPNVnHEWVlfvD5vjgwMzGoj5CxXAyAw8KqGG8
	 dH2YpEjOQA6U6uk1o8H1U8pU6CiS27rQp8orw6Y5FsVx1PmRQl+mpNz/h5l/vmGvAu
	 MiiioBuJJugeblyO4DOgrLb4dM9hYf4Me0vc8rapDwJf+qj6lFA7V7oEdt7pAo5Dka
	 KOIOWXVeIi8hA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 95C2517E3662;
	Mon, 28 Oct 2024 17:03:24 +0100 (CET)
Message-ID: <45d10ac1-6c00-47a2-8024-ab97ebe6a6bc@collabora.com>
Date: Mon, 28 Oct 2024 17:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: mtk_wed: fix path of MT7988 WO
 firmware
To: Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Sujuan Chen <sujuan.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>
References: <Zxz0GWTR5X5LdWPe@pidgin.makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <Zxz0GWTR5X5LdWPe@pidgin.makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_090327_901116_E759F20B 
X-CRM114-Status: UNSURE (   8.54  )
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

Il 26/10/24 15:52, Daniel Golle ha scritto:
> linux-firmware commit 808cba84 ("mtk_wed: add firmware for mt7988
> Wireless Ethernet Dispatcher") added mt7988_wo_{0,1}.bin in the
> 'mediatek/mt7988' directory while driver current expects the files in
> the 'mediatek' directory.
> 
> Change path in the driver header now that the firmware has been added.
> 
> Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



