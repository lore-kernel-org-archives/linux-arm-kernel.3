Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F58C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQeOb9Qy+K52HTOoxzaFzGj3ukur32nTu1ttrDF5hoQ=; b=2lUBD5c10ABxYoa8/w6w1KjO7H
	lf+O48g0J2+iD5WFlUmeKryYZjQE8ed4b3hwFCRyc11vsedsiOsJPfELAPZwU0ouuUl8qAZ/k/neC
	o6IshsZVN/K3keIFlPA9/v1799ZgTfg58Flm9RlGIYnXBodM2bpMnOHg3hgqKLQHxntPf/hJ1fzY4
	4vLruYldEf69VM/p3SZzOVxP4WpGbYVMaUH0tv9OWlfDDZMFqQkZctt3FU/hN6nRJRJjhJnXWZ84l
	pv7/GB2B2xQiuafkrpxr5qxHuvXb5auoIeb4PJ/uejlN7eouRn/C76XL4K5PBV5ANSTHbc6M/oCDl
	v6vBoh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Hdu-00000001f3d-21af;
	Mon, 14 Apr 2025 11:06:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HKQ-00000001bPs-2yDO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:46:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso43410965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744627573; x=1745232373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQeOb9Qy+K52HTOoxzaFzGj3ukur32nTu1ttrDF5hoQ=;
        b=SXYQLDmzcNhp/0crMoXZwnsRErkN2vZg4TMhbVzC8pnVuzpSlEfMLYsVcfR6il8+gn
         0QjLnh0s1TXXB7XnZ8avZk5yF8PxaA8RouBdoFFZ8Fe/KECDeqiDnsde83nwnEHxEySn
         K/1ez10Ph6jfwqD+D/Lp1LpZb4ZNKbtApmdM5+eTo5NELOA82YmLAMmsDFiWoNhYsU66
         Dl3gG+IVIrBngwqYz37uQPtKwX2AjyAjx4gvieBWPx9LYv31CeaeS3XQdq6cxOlPTdJv
         96Yya9ZiSUaCA/Y0r/oFG7VVLxG+6bh80kNPkxZsWiha7JzbbuzQAAHJWofgexbDlVGN
         7KGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744627573; x=1745232373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQeOb9Qy+K52HTOoxzaFzGj3ukur32nTu1ttrDF5hoQ=;
        b=fcel8UaOdUzbeCyqseRuTDJLScEqTqNUU8PTnLEcrVUSt5XxA85wyLU8RdxoJb6uw+
         46mwEZSSIUeNmVfgzMGbvkPjjlIFT5ppVHJLfqIPedZFGz2PskDJKubcaZai+Crfw+06
         RihuGElW/FekVccfzX4fWjztto8yr6ahrz3raMr77LAkE16RcS5ZeHQigwkvwBVGsrCB
         HFTqmXkagVvSyF1Z+YT3N+5ZN77HZz75+c0SDbCyO9JkO/gUdtBfJ/0GKoyjzVK4qUVy
         57pMDSMh3S5x5MBKMrRYxqpDMU1U7fZiS/Kw0HZBn+TT/hWIrTV24PujWVmzyhCeHDWu
         ea3A==
X-Forwarded-Encrypted: i=1; AJvYcCXtOKOvKVldciK1g8hygxtfMH4YNUl4/6mDKSb/0jitguHEl4ZWW0pSFYFGJWR+GdJxbRjesjhWtdph6FINszQp@lists.infradead.org
X-Gm-Message-State: AOJu0YyGfxTaGO3M75EIQbuqWr0rH3XtL90HxFbEcOkMTyWxuwkJ4l6u
	C2DPW/J6PcDtTnHMy+qM+fDL9ZZSGQrD6729k4CLSZ/7cDMpfNCoU1BtpIY1RcU=
X-Gm-Gg: ASbGncu5O8uW4vSWYawvV6V152KHxoo1NlLtZdrw07DphzxyqoDuNIfT+J8/xCGC5Sg
	WHPccSz/mrW9GehORBF05H5z5+8t3kr1Siygn+5qqQ77fu1Fs+WmuSdV46gneLnyZnu60cWnahZ
	bCZXhpEffC3OTiawm43U8kztS+J3FfPaksnEcPVJTgaCWZxY3rXhLSGWrhl9mvb3h3CIwKsDTvr
	5Grs4nCrg1HseEoedXl+DvK00k8h42hXeXzW19QfoIsRyNIIW7IniOpHm4I4Z4F9hVzyd+s4qhY
	XFzEyN4bg9WelIZYSuQUkQAZSfOaRDVecV7MzULWNMZU7cJgajrcA11uy/HuSnADIPwiugmUK99
	KTU7wmKPR7mnn
X-Google-Smtp-Source: AGHT+IEmlVyIZCmc7s6u9Mvm5ekiBlQHJoP4+G1Yv7tVnhDgdM9pPkqdPRM+lbmSVeVP2abLwsQOOg==
X-Received: by 2002:a05:600c:a04:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-43f3a93f7c6mr99598855e9.13.1744627572680;
        Mon, 14 Apr 2025 03:46:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c? ([2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964002sm10490898f8f.8.2025.04.14.03.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:46:12 -0700 (PDT)
Message-ID: <a36aa4a4-9e00-4b98-8b98-db182ee9bd80@baylibre.com>
Date: Mon, 14 Apr 2025 12:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
 <202504111338408af44d7b@mail.local>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <202504111338408af44d7b@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_034615_025603_653C2274 
X-CRM114-Status: GOOD (  11.31  )
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



On 11/04/2025 15:38, Alexandre Belloni wrote:
> On 11/04/2025 14:35:56+0200, Alexandre Mergnat wrote:
>> The RTC subsystem was experiencing comparison issues between signed and
>> unsigned time values. When comparing time64_t variables (signed) with
>> potentially unsigned range values, incorrect results could occur leading
>> to runtime errors.
>>
>> Adds explicit type casts to time64_t for critical RTC time comparisons
>> in both class.c and interface.c files. The changes ensure proper
>> handling of negative time values during range validation and offset
>> calculations, particularly when dealing with timestamps before 1970.
>>
>> The previous implementation might incorrectly interpret negative values
>> as extremely large positive values, causing unexpected behavior in the
>> RTC hardware abstraction logic.
>>
> range_max is explicitly unsigned, casting it to a signed value will
> break drivers.

Ok, It should be fine for all drivers using range_max =
   U32_MAX
   RTC_TIMESTAMP_END_2099
   RTC_TIMESTAMP_END_9999
   (1 << 14) * 86400ULL - 1

Whereas drivers using range_max = U64_MAX going in trouble:
   rtc-goldfish.c
   rtc-ps3.c
   rtc-st-lpc.c
   rtc-sun4v.c

Is it ok for you if I fix the drivers to avoid issue with signed range_max ? Because, at the end, 
you can't keep comparison operations between signed and unsigned variable, it lead to future issues.

Otherwise, I've another working implementation which remove all comparison operation and drivers 
doesn't require to be modify.


-- 
Regards,
Alexandre

