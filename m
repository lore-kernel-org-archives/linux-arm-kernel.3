Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8D0C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL2i6ZKIxMZCNIP4Vk9V6tm2NowScXhDJ+os4ldH4yY=; b=jH6G3xaF7nb8pCssCbQfFIxubZ
	s3+kaJvkRjbNO/dnGjpdl+DdayxASJXcSCRTkTEbmSQRsZ4HXQAcHyA3b+oySzd61832wCMTAzVmQ
	hGtjXaIzuMNVmuTrrXDagBzA9yM4Dqfz80LUIhPfCY0Ii1yByjFwstJEn2olK+KL17BZ8rp3Fen1e
	uJ4zfjHG4roMVqJrRIhc/n+3xEBNzRTT8OLY1HO7FoF8FGRksD8FsUJ3hkSTOBw+TWH4lcvwP+MT7
	M6aRdbgtHemFHWkTHYrgT/Rdpb8PUXuuQYAh5EpZPdj1/kuGhzs86kPG+uJ6U9IqZgq0b4hzGrUad
	voITnzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiVQ-0000000236u-3mmu;
	Mon, 07 Jul 2025 09:51:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYi3W-00000001y90-3lBU;
	Mon, 07 Jul 2025 09:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751880152;
	bh=kaWeX7KKkf1DeQg7+StlJB5g41RBud8WpmRtSGs7VWk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hnItabx9D+lF43Q0vxGNVa8XbTRVhlY3oAf3P61KfeTQXFEPJ9Yklj4hA/F4vD6JF
	 iKk/2QgWf1iMcb35g16EozKH6Ck/gOG1/yI1BE3daKt9aYHAaYTqf22REp0Te/TdGa
	 zfPNUgv+4vEy2xv4BNt6fdcVXkIhKbUmmzC0ulxsakNNjTLOcnJg/QsgOhy16W3AbS
	 z8HQXjioQZbx5WJETw8JTc1RStFiTbY1smY7dg40fhm4e0SYX0UQhCDPkCOg6LFxFx
	 RL6eAZfqVzqrRco6IUTUO8zEt5Qb20uc5cCgYxrcuLbZ2RUzUvQ4oVElqFq3gl9uis
	 BNIPgPhXcDvBw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDED317E04AA;
	Mon,  7 Jul 2025 11:22:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Johnson Wang <johnson.wang@mediatek.com>, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250706132213.20412-1-linux@fw-web.de>
References: <20250706132213.20412-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v8 00/16] further mt7988 devicetree work
Message-Id: <175188015088.67037.6051435285718584853.b4-ty@collabora.com>
Date: Mon, 07 Jul 2025 11:22:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_022235_090340_2B99BFFA 
X-CRM114-Status: UNSURE (   7.08  )
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

On Sun, 06 Jul 2025 15:21:55 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series continues mt7988 devicetree work
> 
> - Extend cpu frequency scaling with CCI
> - GPIO leds
> - Basic network-support (ethernet controller + builtin switch + SFP Cages)
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[07/16] dt-bindings: interconnect: add mt7988-cci compatible
        commit: bd9e0f5d90959d2d07986084fbd58042b62aa549
[08/16] arm64: dts: mediatek: mt7988: add cci node
        commit: 0cbdb6d04689f8c05074e348c8e0a42b229ef9a3
[11/16] arm64: dts: mediatek: mt7988a-bpi-r4: add proc-supply for cci
        commit: b5a4ad957114b59a74b3e3f598ae0785dd86cd32
[12/16] arm64: dts: mediatek: mt7988a-bpi-r4: drop unused pins
        commit: bc51660cd5fd2d0ee9a65b59e0c65e2d1b65975a
[13/16] arm64: dts: mediatek: mt7988a-bpi-r4: add gpio leds
        commit: 5a40efb8c9d26e51db8acc61e920c3eda9407c02

Cheers,
Angelo



