Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C9ED13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmZaLE9XvI9dpkvVQvi7x60BahLiFUgqkdEFP+DGqec=; b=hPc9HnQOSE+q3d4KJGk+zaWKVM
	JExyF1QBwUeQbPOyrkUguNw5x6U+gwJ15+7r3shf3pPb/TMqzMTGCsBc0372rTCd2/NCOeKZ0LVVF
	kxJox6IIGT565LusCUlKRTQAe+0WpLbi1FVZjVFK1533O2MQyE/ZLwgR3pNQ9nLk/nt/hdFtV8cYj
	fbcAx4ohYwc5uO8MBPF/2g4cDRgvzpCRBLhkl78wwu57NmMTdBEu0VsXy20XdUUAZSoY0vheQ5F6i
	4EHTxeqE6QTAhfId3mWupvkkCz5nmuBfIoPcmVaJzsML9TDhyJx49PtI6v3aALQR/1dGS+q92Xqis
	0elgNe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lo7-0000000ABye-03us;
	Mon, 28 Oct 2024 09:13:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lkw-0000000ABRj-3Pj9;
	Mon, 28 Oct 2024 09:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730106584;
	bh=RrNX39g0rq7db1nKULH9Y0fs1HbOSJyWDZQmvN0UvUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RKR/8iU/wJEYI+J7N2dtM+s3eZv9jXzERl6VnGrqD2JLPag3hI38s+ANtc8V4AO/q
	 KtNVbFvzDonr/uSGfZ8tEZ4DaorTLxuInXyEN8+ePSVlrD/0WrFBO1dIl/ogw/ttJk
	 TlPmJ/xGGQLN73dfr6qUfzzaaserKqYijfCg/i1qlGFtp/Fu4ujd2kbBx+oKgvExqr
	 vn4t7k3XsoGSMsYq0YwxgEfIMnZM3P1TXlIDB+LUeS7l2pbAenJ/YJvJ8drnYZAwjn
	 8LcST6h1j8q9Xhp+9xdq4j8+M95MnlF/WTi0UtYAH0XzMkz70eq0DPouBD8xVUPYqt
	 SIrU8ttRCtE8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0908817E1134;
	Mon, 28 Oct 2024 10:09:43 +0100 (CET)
Message-ID: <9c83ea27-1221-4920-920e-9e7876ceaf90@collabora.com>
Date: Mon, 28 Oct 2024 10:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek: Fix child node refcount handling in
 early exit
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
 <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_020947_037860_7E650AC1 
X-CRM114-Status: UNSURE (   7.95  )
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

Il 11/10/24 21:21, Javier Carrasco ha scritto:
> Early exits (goto, break, return) from for_each_child_of_node() required
> an explicit call to of_node_put(), which was not introduced with the
> break if cnt == MAX_CRTC.
> 
> Add the missing of_node_put() before the break.
> 
> Cc: stable@vger.kernel.org
> Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



