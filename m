Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94385C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZVSFmMbuJ+Z0Kk8DUTwclrZMS7jCzgzpFtuI2vVojw=; b=ICe3CGNiTc/tvfTByAaavVkyE/
	S/kvkAl3eh8Ly1uhU1cEupIljLlHWnivXCVfjHe8YvqIePlFw9AEpFC6+a09FNmaGlyiOB7PPfO7e
	gA/bS8ssO3742LvtltfrRb6VfBr5UJJvaKerrtFVS+z0vc43ZjqS1oG81MZNEbHMD0sDo5JDm/8sN
	MldH4movZqUhz52bojUZYRKvTGa1f7n+ThyxM8Je2onGlZSDIdH7UQLbjdV5cQtiUFCCmrkr0teh2
	YA+0Jt0e/W10kWt7iKEkC556e0TrPRxQrlu1Roan+xgmbkdF6IQiLQHw271r4MNY/Hb4b8pvHxuGH
	aIjx1Eeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSNv-00000002d7r-0ekH;
	Tue, 29 Sep 2026 07:36:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSNu-00000002d7i-0bY2;
	Tue, 29 Sep 2026 07:36:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73566412ED;
	Tue, 29 Sep 2026 07:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6861F000FF;
	Tue, 29 Sep 2026 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790667377;
	bh=VZVSFmMbuJ+Z0Kk8DUTwclrZMS7jCzgzpFtuI2vVojw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XsD8jJ/MLcyAEHp06qf20kH1KRgaZNob7ijuZiJWqFCh10pJhSeq4RXgvcbV7Ap0D
	 xfNUM/T1T7hGjFuhEIIZX3i9cttdsKKJkwmTMWD5DFpOFbMM+ak/npEdZOavVkE9bV
	 eEWPJHQWjOK2wWRdLeNtwr3HJagt7rlZzh3MTJf6hniSDAQs4NEF7xcd7ZHuq18gPl
	 8RZbx5Y4L43EZRG0AfNPqXeVRbFR8wkVQH3OkCRwxfm31vDciRsxetcd1Ad4S5wK4m
	 MMgI1z4AHaGfV6tfV7+D2NGXcW4XweB3mtCC8ee0hhLUKYtafTs2f+QW8UKlQlDttN
	 ARBNZhE9AbMBw==
Date: Tue, 29 Sep 2026 09:36:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao Huang <biao.huang@mediatek.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@collabora.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v2 1/7] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
Message-ID: <20260929-shrewd-rampant-shark-98e87e@quoll>
References: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
 <20260924-dwmac-mediatek-mt8189-v2-1-430bd74d5ef9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-dwmac-mediatek-mt8189-v2-1-430bd74d5ef9@collabora.com>
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

On Thu, Sep 24, 2026 at 09:23:24AM +0200, Louis-Alexis Eyraud wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8189-gmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: MAC Main clock
> +            - description: PTP clock

snps,dwmac schema expects the second clock to be the pclk. Why is it
missing? This should be explained in the commit msg.

Best regards,
Krzysztof


