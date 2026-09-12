Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94950C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv7tj6aG8jAawVe8iLzkv+Y6H9ZiYdHzOwXKk3pLt+A=; b=ZSE71TFDBnQsnLxqCyR2UJPjn8
	/yRvnwg9dPbRj+3J21fPglrRx3AJL6o/B22/2YeXDqfAYsEv4ZYpc3wP3dgEAIbVS0R6/BOjr9vCA
	xqVuT8U7W//FpvbrfnW2V3r0ltNHk0WSXQ98JsGiPrAbtK/qkUJ8W4KnWTj9VF9q+s/x/9wqtMaKs
	xVF12FWZcThhwIY63wMBJ5Sih2FZahQbYC6i21bTGpJGySgez4f94HIK8JFHOyHNHT8hJ2w0Ckn6Z
	T6x1VqLkFw+vzz0KjTxXKT4MaBK21j1Spq9uzBrv0afdU26cNA6R3K8NeUfJ03p3SojrMGJJhNCqL
	aWkSTw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Mv3-00000000rkq-1IGb;
	Sat, 12 Sep 2026 12:33:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Mv0-00000000riE-3iYI;
	Sat, 12 Sep 2026 12:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Fv7tj6aG8jAawVe8iLzkv+Y6H9ZiYdHzOwXKk3pLt+A=; b=0nwgTC0r4UbwJjdY6W4Hyd3tO6
	s62DWq4AZit8moZw4HOICLlyD6ZEVDDksbgZo5P2q/U0SP/8CvkfXVSjKjsE+gMTVF9UyyT67Ur0C
	x8rYYoNDyk3ahNVczWODpy4kvCBC2XuxQVCrcsY5eC5AFI7lr9lXTj4kB09gcv5cpXKG8t/GzDdpj
	6N4uU6vmWI1N/MgkdGvI1ziSMQ8umzZIF0FzM1lIs56EYkvM8TMDvWAny/GQBVni8XuLaeFQ5dNnn
	/6w6DJd6jPLBt1KpmXiACZ0qMJbPMCXZy7MOapqqyMZEtYrQvspHn0iLJ9FeSYuuySQ0OjuN+WSm0
	MJWif9Bw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v4 1/3] drm/rockchip: dsi: Add maximum per lane bit rate
 calculation
Date: Sat, 12 Sep 2026 14:32:56 +0200
Message-ID: <9674763.CDJkKcVGEf@phil>
In-Reply-To: <20260812073002.328-2-kernel@airkyi.com>
References: <20260812073002.328-1-kernel@airkyi.com>
 <20260812073002.328-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_053318_986253_DD667CC7 
X-CRM114-Status: UNSURE (   9.68  )
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

Am Mittwoch, 12. August 2026, 09:30:00 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> Different chips have varying support for the maximum bit rate per lane.
>=20
> Add calculation for the maximum per lane bit rate for various chip
> platforms.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

[...]

> @@ -573,6 +574,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const stru=
ct drm_display_mode *mode,
>  	unsigned long _fbdiv, best_fbdiv;
>  	unsigned long min_delta =3D ULONG_MAX;
> =20
> +	max_mbps =3D dsi->cdata->max_bit_rate_per_lane / USEC_PER_SEC;

As the value is called max_bit_rate_per_lane, I guess Sashiko
is correct in that the max_mbps check should use "<=3D" ?


Heiko



