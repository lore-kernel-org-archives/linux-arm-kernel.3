Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54654CD6E48
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXYoTtDd3fqHx8jiPhi5RZA+APMZjV0IIjDW2SgiBMo=; b=J8ZqP/1GrC5+gri+zt0qMthiO5
	CTgSZjM4Tn7UkT5ZlN1T0O1jDD1qFUcPQ6iF4Qz86MnMui1pi2jwl314zrd/O3z9T1No3c6gjpEH7
	bv7HXJGzOc6vvDFVKUv/cDON7kghz97RIG0bpf7oJuXOvULJXlZPXQ7KT1T06bnj3DLEKV0Mb7/yh
	NYZDH4XpCp04ogeZEnC4PVWJVV1VIBrAH6eoaoN0zpifOWvnGb5Z1j/Ey6873DnEkeMrgU40qQ0W1
	2iyLofbqK3o6L4gQ1AntRHaiGlmNzoxiW0lcLW39ceOnOZt47HNegzBvDVNa+CwZeM8p2baoU0/4O
	r8TJ4ZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWoS-0000000AUwj-31SD;
	Thu, 13 Nov 2025 12:52:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWoP-0000000AUwM-4ASi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 12:52:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4775ae77516so8491955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 04:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763038348; x=1763643148; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXYoTtDd3fqHx8jiPhi5RZA+APMZjV0IIjDW2SgiBMo=;
        b=Szbt9lJWGjDjZsu1VDuG/5cl1eTiukJWwrZHd1xLexCWbhkz+TVzhOKhwpozppLoht
         o0Tjn7dZU7wmV457DTuUaj+H82R4RXOb+XoSQjqU7XeK1OaV7NVn8rUFu9vdByTHA/rQ
         JHOkx2SMPX3AI3+08RklwubGEl5LqxMp4KxhikxCNl/LrFddnjBMuubtnq7LJymQ/lqp
         qKO2uELZKN3bfehYyksK11/3QfPn094J0HkOtn3DPrTwwGFPepxkZEq7HlfgrYN+p3Bu
         XOknhgRCGCTn41Qw4Ou+RKdz1RE9unJX6xI6qkriGQ2q42i2kxxSLX7SiXDpS6qaCzk4
         PEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763038348; x=1763643148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXYoTtDd3fqHx8jiPhi5RZA+APMZjV0IIjDW2SgiBMo=;
        b=LltmjACJsLqL/NhnI6ZWiuYXL3I6IJql3h0nBONQAshvbYlFsFWXh1OD/aL+tQC7Jd
         SIBtsraRQ3Jv2nFR5qC0hq/mQm3mGTuQiCvgvG9WbipZudYdUZtBQZH9J5+ij7LWUUf+
         q1a7l18GGxFxyCEPgDHZuAA5hPhiJjUfdwBTyW2Iu/rKavRkUjAgKn0oYyYL5QG95Vjy
         lontJZO7MBVkZJlCf7hVFXw3a5RbqadCQk097c/V3L/M2wTVh6eU13gLI3+be0dSqi+Y
         1BEarky2HsQVPxvJ6P36mHt4x9lMHBsBtj5fLYNtl52Y7B8IoVPhd6Q2qv+7uXMod4Hi
         n91A==
X-Forwarded-Encrypted: i=1; AJvYcCUzKSsJYn1ZLZl+lKN29+IwpSyiEuUKRRPpVyJstlnEPo7cn0+cBgV1tfuYfhg+o8/EHNZjJ6c1hvp/HXV1vSnU@lists.infradead.org
X-Gm-Message-State: AOJu0YxmTR5Ft8Vn157TXXGDVaD8JtPNJxZElQybjHXeMm+fcCRsqMKf
	YKTxDhPpGmT/gxhdMvJDAQycEemN1THRRNU7V9cwMyDzp+VrA2bFIZ1uQ6HdvhYkd4Y=
X-Gm-Gg: ASbGncv+2Xn6XbFNFM1DKWiOmmYi1v8b9mVdLJ8p4NRHdA5KedH6mYyeJgE0L0AnOxL
	3aWNfz5uq+ZFCIs+DfFkqntATI7KtTRcgnCNx+UMmknEmQCBT4IGW22/eOyqAoZu/FFXOiemn0o
	A8gqa7wXg6MwfWkjj9CYmLUGIjXVIbbBsXCPcAQMn4CraszlE0J+abFKgkus3HTNic+vqZ+9AK7
	Yem0wUN1VClxJyoQ2cPR2sP09sQysR22t76QKc7jbAGymk5vm1UzuO1swEwu1syD21szrYwwzpg
	ZiJP0PUkxkhvgK7jNSn3I7aWQuey2wS/jgwkeIMlMeLcC6BgwsmZHghMkHtsUTbuai7dMzLSnGU
	RBRpwcJ0RhZeeoS3PvJ06DfSCp9zHjFmEeirSlaRvRZb07ZMh43JKVSMw77lU/fA7ejYo6JC+st
	/CUf+5jQ==
X-Google-Smtp-Source: AGHT+IHpr3MsueMipe4IlddXi4/Vzl0f21raKHfRPZH2whdQqJt5/ks7Bz8Gchg8IDQDCn7p4XbSfQ==
X-Received: by 2002:a05:600c:c4a3:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-4778704513amr69672855e9.3.1763038347935;
        Thu, 13 Nov 2025 04:52:27 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb30e3asm21086955e9.1.2025.11.13.04.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 04:52:27 -0800 (PST)
Message-ID: <8cb0b7eb-d958-48a6-8940-6672d01b7e49@linaro.org>
Date: Thu, 13 Nov 2025 14:52:25 +0200
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
 <1af37451-1f66-4b6b-8b36-846cbd2ca1e8@linaro.org>
 <62bb6c08-a1d0-4dba-a431-0d6ce49d66b2@linaro.org>
 <8eea72ea-c106-4dff-979f-c1acd6b0d617@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8eea72ea-c106-4dff-979f-c1acd6b0d617@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_045230_090950_B579AAF4 
X-CRM114-Status: GOOD (  13.31  )
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



On 11/13/25 12:44 PM, Krzysztof Kozlowski wrote:
> On 13/11/2025 11:26, Tudor Ambarus wrote:
>>>
>>>>>> this can easily be just customized chipid driver - with different
>>>>>> implementation of exynos_chipid_get_chipid_info().
>>>>>
>>>>> If the answer is no to my question above, how shall I model the device
>>>>> that binds to the existing exynos-chipid driver?
>>>> Just extend the existing driver.
>>>>
>>> So you mean I shall have something like that in DT:
>>>
>>> +		chipid@10000000 {
>>> +			compatible = "google,gs101-chipid";
>>> +			reg = <0x10000000 0xf084>;
>>> +			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
>>> +			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		};
>>>
>>> Maybe remove the interrupts because I don't need them for reading OTP regs.
>>>
>>> What happens in the maybe unlikely case we do want to add support for OTP
>>> for GS101? How will we describe that in DT?
>>>
>>
>> Ah, I guess you meant to keep the node as I described it in patch 3/5,
>> an efuse node with a google,gs101-otp compatible, that will bind to the
>> existing exynos-chipid driver. Then if/when we add OTP support, move
>> everything to a new OTP driver. That can work, yes. Unless I add some
>> OTP support now, to justify the new driver. Both shall be okay, right?
> 
> Yes.
> 

I'm going to extend the existing chipid driver. I looked downstream again,
and couldn't see any other consumer of OTP, even for newer SoCs than gs101.

Thanks!
ta

