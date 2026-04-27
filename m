Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B5DFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAD4AusdeD9FfyVrCO0ouM2Cws+0AVlS+08lI2nfBkk=; b=xzP5eVJnoirJirFWguDocd/IVs
	8Bo3Q58AOQ7ok5N+xopzlh/3rtYpnizXyxo195Wj5ARfNc30Bcz7bCWTKI5dXqcuE84nOJXAkw/5f
	DGCYyA1w6Qr+IQ1g97GnaN/yNFGl7kbyfhbFoSM0KzQPxKFgVR+wHcXSDHOCbKCDwPVtvwPpN1kn/
	DmwwCQFnJjB1OuTXaOfHq58VkKkn5L1R05gjfolVJ/fworMKjPaKs0wn3nkxYJaAdI/wzV2D+RYLP
	dh+IHODQ0HFrjVGsTdldmnke6++qjomUbccGY0TCex5ICsTvcvjmv3l5v71mCpnNzeQvu9W0xmUoc
	JKZRHDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJOy-0000000GiIo-0Nfq;
	Mon, 27 Apr 2026 10:41:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJOv-0000000GiHz-2buG;
	Mon, 27 Apr 2026 10:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nAD4AusdeD9FfyVrCO0ouM2Cws+0AVlS+08lI2nfBkk=; b=LpStolxq3jg9WYGz1YvWNjkrZS
	ZtAgRFX6liopLoxVtop0BNDB83nNU/t9EOHFPQjli8n6VJ4wWknAghmz15S04zgBtVPbB+4AfXtk3
	6+qOtl0kLOKuZe7LUGOX+4ZppyCD41kXl0NffVwETiQyUw674QprUKvCt8yn+xS52JFGsBTVyWmq1
	4OBJt/Zu+B0XYrIqq3Ryd9/HhtVUOJdgNEpVEaPQbdg7HRcNtDK0ZCVJJFkr09tIv4AsuOJvfwKJD
	s1K1ttn8Le6RQuDuGrC8i2sgOy2se6xaNdmiE2dPW2wo840jwi1jv7UgQVcGZ1dLaWyqS6QNnVZy3
	bdy8wmSw==;
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
Subject: Re: [PATCH v5 06/10] drm/bridge: dw-hdmi-qp: Rate limit i2c read error
 messages
Date: Mon, 27 Apr 2026 12:41:04 +0200
Message-ID: <5203832.44csPzL39Z@phil>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-6-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-6-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_034117_707178_79DEA4B9 
X-CRM114-Status: UNSURE (   7.58  )
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

Am Sonntag, 26. April 2026, 02:20:18 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> During EDID reads, repeated i2c errors can flood the kernel log:
>=20
> [   25.361716] dwhdmiqp-rockchip fde80000.hdmi: i2c read error
> [   25.363376] dwhdmiqp-rockchip fde80000.hdmi: i2c read error
> ...
> [   25.368671] dwhdmiqp-rockchip fde80000.hdmi: i2c read error
> [   25.369440] dwhdmiqp-rockchip fde80000.hdmi: failed to get edid
>=20
> Switch to dev_err_ratelimited() in dw_hdmi_qp_i2c_read() to reduce log
> spam while still reporting the condition.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



