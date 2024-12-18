Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E27E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUtnKQLrfLfRrfKGlctx27oDxF7G9rAMQsgI0XWA0dA=; b=uUbxiFlb7XLS5K8NXJxUQk7bSS
	ssFcxkr5b6hrGrbMhyzybXuj6IxbbAr31TiAu4mkpkL31LxUGgyNIO5bHHPZWtPQsQO2gRpLRc4pc
	gyB+how5G2FknOqCXGCgKy4p7aUqcQBfPsn6Nbm0skKYGZRCnu6nWU7y7YABE9HKuPIzExL4dlv8C
	qQFsU17EvW9CEv3frAE6AZ8GlZlKmWv3e8Ulrw2U/6nmGEGampVCXKILBKHzpMXPdb1sVx2bO/cxm
	nGUnOgbwxAxqnFIR1cvIhwGN9/cx1GyiBUqqfllP1Cj/NezlPC3C6x6/YlJKWrT0Hhyh8pceRevLH
	FsDDRmmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvjK-0000000GyHE-3Zlc;
	Wed, 18 Dec 2024 15:12:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNviF-0000000Gy5b-0Ugb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734534706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUtnKQLrfLfRrfKGlctx27oDxF7G9rAMQsgI0XWA0dA=;
	b=TwNjdGsCsH4SNSajpitGnrKT1steLlplzN5tmxnnbjqHY+KRC88S8NPfhgalnFac58JBaE
	rvfYh6ug4wywsYRRh5V8wL00+p1Yor/nK6NIIQauCijZjZlpgo+kkjO9UgpYm4z6WvCjR2
	Zgw1kE/7I25XlOQW1ZgaEzjnx3KGQe0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-p2kfdAr7Ou6OPxx57uB8uA-1; Wed, 18 Dec 2024 10:11:45 -0500
X-MC-Unique: p2kfdAr7Ou6OPxx57uB8uA-1
X-Mimecast-MFC-AGG-ID: p2kfdAr7Ou6OPxx57uB8uA
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d88ccf14aeso120830496d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534704; x=1735139504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUtnKQLrfLfRrfKGlctx27oDxF7G9rAMQsgI0XWA0dA=;
        b=kfQ22zVi3PpGldQFWrqdii++KY+saDOLIMyb+Iy31SBsjvB4AQG+K83X9PRrZtJ6Wa
         /YC6S8DEA3uUZxSmZ2Ejf3kReDKTJxmwrLmlENI7HO3kXDyIaeYwISxyTpRETS9K1RnN
         wAr76qERS9fs6msiohx6R9OjdCps4aIeQU5uFD9AHSzDWeabsftlu8/h8p7q42AhhYBZ
         HkDLZQTiWXdgpHZMV+/zRCVInpslEJa4plplq0MnbsxRyUlz38nIrjcoEP8kPcREU2d7
         1i8P1K6y5DoFUKMmndyoe5RcXoq7S1CVW64MSSl+GZuBgUHyd/vG+CY227+WoKDvZyH6
         m9pw==
X-Forwarded-Encrypted: i=1; AJvYcCVw6IM8Kt34hAjIhSqzeusySf86AC/JLDMmF+jHwP+udxSJDAFUSxBl2ED2AJFUXJhsO+3s4x0TY4+x+cO9w6Aq@lists.infradead.org
X-Gm-Message-State: AOJu0YyXWMd3DG8N2SCmHl4oDn0cTr4DkPK3uI7/4vHelSzy36uWYr+e
	/godcq+3w1jDlVUYoHJOF3IA0FE1SeFa/F6xR2CauqhIDqH/InHBTPQShmBZ0sZWOdt49eSYe5Y
	rXDEKKEVmLMicO/wRdNRddOc8k8NsCiz2j1L7E2a540g05TWSZ4THHzgjMzEuxlq/etQn5B6d
X-Gm-Gg: ASbGncsB9AvZq1biocUdAFDFFtRzcf73U7uPqLXGskM+PPb5/WTS0lejRY2HVM2h9U8
	vxl0kt8UugO06mm9DXEYCmaMthdfUo1gmj5tYrRxdBHJNiyVxfsT7w/MB+wqSRbC2ZOkR8ew/8s
	ha9nPG8fSDoaiN3jghYFZWhD76J0OVvSGZwbx/n0EhUPZFb6OZ9DRyTR3kJlaLBaM7A20Ukvj4j
	JdnQ9hM9sVFxcyYWNDXP3vE5GMB/e0O17xUbwMUGw86mcyzxfnuqgaWKDCM6i59O5Qdk06NRkHX
	EIJkKmZCvZRTB5ScTKDsb9w=
X-Received: by 2002:ad4:5fc8:0:b0:6d4:2fee:c27b with SMTP id 6a1803df08f44-6dd091db2e0mr52459566d6.27.1734534704626;
        Wed, 18 Dec 2024 07:11:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv9VZAsXavLqKttfeD9dxe21gsPq9vvsGrZIzMw31wmGaL8NQWnX5hi1ykqI/y4qaIyV3JGA==
X-Received: by 2002:ad4:5fc8:0:b0:6d4:2fee:c27b with SMTP id 6a1803df08f44-6dd091db2e0mr52459176d6.27.1734534704326;
        Wed, 18 Dec 2024 07:11:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3a4c5esm49752486d6.131.2024.12.18.07.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:11:43 -0800 (PST)
Message-ID: <8df1140d-5364-4979-b572-127067b18f90@redhat.com>
Date: Wed, 18 Dec 2024 16:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 06/46] arm64/sysreg: Add register fields for
 HDFGWTR2_EL2
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-7-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-7-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: swQm3bw4jOqQpCsG_xMC14xqQTdQHN8LMrwVyeKi0x4_1734534704
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071147_227616_3588E73F 
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
> This adds register fields for HDFGWTR2_EL2 as per the definitions based
> on DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/tools/sysreg | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index a56f7384d0db..1a7d8c03f844 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2591,6 +2591,34 @@ Field	1	nPMIAR_EL1
>  Field	0	nPMECR_EL1
>  EndSysreg
>  
> +Sysreg HDFGWTR2_EL2	3	4	3	1	1
> +Res0	63:25
> +Field	24	nPMBMAR_EL1
> +Field	23	nMDSTEPOP_EL1
> +Field	22	nTRBMPAM_EL1
> +Field	21	nPMZR_EL0
> +Field	20	nTRCITECR_EL1
> +Field	19	nPMSDSFR_EL1
> +Res0	18:17
> +Field	16	nSPMSCR_EL1
> +Field	15	nSPMACCESSR_EL1
> +Field	14	nSPMCR_EL0
> +Field	13	nSPMOVS
> +Field	12	nSPMINTEN
> +Field	11	nSPMCNTEN
> +Field	10	nSPMSELR_EL0
> +Field	9	nSPMEVTYPERn_EL0
> +Field	8	nSPMEVCNTRn_EL0
> +Field	7	nPMSSCR_EL1
> +Res0	6
> +Field	5	nMDSELR_EL1
> +Field	4	nPMUACR_EL1
> +Field	3	nPMICFILTR_EL0
> +Field	2	nPMICNTR_EL0
> +Field	1	nPMIAR_EL1
> +Field	0	nPMECR_EL1
> +EndSysreg
> +
>  Sysreg HDFGRTR_EL2	3	4	3	1	4
>  Field	63	PMBIDR_EL1
>  Field	62	nPMSNEVFR_EL1


