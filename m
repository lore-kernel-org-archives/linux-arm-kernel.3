Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB93E784A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 00:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvJrGIx5xr6bd4apb7bOhjYC7gT8f2fehBHgHwpjp9Q=; b=3V6Un/8oDDvwqD6p0UXXq7t3Ll
	56MEXHlWgMwx6314rNnzUFiMQk4yB12pPJLSNfrDZmkbWP/rZJqIq1wUUoHOWTGyb8IIDuKS+taNq
	gAFhxCeRQL7at/qe2bqOhtzQd/FcuU+1nXU5BcvtSmRA33vwgj5vjfKIlC0AmM4TqWQtPu6v7PD1h
	j/xOUT6wDn0nZFX3r/VqTDkaB/9CWxDqvQeonMhOtEVcjlIdnm7FWX/GDes82tazPHAlT5Kp+DsqC
	CmvESxcAOEIj3rl10ozvxTmeUORvZ8fPHyhUsZDRDGdBbHtACfeehKg0asiygNQY5gYs/cHm3XCv/
	C8mdaJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYZIp-0000000HX0K-20kT;
	Thu, 25 Dec 2025 00:34:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYZIn-0000000HWzb-1WJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 00:34:02 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0d52768ccso78266555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 16:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766622840; x=1767227640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvJrGIx5xr6bd4apb7bOhjYC7gT8f2fehBHgHwpjp9Q=;
        b=z/eR8eSkvqRQiui7LhPIzJ0UmKNeGyHmN3/rGautvhUhkxuAuL9CGoOFzPsM0fc6Dm
         9EZHhnsCkWHjhd0YRaHHHB+dWbjDGhbD1+z9ArCZUR8w9PSqFBbDT3qPADShbJv000OB
         k8DX9+jlPP60wZGmiwqgii3stF77PJzC5QnEQOEsJP4FuqTPqqR33Jf3PCnVIa59QYpT
         0Mc44/ujp2zDNrB2iuS+CXXwkHFKJP8i6wXDBiRO6pxe93T39n7SVEH5heL/qeE2CU6t
         0ajWxGFxcOn+V2QEstTnHvZfx87tEytCtftAn0Eh7GRMoIVQsXYleddAGywi5aiBba3o
         uJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766622840; x=1767227640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvJrGIx5xr6bd4apb7bOhjYC7gT8f2fehBHgHwpjp9Q=;
        b=SSdKwkGtdlONr3W7tmP2/1A8XctvwlfuLggVyKeemZ/dTs3CU91O676BYIdTRdyUs4
         4CYp9Z71H1MfeNhChqAaOHDCeLD6kQwvJ1JFfUkZ/z8hnI0DxyW9igIoEH9sQAb8gwh/
         ikUHJCyW16PvTflTLlfMtyeLIIqJVQsrrXG6noX9QRbAZ+sN/MrAK0cBopRVEkUs7QUi
         eN/sBV16XSLvYs+x88VlRtAFFct/AScMZem/03qlP/sFcTADPm2CC/xX1aLAwZ3A3J0k
         ggEoY64V7kPsa5Bfz50oAPaSZ8QQ4As2BDcOdLolhtgzn/arzSABF8EZRZeJ0/Sh2gK/
         AWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7zHoq+DDSq2SNiX4HWV85U/U4zZy1+bezpzebY3E5T3d3viDNYAysyJLNDtbpI9n5E2oQM1yaWdz0X3RVxi9b@lists.infradead.org
X-Gm-Message-State: AOJu0YxxMGi0T+3LbalftF0kS2pAj7RyHOLWn6bmyMUBmhay6pQw8/vT
	mUsrAEA+td9zxVI85d27exATzfdVGsMvKDDUSYeuoob8FlSOUySWNjjpiVMBqD+ZbumWrmhGrqi
	pYq66cCQcn04qvVZa8IEKWpg/c6D/cQy0dvK2ZDUFcv9w0ZjyiCkwGtW5
X-Gm-Gg: AY/fxX40GnxMCa4EmHBiX7RHyfDRr4VK6aVFHhVnk826DKthQizwvB1hvG+uZ2MWgO/
	SuIu8nGb3i6MC+4MI8g1OQRCiuT+OK5IkqtOqAMCzNGOc1AEheeoTCP5mPIVQSn6K5I4zJ8x7DT
	c1NIQN8OzIv5ZKyGYPJFoo32Xl6tLt5wHLmwk3yB4aKxq3q/UMlRQsA6w+NCJrSdP4LcDT4cFr1
	ETwqNNWO5prJX53T4ENYZU5JhQ9i+AeuqRfEXlx+fZO69FIQJ0hdJpvTjpbb2n2jbLkl/WbaE30
	1PJVQFcATsgzmcIyM3xgIRfiQdh2
X-Google-Smtp-Source: AGHT+IGCFNQwV2B9gW85beRpO1nk7W/XQi6wwn5DJO7Zav/pmROHDw2dRc82S2a7AH7ihqx3VW/rLaLZrRoY8NOchKM=
X-Received: by 2002:a05:7022:3718:b0:119:e56b:9593 with SMTP id
 a92af1059eb24-121722ed87cmr19469821c88.24.1766622839122; Wed, 24 Dec 2025
 16:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20251222-phyb4-v9-0-82c0b671b070@google.com> <20251222-phyb4-v9-2-82c0b671b070@google.com>
 <aUqhbVFHczpL9qnL@vaman> <CA+zupgxP+_2iRYABhPM1OOJtRdkrcOvrsKH=Sxk45XwsiamzTw@mail.gmail.com>
 <aUt6hobN9DPUGbpz@vaman>
In-Reply-To: <aUt6hobN9DPUGbpz@vaman>
From: Roy Luo <royluo@google.com>
Date: Wed, 24 Dec 2025 16:33:21 -0800
X-Gm-Features: AQt7F2r_cQFC2N0eTEOR5BjjKp383NkfQ5rWibUZL_Pyz-eoT5c0f_oTz4h86S8
Message-ID: <CA+zupgwX_zN-Mge01Ye1_J+rwy0yEQdww1+bPo8YFWnfx68n5Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_163401_423786_D06C2AB5 
X-CRM114-Status: GOOD (  21.90  )
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

On Tue, Dec 23, 2025 at 9:30=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 23-12-25, 09:53, Roy Luo wrote:
> > On Tue, Dec 23, 2025 at 6:04=E2=80=AFAM Vinod Koul <vkoul@kernel.org> w=
rote:
> > >
> > > On 22-12-25, 21:31, Roy Luo wrote:
>
> > > > +struct google_usb_phy {
> > > > +     struct device *dev;
> > > > +     struct regmap *usb_cfg_regmap;
> > > > +     unsigned int usb2_cfg_offset;
> > > > +     void __iomem *usbdp_top_base;
> > > > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> > >
> > > so you have an array for one phy?
> >
> > While the current patch only supports usb2, I used an array
> > to simplify future support for usb3 and DP. I understand this
> > might seem like over-engineering for now, and we could
> > certainly wait to implement the array until the second phy
> > support is added. I=E2=80=99m happy to move away from array if
> > you=E2=80=99d prefer a simpler approach for this iteration.
>
> Rather than do array, allocate mem as probe based on how many phys will
> be there and use that. That would be a better approach than static
> allocation here

Make sense, will change it in the next version.

Thanks,
Roy

>
> > > > +static int google_usb2_phy_exit(struct phy *_phy)
> > > > +{
> > > > +     struct google_usb_phy_instance *inst =3D phy_get_drvdata(_phy=
);
> > > > +     struct google_usb_phy *gphy =3D to_google_usb_phy(inst);
> > > > +     u32 reg;
> > > > +
> > > > +     dev_dbg(gphy->dev, "exiting usb2 phy\n");
> > > > +
> > > > +     guard(mutex)(&gphy->phy_mutex);
> > > > +
> > > > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USB=
CS_USB2PHY_CFG21_OFFSET, &reg);
> > > > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > > > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + US=
BCS_USB2PHY_CFG21_OFFSET, reg);
> > > > +
> > > > +     reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> > > > +     clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static const struct phy_ops google_usb2_phy_ops =3D {
> > > > +     .init           =3D google_usb2_phy_init,
> > > > +     .exit           =3D google_usb2_phy_exit,
> > > > +};
> > >
> > > Only two ops? I would expect more... No power_on/off or set_mode?
> > >
> > > --
> > > ~Vinod
> >
> > No, configuring usb2 phy is pretty straightforward. The hardware
> > does not distinguish between "initialized" and "powered on" states,
> > it also does not distinguish phy mode.
>
> ok
>
> --
> ~Vinod

