Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C71CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9yYHTI4h25yt43JbI8zzKxRC8DtBUXLI6AUZFTgumw=; b=hTfpoMg0Rjbza0CtxFt2R+DHq4
	uFoGsWr9lx8XnijQ/XXJx89FLtY4kGaa00oKPxZYhFj5LsNnZ6ozCUX+2rIAVxsMsP/IGCkXw0CCa
	wLZrf1m/D/0j2nLMASCuFjt5oCvfAkWxEJlZma2raycCrrU3aI7yIKHha//e1sd2wAO+wBECp3zVm
	ZgUUaT7RWwjkcM9zQXxetNR8DS4GaxIGDTTJ2Gjw8vT9p67mRa92/qQgg8HLIqJ2Gw0tQ+peG2gKt
	nuz+pGMsIIH21b+z3FoA6BU6gmpZKt4I/XOZYXHgzu/xDREKQIW+br64N3p+7wItTi5Kc0SOmYMlf
	3rLaGccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6P-0000000Aix1-0qBv;
	Sat, 25 Oct 2025 00:25:49 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6I-0000000AipW-2VhB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:25:43 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7a28226dd13so1663565b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761351941; x=1761956741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9yYHTI4h25yt43JbI8zzKxRC8DtBUXLI6AUZFTgumw=;
        b=GjeTIIxshKjRA6dm+Yg3TA5203laCu5lKyWLFbTFeRq+NDIi4AdwI5YquX9ftvv/j6
         jRbBpnN7l93IYgw/ifQ/smAxZUXVAevBocwbyk55+fkRTzAcUs97pz0Y0Cv2FW+jplYq
         dhVnXAG0VGcOWRidAzMGMt3gvTxkdeYKiEz6MHHDeyrUdIizUlI8sdxte/FBDYXe4F/6
         WbZxzzTEgyAD5nnAXxNx+SY6FowwVXnsvFciRBz/ESlNGjRVgFHdLFPTZfRePi3eO/MD
         PsX1lsOjWSfcRVhzbf7L7CFBFQHnBZrGdoQgqN+UlMNiLrdNDJfaa4aOJPgBUgvrV4mm
         7NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351941; x=1761956741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9yYHTI4h25yt43JbI8zzKxRC8DtBUXLI6AUZFTgumw=;
        b=cClnB7mQgFZ8xG1bvmznd7al/wFlT7GXwLcMUoRlf7miZfBt3c9WF4ftgOmsZzB3os
         Ud6t18hgCBCgdvYyNGqVZ2gHS6+Q7Q3YCzIPGafM+ATe2i+hu0EadCfDH1s0klPZT9ha
         NUPcQAGktnkWG3KR96rYrTyuxMAv9+aWwnBRqs/qw2v3xwoEhVYNfcDau3OxwJk9Giu2
         elQnUFWl4QagXv8OsRzbyK2NGzMCg3mZz73mH3DxKvaC1NgR79JmRhapDhPk5RgRvLi4
         JpI5f/wczPJPSbUUyKOOys1UnBQiQVb5TYbkZS9xXFfNAUgdFJpOsNxuiYKLQMsSWlv3
         BkIA==
X-Forwarded-Encrypted: i=1; AJvYcCVjapvPUsQgiK6m1qBcwP4s8jzomMe3taf/+BKLYr82NSkYFUesJW6KWzIjKXI0qo7U/QQakzYdkKktGESQ2SG9@lists.infradead.org
X-Gm-Message-State: AOJu0YwOrGhTJdQCgONzh4WUIw649DlegL+ZH73P5KxcapGDZurnWLal
	QiBefchNEXH4yo7AeglSLZ9yeqMQXgZLk/wvLiugWGXi5EZuHyQZ0uJo4yq0APqeFQb0ZJ6BV1y
	sB343QcHCZ8B2l4lYp9hqLdoAU8AL7UWdihVWJmXx
X-Gm-Gg: ASbGncs8rnN4dzj3UVJ8zGIQf2Eo+KdTVG3zdALo1XlXeJA2CT/p8K6g1dT3TyanBQN
	eO6gq0z62iy6it+qull/3Yn0WuGS5l8iI3PIuSYMKdpviJtny7nISqizmxnBhDpafYV2gNUwyfW
	qdP5uceK8fLPLYvfsVntxBeP5RuOtRjV58y4k8EuvO9kn/aBoUL05AfsJrlCdsYEk89eAVXT3k6
	niWVQEqlPLEqMclHeaxo9G0aPQS8cwJbGO3nZPJV/ZlO2P1UOQgpLtbIFxhfJuo8eedrt6A/q6N
	j+GhLUF0jLHbQSotiEvQcZ68nHae2x/JNVeUJ5A=
X-Google-Smtp-Source: AGHT+IEAtGIYzz5GuE7d802lxFu8k5RTtfyNbMXTlexm9n6vhrEfMKv+0UkqmDG6uDjac/PGpPAozKneZs4s+CDi2dw=
X-Received: by 2002:a17:902:f78b:b0:290:ab61:6a5e with SMTP id
 d9443c01a7336-290c9ce0ad2mr375635765ad.27.1761351940750; Fri, 24 Oct 2025
 17:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251023224302.vdiryshblnkbtsfd@synopsys.com>
In-Reply-To: <20251023224302.vdiryshblnkbtsfd@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 24 Oct 2025 17:25:03 -0700
X-Gm-Features: AS18NWBOci17zFtbnd0-kPsMTuRFIm7KB3V_utgPg4fIqx_Bi1ldRxcvUNvrXRY
Message-ID: <CA+zupgx9QjT2faWeGtAy_oZffYfEXupPG-GDU9aLisrMGNohdA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172542_643280_BD5F417E 
X-CRM114-Status: GOOD (  32.38  )
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

On Thu, Oct 23, 2025 at 3:43=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Fri, Oct 17, 2025, Roy Luo wrote:
> > Add support for the DWC3 USB controller found on Google Tensor G5.
> > The controller features dual-role functionality and hibernation.
> >
> > The primary focus is implementing hibernation support in host mode,
> > enabling the controller to enter a low-power state (D3). This is
> > particularly relevant during system power state transition and
> > runtime power management for power efficiency.
> > Highlights:
> > - Align suspend callback with dwc3_suspend_common() for deciding
> >   between a full teardown and hibernation in host mode.
> > - Integration with `psw` (power switchable) and `top` power domains,
> >   managing their states and device links to support hibernation.
> > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> >   `psw` power domain events to manage controller state
> >   transitions to/from D3.
> > - Coordination of the `non_sticky` reset during power state
> >   transitions, asserting it on D3 entry and deasserting on D0 entry
> >   in hibernation scenario.
> > - Handling of high-speed and super-speed PME interrupts
> >   that are generated by remote wakeup during hibernation.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/Kconfig       |  10 +
> >  drivers/usb/dwc3/Makefile      |   1 +
> >  drivers/usb/dwc3/dwc3-google.c | 608 +++++++++++++++++++++++++++++++++
> >  3 files changed, 619 insertions(+)
> >  create mode 100644 drivers/usb/dwc3/dwc3-google.c
> >
>
> Sorry, I've been tied up with some internal projects and haven't
> reviewed this in detail yet. I think this change deserve more time and
> attention, and thus the delay.
>

No worry, thanks for paying attention to this patch!

> One of the things that stood out is that you're assuming the host
> suspend is always hibernation. While it's true that xhci suspend would
> go through the xhci hibernation flow, however, that needs to communicate
> to the glue driver here. For example, if the xhci driver is not bound,
> and the device goes into suspend, we may go through this hibernation
> flow when we should not. But maybe that's already handle? I need to
> check.

Actually the host suspend doesn't always go into hibernation.
In dwc3_google_suspend(), this driver follows the logic in
dwc3_suspend_common() in determining whether to do a full tear
down or enter hibernation.

| static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
| ...
| case DWC3_GCTL_PRTCAP_HOST:
|   if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
|     dwc3_core_exit(dwc);
|     break;
|   }

The glue and the dwc3 core have to be aligned here as there's no
way to enter hibernation if the core has been completely torn down.
As for xhci, I don't see any logic that's conditional on hibernation
so I didn't pay much attention to it, please correct me if I'm wrong.

>
> In any case, there are multiple players (xhci, xhci-plat, dwc3, glue)
> here, and I need more time to review. Appologies if this will take
> longer than usual.
>
> Thanks,
> Thinh

Looking forward to working with you to land this patch.

Thanks,
Roy Luo

