Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69184C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuFqFYVNctf0qMgd0CODf0c+Uu31ZnwhcPiNAm8rxfE=; b=Z/zTZMWjoNJKTh2wKqK2ZqflDK
	2q53xLlctDkg7anBtRYC0yIw+Z4SKFiIMV1zWZTLd/OMM/KCQCBXgxVpg9IQNLpd6jBX4EOsAlgXb
	wa5H6Su5qmP7UAUdRZOPtU/TS6zkf8OHeUERt4vIZRHfjgK5F2iAJalFzv7P3UKMj9BJdWFQBPqrW
	2vyHxTCjjZ2ylo+T4S+ubbYWVUgga3XvHt4jpgARrIx57eaTlZQJnFJxiDKfh7qFnbOauNShzdoth
	YPF4qccoEH7/iA6h9vVe03WeNreAVAfJStqo5TUc7GBD779nUBbXTlbtRLks/HeJM+NgKOELfFM/T
	IANGxjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYAx-00000001qpf-1siW;
	Mon, 10 Mar 2025 08:07:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trY9I-00000001qgn-2ChB;
	Mon, 10 Mar 2025 08:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05F745C546B;
	Mon, 10 Mar 2025 08:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EC3C4CEE5;
	Mon, 10 Mar 2025 08:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741593967;
	bh=JdNOUETRN7NU7vKZ0Jb69tYZgdK4LacoJaUSmjraB+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnHMKZDxPk/JEEVnZ14bMVuOE4AMHF+4LK37P9FMw9W5DYYzqRIVR19INgh4GXPz7
	 pl2DKchAu/sj2rtDAx13rXjZavd3cEB3GXA3LcZ+FeKdjQuPDFvb4QyfKfvEmPe7RT
	 pETZrXrtodQFN42DZfV84l68R7WFUrusLOwGG9hJ8oPc6qXPUGDEM8PeHYSEZcBo+i
	 y1QXKKIUXoqlk+E8MxSXmVLARLxeP865GnEm0pc/zd8b1V1GjcZJWn79go4cRzuLr0
	 k6o9F6DCiBSBV8S1iz/OzfRErEq/wuye+AAGVca4oW9p5A2mF+s+xZwSxOmQOGFbQ6
	 p/rBkUw7B3Y4w==
Date: Mon, 10 Mar 2025 09:06:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 06/13] dt-bindings: clock: airoha: make reg optional for
 Airoha EN7581
Message-ID: <20250310-pompous-elk-of-serendipity-cfebc9@krzk-bin>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-7-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250309132959.19045-7-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_010608_802958_99AE7C4A 
X-CRM114-Status: UNSURE (   9.93  )
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

On Sun, Mar 09, 2025 at 02:29:37PM +0100, Christian Marangi wrote:
> The Airoha EN7581 clock-controller registers are placed in the SCU

I don't understand. The registers moved?

> (System Controller Unit). Now that additional pheriperals are supported
> for the SCU, a dedicated SCU node is created and the clock-controller is
> moved as a child of such node hence the register property is taken from
> the parent node.
> 
> To support this, make the reg property optional and provide an
> additional example for this case.

No, post complete binding instead of adding some sort of stubs and then
later totally reworking them to match different Linux drivers.

Best regards,
Krzysztof


