Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6636AE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJSP7v7O+oDOfPrBvlBn9hMnhyj2hpIG70qFLCRuzJA=; b=3+IgPhFZd644PoXNHMxzI7srog
	6bkxlY/sQ9YkCpdP/q9J1wNIe4siESUUh6a3mEvjhp+VmYSDyaYSrSbriz+St8+99Hi7vwG4149wL
	gIq26SC/ToKjq7tpppDm2X9tLVyhRKOoz+TY1DSq9yQEbS+k+Dnc+c7dsw0uNH1Z8v81W1d2aHzFF
	LuXjaYBby6PV+/Z3TT9VPDTHVpzcnVCArhcoxPiufM/0n5hDENwZEyfT7n6o64gga+atv/tjNKqxf
	8gq+4vmOxnonIXu1QpJOP9/PmZJ04ANXzFc/xpD4WJk8dd8TDyPF1PIjVYOK/6sD8/GKQ/rIKUTHR
	BD8tgWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvs9-0000000H0Bv-40dP;
	Wed, 18 Dec 2024 15:22:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvpk-0000000GzmZ-3y0h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734535172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJSP7v7O+oDOfPrBvlBn9hMnhyj2hpIG70qFLCRuzJA=;
	b=Z2vanNG8DMj4ADtPsqhRCylZaC+aLsQ/2ZWEGaKzI20xdqQQ+vJZpRNvti69mD0oOkUC2C
	SW1vLEJvYrAWIs5htdW8t7mOz5FeyC9WPh5fZIPqHfDJPEkBAjAkVWjOT5rxfGIghVpAbP
	dQPgB1nTg6WyMrCbi1piIbSXjLQsALc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-8sRyN7jPOu61ZqjNxTbGvw-1; Wed, 18 Dec 2024 10:19:31 -0500
X-MC-Unique: 8sRyN7jPOu61ZqjNxTbGvw-1
X-Mimecast-MFC-AGG-ID: 8sRyN7jPOu61ZqjNxTbGvw
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d889fd0fd6so16222066d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535170; x=1735139970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJSP7v7O+oDOfPrBvlBn9hMnhyj2hpIG70qFLCRuzJA=;
        b=LgMFS22FTihKpxc/yvwlvjcXdScr3ZTxgwWts9X15kp89Itf4kvwJXrEaiQrPpRunU
         +pJPfOvLjtExRAeOU1/ZbXifhdRGvzpTBSWQhlGCMOl9pM3Jtl6590CwnrijhYWBiNev
         L7LwNBFb2YNPOKsfpvK7lIBKhNVJa57vx4whlKyZXizH4YwgLaohcRjopxHlF2mjRCa1
         NcEwNRGSmB6VO2/Kl8RhqwgnaaC4i2XmGJm9WkGxOqSlpaLp1katpTJHL2FB3HIRTyd7
         lm8dYslkgOZUmwJj2QFj1cYjt7eyrbu0CBWJLyfBHtFx9E2Bwd2eOtmV7ZfDNqf1oemL
         bDpg==
X-Forwarded-Encrypted: i=1; AJvYcCV+aDLf5kCDmoN6rKgRqN7FN0RgkUkSxqc2b75g1suY2ljRCkJvpzkzqR/IS4NLnNsuqq9jvs6R4lruq9QHCmGR@lists.infradead.org
X-Gm-Message-State: AOJu0YwIGIrBDIsSN3rOsi0o17K9ikC+GE4zWPCP0PCcSNa/GKZCMxex
	zoJXVmFD2S1S2Z/Zyt/kA1gSQlmCKJDUh4KwMXQByLPXEEdcGU/G7ctHbhTj2cIycDNzWqthMcq
	28w6GTTuNnw0D/EnoX1XW+Bik2Mz9nptucXX7gP7sVwwLywqUXZq6VJZILI2hOpw1AiBEN9AXyr
	Ddi2+A
X-Gm-Gg: ASbGncu5MwJ17lrDPhG3eeHrhH9qfKGq/fsLrtnVWOx4q7ugNfNSq6vwL4yHNDXTpno
	CqkrgdomHdmq6qkLxrR+JED3ysuK32GTs2/ua5cRBMFfQV89J2d4HM7nuW9i51oF28C9M+LF5wV
	qO/uXtj99pC5e8c2mC4UBjnfS7K/SYJ/dvxiDtA34dL7KAGfmwg1dPSwE5OZ9A7ENmv94nQDVgK
	n/7WY9T251FucIGpe+TY2pumSDlJjYhWatrZ7proPm58NyqsG/FbyOUQMDDdx6dusrEjzXmlRcO
	t8IyCu5mnrPaz63fmSEaUxo=
X-Received: by 2002:a05:6214:2487:b0:6d8:a9a6:83ef with SMTP id 6a1803df08f44-6dd09aae408mr56951426d6.20.1734535170208;
        Wed, 18 Dec 2024 07:19:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmeRQfKzOtSLywUp/ORft5eZda7HUnNeyjbDa8MumUrqjCzsC9niZRmKtWoztYMdJy7SLsAA==
X-Received: by 2002:a05:6214:2487:b0:6d8:a9a6:83ef with SMTP id 6a1803df08f44-6dd09aae408mr56950996d6.20.1734535169928;
        Wed, 18 Dec 2024 07:19:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd367f7csm50865876d6.94.2024.12.18.07.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:19:29 -0800 (PST)
Message-ID: <287abeb0-8660-49b0-bf69-97eaa5bbe6a2@redhat.com>
Date: Wed, 18 Dec 2024 16:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 08/46] arm64/sysreg: Add register fields for
 HFGRTR2_EL2
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-9-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-9-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3GMAkDnVD4Jg_xLaVdaT2DFiHY5Vu69eDia6TxOxKkM_1734535170
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071933_056860_00468A11 
X-CRM114-Status: GOOD (  11.75  )
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
> This adds register fields for HFGRTR2_EL2 as per the definitions based
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
> index 9d339f735648..9513ae05dc93 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2619,6 +2619,25 @@ Field	1	nPMIAR_EL1
>  Field	0	nPMECR_EL1
>  EndSysreg
>  
> +Sysreg	HFGRTR2_EL2	3	4	3	1	2
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
> +Field	1	nERXGSR_EL1
> +Field	0	nPFAR_EL1
> +EndSysreg
> +
>  Sysreg HDFGRTR_EL2	3	4	3	1	4
>  Field	63	PMBIDR_EL1
>  Field	62	nPMSNEVFR_EL1


