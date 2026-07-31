Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C141CC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FPsjGKiFGNpGHFVhapPvv4d0Php5/nsvTb7QDGoN5E=; b=qApmqv37yK56an/3R9gpbE6TMJ
	+tqWJlQ1YwmnKpvQIaPKQwewnLDYC6D2IdJrVOV0MZdR8ZqLfwxMvokZaEJNcgnLtE93SDS4gh7uP
	raLqYEzHx4IaFsnz9kZeEf7ztTDkmpjsY8dMuV5hwHGxXyTGZzgE18SX1+jMC+5BaaiHfz52yApZK
	ZWwtIj5l2jYTKkh0KaAqZttIVrLQbSrmBRpgOOUnEZ/6UQdbsUbw84rtWAmy9XtbJhTztHwFnXpep
	87hvrTLyFGrKCyt04CtAKs52tH39Aty9v7CWFeh5BV+W9q7wnWJzuoTHa3LpqeEsu3zthlZDh8eMr
	hqcM9Rdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiaz-0000000C3wK-3EEp;
	Fri, 31 Jul 2026 08:27:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiax-0000000C3vw-3UnT;
	Fri, 31 Jul 2026 08:27:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B6B2412AE;
	Fri, 31 Jul 2026 08:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADB81F000E9;
	Fri, 31 Jul 2026 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785486475;
	bh=0FPsjGKiFGNpGHFVhapPvv4d0Php5/nsvTb7QDGoN5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KKTcuKiVTYXYHZoic8lCmhkMod1LCT5ZZe3mmcFzCotvIANhyi1ax/vqL86dMJAEG
	 V5v632DxnnclqGfgOyZoN6HGozVwEzIQa122RR64uC80DN7oibAp+qbt1Qgqf3hMAT
	 0CdwFvUbzOuQPSiKXEZjs+WNsumICSubckjO1/9uamestgwda08We9vkKChJWfAtiP
	 CypAHYo6y45HvU/NRCJeVUzcg8DnxeC1fFHT1S2ZH+0kamt81gsVjss6POyci/LpmU
	 baNYWuo7G0jkiF+rzMx0mzWfGVMEOAgR7HsKsMOSYcrzUm2vIUkVOmf3mNn03CD2R+
	 Y4Tgdyu2P8ZMw==
Date: Fri, 31 Jul 2026 10:27:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter Wang <peter.wang@mediatek.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Stanley Jhu <chu.stanley@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 03/26] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Message-ID: <20260731-fanatic-zealous-inchworm-ddfe0b@quoll>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
 <20260730-mt8196-ufs-v10-3-bc5ecef202dc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730-mt8196-ufs-v10-3-bc5ecef202dc@collabora.com>
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

On Thu, Jul 30, 2026 at 11:48:59AM +0200, Louis-Alexis Eyraud wrote:
>  
>  examples:
>    - |
> @@ -177,3 +192,33 @@ examples:
>  
>          mediatek,ufs-disable-mcq;
>      };
> +  - |
> +    #include <dt-bindings/reset/mediatek,mt8196-resets.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ufshci@16810000 {

You already added second example. That's enough.

Sashiko reports are valid.

Best regards,
Krzysztof


