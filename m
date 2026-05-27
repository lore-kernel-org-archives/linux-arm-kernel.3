Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F511CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=; b=OhqVAiTnNGiY8QPfpSl5MnwcSC
	pEr+tDE+nwcHqOv+Of8UD1w2yVFF1PXTCPcAfc0BPVQkJV86lFFjkLA8h9pp+wlWWdtwnrzoz+vqj
	e+CxO2nA4cSp/GD7cPYt1INcF8DkmQs9tWZeBV2t81h5L4viyPC2DZ+1HJJMIqGQnqJAp8X829xNe
	FcMh/EmvZPkTheh048yU9ul9nNYbsS5lKbyiFTj1nPxg7kEXT0NwNarAxXAYEzLR/FfMwoifonFAq
	wrKzHMoTPnB1920qw/+mhRTrAhJ3YHfoQ9sMo4TAe2UEZdJavod6EMgVhw/wyvsJ6jd7Z149L5F/x
	fiomI7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCq2-000000042JH-1t2t;
	Wed, 27 May 2026 11:54:18 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCq0-000000042Iv-0iUk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 11:54:17 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7e66f966d01so558618a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 04:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779882855; cv=none;
        d=google.com; s=arc-20240605;
        b=DPxMTA/E6vDtEbl9wCCEsYdBPIc7mnE946gjW9ZfLLm5EbR5+G8gK0RwVKFSesEGf3
         Y5J448OT9g/s5ycUC5wO8KJgKzn05c1jmAHdb4WNmfxVZCGIE3EVacMLuKKfEbu0vCdB
         a0zVGs6jCnOLR66sO+7HXdzy7SYaBgPxHY2ubXXTzmqweLtxLdaulCZAhCSZNsc6FTfx
         LBWFN5vbz6oXOvasUQPVA5v/J3HjD8u5ls5DBk0KcmQXHT4aAEoeVArfBz9cYAJfQdh9
         lR07pCAasBt+3+okNENwsNotY4qS/wio8CLeiNLoeGr8KuWOhb5dg5A9BX+Vc/aGGeLF
         GBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        fh=JWwQmIMxdraD44qsTMR51DkH4/FpZbsxO63OWiW78tU=;
        b=FUgQf9MfyS5gtQ5s/MVouHmntcRBwFlIgNxrP/+GG3Ca6ZAKWEb+gvfb22ybrzDjfj
         f0jAoJjW8nX+2tFAN/uoNTu4qXLktP4HXSwpwxpfKkcy/etgSU/hEtuiW7Fy6VZgwkue
         AtOXuc8SzfeiBAi4qVUmaQ9w+x5clzyfg78jOsAHbaZ1+ui8IK0xJmUGj8BhYWSH2Qlm
         TIcXZ8jedK4GZJDfADrAP723IaUkEZRsP6BRgESBCQbsWnzbpjraxF9iH9hOUAqztbnc
         b567+vOnac30St7raEIY1vZOFmcVxhjfvGvmHzpoAs+e5g74Wi9AWVDL2maKLgF5kyj0
         KNKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779882855; x=1780487655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        b=PNcvHGuYQrHC3OREkusM3zxRscnksLU5qZVUYttSy3IAM6KfSgr/EWmrtg+/xSV4d4
         dctWJXthx4MIC7+q14aODftECvOldTLCoo770LA/ypCKwDwDGKf9yXr1WEcHRUjayd2P
         mM7iGa+mbp3R1K1EiWJQBSeKDlGoxK5VM9zgpMgz3kw51VVUNjGXfAxKaIWPmE9s/Irv
         9536CYElYm835i0v1uYV9Fvy4z7upFVWis1TzPhmQNE5Fik7P1ay0vPo5ZHWbR1Alv0Z
         2XXVg98SjyVMije9sRjNSKKincJXFZfcb6m1JapCc+SElrgDvy5l3KMkrNIvBoND/qtG
         j5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779882855; x=1780487655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        b=Z19oGrBOCAnq+fdx6vQpCML7+9CRbR/Oiys9ZlIppzSMfBFB/N0ZANJCog237Ih6M7
         NizczPgy9LWfo7qspSxDviwmJff0D5adbCq/5qvCTnKipqPUpHXycZbeWhvugMbt8ZAC
         pHXRKHmYd2jwwucjzH8RI1IpJZ29TB3jzspmsokjU6j6+aeTOO+RgDZg6idtd50wCbwe
         8bU2gpU7bHIRPAd2R4YdwrYmHQ55gegW9PyTc3Tj9bcoGvbNWymYEMCqWKrV5qtOcxB3
         47BRCneBLMTlpScPOUfhJDff62p96IM4EdgF4f1pbM08DiSSVbcdszjARV/J8KzsoTfY
         1pGw==
X-Forwarded-Encrypted: i=1; AFNElJ8T1UyXaNAz/G0+lS4I8y2OGvpzH2EemV7nD+ofOFREkze16h/NA6crYBo5Tjc5ihI0WcA5B1wv0Vq/89DzJXDx@lists.infradead.org
X-Gm-Message-State: AOJu0YyUO50XdJ4O8gOUzcEj5q9skqplEKBSqG4lEb2fldgv17geMlgz
	oPi4rZmx1c90GRVU/h2En/JY9zJcY916GUuubDD6D6+pUPfKMcVS76ghb7wCnyDQrazr5IZjOvW
	iYIoaN/h6nsDPcP2n2PmqvjExceBnd7A=
X-Gm-Gg: Acq92OEWiskdlvtXLZLL5XV/vh3lqrRNqAnPQHWFrrrXlu5eY3YbsnQCMks36lJicj+
	S/Emz6V9M7dpPUFxPX2eeBuLJFTCJXw0qXCL0MHR7y8EcXRRDc39WEUxtIKUKn0cG4imSGBrVvK
	t0wUEIDCjlPOPLkAtiv5zCkfycRXOvL8IzH8TJR2iXxtpNKEyO3WkRHbxZiVBjgez9S2ZZtL3tT
	zOUREhF/k+yHEiFj5TmAEwkNDC3JyxkZxqurd8OT9pQiSYW2iGUlDcBtVeNjfRnd/sIOdCPVuoG
	ZafoQoR+xK9KyqPCHk/SSfRY73LKHnUmOBDgoOo/bxidnw2Wr2AtBG0VNNSx9mnGbQY=
X-Received: by 2002:a05:6820:4dcc:b0:67e:251a:bd3e with SMTP id
 006d021491bc7-69d7eb50ef8mr12523541eaf.18.1779882855023; Wed, 27 May 2026
 04:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-11-paulk@sys-base.io>
 <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com> <ahakVq7Fv78ODicG@shepard>
In-Reply-To: <ahakVq7Fv78ODicG@shepard>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 27 May 2026 15:23:44 +0330
X-Gm-Features: AVHnY4IBJ2USZh9zewtK1mpREASscLC7umJs8sYSO8dfl7Vqb2mCAkjyaVX__p0
Message-ID: <CAMxPZkjQGFxGeafUhCSn82PnWeRpW3YQ-5ZTZUwE1psTq2hJiw@mail.gmail.com>
Subject: Re: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_045416_227901_2FDCC432 
X-CRM114-Status: GOOD (  43.37  )
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

Hi Paul,

On Wed, May 27, 2026 at 11:29=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> On Wed 27 May 26, 09:20, arash golgol wrote:
> > On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-ba=
se.io> wrote:
> > >
> > > Use the dedicated helper to check possible pixelformats against the
> > > provided mbus code in order to support MC-centric format enumeration.
> > >
> > > Note that multiple pixelformats may be returned for a given mbus code=
.
> > >
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > ---
> > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++=
--
> > >  1 file changed, 34 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture=
.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > index a836fa7f081a..409c28621093 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct fi=
le *file, void *priv,
> > >  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
> > >                                       struct v4l2_fmtdesc *fmtdesc)
> > >  {
> > > +       const struct sun6i_csi_capture_format *capture_format;
> > > +       const struct sun6i_csi_bridge_format *bridge_format;
> > > +       u32 mbus_code =3D fmtdesc->mbus_code;
> > >         u32 index =3D fmtdesc->index;
> > > +       unsigned int index_valid =3D 0;
> > > +       unsigned int i;
> > > +
> > > +       /* Video-node-centric enumeration. */
> > > +       if (!mbus_code) {
> > > +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > > +                       return -EINVAL;
> > > +
> > > +               fmtdesc->pixelformat =3D
> > > +                       sun6i_csi_capture_formats[index].pixelformat;
> > > +               return 0;
> > > +       }
> > >
> > > -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > > +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> > > +       if (!bridge_format)
> > >                 return -EINVAL;
> > >
> > > -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pix=
elformat;
> > > +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++)=
 {
> > > +               capture_format =3D &sun6i_csi_capture_formats[i];
> > >
> > > -       return 0;
> > > +               if (!sun6i_csi_capture_format_check(capture_format,
> > > +                                                   bridge_format))
> > > +                       continue;
> > > +
> > > +               if (index_valid =3D=3D index) {
> > > +                       fmtdesc->pixelformat =3D capture_format->pixe=
lformat;
> > > +                       return 0;
> > > +               }
> > > +
> > > +               index_valid++;
> > > +       }
> > > +
> > > +       return -EINVAL;
> > >  }
> > >
> > >  static int sun6i_csi_capture_enum_framesize(struct file *file, void =
*fh,
> > > @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_de=
vice *csi_dev)
> > >
> > >         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> > >                 sizeof(video_dev->name));
> > > -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_=
STREAMING;
> > > +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_=
STREAMING |
> > > +                                V4L2_CAP_IO_MC;
> > >         video_dev->vfl_dir =3D VFL_DIR_RX;
> > >         video_dev->release =3D video_device_release_empty;
> > >         video_dev->fops =3D &sun6i_csi_capture_fops;
> > > --
> > > 2.54.0
> > >
> >
> > Tested on a LicheePi Zero Dock (V3s) with the following pipeline:
> >
> > ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture
> >
> > I verified that mbus-code-based format enumeration works correctly
> > from userspace and that the reported capture formats change according
> > to the selected media bus format.
> >
> > I could also successfully start streaming with several of the
> > enumerated capture formats (e.g. YUYV and BA81)
>
> Excellent, thank-you very much for testing this!
>

Happy to help.

> > However, I could not fully validate actual format conversion behavior
> > (e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
> > currently has non-functional test patterns except for 'shifting-1'
> > mode.
>
> That's fine. I don't think I have tested it recently either.
>
> > Tested-by: Arash Golgol <arash.golgol@gmail.com>
> >
> > PS:
> >
> > While testing this patch I also noticed that
> > VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
> >  - MEDIA_BUS_FMT_UYVY8_2X8
> >  - MEDIA_BUS_FMT_UYVY8_1X16
> > on sun6i-csi-bridge.
>
> I just had a look and you are definitely right, the entries are clearly
> duplicates and at the same time all the relevant formats are included, so=
 they
> are not taking the place of another format that was forgotten.
>
> You're welcome to submit a patch to remove these entries if you'd like,
> or I could do it otherwise.
>

Thanks, I'll send a small patch to remove the duplicate mbus format entries=
.

> By the way would you be interested in testing the H.264 encoder support f=
or
> V3/V3s once I send a first version for it? I had written initial support =
for
> it a while ago (did not send it to the list) and now that my work on the =
V4L2
> stateless uAPI has reached a point of usability I will probably try to up=
date
> my rework of the cedrus driver to use it.
>

Yes, I would definitely be interested in testing the H.264 encoder
support on V3s once you post it. I previously did some experiments
with Cedrus on V3s (bootlin, cedrus/h264-encoding branch).

Looking forward to it!

--=20
Regards,
Arash Golgol

