Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12964CCF2E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=; b=YLPfgejJSfABEAhFSUsWkVVieY
	Tcj2FICJlquntZgsd1EhguCeDWrusp9NiltBGwOIfuoLMvlbP3J9UrLgVWCoIdVWsh6VmYvTSMPoc
	4Vkd45GLNdQ1qA13ZPjl3Y3B2W5mO361cpIsP/lGAWNhjdJ/tM7WcorfGDf23ZLFJrvoKH9Lz8vVJ
	87+L41za+R5/3O+lDSwbd0NEDx6rPonJazLsD8cYYGIuLGqbVpTmhyw2v9jhiX2Ltoj06P1ScyGiX
	NBzKIHVInruIaEt4sHnK+GK8g8eRca+W9T5jjYfh0EQ3vpQTIHmykTX8EwDxglknL4HlBcCl1oxDV
	qy1uzYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImRm-00000007Nx5-1buR;
	Mon, 19 Oct 2026 12:26:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImRh-00000007Nw8-2XWV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:26:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5be4fea434bso648578e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412786; cv=none;
        d=google.com; s=arc-20260327;
        b=WHV8+Hr3vc+3gOiefmWVFEXNEZ58pjwUUW/nISzR+ySTd8lFuqTcENMV3UNzc6Xveo
         T75e0q9OCz+0qplRGQAZJ5JO11qmtkBN1smgjij5Iefk1NxkD/cdyRUzTmd7kf81t3qv
         Dho1tBR6In8Vglnta+inNrySVBNeht6Ds0dvZddovg64v8lz6ZVgzKZaZ3K/pEYt+vpp
         Sc6522ocLQjkt6p+oMhXRPCE7hIaktkYo2FlX6k2JDn6ipZu6lIRm5OJp23aqAhpJTan
         YidzMZM4bd7TB1aSvrTOmsrw/nyeAKgd496frr9W1cDOSkPunJ1d7a2QgJyY/PG77ROS
         xl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        fh=MAziHfznHBC40V4cv0SsNtGjoSgpsAiRZfZfy/aRuC8=;
        b=nOBrLP09FevWiJ1bcd32BygoEG4Oy0M7sW0gIex1VHsX2gKrAT09sMOa3bHwqPNML8
         iyN4TI4uAcmDHeJVDb7GtMBVIfuICz78sGOtWeGa08sSCsRSWlkC2CqSCw6qj0A4XD1B
         I7n4W8pd74tbOuccqxzve9PRepAl+6g++/FL3wnb7VGQbI2HlwMeXAoB5oEIXpgdiLSC
         vUOzjU+Ovup1IJx3jRAmfpXkCO+62Hs6NjwoIFpdXmMf40Hfof+tra6xBORnrZ82DoxF
         EumFLoW0a2XTLQyMuMPgB7JQ0iTQ3zhNhVJ91KpRn+056LqXYE3BSB5ekYBo4JvLCYQF
         eBkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792412786; x=1793017586; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        b=rAXzt1BFCMVt4kqSOlywtP0sW7M9t84Zx0bxO92g0CeBKH7KABMxAvBRIC5Qvagaaa
         Ef9B6lVqclIl2H87A5lT5G0MKTbon1Rwf7EhPxVDXkPoM3RnrVPqKGs40y2hXiWbg3+s
         eEsF4BmZFCAjBn6BfoIqkjt5peGZ8rWL2PdKQcZtTLvcJUGLotyLd8MAr3+4roWhoX6+
         hBAV/Drv1XzuJHh8qg2MjmF6fKWEwVSycNhKGO8iKnKQ25RaGuT7x5wig6nyKW84L7D6
         mHS7y21e/LG+gs5bLjLk5Fo4UZud9p2GyA2pifyKtKoiTJTuKiN6p3nJJUcn6q9p6RLV
         gZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412786; x=1793017586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        b=ZjS88MFiXhf9oRv/I9nopHGpvzS6BgKk5Z0pLA+GrIOe1+cP7fNJQwBJDK1MW6NnEK
         /hAlcQAmVP8uGuV39alfDg+3t0zidUWg4LvICew2cwldM3Ba/vtXIBf60ikvInEXGfll
         p8FCaXneBTKmaqRkSjv9qDqSCJzYUYu9bGrpvIYAujRdCr+kgKRQU9x2ucI4QCX5P7KE
         znxETnXqpLMmaHm1S3YWpIrMTe+zcbckPwjZBQY/KRCzNtQXuPtM4nepio7wvAhSF0Qv
         OLlMfWBJlIAn9MDvfNOLs6Y+W69iFMfq1dGKYp5GpXBXszyWyYvEKiZ0LhotKPVBztyj
         R7wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjxradZRi8uiryfSJMSc7cgfpFNSDldV33on6lCEkXaltsU3wdHXckIPOqLtV11NlnwvsmVmFdXJyUbaLw7tw2@lists.infradead.org
X-Gm-Message-State: AFq9FYKZRox9jJODi+PC+4H/kVlu0LJwZ6+5SmbOV1EcPeTtjjpEYr4G
	+OUJ+qIkzXbwqUNXGkUhQrTEUGqtC+0R2uF7Ye3TkI8ybnJDqXkw72hH3uiUXGtdz0zKHyNFZi+
	TBI8bj/sXuwjblF4s6FVdZjUXH4n1PRkrc0IGTX59iw==
X-Gm-Gg: AYBFou00XoZ3vbLxp1vJ9RSuFkUY9EupQ+WP8+xzzm3IcdKYWX2mnVpShXFPnRU7y8U
	HCK/QYuPwSM4OJMwTJYRG/RkzqXrLXY7Lr8dYL/1pO9ACLSC7A4efJLPpYDmBjxgL9W1wcSI4Nw
	tAL3wkKqQxP1SCmi273mDlXD7ID2VSjO4TeA3r3oAcDsUXfLGjy6eS36zNtolr+8o/rrsJBUhHI
	Xg3i+QBIGT1IU7SFYkESSDV7xmzg2SY/cmFMXhF8ZcALW5dG/pSoOb7iiRy58MOvb10353WEdKc
	FFdvj2Wjx4k0pqcileGlSw2P86j2Pw/VEvlOqHqdBIz2g7LGeR6U++hkx3LgQgbP4H0Xo2KadS2
	3r0FEFe9OLA==
X-Received: by 2002:a05:6512:3d17:b0:5be:41a5:d9ed with SMTP id
 2adb3069b0e04-5be47936d9dmr3010694e87.37.1792412786489; Mon, 19 Oct 2026
 05:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
 <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
In-Reply-To: <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Mon, 19 Oct 2026 14:26:15 +0200
X-Gm-Features: AclHuK93P2jPD4PyUwT4dOLVOgxbBF4VVZAqE1H94JjIS4xMMkZCEQTzudX9ZIs
Message-ID: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_052629_962478_A82D0548 
X-CRM114-Status: GOOD (  26.18  )
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

On Sun, Oct 18, 2026 at 9:53=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.com>=
 wrote:

> Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
> thinks seem not to be working with that interface.
>
> Im trying to debug what happens in that condition; I will need a couple
> of days I guess. So far, this is what I could check.
>
> Any feedback on the test or debugging would be appreciated.

Hi Gaston,
Thanks for digging into this.

The patch only changes when the VCHIQ bus and driver are registered during
boot. So it's enough to check these two cases to validate the patch:
- without my patch: dmesg shows the "unable to register with bus_type
  'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
- with my patch: the error is gone and bcm2835_hdmi is present in
  /proc/asound/cards.

(Since the Pi Zero has no Headphones jack, you need to test both cases with
snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never s=
hows
up, even when everything works.)

Could you check these two cases?


Testing that you can hear the sound going through bcm2835-audio is a full
functional test that goes even further than the patch: it does not only tes=
t
bus registration but also that the audio driver is working.

On my side, without vc4-drm, I can successfully hear sound through both bcm=
2835
Headphones and bcm2835 HDMI:

  # aplay -l
  **** List of PLAYBACK Hardware Devices ****
  card 0: HDMI [bcm2835 HDMI], device 0: bcm2835 HDMI [bcm2835 HDMI]
  [...]
  card 0: HDMI [bcm2835 HDMI], device 1: IEC958 [IEC958]
  [...]
  card 1: Headphones [bcm2835 Headphones], device 0: bcm2835
Headphones [bcm2835 Headphones]
  [...]

  # speaker-test -D plughw:0,0 # (HDMI)

  # speaker-test -D plughw:1,0 # (Headphones, not on the Pi Zero)


If you still want to output sound through bcm2835_hdmi (optional):

There can only be one owner of the HDMI port: either the firmware or the
kernel.
When the Raspberry Pi boots, the firmware first owns the HDMI and displays =
a
rainbow splash. Then it launches Linux.

There are 2 ways for the kernel to deal with the video output:

1) With vc4-drm (CONFIG_DRM_VC4), the kernel takes over the HDMI controller
   from the firmware and handles everything itself (this is your case).
2) With simple-framebuffer (CONFIG_DRM_SIMPLEDRM or CONFIG_FB_SIMPLE), the
   kernel leaves the HDMI to the firmware and just writes pixels to a
memory area
   (the framebuffer) set up by the firmware.

I get a similar problem on my side when sending sound through bcm2835_hdmi =
with
vc4-drm loaded: my screen shuts down (but the kernel is still alive).
It most likely comes from the firmware and the kernel both trying to drive =
the
same HDMI port: with vc4-drm, the kernel owns the HDMI controller, and the
firmware (which bcm2835-audio talks to through VCHIQ) is not supposed to to=
uch
it.

A simple way to output sound through bcm2835_hdmi is to not use the vc4-drm
driver at all, and use simple-framebuffer if you still want a display.

To remove vc4-drm:
- Do not compile the driver into the kernel (CONFIG_DRM_VC4=3Dn) or blackli=
st the
  module.
- Remove any vc4 overlay in config.txt file (e.g. remove dtoverlay=3Dvc4-km=
s-v3d).

To enable simple-framebuffer, use one of the two configs:

  CONFIG_DRM=3Dy
  CONFIG_DRM_SIMPLEDRM=3Dy
  CONFIG_DRM_FBDEV_EMULATION=3Dy
  CONFIG_FRAMEBUFFER_CONSOLE=3Dy

or, the older way:

  CONFIG_FB=3Dy
  CONFIG_FB_SIMPLE=3Dy
  CONFIG_FRAMEBUFFER_CONSOLE=3Dy

(FRAMEBUFFER_CONSOLE=3Dy, and DRM_FBDEV_EMULATION in the DRM case, are only
needed to see the boot messages on the screen, with console=3Dtty1 on the c=
ommand
line.)

If you have remote access to your Pi Zero (either through network+SSH or
through serial console), you actually don't even need the simple-framebuffe=
r:
you can just remove vc4-drm, and let the firmware display its rainbow splas=
h on
the HDMI port.
Then you can login to your Pi Zero through SSH for example and launch
speaker-test.
As long as the HDMI video output is active, it's enough for the sound to be
able to go through, even if the image was not drawn by Linux.

But again, this full functional test is optional.

Regards,
Martin

