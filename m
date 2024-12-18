Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850ADE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOTwT8HE0XwDG2FAJOX9RxAWuGIePlcHl5MDSdJ05RA=; b=0I3F3JRywCaOVQmCX8kTUPiEnU
	KamazwGPccY/99/uZqGFZof7Ce3Hq45EZ3Tl7Df+Wal6aOcmdOgi/goBo4vL8dtuVsg6CWiCMarkB
	AhcUb6ndV1NDB76ZTAl1gCSw9cGDBly3stVhSpBXmMvdO7y9k1lrlGPvzMuiBEjBWzo2zt5Zk29p4
	K5iKG63OcxKZkC7rL1egnGmaktPayjWPZqlanRnjf06+lcg4VQea/bkQVZEgxDHZUZNhwpHoeceAD
	v/gg21Dm3Cu7+AihSAG7tlvi27uz4+bRz8YC0ZWlDHUB3t9zDndyFjuwt1HSukDguV23xrsDNJI9b
	u3UdJHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwBa-0000000H3dz-0CFm;
	Wed, 18 Dec 2024 15:42:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw0V-0000000H1Uf-3GiQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734535838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IOTwT8HE0XwDG2FAJOX9RxAWuGIePlcHl5MDSdJ05RA=;
	b=EH3p7xfMhYuNhURPpqAiPpqi1N0OLHlsQiTxNvaFcn0sLS08qUxSzTXfaWEtfsr2uze2k5
	Dwy3rt/SyDTiLTm9HjduaiKgzG4x96/EGcf+A8swc//eXvbDNMRPZMD/3j7rj/z8lXf1Sl
	N0vteDHv46SBXjA9dKZd0gJMoEX+TK8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-L4kE_FUcNA2yr6b09_38GQ-1; Wed, 18 Dec 2024 10:30:37 -0500
X-MC-Unique: L4kE_FUcNA2yr6b09_38GQ-1
X-Mimecast-MFC-AGG-ID: L4kE_FUcNA2yr6b09_38GQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361a8fc3bdso37278035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535835; x=1735140635;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOTwT8HE0XwDG2FAJOX9RxAWuGIePlcHl5MDSdJ05RA=;
        b=KKA0n+nhD6h+rT6OwIR847KqI3OwMhkvV9cEB72y0WtHfrgpVVHBlaqrXgo2VDG/Ik
         vADvrc5q4BZ/tKzpeqTZMNvB/AuPrwFCyr12N2df+6wpMXedBQN8fJo3R5z/kfyjmzh+
         0CDTKRhooI3El7Sz7bu+6OiR4eIWYmfCDHXrTORXoKkfsFw3aEUJjp4WKkZl8oDs8d4g
         bfpeL0IW8d8KUWcDZvM9rQtklDTsTg8hQ7KWU1gz7JOzOI6BGWlahtozvzcNy3ZvTYRx
         LP0MMCg0Xsgbet26LdE7wW/Vodecc5T2kNgX8KeDXiryRWEgZauh9AYEZDPOe3iMLl3b
         A52A==
X-Forwarded-Encrypted: i=1; AJvYcCUOHSOLlPbAQ0umdpNlma/vbWX+m0Ux79/0hybl5+Fm8Ykq8+uzTT75gTbkhGtX2l5DJZt5tyiPkuQfGZT3wb9f@lists.infradead.org
X-Gm-Message-State: AOJu0YxOWnIUw5E9FpJr42PIc2BsFiLQo9pynN0VXwNafRfmKJMVGut9
	ioCWG5RzukwynvxN+shB3cRVGd7A0sva2f4hxNHqqkIhm+HmJ5jRKSMNYlArkAK1bk+ih5w7Fu7
	ksiKelnLaRMQ6x1+2KdHpfPk4qhUzj97IBk7dcpBnxGh4vAoMPfAG0PLCVl2mdqRA5yf0KqYv
X-Gm-Gg: ASbGncvY8+oARDCK3TsYKEA8z23Jcd2jTiqsCP2mNlap6hKYeeMwTg5xK7xkMqOIa5Y
	XGnK8yt4L64NClkpDwBR+rIXPEcmZs01P/QbVfCv/MpNN3BZSXZav+LJ+M4GA2E1MmQbuBfbOI+
	Q9rCJ2jB/6ywmEqAB2nB6wHSlMEq7dNOYALxWpJ2AjBnJBoz38Pk9tidqKo9AubriirNu7e2IC1
	O13+7AHw5bg4A2+AdiL9Efpg0lwNK9hF6L13E23ud4E/OTdCxnTYjmYU5Bxo/WJ8mqda6IkmqI7
	SkaOOnv0jFSOtIw6MDHqPYE=
X-Received: by 2002:a05:600c:468a:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-436553fe17dmr24703955e9.25.1734535834979;
        Wed, 18 Dec 2024 07:30:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXy7/92tN4aqDKjWg7kMg8QCEdGz/+/l71Ezw0sjA8QjrEyldBB1pQsA/f3MKEus/gdEi2RA==
X-Received: by 2002:a05:600c:468a:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-436553fe17dmr24703635e9.25.1734535834464;
        Wed, 18 Dec 2024 07:30:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c5bsm23443205e9.2.2024.12.18.07.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:30:33 -0800 (PST)
Message-ID: <ac2744ad-728b-487f-af9f-1eee1ae0bab5@redhat.com>
Date: Wed, 18 Dec 2024 16:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 12/46] arm64/sysreg: Add register fields for
 TRBMPAM_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-13-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-13-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9H-FWBJ6Q4uF9mp1AG_gZhnS76p5VpvUvFSxFKHrVjI_1734535835
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_073039_890970_723AF3A0 
X-CRM114-Status: GOOD (  11.57  )
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
> This adds register fields for TRBMPAM_EL1 as per the definitions based
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
>  arch/arm64/tools/sysreg | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index a5e31e4c4474..78564b24b187 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3413,6 +3413,19 @@ EndEnum
>  Field	7:0	Attr
>  EndSysreg
>  
> +Sysreg	TRBMPAM_EL1	3	0	9	11	5
> +Res0	63:27
> +Field 	26	EN
> +UnsignedEnum	25:24	MPAM_SP
> +	0b00	SECURE_PARTID
> +	0b01	NON_SECURE_PARTID
> +	0b10	ROOT_PARTID
> +	0b11	REALM_PARTID
> +EndEnum
> +Field	23:16	PMG
> +Field	15:0	PARTID
> +EndSysreg
> +
>  Sysreg	TRBTRG_EL1	3	0	9	11	6
>  Res0	63:32
>  Field	31:0	TRG


