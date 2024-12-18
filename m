Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAF0E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhT23Y8TQCYCMf1leRBky+No7WqbvnjK1DeY+t6D5qA=; b=Nui39KWwG+g+Suz7DAcyjsCSnr
	lANY+P8N9ZBXt/ucZKGLOqGFBgerIgcfpK27xzWxLZnKsAgtYyWuWEqz4m1ao9fNl/pjaEJOGCfvi
	pl59QVAOGbADeAGuOrbizeCW6whwNoWgVg1fsrO7u+Z+SuUc4VKyJf4TLT5LnUCPPbYJQgvFrB+pa
	9bh5LK4wVVuwOZHDwXv76oRg2SDrsaHYWzP0+JePRoQ4V/QwvCd+/U0paSuU8568eYnqj7rT1/Cko
	DERVt5ZzEHz5iFsenscRYjCpt3Z4QFtMeaSMmO+wDo8w8j9KE+GpUaBy8BeQY/1xCVqUJyqHIegwa
	Bx9FyUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvq1-0000000GzpT-2wkH;
	Wed, 18 Dec 2024 15:19:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvnn-0000000GzP9-1gbC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734535050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhT23Y8TQCYCMf1leRBky+No7WqbvnjK1DeY+t6D5qA=;
	b=a9aLIfI0bl9+hQQJnxvoTIzYYtopkNppDkHoFVP2lT7PcE+/B3kDRdGazUIpzOrK+yszCz
	0G5PtLOyBoJHC0ApZXIvJx8WxACD4FIdKKdYVSS3DmkcPr5RY1bk2Q8oI55KC8kFQvBvaJ
	2+sEHcDnY86b/e8SFn7apcq3xhy6Xw0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-msKoZWGNNvaNQugn3ZfsrQ-1; Wed, 18 Dec 2024 10:17:29 -0500
X-MC-Unique: msKoZWGNNvaNQugn3ZfsrQ-1
X-Mimecast-MFC-AGG-ID: msKoZWGNNvaNQugn3ZfsrQ
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6f1595869so617811785a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535049; x=1735139849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhT23Y8TQCYCMf1leRBky+No7WqbvnjK1DeY+t6D5qA=;
        b=pa3SuphJJSnLDIn0A2TxIZJFiCCn2ef+hfo0u7usnpMhRRDpaNtapY5s6gng8M1IAj
         kjoLHpjLa2tMVBNBH4gLkD5VF/DTfc4l8UwV7uGTmBCw5lmEVJncCGRf17slCHCI+KDv
         lSHe5Ewb94SrjpTf73xsX6RQUj9uv6vmNZG7ngIfxtEbDAgXF9sfClF21nE7IbKfmRZe
         /tvzjRVB8xBDlJrwFhDvcfrK8toFkgtTfjfoQQp7s4qKlI0lJN7pQ5sBtn6PSv1lD6O1
         lGKIGzaw8RypwYNICUCsqhY2jbUeZrCcfMTQ7ULwzz6Kq34Dd9GE7kH7PCzw6thEKu5S
         ypIA==
X-Forwarded-Encrypted: i=1; AJvYcCXNeDyEDY2B/kaCPlQ5CRkXKIQlcdyFScPDYp4xlC1mm1e+UQyEvMt0YmvFXJaiCmpQWWzwZfMRGSfSL5mSb5DL@lists.infradead.org
X-Gm-Message-State: AOJu0YwxX9hcCf9Watrcm22lcQPKTLwrYuoFGhN/aKB8XMeMntqWQ7iZ
	HoptG+Iqchsa5cy8z1+opnpUl8kg4wnTPHB9TYzldNwBZ+HgbqwmKd+D3gGTd8X4GFKyt/SupUl
	cT/bfEzrk/V/vh4+zFCsScqnc3pVMf5pU9zkXk7CdAP9Si90NSX+YcC0jgRCKHc6gtCxiaHkP
X-Gm-Gg: ASbGncuAbzdw+Nph8WIqlEVSJUZDc1xBkXA/L8Sa6QaTodHkUvPRcnIBqdP5jNzP4bK
	O6E2Ga11qlE0Jyl+z1zrTUYJBZ1QcepVbe+gh9ngLgLw6rObytpzWAiF4RgiezSh5DWOl5vAfC7
	6CbNSRBwQmNXYpo5eE5yTpfygvYZYojAB61PTn03wPI4PYrQLxalVRKkr44mPtTxB5jG7kwNXg7
	2YGE4fUnAeLefZS28/CdWE/TWOuq1WrjgmxVaMNWP5OaPw1S2SaXNryzZZJnmOTAXmERHQSl+i7
	1nS5MDDZOhKZC+XJbfmmKo0=
X-Received: by 2002:a05:620a:2995:b0:7b6:6826:2032 with SMTP id af79cd13be357-7b8637ad636mr472108285a.47.1734535049146;
        Wed, 18 Dec 2024 07:17:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+8HXh2pOBEtMvt59N3VE03WXdQuEXvRIA6SyRQfE/shKCr8OrtALWoDrSxjUGryMWNIGM8A==
X-Received: by 2002:a05:620a:2995:b0:7b6:6826:2032 with SMTP id af79cd13be357-7b8637ad636mr472105185a.47.1734535048912;
        Wed, 18 Dec 2024 07:17:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047aa729sm434042585a.12.2024.12.18.07.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:17:28 -0800 (PST)
Message-ID: <f6f7ab18-1bfc-4f38-a48a-afebed370a44@redhat.com>
Date: Wed, 18 Dec 2024 16:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 07/46] arm64/sysreg: Add register fields for
 HFGITR2_EL2
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-8-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-8-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dz_GPqV3n9UBR3kSWyYBK49TiniB2rdfGeFXrXSHniE_1734535049
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071731_503199_5BF2005D 
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
> This adds register fields for HFGITR2_EL2 as per the definitions based
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
>  arch/arm64/tools/sysreg | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 1a7d8c03f844..9d339f735648 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2791,6 +2791,12 @@ Field	1	AMEVCNTR00_EL0
>  Field	0	AMCNTEN0
>  EndSysreg
>  
> +Sysreg	HFGITR2_EL2	3	4	3	1	7
> +Res0	63:2
> +Field	1	nDCCIVAPS
> +Field	0	TSBCSYNC
> +EndSysreg
> +
>  Sysreg	ZCR_EL2	3	4	1	2	0
>  Fields	ZCR_ELx
>  EndSysreg


