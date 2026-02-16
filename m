Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71416E63F3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CcwQ/cJ15LurDvNMUFT6OHMLkbdRcIU82RsZZ8OV/k=; b=BqKxGXDzGParsW4Hiixlt8kwXk
	zpLqvGsy8ZfQWQtPoKk81UA/VGBbeKuQ/6AneWAld65r2X99IE1pa/zeC4WPEZaUludufzj5afXmE
	d6XFaXWyFMnjuDc0+VEE68I95+buPJNccmDInaadZ+ZWxogyxOSKX588OJpQk0XBTOmHp5eQZn51l
	uptRo7djhO4LvzAwu0OrvPqtWitNw8VDyujqG1BQg9nXBVzo4HmkjW5ZYyU2UDMbZO7sS+u8acM6N
	QniIEhOYWjrYODGz/iuqOgzuwBb/NTUp8/4bT4Y4Dd7cX5j7VPrEAD278/7ccKJXUmEqQZpmzAU+G
	PLRr2H8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrv3E-00000006HUD-1esv;
	Mon, 16 Feb 2026 09:37:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrv3B-00000006HTp-2Kgv;
	Mon, 16 Feb 2026 09:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771234669;
	bh=qKKaBe4wf2RPk6OJWEKoKbKnw8/kv7zGYyXRckENEUk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I2oKvwoHlI8oSPvQHSJXXW0H+75phIPDMf1wu11+r2nCrG7sPX4d6GeUd373hlnkZ
	 VQY/qoPjgZh3gTS6czi3gfPJ/3Zt/HueoprNTYXysbI8e9vbhlVBajuhoA4PiXo/Fm
	 bem+wpW58TJlZcscN47Hqf/MwSyAZyLoDnSXQG7YcooUur9JbfxiLpVEVTVk1k93r0
	 6yWlwvjrpobD13y/YZfDS56vsMY2e66Xg+nUIWN/qEeDI+6RKexXCjmaDVy4vENgE8
	 CUtuE8mfzaSWAU0VUIdkhC2pE7vM2XVE9QUbj+VyXINf1n+nghNXEoqwu13ea9+h66
	 FwfZ3OG9qPKdQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E067817E137B;
	Mon, 16 Feb 2026 10:37:48 +0100 (CET)
Date: Mon, 16 Feb 2026 10:37:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except
 mt8196
Message-ID: <20260216103743.626c71e3@fedora>
In-Reply-To: <20260215100302.136719-2-work@onurozkan.dev>
References: <20260215100302.136719-1-work@onurozkan.dev>
	<20260215100302.136719-2-work@onurozkan.dev>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_013753_748004_A9A30629 
X-CRM114-Status: GOOD (  19.13  )
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

On Sun, 15 Feb 2026 13:02:51 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> If sram-supply is missing, Panthor falls back to a
> dummy regulator with a warning. This implicit behavior
> hides missing DT wiring behind regulator core fallback.
>=20
> Make SRAM handling explicit: require sram-supply for all
> Panthor compatibles except mt8196-mali where GPU supplies
> are intentionally managed outside Panthor and DT does not
> model sram-supply for that compatible.
>=20
> This keeps DT power modeling explicit and avoids relying on
> dummy-regulator fallback.
>=20
> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 2249b41ca4af..5f6075f18fe3 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
>  	 * But without knowing if it's beneficial or not (in term of power
>  	 * consumption), or how much it slows down the suspend/resume steps,
>  	 * let's just keep regulators enabled for the device lifetime.
> +	 *
> +	 * Treat sram-supply as mandatory except for mt8196-mali. It manages
> +	 * SRAM outside Panthor so this driver must not require direct control
> +	 * over it.
>  	 */
> -	ret =3D devm_regulator_get_enable_optional(dev, "sram");
> -	if (ret && ret !=3D -ENODEV) {
> -		if (ret !=3D -EPROBE_DEFER)
> +	if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali")) {

Rather than checking for specific compats here, let's go for
a dont_need_sram_supply bool in panthor_soc_data.

> +		ret =3D devm_regulator_get_enable_optional(dev, "sram");

If we assume SRAM supply is mandatory, should this be
devm_regulator_get_enable() instead?

> +		if (ret) {
>  			DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram supply\n");
> -		return ret;
> +			return ret;
> +		}
>  	}
> =20
>  	opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);


