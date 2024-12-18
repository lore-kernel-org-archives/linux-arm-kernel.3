Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B911FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifEMhcU1n3ISsit8wDhT+/ZW4vWfULUicoIZW1rhC2g=; b=xYCFhNk7aoSIro+jbYNghHeyfO
	osnaxadOcTJy+KRw5P2voEQmCk537QfEwEVhRY0RD98gn031clHvmPer+rOTam0QytpyfxoE4YJ6O
	q40Azw3sbxjQRarov+LgbPndCJhOx+J2+3ir0i7jw68CI9tQeyNFiV9f8QSDC6yGinAVwHYXG2N6b
	4lBl9EOffbGNfbZ25ETij4PdVQIlDiUXonC2zsSZrMdkRPdcyHCuq5ZuUX7vpFh0a9M1rRtoigF1v
	3VOol4RPAanRmsIBpQCV1WxJvni3DY2yjx320Ka66aKeuX3sEGGNUDWT5Omw7gHO53XP0ydIwwtE/
	uQT0e8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwCe-0000000H3uN-2qAn;
	Wed, 18 Dec 2024 15:43:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw3v-0000000H27Q-01ZV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734536050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifEMhcU1n3ISsit8wDhT+/ZW4vWfULUicoIZW1rhC2g=;
	b=K1TcSFYTlhQx4hkWuaznHCR7SyzMzZqq0gRT87bu5DYHsJb+CB9B6IdzNPWKsv4qzEDJt8
	V2e+bHbjHayek134N/uFqwrfQuXJF2ARGp91Z2G4FPFsUepTEJ2UQkNZyvCe9qZDuTSRV0
	AafhmQ1d7Dc4WQu/QhveMx/CyTzaZyE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-BbldxnnBNNulT2AEBIAj1Q-1; Wed, 18 Dec 2024 10:34:06 -0500
X-MC-Unique: BbldxnnBNNulT2AEBIAj1Q-1
X-Mimecast-MFC-AGG-ID: BbldxnnBNNulT2AEBIAj1Q
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385dcae001fso2967361f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734536045; x=1735140845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifEMhcU1n3ISsit8wDhT+/ZW4vWfULUicoIZW1rhC2g=;
        b=lWxfKwN/TJiZ00K69e1iUbLBnQ7SlcdO699FizpuK2VthhB1MRKhJgd/P4RgYElae/
         2di957rYc+A1RAWbP5x4spcJqX42T285dsKm2oRhyKtOc8OVxtYpo5T0HGIPdBT7OmRB
         L7e1i0VcJLdQmrW8nHKx19AcJgvLPA6pVG6VFX2g8dtrN9aJxDD1YP71hQP3BhjclEFf
         PDTKE/hbMiTtJY6S20nKd5sB2pPYZOe4DzVNO12XVv+7RpjNHGhMuIrgnG6KiAOztf98
         MailMlnwib0xlWn8WVVE8susvwiTz9YvtgrzoEF3NxHK+s9Tryx4Ugf7RvIYibIMtHOu
         PpKA==
X-Forwarded-Encrypted: i=1; AJvYcCXt4EA9PKKje+yAUkJYrR4ZPdhnUyI36MDoo20xOK3tsz9R6fsTJoUa4Y+P4BcWxpBY8q33LCtslmTnCUIlO7Rl@lists.infradead.org
X-Gm-Message-State: AOJu0YwQmiHWNK7jree9IvBIhbPgz7ThbOVwFUCKhp4bMAvuOCYwweX6
	cxPNYSaIDo6ZgbkEKPXumuv/fczqUIpKJuLCfrFS0C5KFtu+Ix0OUk1MzPvEFIITzhFuVsxY8g3
	MF2ariiJdeJuv7JYQ9raMhrtOJ07g/dktqK9Fq/kRYmqIvCFkxKask4QIWF+4l53RTzd2cypE
X-Gm-Gg: ASbGncviutu79fz/KAy2bhddITH6LCYB2iny88JUCN205duNgI9NoekyKbOy1iW+yNH
	6kE+lOUiTZxkW4sI79BHoSCNvmFzUJHawfBTYLvPyAPCFkBcK8bYXsukfToV8+O6JS9ocnkdoO3
	1ZqB5A3xwMF9jkoVnY8iBhCHTuPE7hriaqUjnR/I6IJ8MloyBkymPYfA/Av3PEtHLZ6d7oEjTnh
	bV3YVgmqVth3vfoOK6D5OcNctrYSxFxsuKBJ3zlbqauFaL4m4Am+tTbe6ytHflsxiq4CVd+GV54
	oqdwcxNjYox/wJgDkOP3vMs=
X-Received: by 2002:a5d:584b:0:b0:386:41bd:53b4 with SMTP id ffacd0b85a97d-388e4d5d2acmr3052374f8f.34.1734536045517;
        Wed, 18 Dec 2024 07:34:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt71tuGORM7SCqa7JhgofooWAxdG1yrRL2hLTblveyS51eHb2FdxJIqS5eQRiGmCePdssbNg==
X-Received: by 2002:a5d:584b:0:b0:386:41bd:53b4 with SMTP id ffacd0b85a97d-388e4d5d2acmr3052345f8f.34.1734536045192;
        Wed, 18 Dec 2024 07:34:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1a195sm23441825e9.36.2024.12.18.07.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:34:04 -0800 (PST)
Message-ID: <345a1627-edf7-40d4-a4a4-a7c00b994859@redhat.com>
Date: Wed, 18 Dec 2024 16:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 13/46] arm64/sysreg: Add register fields for
 PMSDSFR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-14-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-14-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: epaGdirheOWwjxaeymerfPIk1R5sYkvVD7pmxiV7X7o_1734536045
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_073411_116639_C1CA27F4 
X-CRM114-Status: GOOD (  11.78  )
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
> This adds register fields for PMSDSFR_EL1 as per the definitions based
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
>  arch/arm64/tools/sysreg | 67 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 78564b24b187..fcb4ecd85d35 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2245,6 +2245,73 @@ Field	16	COLL
>  Field	15:0	MSS
>  EndSysreg
>  
> +Sysreg	PMSDSFR_EL1	3	0	9	10	4
> +Field	63	S63
> +Field	62	S62
> +Field	61	S61
> +Field	60	S60
> +Field	59	S59
> +Field	58	S58
> +Field	57	S57
> +Field	56	S56
> +Field	55	S55
> +Field	54	S54
> +Field	53	S53
> +Field	52	S52
> +Field	51	S51
> +Field	50	S50
> +Field	49	S49
> +Field	48	S48
> +Field	47	S47
> +Field	46	S46
> +Field	45	S45
> +Field	44	S44
> +Field	43	S43
> +Field	42	S42
> +Field	41	S41
> +Field	40	S40
> +Field	39	S39
> +Field	38	S38
> +Field	37	S37
> +Field	36	S36
> +Field	35	S35
> +Field	34	S34
> +Field	33	S33
> +Field	32	S32
> +Field	31	S31
> +Field	30	S30
> +Field	29	S29
> +Field	28	S28
> +Field	27	S27
> +Field	26	S26
> +Field	25	S25
> +Field	24	S24
> +Field	23	S23
> +Field	22	S22
> +Field	21	S21
> +Field	20	S20
> +Field	19	S19
> +Field	18	S18
> +Field	17	S17
> +Field	16	S16
> +Field	15	S15
> +Field	14	S14
> +Field	13	S13
> +Field	12	S12
> +Field	11	S11
> +Field	10	S10
> +Field	9	S9
> +Field	8	S8
> +Field	7	S7
> +Field	6	S6
> +Field	5	S5
> +Field	4	S4
> +Field	3	S3
> +Field	2	S2
> +Field	1	S1
> +Field	0	S0
> +EndSysreg
> +
>  Sysreg	PMBIDR_EL1	3	0	9	10	7
>  Res0	63:12
>  Enum	11:8	EA


