Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A935DE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC6GNR2l7RLB+cS0CfyRSpwZEUR6W5v8iITbSAjRP9w=; b=ZuIW/GFV2czqZWp32ClX28wxxw
	KFJnUyBTCnSlKzpj1i4P+v79HkDh+vxKrqPcIqMC7o0nJFBwrNxXLmbcpUNt4kn4qaL8xo4HQ1PY2
	V0HBFpgiV+8iQcP8WAxTEt01j28yWeSud1ariFSk+lGRFkpMdLELGxoVdZz1uk3Z+aEr7RJP+1qHv
	9Pkxpe34v8k9ZPgPVpDBR+p+kqen49bSy+DOGxE4OBfpdzrN5P3qBC623PwN0XVWtSAHEf1WAm513
	CtOApxcM9OYcV4xNg0CqdNMVH3np85+5rm6yZE5U0ul3G9OjXmogkVfn/nJYIGbrzesIDyi84k/lq
	uxmc6luw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwGw-0000000H4il-0SEG;
	Wed, 18 Dec 2024 15:47:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwCW-0000000H3s0-3xbi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734536583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mC6GNR2l7RLB+cS0CfyRSpwZEUR6W5v8iITbSAjRP9w=;
	b=L6fo2xXIMAjL2RjAad5c5is7DbelYqjYBLV1taQPaRVTRiYzww6rdefIHPUSQqWE37U3oV
	11WYHHPPlAuRl5YyKYXLaHat0IeBm6sc8WDkV5KejwUyEXHR9C+r4cUFHCLjSeWd+m5p1h
	IAz2Cz36M/lJsvTEts4aj36kWQ6eDxo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-PUFIvZbXMeGhBryCTpTygw-1; Wed, 18 Dec 2024 10:43:02 -0500
X-MC-Unique: PUFIvZbXMeGhBryCTpTygw-1
X-Mimecast-MFC-AGG-ID: PUFIvZbXMeGhBryCTpTygw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385e1339790so3950587f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:43:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734536581; x=1735141381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mC6GNR2l7RLB+cS0CfyRSpwZEUR6W5v8iITbSAjRP9w=;
        b=bb1I1q4Oyd+luEhLPPT9D2ZHrm8ZSHIaTBigUMRlgf4ZgAjh4yHrF2Z45y0TgEPCaA
         3av1o9qOYJNeg15DQ72A2fM+plheVZY+33518zrKgj7TJ7kUuVravrX3haT6Rbpxcuve
         iT+R2fbeO9uMbfUsDqRuWutJCdi1R1RKpAaRfJjCCy03w983eZZ865OxlwF/wjdyU4wm
         Tfl3HK4Xl74Is7VHNBRRiSA9zgw6X1UD2NFVodtSij2nVttwfE3Cvkbe314QGh08MR1r
         26ij8G+fd4u39se+n4xbSgiAZQzl5a58ic1t2z0mJLjberIhwBXs+4uTJBkUGEGEk9jI
         z5gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7mH7kz6FJN+U8MZzI3TtDCrVJZfNQscM0svUwZDnUTRVHuJsQCkCKs19h7lQ/Z6yp58o96sibMZZBa56a972X@lists.infradead.org
X-Gm-Message-State: AOJu0YyQGswYUUfKDg05hyzGVejiYa7NWBjOCycgldLiz76xVc2hmQod
	59200XFWbLlH9Oiq3S7n1erkAuUo9FGE6bSh555Ld3cfg//LnSiOM9OwNKavp3fh5mwmNpOrs06
	w/W1/TCu02QI2iKf4aLcy/8KhRcGgZ6Ju4kFtssV1knwwu2sgZx3Ixwx5ozYpok7XWcAbeAuF
X-Gm-Gg: ASbGnctIn7SusjHhkJbc7CUJ+ECINW0gsEDE6fHyI4j8MDKZ3UbxPhmyOWJOqgk5YxN
	b6ODKQI+DuPKCEtZc6z8L+dyuAiu5ib1duiBu1qjE55jBnUDoG9Z9g161bVIoZ4Mc8ahfjqrnx9
	DAIsTEBrAfWPfh0i8PbyTxgieA50sU28qo3FQTWFGkjhpLtrq/BI6PIrN52vJbgP/LDyNv6RzPw
	CYGqUnesUZU65NI868Wmh3Hi4BEisp6UfFgYma1VcREatX2YsXI4DAZyJtUJpViuWVOCDdPaRvv
	S3pDN4XGN3/kH6OsbXPWOWg=
X-Received: by 2002:a5d:6c65:0:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-38a19b12fafmr60400f8f.30.1734536581295;
        Wed, 18 Dec 2024 07:43:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/rD142Fp1t76CSrw37ZJBcAB/yQkKROpo9q/NSr0NTTkPonWRbLpbezaH6E7Ufy3aQSVNYg==
X-Received: by 2002:a5d:6c65:0:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-38a19b12fafmr60378f8f.30.1734536580973;
        Wed, 18 Dec 2024 07:43:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80163b8sm14111070f8f.35.2024.12.18.07.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:43:00 -0800 (PST)
Message-ID: <5203176c-2646-425b-b375-edb7931ef54f@redhat.com>
Date: Wed, 18 Dec 2024 16:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 15/46] arm64/sysreg: Add register fields for PFAR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-16-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-16-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XkWjoVpB0CmqYDG0BmnvRzH34Fa8xwztJDnhV-nHpMw_1734536581
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_074305_055588_77458461 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Anshuman,

On 12/10/24 06:52, Anshuman Khandual wrote:
> This adds register fields for PFAR_EL1 as per the definitions based on
> DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/tools/sysreg | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 18b814ff2c41..e33edb41721a 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3533,3 +3533,10 @@ Field	5	F
>  Field	4	P
>  Field	3:0	Align
>  EndSysreg
> +
> +Sysreg	PFAR_EL1	3	0	6	0	5
> +Field	63	NS
> +Field	62	NSE
> +Res0	61:56
> +Field	55:0	PA
Just wondering: part of the PA definition depends on FEAT_D128 or
FEAT_LPA and the reset field value is UNKNOWN if the feature is not
available. Shouldn't introduce separate fields directly?

Eric
> +EndSysreg


