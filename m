Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18E8D65C7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNtEMohia9/TjVnGsRAQ03r1DaEYaggznGwAZjQk0Mc=; b=NEBDZhsGk/igVXb9bu2pElQX0f
	qKzXWBM4JBJNMq0m2NQ6ZvdWLXIqic8AEIr0y2hmPsJs3Z5nzpI3iLKZ9chPUgTRbTEywNgIAPnw5
	x7JrUMGysFMlPpxOA+hnB6l2xbrUi3KanDPjROEDx5LJXgYeaEaDOxMPrVtRzuzLPJWYS4r2NsOk6
	cVafAeYSus6M/jLjMWzaJvThSVSTgnpcaVbegV36AYnAHi2NLz5k6lOWXvPAQCqtw3YLuTHPxDBjy
	CNVv+CXGUuQyWFt3I2z5YjmtDud8j+H355TiSPBHdEDwNTrFahdWw/LPf1eH3He5oft1pgYl1aBXq
	+sdSAWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBY5i-00000009jya-0d8J;
	Thu, 14 Nov 2024 11:32:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXDj-00000009ZEe-06Is;
	Thu, 14 Nov 2024 10:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580621;
	bh=wldOVNo9OUOwFXKiY5hRYsqNo42KRGhqHsK0EVeiwXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MJtPs5zb/Y97YcTz7MxdsCxTtSjWXopxmKh3oqI76IcUBNV8GD71iY12R5G9XolKC
	 bmtH4BwmEeMuevLJgO9dDJNmP8uLRXy/9KllwHH9afhmzgO/pHYPYmlOiSg/A8DQba
	 8Dsm98SFfDv8wl4fVGMSg70oWh9qinDaLvO1Oy+beV7vTierEOm7cuc1gX0aXmgz6z
	 J+fvhHbaWZqtFiXgLjCTWhCELnV+Dycj7xvUvaDUL2kLqySTPqpkfwKPAzPhcM+HJP
	 U5CBgzGJZ7qhNu1Y8KvOSAqPznx96HwahZuUTgJ1Irl+enPq/yDc8mWxJmi00WJskq
	 +FZ6rn/C3nl7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AB2917E35F4;
	Thu, 14 Nov 2024 11:37:00 +0100 (CET)
Message-ID: <7d9abefa-6400-424f-9cf5-439f4400a168@collabora.com>
Date: Thu, 14 Nov 2024 11:37:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/7] i2c: of-prober: Add GPIO support to simple
 helpers
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-6-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_023703_271687_4D061A9A 
X-CRM114-Status: GOOD (  12.10  )
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

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



