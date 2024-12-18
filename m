Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F623E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhT23Y8TQCYCMf1leRBky+No7WqbvnjK1DeY+t6D5qA=; b=gVn8hDRFvJ+T0txV9GuqXNCLcl
	yDFTKsl0kGxexYpr+/58sS5suV4CQr6ZJKUNCxAH//cBZ0tq8tVvD812QzWlIJXcJN3z9VQGQ86a+
	FoA5qNRhpO0hHmfVSwjH1Yc329cpD5RQd2Oeinb7zTswhW5f810TyYjGGRxtD5xzS/5520CfqHHtF
	WjCTLWFBXxZKkFjUUawQu3ZANHp3pHnjJWZT0tdfDzOpYGCj/6cWRvDDG56FzOPQSkUSDEuFY/ojA
	lYqDde3m4qyNhJ3c/DaQyVHA11f6SMGkZQNRJ0bVwnrsEMEZEiIz4Q34XkmeWDI6z6A1Rlm2e8Q6X
	yq3mEKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvow-0000000Gzda-3x9O;
	Wed, 18 Dec 2024 15:18:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvnl-0000000GzOZ-0zq2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734535048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhT23Y8TQCYCMf1leRBky+No7WqbvnjK1DeY+t6D5qA=;
	b=jNaaYj0QjUYSaLOhhs1fM3dComWifb+0sR4RN7sfqerdPj9yqjt8sR/4WrosCZNL/v3pHM
	1BzpFsry67GgP5BUbAAPtqBijJtWPo6pP31KSK5j8ybmGKB1hljyAp2XmkBfuxQAlvxMqQ
	zwvrxxPqLqIHdYdzbbAvmLj/h39Xgmo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-KBGjcZRjMK2GaVyAfoxgbQ-1; Wed, 18 Dec 2024 10:17:25 -0500
X-MC-Unique: KBGjcZRjMK2GaVyAfoxgbQ-1
X-Mimecast-MFC-AGG-ID: KBGjcZRjMK2GaVyAfoxgbQ
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b35758d690so1198615785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535045; x=1735139845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhT23Y8TQCYCMf1leRBky+No7WqbvnjK1DeY+t6D5qA=;
        b=uPI/TG2mfGIR4b3Yb6DYNjLXGMp9GpbjoBR2cIbbBzQFdIDMV//n4hPhyy27BymdlB
         bBX9U+y8mxodySc4DlqNy6uyts8YgMvq8CA7jFoDw2kG+5r1p5UvZzSG8bzT7XVIkkaD
         2wzBVxSxJ2cFwKis2hU/L4yO/xxXt+JAO2hBemhxh+jTWqBvAAUqZL+4F9GdYErmnRTH
         MN9+l7DrbP89N6KsAxI8eMUzTz1PZz5xJ5VR669PE/PNIYWiOM1ttZkhfT1LCSXMvcgi
         C+TXRINOwAoLF0h49RZio0mnMgozIqaJVw6/yA/VRiBJIS2Wd+/kg8ggFCwEctAlgRKK
         HCqw==
X-Forwarded-Encrypted: i=1; AJvYcCUTA+KiHQebji1RANBIkYlnOiHZXewbyGjsPff6iaFU4uTk1aTW0HoUpDHtvBeXRgKz5F3kjgObyeoaZZ74meZf@lists.infradead.org
X-Gm-Message-State: AOJu0YzoThFnrftX/YA6TghPz6Jv4PaW8a5B49Z3pevCBsCJL3Cj58KH
	bw24G9SXZ+7Tj6iW6ZdHM43QvLnDDC0zBjE+XRhSVuvC9WJDtsrd7jLcvV8Y2xb8uimgfx+gxdr
	qXZtku0+FiphnrXgfd/7ANoQ+YZtMKQuFhLRpjIgSGkQ0Qzd7vWBjOeNTgqWgalk/GHrHSbYK
X-Gm-Gg: ASbGncv8AeOZajDqGj5Uidp0NDm3c8nxanVl1mgxUN8aouic0ZdvS44xFAfelwmxTpP
	cfhW9CkKFRmLdL8tafm8q5TU6Mjn1phHiaspH5Nt0v7f6CFfSyzsvSL01y2NwCxz4GP+q1hqBbn
	w9SoI1RItXJss7LomxE/eAnFZN1ONhikrNf1iiXX3r+19pFnwS/Gf+jS5SSjmrW9sLM5ehyCLaG
	8SRqGkxUye108PFW6RO950w0P6XJ2PGhvCSC+sipAKrJYxnKPz3EQiMxGyGtRzywO8EvI1TzUU4
	yuTorX7FTNDsZWGUWktk6fc=
X-Received: by 2002:a05:620a:29d1:b0:7b7:106a:19b8 with SMTP id af79cd13be357-7b863721022mr524514485a.20.1734535045000;
        Wed, 18 Dec 2024 07:17:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3yDOvoXP2F0eLylU5flUK2Asc5Xh1WkI3kixNyZ6h7T6Vryg/PEdvSGh5he+yNjx9RiU+ug==
X-Received: by 2002:a05:620a:29d1:b0:7b7:106a:19b8 with SMTP id af79cd13be357-7b863721022mr524510885a.20.1734535044717;
        Wed, 18 Dec 2024 07:17:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047aa729sm434042585a.12.2024.12.18.07.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:17:24 -0800 (PST)
Message-ID: <53889259-fc3e-46a2-9dc9-1aa7cd36e953@redhat.com>
Date: Wed, 18 Dec 2024 16:17:18 +0100
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
X-Mimecast-MFC-PROC-ID: i0ImJsF5V_POpOR7Q17ttaBU3aPjdXTqElJtOJJ3gho_1734535045
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071729_345819_403F69BB 
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


