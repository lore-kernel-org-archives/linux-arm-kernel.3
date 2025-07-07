Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9451C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWbMK9QfrRA7cmLniY35I1CU+hmcyS8uuTu60MCcl10=; b=cw/JCirLoV5sHx/cG2t3BGL+MN
	nTdoX4dkmPiF4/DhvQ/fgB8SEGcY6cFtOHwHRkaD3xKeA3Ss26QIFSzGmPIHr2fAHjPbfqHNEgwMQ
	toXaGy298pJHgf6wL5I5BAw7fkWD7gFeAQm85NvjhptZjJ/UTU6BydDI3EaD5Trlv1ux8fgqiiZgz
	aByXWxE2xu09tUIGAFL3fvpx88QJcHQVsvd+QGPL1ylHIoHZdFrmOdag5RIGfzjSN8CpDpqb+hmQg
	qLrIzXMKpR7W/egA41zoOhw8Dyzfr6VZG1ZJMO/aGcK9NSsimH0dyC9JJibSvqekIeak0WurhfuYM
	yl3r82UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfOq-00000001YgN-0M5x;
	Mon, 07 Jul 2025 06:32:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfJj-00000001YCk-0qfX;
	Mon, 07 Jul 2025 06:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF6696112D;
	Mon,  7 Jul 2025 06:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C59C4CEE3;
	Mon,  7 Jul 2025 06:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869625;
	bh=qgpJwWOs4lGsGZIewidOYHNqx+AL239trjUa1lpTRUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNAkyeJ7zXavwPMmFD8w9pyoJksQvP184yx/9M8iF3lhATTlCVeVNGRgOXsU8Sdbv
	 N6Zkgs2M9CTXrfNUeyxkINK/wUCY3KhVt3KobDInRDK8HYhGv44rXWe/P0Wp9h0bir
	 By0mGMzoVHtgFb90wU687PTZ6Ymg63cmc/jE73eSX/yufY8VFliVb0IKolI9pyVugc
	 vc3wu66xQZyrjF7mnoAPg6ejYFc0XnVzvni6Alfp3PHe+CuAIuNoAn9AD4RMtCH1ku
	 tJ9OHv+0r9IKtp3kRtpEGIkl0gdaM2/vTfBJTbFSQrrvp04+MS0K2cPp/ug0Eyfy7N
	 50QStbyls68bw==
Date: Mon, 7 Jul 2025 08:27:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, Frank Wunderlich <frank-w@public-files.de>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 01/16] dt-bindings: net: mediatek,net: update mac
 subnode pattern for mt7988
Message-ID: <20250707-pastel-psychedelic-piculet-b5af11@krzk-bin>
References: <20250706132213.20412-1-linux@fw-web.de>
 <20250706132213.20412-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706132213.20412-2-linux@fw-web.de>
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

On Sun, Jul 06, 2025 at 03:21:56PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> MT7888 have 3 Macs and so its nodes have names from mac0 - mac2. Update
> pattern to fix this.
> 
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


