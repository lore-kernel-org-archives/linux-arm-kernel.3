Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12E2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/57iCSzPZz9lmb8cnuwvMg4/VJ+5z5nV92ke/d2qrv4=; b=oiDZBPK3ih3C9p0mAD6/+IwETs
	RsWhnelA3AZOHNZVpE+/srVND+itzKzK5kGt17J6GFQMf3vu/QiWMo5+/PwEgldqHJgdhcnc27Ex4
	BeoBQMTsf4P7O73DswjgCOXlpq4nlso2/qE5gaCJnaJ7dKqCVkxbH6IwYGqxNb4FA2Jp45Xg0HIRj
	BGkzAjoW40lWxY9INdFF8ywaDtJuG2uaCRL7BGLwGoWMT2ReTA0NSl62eJ3IvNnI7AhM4jqyKdjyb
	7Np2s2oulStfjLJ0JyVSWbWtg45AqebzwbBGefwfW4tjd+Ifn5a2xUbjEBTJukTRLpGbQIdd4Q8KA
	78EoU/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J9J-0000000HHv5-2yX0;
	Fri, 25 Apr 2025 13:31:25 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IIj-0000000H8vk-0jDv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:37:06 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-301cda78d48so2620534a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745584624; x=1746189424; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/57iCSzPZz9lmb8cnuwvMg4/VJ+5z5nV92ke/d2qrv4=;
        b=KzfXX5g7U7A+2xlUkfXhVn15ZJctEYIznZmMrcW4SYHvFyuyjLaoVVcQbTDpFgCL0R
         xHfPjQBJFFL4Zs0J/OkFnbu+YAgFTRw7Jszj8wqg5bvg1umQde/hJ6safpbSh66O+nM1
         ht2YHzbvCydgwj3Z4mHL9UnZpnovfnt6IUV6BNTWN04biuCSB4vMj3t4DTBK+Fp1o+DW
         P9EduYyq6cn1d3suBlyzSFyrz44ryY1FFpZeMrqW4XvxTSv5rA/Ylszm1Gx6t7mrUqtK
         qpx53qUaDifYDLfHeAPjBTvbQv7xK0Kj1YA1doyxDAMdDwsF+nV36SLwZFG3nt9msN06
         OacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745584624; x=1746189424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/57iCSzPZz9lmb8cnuwvMg4/VJ+5z5nV92ke/d2qrv4=;
        b=k7Bpy72EHJqWCZtSlvzTJlMWrvn44eY4VxjLrLBhK+JvIPGckPyF4ksdyqSHrECJ5E
         XClN9MaxwIazR/sxCUpHo3A2No7WC2dj8c3BYxzCK1vSc+FVUyeCVPhP58YXLSp367em
         t3cwkUSi/79E82c4Hin4rMOJj0lEA98TbMf1H0FbiEjIKaZg4Jcz/eR+S2WVITmTnN0g
         44EUVUYwdVt5y1d8RwipBINSxKAAK8OJZq9OYEBVFkU7AnKHBN7OTWMEA3RVwUPQwMKu
         dEkhNlFQeUdUBUNvzH6cK1hVZL+O3/mngRQMjOt7YaihaWE/W2MliTb6gdQMyYY6xIDz
         Y6HA==
X-Forwarded-Encrypted: i=1; AJvYcCUMeX4ezxMFMtfDVS99uqYx4SIf0A72M0gOdf+46kZshnU+kPqW9KBcj8rBaKffokjJUiVdkr5PmK5Ze84kfQlo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Hui0yOJk95Q9uv9IoT20I1Oc4Bxywp++SaNu9wEHsc4oVccO
	ppvk73ykVIv9XYS1cIgV7G/ul80MfJIIhmivHU8Tem2yrN7Pie49PaSX+YksfqMXlzdzzHG08rb
	vrXUDJfF4fDhk7qkpvjehtRQNb5Q=
X-Gm-Gg: ASbGncsPkNGfWH5zT0TEnUsKDSxOyR1IVPbtb6BfovKgg/CZWtP2iuzhqLsbrLOJFb/
	GfQXcQWVIc5E+zsb0C0w3cBT74Uj2sU71GMQUdqIBeBO5FlW625NRxaGbiuxUrPuA3uaahChZu2
	joy7MJsgOOcQJKld4I+qft+Q==
X-Google-Smtp-Source: AGHT+IHrZKSy9HnTH+mCEVFkPApiHf33jSDgbWuJcy2WpYPblvzFC3AtdlLf658oHgbgBeN2mhj60hOxIo9mC19fh5w=
X-Received: by 2002:a17:90a:7142:b0:2f6:be57:49d2 with SMTP id
 98e67ed59e1d1-309f7df3069mr3065139a91.17.1745584624192; Fri, 25 Apr 2025
 05:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
 <20250425121451.GP18085@pendragon.ideasonboard.com>
In-Reply-To: <20250425121451.GP18085@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 25 Apr 2025 07:36:52 -0500
X-Gm-Features: ATxdqUFspzEpPOPXt6QqvjLf6nDyAf7s4FR1KV8XPWjCOXF28L_HNZsVbYcD0QI
Message-ID: <CAHCN7xL=vgZO7TW5uZr+OBPX1EKcw2zQhYwjRokTUOHpVq_Wbw@mail.gmail.com>
Subject: Re: i.MX8M Nano ISI Channel Question
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media <linux-media@vger.kernel.org>, imx@lists.linux.dev, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_053705_211285_DBCF612A 
X-CRM114-Status: GOOD (  37.47  )
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

On Fri, Apr 25, 2025 at 7:14=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> (CC'ing Frank Li)
>
> On Thu, Apr 24, 2025 at 08:59:18PM -0500, Adam Ford wrote:
> > NXP-
> >
> > I am trying use Libcamera to capture video on an i.MX8M Nano.
> > (Hopefully, this makes Laurent smile)
> >
> > I noticed that it has a maximum capture of 1080 lines when I query it
> > with Libcamera, but the same camera on the Mini can capture at higher
> > rates.  The multimedia overview states it can handle 1 unprocessed
> > camera stream at 4kp30 without scaling.  The Nano's Ref manual later
> > states that each processing channel has one line buffer, and each line
> > buffer can store up to 2048 pixels.  It continues to describe when
> > processing higher resolution images like 4k, the line buffer from
> > other channels can be combined.
> >
> > Section 13.4.3.5 of the Nano's Ref manual (Rev 2, dated 07/2022)
> > explicitly goes into detail on how to capture up to 4k image
> > resolution by combining channel 'n' with channel 'n+1' which implies
> > there are at least two channels.
> >
> > Section 13.4.5.1 states the registers are dedicated for each channel
> > and spaced 64KB apart, but then the following table only shows the
> > base address for one, and Table 2-6 shows the ISI size is 64KB.
> >
> > The driver is currently written to only support 1 channel.  When
> > reading through the driver, it appears to require one IRQ per channel,
> > so I looked through the Nano's IRQ table (7-1), and found there are
> > three:
> > ISI Camera Channel 0 Interrupt - 16
> > ISI Camera Channel 1 Interrupt - 42
> > ISI Camera Channel 2 Interrupt - 43
> >
> > I attempted to enable a second channel by modifying the .num_channels
> > =3D 2 value in the driver, and I modified my device tree to assign a
> > second IRQ (42), but when I query the pipeline with libcamera, it
> > still doesn't show an available resolution ov 2592x1944 that is
> > supported by the camera and work on the Mini without the ISI system.
> >
> > Can someone tell me how many channels are actually available, and
> > whether or not  4Kp30 video is really available on the Nano?
>
> My understanding, based on the i.MX8MN reference manual, is that the ISI
> has a single channel. The ISI features list (13.4.1.2) reports
>
> =E2=80=A2 Supports up to 2K resolution at 30 or 60 fps (24bpp) on each ch=
annel.

I saw that which is why I was really confused when they listed 4K in
other section.
>
> If you look at the i.MX8MP reference manual, the same features list
> reports
>
> =E2=80=A2 Supports one source of 4K resolution at 30 fps (24bpp).
> =E2=80=A2 Supports up to 2K resolution at 30 or 60 fps (24bpp) on each ch=
annel.

I didn't look there, but that makes sense.

>
> There's no mention of 4K in the i.MX8MN ISI features. I expect that the
> documentation about 4K support by combining pixel buffers comes from the
> generic ISI documentation, and is not applicable to the i.MX8MN.

I suspect you're right, but the documentation is very confusing. If
that's true, maybe Frank can get the NXP people to remove the
references to the 4K capture from future documents.

Any idea is the CSI on Nano is really capable of 4-channel virtual
channels as listed in section "13.5.1.2 Features" because I believe
it's the same, or similar CSI as what is in 8M Plus and Mini, and I
don't think those are capable of virtual channels.

thanks,

adam
>
> --
> Regards,
>
> Laurent Pinchart

