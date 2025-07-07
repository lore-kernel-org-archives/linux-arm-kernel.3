Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E19FC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRe9GZzGgR0ivgIssr0fKgerDSmSULCi3EW9ELnuqSo=; b=g1Dqr+sDZBXT/Hgn7GFFKoucAm
	EIranAukky9How9yJFi5M0n6Trl+ShL9/ymj1t4D6HEh1zbzrks75NiRuUX+n8HOqShspPTlMTxEc
	w9ln0z8wgOYLe+nluR6GWbEXnE5h2jqNExIoCgUabtUtQ5tSe68ANZ9dVZ7e9qKsNkNJxf1waGD+J
	KVOXRtTN8OdLTojN2iTa0B+kHGVeOz1EZrenQtbcHV1L7WQWtatGoePnMd8hZE6soJN0eJNPAT/MY
	prqin/d7NTeoX0AOQXUi7yPZX9O2y9ZT5g5HMtv8IkCMMAzMW/HzOdQVoYQNQQpXzxN5vZSaeKrS0
	YCzqRjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfTP-00000001Z1n-2sJA;
	Mon, 07 Jul 2025 06:37:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfQ4-00000001YmM-0QQt;
	Mon, 07 Jul 2025 06:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 250915C5837;
	Mon,  7 Jul 2025 06:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E327C4CEE3;
	Mon,  7 Jul 2025 06:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751870018;
	bh=h24qSJ8Oi8rLBWzEyRk9kWuH5HysbbgpfVyMwQU3sDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNVts38qKFiTktRXWRXh6+TlqSdyDKDvCa2/ImWYK0/XxpNZsykfGB7JAQ20u1kRV
	 5EP+uNwiFYIFBVDX8fo6U5cWii2AKx0S9qBMhTmAc6QUsjnEv+vr4kYn4Bqi4ZkzlT
	 MH3efX8fVmTsr6/tqCPYnxOv8vyuW4zBZZPO1Th3LSd9pbceYxdgmkLIlrtPDjxBne
	 oxuosy7fbK1EragWHWFY2PNmm0zpGs88gg8mIRTabCuDkqvGRLnaW2Fi+NxCQ+m96W
	 jPrKdtxC7rgg7cl9C1pOQX/LcFJSgM1tsQNoEXmYw87DfUgxr0iNri7SeOk19+aGGi
	 raLJ94KvYDJDw==
Date: Mon, 7 Jul 2025 08:33:36 +0200
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
Subject: Re: [PATCH v8 04/16] dt-bindings: net: mediatek,net: add sram
 property
Message-ID: <20250707-masked-ambrosial-pegasus-2ff8fc@krzk-bin>
References: <20250706132213.20412-1-linux@fw-web.de>
 <20250706132213.20412-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706132213.20412-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_233340_181211_F3E1BBB6 
X-CRM114-Status: UNSURE (   7.37  )
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

On Sun, Jul 06, 2025 at 03:21:59PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Meditak Filogic SoCs (MT798x) have dedicated MMIO-SRAM for dma operations.

You need "sram: false" for other variants.

Best regards,
Krzysztof


