Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA85C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CDqLznQvkVu7WQ3vZoYAE6ZEb2I+Dl4DDzf448Rh98=; b=Bdnfzp05OPEk/r
	s49iH7cREIEKFjVeWScaUPIU4XvE3e8KOXtPhkGfE3r96xxFDoJWV+E3NoobGxM0/PEjbCOX0sDGi
	r/NZNwNifCdAIbPNxwUYiAJI9Jwf7UNHM+w1WKRpcOLUJ+MvHxN6Y8vG+fsCa8VWXm1lCqs15//41
	XSa1WmKka9ViDhD+SFb5x3DGZBXzwSjWTpG270IRlwLVaXTM2ne01GjIBjJreht4YqRdfZpLCT4n0
	FwdVJpUL44ygMWUsVhF8N1uZQEbVkEbt0gjvht+hv1q6L0KTocrYIyQ8J1up0oOqeRhg7dSotcjQq
	ASl1DRlUzCk+Z0xphtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XeX-00000002sUA-3obf;
	Fri, 04 Sep 2026 17:24:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XeW-00000002sTt-1O47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:24:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5D5D44452
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 17:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E011F0155F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788542675;
	bh=/CDqLznQvkVu7WQ3vZoYAE6ZEb2I+Dl4DDzf448Rh98=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DSbCUAoaBf0BDfPe5nbw+AB5KH61cmX95b2H4GrECOmgcWubqAUSF+QTRSuXuKJ7W
	 So0x0z73IE6ijUa/G9rzZeyi6XXSdOCJpEK1oP0odVfwTNd9h7hU4p7kbn9tbBzUkI
	 oInQ77/mksSytpVmjMak/Lh1ZpwaM5Z7jIk/Jv59U6t216lhGAQBi4a+g3PJdstRji
	 qrFVpmYGS3RsbLRcnKlpuulzpxXD2M11HxGYsFBaJtmdQNOmwYOOAU6PeH3T0Tjlz3
	 dYfLpT7avAUwMSnxOhcRqJ7tStlmGT5PgYp+NABfyd5BpMETqLNwc/PXFTiF24ERqi
	 9BoXQ1Qr/orZQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a2e9851ed7so12108951fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 10:24:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzP5ZF3mONqOqUIJcK1J/xFIjc8h0XsdjKP/tQkRaaq+MbUOLEaCHWNsRhYGl7PDFFyYkPp2HDRgaudarxvFNAl@lists.infradead.org
X-Gm-Message-State: AFuF++nwMQueCELf2vHWW/1JHRgoWRusxaAquUQSREt5vQ7QR7PkxLs0
	fG1qYNaL50ISFXQ+VIWXarjYPiR8xJeyZEWkDXKq9g+ZCC8GDKDq9KsRSUcMp0v4nvYmbHszKpM
	b+fvHTTuMbWo/qBFGkDRvpQVgJE8ZLGE=
X-Received: by 2002:a2e:a54f:0:b0:3a3:314d:115e with SMTP id
 38308e7fff4ca-3a371bc73e4mr9829551fa.10.1788542673867; Fri, 04 Sep 2026
 10:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260904084158.1341550-1-wenst@chromium.org> <20260904084158.1341550-8-wenst@chromium.org>
 <2026090430-botanist-ungodly-0299@gregkh>
In-Reply-To: <2026090430-botanist-ungodly-0299@gregkh>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 5 Sep 2026 01:24:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v65MSxL+r+wqMjPKVSh9aS1gkn8og6oBinSXDdipnoOyCQ@mail.gmail.com>
X-Gm-Features: AcwNN1XsOjcnbmZTa6fnJtFKjvQsiEWmd4_rlrVRXh_dounYDIlqWUAfitdifNU
Message-ID: <CAGb2v65MSxL+r+wqMjPKVSh9aS1gkn8og6oBinSXDdipnoOyCQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related APIs
 to port.h
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Sep 5, 2026 at 12:47=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> > |struct usb_port| and its matching container_of() macro should live in
> > its own port.h, matching the split we have for .c files.
>
> Why?

This was requested by Andy. And to me it sort of made sense.

> > Move them as described. Also move usb_port_is_power_on(), since in the
> > next change its |struct usb_hub *| parameter will be changed to
> > |struct usb_port *|, and becomes a non-static function that only
> > references |struct usb_port|.
>
> No, please don't do that unless you have a really good reason.

Which part? Move the code?

> >
> > port.h is only included from hub.h, as a subsequent patch will directly
> > use fields from |struct usb_port| in a static inline helper in hub.h.
> > The USB internal headers don't have header guards to help with this.
> >
> > Also drop 'extern' from the header declaration of usb_port_is_power_on(=
).
> > This is not needed in modern C.
> >
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v4:
> > - Dropped 'extern' (Andy)
> >
> > Changes since v3:
> > - New patch (Andy)
> > ---
> >  drivers/usb/core/hub.c  | 16 ----------
> >  drivers/usb/core/hub.h  | 48 ++---------------------------
> >  drivers/usb/core/port.c | 16 ++++++++++
> >  drivers/usb/core/port.h | 68 +++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 86 insertions(+), 62 deletions(-)
> >  create mode 100644 drivers/usb/core/port.h
>
> hub.h is small enough, making a single .h file that is 68 lines long
> for no real good reason isn't a good idea.  Odds are this will make the
> build take longer as you now need to open/read/close another file.

OK. Andy, can you accept not doing the move?

> And if we really want to do this, it shouldn't be burried in the middle
> of a long "enable this platform" series where people will miss it.

Well the code is also touched in this series, so it is related. Without
the change, the code movement makes even less sense, as mentioned in the
commit message.

As for missing the patch, I can change the series name to something
like "usb: Hook up pwrseq for USB power control on M.2 E-key slots".
The series spans multiple subsystems and even the driver core, and the
goal is to enable M.2 E-key slots, so hopefully that ticks all the boxes.
Except which platform is affected that is.


ChenYu




> Thanks to Alan's review for making me notice it.
>
> thanks,
>
> greg k-h
>

