Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44DACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ty/mxLD4L9LpaeVN+O8zS/3tkJV3r5YXuKG/N6BCA60=; b=Y//awG6b1xIszEIlBH6md9jUl5
	QaHLwOKJKPVi256UziteeXrZPaN9HFwk+QluV1ajAvKw9Q5dyjrxneIAJ1SzopgnyWnHrprM7k/Jh
	wJcTUPLTLNpkB1v9TZBzNqEybkuGO9nevHJs/MW5LPLNrAk/z5lA9i0PLw8PxBrhuXv5pRRNpX95L
	rxrfsObJJkc9ix52+DkS8mly3z1HMnytAYgmhZfn9bB2EcYOrHVNqMrUoXZH/TztFT2eMh2T8nG7K
	ypB+bSHpDlWvGB1CmLABNvh4+pAPavB5FfiWk9XqJmEOQK00V302zmWNo7uvL0Ovf07p0aZH5Kk4x
	cYQccwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkjq-0000000F4ls-0Gkc;
	Wed, 03 Jun 2026 12:30:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkjo-0000000F4kJ-00pc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:30:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45eeba68948so4905466f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780489822; x=1781094622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ty/mxLD4L9LpaeVN+O8zS/3tkJV3r5YXuKG/N6BCA60=;
        b=WdNB3KsILR+BOQMRtgc56q6OfvdggwIX53EFXhNRlqZTnXDiwfbKqE1OzRRBoAazE0
         L58iOV3rggC2sVN0XLVuixrW/weR+paUdHSjuQMULCf0BpaqU0LuDwN7nZASEzE/HXtU
         fnpWX+zDyRt6SJl51yEmrQD62p2gykRk+Ho8Nt+rie6dhFu4Am95YZhmE5muvFI2l1Yj
         dT/N6f0rUNjduW53+1vHpGRyRU1bIt36vBqgpLUXQqhRTPzBPIrN6zeW5EJVN/B/Axzf
         E8pjiCUO7bgfodHSx4PPn2hQ5EYgDtHJbwBsaQvrm3m7cbB9uXbvYNv6364L8dMrbJSB
         ITtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489822; x=1781094622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty/mxLD4L9LpaeVN+O8zS/3tkJV3r5YXuKG/N6BCA60=;
        b=HZK1RpV8/zz/gXR3lyhVEAkr3OHx+f9YVcXACiSpLJAcwiLE/YLgw8N0fhlMQACQnx
         TPcrpWHlxOvSbB+OwBBpMA/RuGOwm1qPTs9+GkWCy7xW2qxAG4mFN0fdzxs6pL5hF7Ql
         w5dqAP/eC2f0xmVpnO+xiDr1bpcVHRtouyp1SOzTBwqOPLVEHXNkZ/1uxErOHeb4f2gr
         3aUxthwvjaf/QeL2+pMhQRr/DrOM/lA99tsKRBGO1fHxxijjKwvJp3rSKTt21iWgGjjm
         6IGCgJLZxjXvlkccIZMRy9hL9fgwdoxgsnCgfyI1z0o9bZi0oo8lyCr1e3niFPMdetlZ
         vVCA==
X-Forwarded-Encrypted: i=1; AFNElJ+7T6A524ErZfeTEASpxqw7QBM7INVmSpeeIZPX3Udf0Aq7UvnD2baDCwBwVakfM48W4eTynXPixyhm32R2IZbR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx+/JBtvB3Kg93ijzdU4o8DJcy4KcAmEn8TLAyQ25CFL0qnuv+
	E4TN77TS3xWncQc2+ypQln4nY2vPTv0YvNzsgC1UZGQEMAxLX/SN9XtrAXcQosR67Pk=
X-Gm-Gg: Acq92OHxlinC7Mu0UMOWmoiqD4SSStQMuESh5Kezr0PT6TZMe5Ot8kFiUvmMSR5rZq7
	fQYjTS9LI30maM6IHPNRadt4N+W5HpoHyPsTUVbxvjqlEM0cf6ur3kvp1XdxGSD6EQZXQhTOhxt
	CnsSjqQBedBDA6aTYl/4IW9kEMHzB5VoA4UYYZkfCg4In3GqtZ3OD1hORx5I4aHX52jIn+QmpDQ
	H+w51XHiXURv9GiKNcfS36TMhm++oASAWoQpd/xIo5yArpvWdjp6QMDWIO4uiqdw8DoUWGnzW80
	Xdi7rf4qmCAQF0EBKdeYynVyD0l3D5J2/KA9ia+zQRqhOFfmeJVol9/QUhFm2AeS+X8DMrUNmc2
	RzgfU+4U/U/k58cmxvA46JFCPY0B6m/AiNhMPpAJLjtfcOL5SpZZ6l3uxCOr/uvxdMeB+ZuR7Sv
	qaVcphekTRxnju+AnCJh1ny7uxiKS2da9IoCvGCxm+KQ==
X-Received: by 2002:a05:6000:46da:b0:45e:f381:cd7b with SMTP id ffacd0b85a97d-46021782644mr3373955f8f.8.1780489822108;
        Wed, 03 Jun 2026 05:30:22 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc294sm11268422f8f.7.2026.06.03.05.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:30:21 -0700 (PDT)
Message-ID: <6fb8c47b-696c-4dfd-b571-abb613bea493@linaro.org>
Date: Wed, 3 Jun 2026 15:30:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] thermal: samsung: Add Exynos ACPM TMU driver GS101
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
 <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
 <DIYTOGU8I2DV.1GKZ59F7AJWTE@linaro.org>
 <c76c8f9b-bdd1-4006-aa28-735254f0409a@linaro.org>
 <DIZCLBAOV4ZM.9SJGGMZONFB7@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIZCLBAOV4ZM.9SJGGMZONFB7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_053024_066052_2618B9F0 
X-CRM114-Status: GOOD (  11.41  )
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



On 6/3/26 1:38 PM, Alexey Klimov wrote:
> On Wed Jun 3, 2026 at 10:26 AM BST, Tudor Ambarus wrote:
>>
>>
>> On 6/2/26 10:49 PM, Alexey Klimov wrote:
>>> On Tue Jun 2, 2026 at 6:00 PM BST, Tudor Ambarus wrote:
>>>> Add driver for the Thermal Management Unit (TMU) managed via the Alive
>>>> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
>>>> Google GS101 (and Exynos850, autov920, etc.).

I'll drop the `(and Exynos850, autov920, etc.)` too.

>>>> The TMU on utilizes a hybrid management model shared between the
> 
> You might also want to correct this "The TMU on utilizes..". On
> gs101-based I guess?
> 

Okay. I'll submit v8 shortly where I address the rewording, the Kconfig
dependency on ACPM  and the other sashiko reports. Maybe this still has
a chance to get in (we're at -rc6).

Cheers,
ta

