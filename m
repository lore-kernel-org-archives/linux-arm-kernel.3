Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5650BC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9xJCIyBbmbt70/7krlXdDXHbbW5MUVXqLDthWupuHw=; b=clgPxJlHUiN2T3+mL/DQFwHZ4+
	fM7/8mhWVfZkKCrBjlV2LjwkMcia5tJuXgVVtNV1+Yq15+j1c1KJSj9shV+i8EhveN6rYP/n7b8Qt
	XpIyhXZ9EeIcOU1srqlnRq1Ox7KJD/WB6nUzjbw8H38oTYVrL0WhIP6gk8hltNLzt7bgBmN53/krA
	zxFJM3mW/Mwh7QyZFOTSZRhV2hC6mzm0iA55fSHDMs/UYcgLDUpz1iry3VP3D0qI7hHE+UNOAaYOd
	exsSF6P5DMxgqZpG+T1n0iYh+D9SX0ErDkFv/sTC343RgUmUBOUldjUN3rmnNI/12kAAaCTQCFx1w
	/nx2sb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Qr-00000001eHr-02fo;
	Tue, 22 Jul 2025 07:29:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Ni-00000001dTQ-3bbv;
	Tue, 22 Jul 2025 07:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0AF8A55C50;
	Tue, 22 Jul 2025 07:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10989C4CEEB;
	Tue, 22 Jul 2025 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753169145;
	bh=Z9xJCIyBbmbt70/7krlXdDXHbbW5MUVXqLDthWupuHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMPjpfp2OWAqia2a5IeLgdD3yLlUpfmkdNF6/xmTW2HALSfpJuvYIXoYGrniaGuF/
	 zLkmC50vG36UFMRinuxw4nOWVqimT+EXZH3B2pNDK2mKi1qqdevRH6PD4AgA3evM75
	 ruYawulIvwrijJBjqXUu12yl8S2+IYPxPHaeRxJpITw5zda+LGVYlUpHq7Gx9K5MH5
	 x/i15MFJyn0Q8LQEFkzMC4sPjxjJHJrxEzDgMDlNb5zEeGxXpqOTzvXwFEh9HPSpLN
	 tGR4tnEeSPTYQ06zXm6ImwYCtU0m0+zzy/rhtTco3mjRsQG6BaEuGrfXE7UPN5YOJg
	 4JgtAxlVwCiFQ==
Date: Tue, 22 Jul 2025 09:25:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Message-ID: <20250722-sly-sparkling-kangaroo-6ab9ed@kuoka>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
 <20250721105520.5625-2-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721105520.5625-2-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_002546_959302_4E258CAF 
X-CRM114-Status: UNSURE (   8.08  )
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

On Mon, Jul 21, 2025 at 06:55:13PM +0800, Kyrie Wu wrote:
> Add compatible for video decoder on MT8189 platform, which is a
> pure single core architecture.

Looks compatible with existing ones and nothing in commit msg explains
why it was not made compatible. Describe the hardware, say something
useful to avoid such questions.

Best regards,
Krzysztof


