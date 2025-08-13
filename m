Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D33CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XvjMpS+8oWnYVArmJHtXmTPeaMaVACHoQ9sHAWIeo4=; b=ZyD7KoMsKvmdc9T6TgOj11R8vT
	CB3a9zI6B4F7z43t/mJ8wk3F0csE1O1Qr38qxTCVTBSUacj2C3WQ+YG/rfLi91yB1zW3O/3pLVlW1
	qsEoR01Tl2q+wgV0E3N5gY3oXJbxXR9r0VNKFDaqRBJbvbVifZ1eqd0lJ0f7XqvmSkjap5O6OS4Eg
	Cyq3KDsuagORuUlIhysFRaS6P6GrBWfbSSBRohJX7a66mB6u65Nx865MlxuOzWpOZVJxkvT+UxTBZ
	6zbnkL9rSC8cN041mQLTxpreCWYy8mh+19ULjqc/SqO8dsRkI8yM0MguMZzoDpg6/37HQ8wQCZWTf
	fq1qS9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBFF-0000000Diuf-0MiC;
	Wed, 13 Aug 2025 13:10:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umACj-0000000DamA-1znY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 12:03:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b7910123a0so5790100f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755086620; x=1755691420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XvjMpS+8oWnYVArmJHtXmTPeaMaVACHoQ9sHAWIeo4=;
        b=qVqwSd2pUF+Og5+XvrxksNjSBNEAAlOuOz00L4CXd/m/T0hXE/eA1P8it+4Xq6ai90
         NyriQc5ZYlhL1g7iippvXMJklpQvH1hTm7b7y5CvFlmMHg/dyLX0d2kUUQDeb6yihTxT
         zG876UJlxI9OG37QNegoanAKNmEm4/wC0g5mN21QVJ7uYmA+m9/vPLCT5TegVNBOEhcK
         faDPqw9/KiwJ8sEsbM9fabxw1ogFxGfLFCazEwidiOLdPLtrHw51qmyFqrYo6FnVGBY5
         l4w896LoIgR1+0RHrWrt+KRLOhUYGGPxF1qYgphpP2/bptp4WUs8unxkVK5cT/Z+u4+L
         AVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086620; x=1755691420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XvjMpS+8oWnYVArmJHtXmTPeaMaVACHoQ9sHAWIeo4=;
        b=XxQYTykoeqTgyJd9839TqFVHHq7AQTx9xOQiLgyzMjU+x2I5xWuxO0yw1i6Rjd2mtf
         TeZZoWmZcudE1rDDslzf/jcbhIVvS3g1iihfmu/Xlbr2oj3f++np76o3Sh1O543XUfLM
         GgkS71bTytXS/fzvdZwwdUwCdxRg1PBplSezwkice7NiGiQ+i0celO/NPgBw7sI7XZOX
         gqKaZ2rOq8i7Mmvvzq60UE2sBsfWJtSoIondYa3yEk2/rv81bDKs+4l0TIIOJz6WMDya
         nxy634qJX0JM1kAlUUHVJCEP2hkV+jtJaqg9dFcpJeYEOhGMLPPXRGtQQF3yF3dUgcxe
         r2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc9cmGqkzGB6TltG+6VqQvRjU+Okp3VnzRf0eK1LQ4wR37qWBhlUx09KPhCkbqCtpWR/0zh/zmH1q4dUfxK5oB@lists.infradead.org
X-Gm-Message-State: AOJu0YznGYNaaq5BfwMpR0Xay73raJqJMYfBbSohYQknk4/jmtxun8QL
	hJItWPBIL29+BVCETz2pzwTwTguB4SuAN+Tsw4vHCLnkQETQT/HkI95F69OUOD5jvg8=
X-Gm-Gg: ASbGncsXMtXUaMGjiD60GAS2t01Xc+9PTKiRuTkoHZVycGEjQJ9VuvUgP5CCpDLDbl5
	USQ/aA4IfkTjq0U3KErT2zuivEibdZ3WDjJ1Dqe/1mJVeP/xDBlddxIstrAOaWmkCb86BxE7ELG
	/s8Cdvhf2VYUMeGIQndXE7eYadPRxkhmPPh8eNK1CESYaMcNYAVUXGhkE4xn1w0INzzHuWONcdH
	0TGGFZjKLkOvf86hOR9GHTIAZC+6mhEVJEn2oSjiiHIA4MNYN1xWOjABPLuDNlXNoEa/qbE+mHU
	ecz/bCr85Op79YdvrTsydCBDuRnU6D9NjxQ+ShaNuWCSpiNvi+qIGc7I3O8wfgY62QQ7CmWD5Yq
	kD4yr6fs8coLPSCVjVj5hYm0IxLGvYEHJEnN7CZxPIt2Awjf0MPmEnSYRuAV+SQ==
X-Google-Smtp-Source: AGHT+IHxp+VeWjHiqQ8aBd+gz91GtrFP/7x1AqDysrQKifIk/EESEugnh5wrM4RvHZhNCnsTelpLKQ==
X-Received: by 2002:a05:6000:290c:b0:3a6:f2a7:d0bb with SMTP id ffacd0b85a97d-3b917d29dacmr2224481f8f.12.1755086619388;
        Wed, 13 Aug 2025 05:03:39 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b90fdc85a4sm8298461f8f.60.2025.08.13.05.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:03:38 -0700 (PDT)
Message-ID: <f7f01234-ce5f-41d2-8a73-17f6b86dcd1f@linaro.org>
Date: Wed, 13 Aug 2025 14:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clocksource: Add standalone MMIO ARM arch timer
 driver
To: Marc Zyngier <maz@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>
References: <20250807160243.1970533-1-maz@kernel.org>
 <20250813-macho-snobbish-alpaca-ff07fa@sudeepholla> <aJx4g8z3l438Qgnv@raptor>
 <86ikir8mqw.wl-maz@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <86ikir8mqw.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_050341_529091_0048F0D7 
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

On 13/08/2025 13:49, Marc Zyngier wrote:
> On Wed, 13 Aug 2025 12:35:31 +0100,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:

[ ... ]

>> ls: cannot access '/dev/kvm': No such file or directory
>>
>> With this series, if firmware doesn't configure access to the memory-mapped
>> timer:
>>
>> [    0.549399] kvm [1]: Hyp nVHE mode initialized successfully
>> ..
>> [    2.018050] arch-timer-mmio 2a810000.timer: Unable to find a suitable frame in timer @ 0x000000002a810000
>> [    2.018123] arch-timer-mmio 2a810000.timer: probe with driver arch-timer-mmio failed with error -22
> 
> Ah, you have managed to test the error path. Thanks for that!

Applied (including patch 1/4)

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

