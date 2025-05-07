Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84BFC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiVdAIN2EPB5/ddGNaW9SkB5MJnYa5J03/Pp0KFzzWw=; b=MaorQ/uWEpkxEoVLTSk3uWOPds
	zR9nXWGVotBKbyjX4qIFJG5NJdWUGRqEQwdhODkanUkkUFPCNsoBDQZkd4mp55Iwp4aEvgpQE0XYz
	BLTiLATvJqtNKrYiLEkozxDIQ95/mngHrA/AlvDkxLBMxOQqhfGLWPdFdmqU3/P51oKMbHHSnp8pm
	JKyNnh5ZKk/IxsRzaILckK/wzWqA32537chS0P1NLXmFaZ+j0i+8dJQP8ou8n5nlWG4fIqr09tNDd
	cYoSjdz8GIjzUw5uD2UBOXdSI5ZG6Y5gxo9ov7GVopw+54R7r9Qgy3WtVjedY6/bL0JGrnJeWM9NZ
	AwoeM+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCd8l-0000000FFuS-46iL;
	Wed, 07 May 2025 11:40:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCd6p-0000000FFeJ-2GR9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 11:38:44 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5fbcc5aa54aso2404315a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746617921; x=1747222721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiVdAIN2EPB5/ddGNaW9SkB5MJnYa5J03/Pp0KFzzWw=;
        b=KDhSfss2afhU/POKne4rXL7CbHNp0/k+acZKQ8fN+ParehebHwCWIGjWRAnvnwOyRH
         VVX6PePOVzLVF1fNplKL5RyUMdWy/Uno4jRLzlhb1yyuzn0J61mWK/20HrJnbd+Cktjh
         bAMzVWd2Lu/w4RlIdFP8ptObDcsJBmI3126ekImocfdtOhnmcO3/xheYaCmT8tnHtlh2
         MY6KFLzGlCYKZrttMzpV01cSGJAR9H/cURLUtB9iGD2fx310EQuPgeBoLIgvQNIH4YXP
         zXXq1zYHY8wxywVNxhpa25DyX8d5xJJTwbGYd3Xuom7uXtgkhywYTHXFW1/6a9GctiOc
         qz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617922; x=1747222722;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiVdAIN2EPB5/ddGNaW9SkB5MJnYa5J03/Pp0KFzzWw=;
        b=rdNcHllW0cBJgpFddyoEYUGdomlfa8xeDdQf7i1YkY1x8H7+GQGnclZMdj8q/0ZJBK
         mhPb/sDDEvGkGyESE87Ndr6tIs7FAU0lesvao2Ki6SQIuTE8rKYpXXWU5UA9x1QOsfOG
         umhdxvGNqNTWSobVn1v9Ux/C1odgFXu3p5Zt83YwpfJzGK/AySGSJIcRnaHzYxw09MJz
         bOhPOR8RO8QjJbXtX3M/m0Mw8p5+rs7AXYE7/zfcNuhNSDdUjsWOlF36l0HwYb6Zx1XJ
         sNZtv6DaHmVXRKoDFhAbJATICaK8uHimY2PQLoWWXznsl0VKLKKLv7HBiHCtQ7dXHk1N
         g/AA==
X-Forwarded-Encrypted: i=1; AJvYcCX4F79nMLUIafs48frax96HhVBZjeLFmmYOGQBmMqYX8I1nS86gNuWLTtgxYrmr6URLiyAdruJr+LvOJCtyx2jY@lists.infradead.org
X-Gm-Message-State: AOJu0YzkARkZpz1EG8t/ComzOWQta1mcrQbE13PvFtXY294QyywpmVaH
	xHWXCIXP6fdXZPR11bGHqlHi4onJM1dKbaf6jeA6h/ikQRKdHq8k
X-Gm-Gg: ASbGncvOlfoatyi/KisnoSik5kgfCQkIB+ZwPAMeKs/iyCNxJPxuxVKbnxV/OmDIJkl
	9dSAqk3LlK/cQQvhcPvXyF03xek4pFnuHHHc8+a4nddAdC1PBBjOMrnV6IENYsAExJs9aanzicl
	FlMYdLS/Fo3zdL5MUKYqtGJiXTuQqDIaXYU5ooAiCyTUqKT+8VTcu8Y/xBaWgHzswP6rZsN/Mg3
	053EGka/8/1SZA0aPAVsm/LLnGr3xpsHrjokuK/Jc/FaTZfqZvy4CmVW7ZWsb7kx6rewysGGzts
	NsNtp0ou2Zwo8emmS1C7p3A9ohUtZPgrcGSE4Tw9T/+9ag==
X-Google-Smtp-Source: AGHT+IFaUn9FlKna7lUxaaYjgUBZjL/UsUXC91d7yrrpq2Az6cyujMB9sV2nGW2h0aB7+bST1a06Qw==
X-Received: by 2002:a17:907:7fab:b0:ac7:18c9:2975 with SMTP id a640c23a62f3a-ad1e8d053b4mr311005066b.48.1746617921236;
        Wed, 07 May 2025 04:38:41 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a2515sm900306566b.39.2025.05.07.04.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 04:38:40 -0700 (PDT)
Message-ID: <b825ab7e-dbf6-4dcc-a35b-3fef0f0c4969@gmail.com>
Date: Wed, 7 May 2025 14:38:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_043843_587108_B8121400 
X-CRM114-Status: GOOD (  31.03  )
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



On 5/7/25 2:22 PM, Dave Stevenson wrote:
> Hi Jakub and Cosmin
> 
> On Tue, 6 May 2025 at 19:34, Jakub Kostiw <jakub.kostiw@videtronic.com> wrote:
>>
>> Hi Cosmin
>>
>> Awesome work. The initiative to establish a common framework for GMSL
>> devices is a great idea.
>>
>> I believe that we have found few bugs:
>>
>>> +#define MAX9296A_BACKTOP22(x)                        (0x31d * (x) * 0x3)
>>
>> The first multiplication is wrong and should be replaced with addition:
>>
>> +#define MAX9296A_BACKTOP22(x)                  (0x31d + (x) * 0x3)
>>
>> The same goes for MAX96724 equivalent macro:
>>
>>> +#define MAX96724_BACKTOP22(x)                        (0x415 * (x) * 0x3)
>>
>> In MAX96714 driver there is an issue with setting up lane-polarities.
>>
>>> +static const struct max9296a_chip_info max96714_info = {
>>> +     .max_register = 0x5011,
>>> +     .set_pipe_stream_id = max96714_set_pipe_stream_id,
>>> +     .set_pipe_enable = max96714_set_pipe_enable,
>>> +     .set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
>>> +     .phys_configs = {
>>> +             .num_configs = ARRAY_SIZE(max96714_phys_configs),
>>> +             .configs = max96714_phys_configs,
>>> +     },
>>> +     .polarity_on_physical_lanes = true,
>>> +     .supports_phy_log = true,
>>> +     .adjust_rlms = true,
>>> +     .num_pipes = 1,
>>> +     .pipe_hw_ids = { 1 },
>>> +     .num_phys = 1,
>>> +     .phy_hw_ids = { 1 },
>>> +     .num_links = 1,
>>> +};
>>
>> In order to make thing work we had to set
>>
>>> +     .polarity_on_physical_lanes = true,
>>
>> To false. So this field is either improperly set for MAX96714, or handling of this case is wrong:
>>
>>> +             if (priv->info->polarity_on_physical_lanes)
>>> +                     map = phy->mipi.data_lanes[i];
>>> +             else
>>> +                     map = i;
>>
>> Upon mentioned changes we have successfully tested two GMSL2
>> combinations on Raspberry 5 platform:
>>
>> 1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to
>> hardware limitations)
>>
>> 2. MAX96714 + MAX96717
> 
> Feel free to shout if you want help on the Pi side.
> 
> Pi5 should be able to extract multiple virtual channels to support
> several sensors simultaneously (up to 4 VC/DT combinations). It does
> need a rework so the CFE runs from memory rather than being fed data
> directly from the CSI-2 receiver, but I believe that is pencilled in
> as future work with libcamera already.
> 

Hi Dave, thanks for your input! I'm glad this is getting some traction.

I'm currently testing using Tomi's pyv4l2 tool, which already contains
RPi5 GMSL configs.

I've tested the multi-camera simultaneously streaming usecase already,
all is working well, and I was able to get 4 separate camera image
streams (or 2 image and 2 meta), streaming to the RPi5, and then to
a remote host (where debayer is feasible to do without the help of an
ISP).

Last time I tried libcamera it was not able to properly configure all
entities, so testing with just the mainline CFE using pyv4l2 makes it
much simpler, since we're only interested in getting our hardware
supported.

> Unless things have regressed, libcamera should report all connected
> sensors to SerDes setups, and set up Media Controller appropriately to
> use them one at a time. I know I've had that working with simple CSI-2
> multiplexers and thought I'd had it working with TI FPD-Link III
> SerDes (Arducam's IMX219 V3Link kit, modded to remove their MCU). I
> don't have any GMSL hardware to test with.
> 
> We're also fairly open to merging drivers and overlays for 3rd party
> hardware into the downstream Pi kernel. If they've been reviewed and
> merged upstream then that is the ideal, but if you're prepared to
> support them, then it saves the user the headache of having to build
> out-of-tree modules.
> 
> Cheers
>    Dave


