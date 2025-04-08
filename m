Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19144C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StXUt2o98UrEzmCyhxaifjhbyPqbhX1WlryMmKDUzOY=; b=ZYqejMllQa6PIqd8HEiqn8yJEu
	ae6nqdbC5Kjiy3OaDYU0+zsqxPpRkIg/JkXl/ygKfpFPHOCzEQOFyRErGcqO1n9R1TTsqDs42NEDE
	cr/Ed0fPo9yByqclPY/8syMcaGLSQQxFkiQ08Wid5fiZhj8Bx7qa5fte3Wk94oEiKfZDsb3zbUwRJ
	EN8blCNJbb1Ln88pNF4c/ZQzsJj/6YhgmHxH8RtaHB0T0kIumc/ttwYNjPGtvzzBDmhyZZ3CV9ART
	ms0tydz7bFRwsMyk6+YwABf7iul7gUshpkT3UDMnSufZLr70+kFcXa+W8K0V+mCTj5SUz7ujvoOIZ
	lPuLfszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2G8S-00000005P77-0FPt;
	Tue, 08 Apr 2025 21:05:32 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2G6b-00000005Osr-0QPp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 21:03:38 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c5e39d1db2so352875385a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744146215; x=1744751015; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StXUt2o98UrEzmCyhxaifjhbyPqbhX1WlryMmKDUzOY=;
        b=oqvJxru5rcPb27llno+f4FZ1MjOrEIcdrVqB8vAeuX3Q32uJWX4KuCcHUDNda3+ods
         cMYUF06pL7f5qqrBdhU/N362zoEZgo4C3OJgaQ0GhMag68bnhrMp2w90QdPGM51JF8wa
         /TOReokDd/62rgJ/J8WITNTW5wCi/O9dfQSKtWh/hPEPFBctESgEL78AGU4HxOtGwApl
         hRSJiYr3NhDoadSwcFiCM1dABYtY5n8SQr6V21Tfu+gOPs4BMTM7ufj0rlTFygmUqOr7
         35JVjeY3PYgethBZle3p7I/66cjZvly3m9kTdobmiFcfvMeCaHhUBIf1LCm48nsFMNHs
         ymmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146215; x=1744751015;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StXUt2o98UrEzmCyhxaifjhbyPqbhX1WlryMmKDUzOY=;
        b=K8w99Tjim0pcUzpzWdIV4aVgGt3kLbAPZ998X8Nbs3emuhkH/T+1fHQH+9F0wznMjD
         +8bTzL8qhVy2ak+gSWOo3X7CvLH1iX3UDzoNYuRERt3MqXmBGI9qwj5e8lqRZmeR06vV
         2/io0kOGXhThmCvMU5eugOE7C92nqIWrgfdVsNTof6Fbpy/skBrfMlMAY7Odhno9yNYZ
         M7dbBlupvyTQKWXcP4lftYKYdXTUDa7yaPU/b6IQU3zTCHY3VG9fJvhj/xbvuCiMevC1
         IWlySrahWibVXs+Tte44NnxfqbAA67tGu8JhZWEmIJE0FKv6eYUFAdlU+srgd0hsWpDA
         HB3w==
X-Forwarded-Encrypted: i=1; AJvYcCX+JZATx35hXon9a+ecrHrpdFCbuJVU1rDKgLvlDOvxD4OZNdXbdv/IEUgLDU5tBWrXc9iEnxYih6gbOUz1BfCT@lists.infradead.org
X-Gm-Message-State: AOJu0YzUSXk8+vDSmLceFpsH5OOksjN0oHFUFmDqmnJqXHoHzvMBTkTH
	xvYi1tqdK0nIpjQCmOSOYTnN7Nr4ZrzFgh1hrzxsR2XsfwQvccBvpjfYbYh5urk=
X-Gm-Gg: ASbGncst/MiadY0/1SMdDHKeJTA/pMQIzflUnL7a9mC6FKO/Nc5G5GGmQVVvTjtnMyd
	VCq5quPhiWe1rNx5udNNdq86Sb7brBvexM7HxtFM7wqjKy15q6cgQ+qyXLJRC9ULpsZ1RW8OWqw
	hwTm6C4sMDLChkMPiFfDE6Ys4vCfuBWAkfNuzRXEw521Ir0CwSZEtFtcVuDvrOnKr4IeBm54hn/
	tTKRPDEQRn9rZ570p+VoSC4tU833rQ4MTizLWxayi0ENfKkWGxRs9LB7GTUKp5a+IiE+QU6Gzds
	rjLjbb1FERZ2nFdpDbaZr50vh4YLJILcggJCO1Waf7TiZtcplcSdtJCf23ux
X-Google-Smtp-Source: AGHT+IFgnJHxAWsuf+QM5cxegWPMvcG8OTlQh/+tfcVS0Sbd6RBnpzz0kQLkyoaYTeZ2+H1M6atR2A==
X-Received: by 2002:a05:620a:40c8:b0:7c5:6375:144c with SMTP id af79cd13be357-7c79cbd7654mr96683485a.23.1744146215399;
        Tue, 08 Apr 2025 14:03:35 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75bcbesm803695785a.38.2025.04.08.14.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 14:03:34 -0700 (PDT)
Message-ID: <d4515a3dbbba33a45c0dc1c68e47b9a1f0dbbb6e.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/4] media: v4l: dev-decoder: Add source change
 V4L2_EVENT_SRC_CH_COLORSPACE
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian
 <ming.qian@oss.nxp.com>, 	mchehab@kernel.org
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 08 Apr 2025 17:03:33 -0400
In-Reply-To: <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
References: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
	 <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_140337_345148_A0C62BFC 
X-CRM114-Status: GOOD (  31.61  )
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

Hi Hans,

Le lundi 07 avril 2025 =C3=A0 11:54 +0200, Hans Verkuil a =C3=A9crit=C2=A0:
> On 17/01/2025 07:19, Ming Qian wrote:
> > Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
> > indicates colorspace change in the stream.
> > The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
> > the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > ---
> > =C2=A0Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 ++++=
+++++
> > =C2=A0.../userspace-api/media/videodev2.h.rst.exceptions=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A03 files changed, 11 insertions(+)
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b=
/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > index 8db103760930..91e6b86c976d 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > @@ -369,6 +369,15 @@ call.
> > =C2=A0	loss of signal and so restarting streaming I/O is required in or=
der for
> > =C2=A0	the hardware to synchronize to the video signal.
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x0002
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - This event gets triggered when a colo=
rsapce change is detected at
>=20
> colorsapce -> colorspace
>=20
> > +	an input. This can come from a video decoder. Applications will query
>=20
> It can also come from a video receiver. E.g. an HDMI source changes color=
space
> signaling, but not the resolution.
>=20
> > +	the new colorspace information (if any, the signal may also have been
> > +	lost)
>=20
> Missing . at the end. Also, if the signal is lost, then that is a CH_RESO=
LUTION
> change, not CH_COLORSPACE.
>=20
> > +
> > +	For stateful decoders follow the guidelines in :ref:`decoder`.
>=20
> I think this should emphasize that if CH_COLORSPACE is set, but not CH_RE=
SOLUTION,
> then only the colorspace changed and there is no need to reallocate buffe=
rs.
>=20
> I also wonder if the description of CH_RESOLUTION should be enhanced to e=
xplain
> that this might also imply a colorspace change. I'm not sure what existin=
g codec
> drivers do if there is a colorspace change but no resolution change.
>=20
> I'm a bit concerned about backwards compatibility issues: if a userspace =
application
> doesn't understand this new flag and just honors CH_RESOLUTION, then it w=
ould
> never react to just a colorspace change.
>=20
> Nicolas, does gstreamer look at these flags?

So its used in two places:

At runtime (shared between HDMI receiver and decoders):

    if ((event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION) =3D=3D
0) {
      GST_DEBUG_OBJECT (v4l2object->dbg_obj,
          "Received non-resolution source-change, ignoring.");
      goto again;
    }


Meaning we currently completely ignore the event if it does not have
the flag. And the second usage is while waiting for the initial
resolution:

      if (event.type =3D=3D V4L2_EVENT_SOURCE_CHANGE &&
          (event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION))
{
        GST_DEBUG_OBJECT (v4l2object->dbg_obj,
            "Can't streamon capture as the resolution have changed.");
        ret =3D GST_V4L2_FLOW_RESOLUTION_CHANGE;
      }



I remember some doc explaining that once we receive that even we must
cycle through streamoff/on, but can't find it now, I'll check further
tomorrow. I wanted to check if that was specific to
V4L2_EVENT_SRC_CH_RESOLUTION or global to V4L2_EVENT_SOURCE_CHANGE.
Also, there is likely some difference between codec and HDMI.

I think backward compatibility will be difficult on that one. I'm happy
that you find the time to have a look, and looking for good ideas.

Nicolas


>=20
> Regards,
>=20
> 	Hans
>=20
> > +
> > =C2=A0Return Value
> > =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =C2=A0
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptio=
ns b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 35d3456cc812..ac47c6d9448b 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-change=
s-flags
> > =C2=A0replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
> > =C2=A0
> > =C2=A0replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
> > +replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
> > =C2=A0
> > =C2=A0replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_even=
t_motion_det`
> > =C2=A0
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index c8cb2796130f..242242c8e57b 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
> > =C2=A0};
> > =C2=A0
> > =C2=A0#define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
> > +#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
> > =C2=A0
> > =C2=A0struct v4l2_event_src_change {
> > =C2=A0	__u32 changes;

