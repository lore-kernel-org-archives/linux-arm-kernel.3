Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C33C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 22:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8PcdViVM9JE8IbZsZm/xllXdMrlzsbljuByQCZPh34=; b=h0HdNP7sAC6Y8xaxSV8UaKYaVi
	/vgvEuDqUIx7RC9rmDWCemGthyh6eIVL5LJMEfqPDP8BlxxA/D3uhowB8qIaDo0kbGk/5W/704q6c
	KJUHzagUcywIPs5xx+ME5oA3034wTomUpEk9yk8i7I1mcORPSBJLpzYZ1vEZBVnpFbnHdsUYMGgja
	b4gMzHGT1u55Hux8W6F7UQyhTmzF7AvfeF5WzR677lI8dwagoIWYePV8ztzXCemaPNWSuJVHXdAlp
	cU+tDGH2kKiYGvzo7Y0ykd+Nb7cMZcPmGn2k8yuaKsyVfF15UJGHPGudcUo1YvsbdMgqoW1NR+kIL
	r4xKqGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukVkd-00000003n7i-3Xfy;
	Fri, 08 Aug 2025 22:39:51 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukVi8-00000003n0r-090o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 22:37:17 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-711751e2d9fso1235987b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 15:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754692635; x=1755297435; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8PcdViVM9JE8IbZsZm/xllXdMrlzsbljuByQCZPh34=;
        b=AnM1lxTUo1P4+TJKZ0GOtOlpIuXeio1QUl5p6C31+wLDCUiO0vomDOLVTVq8x679cZ
         QOGYqTLx7uQ0iUZvEsueTfEp5mrLqGALOSKkdG6NutX2CAwPbRrQ5vOJU95J1siFJdHD
         Ai9UieHeppt/BdUe4Q5SAcrnVZtSJPk/r6nPBTRkOaw9nL6dp2ABEzcFiFuhEzkYPdYQ
         AvhfgfdDpHS/LNNuYssTcuOuGQX3Fko3BJxSrg/1Yu4nETAaoXZilbEM5Afc5SJGXJEH
         nsWCm2/D34xa+4Qhv4WpVlfWBwtpk/mdtzq4Q+RsMQpl52EplRis2wJ1sr+vP+PnwerW
         gegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754692635; x=1755297435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8PcdViVM9JE8IbZsZm/xllXdMrlzsbljuByQCZPh34=;
        b=P6++urJO/H/6mQInmo3iPqJy8uYFTBwspi5433GW/pjhmr0Ywikb/D079AnGIjOmML
         LAeuLZoKM9+aQEBqlf4SaMO0uRCEQlV8NTbqAcmXu87NhF0O5pEcM81DgglZmu1Aob6C
         shCFUHJs5Tis7oAM/ur/FFe2AbBOnDe2afPsy7LUzEkAvMiVbkc4hXtAF7MWMfsmuo3K
         fMCBmmOBDshEs9XeElNS6iaBrNMYWEU68OdKhDjfRElk2RJl7s9jJwnEWVt+aikZLmCR
         se79OFVrCn5/Jvpa+JqlfB34j/jLOHXjA84NjQro3e7UyQf0SR10cLitRlpkT4yAxlY0
         4GQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsOeUbk4qbcEqEebZLESGOIQYz5FQDb0KSsKFYD0EeLAnn+3K0IxH1Iaq7jIeO6P3XkhKcsn3tRPr2s+8UOaWp@lists.infradead.org
X-Gm-Message-State: AOJu0YwaVF7/D33xXjXHp+l4BmYOzzeD5m8Ssl3f3WQ09xIPx+8sB917
	aodDAI8KrxwgEIStNXm0l06+GEBUyIFGG3qjMJLDNmN2EU8q2q2+8jkPxvslpir5XnQ1PAJov8l
	DqtGVBD2Ttz/cdB5+Bs77IzyYwdp4EN4=
X-Gm-Gg: ASbGnctUfyBYL+S/U6LO7Y73Pu9xyN5G389BWZm6/1A03Z3ZghYRCmLgnOqwx0sbiRL
	keCnjUFO4zaRaPqMf3Jlyut83MKNSg7gMs3nNUdIVwho3UY1/NU17IFtnUcINS1Gh1IIHKM7SVg
	Rv1x5kpvE4s5OkUl9qTmXbuzLNoGkHkNMtPRbnDNgjhVoVjibB5i226HHKjbdAuoGtURnNGwxYc
	uDykFE=
X-Google-Smtp-Source: AGHT+IH/XOBhWDGZF7tzd1bJiHZgTVQajMTE0Df6YY0Q1oHeFqhiksv2ysGW44ElsIxDlyJzzEz12bHe8e1R0ERq4zA=
X-Received: by 2002:a05:690c:6c87:b0:71a:2d5f:49d8 with SMTP id
 00721157ae682-71c0830fb07mr3640127b3.3.1754692634671; Fri, 08 Aug 2025
 15:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250804154750.28249-1-l.rubusch@gmail.com> <20250804154750.28249-2-l.rubusch@gmail.com>
 <20250804213213d4844d4e@mail.local> <CAFXKEHZn0XQMe6RBHDJzcGZy+JPpNpfidD1mT2MBmZ_WamFQKQ@mail.gmail.com>
 <202508052224366c9bb920@mail.local>
In-Reply-To: <202508052224366c9bb920@mail.local>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sat, 9 Aug 2025 00:36:38 +0200
X-Gm-Features: Ac12FXwrj9u2mr9B3E8JKtkTjq0XV8wLc19QmZz6-lCwcXpxcioBMrR874zHxXU
Message-ID: <CAFXKEHZee0c4=ETwA=P_MP2+O+01s0dwS=5EjeK1Gkk3PRDNHg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: michal.simek@amd.com, srinivas.neeli@xilinx.com, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ivan Vera <ivan.vera@enclustra.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_153716_076801_E3C74CFF 
X-CRM114-Status: GOOD (  50.91  )
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

On Wed, Aug 6, 2025 at 12:24=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 05/08/2025 23:56:46+0200, Lothar Rubusch wrote:
> > On Mon, Aug 4, 2025 at 11:32=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 04/08/2025 15:47:50+0000, Lothar Rubusch wrote:
> > > > From: Ivan Vera <ivan.vera@enclustra.com>
> > (...)
> > > > diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > > > index f39102b66eac..0c063c3fae52 100644
> > > > --- a/drivers/rtc/rtc-zynqmp.c
> > > > +++ b/drivers/rtc/rtc-zynqmp.c
> > > > @@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_devic=
e *pdev)
> > > >               if (ret)
> > > >                       xrtcdev->freq =3D RTC_CALIB_DEF;
> > > >       }
> > > > -     ret =3D readl(xrtcdev->reg_base + RTC_CALIB_RD);
> > > > -     if (!ret)
> > > > -             writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_=
WR));
> > > > +
> > > > +     /* Enable unconditional re-calibration to RTC_CALIB_DEF or DT=
B entry. */
> > > > +     writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);
> > >
> > > Doesn't this forcefully overwrite the proper value that has been set
> > > from userspace and so trashes the time at each reboot?
> > >
> > Yes, it overwrites the calibration, i.e. counting 1sec in about 1sec.
> > No, the time/date is not actually "trashed" (I double-checked that
> > with timesyncd disabled, having and not having register content and
> > over several reboots keeping a bogus date/time - it psersistet in the
> > same time space. The current patch always overwrites the calib
> > register content. So, a manual userspace setting will be lost after
> > reboot. That's true.
>
> It is about 1sec on your platform because it didn't deviate too much
> from the expected value but what if another platform needs a way
> different value? Then you are introducing the same issue as the one you
> are trying to fix but it will have it at each reboot.
>
I guess you missunderstood me here a bit. I understand that every
scenario will need individual calibration especially over time.

> >
> > Would it rather make sense to extend it, say, instead of merely
> > checking whether the calibration register contains any data - which
> > could potentially be incorrect - also check for the presence of a
> > calibration property in the devicetree (or a similar property, since
> > 'calibration' may be deprecated)? If such a property exists, perform a
> > re-calibration based on the devicetree at every reboot. Otherwise,
> > retain the current behavior of checking whether the register is empty?
> >
> > > Isn't the proper way to reset it to simply set the offset from usersp=
ace
> > > again?
> > >
> > Hm.. I'm unsure if I understood you correctly. You mean the way as
> > described in AMD's link to perform the reset by executing the devmem
> > from Linux manually? If so, why is it preferable to adjust the RTC
> > calibration manually every time this happens, rather than to simply
> > put a correction value into the devicetree properties for problematic
> > setups? Or do I miss something, is there a config file for RTC
> > calibration for doing this persistently from Linux, that I'm not aware
> > of?
> >
> > Before, the devicetree properties seemed to have generally priority
> > over userspace settings. Now, after the calibration rework, this
> > priorization seems to have changed and a devicetree calib correction
> > for such problematic cases will generally be ignored, with a
> > recommendation by Xilinx/AMD (see link in cover letter) to execute a
> > devmem command from off Linux (...). I mean, can't this be elaborated
> > a bit more to allow for a persistent correction method?
>
> The value depends on each manufactured machine/board as it is supposed
> to correct for imprecision on the input clock which is either a crystal
> or derived from a crystal. This crystal may be more or less accurate and
> its accuracy will change over time notably because of temperature
> changes or simply because it is aging. Having the value in the device
> tree is as good as having it hardcoded in the driver which is not far
> from what your are doing here. It makes the feature useless.
>
Yes, I see your point.

> What I was suggesting is simply to do the right thing, compute the
> inaccuracy and correct it from userspace, using the proper interface
> that is sysfs or the RTC_PARAM_SET ioctl for RTC_PARAM_CORRECTION
> This has to be done regularly anyway so I guess it would catch and
> correct any corrupted value in the register.
>
The degradation over time and or temperature does not match the static
approach we took of our v1 patch. I modified it still a bit to keep userspa=
ce
configurations, and use the optional devicetree property for a correction. =
But
this does not cancel out your argumentation, since the approach is still st=
atic.
So, I have to agree, thanks.

Best,
L

> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

