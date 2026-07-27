Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DD4C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw+v6oGZww74N1CItB5AYg1IHmEGiC2o+mhgrfAjvlY=; b=c4MwvkVXhPgkmc4uI3tIAdmmhU
	Ze16Z7CXXWYmJXwTAScaLNk0jlvre9agK2UMZ8wC0PwLw5aZOmrPPNBT6Kg01KhGSkEnJbeBxnjEb
	w/wfmQT5N5dFVPMMEGwrGzTx6L2P/k6QfshbRozG6+HBlkV0o42M2r1PYGaj1tNlKXQR/af/JvPkB
	o6DUlnHmHY81sFX6P8WBtK6Pd6muvYG9U0qp6pchxVkBjUaWjBWXNZMvYVfudxICD7cKvuF+7gCfZ
	nZM9ys5lT02CKW1K0g2gkEDpRIxGM7XXUZGBE3ksYb6yWinI4yYOngjSGfFjB23Wo5/1CA3X2g6Bq
	CSIO7Amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJb9-00000002awf-2lr3;
	Mon, 27 Jul 2026 11:34:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJb6-00000002awF-2fmd;
	Mon, 27 Jul 2026 11:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785152054;
	bh=+iJBMuno9bVBAG8bYN02sVbSR5W7cXRvCpNBSN3BtxM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=UumtuF/cr/VymXvalz+kCivWKOGT1tz8HPGLzXXvwuO6/xjZetm5vSTaRXa2aUj1g
	 HoWM1cv8b5SBuVInOeg+Oy01UZo8M0rfmeg9QdJQ1ujHCmNjSCvl4FaLS3qA5BGFFg
	 dcq9knkYzYOaZnUZE5dLfTP6XnJI/yIQoNHrn3OpLwD8TOe8IZhWF0AxwWDnSM9Fus
	 LzPDm5+MFIAbOQk66T2udryLf/Zbwl9xAthlZ2Ap4cRlkn9cZXM4ZEH7t/jN7x4K96
	 xYy39zHkXyKO4KGDB0lg9c7BinN2yZ+0iU6UAiQ/4EZsXiGSc+Nrhg9H21nJJNxTBr
	 u91sIVZrCTnkw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6192E17E0213;
	Mon, 27 Jul 2026 13:34:13 +0200 (CEST)
Message-ID: <7eebbd9b-3a5e-4d95-bbbb-8ba3a7238383@collabora.com>
Date: Mon, 27 Jul 2026 13:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/13] drm/bridge: it6505: DP audio support +
 shared-DAI hw_params fix
To: Daniel Golle <daniel@makrotopia.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, Allen Chen
 <allen.chen@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>,
 Pin-yen Lin <treapking@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
References: <cover.1784947240.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cover.1784947240.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_043416_845595_77211B14 
X-CRM114-Status: GOOD (  11.36  )
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

On 7/25/26 04:57, Daniel Golle wrote:
> Revive HDMI/DP audio support for the it6505, originally posted by
> Jiaxin Yu [1], rebased onto current -next with the review feedback
> addressed: &client->dev is gone (the driver gained it6505->dev) and
> "#sound-dai-cells" has since been added by commit 325af1bef5b9
> ("dt-bindings: display: bridge: it6505: Add #sound-dai-cells").
> 
> Patches 1-11 fix pre-existing bugs found during review of earlier
> versions of this series; they carry Fixes: tags and are ordered first
> so stable trees can pick them.
> 
> Patch 12 wires up the it6505 audio helpers via hdmi_codec_ops,
> unblocking the mt8186-mt6366 sound card which references it6505 as
> the I2S3 codec. Patch 13 makes hw_params succeed with no display
> attached, needed when the I2S bus is shared with another codec as on
> MT8186 "steelix" Chromebooks, where the speaker path must keep
> working regardless of the it6505 link state.
> 
> Tested on a MT8186 (google,steelix) Chromebook: the sound card comes
> up, speakers, microphone and headset jack work. HDMI/DP audio output
> itself could not be tested for lack of a suitable adapter cable.
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioachcino Del Regno <angelogioacchino.delregno@collabora.com> # 
Steelix Chromebook

Cheers,
Angelo

> [1] https://lore.kernel.org/all/20230730180803.22570-4-jiaxin.yu@mediatek.com/

