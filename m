Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F008BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3wcoNq78HZXyhFN5tFLNPu8Mr+r6U0dNK9UDSXUo4g=; b=r8npcQPMKunc1NuA5Urb0PN1Dw
	GkIRif42a/RvLwH7a9mbil43Nhg/XZGPhLx/l26pYt0MfQpIRtREWam3tQ48Tv7RfAkW9KSULMQGh
	QdGH9Cxrzh6CVgL/bkk6S50Xrr9fmJrJ/9MBJC3+pLRshX26nZSFEeb85gWKfxHKhXw5dIZ9GwEsg
	3jBmMEeobJT8ey6luo5jpMame3auAXoQOtiJ2WnKwAUP1M3fTS8MDQ7lVFYYGS2F+G7ycvn0IXKjf
	l7ioPupUUMeZZquiyDO9DQKy7wsZPQoNF6XOYr4fyQmw8a1Mdim9Q/ndNqFKKdLl426JwZEU7lvWC
	jL+NYaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb7Z-00000007Jvz-1EqV;
	Mon, 09 Dec 2024 10:36:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb3F-00000007IN5-098Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733740299;
	bh=5R7UJvpnNZvpK9L14WEHsC1kTWlkvqH3tZDrqX5OaAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AsDRNMVZSOiJ1zMNL+H3MTL59YGIgcxr41pSwJBzP8V0OEBd7hAyOn5nMVaocM1up
	 6TH9hACou9PFnPYdtFpahta0sBenIzXDvJF+IYtgQq/bZof/Dif8M+mvzhcYHdU59c
	 BxO/9glV7TaWKyn1lc3seme6Iuu6jWR1A17RkaZzY6qOikd2Vl1TGG9ubHvTbHmeNt
	 VeuicXVAdN1JRiDCNiEIUi3WZYwqF+1VmMnRPksd3f6Tk2n02Q2izlDZyo1lfT2Zm/
	 7msumAgYdq6I6j0cROANvBPVKio8J29E2Rx3utlESZL948TILuwQHM1dCfHri0YcTN
	 dXgldygaYP41g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4862E17E09BE;
	Mon,  9 Dec 2024 11:31:38 +0100 (CET)
Message-ID: <2484261d-5589-4707-b3f9-7df78b2935eb@collabora.com>
Date: Mon, 9 Dec 2024 11:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,08/10] drm/bridge: lontium-lt9611: drop TMDS char rate check
 in mode_valid
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20241130-hdmi-mode-valid-v5-8-742644ec3b1f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130-hdmi-mode-valid-v5-8-742644ec3b1f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_023141_250309_EE71D667 
X-CRM114-Status: UNSURE (   6.95  )
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

Il 30/11/24 02:52, Dmitry Baryshkov ha scritto:
> Drop manual check of the TMDS char rate in the mode_valid callback. This
> check is now being performed by the core.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



