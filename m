Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B7AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrlKQngaih/GyBdcD0JlQz7H1v2pzxnPiDTUdfvP4es=; b=p3m6hu3M7CWojITpgmI8GtqJYD
	YH9M2pm/5frLULk5Jvl3pwrvcB7RbSklLEmj95d4doH09kgGm4ARh0onKc/sMzmDD2i3NZ8Gxr6/T
	XC/d6UptikbwN4UE6sFSOg5k0/KxMEG/mWTmxjiv//63g/iWCE1WBBWg77T/Z2EmdXTy/hEnK9CNd
	WYK009wwLNICQd4qMFEGArBStZhdQcQl3WaAI9i42AViiqdP9X80Zv8iVrHfzGjTIpzUEthuNQvtn
	pK7DxTN1896yTfXA49lk2S0aTGZoPPx4UbABSyyIn+ObgEBqIFo4YazGIDWMtfTX123Ok8wnnEeBD
	CTs6V4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcuC-0000000FDkR-12BV;
	Wed, 07 May 2025 11:25:40 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcro-0000000FDIg-2HS3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 11:23:14 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-708d90aa8f9so45770867b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746616991; x=1747221791; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BrlKQngaih/GyBdcD0JlQz7H1v2pzxnPiDTUdfvP4es=;
        b=F+YMCTcHZMZqqMMSRtv5/A3fm7uBZfrC37D0W9wiAc/BxX5F/l0andOn9OQiUmwGil
         Plq0WQmzs6JwYRKJJP3qNdfhMseJEX+puHwpMJHLA9nof1RHAgFF1TjePX93C7RNnvFT
         wGz/s/bA05ft4+/kq8ReZ3/vqyXA+vz+cOBkw++mid8norGafzJmMBovuuArCbuY3s/t
         EBWio63apR/oe6JAKD5FRBEXf9jy4eQPXd49RR4gqGYzdMdthFRae2WGdCJe0vcTn3qq
         ohMoayc8IEqr048WzoBNIy6uO1YIx3ehYg0VtVKWh4Pzrqyu7CCFy9L/wu2j0JhTpDK1
         KP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616991; x=1747221791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BrlKQngaih/GyBdcD0JlQz7H1v2pzxnPiDTUdfvP4es=;
        b=nv+tNkmhVCbtwVbSZaiQ+Ez8lkZYx/8UiUCvM+lNRMH911SDKgTk9s9pBIGDrvQUw/
         v9Frz/3K30dVMm0kLNUsvOjxjdctuTtCIe2IaypKV5S2tvtug5TkcmovH3jqQbq/vuGN
         HrRRQI1R1o7KMXn3+8k+EJiJ8Yg62OYmdQzaQvKaxMJE8c0iXaOboSFdhaBXvhHcJ7A7
         1mxDWPixb4racWk3ksRitigNC8CZJKFsgj9THHUYRjYSRc99YUpeeXRxTHqG7vUgbLzv
         +cRNqXVXbqOymaKXZqc5rZIkxyoGqEgon1nZFZeCBRmKkaGizSaHNxutWlQEwEYfRcR0
         rjbw==
X-Forwarded-Encrypted: i=1; AJvYcCWMCrpVY7efB2k3HywD9n+11HPfJ43KOEB1A248+KXWv5KTqapyqQO1Ya3nxiGMrk4+Wsps+OTxBOsn77TR9JCB@lists.infradead.org
X-Gm-Message-State: AOJu0YwBGHJA95x5lFKa31cPWa1ZZk8vAXrGq26WsUribzJ40q5YLvZM
	U3WHuqTCMbxo8rN+0RunYa1C+FcZISW0E0voPcOBsvlbAArDYc2kRf1imcdPXDidRskXPqqXmiT
	FExMnXoxXqfTbLuKK93cpYIad9ywJL+Zd9UgxTw==
X-Gm-Gg: ASbGnctJ0XWAuevOjg6yuMH+xTWffj8A6C5vcWmc+HGjIpJVA95Dru+McVUdJ0cc8i/
	511SuzH2/qjshA7wQBxIqin0t1sHAiD2Iz0s4EjXo2bfYCI7Vmh26PBB7wtxTTqvuw1t68kQUaB
	LJTWfbPUNS+Y+w9RofkTqP9f5gVFASaXiv0sP+STsVLAEAbxe3js99
X-Google-Smtp-Source: AGHT+IFxdYKCzY2TKwPokyurfueqmOKja0Rc4hCwr5SUWy06EioalRQvocuOR1AAy0bCdqDcNh77dszj2t/Oy74t3i4=
X-Received: by 2002:a05:6902:18cd:b0:e74:e02:626a with SMTP id
 3f1490d57ef6-e7880fc6382mr3556036276.19.1746616991034; Wed, 07 May 2025
 04:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com> <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
In-Reply-To: <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 7 May 2025 12:22:50 +0100
X-Gm-Features: ATxdqUG3nHKGjKOQoFEY4aL1pXCEA2rU5jPHWszWU5gDb-fbZzf1eN3M8MI_ltM
Message-ID: <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Taniya Das <quic_tdas@quicinc.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Eric Biggers <ebiggers@google.com>, Javier Carrasco <javier.carrasco@wolfvision.net>, 
	Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Zhi Mao <zhi.mao@mediatek.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Ihor Matushchak <ihor.matushchak@foobox.net>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_042312_664781_5ADD2F4D 
X-CRM114-Status: GOOD (  25.73  )
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

Hi Jakub and Cosmin

On Tue, 6 May 2025 at 19:34, Jakub Kostiw <jakub.kostiw@videtronic.com> wrote:
>
> Hi Cosmin
>
> Awesome work. The initiative to establish a common framework for GMSL
> devices is a great idea.
>
> I believe that we have found few bugs:
>
> > +#define MAX9296A_BACKTOP22(x)                        (0x31d * (x) * 0x3)
>
> The first multiplication is wrong and should be replaced with addition:
>
> +#define MAX9296A_BACKTOP22(x)                  (0x31d + (x) * 0x3)
>
> The same goes for MAX96724 equivalent macro:
>
> > +#define MAX96724_BACKTOP22(x)                        (0x415 * (x) * 0x3)
>
> In MAX96714 driver there is an issue with setting up lane-polarities.
>
> > +static const struct max9296a_chip_info max96714_info = {
> > +     .max_register = 0x5011,
> > +     .set_pipe_stream_id = max96714_set_pipe_stream_id,
> > +     .set_pipe_enable = max96714_set_pipe_enable,
> > +     .set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
> > +     .phys_configs = {
> > +             .num_configs = ARRAY_SIZE(max96714_phys_configs),
> > +             .configs = max96714_phys_configs,
> > +     },
> > +     .polarity_on_physical_lanes = true,
> > +     .supports_phy_log = true,
> > +     .adjust_rlms = true,
> > +     .num_pipes = 1,
> > +     .pipe_hw_ids = { 1 },
> > +     .num_phys = 1,
> > +     .phy_hw_ids = { 1 },
> > +     .num_links = 1,
> > +};
>
> In order to make thing work we had to set
>
> > +     .polarity_on_physical_lanes = true,
>
> To false. So this field is either improperly set for MAX96714, or handling of this case is wrong:
>
> > +             if (priv->info->polarity_on_physical_lanes)
> > +                     map = phy->mipi.data_lanes[i];
> > +             else
> > +                     map = i;
>
> Upon mentioned changes we have successfully tested two GMSL2
> combinations on Raspberry 5 platform:
>
> 1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to
> hardware limitations)
>
> 2. MAX96714 + MAX96717

Feel free to shout if you want help on the Pi side.

Pi5 should be able to extract multiple virtual channels to support
several sensors simultaneously (up to 4 VC/DT combinations). It does
need a rework so the CFE runs from memory rather than being fed data
directly from the CSI-2 receiver, but I believe that is pencilled in
as future work with libcamera already.

Unless things have regressed, libcamera should report all connected
sensors to SerDes setups, and set up Media Controller appropriately to
use them one at a time. I know I've had that working with simple CSI-2
multiplexers and thought I'd had it working with TI FPD-Link III
SerDes (Arducam's IMX219 V3Link kit, modded to remove their MCU). I
don't have any GMSL hardware to test with.

We're also fairly open to merging drivers and overlays for 3rd party
hardware into the downstream Pi kernel. If they've been reviewed and
merged upstream then that is the ideal, but if you're prepared to
support them, then it saves the user the headache of having to build
out-of-tree modules.

Cheers
  Dave

