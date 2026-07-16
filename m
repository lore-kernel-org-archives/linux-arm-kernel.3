Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 03:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaAi6r0o04lXEAunGEp84mPQVwuTB4awISro/owjdbQ=; b=cHmUeg2qVJOYS1FhadUC+JZ8Oq
	bEmF1H0DnGkjr74ZJzRRX5lmjG5vkhI2yt1CtG4+2OyObDDW7jwOm1tulEMiKSfjSGT560FsEDKcd
	HwLpqZvjpLlntxKqj1kez5DIsvthY3iVEiJzk2y9EbiL6ZEpsorklRf0Nm3tNiMhFecji7VxCjpYv
	tWAyTEQ2qYOvs5q6Utqd6xa9IF0gdF0JtpCPeHqBkhVMCqpCpSoFdesYI86aM+/Frj1tknCqILsse
	NrobmY7SRh7Ip72HaxLf2d6OX/7262nA3KBG4r7ijT7/9saEJq2qVtx1DbZ6YcCt5VIOQ18CFufp/
	drc2QWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCwK-0000000GMab-2MFB;
	Thu, 16 Jul 2026 03:39:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCwH-0000000GMZi-3hIB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 03:39:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47362928f65so5493111f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 20:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784173147; cv=none;
        d=google.com; s=arc-20260327;
        b=UaJLzw7Ak+WxcxAweIsKfvCqulwmvTtVNHXvAp79TVswigGha7+4H1lU7luGf3KXWF
         mWTPbCMGq4Ap0pT2wpBQBDFhmlaECB/jYWMvGm4oECi0YJhAz+pFwjawrr0RLdudnes9
         ow4RwCINjk5EqPCAGe4wjKvHfpeCHJMA18FRdfeUcQwtwv5YJEaVvdyUSCS9HGCNbNwt
         wkj6wTWY68b6F7aTRV/ZY3TIMD+qe8riuLukvKgN6l8WLWd2lB5hQhtdQhPi7KJiDXkM
         0B7atfyviElK8CyMBkzsa5px8jTZ0S32KexM8iAss63sS4VR1KGxG/h/QUHZK5swGSma
         OBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HaAi6r0o04lXEAunGEp84mPQVwuTB4awISro/owjdbQ=;
        fh=NrlpzxG/9w2wXLYTfcIpkasUwtldEbdPDwzmGR0b7G8=;
        b=VjFy5VL0KGKxkO/b+zNqwJ6FZTZumLmZMgVOv0F6U1NMQlXXVoxf80qa+izDqY7PNW
         cMfGiy7cihgbYaeVPzqukrvDBrT/EHiAf3E4TbKV3Q093eUy8yJeTXyLnSQeMK89WRVs
         ve5fERLx9n7C+rrMak+obZe6j10JiRFzfmZxTAJtNvyC2ospHRc1HPMYPrX4Cu94yAli
         oYCKRDUOKYzPb8vSX8X+pWws2lTiUhmLSCdu1f8c5Mb/cambspjylaf33FHdf3ieOMlB
         Dnuc70+J4m5w+bZUsjda2SY09+UPW6da/2q9HNJ16z1MeS90OmmgWYUuIami+JBz7Mpf
         I5lw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784173147; x=1784777947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HaAi6r0o04lXEAunGEp84mPQVwuTB4awISro/owjdbQ=;
        b=Tw3pOt7trewIv30g4S2N2qfefH4uPIfS09o8+FoLcaYerqM4rV1UQsbZdhL0y8ZnfD
         wk9krdK27P1gYhScG8GgPlkDiHzCo8GG4CwhuPl24uL17pVCMJbipacBTSzh0XxbE0FY
         vtNqrsfZFrc54eTgXtwCZBlRfUGtivlWezbqkS/c7ue7V/jVLFKsNz14wX3K0qdWE0vN
         JSrnMgJLGeXCVSU7ZhYohiXUV0PdBtyvwIxNFvucm5fdF9NjgJuerh7Lbq/Dfr030Q7B
         YLQKAd5el6B3OmBIGP9nAphSGZKCRdF/x22fqlTu/krRIeSuMVt07p3jJz1qWl80Q7dp
         /7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784173147; x=1784777947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaAi6r0o04lXEAunGEp84mPQVwuTB4awISro/owjdbQ=;
        b=ifJN17F8dgOboqtvHObyYOVkzA8b5+aL0hgPq99A5kHwTXM+6klxsTzW7yMBMPXd3N
         zkq22ds+eJUlnJ8gJ82q976pEc83alRNBDT5aW7GA/PSPHI73bYDXBasX4tW32W4IuDS
         3mPLYDWxs4eR2fbnmHqkOlzZF97+763UUM59O5puPt14RGwHIVJe0hKWBNKLOz2dwGOQ
         N/CXLjzigUe0KURC949QE+UuWh/KmfH/XV25GjSUvkvES82gvrUYjpRldaBYEr+auoHx
         6650g+Isa31Oq+ZHTu2Dgd9RJ2RDdowea+GAhsy56WW+1qxnBNwDZ+3Vsdf+iOKhMwS1
         YdwA==
X-Forwarded-Encrypted: i=1; AHgh+RrP/uJYaaefJ4d3+JKQm7ck+jG7AYwufEhbdWa9EIuYzyNuu+zAKrqPptrYlwU1I8fpFPdp+z7I8nwKGiouooai@lists.infradead.org
X-Gm-Message-State: AOJu0YyayfOx8ufjXTdCkg98wq9sCZ4Zd82imSejwrjL/vrSrL6fCetY
	ciM2p6y65CWx8JDkVUVrur0gXNC8++BqWd0cnt+nXApRg/VjC3sNFlVvdGq/1eA4KtpgFpoc8Ua
	g+kUanmwyywVtGbjlLdL32nSw+17wJ2A=
X-Gm-Gg: AfdE7cloG1HA3bxhwFaxIGDsZMa45oFqLs2O4Zhr9XqkxNro8UhHV+uo9hgkrcdJl+s
	XyQ7zQeKjYXh/7/bH4w/cxptAsjRjIaGV7cpGPeyLLeKBKVjW8vGxTAKTcsNrTr5pyE4Klad2M5
	/LLXrULQPZaAVi6CjTCDOTECX8tXFhyU3EcTph7S4P5EMe/fOla86pxoJYJzOhZBroP6Qik8eLj
	KdGBW7TyVrh/rT03t1bob/oPJIaGdLlqL5wZOekgYDaPyD6uNi7qQb19HZZwrYMpzuYPf3+
X-Received: by 2002:a05:6000:461c:b0:473:506a:e47c with SMTP id
 ffacd0b85a97d-47f4886399amr11638724f8f.26.1784173146909; Wed, 15 Jul 2026
 20:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
 <CANbgqATR-V0rRGfzj0hdJ2hsJex-iWzHMwD1L4vavTi2Jd79Kw@mail.gmail.com>
 <alfV1691ZgZ6KylX@venus> <2301403.NgBsaNRSFp@phil>
In-Reply-To: <2301403.NgBsaNRSFp@phil>
From: Andy Yan <andyshrk@gmail.com>
Date: Thu, 16 Jul 2026 11:38:53 +0800
X-Gm-Features: AUfX_myr_sOq7hYE4m85iq51mdLC4kRmODLTYq7q95ypFNA8vqcVX-4llt0DR9M
Message-ID: <CANbgqASSwGjnUsqmpyPgYQ8Qy_6++krbVMQQywB8oJv8Jziz-g@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] drm/rockchip: dw_dp: Add runtime PM support
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, yubing.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_203910_118790_07CA11C4 
X-CRM114-Status: GOOD (  27.42  )
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

Hello =EF=BC=8C

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B47=E6=9C=8816=E6=97=
=A5=E5=91=A8=E5=9B=9B 03:30=E5=86=99=E9=81=93=EF=BC=9A
>
> Am Mittwoch, 15. Juli 2026, 21:00:12 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sebastian Reichel:
> > Hello Andy,
> >
> > On Tue, Jul 14, 2026 at 06:08:06PM +0800, Andy Yan wrote:
> > > > @@ -58,6 +59,8 @@ static void dw_dp_rockchip_hpd_sw_sel(void *data,=
 bool
> > > > force_hpd_from_sw)
> > > >
> > > >         dp->hpd_sel =3D force_hpd_from_sw;
> > > >
> > > > +       ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
> > >
> > > This can triger  HPD irq for USB-C DP AltMode, but for a standard
> > > DP port, this is no way to acquire runtime, so there will no irq
> > > when plug in.
> >
> > Right. I don't have any RK3588 or RK3576 system exposing a DP
> > connector directly. This this is non-trivial to test for me :/
> >
> > I see the following options:
> >
> > 1. Only enable runtime PM when running in USB-C mode
> > 2. Mux the HPD pin as GPIO to support waking up with the controller
> >    being suspended; either remux when the controller is awake or use
> >    the same mechanism as USB-C to do software based HPD on top of the
> >    GPIO (which would allow using any GPIO as HPD).
> > 3. Have a poll function, which wakes up the controller regularly to
> >    check the status
> >
> > I consider going for option 1 for now, which allows option 2 to be
> > implemented as a follow up. Mostly to avoid that the series becomes
> > as big and messy as the USBDP PHY series became.
>
> I'd agree with that solution.
> I think we can all agree that option 3 is baaaad :-) .

  I'm also in favor of moving ahead with 1.

  About Option 2: we've got a GPIO-based HPD workaround in our  BSP
tree, but it's a bit flaky in some use-cases=EF=BC=9A
  According to the DP spec, there are two types of interrupts:
  1.  HOTPLUG_IRQ: A level-transition pulse that must be sustained for
at least 2=E2=80=AFms.
  2. HPD_IRQ:  A low-level pulse with a duration between 0.25=E2=80=AFms ~ =
2=E2=80=AFms.
 With the GPIO-based solution, it is difficult to reliably detect such
short pulses.


>
> So with 1, functionality keeps working, and then someone can put the
> special HPD handling on top later - the Rock-5-ITX does expose the DP1
> (on a hdmi port)
>
>
> Heiko
>
>

