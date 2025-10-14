Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8EBCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 21:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GireKbTvc0Ap2bbdBdr9c+P5CYWz6lHmNB6HklAFAw=; b=wW4sZjCaRP/+moKTSrjUf8CVhZ
	NoIePW6/f0miihJcUvk7LbT+NEeLXLyoRvRUj6FaER3Zt+4CAZbEcm6iquHdiG/C+zSuCYth9f9Yj
	7LiLErApI0igIrLzup8klUVelqZiktPwTyl41f2Jpo8Lw8zJe5NxzEYz4GOy9acPefxNArhQSjtoS
	PfMp3qDkANwoi9LHIc7pJ9NV7kgd48eSKy0oXhCitvDQIiByE9sAS1v3VLjaoSwzgxLxND6VGlKZs
	4diePerRaht3CQ/N2xh/ngzergkJjKgYbagj15Z/SMcYEF0Le1waX1WuEHj7iumclH5722i+K97CY
	1+MRhmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mM5-0000000HQpm-2yaH;
	Tue, 14 Oct 2025 21:14:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mM3-0000000HQos-0E03
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 21:14:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso5426064f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476485; x=1761081285; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GireKbTvc0Ap2bbdBdr9c+P5CYWz6lHmNB6HklAFAw=;
        b=H4u8sSBRZxoMl22glMfEcZi3RGgCHcLARF8Hzd77LP6r03ehkx8IsPdmbO2vwD0/Le
         Sym/VnMEuRBOLUMNvExwnK2M73d0PattCrqeOJSDFHjRULuIFv7kjHmm9oZZ7Hrlc5wR
         LT6vSUv94m8MSl6aq/6ot4ebCRSDESsk8Cp5MW1Uze5wvM3eK5+2IiQoPyuqZc2/JUjE
         nT+W1b66MQQnT6JEPBUeNNR0b6pvtqpEeeZiW6lBUrWBgOyQ+WQsk2CpHJB7Pa/8rcHd
         2l3i6NI1KYIE+RZ+669oQS40sHQzh8UyYBWHOjqzYqLODwhJD/tv1AP6mdevlS7hap5B
         u1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476485; x=1761081285;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1GireKbTvc0Ap2bbdBdr9c+P5CYWz6lHmNB6HklAFAw=;
        b=F6IQs7l+yxZ+BdAzs6/vdqrrwzvatacjKJguMsZhbMoWhckStD/+fqiN/u6nUlcscJ
         2udfQEMwRjsOB46hJNlceMdP6dDfHoD394v2Vw7N4TvemHehJMf5GKT8S/YNPZEqkAEo
         c67KQoNPp7s15NdlHwbeL/5gbuZl6SNQYApzqXiSGaITNNig+dvHknG8jYhE9K7MJuEd
         IafjsEkFlrw7ORaUBfdB7Y7UsC0fmf3zOad1yDmIJKzveCQgCf/fktsFMTETLi/QCBWn
         DNLFjAFk+vRNXUGgHoAx8FDr9ZCAMWcziuoVIl+o/bJO6JsSNU9VFC3h/lg5JQXfjUuC
         x1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUf3pfmp0UEWACLLubpj6Tq43FmVGunetBMwLm3DxdCpKP859zXd4Pj4erLBb3M1JCKwdgVVoPex7U0VPnqRH9k@lists.infradead.org
X-Gm-Message-State: AOJu0YxQMD7VdCITajaieq+IbErJEBpIoNO6udx3ZWIjebcAUXbCkQBY
	C5WM2nLu+o9y0ph75hIHgZgDZMd9PiYexwTxpHQ9ZjvHO/wbeUOVZTJ1FkSI8ZL9LQQ=
X-Gm-Gg: ASbGnct0AUDjAIwAsmqnFqEvTXIp9j9JEtp8IlRB1qItcKbi5pgh0KJPrMVWLBMpxd7
	9CybbN7IfXoG5SLaDTCZjodagjsMJt08fqZO2xqc933xF8sVa471sg4utMhaaQR65kyzINmbMkc
	lteab5wHAiYn5FW/UTPVGdfF1o6jgeU52uo+QZrdqGYdTcXy5VV9Haq0bJfIC25cj3xD0UtJRIF
	tmPmY87wL57chft164tjGWJ5amQCF8UK6xXTF65yg2LEs9OvOxCzsFOTo5jeT8H83iDw1/eh/f6
	yfeoiXK7uRaozLUHZwm2G0aa+L5N7LW40iPhG9+iYRS34QrZA3V79QmfjY+IIlCLfXtCQuHU4jL
	NlQDSwErLZcmkgi9CiUKcWwBTB/bqltmR7a8iMuh8RGtBRJcpk/UXeIf9WYS0zcjP6ZVOQ7mQgU
	i26p9jQEN+ojw=
X-Google-Smtp-Source: AGHT+IEP8UZIBNjk1R38yg4MdEh66NEhBfdTG9blQmcEr+nkmqB/1kep3IslUplXIIeXAlvgZM3HoA==
X-Received: by 2002:a5d:5889:0:b0:3fa:ff5d:c34a with SMTP id ffacd0b85a97d-4266e7e15bbmr18909789f8f.39.1760476485186;
        Tue, 14 Oct 2025 14:14:45 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0efasm25594543f8f.41.2025.10.14.14.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:14:43 -0700 (PDT)
Message-ID: <8facac3f-6054-45ce-822c-35f20be813ab@linaro.org>
Date: Tue, 14 Oct 2025 22:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/18] media: rockchip: add a driver for the rockchip
 camera interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <B5xoyrx-F-1lRXvOsPtUG_JmJ51WCcXyfs88HfNAf8kkcpR_rsN5U3ntY-KKb_2mUSmc7XERPI0fVzCr5gtpqA==@protonmail.internalid>
 <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141447_190798_31B6C7E5 
X-CRM114-Status: GOOD (  36.16  )
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

On 14/10/2025 14:01, Michael Riesch via B4 Relay wrote:
> Habidere,
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> For example, the PX30 Video Input Processor (VIP) is able to receive
> video data via the Digital Video Port (DVP, a parallel data interface)
> and transfer it into system memory using a double-buffering mechanism
> called ping-pong mode.
> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
> DVP and a MIPI CSI-2 receiver that can receive video data independently
> (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...).
> 
> The v12 of the series adds a media controller centric V4L2 device driver
> for the Rockchip CIF with
>   - support for the PX30 VIP (not tested, though, due to the lack of HW)
>   - support for the RK3568 VICAP, including
>      - capturing frames from the DVP
>      - capturing frames from the MIPI CSI-2 receiver
>   - abstraction for the ping-pong scheme to allow for future extensions
>   - abstraction for the INTERFACE and CROP parts to allow for future
>     extensions
>   - initial support for different virtual channels (not tested, though,
>     due to the lack of HW)
> and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.
> 
> The RK3568 DVP has been tested by Gerald on a WolfVision PF5 hardware,
> the RK3568 MIPI CSI-2 have been tested by me on a Radxa ROCK 3A + Radxa
> Camera 8M.
> 
> The driver can be readily extended to provide support for the RK3588
> VICAP variant. In order to keep things simple, however, this extension
> shall be submitted separately.
> 
> Looking forward to your comments!
> 
> To: Mehdi Djait <mehdi.djait@linux.intel.com>
> To: Maxime Chevallier <maxime.chevallier@bootlin.com>
> To: Théo Lebrun <theo.lebrun@bootlin.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Gerald Loacker <gerald.loacker@wolfvision.net>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Markus Elfring <Markus.Elfring@web.de>
> To: Sakari Ailus <sakari.ailus@iki.fi>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> To: Kever Yang <kever.yang@rock-chips.com>
> To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> To: Sebastian Reichel <sebastian.reichel@collabora.com>
> To: Collabora Kernel Team <kernel@collabora.com>
> To: Paul Kocialkowski <paulk@sys-base.io>
> To: Alexander Shiyan <eagle.alexander923@gmail.com>
> To: Val Packett <val@packett.cool>
> To: Rob Herring <robh@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> 
> Changes in v12:
> - added Radxa Camera 8M device tree overlay
> - rebased onto v6.18-rc1
> - fixed IOMMU pagefaults caused by wrong VLW (Mehdi)
> - fixed indentation of register defines in -regs.h (Sakari)
> - renamed CSI-2 receiver interrupts (Rob)
> - added MEDIA_BUS_TYPE_* as comments in DT bindings (Bryan)
> - added newline in rkcif-dev.c (Bryan)
> - Link to v11: https://lore.kernel.org/r/20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com
> 
> Changes in v11:
> - rkcif: split large driver patch (6/13 of v10) into smaller
>    patches (6-11/17 of v11) (Bryan)
> - rkcsi: replaced devm_reset_control_array_get_exclusive with
>    devm_reset_control_get_exclusive (Philipp)
> - Link to v10: https://lore.kernel.org/r/20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com
> 
> Changes in v10:
> - rkcsi: fixed error handling in rkcsi_start (Bryan)
> - rkcsi: fixed interrupt references in device tree and bindings
>    (Rob's bot)
> - added missing call to rkcif_mipi_stop_streaming from rkcif_mipi_isr
>    (Mehdi)
> - renamed remaining instances "cif_" -> "rkcif_" in functions
> - Link to v9: https://lore.kernel.org/r/20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com
> 
> Changes in v9:
> - added compatible for RK3588 MIPI CSI-2 receiver, thus dropped
>    Krzysztof's R-b
> - added interrupts to rkcsi DT binding and RK356x DT
> - added variant specific callback to rkcif-capture-mipi that puts
>    together the CTRL0 register content (which varies between RK3568
>    and RK3588)
> - fixed v4l2_fill_pixfmt_mp() return value handling (Mehdi)
> - Link to v8: https://lore.kernel.org/r/20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com
> 
> Changes in v8:
> - rebased onto v6.16-rc1
> - fixed RKCIF_MIPI_MAX value in rkcif-common.h
> - fixed rkcsi Kconfig (kernel test robot)
> - sorted rkcsi DT bindings document properly, completed example
>    (Krzysztof)
> - squashed the defconfig patches (Krzysztof), dropped Bryan's R-b
> - Link to v7: https://lore.kernel.org/r/20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com
> 
> Changes in v7:
> - moved MIPI CSI-2 receiver driver into separate directory (Laurent)
> - rkcsi: fixed return values (Bryan)
> - rkcsi: fixed v4l2_get_link_freq to use pad instead of control
>    handler (Sakari)
> - rkcsi: added data-lanes property (Mehdi)
> - rkcif: fixed formatting (Bryan)
> - fixed "int" -> "unsigned int" in all for loops (Sakari)
> - rkcif-stream: fixed minimum number of required buffers (Mehdi)
> - rkcif-stream: used guards for the spinlock (Markus and Mehdi)
> - rkcif-stream: made driver less noisy with dev_dbg (Mehdi)
> - rkcif-stream: fixed issues detected by v4l2-compliance (Mehdi)
> - rkcif-dvp-capture: fixed return value propagation in _register()
>    (Mehdi)
> - removed stray "phy-names" from required properties (Rob's bot)
> - Link to v6: https://lore.kernel.org/r/20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com
> 
> Changes in v6:
> - rebased onto v6.15-rc1
> - renamed "MIPI CSI HOST" -> "MIPI CSI RECEIVER" (Laurent)
> - s/@wolfvision.net/@collabora.com where appropriate
> - renamed DVP delay property and moved it to the endpoint (Sakari)
> - implemented DT review comments (Krzysztof and Sakari)
> - implemented driver review comments (Sakari)
> - fixed issues raised by media-ci (yet again)
> - added documentation including a RK3568 topology (new patch 1)
>    (Sakari)
> - added patch that enables rkcif in the defconfig (new patch 9)
> - Link to v5: https://lore.kernel.org/r/20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net
> 
> Changes in v5:
> - fixed issues raised by media-ci
> - fixed dt bindings (comments by Rob and Sakari)
> - fixed probe on systems with no DVP in DT (comment by Alexander)
> - fixed error path in register offset calculation
> - split off MIPI CSI host driver into separate module (comment
>    by Mehdi)
> - added MODULE_DEVICE_TABLE() for both drivers (comment by Mehdi)
> - Link to v4: https://lore.kernel.org/r/20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net
> 
> Changes in v4:
> - added support for the MIPI CSI-2 receiver (new patches 4, 6, 7, 10)
> - fixed asserts on stream stop
> - fixed register address lookup
> - fixed link validiation callback
> - fixed issues raised by Rob's bot, kernel test robot, and media-ci
> - Link to v3: https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net
> 
> Changes in v3:
> - renamed the driver "cif" -> "rkcif"
> - rebased onto v6.14-rc1
> - abstracted the generic INTERFACE+CROP part
> - addressed comments by Rob and Sakari
> - added V4L2 MPLANE formats to DVP
> - added patch that enables the RK3568 VICAP DVP on PF5 IO Expander
> - fixed formatting issues raised by media-ci bot
> - Link to v2: https://lore.kernel.org/r/20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net
> 
> Changes in v2:
> - merged with Mehdi's v13
> - refactored the complete driver towards a media controller centric driver
> - abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
> - switched to MPLANE API
> - added support for notifications
> - Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net
> 
> ---
> Mehdi Djait (2):
>        media: dt-bindings: add rockchip px30 vip
>        arm64: dts: rockchip: add the vip node to px30
> 
> Michael Riesch (16):
>        Documentation: admin-guide: media: add rockchip camera interface
>        media: dt-bindings: video-interfaces: add defines for sampling modes
>        media: dt-bindings: add rockchip rk3568 vicap
>        media: dt-bindings: add rockchip rk3568 mipi csi-2 receiver
>        media: rockchip: add driver for the rockchip mipi csi-2 receiver
>        media: rockchip: add driver for the rockchip camera interface
>        media: rockchip: rkcif: add abstraction for interface and crop blocks
>        media: rockchip: rkcif: add abstraction for dma blocks
>        media: rockchip: rkcif: add support for px30 vip dvp capture
>        media: rockchip: rkcif: add support for rk3568 vicap dvp capture
>        media: rockchip: rkcif: add support for rk3568 vicap mipi capture
>        arm64: defconfig: enable rockchip camera interface and mipi csi-2 receiver
>        arm64: dts: rockchip: add vicap node to rk356x
>        arm64: dts: rockchip: add mipi csi-2 receiver node to rk356x
>        arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander
>        arm64: dts: rockchip: add overlay for radxa camera 8m
> 
>   .../admin-guide/media/rkcif-rk3568-vicap.dot       |  21 +
>   Documentation/admin-guide/media/rkcif.rst          |  83 ++
>   Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
>   .../bindings/media/rockchip,px30-vip.yaml          | 124 +++
>   .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 ++++
>   .../bindings/media/rockchip,rk3568-vicap.yaml      | 172 ++++
>   MAINTAINERS                                        |  17 +
>   arch/arm64/boot/dts/rockchip/Makefile              |   5 +
>   arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
>   .../dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso   |  90 +++
>   .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
>   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  78 ++
>   arch/arm64/configs/defconfig                       |   2 +
>   drivers/media/platform/rockchip/Kconfig            |   2 +
>   drivers/media/platform/rockchip/Makefile           |   2 +
>   drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
>   drivers/media/platform/rockchip/rkcif/Makefile     |   8 +
>   .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 865 +++++++++++++++++++++
>   .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  25 +
>   .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 777 ++++++++++++++++++
>   .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  23 +
>   .../media/platform/rockchip/rkcif/rkcif-common.h   | 250 ++++++
>   drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 303 ++++++++
>   .../platform/rockchip/rkcif/rkcif-interface.c      | 426 ++++++++++
>   .../platform/rockchip/rkcif/rkcif-interface.h      |  31 +
>   drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 153 ++++
>   .../media/platform/rockchip/rkcif/rkcif-stream.c   | 638 +++++++++++++++
>   .../media/platform/rockchip/rkcif/rkcif-stream.h   |  32 +
>   drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
>   drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
>   drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 742 ++++++++++++++++++
>   include/dt-bindings/media/video-interfaces.h       |   4 +
>   32 files changed, 5089 insertions(+)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20240220-rk3568-vicap-b9b3f9925f44
> 
> Best regards,
> --
> Michael Riesch <michael.riesch@collabora.com>
> 
> 
> 

This series feels like it needs to be merged....

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

