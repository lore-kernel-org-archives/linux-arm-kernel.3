Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5855CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 23:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od3joW1Wxve+ICGhGb4vFS5z6UxzcQ0INY3y1ne3HA4=; b=Mf2eQi9cQaaY66W/JHIsWDwPBV
	/8fx+0mltowOcFWuyFUX2RLcEAXTd3cej5DlYlo9j1Tva5/wI4tdHDhreCr8AAnkR4yaVAQwh43r9
	TOKK65Xczn4k1flldCG7MEiZAcwni9H/OM7Tn2vzyksrDBshrOTlCSN4NFFF6snNF/vF9I2rLwaTk
	HlkGCbyKEaSjOm6elAr/gEmppCyi78iV7JHsIk0+/zTXffp2f01iw0cnDebpRm6XxJHlWfeQ6AcFB
	3rBFgWALC5oiqmeenZc0D8YTOrXzxMgtek/qzKaWCHytuMSoSMYSRoxW+94XhmllbM9EbvRWOpDiz
	J1OZBGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX71k-00000003aZu-1FiV;
	Sun, 12 Jan 2025 23:05:52 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX70U-00000003aOS-0m3U;
	Sun, 12 Jan 2025 23:04:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 800511BF206;
	Sun, 12 Jan 2025 23:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736723072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=od3joW1Wxve+ICGhGb4vFS5z6UxzcQ0INY3y1ne3HA4=;
	b=KboXijkWc36CwUypAccTjZK5gVSl3761aoVT3pFDPQmb8cR+wDBrrZPU8OU5ZdXDlE58Lq
	eDXit5TN6/sf6tohDGK0v4B7U5VpVz22cH51CsXG4WmCUuSJ5GGjczaiRC7P9UIM8GZmvj
	8adOdW4lTOStIFkbqTlaeTB/sMze43FYpHw/6HBQD0ArjmcyadbjCnn5QeNQzTGBO0SNz5
	tBOfY1IDPUQcY3WsGeb9tsfY9yHiq2uRolRB42CGjyDztr5Y6NlXFJWUuVEphkQiAgGKCs
	cuy08iOqXCMezNB72NLKjr9yku3BXWbCd6n3Tly/n5ZDRVn54PCNl3Cimen3WQ==
Date: Mon, 13 Jan 2025 00:04:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Defa Li <defa.li@mediatek.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	mingchang.jia@mediatek.com, yuhan.wei@mediatek.com,
	hao.lin@mediatek.com
Subject: Re: [PATCH v2] i3c: master: Improve initialization of numbered I2C
 adapters
Message-ID: <173672283109.1485431.11089428942061929142.b4-ty@bootlin.com>
References: <20241212091818.8591-1-defa.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212091818.8591-1-defa.li@mediatek.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_150434_351969_7E891041 
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

On Thu, 12 Dec 2024 17:17:53 +0800, Defa Li wrote:
> Add logic to initialize I2C adapters with a specific ID if available,
> improving device identification and configuration.
> 
> For mixed buses, in addition to the i3c alias, an i2c alias can be added to
> assign a fixed bus number to the i2c adapter.
> 
> This allows an alias node such as:
>     aliases {
>         i2c2 = &mixed_bus_a,
>         i3c2 = &mixed_bus_a,
>         i3c4 = &mixed_bus_b,
>     };
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Improve initialization of numbered I2C adapters
      https://git.kernel.org/abelloni/c/5eb6d3561f6c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

