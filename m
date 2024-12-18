Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF107E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1JS5UgW5KEKPW82arLRkpB87zDMMpNUIULtXsMrMZU=; b=CBA3Ps+Uvtzf0cElHYwLjKbS4K
	+1GxnaCErUOKDprxxwFjVXV2rMAgjaO4VzMJxUCfXY38M69Wq8rD8ltWUtoR+6CH1nsbvlJ/r7BgH
	zYYKgI5iEVwoyACtP7vhXCondRgQs5jFFvEO76uRLOTh7VPTv5p0KK2mbxmD/U0ZB8Ic2eYdSztU2
	Xir2jEDyhyUVit+7Jkt+xzJz7cCPSGzNWc+yJBiVlv/IH8b0V2NCmWDSj/upeva5PIUdTmNJmZKCd
	2BsMFcFcDLKU5NzfuLp1UuA1VImE3OskbLM6WOp9Mkf1OXdwr4rHBYJ6tqEsaZLOKE8gys1A55BA2
	k2J47KhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvEy-0000000GstD-3xLY;
	Wed, 18 Dec 2024 14:41:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvDr-0000000Gseq-2g6m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734532821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1JS5UgW5KEKPW82arLRkpB87zDMMpNUIULtXsMrMZU=;
	b=Rax5FfHsX4iMglvCwURW3YxspBTF/kRqty9feZmkStOIQxXWSClFgE6yz2KhC5rckG8qFV
	LCYfKjbIDPA421DCt3SKzm0yRhL3OB6Ep9OElzCOCPgcwQ9PA634gBVNWOh6WLrB627N9E
	tpcwlqwflvt1boCagB2jUJzs/QaML20=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-zVUfCI6ZMnaMdidBXsLt2g-1; Wed, 18 Dec 2024 09:40:20 -0500
X-MC-Unique: zVUfCI6ZMnaMdidBXsLt2g-1
X-Mimecast-MFC-AGG-ID: zVUfCI6ZMnaMdidBXsLt2g
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d89a389ee9so147904916d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532820; x=1735137620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1JS5UgW5KEKPW82arLRkpB87zDMMpNUIULtXsMrMZU=;
        b=I25XMAcpew6pRraUXuhWOIlY6xEaCQ4scJ00V6j5uyvMuR6XNfXyleHUMINjCpyfoj
         oYtiCN/d3kzvHzU6ZJghKPLAuThDPCDfkvflM8ISVFCfnlBpP60gHjOFfE/j7+8rmFt3
         O8zAaGT/uQw+tJB5yBgGpco6O5JKnilcEMTRMj0a1JxeGySyzkQFMv0oQUy1aMj6gfKq
         AfOPLV1nLCIUQTIKDrg3IxvIa8I2ghUAYmjgTIeZKn1oCwa086Ocn9P2q4F//8lYNpNF
         2YwvvaCKHc2NiDWM0z7BZG4q6MqQn4TuNMPrOWDPMB/s1kyf/+4MTr8EWgEgt35EBkMW
         e8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqu8Av4XlDYXFMFlkSIgC1r4NN4mSHv9Qpvv7vYkl/nC/DyhDbnWVEQv8ATUi8iXJ0EMUlzIAB/h6PdPkuSyqO@lists.infradead.org
X-Gm-Message-State: AOJu0YzAaz9WsOmNmjWUWBC9f8XDmKMQkYzUoo4cMG2/QDi55JtfOW1e
	Kv+Of3ekOe5+Yv/enm6p8rZ8VpmultZkUykxaVH5hRWz/OaayZz/Dpt+PVPilsqWPeXhDajTiIk
	WCetUbHPm3w55Y4vZoPoLqW8z0SDfRb3oO8SMQQ//MgKcQpkea1aAh/3LXwsuodTEujJUKHxL
X-Gm-Gg: ASbGncth9Kal7XhiBmtPaiYw5JSof44g+Dk/BCSBuB/AkXWIYEEnHoYlhwkqtn5yX9n
	ij9d1/qgwPl29tKz5CG7E4TWvIU/APGk+uAmZKcKCYsQljdp7LV2izxMsPIL+vdakoP7/7aApfy
	04W+1X6XDiAe2/ABHUKkHiCQRXolA6u6cBGyX6HtMZ5zsifgtEeTuguGxmH8DZv7+Ixkaoe6AWr
	aNtQY/amlzdFty81geQoFBdEV8gqMM2PAmKKpk/5Jq3ZiASn3pqheeY0Cd2J1H1C3bIY1A2URLn
	JnziLH9KOxbIpRTOsEbqAdU=
X-Received: by 2002:a05:6214:2a89:b0:6d8:8416:9c54 with SMTP id 6a1803df08f44-6dd091afdfemr59695086d6.16.1734532819757;
        Wed, 18 Dec 2024 06:40:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaOUhW5lOdJ2FuzpZIYF4vXjrAM20LoQL28HLXSIyoyy9x4+1Fgy3rctig226BDr/QRvLUMA==
X-Received: by 2002:a05:6214:2a89:b0:6d8:8416:9c54 with SMTP id 6a1803df08f44-6dd091afdfemr59694656d6.16.1734532819450;
        Wed, 18 Dec 2024 06:40:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3a4c5esm49404806d6.131.2024.12.18.06.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:40:18 -0800 (PST)
Message-ID: <36aba488-26d7-4dc9-9ca0-a14e3de028e9@redhat.com>
Date: Wed, 18 Dec 2024 15:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 04/46] arm64/sysreg: Update register fields for
 TRBIDR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-5-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-5-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1wzcjN5RJlT4J0gxf0g-rqDYYSQFNqTAdJfkVdm_QW8_1734532820
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_064023_755306_2BDB9A1A 
X-CRM114-Status: GOOD (  12.48  )
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

Hi Anshuman

On 12/10/24 06:52, Anshuman Khandual wrote:
> This adds register fields for TRBIDR_EL1 as per the definitions based
> on DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/tools/sysreg | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 59351931d907..10b1a0998d99 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3295,13 +3295,24 @@ Field	31:0	TRG
>  EndSysreg
>  
>  Sysreg	TRBIDR_EL1	3	0	9	11	7
> -Res0	63:12
> +Res0	63:48
> +Field	47:32	MaxBuffSize
> +Res0	31:16
> +UnsignedEnum	15:12	MPAM
> +	0b0000	NI
> +	0b0001	PMG
Out of curiosity how did you choose the PMG terminology?
I see "MPAM implemented by the Trace Buffer Unit, using default PARTID
and PMG values in External mode". Wouldn't be TBU more meaningful?

Eric
> +	0b0010	IMP
> +EndEnum
>  Enum	11:8	EA
>  	0b0000	NON_DESC
>  	0b0001	IGNORE
>  	0b0010	SERROR
>  EndEnum
> -Res0	7:6
> +UnsignedEnum 7:6	AddrMode
> +	0b00	VIRT_PHYS
> +	0b01	VIRT_ONLY
> +	0b10	PHYS_ONLY
> +EndEnum
>  Field	5	F
>  Field	4	P
>  Field	3:0	Align


