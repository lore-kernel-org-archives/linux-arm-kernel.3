Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B0ECCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DlOhhfNjZ+nPO/20Hbn4j7kk5m4g2legRGVqTDqEk0=; b=MzH3z979htXdCJm57WztouVfKw
	R4o8GC3/B2e9b8t9q1rrBcm+pohfJkoMAN/X3OSWAZadL3NGiNxvi0uCdPp1qr7yXGF0vsSjEhK60
	x8H6kWq7fGnJ19y1RXCkK4thqj95fUyPimDcwQyeL5GLAUmfRqPaCOTb+224EZ26C4043av1ruVn3
	nnYvQnfFun+py2Wc335+TX7HxrdtLiBm8JGDv9QIRbOnXHlyxzkhFJDpKVt9aPlHkayS9rY3I1E1g
	WwBrDT6RvQeRErvre0fILKn277kDrcF4H/4SbDQln/v+g7cFfFfgYHmCx/e7Ni/0NoXtUSnulPAn5
	L27StHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBu1B-00000006ANC-0jkI;
	Thu, 23 Oct 2025 12:02:09 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBu17-00000006ALw-4AjW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 12:02:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b5509894ee9so40914a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 05:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761220925; x=1761825725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DlOhhfNjZ+nPO/20Hbn4j7kk5m4g2legRGVqTDqEk0=;
        b=KCf7OzSQ9ZALJib3y+SF5Bid2cfOnF3w3QT+v9jyuJqZerHOjgmqDxMfodPx4qPAMj
         TVGdlbGEirBPLnGMM8YeUmXXF28W41o0sKtHtoNvXI3xMp/7Vww1WVbMdsgqx6kX9L2T
         NkJoJk8w5jj800RoIuImHSmGoHltGIZHur3HF2tiSJxbVcxff+ynlcxunozvZs3/P5yT
         JRtyu1gewXy6Jg4QSwwRCrmr6Ppmhg2nYOqlRoixmnxWhL1z8UjYJ7WortB7Ni211Noe
         58SROh0Zz97ICUXT4yZm/r3LKJDo8RDWzRmoL6AGvYEIuWCC7HhjLz9csSvBexkPGx1G
         mu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220925; x=1761825725;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3DlOhhfNjZ+nPO/20Hbn4j7kk5m4g2legRGVqTDqEk0=;
        b=PXE5wom2GZ/FL7qSgDrjMqAHFvofHgkvB+ZppJe7sjvZp81TuwAUifS+n9l+pfinl6
         9UsJtKZVJjeeSevWh7wXviWkvOsRtnCcGrZE+l9mhVloj6BP7440xtDhR+NVh6Et9PEX
         TKngW8jXJHODZQJdn+wVGbplf9rLW3ruzyThNFveWDbNQ/JWNtnHLiQwZZh+OBAlXeyT
         Mo9fbPW22dL57eDkmNYERB9wIgl0ImrBsrKZ8zWS6WQtY8vCN3RyCIc2ROn5vNBBAjZa
         X/d6/q1QHdYPxTV2y8zWKyOXxxqQFPxEP6kjtaSnSqHvvG1PmeKtbnbbbAlVB/ZDW6wF
         xjnA==
X-Forwarded-Encrypted: i=1; AJvYcCXd4Lhi1HBiSZVu9gAb1YTJwYvPt5LgugYra0/eMUIrEgES3ZMX5/5p1oIfBoNdVu75QlhSM4tG9dXz3BaPsSv3@lists.infradead.org
X-Gm-Message-State: AOJu0YwWiNgDjaI1W11CN7ADOEIXOAqqQvAn3jcBNfkrc6xrLKNNTwDC
	3qtwo54zw19TK3h5y+uLREMPAJuQcQe3FpUvkgZKYQSXsEaijLD+gMZx
X-Gm-Gg: ASbGncsx6l+/0cKGCUfwdgxMyf50SbabTiQW4CHLK9BIIRw3j3JOq7i6pRzeedPG8HD
	D1jPl26Qaev1l+/5W+tzKOJA7kZj86FXVHLmicAjkNcy3cZnAnu1GA1rrrzS9RUjxPDaQwzggmj
	Hi+drxEpIPLoDpBPw/qvrsvxmCeYmY+rdIpUxJr1H05JnVXfzYKR2XdyV6GyuNiCi1s0d8hTB8c
	tXnsxRMx/OUAWzVCWa5gtmEPf9/ebalDiroBeJTMDP12s8h/bCD7viKhTE9jP8ybqAwh+fjPwWx
	aZk3+3AxJKfAizX2gvgSM1XLCs1IGy1WKCu5Lnst5Pv6aiOL43tA06ataReBES7Xijj16MsSZbH
	HPo5DUR3SkJaT5MYtdpk103g17LQrX7o4I+068pachSNNg0sz5QSGjPp5xGbd9v5tFdG8vhm5Vd
	CUjJ7xi5l478AqHbGIV3QJZ8mzSgy/Tk9o
X-Google-Smtp-Source: AGHT+IHq6bd9gl/stamR7hfnmvxDsick6ogXHg2q2acLJHm09xdoPxZjtSABhl8QQBartTnrKfYtUg==
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id d9443c01a7336-292d3fd9a38mr80551165ad.10.1761220923090;
        Thu, 23 Oct 2025 05:02:03 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.181.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1224f7sm21332775ad.94.2025.10.23.05.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 05:02:02 -0700 (PDT)
Message-ID: <632d6afe-40d3-4632-99c7-b098967bd649@gmail.com>
Date: Thu, 23 Oct 2025 20:01:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Marc Zyngier <maz@kernel.org>, yangyccccc@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_050206_036473_7AEE774E 
X-CRM114-Status: GOOD (  19.32  )
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

On 2025/10/22 22:33, Marek Vasut wrote:
> On 10/22/25 4:20 PM, Marc Zyngier wrote:
>> On Wed, 22 Oct 2025 14:35:28 +0100,
>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>
>>> The AMU configuration register access may fault and prevent successful
>>> kernel boot. This can occur for example in case the firmware does not
>>> allow AMU counter access from EL1. Guard the AMU configuration register
>>> access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
>>> Kconfig option is explicitly disabled. Other interaction with the AMU is
>>> already guarded by similar ifdeffery.
>>>
>>> Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> ---
>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> ---
>>>   arch/arm64/mm/proc.S | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>>> index 86818511962b6..123538ffeda6b 100644
>>> --- a/arch/arm64/mm/proc.S
>>> +++ b/arch/arm64/mm/proc.S
>>> @@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
>>>       ubfx    x11, x11, #1, #1
>>>       msr    oslar_el1, x11
>>>       reset_pmuserenr_el0 x0            // Disable PMU access from EL0
>>> +alternative_if ARM64_HAS_AMU_EXTN
>>>       reset_amuserenr_el0 x0            // Disable AMU access from EL0
>>> +alternative_else_nop_endif
>>
>> Why?
>>
>> We ensure that the AMU is available in the macro itself by checking
>> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
>> the offending sysreg access. This is similar to what we do for the
>> PMU.
>>
>> Does your HW advertise an AMU, but doesn't actually have one?
> The hardware does have AMU, but it is currently blocked in old TFA version and access to this AMU register here causes a fault. That's why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and the AMU access is made available on this hardware. But even if I do disable ARM64_HAS_AMU_EXTN=n , I get a fault.
>
> This patch is mainly meant to prevent a surprise in case someone does set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register access.
>

then I think it's more proper to guard it with CONFIG_ARM64_AMU_EXTN (I think you mean this above?)
rathter than the cpu cap. then with the patch kernel won't touch the AMU registers here if the kconfig is
disabled on you AMU supported hardware and AMU unsupported firmware.

move the guard into reset_amuserenr_el0 macro will be neater here (personally I think).

thanks.


