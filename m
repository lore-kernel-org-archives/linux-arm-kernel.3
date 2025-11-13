Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A15CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDYZngmwSRp+0NNAwoPTnkhHZW5E4BniA8duLqhYUG0=; b=q51MCjj5IE+PAGPDxd8NczX05g
	/GIQZZ/n0QVH685BhyVNjmmEqxBIWiZrRro06xpAB7vFTfo1yGBLaflvG4yapA7E7AJIOtcMF4wjp
	cNEGWek8BVc0zBrksHWFWipEEJ30RB+d/ibV5IfclUITGyMiBSQx2zwY8h3/d/jFT4Vk+B22gDg8n
	cHoox1K2cvvEosK1qYzqTcB+pxvsN5O0roHlDAXeOMsOYia8KszPZyqF+ETnB3jkUGWgEKQCbD6co
	/+C03KqhbthkOp3BsCh8Daq1WeL6GgzxgEAjegiHxO9oMPx84RmXOZtwdHyEsytxvEHg4WaSSgVJ5
	2tpH4mHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTzg-0000000AEUb-4BVM;
	Thu, 13 Nov 2025 09:51:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTze-0000000AEUA-2w9n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:51:55 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-429c48e05aeso333862f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763027513; x=1763632313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDYZngmwSRp+0NNAwoPTnkhHZW5E4BniA8duLqhYUG0=;
        b=EnSIaDF6Y4ocOHqN1YnsfzW9873/0OBKTq7gHcTHIjiHTfwlf8fP0gjOw1g1neuYtU
         QfUXmwpyjxDqe7ASGXGIbEV+G+h/R3incXV+1+Hg2pUMhmdIzEAt50TvXgWQMlezCyGw
         /0utTLOdBSWwqn6uVhz/1pNyBYMo70wYWwqGipl/xm63o9XR66HXwbrB7VyQl4hHLbFa
         IGxI9I/z4vVCQfF2fVrb/K5e6MDOMKbFSYtng28Ms0mptyBCj8QzPUvE6qeqLGiF4cgg
         Kg81HdVsHGWn8ptIuU3Xv7KCRVnlXGLlm9EERukwR23hSotmGo4wHFrLNDrYaI0Mdier
         w/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763027513; x=1763632313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDYZngmwSRp+0NNAwoPTnkhHZW5E4BniA8duLqhYUG0=;
        b=WdpGcSBFm6pBpMZVHwgKxCdLmNECISsjCGrH9fcp8U/7Q0DfrLoqxpbp5eASk9bYmp
         mvd1tPYlyZxoySW5cjlzsvKcm1UTZZeFeYdkzTPepcvQLbI3+N8Us15E2H+sl/LrM0fn
         wr4C234dTcmyo2bzl5zdmq8NLx3DASKcSvMsUOvGHRAh5LxT3fU7jjsUddi5ZHd9uO/p
         74B5c4+255/PDER7LuY0jdlRY4LC93AbvIvFDpKIJtO9PQyWZPnd/TrRBg8lM623Hbg6
         0vtiWEYa1Nr4jBsBSbBLzu/fXF+UiYr/4vOrf7jV5d2hj0pRAcyBt7Ik5TJjgc1dqJ65
         DF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWz+0G4nU6DiHHk1pKie+E9KOvUm+MOBRmEe63f5JgS8WmYfxGvfq+deFruQ4dMCQyWfdg7FFWdPQ55C3GJoFvU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh33RvDSSm7IJkUPLx3cPnDjxZjSZ8xtZHDrcUwbVbZpiVLeDR
	DJ1F6H58KQdHK+WvkOG+rVWlX2Axw0LImv5COh37FRqIG0qWzcpYR+HfpZLkiUxA2tg=
X-Gm-Gg: ASbGncso4YPGOnydeceaaUp0Eu+nLlT8T9yhCa1u+dbd6HDH83CCmFrK9vJ9NQHebV8
	hS5A5Ypp3TYHOyFXgUfQyjxPcJigG/8AnZ3E5wh4mzBd5n1jS1R+znPbtgi+s3Lm/hdcLJ7wW8w
	enpDqpdtJVJ+LfF4C9XU6wV1bcE2aBKpwkveLL1onR1p7P786ajwB6FstecdWqRuCk5Ftg/IhLn
	l10l3O+JneufymZSe89obUdb8uNtuMPwIS+ckFNligZ2rCFjQ/bREpFlhJRCamGXh1yWA/lMZjQ
	wv7f7l2Wkb++L1edI8nQwLbmrbCiMFGBe0OOSoplGUJQ8PUFjEWcKTz5yXAV8b9yIlNs7f0YYGC
	VM8G4MjAwkrVfamtJuQa0+v7URfCdhIR3O5mr+BdFNQymKVx7tIQJc6jPfCc98MbuPVXSXlTFiB
	54pgmsMDIsib47LkSp
X-Google-Smtp-Source: AGHT+IHZkeuEDZYJsmeqSkNhq3Bl5KYXIylnr89Ea5RYR3BcZR9jpgcLY7nN/+8jXCtmO4YuJD3daw==
X-Received: by 2002:a05:6000:2887:b0:429:58f:26f with SMTP id ffacd0b85a97d-42b5281c40cmr2203450f8f.24.1763027512635;
        Thu, 13 Nov 2025 01:51:52 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm2817519f8f.38.2025.11.13.01.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:51:52 -0800 (PST)
Message-ID: <1af37451-1f66-4b6b-8b36-846cbd2ca1e8@linaro.org>
Date: Thu, 13 Nov 2025 11:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
 <20251113-benign-macaw-of-development-dbd1f8@kuoka>
 <9d77461c-4487-4719-98db-1c5c5025c87e@linaro.org>
 <725ea727-d488-40aa-b36d-04d6d44a8ec5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <725ea727-d488-40aa-b36d-04d6d44a8ec5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_015154_792330_3A709623 
X-CRM114-Status: GOOD (  33.46  )
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



On 11/13/25 11:35 AM, Krzysztof Kozlowski wrote:
> On 13/11/2025 10:28, Tudor Ambarus wrote:
>>
>>
>> On 11/13/25 10:30 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Nov 12, 2025 at 08:29:06AM +0000, Tudor Ambarus wrote:
>>>> Add initial support for the Samsung Exynos OTP controller. Read the
>>>> product and chip IDs from the OTP controller registers space and
>>>> register the SoC info to the SoC interface.
>>>>
>>>> The driver can be extended to empower the controller become nvmem
>>>> provider. This is not in the scope of this patch because it seems the
>>>> OTP memory space is not yet used by any consumer, even downstream.
>>>
>>> Quick look tells me you just duplicated existing Samsung ChipID driver.
>>> Even actual product ID registers and masks are the same, with one
>>> difference - you read CHIPID3... which is the same as in newer Exynos,
>>> e.g. Exynos8895.
>>
>> Yes, that's correct. It's very similar with the Samsung ChipID driver.
>>
>>>
>>> What is exactly the point of having this as separate driver? I think
>>
>> The difference is that for gs101 the chipid info is part of the OTP
>> registers. GS101 OTP has a clock, an interrupt line, a register space 
>> (that contains product and chip ID, TMU data, ASV, etc) and a 32Kbit
>> memory space that can be read/program/locked with specific commands.
>>
>> The ChipID driver handles older exynos platforms that have a dedicated
>> chipid device that references a SFR register space to get the product
>> and chip ID. On GS101 (but also for e850 and autov9 I assume) the
>> "ChipID block" is just an abstraction, it's not a physical device. The
>> ChipID info is from OTP. When the power-on sequence progresses, the OTP
>> chipid values are loaded to the OTP registers. We need the OTP clock to
>> be on in order to read them. So GS101 has an OTP device that also happens
>> to have chip ID info.
>>
>> For now I just got the chipid info and registered it to the SoC interface
>> (which is very similar to that the exynos-chipid driver does), but this
>> driver can be extended to export both its memory space and register space
> 
> 
> There is no code for that now and possibility of extension is not a
> reason to duplicate yet.
> 
>> as nvmem devices, if any consumer needs them. Downstream GS101 drivers
>> seem to use just the chip id info and a dvfs version from the OTP
>> registers. DVFS version is not going to be used upstream as we're defining
>> the OPPs in DT. So I was not interested in extending the driver with nvmem
>> provider support, because it seems we don't need it for GS101.
>>
>> Do the above justify the point of having a dedicated driver?
> Only partially, I asked about driver. I did not spot previously the
> clock, so we have two differences - CHIPID3 register and clock - right?

clock and interrupts, but I don't use the interrupts because I just need
to read the OTP registers to get the chip id info.

> I wonder why Exynos8895 and others, which are already supported, do not
> use CHIPID3, but nevertheless these two differences can be easily
> integrated into existing driver.

they can be integrated, but I want to make sure we're making the best
decision.

>>> this can easily be just customized chipid driver - with different
>>> implementation of exynos_chipid_get_chipid_info().
>>
>> If the answer is no to my question above, how shall I model the device
>> that binds to the existing exynos-chipid driver?
> Just extend the existing driver.
> 
So you mean I shall have something like that in DT:

+		chipid@10000000 {
+			compatible = "google,gs101-chipid";
+			reg = <0x10000000 0xf084>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
+		};

Maybe remove the interrupts because I don't need them for reading OTP regs.

What happens in the maybe unlikely case we do want to add support for OTP
for GS101? How will we describe that in DT?

Thanks!
ta

