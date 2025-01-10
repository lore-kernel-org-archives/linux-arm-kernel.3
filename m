Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9B3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9g79eEr03zcR3C0me3t/ZaJgbQfeT6rUS/5evYzFcY=; b=mT+bSvs568ZKsu8G7Sd+U4YB28
	ywc5Fe2/x0xQe2TEhfiOehW5BTHOcjUkDw7l7UdvnLULhZ1EWMoQlbpaPQQLHuwvlp09qUtYpAcrx
	v1Z3sld+im/dEJlUCArqX+Ruj+qW17rYttFzWKBL+7mAqXmhbw3gcp8i8oKRQiMAsJzVkxLbKy0ud
	RpGnyBehK3suQJDTSC5lPq0Q3DO2ltRVv12jXb0DOYT1l+bXaaycx0p1w1jd9CnQ/GBO0BIZBvcU6
	A6NSui9847Gtp9K2XZhvwzM9pfyIJBwixatnjIevn2D6JTBYajTiCy65iMURh3/GviSzOt55xZSn8
	okJetDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBT4-0000000ElLG-0wxl;
	Fri, 10 Jan 2025 09:38:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBQh-0000000Ekhj-0tuP;
	Fri, 10 Jan 2025 09:35:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso13446695e9.1;
        Fri, 10 Jan 2025 01:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736501745; x=1737106545; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9g79eEr03zcR3C0me3t/ZaJgbQfeT6rUS/5evYzFcY=;
        b=bDuKpZbqv7LjysyVYWY0tZxB4dO2AS2b0TKJuhejFN9yiykvh8NyY4JPT7brVfXtPD
         w91g8puy7k1kxw9F6CrWwPu3LfAfobYXBDu+tT6MObr6CqMYiY1vYqEz+Wwda7VnM5i9
         0moqntd/4wf26xHV8pAOVaqvDn6JeSqxbrrNowXh3QCcX+5+gtyNfyaqXnbYJMdVCP7G
         +KKlyrsgkXemk7f1ageMKx4BspmEMBpP1hiMHqjcBQYfEyUjDK2EdchvN2V6cAUJEyf2
         raxZ/2d+O0c9BiuGNuP7KGSjtWh7ilUAllQKwYtWKL+U74Z78vHB8+hN9a9oMjAXoPiY
         rl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501745; x=1737106545;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9g79eEr03zcR3C0me3t/ZaJgbQfeT6rUS/5evYzFcY=;
        b=atW6leymLlcXUjWb4hWO+M68IKqc6vR1Ft44ryaciMBhY7JQoCnaNmJVi/3EYoy//w
         mDe9zLAxfo3mLXfgj8wMR9m37KJP2G+Po1IzqWgxb9dobW1BrVR60pndROIZqXbw+fC4
         wskBLrdRi7QB3NmjB/HbRbXDzy9InYSqpg331GNDR8LeH+itzI/CFOU+mHHtuQ8oiQV/
         nwXpWrGwfOJN6yg7uxDNr/7NLlzmslkUc5eCKeZxuNXyY5T3z7b3PqfED6WOyf9nBJm5
         WG6dM0brsZcFS6pT6VSWMTRzPHonsQJ0eP1DtM6A8/GqRXuvJg9w+617qGGlf3OB/u1f
         3gew==
X-Forwarded-Encrypted: i=1; AJvYcCVtjzS0CkRShWPRRnNBsun/6W+DhtQfyEoXUzF/Jc104wI9baTHV2KrZz8trUEpuK00J2h9mC6y6cmgQNuk@lists.infradead.org, AJvYcCXWhw5b1It/U2e00Rwcm9yIU1pyXdPZw1HEnajj85GupQ+Yof18Oy07rDUhtW8TBKwBNDdLehCp6QkGFzTKiyqkpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQuEoPbH+3ypmIMRliF4opVjZv89YZrZcQ9M3V+0DodMK8Lrp2
	qjl16QU/XuB0bLZ51bJwrDsMb4FhgsYq08mRBioSjS8S9mBlknHW
X-Gm-Gg: ASbGncs7nxRpyk+FuDzVOgiRUWKdw5BcAj0hEF8Kcxg9/B7y+x1lhAVXDBBz42fyrAZ
	ejwq6qzXlb2pfbNmuDjMGrsT+Lx7/KRxaD+FpB/irMzqJR+N/+raCvg9xGF4rtSI+ywW9O9Ftzg
	M0jXusJrvJRiGBjD/XOSihL7i74e+EbmNBDaNWgtmLutkJ3xOLB5ZZeBXcuAqN2L42GPTq3X9BJ
	TEu+pF9UE6OGipncip3qFCPTlhed7J2qZH3zqkekbQ5FjqmyfzrtCJSWy8tb2DEybSTNg1eZaNF
	AJM=
X-Google-Smtp-Source: AGHT+IHwl7RTDk7XCHgavjvPYzyw0+x62aQxSFel0BV13NUnPSIe70GA9HfWuDf9a/COfDkzjSeDxQ==
X-Received: by 2002:a5d:6c66:0:b0:38a:4184:151a with SMTP id ffacd0b85a97d-38a87336d7emr8612113f8f.37.1736501745179;
        Fri, 10 Jan 2025 01:35:45 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4084563f8f.56.2025.01.10.01.35.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:35:44 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250110-flat-quantum-frigatebird-2432f1@houat>
Date: Fri, 10 Jan 2025 13:35:30 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <048FF805-BF7E-4D1B-B522-E783415057BD@gmail.com>
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
 <20250110074458.3624094-3-christianshewitt@gmail.com>
 <20250110-flat-quantum-frigatebird-2432f1@houat>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_013547_254738_AC055FE8 
X-CRM114-Status: GOOD (  20.90  )
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

> On 10 Jan 2025, at 12:36=E2=80=AFpm, Maxime Ripard =
<mripard@kernel.org> wrote:
>=20
> Hi,
>=20
> On Fri, Jan 10, 2025 at 07:44:58AM +0000, Christian Hewitt wrote:
>> Playing YUV420 @ 59.94 media causes HDMI output to lose sync
>> with a fatal error reported:
>>=20
>> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
>>=20
>> In meson_encoder_hdmi_set_vclk the initial vclk_freq value is
>> 593407 but YUV420 modes halve the value to 296703.5 and this
>> is stored as int which loses precision by rounding down to
>> 296703. The rounded value is later doubled to 593406 and then
>> meson_encoder_hdmi_set_vclk sets an invalid vclk_freq value
>> and the error triggers during meson_vlkc_setup validation.
>>=20
>> Fix precision in meson_encoder_hdmi_set_vclk by switching to
>> unsigned long long KHz values instead of int MHz. As values
>> for phy_freq are now more accurate we also need to handle an
>> additional match scenario in meson_vclk_setup.
>>=20
>> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>> drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 =
+++++++++++-----------
>> drivers/gpu/drm/meson/meson_vclk.c         |  3 +-
>> 2 files changed, 23 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c =
b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> index 0593a1cde906..fa37cf975992 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> @@ -70,12 +70,12 @@ static void meson_encoder_hdmi_set_vclk(struct =
meson_encoder_hdmi *encoder_hdmi,
>> {
>> struct meson_drm *priv =3D encoder_hdmi->priv;
>> int vic =3D drm_match_cea_mode(mode);
>> - unsigned int phy_freq;
>> - unsigned int vclk_freq;
>> - unsigned int venc_freq;
>> - unsigned int hdmi_freq;
>> + unsigned long long vclk_freq;
>> + unsigned long long phy_freq;
>> + unsigned long long venc_freq;
>> + unsigned long long hdmi_freq;
>>=20
>> - vclk_freq =3D mode->clock;
>> + vclk_freq =3D mode->clock * 1000ULL;
>=20
> You should be using drm_hdmi_compute_mode_clock() here

Hello Maxime,

If we=E2=80=99re talking a one-two line change than I=E2=80=99d like =
pointers
and guidance on how to go about that (offline to avoid group
noise). I have only rudimentary c skills though, so anything
that looks like replumbing a driver around drm_connector is
way beyond my current drm code and general coding knowledge;
I can only offer a fix not a proper improvement :(

Christian

> /* For 420, pixel clock is half unlike venc clock */
>> if (encoder_hdmi->output_bus_fmt =3D=3D MEDIA_BUS_FMT_UYYVYY8_0_5X24)
>> @@ -85,8 +85,9 @@ static void meson_encoder_hdmi_set_vclk(struct =
meson_encoder_hdmi *encoder_hdmi,
>> phy_freq =3D vclk_freq * 10;
>>=20
>> if (!vic) {
>> - meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
>> -  vclk_freq, vclk_freq, vclk_freq, false);
>> + meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq / 1000ULL,
>> +  vclk_freq / 1000ULL, vclk_freq / 1000ULL,
>> +  vclk_freq / 1000ULL, false);
>> return;
>> }
>>=20
>> @@ -107,12 +108,9 @@ static void meson_encoder_hdmi_set_vclk(struct =
meson_encoder_hdmi *encoder_hdmi,
>> if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>> venc_freq /=3D 2;
>>=20
>> - dev_dbg(priv->dev, "vclk:%d phy=3D%d venc=3D%d hdmi=3D%d =
enci=3D%d\n",
>> - phy_freq, vclk_freq, venc_freq, hdmi_freq,
>> - priv->venc.hdmi_use_enci);
>> -
>> - meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
>> -  venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
>> + meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq / 1000ULL,
>> +  vclk_freq / 1000ULL, venc_freq / 1000ULL, hdmi_freq / 1000ULL,
>> +  priv->venc.hdmi_use_enci);
>> }
>>=20
>> static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct =
drm_bridge *bridge,
>> @@ -122,10 +120,10 @@ static enum drm_mode_status =
meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>> struct meson_encoder_hdmi *encoder_hdmi =3D =
bridge_to_meson_encoder_hdmi(bridge);
>> struct meson_drm *priv =3D encoder_hdmi->priv;
>> bool is_hdmi2_sink =3D display_info->hdmi.scdc.supported;
>> - unsigned int phy_freq;
>> - unsigned int vclk_freq;
>> - unsigned int venc_freq;
>> - unsigned int hdmi_freq;
>> + unsigned long long vclk_freq;
>> + unsigned long long phy_freq;
>> + unsigned long long venc_freq;
>> + unsigned long long hdmi_freq;
>> int vic =3D drm_match_cea_mode(mode);
>> enum drm_mode_status status;
>>=20
>> @@ -149,7 +147,7 @@ static enum drm_mode_status =
meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>> } else if (!meson_venc_hdmi_supported_vic(vic))
>> return MODE_BAD;
>>=20
>> - vclk_freq =3D mode->clock;
>> + vclk_freq =3D mode->clock * 1000ULL;
>=20
> And here too.
>=20
> Maxime



