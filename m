Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F5BC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOgvK9AFJe3WHPextjB1ThOrVLGAoD7o8PiZ9/mpfSE=; b=vGfCpiS+Q4SzfnL9w/uU+nWqtp
	p6rrRCJuqM6Io+IyL4Gx9CmwoLs015aUgywKVFlbb5m4pipvVMDNOqPZXj65vPccsINs4d+WzWjK4
	5glaIFtOhygNULY9pn24CMlWLJkpXGuyRLqsx6GuH4nCsHbyIP6koiVht/qs87f2/Nh51PQi4v4tb
	DkhlO9zaC2Gsd1IZPc+kTrgoyxw+9LUKxrt1W5gPG6siVPBlV1GhOiItjrlw9lqEQK7C/xvrvO+Vy
	d7dlhFax8hfr/9NKliPZumDYoUzTD/xXqDGO8OG6v7kgnKNKo5IUiYlmHKH4VXVBIctUNBMtIHNcK
	nQJR0IAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9pG-00000001zKj-0So9;
	Thu, 20 Feb 2025 16:55:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9nk-00000001yw0-41Jz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:53:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so244253266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740070407; x=1740675207; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOgvK9AFJe3WHPextjB1ThOrVLGAoD7o8PiZ9/mpfSE=;
        b=Yu2gjTp1v9BCzMKhH3Xz0keOB61y72ygTQ79AdjjrrBwO2umX1BSow/OX1crwHjoFH
         PuXAnIqO/+vD6pIJlkvPWMMlnRarc6jGud8loHtQa+MVszvyHn5bFkA3aagPqeSpySgi
         BVTqXGbFwmROAEGlFp1Rc5YUcKmPNR4XZjYATT+yg34+oj1pZlzoEomLttoO+/u8+Mzf
         N2Q76CtzB1/0NjbjTExSF/cxmfnwER3AxvzA7e7nRoYfoQDK/a15QgNEor/eIH+rv5MG
         hTAxF0n8rp1yRPce3ruuls8pBBJzWZjUlZfzlrEtBCqBmojuCIVjp3QLQIIclRQpdrzk
         3/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070407; x=1740675207;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOgvK9AFJe3WHPextjB1ThOrVLGAoD7o8PiZ9/mpfSE=;
        b=CjoMLlXVqHZ3xf99TZ8J0WXdvpgJVrnksxWZZGKyH+kZZzH1st298ZJoVYKBSyuuzM
         YGFDc4jq/ZmjR4qwoq2DdIkKgkwMfBuWfRm0pFEhxBuHid2Ul6eGwdIfK6RXotQ1zfdV
         SiPp5SFt2mbmI7Ms+IAI1/CxGo64p6Vj1rlJYu+nl+AN00FGHqVVJHM3weKpvpebVV2P
         ghiad5x0srVuvt2zwuTL2w20iPd8V+5Eo76aYPZdJ7l3i1Q42n56I/X8hQFOFEmpqFAs
         4Z4Aet+d8E9RiOeO4e3G2RBw6N9nMRmqunbKaPpnA0TUnYuoBQx8NaHSYYuJZCjIRQiM
         H/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwmAEuSfLBocifhDb09ySV3+w7prRyTXs8LWmBwG37fqq+dXKLpmMVyYjbSGoPnoTS+moc4uo5apfXzi5vIsCV@lists.infradead.org
X-Gm-Message-State: AOJu0YwIo2GPkmLO9ESpnaLnVlvynqso6uU3AGDN3eWtHFLujUVKCPKx
	UsfO5VHo36pVJvsc/9DbbRqTSYk25ASkq+DC6utLfFLq/DT+Be2W
X-Gm-Gg: ASbGncuVs2/HOQUMttjdRHlUDZDggx4x1WfoYYKcHOTyFB6DVYKRTUKr0/xQnHZlhWK
	f16Oy9CfOoQmNt4DsJ/12f6/Gi0V6IFbtISCdhqw//w0Xj2bGo6ISb7nts/RcXK6PLGoCJza6vX
	SPPmk+6lyfujj6XySnMQdbXmyFjQAeOw9HU1uZm2BaS3ZobyyhvzTqs/bf38mjaH0YT1O9fcOTM
	UdtPPf8qtCtsR2G1fvrbxfDYV+6Hj+TXxc3Rgby81CVTfesjX37N9YWFP4rfyjJjzCkudLHphc5
	NnRPN19+/JbL+Yqx3wExig==
X-Google-Smtp-Source: AGHT+IHX9VnmIkzgRI4Ll9tv4A4sJkmlBH401wTqrrD1a2+Mvl3kRu9TX2s5UtqBj6iP6Tz2hhj6nw==
X-Received: by 2002:a17:907:7f93:b0:aae:fb7c:50df with SMTP id a640c23a62f3a-abc09d33e2fmr2980866b.36.1740070407215;
        Thu, 20 Feb 2025 08:53:27 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa99f283sm681653066b.32.2025.02.20.08.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:53:26 -0800 (PST)
Message-ID: <8c1c7703-42b0-418a-9c51-fd0e76e3a68e@gmail.com>
Date: Thu, 20 Feb 2025 18:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Julien Massot <julien.massot@collabora.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Umang Jain <umang.jain@ideasonboard.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?=
 <panikiel@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
 <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
 <Z7c5U6u5rr0-X0aK@kekkonen.localdomain>
 <20250220143902.GA17500@pendragon.ideasonboard.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250220143902.GA17500@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_085329_004481_2E5D233A 
X-CRM114-Status: GOOD (  27.18  )
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



On 2/20/25 4:39 PM, Laurent Pinchart wrote:
> On Thu, Feb 20, 2025 at 02:16:51PM +0000, Sakari Ailus wrote:
>> On Thu, Feb 20, 2025 at 03:01:41PM +0200, Cosmin Tanislav wrote:
>>> On 2/20/25 1:38 PM, Jacopo Mondi wrote:
>>>> On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
>>>>> Currently, the v4l2_subdev_state_xlate_streams() function is used
>>>>> to translate streams from one pad to another.
>>>>> This function takes the entire subdev state as argument, but only makes
>>>>> use of the routing.
>>>>
>>>> Correct, but is this a problem ?
>>>>
>>>
>>> No, it's not a problem.
>>
>> I think I have a slight preference to keep the pattern of referring to the
>> state as other functions do.
>>
>> I wonder what Laurent and Hans think, too.
> 
> I agree, I think the state should be passed everywhere. This lowers the
> risk of subsystem-wide refactoring if a function that receives a pointer
> to part of a state (such as v4l2_subdev_routing_xlate_streams()) is
> later found to need more information from the state.
> 
> The situation would be different if the states were not monolithic, for
> instance if the routing table could be locked separatly from other parts
> of the state, but that's not the case and I don't foresee moving to
> finer-grained objects.
> 

Got it. We can drop these patches then.

>>>> Is this the first step for a larger rework or is this a drive-by
>>>> beautification ?
>>>
>>> Mostly a drive-by beautification to avoid passing the whole state around
>>> where we only need the routing. I'm planning to submit drivers for more
>>> GMSL2/3 chips and we're using this just to not pass the whole state
>>> around. I think I can just use v4l2_subdev_state_xlate_streams(),
>>> but I had these patches in my tree and it would have been good to get
>>> them upstream, in preparations for submitting the GMSL2/3 drivers.
>>>
>>>> I'm asking because (and I know it's hard to strike a balance) this
>>>> kind of changes tend to make back-porting a more painful, and if
>>>> only justified by "it looks better" I would be a bit hesitant in
>>>> taking them.
>>>>
>>>>> Introduce a v4l2_subdev_routing_xlate_streams() function which can be
>>>>> used without the entire subdev state, to avoid passing the entire state
>>>>> around when not needed.
>>>>>
>>>>> Convert all usages of v4l2_subdev_state_xlate_streams() to
>>>>> v4l2_subdev_routing_xlate_streams().
>>>>>
>>>>> Remove v4l2_subdev_state_xlate_streams().
>>>>>
>>>>> V2:
>>>>>     * Fix description of parameters
>>>>>
>>>>> Cosmin Tanislav (3):
>>>>>     media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
>>>>>     media: use v4l2_subdev_routing_xlate_streams()
>>>>>     media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
>>>>>
>>>>>    drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
>>>>>    drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
>>>>>    drivers/media/i2c/max96714.c                  | 16 ++++++-------
>>>>>    drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
>>>>>    drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
>>>>>    .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
>>>>>    drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
>>>>>    include/media/v4l2-subdev.h                   | 10 ++++----
>>>>>    8 files changed, 53 insertions(+), 47 deletions(-)
> 


