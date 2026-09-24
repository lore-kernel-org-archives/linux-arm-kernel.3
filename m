Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B1EC982FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 05:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=; b=VN9xlOb1iRBdWocINvURRpdWXV
	7fayw6fCCmxRCzCudVx6pn9IwMYXd7QXVKd8XM5DxoKVg+QyipJSTXSZFvYZgRrTY1lh2sxzJ3R2S
	27bOJtNR0+qDhBF04B8yYU8GPxH4+/zLU9VKJ9ogtF/sSB1ab9GW2LeYl8fPvk7d3t5hpWhsSVJ+5
	vOBUknK1NKEa/9tUaSyX/nHEg8AqIE+az+b7SmUMv3e9D3KStLkPQ1glA8cXt+OPdUurKjPPLg8WG
	nlNRhAYmQ+w6x4V4Q2dNXmR0D1ZwGqcyo4rE+dqTuohP7nqRWwsUYOnnpQ8VjmkYMFksxnH4KmTom
	feO4u6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9c2a-0000000A3rQ-20hy;
	Thu, 24 Sep 2026 05:30:40 +0000
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9c2X-0000000A3r5-3PJv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 05:30:39 +0000
Received: by mail-dy2-x10.google.com with SMTP id 5a478bee46e88-328664ef78fso1035704eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 22:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227837; cv=none;
        d=google.com; s=arc-20260327;
        b=SP0hyuphwsQe5wbML/tXKoGb/rOGMBm5STbfqEep916+jOY9UTSqFBFdZHGt55fRAE
         SOGzxJinLlP2b6Vky3pQFf7sKRoK15mpVucc2yPsvUpLOvOQcFuhtnkz6tydQIdWdehv
         Mh4+9CNndla7FxWzVOJuJC23jCoPPf3LNkvEqD54mnc4l5RmkTs4KuyfgIUoMC6Clh27
         VuRlHOAzpzIoqrlt9G2u5/0Qg4OAqnTWXKWiGj+J1G1MmEQ2UHe4oFDAdTv37HTpsqmM
         eYfXkWiHIhXMlVxF16ewWVoXm9o98Pc2/266B0vMx7mgZ3Nihf+G3WHpHzI32JWH1D8S
         2MuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        fh=hxjKjSG4RfcmUMOcUkPt8fzPQ5GIBUmPla7oLtNWy4M=;
        b=GdWTeCnFyJCrWcpVvdwga8r8qNcHTEdO7KNEAuy5esSBF/VAsga56wpRSwE0+zye3P
         j3KDjer96n4dmXmIauKzQGFttmLrBdTtbTYG9c8tOhN/ZMudwvr1EZbPsx9qdBOc79Ji
         zcMbYo/JZitZzQemF8IapKQgNzN+43Ca4Ucvx0Rjd5c9H2fkJOzh6pvUdqaTkNeWVnS3
         sLuDYy0bDVx1VSBriPzIg28KcNMfUVu6lTITMcVwZL7T9UemQDWDuocPWLxXhAldtlq1
         F06ZxR4s6GkNjtqt0BCNgThqUtBn87OGWhflCrFrXkqbAutWn68bcXo5+n+J1UhXbZ8w
         0hHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790227837; x=1790832637; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=bw2FlB3ql/LRaxMzeYsgF2KLiyO0LMX+6rhZvYD5Q/vJ507/VmZdfAvKE2ywDwvSFN
         YTfFx/iXdgVhzmq0J1Ygh58RIazvobIYMVzmxzn8sh3mZYOzHtNhXox+aN+FwWIcBXoc
         6Cs9+HjmmGi/usmTwe+qYxsrIe2kswHSM3Nzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227837; x=1790832637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=RUUn1n0KQqTBd9a7IVQIeoQ4pyma1JYyEb+DuyvwKyiKlFWAgHe7xoSc39dOXaQ2/2
         BGYlIzFQ2z84Yw7JauCS0fv5zERZpC5MzvVeAarviHQmjrwxgzLrx38ahMtg4qV7K8TF
         wE3JMJQJ+XjZeAhrrdVEBfgUly+qFpRRQDR5mi2jehxSrhju0ePAs4oRW5irqAVl0vlZ
         MTD/2MU6T+2Wr1d7c3MtT8zhaMHuWWtMK3Z+SL9cIlgsSHWQaYA7JSyD48AMwlt5Ridb
         Ykc+4d66pBRJ1UVIWmKqz69Bx7n98Lz9KuKh7vQ4zQGz7Zg31MlqYWOnrz53Ij5+2Nju
         eFrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+wT9Lf7L8uYrbia6IvIzmMbzAmfj7CJUxaNRv+gTtJ0RCymeZnSyqWoOUQFHztDIO5dLtt3BOvpugfUsArZsc@lists.infradead.org
X-Gm-Message-State: AFuF++kzqB37LCQgctOVK9vTvLKXpeOr2DO5Kwk+WX2lBZIT7lJrbX5X
	2g1OFnz48GGj1O2CgPS+fJzo3Dz8o4YX7QhrbyllHSX0oExSUM6fGbJ0k6jFesHGexMUlyaSeVe
	IvrQnHKfXUgjqPZldCdcSxzDhNQRcOsTv4NgveblNgg==
X-Gm-Gg: AYBFou3mpva9bQktWtgI6D5QQtw3+wy/kfLcSCylbQBUagMuQkp7YxBBgWL/73K17GT
	ox5k/eNH6g8YVixlmvM+IzsG03HkvoKMJItXfsT0eZxq26hSSgGRYahbJ3laW8y/NlVLtIY6MCX
	hkY0peIY6CfV9wf9gWg7SNBVWp0cX2oXT5NQWe/y4LnmGHP4C5dQtQxtp1F/ECZLJysALDIf8dq
	Wkb/MKazmAISCIA/AiMeSu6poYIE5mJBpB2CIv5iqrcdvjtFM4FwXj46WJNgt/srQYxhtZ+dvi6
	k+iiBKl+x9KqP1xxnaAWFR2PjXt/Igw9S/JIveVet2VXlXz+9FwsQD9a8/DrCU3AQ9tNhC4GoqG
	LXUGQu/GlbQ==
X-Received: by 2002:a05:7300:8d14:b0:33b:e264:362a with SMTP id
 5a478bee46e88-34004a89a19mr1123625eec.13.1790227832039; Wed, 23 Sep 2026
 22:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com> <arQxC3DmDyVIGdqq@collins>
In-Reply-To: <arQxC3DmDyVIGdqq@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 07:30:20 +0200
X-Gm-Features: AclHuK9fIcxWA7Sv69t_uK1zMqbihMAU90hONvsInRjWG6YY9lFMwau8XYvA7qg
Message-ID: <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_223037_871207_FA1EF835 
X-CRM114-Status: GOOD (  18.39  )
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

Hi Paul


On Wed, Sep 23, 2026 at 10:05=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Michael,
>
> Le Wed 23 Sep 26, 14:10, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I tested on px30 and achieved working H.264 encoding with some small ch=
anges
>
> That is a bit surprising, the Rockchip PX30 should come with a Hantro H1
> (using a modified register layout) while this driver is for the
> Hantro VC8000E, which is a newer generation with very different registers=
.
>
> Maybe you ended up using CPU-based decoding when testing?

Using
>
> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

I have added your patch to gstreamer

v4l2codecs: add the stateless H.264 and VP8 encoder elements

Backport of the encoder work from the branch v4l2codecs/h264enc of
https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, based
on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
uses.

Generate the right element and encode stream:

gst-launch-1.0 videotestsrc num-buffers=3D100 !
video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
matroskamux ! filesink location=3D/tmp/t2.mkv

And playback over Wayland.

Solve some problem. I have implemented:

const struct hantro_variant px30_vpu_variant =3D {
        .enc_offset =3D 0x0,
        .enc_fmts =3D rockchip_vpu_enc_fmts,
        .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
        .dec_offset =3D 0x400,
        .dec_fmts =3D rockchip_vdpu2_dec_fmts,
        .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
        .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
                 HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
                 HANTRO_H264_DECODER,
        .codec_ops =3D px30_vpu_codec_ops,
        .irqs =3D rockchip_vpu2_irqs,
        .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
        .init =3D rk3036_vpu_hw_init,
        .clk_names =3D rockchip_vpu_clk_names,
        .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
};

I have advertised the:

       {
                .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
                .codec_mode =3D HANTRO_MODE_H264_ENC,
                .max_depth =3D 2,
                .header_size =3D H264_ENC_HEADER_SIZE,
                .frmsize =3D {
                        .min_width =3D FMT_MIN_WIDTH,
                        .max_width =3D FMT_FHD_WIDTH,
                        .step_width =3D MB_DIM,
                        .min_height =3D FMT_MIN_HEIGHT,
                        .max_height =3D FMT_FHD_HEIGHT,
                        .step_height =3D MB_DIM,
                },
        },

Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399

I have a small change only in the common part. Hope that it's a bit clear.

Michael

