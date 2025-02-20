Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD5CC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgmKYWvys2geNwIMlTB+AnD/uE/7UeYtcCFKBMM26oQ=; b=MvfMlonVWx/jVrqpaAEAbrvjMK
	8AttKf7FKiAZKfr4grBk5yUUR1/1VyoRPXjpEfttz7KB3B7/3cLsBA0z0RpziGY8+PoHmYhgpSLqF
	yepjOwj7yDt8yjA9lNjhRiDv1mwvtJu/Hmg2whMA+CpqtBQawKttO3byYO8IXGWSdeCc7B2Qha0AQ
	8oRmoOZOBzAQ8Uq1z5NA68RZg3c44/H7c/bIB0PLeG3+dy+gJK+4X9fWncqyyFtgv78GHLKcQXBAI
	6Z61ZNTjZwE1r5dcdRNEun3lKgWxq9L7HlLRhqTwoI1BQ0tjywraxzEZDqLYCjfvGvu0LmpUQ9wWb
	Kr6ZAKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Gw-00000000y8q-1RJH;
	Thu, 20 Feb 2025 13:07:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6BX-00000000wC3-2cwb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:01:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abb79af88afso180849166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 05:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740056506; x=1740661306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgmKYWvys2geNwIMlTB+AnD/uE/7UeYtcCFKBMM26oQ=;
        b=kee3T3+mt+77/YOFnyRWVZjVks9lPXB75XExo+D1llGZ8Ei9zalykbs4z3PT1cLKzg
         tkwRAQHzK+1ToYBUvYmShBMcYSsL5T9IoVmAwo6c7i/nLIBGoBLc1MV2ZD+jwqbZjtQM
         YpYKbEshc6I3JkbNJ7HoXk4ijzwhY3GQ8/jXECRIgqnAV0rc2x9raU2xuh6gxFi7NZL0
         Aqcd15PJZ34whDNqRd20+62E4Oc8qu3gT9sfj8AJDNg07+sz93agDFhpIuCch80TpOAJ
         FF9V77KqVpLqMcaKa2O7KmKum4eWmwi0WEjCBIsOOEdWswIPFtUO6d8HK3JyHgfKi1mo
         fmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056506; x=1740661306;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgmKYWvys2geNwIMlTB+AnD/uE/7UeYtcCFKBMM26oQ=;
        b=cOKz+Fp7wKaG2AmEUjedpvH77IT3vbCAhZrQt4ZegnXmIg+uk4+X9HrjBoVcmg7hwT
         YUQI7/+PR+/q6WckPYA8n5aPD2fd00Pj/WVkZTRCrOaXsdnEmrEmpbh7aHxaMbbNS67d
         oR2KolnQtu0kuGzG7xl2gAvcF1xn0FrvTDPIClSBnju97W/MTnwmO2dn1xCm5bhXkA0q
         GRPDnwVXZZ0aJzApl+P/j019QLeoLiIDYRYGPOXoi4skA8eF0pibs50d43tk+Mkx8u3G
         QU429KJ3sMOIsDYl4XgfaeiZ9pNOhnuhm+7ikpapp3jzh4+7zGLhl8evIOeMZf+5K48g
         GzHg==
X-Forwarded-Encrypted: i=1; AJvYcCVeZDS0LoBVnDS5zt+IkHpfivrjFY3SmhMTun5p8Vg0VzIStDW4LtdBnKusRY4QcBMmqr4icAiU7lEnlW7KYcd6@lists.infradead.org
X-Gm-Message-State: AOJu0YwyBRxoDXUFuYHxgXujoUYWmtxmdbcpM2AEWkrLlRvwvfxkYhoV
	vHPoXxPMqggNAKzEvzkazzILzceXE89emAjnacHRwfnPs7sQMXuf
X-Gm-Gg: ASbGnctQGjJhPVzEG1GHnj+kujgd06sKgfg9wUa40NUKQuclM0MG4F67Ncf65rQeuDl
	4yZ4RtR++sKa9Q2MEVzqYgwpYJBp3QQv5IbSjQ9lqt77nFw/poWl8HXSvN0i8bcCYVsCwPXzJTV
	sedpLdQnWd/H1fy87mG7GbaNOJhF8kGaDfuM21eWmv9nKzuQJnJmVU3nPZ1mLuyiO7syeV3lG5L
	daSv36rSRH2a71KYHe7X0H7vXAYhyGB/8HR0lMyRqfgt6YRDtykDJXgziFEv+9Q5cr/E7H/SH5h
	SWRwOd3Edkwci+EHGqk/QA==
X-Google-Smtp-Source: AGHT+IEZIyZ80nx+CwGk+O93D4se/mLmew3Yfg4IU+0c2JK2d+v3wVGF39JlO4RSiqfD8//4VL8XHg==
X-Received: by 2002:a17:906:4fcc:b0:abb:de17:4a30 with SMTP id a640c23a62f3a-abbf384a4dcmr201647466b.19.1740056505371;
        Thu, 20 Feb 2025 05:01:45 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbde95957sm492331366b.138.2025.02.20.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:01:44 -0800 (PST)
Message-ID: <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
Date: Thu, 20 Feb 2025 15:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Umang Jain <umang.jain@ideasonboard.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?=
 <panikiel@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_050147_668854_D4C6A047 
X-CRM114-Status: GOOD (  25.51  )
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



On 2/20/25 1:38 PM, Jacopo Mondi wrote:
> Hi Cosmin
> 
> On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
>> Currently, the v4l2_subdev_state_xlate_streams() function is used
>> to translate streams from one pad to another.
>> This function takes the entire subdev state as argument, but only makes
>> use of the routing.
> 
> Correct, but is this a problem ?
> 

No, it's not a problem.

> Is this the first step for a larger rework or is this a drive-by
> beautification ?
> 

Mostly a drive-by beautification to avoid passing the whole state around
where we only need the routing. I'm planning to submit drivers for more
GMSL2/3 chips and we're using this just to not pass the whole state
around. I think I can just use v4l2_subdev_state_xlate_streams(),
but I had these patches in my tree and it would have been good to get
them upstream, in preparations for submitting the GMSL2/3 drivers.

> I'm asking because (and I know it's hard to strike a balance) this
> kind of changes tend to make back-porting a more painful, and if
> only justified by "it looks better" I would be a bit hesitant in
> taking them.
> 
> 
>>
>> Introduce a v4l2_subdev_routing_xlate_streams() function which can be
>> used without the entire subdev state, to avoid passing the entire state
>> around when not needed.
>>
>> Convert all usages of v4l2_subdev_state_xlate_streams() to
>> v4l2_subdev_routing_xlate_streams().
>>
>> Remove v4l2_subdev_state_xlate_streams().
>>
>> V2:
>>    * Fix description of parameters
>>
>> Cosmin Tanislav (3):
>>    media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
>>    media: use v4l2_subdev_routing_xlate_streams()
>>    media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
>>
>>   drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
>>   drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
>>   drivers/media/i2c/max96714.c                  | 16 ++++++-------
>>   drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
>>   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
>>   .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
>>   drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
>>   include/media/v4l2-subdev.h                   | 10 ++++----
>>   8 files changed, 53 insertions(+), 47 deletions(-)
>>
>> --
>> 2.48.1
>>
>>


