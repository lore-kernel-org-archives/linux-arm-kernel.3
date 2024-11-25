Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A807D3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+jvzPSGlr34jwjywTi8WDWIyk3EcVdwYNZn4DSRMU0=; b=kt5z1EUoM671oW6weyKj6xT5GU
	V5mzIR2Ouzz7/9JBrz7A+gntoSwICAmvQr1kUGyfhflyesKT3r3JoMvIbslujT0ZhGCEI6v7akIs2
	+p3VYWChiaGdGJ9lDlGy6sRAudsC+/kRquEpfO6e1jt6XAHOnqGyV6K90OVn1ioX0JuZE8d86CPwC
	7pRF+TOizEj4hMir/sGYnQ+lNrvCsXfXoUUx8yH7/CCQIFlVbfro/s8wLgkEwN5UakMnyRSJHQyD9
	f5ecxGQoZVFLtGFPChax6OF06mlQlzzlRjLlL91885J8ilaKQW0P1iVpum2ihY2p2Id6sAEc0cOwH
	ZjXF3LEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVFZ-00000007XPD-3OD6;
	Mon, 25 Nov 2024 09:19:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVCo-00000007WoW-3Ujx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1BF26A413FF;
	Mon, 25 Nov 2024 09:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772EFC4CECE;
	Mon, 25 Nov 2024 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732526189;
	bh=0k7jgGvkFXzafjUapZMYG1Qcle4a+6D/0t/ThVVD23g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=RmiHhwjBNeTuge8/ebrVQFewoge1S35Ob75fEqEVLj4IZb5EuKI7ZiYIUn0ZK60T0
	 y6MxkdbKCbojE/THM3VGgR2xTx1TY8QeDBmLixxXQ+CwJ8pAGojZZlVEEn85HuLnTA
	 slsTF9clpq3Vm1vecEd297c/C2GlytGzOD9vpLAD/4PVug9KJp80nzikGN02k7OB+h
	 l3wa4IeZzsbbFO6cESNxumWpnc+ooZaWV1x5DE1p4e59AvWx4Ow2/uT+1rt+Sba1dc
	 RlRl4T6APZhshFRXzu3wPZUea5LXWvXo5pVyRssie73KpTmcPQVd39/T4SK0eQW1vh
	 /N6nMYNpbm0PA==
Message-ID: <7e21ca957adf9bea6df99767cc28fe82@kernel.org>
Date: Mon, 25 Nov 2024 09:16:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 03/10] drm/tests: hdmi: return meaningful value from
 set_connector_edid()
In-Reply-To: <20241122-hdmi-mode-valid-v4-3-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-3-2fee4a83ab79@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011630_942684_4D13025C 
X-CRM114-Status: UNSURE (   6.74  )
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

On Fri, 22 Nov 2024 11:12:59 +0200, Dmitry Baryshkov wrote:
> The set_connector_edid() function returns a bogus 0, performing the
> check on the connector->funcs->fill_modes() result internally. Make the
> function pass the fill_modes()'s return value to the caller and move
> corresponding checks to the caller site.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

