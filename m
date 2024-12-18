Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96865E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mxwx7T8xQX7F7d9YmlWUpy9SyCJUmBxMFMKphhhpq4Q=; b=ON9FGPbxP1gikLvtyynlnScN8Z
	uSlxMhoQoN25z/0cfb/UA8EwSGg5cdlr6Rb/YoKiNkGrw99/Cf5CBRb0ljJznoMS3/nCiAblxrLdd
	aO+DtZfo3oHm8XKDdekPQUQVw9xdFiuZIbcH1qX7QomEwqqhipNnsBCd0YbD3/7/HPVJvT4Id34pr
	SJ7i86QL+KFbcU6vVjecgUfpAkR+XWv4pNBKgYMh4BdbqpuLFrosk0uRHQ+3KygiQ2s7kIdvXHWCe
	tPtW2frKQhgvi/JpHAolfZbuFVpTkpPlawObBrQQtndfX1NYYWVd6Uf+klbnpLWQyii9qxK4DJM/R
	55pR71qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvu2-0000000H0Ts-406m;
	Wed, 18 Dec 2024 15:23:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvsx-0000000H0K6-1QQk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734535370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxwx7T8xQX7F7d9YmlWUpy9SyCJUmBxMFMKphhhpq4Q=;
	b=J+oTnCEG0IxQhHkhzVCWSTR6DSN3JKvDS0pnpqbZkzg3AfYpatHkillN882FNSaE/zMWBs
	gfdvEUBKMm0b6F/haUjRKHmzAwZZC3MqWBqW9vO5Yo2ZTXKZN0GoTYSPQHP66Ws68Lb0OO
	P5BsVE9BNiDLceWC/bJiOlIu8BOB8n4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-tyEz3dXyOUeWEw0dQuDfNg-1; Wed, 18 Dec 2024 10:22:49 -0500
X-MC-Unique: tyEz3dXyOUeWEw0dQuDfNg-1
X-Mimecast-MFC-AGG-ID: tyEz3dXyOUeWEw0dQuDfNg
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6f482362aso395049185a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535368; x=1735140168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mxwx7T8xQX7F7d9YmlWUpy9SyCJUmBxMFMKphhhpq4Q=;
        b=BsrLyB9ZLZytxQ541XABOdkvgMnNzukEKsXyeTUjz0HGmNX4cxD/qOg2zCRId0IumJ
         J3C58aSNYptPc83hRHkauBTgMmHAyeMQ60+OvuM8MbzSHQeT48tCZVY3Us6AK+dIiSSH
         3fqFB7M0GDwPXF7UtEDzMeIWJlUEhj2Rb/6FMjnT9cZ9OzG6l0EkUOEnPWaECp08EjLK
         Uyq6x3KjN5MA+4GPqR56b2jLNCE9sig5ASyctxt5jqRLBfiq6d8pCaAejVM4bLA9jxAU
         fJpCXUEW+M+eIoqparTpi3xp1TvZBey9BCORtjz2KSiAYvIyEohtgdzd4n+6DNkAEXXj
         tNzw==
X-Forwarded-Encrypted: i=1; AJvYcCXPNw5at63jymM//BgVixHscEGzUnd+Qh6BHxrzysNskJAMH2rxgw9buYIC9SKC7buYbWf5bKA1jPhxbu6u8Q2T@lists.infradead.org
X-Gm-Message-State: AOJu0YzdnZAnElcpo7j2Svp8321MCaOlpxX4a389VUZ5bwBQd/YEM/22
	ZLMzYl13blcaVWdxD5Nh4nvZLPIiJFpHdnndZMpsZ8XUj3ar5m5jZ2J5M0wlliMhgmJ7xsrsNAq
	ko5ZPphyMs6HiAqJTG/38lvGYa1BcM7s9ao7hxW5MacBhfzea4gRjoMnZaSo8swXwEzEsdZbMwU
	1qYdxM
X-Gm-Gg: ASbGncv4R1fK/12gieLsHYvikfJ8ec4LisElfpif/Hm9IEMYBVdZF/sGQ7leSfpeMYb
	TKbO5rWuMIEf2rVsn91JqbwHSqtODNw+fSHuV9E3oo7B3I6JjgROrpa1bmgU4yI+M/NHAWdTQeh
	YduyL4My4juboOJSXNXvU0Ej2QYH8RgjglRdIX5YlNGMyvsqiL4TUGGrB0JsJ6rnpKOaZajVeZq
	l7NtesfwDV2chHpp/StRad0FiCzIXoG7WlW4p9zNmsLYoYJCoq+mq10rI8khvpZHa4l/0U83NHm
	cwNIPzoH67lF/MjivImS8N8=
X-Received: by 2002:a05:622a:345:b0:466:8a95:d1cc with SMTP id d75a77b69052e-46908eccbbfmr50231381cf.47.1734535367913;
        Wed, 18 Dec 2024 07:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDphvG9D+OqeokedTCW6poW/8dGPSq+hi4s2HJPD6c7Y6vBGeH4Zz/CqDbOTkejk9pqrPBCA==
X-Received: by 2002:a05:622a:345:b0:466:8a95:d1cc with SMTP id d75a77b69052e-46908eccbbfmr50230991cf.47.1734535367576;
        Wed, 18 Dec 2024 07:22:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c69b10sm51678321cf.18.2024.12.18.07.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:22:47 -0800 (PST)
Message-ID: <b77f9c33-0161-4891-b3cc-a629c6380e63@redhat.com>
Date: Wed, 18 Dec 2024 16:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 09/46] arm64/sysreg: Add register fields for
 HFGWTR2_EL2
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-10-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-10-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YBM1Rg6Hmlz_Q3udueNcgxudPjxhg0fWT-rlmj5U65Y_1734535369
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_072251_457173_C04D45BC 
X-CRM114-Status: GOOD (  11.65  )
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
> This adds register fields for HFGWTR2_EL2 as per the definitions based
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
>  arch/arm64/tools/sysreg | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 9513ae05dc93..30a0d3ee71a7 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2638,6 +2638,25 @@ Field	1	nERXGSR_EL1
>  Field	0	nPFAR_EL1
>  EndSysreg
>  
> +Sysreg	HFGWTR2_EL2	3	4	3	1	3
> +Res0	63:15
> +Field	14	nACTLRALIAS_EL1
> +Field	13	nACTLRMASK_EL1
> +Field	12	nTCR2ALIAS_EL1
> +Field	11	nTCRALIAS_EL1
> +Field	10	nSCTLRALIAS2_EL1
> +Field	9	nSCTLRALIAS_EL1
> +Field	8	nCPACRALIAS_EL1
> +Field	7	nTCR2MASK_EL1
> +Field	6	nTCRMASK_EL1
> +Field	5	nSCTLR2MASK_EL1
> +Field	4	nSCTLRMASK_EL1
> +Field	3	nCPACRMASK_EL1
> +Field	2	nRCWSMASK_EL1
> +Res0	1
> +Field	0	nPFAR_EL1
> +EndSysreg
> +
>  Sysreg HDFGRTR_EL2	3	4	3	1	4
>  Field	63	PMBIDR_EL1
>  Field	62	nPMSNEVFR_EL1


