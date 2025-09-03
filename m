Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6756CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZD63uFUUWm/vKdNbnOPDAIu7KIlkgvjimOu757PzOY=; b=JF8j94nT9vnl3j4s4466fJ9YR6
	lIDM4HY6hm27sKAF/t0TUz1FjY6Wo9M84IcnI4dEh+X7E++3LIVPxYwA+dsgKQlZA8PMj6WiFfzdB
	la7cxWExho+NuG0CiNWMj1C83B49OMPcPQ0Od6thWc89Yn7na/TOKskUf1ags5oX1/RFKs/MO67Hp
	hC5FXNRfouO3moCIg1vRQqA0Yg7Tg8+pIuq2NKvBGkvrR2QWcgVpqJqhrcKUwph8u94PVEAa74ViU
	0bKlzyJnek5HzOqi/jkOmOppZTwwxuqtri91qOWVcVHwGjE5+UsODlA2uIlFTAZJMME0ahGrrt/b/
	z5NOTIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkyX-0000000686T-2Sqv;
	Wed, 03 Sep 2025 10:44:25 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk41-00000005yIM-0zEf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qZD6
	3uFUUWm/vKdNbnOPDAIu7KIlkgvjimOu757PzOY=; b=HcFGa0Trj5A9lugbOuv7
	nAQ5a//v4VMybK49wDJ16RvfaBJRqz5Gc4hMYVLUwU4fuWIqXYNzIkB8ugrLOCuR
	zRzjJ1K3u4rhVCKCjFv5PQwxE80LdYfCT+wUcIsuXgRkMN6wdyVRshzoGBrkqb1h
	q1IkJQSdr90orGtWPU4blEZOluYp+t+7LbiaPcmzrI5JCI79F8GOZEjxg4BA8D8p
	LB1quYysEiyyu/lVvEM3mpR6jfRlUiYi23qPZCGy9yENwiFjmaMZhy3hvlWWCGUz
	HtOGfDjsQ7xCi6D/wTxJRgG3hlJm/Q+RmHDiPc2tZE6nIKS+/11l5NZr7zUWe2XP
	2Q==
Received: (qmail 3244023 invoked from network); 3 Sep 2025 11:45:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Sep 2025 11:45:53 +0200
X-UD-Smtp-Session: l3s3148p1@/45yeOI9IIMujnu+
Date: Wed, 3 Sep 2025 11:45:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain
 interrupts
Message-ID: <aLgOUGOp7Db0keZ-@ninjato>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_024602_123560_BDCA479F 
X-CRM114-Status: UNSURE (   8.92  )
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

On Tue, Sep 02, 2025 at 05:40:53PM +0200, Krzysztof Kozlowski wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Double checked with the original RZ/N1 docs:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


