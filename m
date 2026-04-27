Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74702FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGZ7YOwJZOEtP2GD2HID4K8bg5wvfLD7eRfmJfHmnYo=; b=aQ1365rRinI4KSgv1B3v0j/SMi
	NhzHnRG5uFYHVOasxrWiEr6MCKUe61OPoDCVjYsK2khAi6vkyb7ymrdr8I62gY8o8LpZqEr/6MQvo
	7XGZ6LXUTUk+/pck21ocPqgMLMXHv/N68DFPV3hRp0VOGF0zEv3uANg2Fv3UXHkNrhQuHENMBxGBj
	E9rLXb6EqQIgmwroHE3MVibJrHybP0T2zVhF5iGk+kuTYxDRTFxXbsNhUHrsWWuBtHtsIsnmod8Js
	TipQB28n2DTGZxjV/VGh9U36GFfA7LQsA3NGlAAj8V3sI1CsEsRUCvlNASVSkgsVv9L3N7aDacAlC
	/WwcaNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJNe-0000000Gi7i-0wA3;
	Mon, 27 Apr 2026 10:39:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJNc-0000000Gi7G-21aN;
	Mon, 27 Apr 2026 10:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=bGZ7YOwJZOEtP2GD2HID4K8bg5wvfLD7eRfmJfHmnYo=; b=0hFk1FOiuEOAd1ZJgUwpCmvIYF
	fY2m4BaeL2EnVixCgZtxOi+dhPRHBILisKmu/9/Q/HNFzKWryeyClcUkBIph2ft9KfEFtxYOJkmKU
	m1O9P/qg5LNa6b97JbqoriAhT/t3/BlGrenBYj93aA86beEkYz12l+vHvC5odPbgFd55vNLqCHSXO
	VktBrUiN89LCgODCnMiFQ2mPEAGAjE2XVHJt4XtqCE55POm6/K6koM4ofiHmHukNoCBPqa3AFIUze
	sWVWTQRmPNBo3MOaF2gGBjiSNa5MM3jZvDtZQvj+fDBAz7Q/YoY3Ai92ZzsW/SFmU+DQv2d9piK9k
	u0bGEYVg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 08/10] drm/rockchip: dw_hdmi_qp: Use local dev variable
 consistently in bind()
Date: Mon, 27 Apr 2026 12:39:41 +0200
Message-ID: <4830630.e9J7NaK4W3@phil>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-8-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-8-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_033956_551077_C75F9D10 
X-CRM114-Status: UNSURE (   6.07  )
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

Am Sonntag, 26. April 2026, 02:20:20 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> Replace indirect struct device accesses via hdmi->dev and pdev->dev with
> the local dev parameter already available in dw_hdmi_qp_rockchip_bind(),
> for consistency and readability.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



