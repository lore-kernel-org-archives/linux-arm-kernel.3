Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB93C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlGR9ItXAmQGjETy7LCxdY/92Agqr1/MA8xAziWH4oM=; b=Amhn2e5scYFnnPvmLbNNNrrDpA
	1I5z7a3JJTdenxlrs9Gwj4ZY+lAE03BqVqeGzo9yQhnysNlCLczQR/ft+SXX6UqhemtiIvpRq9n1J
	34g/6lJ7EzM4D4qHZhaspFnh46YKWZhdczwAz8cXPrrBhEQDop3/dsiz3ZDwYRweJdox83B+KO4tT
	fhgternycgIbfldOoyedB6D+ejEOZ7NyvX3wNQo11bTukuHRLkdTgmPs25ionPFBlLft0GeHEYZ0d
	mQTFUpUDvEszXMkau8UZiDUdVk1mAZ3ppF6hV+Ot71E59Rgr7bLz6vJhDUK74/1ersHrtIWd/ZlTx
	byFAdxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF9y-000000023m2-3D2X;
	Mon, 27 Jul 2026 06:49:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF9x-000000023lq-2Y6F;
	Mon, 27 Jul 2026 06:49:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0BEA418EC;
	Mon, 27 Jul 2026 06:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3ABB1F00A3D;
	Mon, 27 Jul 2026 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785134996;
	bh=MlGR9ItXAmQGjETy7LCxdY/92Agqr1/MA8xAziWH4oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ifF85JeNmACewPI+iNuluPZO5mVGRTaEer/Y6uWO5HBXFrqpCtQifAhhqiMtaaSpA
	 QcXtnb9yWpCBmc85kkw7GDKHyboDWsaJ0ZJxWlNLZUrJg1FQW+G5ZPCY2/WORFwh+Q
	 rmiDATKJIIEVJj8Tv+9LM5M0PMZ+5okjD9upyypI0CRYjSoYMb9ilB2hQB5Mfk9knb
	 I6VTf+OMShJbpDXQfqemSWe+IPSukSQCZwE2fnMlNwAILS40gSTHiCvbdAJ/0UocKj
	 Utm/tQdv3VHtxfLFJhbIpAqPHQhrblAvzyenhhUrlwapgTwtrbHBqsOCTsu077EY5+
	 zHu/dwYhgkC9g==
Date: Mon, 27 Jul 2026 08:49:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@flipper.net>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 15/16] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Message-ID: <20260727-luminous-spiritual-grebe-72de7b@quoll>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v6-15-041d99a19c4e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-15-041d99a19c4e@collabora.com>
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

On Fri, Jul 24, 2026 at 08:03:37PM +0200, Sebastian Reichel wrote:
> The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
> possible DAI interfaces: I2S and S/PDIF. Thus an argument is needed to
> to select the right interface.
> 
> In addition to that the RK3576 DisplayPort controller is configured
> with Multi Stream Transport (MST) enabled for up to 3 displays and
> thus has a total of 6 DAI interfaces (I2S and S/PDIF for each possible
> stream). Meanwhile the RK3588 does not support MST and thus has only 2
> DAI interfaces.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


