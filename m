Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10247D58E7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltNDP6q2mUdMtPqpRgX6YzMyjY4kZxSKj4nBNx4rkj4=; b=wuAbkAZm1h9MCnZjWNS3NfK17K
	x3d8IMJ8LUaRLGH3j3ROVmJQUvSEUJLCg2m3OI6+Kwu9yrjBBKu4VUFov7SqEMdlhHasA0CYht1N4
	yVmhtu83p3ZgrgsQ5or9JA00jIMxVEDkv44oT27qgLfnE7RWwnx/EFAZnU9OMRLQTVldkJZBTEAWU
	2ZQlbHnHtKrCJNjPCc4KknuH+8IXVTiGb2GuolTwkb+Bb2ML22LKfkk1aa3ytEzcNYCwk1NqPuGr7
	Rn1kai55TnqdpLTmMq7juYwsqbupyu5AmMUtK2ClpKY3UXHb/g87yVeINbSXOqzZebm9v4xx6TPed
	PxU2AeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzFP-0000000CZLp-1rOR;
	Mon, 02 Mar 2026 09:07:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzFM-0000000CZLB-3Le1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 09:07:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so27665075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772442442; x=1773047242; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltNDP6q2mUdMtPqpRgX6YzMyjY4kZxSKj4nBNx4rkj4=;
        b=CFlNA7rhqQKG46aeMCZQNA401w6Iyz9WEeTsOaJyQb1Xudxzvrzz5Swt92vhiX12z8
         cLJESU8FFeFESKrBQn23BGEC1TjwrbfkvfgddHotxS0x4l/ecBEA3aBNENj6Z3xUizib
         sJITQEsrmHrJTqQ3qHdOyAiwYUdyEWkvh6q7+AnXVsA/cJSpI7d5hGv4PjgInoBAyKWn
         2MjeA9jqeVanPSmbPjNaR8G/A7woDxMGP/rMtEIX60AMQULWcUoC1gz353EjEw5sVvfg
         jSZC/PhPYP9GNvQhuq3FZJKaRz4V9DX+cdcYLpQ1xt0q5QtCxG31LDfphRqjusi3XvBF
         1d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442442; x=1773047242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltNDP6q2mUdMtPqpRgX6YzMyjY4kZxSKj4nBNx4rkj4=;
        b=rpd1c0pEcjoWzK3Ky+DrERQf633811TsnHOBZmU35wjeVzfvQy+psOWKrKuQrePMqr
         yWy5BwDKt4RQSMLuJt4c/sGblvUO8vv/rxi4uZFbZo7C6pxIzUl4c9/sUj1Oa4BY7rQt
         hBDbFzJ3k3YSr75EMX7GC/LP88nh6zD+68/LCtVPAwHJxdIUOh6qH5uI1txSpMalZwcs
         iKShipceqjFu+qifxcAWbfOWGIi/QpWtslM6eX9Ey922WaDYp8UCd+R40PfMNkRwzmnZ
         82XYw2BsWRLtlulr8HagMAQlal9lsMCpGkVm3202bYCrnATEEw/ODD7haTtW0kObxd4z
         PMYA==
X-Forwarded-Encrypted: i=1; AJvYcCVm2JwMYTwhYseQ4mixRSBLRqA/fKI+H8CYDOXTV4d/NZHSPFzQ9d01dSFrjXXv6Vs12Tlf/zeAeiXaj0nPcXm3@lists.infradead.org
X-Gm-Message-State: AOJu0YxpDksDY5XbozWHdXn1g6Dq+23jcAAap3oku0ndtoEDhpVqJKt3
	WA/Fffo3EJ2z4LJiD/VvjyzWN4z29DPcaJVAGCvBPTDh5urAGwFhPrkZciKcMWjPCHk=
X-Gm-Gg: ATEYQzzED9YEhEWz+oI161o8iZ7vMl1y11uExV/nzkSddOjHd07Yi234YfMA6nSGkkl
	C2RacaY1OrMKA579UwPNNjorxAnetjRjNlFgvBz3XLAuc5AUVSz8NkC0oqsKuJZtHoIIiRUYOu7
	ME+2t2efrvFYnqgjbUsAiZL8NuDnELJD2Yt9lUm6q9SFiJ4hJzInMOuzaZ3jObq3e6wTcy/cmO6
	tnj4QtSDQi9i1GrIbru2wkIjZuaRlmttuBp8mCM72h/wIMdf2aiViXRv3DmhawoRtpTn75swReL
	65d7W3iSez4FTzGhNN6DgZFaXnikRSYOeBLoOPu3jV+yuv9AA9M1w7tdejh5I09sIFY2HG11DiP
	XxK++bZVcGrXEzHJXlaW5Ys72VWBsDn/FG5coiHNunzwQctPsuyQneNyeJuHtJez+gs1OAty19P
	oEQYRliveCuWlNgpUhKT9tMsbXDmQ0FD8=
X-Received: by 2002:a05:600c:8289:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-483c9ba7cbdmr202248045e9.10.1772442442277;
        Mon, 02 Mar 2026 01:07:22 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm271364845e9.15.2026.03.02.01.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:07:21 -0800 (PST)
Message-ID: <b1f5be90-62eb-4482-bf42-f331739733ad@linaro.org>
Date: Mon, 2 Mar 2026 11:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <DGR3X53FPO88.3C2UO0HGRVQGF@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DGR3X53FPO88.3C2UO0HGRVQGF@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_010724_858998_33598894 
X-CRM114-Status: GOOD (  13.18  )
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



On 3/1/26 4:57 AM, Alexey Klimov wrote:
> On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
>> Add support for the Thermal Management Unit (TMU) on the Google GS101
>> SoC.
>>
>> The GS101 TMU implementation utilizes a hybrid architecture where
>> management is shared between the kernel and the Alive Clock and
>> Power Manager (ACPM) firmware.
> 
> [..]
> 
>> Sensor Mapping (One-to-Many)
>> ============================
>>
>> The SoC contains multiple physical temperature sensors, but the ACPM
>> firmware abstracts these into logical groups (Clusters) for reporting:
>>
>> - ACPM Sensor 0 (Big Cluster): Aggregates physical sensors 0, 6, 7, 8, 9.
>> - ACPM Sensor 1 (Mid Cluster): Aggregates physical sensors 4, 5.
>> - ACPM Sensor 2 (Little Cluster): Aggregates physical sensors 1, 2.
> 
> What about other non-CPU devices? Are there no sensors or implementation
> currently doesn't support them?

The implementation currently doesn't support them. On GS101 other sensors
are for GPU, ISP, TPU, and AUR.
> 
> Is this implementation and ACPM TMU support exclusive only to GS101 SoC?

no, it can be extended for other Samsung SoCs.

> IIRC, mapping could be different for other SoCs and, for instance, last
> sensors could be non-CPU devices.

right.

Cheers,
ta

