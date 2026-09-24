Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4221C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=; b=Xk4+pmyrgyFibeOjsgXGB5HZi9
	UgjA+8g5kkWQHDuELQ6ep7lUCUtQ7Xe8xDyZa75lLBmD56+yd6WOtc8n0UkiwwE7Goaxt5w8l+UJC
	pipI9+SL8FHEIW7IYVBJXftTySy7uVjE+qRNT8s/qd8fq7KsSemAqwKHh+cpUXUyWHrohFbFfVikD
	5J+n+LSltIPaH2/nGpuqyz+lwJF+t3EXRZ0juRGWFCWhC8BqorDAh5DPVRUliSwj7NaXEoWnOu8z5
	KxI7QDrc2eqBRU+XKIEQZBn0KOrZK6Zp5VFNlz50j2xr6WNZGKshQ+wG/l2yN6tmdas/WAuMN58gr
	7WNgTMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pHA-0000000C3Jq-2CCK;
	Thu, 24 Sep 2026 19:38:36 +0000
Received: from mail-yx2-x28.google.com ([2607:f8b0:4864:41::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pH4-0000000C3HF-1QXr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:38:31 +0000
Received: by mail-yx2-x28.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso310996d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 12:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278708; cv=none;
        d=google.com; s=arc-20260327;
        b=QSdMn/Al8h2mo/Ja1f4s5YurNPlnQ+oOoyBfly4Fn5b6rrHVs/Z4Dlw8LViQ/CXefb
         lsnaM5lzZoBHUhlYgT/KNCBNnoo/zRCYoGMvEuT+4VzXb0RmoGJFjU8tJehAW6YWe3TA
         2dvmayKXGY/wuv4U5r0JvuvX5jI0HM+l7cNfGSHh4Bpn3SZnYQJ7Pa2FDfUAazCWfuef
         iaZ3jUWCrsfDLtemNhyrps4UGsKr8nfofK2sjIrFr8ENiafs1ipnqZDc4urWzudDBQGZ
         uwhi7bwQa7e+lQC0kEz//+mF58XCtdMhSdh0vWiinXyprZ2VLnCdTHe1tyIlLNb8HsoS
         LLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        fh=9pIMomtwtWOnwei0vxJhF0z29NhkCmZD6rqHpYqLgXw=;
        b=bjweGmjijedgJVU756POvkfISumxHNV796nIde6G6kW2GUvZfuEVek8Nav4LDIqxsN
         Ngwp7YdVFkgC6KemzDW7nfN6VN8sFJ+PZ2u3PZqGtbYzB6EMuCwQZU7nvJVX+jSrGdM5
         kjIyIN1VoxLpkwyHDwPj4BLFzv0TdTMxA0SrwVGCQBcETkWiCXfXYdRYgKvFngz9YdyT
         XCRsyKn97XuGNN1QjNU7qtE/STdTZVafzurKKRYrmGF21O98y2In2D3E5eMtECSGhLwX
         BQUX8NGSZWH7K3pOju91UZcwwmqPDXG7AWry8m82zGdAHC7SSD7yX/m4CubHwS17q174
         VC+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790278708; x=1790883508; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        b=GZNHBLivGylxIH7IEYvUWiPe3IPBX0Vj6mLF+Csdy6p9qX3pz6FFBuYQ2Ct47QCNzd
         R9fIC9tCpXr8Kojl23ym3f8Ccg9sW126VCUj2y9eRGnqlb0x8CRUa6uel2ooWnM8Tpr+
         RdgntBs4NJYSJnU7TLol8Jig8thqo5pbvpDZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278708; x=1790883508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        b=sPldCzScDxF3XkUjGIi+I7NQBWmyQ5ZwbCWb7H67ZjfVVOFHhIFknfzHmt3KKfHONn
         HFv8ZfPmoBdsOdbqsJESI3RzHnKbsj7/OM115HNtz5xDUVY7YMfisu9LWGgiXq9aa4HF
         tchr20XiTqHRLRpENXME9PyUhWfPHC9LusCHycsJzoUlVJH7bsXyMcgxohu0SZyzCdkU
         ZYjHK+7kf3GqHeynCKnKBjVkrIPQlNZ/9l6AnLWVdXrj7LPs6Tpb4hvE2TwgSHX3wsO5
         ATQp2XPW0mtlz86WWVuLIfMovlRHXRZzhVeiaQ3h4ekPk9zIsL8XchIzb8SbUlY7VNVC
         PyQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXGLt5iRPCZuTF86gdGwkBWYDsN+IyB9l7uVHJp0WgxzQpPmOZo5fBpbyk3/D1KYqjP806LEoLVcAEBEdPW/85@lists.infradead.org
X-Gm-Message-State: AFuF++mGnRZl4kbmpGJfaq8yuWTCPGgwZBo3EcM/FAQtpPmrQ4cgPehW
	lcVJKBoC2Qx0QX4dvSyxdTocce/nlKJxCeYlnDK+v3lOH9RTS7mEwKxHXfL0gZ0kNlKnVgGjzev
	th1Upavb80e5eh6dOap8TVNKvXa025Zlxtw0S8vYB9w==
X-Gm-Gg: AYBFou1OqqDzvn7PNO+dQJoERSGP2bDzwSYP3LPUX4YG5TunhvmXR+NG5EyaRCEKtdp
	eMAwXuG9IbNrcJT7Uy4ZjdFJoke++NuHDl87T7LthwyS+4a6fo4MSGRfoNH+nw7NIVEUkPN2nJr
	iKbWuWM+XIGUiX76fKy07rdonh0cEOQX0hOM6aC4gUg5n/EjXUDq5CW7R75rjsafJOuStb9BfAV
	3ScPts8io0rmy8nza6aO7+XnnMsP67PhGVzcUAAVvUFjIcr4D8sOZcGyK5oeC/+fCe9BxkvVQk5
	Qo+sKkFNw5pv9Dw0+ZY5bOBVLKPhlWhOaF7Zb2Q7+NBY2E7TLZ14IAKkpgPFJK3By7ZGeAd5u9r
	7BVHtgA5Ekw==
X-Received: by 2002:a05:690e:d56:b0:671:4d9c:91bc with SMTP id
 956f58d0204a3-672ed3b8549mr1938576d50.78.1790278708232; Thu, 24 Sep 2026
 12:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins> <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins>
In-Reply-To: <arVnQmik-CveaAkY@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 21:38:16 +0200
X-Gm-Features: AclHuK_bBSWqL6tBSki95SII0DxHlrmdAk4MDI9hfl1lTZlay91QzSspJUrifKY
Message-ID: <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260924_123830_427597_AB4F8C98 
X-CRM114-Status: GOOD (  25.46  )
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

HI Paul

On Thu, Sep 24, 2026 at 8:09=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Michael,
>
> Le Thu 24 Sep 26, 07:30, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I have added your patch to gstreamer
> >
> > v4l2codecs: add the stateless H.264 and VP8 encoder elements
> >
> > Backport of the encoder work from the branch v4l2codecs/h264enc of
> > https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, bas=
ed
> > on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
> > uses.
>
> Yes this is the right gstreamer branch to use here.
>
> > Generate the right element and encode stream:
> >
> > gst-launch-1.0 videotestsrc num-buffers=3D100 !
> > video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
> > matroskamux ! filesink location=3D/tmp/t2.mkv
> >
> > And playback over Wayland.
> >
> > Solve some problem. I have implemented:
> >
> > const struct hantro_variant px30_vpu_variant =3D {
> >         .enc_offset =3D 0x0,
> >         .enc_fmts =3D rockchip_vpu_enc_fmts,
> >         .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
> >         .dec_offset =3D 0x400,
> >         .dec_fmts =3D rockchip_vdpu2_dec_fmts,
> >         .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
> >         .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
> >                  HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> >                  HANTRO_H264_DECODER,
> >         .codec_ops =3D px30_vpu_codec_ops,
> >         .irqs =3D rockchip_vpu2_irqs,
> >         .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
> >         .init =3D rk3036_vpu_hw_init,
> >         .clk_names =3D rockchip_vpu_clk_names,
> >         .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
> > };
> >
> > I have advertised the:
> >
> >        {
> >                 .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> >                 .codec_mode =3D HANTRO_MODE_H264_ENC,
> >                 .max_depth =3D 2,
> >                 .header_size =3D H264_ENC_HEADER_SIZE,
> >                 .frmsize =3D {
> >                         .min_width =3D FMT_MIN_WIDTH,
> >                         .max_width =3D FMT_FHD_WIDTH,
> >                         .step_width =3D MB_DIM,
> >                         .min_height =3D FMT_MIN_HEIGHT,
> >                         .max_height =3D FMT_FHD_HEIGHT,
> >                         .step_height =3D MB_DIM,
> >                 },
> >         },
> >
> > Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399
>
> Then I guess this is using register configuration from the earlier H.264
> encoding work that I've done at Bootlin, adapted for the new stateless

I need to check mpp code too

> encode helpers? That part is probably not quite trivial, which is why I
> was a bit surprised.
>

I would like to clean up the patches before sending, and check all the code=
 to
not make trivial mistakes. I'm not persistent, so if we aren't, one of
my colleagues will take over.

> > I have a small change only in the common part. Hope that it's a bit cle=
ar.
>
> Yes in comparison to the register configuration code, the platform
> changes are rather small indeed.
>

I wrote this email to state that this change would be impossible
without your work.
I'm currently working on other things, but I had some spare time. Now
apart from that,
I would like to ask about the status of the entire proposal and uapi change=
.

Michael

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

