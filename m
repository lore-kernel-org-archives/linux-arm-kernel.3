Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97485D148AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYeFfJDOtbvDKy6cB1/fU/DI+WOGrumUUZyn+Dpeblk=; b=OxCyFEh10wrt+1H49WfimoWnIM
	TtZOlCxaQ3U/CdqEtU4zOMrfHpsfxMYk3XyHEc0g6Gd0+ADPwZ2zzzu8v0S9Cb0enxuEnqsM+AOPZ
	nX/wA8vol5heT/n1tmCMyDZJgg8gu2E8tYYoLsEeP/cjQ7l1Hq3cZ2JWVcbU22jJtYL8kZy37Fi/T
	CeOsy+YFbb0+M8VVYyTsO7ZU9CPlga/9KUOIdcDDA0md46Y4l5jNeSFf7ofWo96VPM9bZ89iaEdc2
	hZ8ydtMOLGSx/J3VrWNiyQGvvhYKz6j0jgh7JLHkTGTN+PTDPGlpU+bLyGtZI/uQXZ8+fb7xtqbga
	I/grDbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjyc-0000000G2ym-0yIh;
	Thu, 08 Jan 2026 06:58:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjya-0000000G2yK-4C6l
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Jan 2026 06:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sYeFfJDOtbvDKy6cB1/fU/DI+WOGrumUUZyn+Dpeblk=; b=hPrOKXbjnkb4sBk96l78VKaJ/8
	bFAod3wN9jlhjYtnxEww9Vn96EVRsgOUFRLYQ+trO9pRzLc6SulK8EWYGCraehLp30FPLZw/WVC6m
	lqrWtMFvUCQZClOzThQYJHLZmlyIjXGcG4Qwwi2fdcBG2CrcFzcoPUO6IUL+ZB+UVilSEG+VY89cp
	RNm1mD+TPeg0mxISY8zoR8x1XlIxjE9L8vVim723+A6FGDR4vW4VjIzSUa0pQgGIqVg/xGpoFbOao
	I7Z1GiPsJGLcivr6BXJ0gzHidGlWDG20l1zaUV8CRAP1lXU1xY5nESfTAaOl0diSGPqHXuQKtU1BU
	Q7kr8mWQ==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjyX-0000000Cco4-2PSt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:58:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b7277324204so444662866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 22:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855507; x=1768460307; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYeFfJDOtbvDKy6cB1/fU/DI+WOGrumUUZyn+Dpeblk=;
        b=VdGeR/7GMs+ZpWM1EHk0OfK0wv4xjk38e9GH1xiQm3LQ23c4xpHR/ERmZdBDQuhYGm
         sZZ6INa6PNl0x7EnoKrIx4O4s/zfFW7eYZW9s3isHl6n5RJj90iAwbR53C+e7nhCY4XV
         IvgLgP6YFWg4tZRR0zq8koG5RPWTzh+SmjyaQLd6xW5PaIR91nNS2tvAZG4f1EkOf/hJ
         GFVW29zbzJ4J/37HXsvL0hmlazuVCsaOb99AERRvxdMyhwkjx6ZJ0hZFDzmJig9vt4eg
         EkKZX8WJQpW+QAdFryDXl5RkDiGAq2E4E5OVOFxn1Wljy0cM99fnw01MO9k+WGIaSZvE
         XJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855507; x=1768460307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYeFfJDOtbvDKy6cB1/fU/DI+WOGrumUUZyn+Dpeblk=;
        b=clBJb6sa2CgkmCEL9SS/4gtke/Hyx2nsB7rhHI+cuKAsD0n/54PuU+U6zn/Hs1WJGD
         YU/lTGkwize3Z8wHzGl2Hqn5UY9uvqOQlTWNH6OqpSvukghSSCBmKV2KqYnnsPJn9L56
         yiSz1/bEAcx2vR+cxMiAvhoQ0xbs4jxaHcr8WW/lV4LiJI1/5jbbyCg5WsZrxRjwrsmF
         u/GYjhpIgTgI7PKt7Cok5wZxVnMWcGg8yaFwMlJXkXuQjZxQH17eMsVisYRPYp7Gvj0I
         Pm88GMgbLEocii8dymoeZH9Da5lN2USuHOITHhe8qOG+Unls8lbr+QuVvsc7EzkrsojL
         VQzA==
X-Forwarded-Encrypted: i=1; AJvYcCVUxv2eUkly3y+tpYW1W8kZXzlsh9m6sHE6O9/H0CD1jS95vyj567yFOH7peiHzhBRtNzSWj4Z2l4sVdtAPgUNq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywaara+9oKosDeDOIFcSHSxiXWGtfBqfvspjPQK1C464P0NTtwx
	qFE+t6ZjiCGEau53f0uetvNOIuYqahoH8kktSojICEDowRoX1ihVUNJG5vo1cyBgtXiXMqqiREt
	6ZYuhJp5z5Z0ZVvtulh4DOqE+i2/Oh1o=
X-Gm-Gg: AY/fxX58b4cpeN+RX8ZqRiKyZKOL91Arja9HdixajEiOnxlHOMrvRnUS66J1neueuc5
	tpm6NDslIkhkaztSQB14T6QTQZDfBKyKILPL/oUVcsHlEq8mWPV2Lxw0O37ysypoDi5qEwDwTBK
	bI+Lc4Nia0gtkUokIOBDkuQkCqurH6kO1QTPUA5TAKiTPHmzq05n/Q830WnU/08zBFtbhYkcjAI
	JAwO2S0EHN5ZZYTBZy0JE9mWXG1VezH8JdmEsBDlUOa8QvoLRK74Di8LwIuKqfktTa509B1jozb
	Yw==
X-Google-Smtp-Source: AGHT+IGIv8je1lwIFxUAxVKr8gjmi2iZWFwhU08dBg/NL+MZXVQZ+Lx4oYIn2q3AFG6kac8NGhSiSqj5lIo7m6W/X7g=
X-Received: by 2002:a17:907:3c91:b0:b77:2269:8de6 with SMTP id
 a640c23a62f3a-b84452334a8mr466404066b.19.1767855507070; Wed, 07 Jan 2026
 22:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-4-linux.amoon@gmail.com>
 <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org> <CACpCAL0GLMV-2p1tKAXe6R+N2c4YadH9vpEG3GdPoHTNTQSuow@mail.gmail.com>
 <080d9ed6-18f9-437e-89d4-aba8f69120fb@kernel.org>
In-Reply-To: <080d9ed6-18f9-437e-89d4-aba8f69120fb@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:28:09 +0530
X-Gm-Features: AQt7F2rN9qCMZO0iKuorur3QruVtd3JYaKO-CAyPTZyFV9EDijrAUUQ7GfBMQ5U
Message-ID: <CANAwSgRqpAopSGcZ=isLxALFcuPW0E4DBZzMhQvwRBhHMK0thg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt handler
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?B?5byg5rC45rOi?= <giraffesnn123@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_065829_911782_7990B45B 
X-CRM114-Status: GOOD (  26.88  )
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

On Wed, 7 Jan 2026 at 16:22, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 7-Jan-26 10:52, =E5=BC=A0=E6=B0=B8=E6=B3=A2 wrote:
> >> Still ideally we would solve this in another way then
> >> switching to a threaded IRQ handler.
> >>
> >> As the commit message of the mei-vsc fix mentions
> >> the root cause of these errors is typically an interrupt
> >> chip driver which uses IRQF_NO_THREAD disabling the auto
> >> threading of all interrupt handlers in RT mode.
> >>
> >> So the first question here would be to see if that flag is
> >> used in the interrupt chip and if yes, is that flag really
> >> necessary ?
> > This is very similar to the issue addressed in commit 24b176d8827d
> > ("drm/msm/dsi: Remove spurious IRQF_ONESHOT flag").
> > The IRQF_ONESHOT flag is preventing forced threading here.
> >
> > In irq_setup_forced_threading(), the conversion to threaded interrupts
> > is explicitly skipped if any of the IRQF_NO_THREAD, IRQF_PERCPU,
> > or IRQF_ONESHOT flags are present. In this case, IRQF_ONESHOT
> > appears to be the reason.
>
> Ah, well the code effectively does its own IRQF_ONESHOT handling,
> since it needs to do its own threaded-irq like handling for
> suspend/resume reasons. It disables the IRQ when it fires and
> then only re-enables it once the work has done processing the IRQ.
>
> So it should be perfectly safe to drop the IRQF_ONESHOT flag.
>
Yes, the warning disappears
> If that also works to resolve the lockdep issue that would be
> the preferred way of fixing this IMHO.
>
After applying these changes, the device initially triggered a hard reset;
And the board reboots. I need to find another way to fix this warning.

However, after several reboots, it returned to a normal boot sequence.

[   40.404525][ T5974] rockchip-dw-pcie a41000000.pcie: LTSSM_STATUS: 0x130=
011
[   40.404936][ T4957] r8169 0004:41:00.0: enabling Mem-Wr-Inval
[   40.406591][   T56] dwmmc_rockchip fe2d0000.mmc: IDMAC supports
32-bit address mode.
[   40.407370][   T56] dwmmc_rockchip fe2d0000.mmc: Using internal DMA
controller.
[   40.408013][   T56] dwmmc_rockchip fe2d0000.mmc: Version ID is 270a
[   40.408610][   T56] dwmmc_rockchip fe2d0000.mmc: DW MMC controller
at irq 104,32 bit host data width,256 deep fifo
[   40.413373][   T56] mmc_host mmc2: card is non-removable.
[   40.431072][   T56] mmc_host mmc2: Bus speed (slot 0) =3D 400000Hz
(slot req 400000Hz, actual 400000HZ div =3D 0)
[   40.468235][   T67] mmc_host mmc2: Bus speed (slot 0) =3D 300000Hz
(slot req 300000Hz, actual 300000HZ div =3D 0)
[   40.492229][ T4957] r8169 0004:41:00.0 eth0: RTL8125B,
00:e0:4c:68:00:35, XID 641, IRQ 153
[   40.492993][ T4957] r8169 0004:41:00.0 eth0: jumbo features
[frames: 16362 bytes, tx checksumming: ko]
[   40.493873][ T4957] r8169 0004:41:00.0: vgaarb: pci_notify
[   40.507133][ T5974] rockchip-dw-pcie a41000000.pcie: Received Link
up event. Starting enumeration!
[   40.508219][ T5974] pci_bus 0004:40: scanning bus
[   40.517387][ T5974] pcieport 0004:40:00.0: scanning [bus 41-41]
behind bridge, pass 0
[   40.517867][   T67] mmc_host mmc2: Bus speed (slot 0) =3D 200000Hz
(slot req 200000Hz, actual 200000HZ div =3D 0)
[   40.518336][ T5974] pci_bus 0004:41: scanning bus
[   40.519531][ T5974] pci_bus 0004:41: bus scan returning with max=3D41
[   40.520294][ T5974] pcieport 0004:40:00.0: scanning [bus 41-41]
behind bridge, pass 1
[   40.521273][ T5974] pci_bus 0004:40: bus scan returning with max=3D41
DDR ff1a08bde6 typ 25/03/13-15:39:39,fwver: v1.19
ch0 ttot10
ch1 ttot10
ch2 ttot10
ch3 ttot10
ch0 ttot16
LPDDR4X, 2112MHz
channel[0] BW=3D16 Col=3D10 Bk=3D8 CS0 Row=3D16 CS1 Row=3D16 CS=3D2 Die BW=
=3D16 Size=3D2048MB
ch1 ttot16
channel[1] BW=3D16 Col=3D10 Bk=3D8 CS0 Row=3D16 CS1 Row=3D16 CS=3D2 Die BW=
=3D16 Size=3D2048MB
ch2 ttot16
channel[2] BW=3D16 Col=3D10 Bk=3D8 CS0 Row=3D16 CS1 Row=3D16 CS=3D2 Die BW=
=3D16 Size=3D2048MB
ch3 ttot16
channel[3] BW=3D16 Col=3D10 Bk=3D8 CS0 Row=3D16 CS1 Row=3D16 CS=3D2 Die BW=
=3D16 Size=3D2048MB
Manufacturer ID:0x6
> Regards,
>
> Hans
>

Thanks
-Anand

