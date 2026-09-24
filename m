Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838A3C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=; b=4kZO7HXhY4ixt463SzyUrJEWoi
	ouA0ezzHTnK+2C9pkWt+n8d3yWZbpyRc53uQ1WWtaVmPqjZHwgAU0Q33GNGF18lWGR352z5dj5EJ3
	HuePOe3wX1ukXPE34Lx5JNsCsHeN/c57V+My2Cn7H+isNbDjdOgYqyd4QHKH+TWCNMsApDJqltxDW
	Rc2kfrx08QwVnkP0pQn5tYCuwf80GM9fdky4fIbObf2VgQScpv8gS12oua6OhM1B95cN2sbee3zwr
	YD8tnXWgJiDLA/4/IXsnno8EsAGPneHfKUqL3bpVCmHCyk82DAmyoa2qFuM/HDdZb+Tsyg8/Eg4p4
	3IBmlpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kqU-0000000BJVV-0AEd;
	Thu, 24 Sep 2026 14:54:46 +0000
Received: from mail-ed2-x26.google.com ([2a00:1450:4864:33::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kqQ-0000000BJUv-3Tdh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:54:44 +0000
Received: by mail-ed2-x26.google.com with SMTP id 4fb4d7f45d1cf-6aa13e194easo3415674a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790261680; cv=none;
        d=google.com; s=arc-20260327;
        b=gFUp0KDg9Wbc/Z6HPCe+ByUXtPLu/mm0b7EnIur7FRd/89rKSeFHsWA0LHjXlgjpSz
         mjlu9Yk5mJpvqpB392aq9//+SFbSh04sSnFAmHS/8eToNxgbycirtS/TQB5cWh13c6ui
         rWuisHHOocrqBxXhMapcj0/Qbkf/+RTkVB4fm8dC4GUSBZvRaUS9gCV3doh+DgEnJnOa
         gdjd8qRExssk5w2gh0Ud5xCozaqzNJpSeOZP+xo4Mg+fDR24lPanL0Rue9wiaPnXnC1L
         SMyaJ6tT+BLIQpJ69LtzzORd7ifLFRd0jNKgpx8RkTuhbQjLq3kzO7Bfpu4JHbQhMYku
         12ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        fh=q+hGHize4yoDP/bAjQIngopt6/r8hfHxGZH98ODWLh0=;
        b=g+epLJl34lq65s0i71n22jZHTfJdoMxYoaKVr6PLbTChiurZYSWVKBmgnRjelcxvXb
         w/hLS3bhHwuaegBae6iwHTbemaalP7FoRbFplqiViByEVlIvSsPndOKQKeWX0eguyGSW
         TjJFA65jwwsmwvWp1xPOPg3Hzw19NH6Hu3V2R4gu4nhjjahyBxF8cO53l03kvFSGoYzY
         JDqO6Pg3IrQ/zLBzS0+0Kcf4JRBg0fm4y6WlH+QGevI3Cpdf5hqo+Z2DCfc6gxKKx6vF
         tix7bsfL2y9YiSi6kSc5um1sh0uyG7KYN+D1Kacjh1coR19o6I2WfJxAmYHcE/KTFcoF
         qeUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790261680; x=1790866480; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        b=h/YSfnFIpdGfVcl9QQqCwsFIefsgadW9Ufo7w+egz2ikX3JLw7HBdXCj08FQ9cmnff
         IbxtElmSimngTOpacZi96guVL70bQiLonEw8QdYg0lySmqNb7Oqvl3IslChuUpxki06h
         Ylca5IrqpIYo5h7WymNZG+9PeF0Q1GVWnuymoAWSqK1ITHylUnGxIiulD2ZoCA0f76P5
         WpORhHpnyVAutSqEIj60NXM0w2GctoBATwUMbw1KiENq1Ncc195XYv8espxjlm1ZPvKy
         rEgckes5zCu1OJrsA4YA7b5tdtkzZQ7khnrgVlyQ+niJQHVp5wXPE6FrrOp4qaUsRHP9
         9WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261680; x=1790866480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        b=Q1vPzyW/MFAxnoJPSJFUVtqUokOR/sNC0CxVCdTn3/bylh8v+74UtgeRPjzwVzBeBN
         SOmNoqVolTdfRfS62Dbpm/4us20HY85rX8C+U7oIOji71jczojMlEESz08dZPMC05jvU
         Af5zBNyr1/xupxNHTkAMWbqj91q2AN/D51yM2x4+rKEUlqxdUR+h0vj+WIUJsXwhELro
         eO2+c3SBYFAuO3eGtHwIV7UkmHb5tuO+x7+/eVF6qW5Q4uoThImMxWFDl5Dttb6+z4Xg
         XNBGjc2JlMIpDbF35676lK0ECFRuOnBHKEiS/FRcmL35qJZh3BPjgwnblD7g7C5E99h2
         A3ng==
X-Forwarded-Encrypted: i=1; AKwUvBy3LM2ajAFPgx2/qVAC6Hf1lOFB/XEMsaJm5iGsedMaCShBPjyoIsbXP51qBRn8RA8DdhGAEKo9n1IyCmbVXLPv@lists.infradead.org
X-Gm-Message-State: AFuF++kPH8nQ29kUH8KF7Y2Z2HoJBD+qPZqKQ+lLHKCKLGxDiTLr5Nlx
	y2ymTzoeZh07EuRz11xKL5YOXvV34gH/CslBsufR+LZdmiuoZKocDjSBrjUNOKl+dbjkkpwmm3c
	NEot9aFGAJA+VC15XWlmxK0SP87IlGf43W6x8iZMY/Q==
X-Gm-Gg: AYBFou3+/N7sJd5Nsl68/wnKfbyxGZlb48Np0ISOcvHDf8W+6Oeb3j0SVolBpPmi8UC
	AzBWCabm+Jc1W5npV+YGc2YkNUVV9FBaJwKQX+s9pz3ihVlC/04P+LyrSOWgP8kR4dxtSWOGds4
	imJFJapFK7K9D4YLs7168EKfinRPzHnQzyOdrhC/OyHagtRmA39XjqCi+ANxjQ0Hai32t0Glxp6
	4luXMegIsU8GLAydpSfGvSwIMsf57NSx0VRVyx2/jZOZkVGKkStzry1gM6zpb/9t3OWHhlqM9PD
	vPllNGNKXa+vKi5/4BYPK4gh8dhgImPTPuSw1bzRgJkHNrHr8gVQOzTCUEzsmYAq5DXce9XDg/e
	AJ1CaSSxHyhBI9/f2AudNLYyu
X-Received: by 2002:a05:6402:5110:b0:6aa:932:7b51 with SMTP id
 4fb4d7f45d1cf-6aac90c8a6amr2540369a12.28.1790261680223; Thu, 24 Sep 2026
 07:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Sep 2026 08:54:29 -0600
X-Gm-Features: AclHuK8a_-TqJQY1w6hSbt62KYLX7bNKh0_jYOMr-qlDR34nbomWXG0un97vMAU
Message-ID: <CANLsYkwCE07uV1fa_R3ztmErd7pSDh5_OG=-W8N5bsuhqnJ34w@mail.gmail.com>
Subject: Re: [PATCH v16 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_075442_931075_3736345F 
X-CRM114-Status: GOOD (  30.49  )
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

On Wed, 23 Sept 2026 at 12:43, Shenwei Wang <shenwei.wang@oss.nxp.com> wrot=
e:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v16:
>   - Removed linux/mod_devicetable.h and an extra comma per Uwe's feedback=
.
>   - Added the "packed" attribute to struct rpmsg_gpio_response and set
>     "can_sleep =3D true", per Sashiko's review comments.
>   - Removed the channel node from the rpmsg node in dts layout.
>

I will not review any new patchset on this topic until an agreement is
reached on the DT bindings.  Rob and Krzysztof haven't replied to my
previous email, which leads me to believe they have questions or
comments from earlier versions that haven't been addressed.  I suggest
looking into that instead of spinning off new versions.


> Changes in v15:
>  - Update Kconfig description per AndrewD and Julian's feedback
>  - Enable the GPIO driver even without a DT node per AndrewD's feedback
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback
>  - Code cleanup according the new gpio-rpmsg.rst and sashiko-bot's review
>    feedback
>
> Changes in v14:
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
>  - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.
>
> Changes in v13:
>  - drop the support for legacy NXP firmware.
>  - remove the fixed_up hooks from the rpmsg gpio driver.
>  - code cleanup.
>
> Changes in v12:
>  - Fixed the "underline" warning reported by Randy.
>
> Changes in v11:
>  - Expand RPMSG for the first time per Shuah's review comment.
>
> Changes in v10:
>  - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
>  - Add a kernel CONFIG for fixed up handlers and only enable it on
>    i.MX products.
>  - Fixed bugs reported by kernel test robot.
>
> Changes in v9:
>  - Reuse the gpio-virtio design for command and IRQ type definitions.
>  - Remove msg_id, version, and vendor fields from the generic protocol.
>  - Add fixed-up handlers to support legacy firmware.
>
> Changes in v8:
>  - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
>    by the kernel test robot.
>  - Move the .rst patch before the .yaml patch.
>  - Handle the "ngpios" DT property based on Andrew's feedback.
>
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
>
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
>
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
>
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
>
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
>
> Shenwei Wang (5):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   rpmsg: core: match rpmsg device IDs by prefix
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  46 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  23 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 585 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 973 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>

