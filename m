Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB26E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kbK60y/pUMEt0V0kvEsFvlsUJreh5s9ctQMUNyEJLM=; b=nN2HdaLV10Qy+rtPIHH0T+q5nx
	niieqUjX2bWt24oavPbysDW5NCCmyNls5zYXoAlaOxBU8SXJ2QiWn8fwmfuCArtDiw4h7JNvwjBwB
	pBoNHObCpzasp0LYu1aZMQYA5NfRtfGQh7EIAVEch3STUgGAgkw1hpo58pgpYJXLXpy5i5LCqaGS1
	JZgSwpAcMmoxRrI6yMS0mjU8kvr1T9ES4xhqFXkcSLVelxIqUSMP1/oLPnU6eP4501ouW3LyQ+p4I
	Ig0kRUPNjXcW631YuOGUJ+m9/4RlfXxExbwVvHcY3Jpy8hlZpYU2TARXS6OFZM8vHsxxqcC/4V+IG
	peWZ/KSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwFq-0000000H4Qn-3Wnq;
	Wed, 18 Dec 2024 15:46:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw7z-0000000H32K-1kL5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734536302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3kbK60y/pUMEt0V0kvEsFvlsUJreh5s9ctQMUNyEJLM=;
	b=B+lL2enkkxF+T6Xjqi1ALgg4P+9kf2NlUuqalAQ7gDuVCC4ugcw1d2fnxSsnwsJEpl1jOW
	Yt3kwgUFeHPmXLAOyozzKrXzE1T/ibHXGmsX40ImuxPT4PCzAwpB6MRc3sp7N6hbrkvYhx
	I3iwI+qQGz+Cip91/YD3heG5hcDHstY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-kmIoAaNAMZ2-OQtanKHq3A-1; Wed, 18 Dec 2024 10:38:21 -0500
X-MC-Unique: kmIoAaNAMZ2-OQtanKHq3A-1
X-Mimecast-MFC-AGG-ID: kmIoAaNAMZ2-OQtanKHq3A
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3862c67763dso2800089f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734536300; x=1735141100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kbK60y/pUMEt0V0kvEsFvlsUJreh5s9ctQMUNyEJLM=;
        b=dTBlWvOvIBV1acF11fX4Tr2ByVgNOfg2IfyVJ9BHI3hpEf0emD5ZIUAy1DR57OaRrz
         bYUzzVzQ22C6cFYiM32SfqnLsuyd1FosLx9oMpfH4+JUpCmNO7ejkXOaMvR/cVWqlY2I
         JbsR1w/azFrHjUNYqasPNlf4zuyGpY5ZPFAoG1KlsxFL5MsSWU15MlwdxgL1Z2hcAWo4
         oawVYSunkVWps1dJew97DRTG532G3YJ04BgT3H48vt7rw5L9epkWdb3cwC3E6iS2KqjJ
         eenRfkklLbg4LhBGfJPPsXhIiV+HfPpOXhdljLrtoUDj+0nMxVSio0zSCXIqjHDTi/Vv
         ZNOw==
X-Forwarded-Encrypted: i=1; AJvYcCUCvwgGUJEHAkC1LBuKKB3LjExO2e/HL9EPtANveTP2uv3P+rFck7jq4o5Jg4pB0sklo4MkTVJltWa4DGqLD3mV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4bQCqtnHWrfME+MzFn62QHRR83K3ZaNu2vmUFNWD0KRgR83cm
	BY8cEXVr36Mtz/EhoQXhaZmD8wJwv/pTkPH4BOu8AA5vCHiDeDPgZvnXXffVAdZUra0PlZw4SgZ
	NzM9qmngFWLfYcaPgwBCIpKIhahGc1tOO3Y2Oua3jAsJj7XtqsO0g+zqM5q453HMIBcmMoQfX
X-Gm-Gg: ASbGncu9ZYuUb2F92cJfDkNimePTjNPM9YELD3DpNTCEE6U5eOvUgF/NKMwJ8LeRm/T
	VrsdUk1ffFYH6VfR1bfw9z0I0t2BTiY8NWkpi9sspc2Kbx2xebRZoTsdZbWFphbESdeujB+jJ9b
	HAXm8ti5F3TM4T52MdoX7JCFbiLmUZMASSBcSGexC9NAGWuCX7R3fNJYAaNO3XmY3UQYL8XTMtW
	xINZjUJk4rKiooOOXfw8Ud6eofWcvRWyFxcyT89G1L0lJ0PNxu/hdYGKzFBODkt5AyitvVdUoe6
	9rO4e7Qk5hBQ47BRfhC0ruQ=
X-Received: by 2002:a05:6000:1aca:b0:385:f4b0:596 with SMTP id ffacd0b85a97d-388e4d5e9a7mr3000684f8f.18.1734536300110;
        Wed, 18 Dec 2024 07:38:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaIBVGaClqVQCcf0GlKKl/+K/rYd0fvTMmkJPmKBwWs+HFfhrEAIJd6lLn5sqzfUQW1YJFug==
X-Received: by 2002:a05:6000:1aca:b0:385:f4b0:596 with SMTP id ffacd0b85a97d-388e4d5e9a7mr3000654f8f.18.1734536299751;
        Wed, 18 Dec 2024 07:38:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801643fsm14360353f8f.41.2024.12.18.07.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:38:19 -0800 (PST)
Message-ID: <4ecf7136-e9ff-4eb0-b464-47356ec1adab@redhat.com>
Date: Wed, 18 Dec 2024 16:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 14/46] arm64/sysreg: Add register fields for
 SPMDEVAFF_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-15-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-15-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EYFuELALB58qfqlY7GIlBcm_h-MsfQw-cT_yYipw0us_1734536300
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_073823_525467_DB612E9F 
X-CRM114-Status: GOOD (  11.82  )
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



On 12/10/24 06:52, Anshuman Khandual wrote:
> This adds register fields for SPMDEVAFF_EL1 as per the definitions based
> on DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  arch/arm64/tools/sysreg | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index fcb4ecd85d35..18b814ff2c41 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -114,6 +114,18 @@ Res0	63:1
>  Field	0	OSLK
>  EndSysreg
>  
> +Sysreg	SPMDEVAFF_EL1	2	0	9	13	6
> +Res0	63:40
> +Field	39:32	Aff3
> +Field	31	F0V
> +Field	30	U
> +Res0	29:25
> +Field	24	MT
> +Field	23:16	Aff2
> +Field	15:8	Aff1
> +Field	7:0	Aff0
> +EndSysreg
> +
>  Sysreg ID_PFR0_EL1	3	0	0	1	0
>  Res0	63:32
>  UnsignedEnum	31:28	RAS


