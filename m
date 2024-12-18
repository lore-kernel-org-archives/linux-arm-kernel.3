Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A247DE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3ifdfTGR5Rf0e/AlHAnHM95LFu2ogRCoh2wTPFdlPU=; b=k8K6knpXl/V77mW+ZCJrXBCvw4
	y6wajbUtar0/No5hMuDKdRIwK7DGbz2q0XfYHZVSmoqh6GovtnUOfCNaX2OX1LpuiimMWNwciS1BP
	3RQYld3dkF8SfIRlJ1dBEH3So9cYWWbhbi9GKhauVLzX5F3hxP0yJzh5mZo+Iw5SLhY7usALnCBQM
	P+3pzf0or+kQeLaxiNfP87gIfjpPB8aICis/vFwpCRrJ1J/MXI2cwRdrVNrSzVd5xY5YvLfB+4Yzm
	5NZpTwaeILVA7lfUD18pxnNHzwdI4epY8bMNpeID1UEoFUiYaoZ6EtnM2vk5ANFz7XbOMeUFexFax
	MFQ0+ZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwI0-0000000H4ss-32Ho;
	Wed, 18 Dec 2024 15:48:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwE5-0000000H49k-12qE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734536680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3ifdfTGR5Rf0e/AlHAnHM95LFu2ogRCoh2wTPFdlPU=;
	b=OgKSR5EYjdmQSaycL/nP2j53UYsFh4RsvlIU0lXXEt/WqfZX8yxleDzlC04ifob11dY8uQ
	yvSZ0UvNZTXZFJivaCvWuFa+xvr7xVcV4CF75/h/s9lQklmIrUtsjdPS1LWpeC53Gt6Jwh
	cqOJ8oQOU6p0wAljzqDPTg8lZgrlSKE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-t0Wziu6rOS2b3Gwy2HlZJw-1; Wed, 18 Dec 2024 10:44:39 -0500
X-MC-Unique: t0Wziu6rOS2b3Gwy2HlZJw-1
X-Mimecast-MFC-AGG-ID: t0Wziu6rOS2b3Gwy2HlZJw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385e9c698e7so541973f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734536677; x=1735141477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3ifdfTGR5Rf0e/AlHAnHM95LFu2ogRCoh2wTPFdlPU=;
        b=Eprr92uoDDzc5mO+R/NoEkb0y71urwQEGfaIMzmWwl1N03puvPZU4blDHhmDtHtlpP
         EI1+hrHmMUSItM7Lw5BEqi4Rc17+qLoWgwVB5z/C1AnpnXQai/vMqedmwI5iAq96NRjJ
         S09yso/TG0ZHjo6mHOotrlCi5ujxSFhZWh+lJQBILABlPcGahwHxWXohQ53dApd+xWOx
         USbFEG1UZtBKgnVw/e0RlUWqZLde+Ujg1DI0IKZqsrHyBGDazHfCBJEZ5z8/7s7qzSCR
         vYdyAgBX9Ls4HWIezGahyyV9J2DjqYQuehg4os1A1A1P5d7LHFz+55WxI8lRGhvaQrLQ
         oTjg==
X-Forwarded-Encrypted: i=1; AJvYcCV/RfdPTBuYEx7WTjf0MaPPVhqd23m7XgOPvLT27Lya5W0Alxsf0BmhxD5upTUm/vcVr4SC/wN5ule7G8QAehBR@lists.infradead.org
X-Gm-Message-State: AOJu0YyYaPfBzr9EM/ZzXRwGG210MGUxuM8kt0C8GO+7wKMlAKQhDubr
	EO38BpVbZaPvfkDUhB+a6odmYhuuMcTLjSK1xeqRe9SObYZ/PgCugtPzpoKm7nXPXkXILz+rHrv
	njMCXSHkYFir7WEEAPKIv0cYh9JaNJiH5HcMNuJwUiWJ9SYmApKnqrZDwKKkR430eLXu0gg9cWo
	UrEhu4
X-Gm-Gg: ASbGncub7O/VimtxgYZq9rz53kypZWgMEI8v5lYuQQC8GLq08EWb48ptSpqaS6c+OgE
	HV1PS66xZIJ6osrju83y77iRN8u5VjTENUGsWuMs18ZaclVvOJ20GtXwq6cEcfSooBFLWIhL+Xt
	cqpkYg+Yfe1M4uDaH1LkdZBJAOWohse31dzguaDryZ6iafoYYYYOkVZKW4cfv3fOe/qSr8qCDOw
	Ae1m15ycHdjQ8+lK69BmJKx+cKT52I3UshWm6HXF+M/ye3HIBR4ZAn3lQhjTig3JX9bdPRc51M3
	Hj9aS04sDIv8DTXqojCpAVM=
X-Received: by 2002:a5d:6d8b:0:b0:382:485b:f976 with SMTP id ffacd0b85a97d-388e4e3d357mr2818101f8f.15.1734536677324;
        Wed, 18 Dec 2024 07:44:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkzdf4fxP5M4SPQuoo1R6EBPnYIaLKjVKkyUcjnN78feNSRH+ROtspoppv94GCosu9QuzV+Q==
X-Received: by 2002:a5d:6d8b:0:b0:382:485b:f976 with SMTP id ffacd0b85a97d-388e4e3d357mr2818080f8f.15.1734536676943;
        Wed, 18 Dec 2024 07:44:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8047151sm14151675f8f.66.2024.12.18.07.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:44:36 -0800 (PST)
Message-ID: <196ef833-e3f6-4314-8448-7053850d3e49@redhat.com>
Date: Wed, 18 Dec 2024 16:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 16/46] arm64/sysreg: Add register fields for PMIAR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-17-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-17-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iHkWq_jdj_FwGvmBKRl-2glbQUjlGPj2cMHY3c2ioro_1734536678
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_074441_361115_8614BFCB 
X-CRM114-Status: GOOD (  11.74  )
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
> This adds register fields for PMIAR_EL1 as per the definitions based
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
>  arch/arm64/tools/sysreg | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index e33edb41721a..ff09da6c0b1e 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2349,6 +2349,10 @@ Res0	63:5
>  Field	4:0	SEL
>  EndSysreg
>  
> +Sysreg	PMIAR_EL1	3	0	9	14	7
> +Field	63:0 ADDRESS
> +EndSysreg
> +
>  SysregFields	CONTEXTIDR_ELx
>  Res0	63:32
>  Field	31:0	PROCID


