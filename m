Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8850EC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 05:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yn4jlCR1+KXfhj6w1DwkafrPG83kV4BowcaOZJVhhkA=; b=4uagQcFrHoC29YenJpDuBNgVSV
	Oo8k12c4pfipDeJtL0oS/501ZmonZTyaTGgf0gdI/n49PR1Q8VzThrnlEIv3J5MT1AmbxjXGH9QFb
	5k5Eg7ioqmDtFUVZiOE8dvJDIKSuGp//MI6kkMOBIPxJsJIIBEvCYE4O8lvmHUlC13k2fK9ZCmwRY
	f4vubsxfDl6ZXJyJoKQ0DfcP5Y5txOwdeAoHVUSm/6I1p8O7ufqzFxre0usaEu3A5YuuMqnVwFC2C
	+52njaL1wcgJU4t7jSQToIKXSHbdTahy+Hp+Ki896iRtqdUqxn1ZzSgzLiHRiTYCH2qg+7TeKe9mR
	C8IqfJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RWh-0000000DWD7-2eCW;
	Fri, 18 Sep 2026 05:52:47 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RWe-0000000DWCi-28Ab
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 05:52:46 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-01 (Coremail) with SMTP id qwCowABnOe2i0axqXE9ICA--.14577S2;
	Fri, 18 Sep 2026 13:52:35 +0800 (CST)
Message-ID: <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane
 disable clearing FB_EN
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Sep 2026 13:52:34 +0800
In-Reply-To: <20260918030125.315978-8-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
	 <20260918030125.315978-8-a0987203069@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnOe2i0axqXE9ICA--.14577S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWrXF1kJw48ZF43CF1ftFb_yoW8Ar1DpF
	4ay3y8KF4rXayj9FyxtFWvgFyYv3W7J34fG3y8G3sIvrn8ta9xWFy8tFyxta4DWrZrAF4S
	vFs29w47Cr1jkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jUb18UUUUU=
X-Originating-IP: [112.94.103.44]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_225244_948506_353AA126 
X-CRM114-Status: GOOD (  12.78  )
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

=E5=9C=A8 2026-09-18=E4=BA=94=E7=9A=84 11:01 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
> vs_dc8200_primary_plane_disable_ex() calls regmap_set_bits() on
> VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
> the primary plane on DC8200-family hardware actually leaves the
> framebuffer enable bit instead of clearing it.
>=20
> This bug predates this series: it was carried over unchanged from
> vs_primary_plane_atomic_disable() when patch "drm/verisilicon:
> introduce per-variant hardware ops table" split the DC8200-specific
> implementation out into vs_dc8200.c.
>=20
> Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon
> display controllers")

Maybe it'd be better to fix this before adding DC variant abstraction,
for easier backporting.

Thanks,
Icenowy

> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/verisilicon/vs_dc8200.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c
> b/drivers/gpu/drm/verisilicon/vs_dc8200.c
> index f72da10295e1b..25b5906a1c5fc 100644
> --- a/drivers/gpu/drm/verisilicon/vs_dc8200.c
> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
> @@ -70,8 +70,8 @@ static void
> vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int out
> =C2=A0
> =C2=A0static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc,
> unsigned int output)
> =C2=A0{
> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> -			VSDC_FB_CONFIG_EX_FB_EN);
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> +			=C2=A0 VSDC_FB_CONFIG_EX_FB_EN);
> =C2=A0
> =C2=A0	vs_dc8200_plane_commit(dc, output);
> =C2=A0}


