Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCADFE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSHc2ApB1snPUa7jcz/r5fBTNNzq7YKYrFNPntkx7ik=; b=SkeZ4X1GP8Am42LGKPdsR+pUh2
	GrZZ0SvISqXx+TfMSGl0XoTzyF/h+Gnumz2zzKorudO6t1Ey+rCZjnC+2FZmAMbZP+CWv4vIu/2Bs
	7HDY4/3cLVKmvq6dXzSwHp7+vsENc4tCmJhRUjmwpwll4s91U2jkK9syfgQrBRMZo39LfvQgAdfoJ
	EPGnFlDG1a3IGqm1Utm8OxgkKEopeDPY/0igbKtuTVuyVrycG3CCFz6UTXWs9pifFQTWJZLpBdep1
	JcRERWr3FZhpX5QYrMFu6OkmF/aIVMDyZyI54jOpsZKfUiDlupDZCEbryFe/Wc08/iq8Kxd7o7HYT
	jwSV3mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvzi-0000000H1HX-0DpG;
	Wed, 18 Dec 2024 15:29:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvyb-0000000H1CP-2zGQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734535720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSHc2ApB1snPUa7jcz/r5fBTNNzq7YKYrFNPntkx7ik=;
	b=E4DBZ79NrZCtKkFQAbdAzRLTzUwV8I4tRjr0l2wfg3ol8/GD2l0ZsrXj/Y5l1ZntvRREVK
	8rS5T7B4aorm9N/d7bHQ8ETOiYXCuB2RfxjRzPbdlh+Sfy103fAmxN/BvvgkGxywfq1Rni
	VPEfpRarnYuDsszK4qpeK/3rpQ2HMQQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-DIKrGDkbMlWN1N0LmrDzoQ-1; Wed, 18 Dec 2024 10:28:39 -0500
X-MC-Unique: DIKrGDkbMlWN1N0LmrDzoQ-1
X-Mimecast-MFC-AGG-ID: DIKrGDkbMlWN1N0LmrDzoQ
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3862c67763dso2794417f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535717; x=1735140517;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSHc2ApB1snPUa7jcz/r5fBTNNzq7YKYrFNPntkx7ik=;
        b=k7vUIXNhi5YFqE9c7rYbMiPaY+fKbmwjs4sL+FgOlpRVf/NwxvMsAOv7wqDbIMmSYN
         WuANF8/xzmuyi4amnIoqpYU0nujhnPrrNYP2/k5FwE3jD/092QWa5GMwIoSxC2dYXIlh
         P7WHWTX3U/55H46k9DP6N0HyX/q1BB6+Qg0cU189QtaWUqi/W24w1tajctrqwowlzU0s
         KWH/61bWW9zRZCfJ7g2l4znlF03MyVd0V+kxdDrEJCZZ6fnFloTN6NdvFazdd4wvl+FX
         FvoYWkVVym8s1frPM5ptktkGE7Kcwiz4cQV7rw+WRuargTuRNxuJ5P5Jvx7H//bzsfUe
         OSzg==
X-Forwarded-Encrypted: i=1; AJvYcCX8PjjWd7Mule2O+Z9DmKK0jEYO6gTs3Tgt12pecKqHiLrAeAH03Kdu3o4/qh1ZmyQQ6LqKr++muOiRbCOmDj0I@lists.infradead.org
X-Gm-Message-State: AOJu0YwB5mZ2uN5q6NYHstCAfDa02PN9zy80bEq2exMLpiV7vS9wYsex
	vo0CPL/OVh+9IifoQ1DrGIRd6susfl+ceCCT9cN8IxY3olFv4y/h36FKhMmHLaTSb0NOZkKhXyt
	n6W6EO+kYucuk704WhN5VFU6MHoIMRja+KH+R+PwmnWDZAE7v2roM74Mi+QvngWhtmYWcv8QTUB
	kGKL12
X-Gm-Gg: ASbGncvEqN3vYo2wPkdQ2eeCQkkMbntCk8nlVfiSJZRrlIqf4yp7E5W3oiXey9SXwDx
	8DbLSwkeQvdM/AUjVt4F1+Cg6i2c3hVers3PnsNZBqpDzcjV/A47x0r7jeUPivsNwGAWkoRYFqM
	78TJEd/Lqd94PpyC7d42rhS8dz2TZXLgz8mLMDyyPWK99KuOojzyarX2qWeYwybPS+XicQXY0VH
	g3aeq/G4zGGAjcZDnkzmbocSdQdRJsBwNwiTNej/aMhpWZCxmE9DMMuiV8ZnLqZ6zpg9nAhybh7
	XHg1mbR35Yw5pOjYRokw/rQ=
X-Received: by 2002:a5d:598d:0:b0:386:3dad:8147 with SMTP id ffacd0b85a97d-388e4d7ac44mr3121384f8f.32.1734535717307;
        Wed, 18 Dec 2024 07:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiv6kndOmgGJnN1137+7Dkjb518FlpmJgWwNyVe8dpcrKXQzcp17NV0VYD+o/4evBLu6qqIg==
X-Received: by 2002:a5d:598d:0:b0:386:3dad:8147 with SMTP id ffacd0b85a97d-388e4d7ac44mr3121369f8f.32.1734535717021;
        Wed, 18 Dec 2024 07:28:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801a8bbsm14342588f8f.56.2024.12.18.07.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:28:36 -0800 (PST)
Message-ID: <a7988236-eb81-406d-a74a-5ad1355981e3@redhat.com>
Date: Wed, 18 Dec 2024 16:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 11/46] arm64/sysreg: Add register fields for PMSIDR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-12-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-12-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SDxNCzwHoF4REDNCRDxUY2nY__SZI9SwDOr6ROsHGus_1734535718
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_072841_823484_798BD277 
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
> This adds register fields for PMSIDR_EL1 as per the definitions based
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
>  arch/arm64/tools/sysreg | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index be0091060350..a5e31e4c4474 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2172,7 +2172,16 @@ Field	15:0	MINLAT
>  EndSysreg
>  
>  Sysreg	PMSIDR_EL1	3	0	9	9	7
> -Res0	63:25
> +Res0	63:33
> +Field	32	SME
> +UnsignedEnum	31:28	ALTCLK
> +	0b0000	NI
> +	0b0001	IMP
> +	0b1111	IMP_DEF
> +EndEnum
> +Field	27	FPF
> +Field	26	EFT
> +Field	25	CRR
>  Field	24	PBT
>  Field	23:20	FORMAT
>  Enum	19:16	COUNTSIZE
> @@ -2190,7 +2199,10 @@ Enum	11:8	INTERVAL
>  	0b0111	3072
>  	0b1000	4096
>  EndEnum
> -Res0	7
> +UnsignedEnum	7	FDS
> +	0b0	NI
> +	0b1	IMP
> +EndEnum
>  Field	6	FnE
>  Field	5	ERND
>  Field	4	LDS


