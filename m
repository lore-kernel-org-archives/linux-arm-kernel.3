Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0FCC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33rmgJoFPyAjchun4vSBkR9dkd/0PhCNL1EX9XyW8Yc=; b=ua6I8ENtJRS5GS2PWCjV0SR9RW
	lRqF+q6ctIA54zLZBRIxGu9RUCLluJnLyEVVhN/B+2C8Tq2ErKPZNmvK0wyMYoEzz927KbrCiS6oc
	BjVH7XDfuLasyo2cnE2mqs9BT0YVgbFpwcnjtmKfYjfE+2Z1tQZnLsSC9rbegshJ1D39BZdg11IXs
	oGFxCqoqq+8kXGU0Mv6bPg85a2m+CMU/GaXcz6JinatJVQP9LCyMCdkzFgLVQAYsP9GO1a4b6nlHP
	N60cIKFKEx7nGoatB6YS3M6v37gEfR3gT67QL3nv7fUEwVleY0l/kqZ2Dvd1TFQtDlTG8qXVpK7Ra
	6NKDZbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUD9-00000005rOv-0XAQ;
	Fri, 21 Feb 2025 14:41:03 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlU0Y-00000005oqr-0z6H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:28:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abb7f539c35so427016666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740148081; x=1740752881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33rmgJoFPyAjchun4vSBkR9dkd/0PhCNL1EX9XyW8Yc=;
        b=h19b5jq5oPhFNpzUt2vU6uMsNVJ1ZxZ+aLiY0OC48HaNGRr6OxGkt46BpGF457FeHr
         80LEqIgIzdif/yuUpQCEnIO4e5i0VStpatEPZ1ZIozH3WjHBAxubgHq6a57hsw/k020F
         sYl5xGL0TkypMennQ8SadjTFvj3SGFbcW+SO/ybamDnpUhiO1OhlF5GxmvpOex93NtiW
         Y0SsTRCtQJ6p5B5BeV700+ab+JrRu+Zb27rwJSvNHkdf1rraenvfKl6MR4bNeiWrSk+m
         V25WvcV4q2txeJw8O/JYBA/aoSvqgAsczvbX7N9eId4oQqsFaWpg58FDKh8+67ErzMCW
         T1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740148081; x=1740752881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33rmgJoFPyAjchun4vSBkR9dkd/0PhCNL1EX9XyW8Yc=;
        b=F/Of/tDjAmb/KUB/gUHhCS5cvqdTDojBCz0jgykuZc9QWw6D1+YJh/+Lq8EB2GXRxY
         m7BS11I32u6sZt31lJnqJ5KRluGYqYePB2cHyWDZQtYGDyzZuUDLjWurvtBgzamw8/CB
         QqBZNGSSnzi66xVbMFh7f+qnq+1IQa1HahdDh1xO3tMtkrExTzFN8vg8nYJclVLruWVI
         x5w+4svkQOxMZmHg7Oz4tgd+3VW4oM26X9dcv6HQ36HtgKcGyhf3J+1ibXgHMtA399Nz
         3OhKganE4UjP5tMnuEmizSnvEIsQNy3CbomZoXW2QnlowIajJDOIi1xWTHJEEnR71R4v
         /m2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqqruv4hFW5JPWPsLL4L58DnCU2Rjf7KyBihVGP0Cjkad1zwiNY/nfF2y9stTH3H8zSwxepO0VNg1GqsHZB96d@lists.infradead.org
X-Gm-Message-State: AOJu0YyRyLRyzPnu61A40bvydt18L5BDh7h3dhoNcNwbv+HuWWx1IcDA
	/+ZZOfSLCr3Bm6B0LxQzJwYcjqta8cNyCBfJcnpLe1WeMAGMwpgv
X-Gm-Gg: ASbGncueFGs0alU2kIuqy/O5z+nG8g72my/qDSIbPvYMEHDjGSGuaV6lumi1PEpNsOC
	hTTd9Np2xd8YvMVe22j47d+Gq8Y2jDsR/T+Qn39Qb04Jr1vaFZfSLz9tI7kdWb/dT+956iFYjbG
	4ps2RCBH2oKQdTIIKjBoosMlRiRTWabvfnM0KGrKz8+Xi/OTd7predr5LZgZkH0mVCxhhrZk6vP
	4uZszdb6uk8F43rRa6YMVL7TsjOK6qmIohRIbGFTX2QoLyjm+ayhkViQV/AQ9KJGx6Zm8gkF3KK
	y3s7xfopfwswtpmR8/5oWeOk4LVMj+kF
X-Google-Smtp-Source: AGHT+IEw3WpudhQNFplJ29sjVHEYhC6rE/IVFnuZuPPiVWQyE+QjVu6xQp8nTv/VJK/U3W1OrZNliQ==
X-Received: by 2002:a17:907:7758:b0:ab6:4fa6:71e2 with SMTP id a640c23a62f3a-abc09a46c0amr310992766b.22.1740148080426;
        Fri, 21 Feb 2025 06:28:00 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba9bd6e22sm850995466b.121.2025.02.21.06.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 06:27:59 -0800 (PST)
Message-ID: <aa67bfed-2cdf-452c-bd36-2c5647ae96ed@gmail.com>
Date: Fri, 21 Feb 2025 16:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support
 for Virtual Channel IDs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-2-demonsingur@gmail.com>
 <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_062802_281699_92ACDEFF 
X-CRM114-Status: GOOD (  30.64  )
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



On 2/21/25 10:38 AM, Sakari Ailus wrote:
> Hi Cosmin,
> 
> Thanks for the patches.
> 
> On Fri, Feb 21, 2025 at 01:08:09AM +0200, Cosmin Tanislav wrote:
>> Multi-camera systems often have issues with receiving video streams
>> from multiple cameras at the same time because the cameras use the same
>> Virtual Channel IDs.
>>
>> CSI bridges might not support remapping the Virtual Channel IDs, making
>> it impossible to receive the separate video streams at the same
>> time, while the CSI receiver is able to de-mux streams based on VC IDs.
>>
>> Cameras sometimes have support for changing the VC IDs they output
>> themselves.
>>
>> For a practical example, GMSL2 deserializer chips do not support VC ID
>> remapping in tunnel mode, and neither do the serializers. Allowing the
>> cameras to have their VC IDs configured would allow multi-camera setups
>> to use tunnel mode.
> 
> We've tried to avoid having virtual channels in firmware and in UAPI,
> I'm not yet entirely convinced we need to depart from the established
> practices. Let's see. Apart from that, please see my comments below.
> 

Can you think if any other way of handling this? The most useful way
would be to have it accessible at runtime so that devices upstream of
the cameras could assign the VC IDs dynamically.

This would be useful when having more cameras than the maximum supported
number of VC IDs (4, without extended VC IDs), and streaming from them
selectively.

For example, for 8 cameras, you'd have to prepare your VC IDs in advance
to fit the streaming selection you want to make. If the cameras 0 to 7
have the VC IDs 0, 1, 2, 3, 0, 1, 2, 3, you wouldn't be able to stream
camera 0 together with camera 4.

Dynamic configuration of the VC IDs would solve that usecase since it
would assign VC IDs based on the routed streams.

v4l2_subdev_pad_ops has a .set_frame_desc() that could be used to apply
an updated v4l2_mbus_frame_desc, after retrieving it using
.get_frame_desc(). Cameras that don't support VC ID remapping would just
modify the v4l2_mbus_frame_desc to restore the VC ID to the original one
(similar to how set_fmt() can modify the passed in format to what it
supports) and the caller would have to handle that situation how it sees
fit.

Does that sound better than sticking the VC ID in device tree?

>>
>> Add support for specifying these Virtual Channel IDs in Video Interface
>> Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
>> Although the CSI-2 specification allows for up to 32 virtual channels,
>> most hardware doesn't support more than 4. This can be extended later
>> if need be.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> index 038e85b45befa..414b5fa8f3472 100644
>> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> @@ -231,6 +231,17 @@ properties:
>>         shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
>>         busses only.
>>   
>> +  vc-ids:
> 
> Other properties aren't using abbreviations, at least most of them. How
> about "virtual-channels"?
> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
> 
> Shouldn't this be 32?
> 
>> +    items:
>> +      maximum: 3
> 
> 31 here, too.
> 
>> +    description:
>> +      An array of Virtual Channel IDs. These are unsigned integers that specify
> 
> I'd leave out the explanation on the data type. It's redundant.
> 
>> +      the VC IDs used by the device for its data streams. This property is valid
>> +      for MIPI CSI-2 only.
>> +
>>     strobe:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       enum: [ 0, 1 ]
> 


