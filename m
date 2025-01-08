Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E5BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 19:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6Vg+vnBATvKCOB8Ex1vyLJk1Tk2dIWDIke1IHw7kJM=; b=ljm9oixNQVn9UZY3hlsOdnQdPh
	MG18Uc/u0lpia+t7Nppvk7IlQ4xCjdftghXcdlGekKcBKKRA9GrPMVk0btZwYVhzDjZ5kr8J8IqCC
	Ef3XC45fiAcxs6V68Y2lGg3o/sHM30Btgzy8RF4SuItm1n5vEFobrz87a77bu34O1y4i43Axevd3w
	xFU7UqllvHCjBlYtNwf9lycEtjmh98/xiePs0yh9DFs0WypCrBxmU1I0AfH55wj9ZqWFIddiDHOci
	hvSc10zsmD58ntepL8aEnWQqeAsEtL8amHfWhvPgbqgu/liejf0D8Az8g5WFmb48hEOZcIquoBBIZ
	eodZtjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVbLE-00000009cB9-2004;
	Wed, 08 Jan 2025 19:03:44 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVbJy-00000009c2x-3iJM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 19:02:28 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6d8fd060e27so1421316d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 11:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736362945; x=1736967745; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C6Vg+vnBATvKCOB8Ex1vyLJk1Tk2dIWDIke1IHw7kJM=;
        b=uMlOW9g6dkJ3bc0V2h4BAPz0l6gDyCxhKBwv0MVqY5frE3FHJM0fgUBI7U76ookinm
         wIcCF4LXXzV+FDIYVhDgToj7DoZ6EH6MPqxm/R9opQ/mB9gp3BvBnp416pyHefFnM860
         VJk/jcK/DSfMk5+3wTXFw/iSu5p+qJxk0UdQ0nbink7eSRv7vUOMjJBJw3kDAhCyQ+V4
         4Zvci5z2OOLeXAlhrI3g6GgTmzLtchc1dWjPFwVN2ksEPz/WQxda8udfaE9C9hlvGFA0
         rL6HgOnqftoG1JtY4PpX8Wulj+0IxucKXFj6AMs6c+E4cmgWaD3GuaBGzIDY2+OM+emJ
         SruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736362945; x=1736967745;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6Vg+vnBATvKCOB8Ex1vyLJk1Tk2dIWDIke1IHw7kJM=;
        b=q9kLTanhtPTZS5xWzGTrW81etSXCzIVzrWZ3X3cH3BoFJK1Xx3r7b8AQJ9BJqEGsUm
         n8AzCTidTvBCaQjhHUirnwawPt/Nv2rmkzscRsagVloQqN2atjJF9OMlA//8Wvg/tLHk
         LZl8qTMPwI+aKVQvofQOXIlXuYZAvqnJXUZoZ+FxFZ4c6Mu1XQucTqbbwHG4wY1aBQKs
         EO88MQqKr/0CkKFAiM8hrynmKXbOkBcvzU9xHwqz+4sxbqBOvcMypY4DmWcUgMY4lpe/
         DQ84ad1XNFNp1KIJoNUjVkNm7M9HgdzZ1VzAGYN9Qevtj0Y8/pfe4sgeQF2Xy8IQ7+DP
         Sfmw==
X-Forwarded-Encrypted: i=1; AJvYcCUxQP2ys0Uaotqce4Zj+qU9xxdheJcUiZ0scEuFCR6m+Heve7y9RfP37EF46JFylxv0wyVnWBq5qO/mhEvE5V3G@lists.infradead.org
X-Gm-Message-State: AOJu0YzkLjLQ2ZZC3+SBoa6TEAn9ECh3BZui3LXxUa0eDyJbN93mX/5b
	vvf3a0HmPSUel10pQ5s+mUcRd7D/by+fbm5Nw3MG5KBjYvGPMl5BTXMNMjc2wPA=
X-Gm-Gg: ASbGncuM914pf3L25A77SAsV1TdCMU6Wm26Uox8kGgfTjc5WOO+j9R9HJMiwcOjiJrJ
	UAswn8hgO7MF97E9bWZbLI1yWFxJL1tlpX7fyZkrvOgU0Pk1w7Htt+a5eMg1za/sdY7i6TCe4mm
	yUrAPCzDazLBFml3WdzdKMDuWZvjmTWUl1xG9vVvuxUuxw0xpPiWs0VbbmfNqal7VBrzqdtWl+J
	7AppeJqGvMVi42GtJ6219cAspdeo0c2+dRTsQIMvq9F4e45I8Rq7vl5NQ==
X-Google-Smtp-Source: AGHT+IHz8t7/jnTp3/z7aQeqs8EfZmJDcpfVjx/Cqp7AG+gJRyK2LvWbMaJkQwON4t/VCdJm0q9Hmw==
X-Received: by 2002:ad4:5ca1:0:b0:6d8:9b7b:14c9 with SMTP id 6a1803df08f44-6df9b1b5254mr3677706d6.8.1736362945361;
        Wed, 08 Jan 2025 11:02:25 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd180ea69dsm193516926d6.24.2025.01.08.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:02:24 -0800 (PST)
Message-ID: <96993d4626e09460d60911fdec8c8d4e305c6747.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, John Cox <john.cox@raspberypi.com>
Date: Wed, 08 Jan 2025 14:02:23 -0500
In-Reply-To: <CAPY8ntCxQDVe8G+ZtcjcT1ikVCUzNXMpGLvsFMUUDvZSx7zOAg@mail.gmail.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
	 <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
	 <CAPY8ntCxH2C=YEJEcee0b2UuXU+xZ0Ntbuvc29MLAipr9DCmmw@mail.gmail.com>
	 <CAPY8ntCxQDVe8G+ZtcjcT1ikVCUzNXMpGLvsFMUUDvZSx7zOAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_110226_929500_720E6149 
X-CRM114-Status: GOOD (  67.21  )
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

Hi Dave,

Le mardi 07 janvier 2025 =C3=A0 17:36 +0000, Dave Stevenson a =C3=A9crit=C2=
=A0:
> On Tue, 7 Jan 2025 at 16:13, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >=20
> > Hi Nicolas
> >=20
> > On Mon, 6 Jan 2025 at 20:46, Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
> > >=20
> > > Hi Dave,
> > >=20
> > > Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson =
a =C3=A9crit :
> > > > Hi All
> > > >=20
> > > > This has been in the pipeline for a while, but I've finally cleaned
> > > > up our HEVC decoder driver to be in a shape to at least get a first
> > > > review.
> > > > John Cox has done almost all of the work under contract to Raspberr=
y
> > > > Pi, and I'm largely just doing the process of patch curation and
> > > > sending.
> > > >=20
> > > > There are a couple of questions raised in frameworks.
> > > > The main one is that the codec has 2 independent phases to the deco=
de,
> > > > CABAC and reconstruction. To keep the decoder operating optimally
> > > > means that two requests need to be in process at once, whilst the
> > > > current frameworks don't want to allow as there is an implicit
> > > > assumption of only a single job being active at once, and
> > > > completition returns both buffers and releases the media request.
> > > >=20
> > > > The OUTPUT queue buffer is finished with and can be returned at the
> > > > end of phase 1, but the media request is still required for phase 2=
.
> > > > The frameworks currently force the driver to be returning both
> > > > together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
> > > > would complete the job without returning the buffer as we need,
> > > > however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE=
_BUF
> > > > then we have a WARN in v4l2_m2m_job_finish.
> > > > Dropping the WARN as this series is currently doing isn't going to =
be
> > > > the right answer, but it isn't obvious what the right answer is.
> > > > Discussion required.
> > >=20
> > > I think part of the manual request completion RFC will be to evaluate=
 the impact
> > > on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not su=
pport
> > > interleaved interlaced decoding (only alternate), so they didn't have=
 to
> > > implement that feature.
> > >=20
> > > Overall, It would be nice to get your feedback on the new manual requ=
est
> > > proposal, which is I believe better then the pin/unpin API you have i=
n this
> > > serie.
> >=20
> > I wasn't aware of that series, but I / John will take a look.
>=20
> As I said at the beginning, I'm largely an intermediary here, and may
> get things wrong as my codec knowledge is far from comprehensive. I'm
> hoping John will correct me if I misrepresent our conversations.
>=20
> As you say the MTK codec doesn't set
> VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF, and hence it can call
> v4l2_m2m_job_finish without hitting the WARN.
>=20
> Your comment about it not supporting interleaved interlaced decoding
> confuses me slightly. Almost all the codecs allow a single frame to be
> encoded as multiple slices, and I'd be surprised if none of the test
> streams exercise that.

MTK VCODEC is a frame based HEVC decoder. All slices are passed within the =
same
request (up to 600). Upstream, only Cedrus driver is slice based, though fo=
r
large number of slices this has performance issues (even though you gain on
latency).

> Our reading of the situation was that if you have more than one
> encoded slice making up the video frame then you are NOT obliged to
> submit all of the slices at once via the variable length array
> control, and submitting the slices one at a time is permitted. That
> means that almost all decoders have to set the
> VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF flag to be able to hold onto
> the CAPTURE buffer until it has been given all the encoded data to
> generate it.

We don't have support for that, a new v4l2_stateless_hevc_decode_mode would=
 be
required. Here's what the spec says:


    * - ``V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED``
      - 0
      - Decoding is done at the slice granularity.
        The OUTPUT buffer must contain a **single** slice.
    * - ``V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED``
      - 1
      - Decoding is done at the frame granularity.
        The OUTPUT buffer must contain **all** slices needed to decode the
        frame.

So one, or all. Additionally, (and doc could be improved here),
V4L2_CID_STATELESS_HEVC_SLICE_PARAMS is strictly required for SLICED_BASED,=
 and
must contain 1 slice. While for the second, some drivers needs it, some don=
't,
userspace needs to check if the control is present or not.

SLICE_BASED depends on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF, otherwise=
 you
can't queue capture buffers ahead of time, and loose in throughput. So a ne=
w
DYN_SLICE_BASED (with some proper name), would also require it.
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF is also needed when you need to d=
ecode
top and bottom field in the same capture buffer, hence my reference to that=
 (MTK
chromebook firmware don't support that for any codecs).

You could also ignore all this, and implement
V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED on top of your slice based deco=
der.
No latency gain, but you also no longer need
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF which let you postpone adding new
helpers to complete the job when this feature is used. Yet, I think the man=
ual
request completion proposal would be a lot better if we had that issue cove=
red.

>=20
> If there isn't a need to support a multi-slice frame being presented
> via multiple OUTPUT buffers, then we can cull some code and drop the
> flag.

> HEVC has no real concept of interlaced content, so no need to worry
> about that as the other route to having multiple slices producing one
> video frame.

I've seen non-tiled decoders that internally double the stride, and offset =
the
same buffer by one line for the second field, to generate interleaved data,=
 but
as you said, this is the exception rather then the rule. :-)

p.s. your understanding is pretty accurate

>=20
>   Dave
>=20
> > > >=20
> > > > We also have a need to hold on to the media request for phase 2. Jo=
hn
> > > > had discussed this with Ezequiel (and others) a couple of years bac=
k,
> > > > and hence suggested a patch that adds media_request_{pin,unpin} to
> > > > grab references on the media request. Discussion required on that
> > > > or a better way of handling it.
> > > >=20
> > > > I will apologise in advance for sending this V1 just before I head =
off
> > > > on the Christmas break, but will respond to things as soon as possi=
ble.
> > >=20
> > > One thing missing in this summary is how this driver is being validat=
ed
> > > (specially that for this one requires a downstream fork of FFMPEG). T=
o this
> > > report we ask for:
> > >=20
> > > - v4l2-compliance results
> > > - Fluster conformance tests results [1] and I believe you need [2]
> > >=20
> > > [1] https://github.com/fluendo/fluster
> > > [2] https://github.com/fluendo/fluster/pull/179
> >=20
> > Sure, I'll sort that before doing a V2.
> >=20
> > > GStreamer support is there in main now, but without the needed softwa=
re video
> > > converter for you column tiling, we can't use it for that (i.e. only =
works
> > > through GL or Wayland).
> >=20
> > Can you point me at the right place for the software converter?
> > It's a relatively trivial reformat required to get it back into NV12 /
> > I420 or 10bit equivalents, so happy to do that. I think John already
> > has NEON optimised code if desired.
> >=20
> >   Dave
> >=20
> > > regards,
> > > Nicolas
> > >=20
> > > >=20
> > > > Thanks
> > > >   Dave
> > > >=20
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > > Dave Stevenson (4):
> > > >       docs: uapi: media: Document Raspberry Pi NV12 column format
> > > >       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_C=
OL128
> > > >       media: dt-bindings: media: Add binding for the Raspberry Pi H=
EVC decoder
> > > >       arm: dts: bcm2711-rpi: Add HEVC decoder node
> > > >=20
> > > > Ezequiel Garcia (1):
> > > >       RFC: media: Add media_request_{pin,unpin} API
> > > >=20
> > > > John Cox (2):
> > > >       media: platform: Add Raspberry Pi HEVC decoder driver
> > > >       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
> > > >=20
> > > >  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
> > > >  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
> > > >  MAINTAINERS                                        |   10 +
> > > >  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
> > > >  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
> > > >  drivers/media/mc/mc-request.c                      |   35 +
> > > >  drivers/media/platform/raspberrypi/Kconfig         |    1 +
> > > >  drivers/media/platform/raspberrypi/Makefile        |    1 +
> > > >  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
> > > >  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
> > > >  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
> > > >  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
> > > >  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++=
++++++++++++
> > > >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
> > > >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
> > > >  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
> > > >  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
> > > >  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
> > > >  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
> > > >  include/media/media-request.h                      |   12 +
> > > >  include/uapi/linux/videodev2.h                     |    5 +
> > > >  21 files changed, 4880 insertions(+), 7 deletions(-)
> > > > ---
> > > > base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
> > > > change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
> > > >=20
> > > > Best regards,
> > >=20


