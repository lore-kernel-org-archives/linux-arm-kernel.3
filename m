Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB476E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oWxpn0SGtmyDXb93tRyzmtUmQKPaYv4078+mCEzpoE=; b=LFYyebBb1JPS/yBvO8YVGODT8i
	sdfm3pGg3ZzZIDMGlkHFI7A0SShAvjzPDyFx/32QqSVGIlgrpcRW02Pego07XzzkzbgSLDYSq+89S
	QG9PD4MmrERQ3wdwFi6dUqj+UVElrtoLS+WRvPzcxJUFdqrxRla5dxO4USaaFcMLTuv3OQ9/K+d3+
	dZfbELXCa7O0wGCUmawT7XpLLJh+Jta2/ZGkeYumOnEM0hXDowN6xMU3du0PzMvO/xIjOUrFA2SP4
	yMdCs2GZXNtNJaqIlvcX6TgET0aYRO/Y2d+qqA0RQQrymcoH7yi5bjSe+SviJk6MCu2AtgTjrlrGV
	cMLKblXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv2l-0000000CbFu-0YUj;
	Thu, 09 Jan 2025 16:05:59 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv0r-0000000Cawy-0hCJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:04:02 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7b6e5c74cb7so73165385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 08:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736438639; x=1737043439; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5oWxpn0SGtmyDXb93tRyzmtUmQKPaYv4078+mCEzpoE=;
        b=wk7ZvXCvSZ96uWYBFDMiUsQ0UO18ZnWZvH77VRVL7V5s8LB4iPrXy/RxwLa8h+gs9r
         300uX6EcgFfxHxcgb39PLiMCIHUUb4jE1LIimq8FRw8rRb/y/NmuOKVc85fZ/OXCpTDG
         PaV6/fjbrvLU+JzO5hskwkx7RtS4tlyslzBKjphsjBRyYs7UIVtku0eOERPAJNTSoGiH
         xLFHeiQ7/erEl9DhQWQwEJKnd7LSCpIDEDhpWSoIec8Oo+g6MM8bKsPVBGSxO/UCqviM
         4NzAktynPejQ2qUg5p1FH/Y00cZubicorQ7/eY4IuiSO63ddABzf/LCpd2m+/CLrC/ZL
         KVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438639; x=1737043439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oWxpn0SGtmyDXb93tRyzmtUmQKPaYv4078+mCEzpoE=;
        b=oHgNA4A5lthUXxqF0WXKiDaJ9q31jVe1NBoTuOoGyBjz8yNaKNi0tizYXu84fePnT/
         yWOEeRxSXcVcG30r9HgGNZy4lCu+CMWXypVf5qwOpJ7jqkxcwtRuvUDJUfCskcL2L/FZ
         YNcaKto+spt9SbdsBJDFQakeFmAyZPinIsaNSVVXh3Rzdn9rRrSJB8y2PX5NzZgoLBTa
         H7ABxzArpM5widZOLQDvimbkWSMIlgHBnKs9eDHRtBiXudQoCGgXiHKAWTyx0yoq2vDJ
         X+AGbXzb7Aki1qo8dzrvUBxHRySl+CKr7K1V/egMhqCLenKXufY65wqnsB3RcXgRPKze
         5kvA==
X-Forwarded-Encrypted: i=1; AJvYcCW18BjJ2Lr2Ow65u6knlAq/rheoEtnnCZuaRnwHVtshUB+oplVz76Vnn7isxLvrgAgEfuDtUW5f51iUdLVRlQKp@lists.infradead.org
X-Gm-Message-State: AOJu0YyX23bWigv7Uwyii9gzLYK/cen1OT5lxE+FdbvLBYMrV+h+NJRN
	0xeZhrojAUvLHcRMj03LWH3ttsp1cdLvTb8W7ZYDX2Dki8Ps1IqDS7wcuWX85gw=
X-Gm-Gg: ASbGnctQFILavdNgZyEF8hbD7ZpwitZ4IAHxTyRsEQ89czHYQF+zF89tRbE0EtYRKid
	CDHorfX+xhHcpMSckaGd4RvbMgrKQ1XFb/ASfCaX4BP3KfzG4jxN9DXSzdnrsPjtrPxYNwSfjjC
	us+E87DBzTlzdgViyH9DQg+zhiLFfpsmyFcLsw8hVc0UK1LsQWkFQ+7RM9u+4HxO+DFUOAf9zPM
	KIqwUpKh8CGagczDvS6TXyNDk7D4zLQnAJqseTq1WqloZma9t0oVE4Oew==
X-Google-Smtp-Source: AGHT+IHEP9r9XQCkPOEzp+u0TLg6rUa7q7/plau936duR/pLj+daWig5JlHn1NDsNPPmeHHMicojCA==
X-Received: by 2002:a05:6214:300e:b0:6d8:95c9:af2b with SMTP id 6a1803df08f44-6df9b2adae6mr110180926d6.35.1736438639396;
        Thu, 09 Jan 2025 08:03:59 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137367sm202531376d6.65.2025.01.09.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 08:03:59 -0800 (PST)
Message-ID: <bed10b8bcd85b4c03737107ac0aea1375d18a50e.camel@ndufresne.ca>
Subject: Re: [PATCH] media: docs: dev-decoder: Trigger dynamic source change
 for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Thu, 09 Jan 2025 11:03:58 -0500
In-Reply-To: <1c1bb1b3-7e58-4a49-83bb-2c560cd66858@oss.nxp.com>
References: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
	 <dcae7fbb810ebfa6e539c3b45c20e1d659600d80.camel@ndufresne.ca>
	 <1c1bb1b3-7e58-4a49-83bb-2c560cd66858@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_080401_468031_AE7DB335 
X-CRM114-Status: GOOD (  33.07  )
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

Le jeudi 09 janvier 2025 =C3=A0 10:25 +0800, Ming Qian(OSS) a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 2025/1/9 3:34, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 07 janvier 2025 =C3=A0 14:36 +0900, Ming Qian a =C3=A9crit :
> > > If colorspace changes, the client needs to renegotiate the pipeline,
> > > otherwise the decoded frame may not be displayed correctly.
> > >=20
> > > If it can trigger an source change event, then client can switch to t=
he
> > > correct stream setting. And each frame can be displayed properly.
> > >=20
> > > So add colorspace as a trigger parameter for dynamic resolution chang=
e.
> > >=20
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > >   Documentation/userspace-api/media/v4l/dev-decoder.rst | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/=
Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > index ef8e8cf31f90..49566569ad26 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > @@ -932,7 +932,9 @@ reflected by corresponding queries):
> > >  =20
> > >   * the minimum number of buffers needed for decoding,
> > >  =20
> > > -* bit-depth of the bitstream has been changed.
> > > +* bit-depth of the bitstream has been changed,
> > > +
> > > +* colorspace of the bitstream has been changed.
> >=20
> > Did you really mean colorspace in the way this term is used in V4L2 ? W=
hat we
> > want this event to be used for is when the capture storage size or amou=
nt
> > changes, perhaps you mean when the capture pixelformat changes ? This w=
ill
> > indeed happen if you change the bit-depth, subsampling (not mentioned h=
ere
> > either) or change the way colors are repsented (RGB, YCbCr, etc.).
> >=20
>=20
> I am referring to the following attributes in v4l2_pix_fmt:
> 	__u32		colorspace;	/* enum v4l2_colorspace */
> 	__u32		ycbcr_enc;	/* enum v4l2_ycbcr_encoding */
> 	__u32		quantization;	/* enum v4l2_quantization */
> 	__u32		xfer_func;	/* enum v4l2_xfer_func */
>=20
> For decoder, they are parsed from the sequence header.
> Our issue is that when only these properties change in the middle of
> some bitstream, but not the resolution or dpb amount, the decoder needs
> to nofity the user.  As these properties are in v4l2_pix fmt, user need
> to get/set them via VIDIOC_G_FMT/VIDIOC_S_FMT.
> So in my opinion, it's reasonable to nitify user a source change event,
> then user can call v4l_g_fmt() and renegotiate the pipeline.
>=20
> Apart from this, all I can think of is that user call v4l_g_fmt() before
> dequeueing each frame. But I don't think this is a good idea.

I agree an event is better then this ...

>=20
> As these properties are parts of the v4l2_format, I think it's
> reasonable to handle their changes via the dynamic source change flow.
>=20
> We're currently facing some real cases on android.
>=20
> Or do you have any good suggestions? Then I can give a try.

But I think this is too much to put this under the changes
 =20
   #define V4L2_EVENT_SRC_CH_RESOLUTION            (1 << 0)

We include under "resolution" everything that affects the allocation. So pe=
rhaps
for this one we can introduce

   #define V4L2_EVENT_SRC_CH_COLORSPACE            (2 << 0)

Of course, userspace implementation will be needed. Anyone one else have an
opinion here ?

Nicolas

>=20
> Thanks,
> Ming
>=20
> > >  =20
> > >   Whenever that happens, the decoder must proceed as follows:
> > >  =20
> >=20


