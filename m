Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547F2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiINDmFgi3CvvCGYNLW0/8flH+A9x/a7nz/XzFllaOU=; b=co0LDzFKSCC9nGViQPvo6rj/Fc
	6hoKUi+1OYX1p/nHGrRg9P124YV5QIr5gAnUL4C+b0MXbg/BqedRbgkJCJA2cpMNiVRNoOX+QPhga
	wDb/ZPlp4s2rIjpOq2u2sAw+EETx+sVq0sJqG8XzOXrd39lppqUg1e0VOxsaRPtKOwk1xkZsx18kU
	5WQrk/aGFCNAaTKF51J5BMvxt3vxYIaiEqnjrj78eLWDymivacnIxOg1XdFwKZ9Z1Ypk+kJsh/tVj
	lGVJjn2cWoVVBUpAuVDJVYa/Rglj7+MiSvvt7xDLwnLuQJDO57b7BAt52cSwt7hKZ19k0ks5rF8gT
	ybmILMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwK9-0000000H5L5-2Gum;
	Wed, 18 Dec 2024 15:50:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwGA-0000000H4Xq-3mGx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734536810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiINDmFgi3CvvCGYNLW0/8flH+A9x/a7nz/XzFllaOU=;
	b=hA0ELFl8luiV30x2TtM32D1ke+dNi1Y+aqPWSJDGgdyb4l93jJ3uH6HWOXilXoR/0Ww8mK
	SVSRdeyeXN3Oc04xyQ2P5n0BH154/CqY6bSvR3pfhlyNAzf2PIO/E8uN1K17weKa8sYnPa
	R1eGBH4Soogu+D3/FWpl6chdesAX8sg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-2habrR2qPGe6qwaMv_z_pg-1; Wed, 18 Dec 2024 10:46:48 -0500
X-MC-Unique: 2habrR2qPGe6qwaMv_z_pg-1
X-Mimecast-MFC-AGG-ID: 2habrR2qPGe6qwaMv_z_pg
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385dc37cb3eso3731553f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734536807; x=1735141607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IiINDmFgi3CvvCGYNLW0/8flH+A9x/a7nz/XzFllaOU=;
        b=Nt9jNhaJiIp/AI+sts+MQNbu/3pSa8l5OD/u223jljl7a8ZnZYjeTC+APciuQUX/Qm
         mp5Ae+e+IwaYGeDq44p52n7t+Vrj5oPWAu7GrXsCr9QQPQ9DEgOWJYhon45YXsbOsMYp
         gWgZ6j+BD1Y+hSQi5qjGb5+iEINj/gH9wtMVPXGjySnoYWpyY9niPiYMF1pRU0anCqvf
         l5uoB/Tu7WduEVmg9b4l1lVA6zLvyq45dyvyvzOCJlf4gl06sTtL89wACKllvDDJbIAe
         EHKZ3c5akhuRadv8J5liHiC8uQUCrDY49bFWGxU5XmzIc9iO1adtqRA879+kmBMeroHg
         kCcw==
X-Forwarded-Encrypted: i=1; AJvYcCVUiMGQ6j50nJbV2Jcz1n775BM2qmU9VIt0mX/y1M7y35s5ogJE67yDQl8QDwJrntka31/WKKXwGamX7qjMuSG+@lists.infradead.org
X-Gm-Message-State: AOJu0YyduoQAzIPUc+WAufCIBDUvRVPDxKJjh4dpNb6o2KQmamt7uOqe
	k+CeaCPUz7YXYU93I5nx756sQT80XmFZZK1EEaea3zxHbte/4TSynY80RvMl01ZdHtgFzfKUqk9
	foFBgV+Ub61D/caFlgUd79H2ul9WO8fx9xaqTdlqVn3ewZ0Zm1y//FdnIuj9+63yj9KhBc616
X-Gm-Gg: ASbGncvgE0XL1CJTbZHwYxjvz8jfzyS8aveVCpVhK1X+KBN0tMnfwn4cJdJVozKTq1e
	+MmXBnrIHn8seO6AjDZNlrjZ2GIltvvkPy5cy3IxjZ6pemvjGduDjueyySdCKJX6wKqV2+xBYSO
	XId9K/u3swvObxWfQBrweaF4fCgSQCnraWOoR4t/x9KppwPDNbLtXMfyNuZR0f0oMAds4eznFZ3
	vF1G9/y0+XoNGy2r/MOwGYIR/iByg9p7tdJN09iF1di1eAL+NskzaOvsrB+xlvXPh8laDrEhhei
	uVhyNNVS0BQ3SxVhcw6xumU=
X-Received: by 2002:a5d:64eb:0:b0:386:7fe:af8e with SMTP id ffacd0b85a97d-388e4d2f515mr3213059f8f.12.1734536807144;
        Wed, 18 Dec 2024 07:46:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFovgQ/USAGFlREJnD8NcVoejkKLPY8P9I8MWbW2wM5zOQziDgwJ0bp1yIxiLN+FxRbPY22Ig==
X-Received: by 2002:a5d:64eb:0:b0:386:7fe:af8e with SMTP id ffacd0b85a97d-388e4d2f515mr3213039f8f.12.1734536806816;
        Wed, 18 Dec 2024 07:46:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b01b73sm24471465e9.14.2024.12.18.07.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:46:46 -0800 (PST)
Message-ID: <7987c825-5ce1-4401-85ed-e7192e54e0b7@redhat.com>
Date: Wed, 18 Dec 2024 16:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 17/46] arm64/sysreg: Add register fields for PMECR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-18-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-18-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W7yKuFjtyHOn2nPhh9TMgnTbu6NgJK_Ptj6gmiuzbfo_1734536807
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_074651_011219_9DD48C3B 
X-CRM114-Status: GOOD (  11.51  )
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
> This adds register fields for PMECR_EL1 as per the definitions based
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
>  arch/arm64/tools/sysreg | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index ff09da6c0b1e..214ad6da1dff 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2349,6 +2349,21 @@ Res0	63:5
>  Field	4:0	SEL
>  EndSysreg
>  
> +Sysreg	PMECR_EL1	3	0	9	14	5
> +Res0	63:5
> +UnsignedEnum	4:3	SSE
> +	0b00	DISABLED
> +	0b10	ENABLED_PROHIBITED
> +	0b11	ENABLED_ALLOWED
> +EndEnum
> +Field	2	KPME
> +UnsignedEnum	1:0	PMEE
> +	0b00	PMUIRQ_E_PMU_D
> +	0b10	PMUIRQ_D_PMU_D
> +	0b11	PMUIRQ_D_PMU_E
> +EndEnum
> +EndSysreg
> +
>  Sysreg	PMIAR_EL1	3	0	9	14	7
>  Field	63:0 ADDRESS
>  EndSysreg


