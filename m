Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3926DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jjh8awUqCCw4utSfZXOcxNoe/sGWEOM53BOqQHOzNR0=; b=Oit8V2ANFvY6AULuiX95OY6nEO
	aqoGHexCTUnU5+YNeT7R9UntOf+skjHpbtf5CllN8pGUkvHeJQUUebIXF3sUykRP+U8SeUySaQAHt
	k/LArOIM5enDe0x/vtagmiQsuz3L+UiBerIgb+b+KfyjKruYCTxsWIW+0eyrR+fWFDWnGtN5DFlaB
	5kPnhQhmnYQGg1obOVyiBYHXAT3SlptP/9VVKP91hb1jzDSo/KWF1TITh4XaWCTzYoXmPNzromRR0
	u4DM/mazW9GvD0sMK+CRr48TeeykO4mHVbcnDz7NUy777uECipZcvVT/UZtu0Vkkxxyi5c5/1eD3B
	yRbmtsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0UF-0000000BSeW-03BI;
	Wed, 18 Jun 2025 21:38:27 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0S0-0000000BSTU-3XeA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:36:10 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3de18fde9cfso540975ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750282568; x=1750887368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jjh8awUqCCw4utSfZXOcxNoe/sGWEOM53BOqQHOzNR0=;
        b=UgsxAIGNewwrrmLzYdE5D7+TILTE1XU0cfel1OWxNB8uDoiBaAPTQbWda4dqnXZtLP
         MOmjaqRWLa2vVXIILzJaG1H5v6gung40zmhBhxxjYRgRoDwzOvS/yApbQ3oifr23oQoI
         cPu5KEuSzq6cB6X7styxLVzCRCRgyY1vN0wLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750282568; x=1750887368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jjh8awUqCCw4utSfZXOcxNoe/sGWEOM53BOqQHOzNR0=;
        b=u9etd6alGTFnXMN8zIygwpgqh5ZS7vXHspSLOgAB1FjtjhBuJUI6zr4TimUI+6wUzb
         JW3MOCT8IkEPPTowK6TCnTDv5xh0PiYdeqcfa8VPdlhVihrykmoKyI1wF3yuSKQMVaOK
         Sy7IZTMDitFxKKHK5TnJ9KLr0fNSakuMpvG/AKPGOMsE4GOPKmE+DT8Fmlx03TxPYsDX
         yhqyc1Q/sw9XcNod371/hN8B/DR9PamBAncji5AmD1b3GCvDDst51aMLgSxFCjt6zIkP
         TZrbah+sa9hkIEAykL3nWPvd4AvZMIIHDXBvpEsLMVlHCXVCZVqB3iEfdReFbJBx6ITy
         RKrA==
X-Forwarded-Encrypted: i=1; AJvYcCVMflcrRcyR+jSOEkk5OSi02YuUutwRhSjXShWM4VMznVQsPfb4UKkURFazA5w52wO3PRUky2MzVUWeIEjKcrYO@lists.infradead.org
X-Gm-Message-State: AOJu0YyF3y5nhQU1H2sW3cA7KCdTVO3kaIsJCsdnvY00eIPmEaRZqUF/
	z9ht3YtoKKY/enOaQx20deJLFmb6a0O/O01zfmYwwxWm2RVcKO5rL474lI68s3pQsa0=
X-Gm-Gg: ASbGncs3JEZCkDLi33TQFeOCwLTmcGuOhS44Mfou8cCaUkTyWRA5xXBBBMyNXhFkOgb
	RWqlSUvOTsMw7YBJ3V3H5cuFck4r/10QPXsa9dPcTqEsLKzV2dxnNh/1J686YjgxCSZH3tbeYbo
	+pRfymY8KW0mzU2xZlwJOjWR19oCdZEG/cXhX9nwsoHMB84hbYrQM6cn8eOLADYfO9HVrtf0AV3
	GIk+LgbAx8iYc89I+ozqraJYtPwjejcpmcWb+L1IeX1dfixglXPo1dTSNaSRZFXkYjYvSL13W68
	eZKZPM7elc/Ec6tqegksJyfyqkVOMRivAmtzt8zyAGO9iAwFPerfGHCez4BqJ/a5NHIRDwdo6Q=
	=
X-Google-Smtp-Source: AGHT+IHzVdYixqyHR8b6G5EFMSrmZhJVZpp2peDtXSyWByTozchYUrxZPpYV9SLXnX3gjdalIl1zLA==
X-Received: by 2002:a05:6e02:4414:10b0:3de:119f:5261 with SMTP id e9e14a558f8ab-3de119f54demr131814575ab.3.1750282567942;
        Wed, 18 Jun 2025 14:36:07 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019d1ba0sm32296805ab.31.2025.06.18.14.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 14:36:07 -0700 (PDT)
Message-ID: <ee095fdd-b3c1-4c41-9b06-a8e3695c1863@linuxfoundation.org>
Date: Wed, 18 Jun 2025 15:36:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] selftests/pidfd: align stack to fix SP alignment
 exception
To: Shuai Xue <xueshuai@linux.alibaba.com>, brauner@kernel.org,
 shuah@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: baolin.wang@linux.alibaba.com, tianruidong@linux.alibaba.com,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_143608_907670_BF0DDD33 
X-CRM114-Status: GOOD (  13.14  )
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

On 6/15/25 23:06, Shuai Xue wrote:
> The pidfd_test fails on the ARM64 platform with the following error:
> 
>      Bail out! pidfd_poll check for premature notification on child thread exec test: Failed
> 
> When exception-trace is enabled, the kernel logs the details:
> 
>      #echo 1 > /proc/sys/debug/exception-trace
>      #dmesg | tail -n 20
>      [48628.713023] pidfd_test[1082142]: unhandled exception: SP Alignment, ESR 0x000000009a000000, SP/PC alignment exception in pidfd_test[400000+4000]
>      [48628.713049] CPU: 21 PID: 1082142 Comm: pidfd_test Kdump: loaded Tainted: G        W   E      6.6.71-3_rc1.al8.aarch64 #1
>      [48628.713051] Hardware name: AlibabaCloud AliServer-Xuanwu2.0AM-1UC1P-5B/AS1111MG1, BIOS 1.2.M1.AL.P.157.00 07/29/2023
>      [48628.713053] pstate: 60001800 (nZCv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=-c)
>      [48628.713055] pc : 0000000000402100
>      [48628.713056] lr : 0000ffff98288f9c
>      [48628.713056] sp : 0000ffffde49daa8
>      [48628.713057] x29: 0000000000000000 x28: 0000000000000000 x27: 0000000000000000
>      [48628.713060] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>      [48628.713062] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000400e80
>      [48628.713065] x20: 0000000000000000 x19: 0000000000402650 x18: 0000000000000000
>      [48628.713067] x17: 00000000004200d8 x16: 0000ffff98288f40 x15: 0000ffffde49b92c
>      [48628.713070] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>      [48628.713072] x11: 0000000000001011 x10: 0000000000402100 x9 : 0000000000000010
>      [48628.713074] x8 : 00000000000000dc x7 : 3861616239346564 x6 : 000000000000000a
>      [48628.713077] x5 : 0000ffffde49daa8 x4 : 000000000000000a x3 : 0000ffffde49daa8
>      [48628.713079] x2 : 0000ffffde49dadc x1 : 0000ffffde49daa8 x0 : 0000000000000000
> 
> According to ARM ARM D1.3.10.2 SP alignment checking:
> 
>> When the SP is used as the base address of a calculation, regardless of
>> any offset applied by the instruction, if bits [3:0] of the SP are not
>> 0b0000, there is a misaligned SP.
> 
> To fix it, align the stack with 16 bytes.
> 
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

Assuming this is going through Christian's tree.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Let me know if you would like me to pick it up.

thanks,
-- Shuah

