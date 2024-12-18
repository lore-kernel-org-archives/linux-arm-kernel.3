Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10151E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb8SbH0SWAjKb1gb/9FXdc53gmPrM5vUCMKfctQg3cA=; b=0KvnjOyWFny2tYF0Dh4h4gujfm
	p00YU9aWp9rLsCa4xgHsYHqKEAFoV2fp5lrbReCegJxt8gVkPzPjvo38hpPBVjdI5Y9Rh1noxYtt+
	OrAJ6ycfxDcoLYgc6wKlc+TBMxukXMh5+q7EEb1whQOnPjuZccdoqPtDuKdoY+mhwQYrNDv7zt3Kv
	CUDyOaLi5dZbEe3dgXyS6PAW0EokraMN4vPLFSsfty0UQiBrZ4n+DglRQrEl53yXL/iLFaOIbOH6c
	UXZFvuZpYS4Yns8N6mAooUyLMno93/9WO6QSZlFTYbEIYsqdjEkjGGM4CcyyDZ4MAUS7AvdOlFUe2
	DeZ/lgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvwU-0000000H0yV-1BIh;
	Wed, 18 Dec 2024 15:26:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvvM-0000000H0l1-44ti
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734535520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bb8SbH0SWAjKb1gb/9FXdc53gmPrM5vUCMKfctQg3cA=;
	b=Aji/AKoW/5hQLWoiybYWLc2QCAFzrfLUhjgFJG7g302oPGBC0/a4+ura1KYd+k2SIBHZwe
	dQsvaFEaSQdr2FgT2GhDtOL+QqKTUoUGg5zBIw4liK1JVDNSb3XDtfugXLNuK1KhhH3yAi
	brBcVTA/G857HERzgRIHZ1XIgUBpUf0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-exWDLATuP7CzaWlWvZZh3Q-1; Wed, 18 Dec 2024 10:25:18 -0500
X-MC-Unique: exWDLATuP7CzaWlWvZZh3Q-1
X-Mimecast-MFC-AGG-ID: exWDLATuP7CzaWlWvZZh3Q
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467b645935fso86077111cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535518; x=1735140318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb8SbH0SWAjKb1gb/9FXdc53gmPrM5vUCMKfctQg3cA=;
        b=Ujr6eoHsoUgunC7+ZNUMHtFFQzhPLZfxOaNZKIdgP4vnFl/YZIesKWaYy+9h5q/1yi
         UGSFfHu4nut7T9atVqfpP2pr3GwWvpIUf9xb6SJL/5wJZtO4iLIcedpktXDSomQ67ay0
         jbQQn051v4mUiuIT0zxLSHcbFYz1fGxThYpMP5qa1uzHqviRCOZY1ucoae0GN7v9jdwZ
         hfhkPf7CoVVxgSYyIFTEQ1xPYgeffWACdo9XOUWDpABgNqgAbbbr7uiSEH/o/QP6+vrQ
         YIc4yF4utHWOZ6+T7ubfvozhr0UK/YVhz5GUE4QTgNYEUTcmx4KaIG8irRgDz4c7kh4I
         YUyg==
X-Forwarded-Encrypted: i=1; AJvYcCXdBtmngfsxT1tz+kQRcDVnPNNprmj8zaNc4y0OOYqCk7dZdkpsMjP23DjxTQIep00mgSGpdEiQ2dRLUGfEqvzt@lists.infradead.org
X-Gm-Message-State: AOJu0YwQSZXUMNHxzhBA+9Z60C1kRkBJJIjYF1d2uLEPmNUhyJb5b4Rl
	hUKyROdfgKEp/FvUWpwTFEoz1Ur8S5+WjTQvww3mtSGO7U3Rhu0rmhiNJrTICdkFx8zF4WSK7Kb
	brCEH5AtzXzsaVLnlrK5WSWfYpoIbdjSuwMR4LF3ZEu2IY6YRCsJ/ZTEEajE8+N1W1DECQ1Li
X-Gm-Gg: ASbGnctiLYw+LPY6O2LHNOnLhC6vYnxaNvVsXVe6meTZX8OtlpxEmB3z5j6Gq3BT5HU
	VyBp/nT8vW1FqLR6PiJ98uEvYe6S22iC7kKuVcgDZ7eV2MAw0s59/0LztoNLtUgXY+heSO8gN4N
	Kb7K3T/VJ5JYkpheXQY4Q1Kme60RbwBiZo+6dhsnQSJ2/OLrA99td51nEf3NMsQPrQr/hgC1+gt
	kMYS4kJ5fHjxzdH4ZfGEaQGVKgp/7SxlMnWG6ALSP1Yv9/X6gexrzz67MFisgn3BKX2oeItLvR1
	HkkiT6yXzj+fRic1p+Kying=
X-Received: by 2002:ac8:580d:0:b0:467:770f:70a0 with SMTP id d75a77b69052e-46908db0cefmr57709831cf.10.1734535518303;
        Wed, 18 Dec 2024 07:25:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGboScQSGm0961Iu1cY4M+nB+Aon69Uxo4T6WWww0R+Ugx69ka2j99u17brjAoLU0VR+pwF4w==
X-Received: by 2002:ac8:580d:0:b0:467:770f:70a0 with SMTP id d75a77b69052e-46908db0cefmr57709351cf.10.1734535517981;
        Wed, 18 Dec 2024 07:25:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2ca0a76sm51869261cf.25.2024.12.18.07.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:25:17 -0800 (PST)
Message-ID: <b92db5c5-199f-406f-83d4-9d694701359f@redhat.com>
Date: Wed, 18 Dec 2024 16:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 10/46] arm64/sysreg: Add register fields for MDSELR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-11-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-11-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oDdOnWAecrvSw1qgXIZ1KOX6g47N50x0Du4pV34acUU_1734535518
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_072521_094300_34563FB1 
X-CRM114-Status: GOOD (  12.15  )
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
> This adds register fields for MDSELR_EL1 as per the definitions based
> on DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  arch/arm64/tools/sysreg | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 30a0d3ee71a7..be0091060350 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -93,6 +93,17 @@ Res0	63:32
>  Field	31:0	DTRTX
>  EndSysreg
>  
> +Sysreg	MDSELR_EL1	2	0	0	4	2
> +Res0	63:6
> +Enum	5:4	BANK
> +	0b00	BANK_0
> +	0b01	BANK_1
> +	0b10	BANK_2
> +	0b11	BANK_3
> +EndEnum
> +Res0	3:0
> +EndSysreg
> +
>  Sysreg	OSECCR_EL1	2	0	0	6	2
>  Res0	63:32
>  Field	31:0	EDECCR


