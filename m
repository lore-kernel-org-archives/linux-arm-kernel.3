Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D006C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2racLDTZ4BkogFjHmNJhfnBse5H17sx7z3H/zKT9ZY=; b=NT2W+Idd1cmGZjpXHpKYHLtJma
	WUP55xGYuAov4tZwxWBYTQoaOZzjhlxP2WYoD6im/ItrZotxtX5cPo9s4zKxVy+J4MMefUPinOlss
	/pA61b/EItW/Rw1PqUXZ3ow+riic/UuZkrM298Gf7sAhoYpRCe169hEJvTzuVbeDb75aE2RqBxXZM
	WC0cz1IM7ZTPgclIwQQ7vhRODrO8oqCR/ffDg8Kh2OTJinYUIVV+mS5W+j9tkPJN0Z7qyzfLxl7qE
	n51QfsKD2QA8UKlQNNHLS99ZW/mircc0YBrSBYJ/tucmOClyfBkSkwpy4+mqW7oMQo3OwjvHfN17G
	Irk8tOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KhK-00000008XEk-3G4R;
	Tue, 22 Apr 2025 20:58:30 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Kdq-00000008Wsp-2y0x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 20:54:56 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c542ffec37so535456585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745355293; x=1745960093; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h2racLDTZ4BkogFjHmNJhfnBse5H17sx7z3H/zKT9ZY=;
        b=OpY8RTixHKUWwyOvzxz0CSKjDF5yUkIAeltj8hzfl+fKiopSwlJARCxCfcRMthi8uY
         VQ4B7RBkXaU/kOKVC7W0uRC86S6jWP+oLxRCS5zaJzw5oR7stoTfPkYe71zP1v5obMuu
         jkug26KraS5tZdtEiAEpOEJ7rZL9h4EwXxoDNv2NGZ1ZhwoECQ8GDz7b8mgUgHWMGSVL
         aLKCkwjIEP9Z/X8OFNfDyoqJ6BtlEx4koax/MnJs78BXjGxopmhoOpHkttdoqQ321Qdj
         mT6SP88MvXTN7LvaaSY/M+Zil5bKbKqFwZf52H1EdTgr169GmX9DpLCZKEL6ZibWY64Y
         tCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745355293; x=1745960093;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2racLDTZ4BkogFjHmNJhfnBse5H17sx7z3H/zKT9ZY=;
        b=T5SfRyr51CgoXEOZPA6vxCjm6yU/sQV6kQr9G2yqfOOMefypXbro3abUP2WYOTvidJ
         A6lt5ibJpN1sx3Wok0yfIWCpnejwMrYegcME1M02iPXI9Y5kEi76gxJi28JW7hsh+JSX
         GekNhhaeNZHJj/v00nOMW0RE21yN+vI8f0Hk/3c7Xn2PCMuSt5M5zt3qJQ3kambJyssw
         blC0VN5Y9hCMlzdjqflqEoHbt6EO3/QIEb/jWXCexyE6Si55pwdlQVh+/cwYh/HWlHoD
         ombTwu1uk5Y2WW7cayEnx1zesOYBCXy2I5G+kOHzPybBwLj6A65G0hH+aL8NOxS6iZlW
         AorQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy+oZC9kkaxQEklevMCBo4+ylx0112EXVJjhjH9kQMaUFWCIaGADNhb9jfT5Vy8pFD8AMDhGLXKZEb6EGknKU/@lists.infradead.org
X-Gm-Message-State: AOJu0YwMpDCrSrjXMkWxSJZw1Cgfdy8fjV8IJNrbTBmBAUDJiKVlLkeW
	gBcTmRo9G80e0et27aWyYuDqXcwWU6sHEEg8ZfBi+fNxsenOFxgzjwnbHcGCBk0=
X-Gm-Gg: ASbGnctUhNUCo4zNxzf7UCmJiWELVnD+AxogingiUes/PZHREyCnwkDR1kUJp9UiwQ3
	4uvif595iV9Ls5UC7hdlwdBxxUzhDI1o/fb/OZhawghSRzwb3sEwb7ro82F8zgg2SOSr+56BJp4
	Q53WiahtIcMhhAFY+IHGVgak9AfXRNcsQe7EkDY760IQUGERz2inxWgJoi3qIC6zqJ1+Q1kIDAI
	TqriW331YMyHuVuBqX4bqu6c5GSTFCg2rhG35MrJrz9NQX8+rY6Jy4Q/Iq5To7rn2PcItKSpRPq
	itvQXWDCK0+kV+WW97vNvQE+WirA8rE5J/EkzBErww/I4w==
X-Google-Smtp-Source: AGHT+IG7H1gakbIZ84kGicq0NVQy0jmgb+jY1czwu6X0ujlQIaddI3Iuf1eaCrSBqUaX2okXmWyUXQ==
X-Received: by 2002:a05:620a:bc4:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7c927f76f3cmr2993734385a.8.1745355293398;
        Tue, 22 Apr 2025 13:54:53 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b778b5sm595240385a.102.2025.04.22.13.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:54:52 -0700 (PDT)
Message-ID: <a2cb7a26f120558ab7b84a6f954188c8e61f37a8.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture
 decode
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Hebert <nhebert@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 16:54:51 -0400
In-Reply-To: <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
References: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
		 <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
	 <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_135454_984480_82FFE04B 
X-CRM114-Status: GOOD (  27.72  )
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

Le lundi 17 f=C3=A9vrier 2025 =C3=A0 14:28 -0500, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> aLe lundi 17 f=C3=A9vrier 2025 =C3=A0 13:45 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> > Hi Nathan,
> >=20
> > Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=
=A9crit=C2=A0:
> > > Mediatek devices that support HEVC also support the main still pictur=
e
> > > profile, but today, the main still picture profile is excluded.
> > >=20
> > > This removes the skip mask for HEVC, and enables the main still
> > > picture profile decoding.
> > >=20
> > > Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> > > ---
> > > On Mediatek devices that support HEVC decoding, HEVC Main Still Pictu=
re
> > > profile is also supported by the SOC and firmware. However, this
> > > capability is turned off in the vcodec driver.
> > >=20
> > > This removes the code that disables HEVC Main Still Picture profile
> > > decoding. Validation of the decoder has been done via V4L2-backed
> > > Android CTS tests on an MT8196 device.
> >=20
> > While its nice to know that you are working on upcoming SoC, we need
> > confirmation that this is working on all the upstream stateless
> > decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
> > which I can see has merged support without the linux-firmware file to
> > go with it.
> >=20
> > I'll wait for that and Yunfei's ack before picking it. Yunfei, please
> > fix the situation with 8188 in linux-firmware, and CC me.
>=20
> In case this is useful, we recommend providing fluster scores for the
> codec, which in that case runs some public ITU conformance vectors.
> Since most of the testing has been done with GStreamer, you may be able
> to find old report and confirm it it works. GStreamer does not
> currently filter the profile/level (on my todo), so it will try anyway.
> IPRED_B_Nokia_3 is the one vector in the base suite that expose that
> profile.
>=20
> resources/JCT-VC-HEVC_V1/IPRED_B_Nokia_3/IPRED_B_Nokia_3.bit
> =C2=A0 Stream #0:0: Video: hevc (Main Still Picture), none, 1920x1080, 25=
 fps, 1200k tbr, 1200k tbn

Ran the test myself on MT8195 and can confirm it passes if you ignore
the profiles.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> regards,
> Nicolas
>=20
> >=20
> > regards,
> > Nicolas
> >=20
> > > ---
> > > =C2=A0.../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c=C2=A0=C2=A0 | 2 --
> > > =C2=A01 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcode=
c_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcod=
ec_dec_stateless.c
> > > index afa224da0f41..d873159b9b30 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_s=
tateless.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_s=
tateless.c
> > > @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_sta=
teless_controls[] =3D {
> > > =C2=A0			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > =C2=A0			.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > =C2=A0			.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > -			.menu_skip_mask =3D
> > > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > > =C2=A0		},
> > > =C2=A0		.codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> > > =C2=A0	},
> > >=20
> > > ---
> > > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > > change-id: 20250211-enable_hevc_still_picture-26b35eb08270
> > >=20
> > > Best regards,
> >=20

