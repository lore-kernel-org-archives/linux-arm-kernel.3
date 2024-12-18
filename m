Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5814EE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzk6tWDuy93z5fSW/LgGI7zFwoVeRvip4+2VVd3waU8=; b=H9R2hQvSOjTQldN0pdj9TjaqNe
	fTGYd0pTTYR0rdpCpc3pciB46dKJ8R5MJ81ktZbt26s9jkPf+O1KpINUv2KK4KNcAGj/0/+cEsl8l
	knz6LX/awztBdWux5QDxdn/XKBI3Xqb6nE4ZRRBLPNrsOFMX5Ri/WQ9EntJ0csAJLWnRsLRB6O42U
	V6YgMSczyqmbrLv6m1c+DEQAy9/c1WD+DLbH1G5yO4/tNc2t6nAbiEiQiGItBwR/isoePYs2E6s8U
	pf8u+nhaG+s0vKNnrPQCL+wF1Mh8lGX9Qe90rIi4J9FSp2na1/xgFlt3JVnXm0braiimbiY4uDVjM
	5VE23wsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvG2-0000000Gt76-2QVB;
	Wed, 18 Dec 2024 14:42:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvDt-0000000Gsfb-2Da4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734532824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzk6tWDuy93z5fSW/LgGI7zFwoVeRvip4+2VVd3waU8=;
	b=MlKn56n4TBSLJVNrqhW0uhoOZUT5rI4lu9IBMzoiJD4u1Ew/ML0LXIZNMIp3FQgJecoJbx
	X/AREl04qr0/V+L+ZWpv2U3C4IBXiwqsqJY0ARoKXLL788Z2CrJZT0JckWi9L91IhSPimi
	mKaqYoYVVJTMjsAkJ3jq3xMc8PUphlk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-RqvLmVD-NHK28RPVUOKZKA-1; Wed, 18 Dec 2024 09:40:23 -0500
X-MC-Unique: RqvLmVD-NHK28RPVUOKZKA-1
X-Mimecast-MFC-AGG-ID: RqvLmVD-NHK28RPVUOKZKA
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d931c7fc26so111752426d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532823; x=1735137623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzk6tWDuy93z5fSW/LgGI7zFwoVeRvip4+2VVd3waU8=;
        b=VdEyMZCGSE+9qKEDP6vBW3E07ptIpAxo7hH8qU10W1d2C6qdwqY2czTYaIAZgxLvlY
         58OolmIF47A9jM9KUFr0RYj3vr61hCXgwDaea8DxVPizgSPEHqbkOsFj6ea7xx5U2Voi
         OYRSDUUBSNMKAO5Fml/0n1xLL1RkrgYtrqTM7VAETb/b+13kfPnBS5/FRj5sT14ZOsrn
         GzBVMeLhSR0EsEHjHe/wwZsalNOZ+km/28x1Be91VceVgkD9IWSt7rRFzULIoFNRoxWL
         h3LzpHmYknjHSXxVI9ZPfb04ixEFoLNA15nZGeIAHw68o1uQhM5x0IzDrwEPauasSezM
         E9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJJahHbF6WftYWdyAvG6yXSbW/ARihLvCC+l1m2uvkjlQAMSN2Z+FZ6qe5zOJIyN58VJx7hBXYAaPBoH3x05x9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7VLZxfy5YgH1OeA4nBH8s3+xslK8cazNkXQWB6yXF7DD6EZKW
	3PfeRuEw12hdET18lnuqIptYCphWCOXcp1FDnzvWvpF+S0ie2Iu2DuBxrHwpt3hHBlA/zhCwxFg
	RC+ETHnWithPm1n7L/hHEnniFk8jbolhnjGKNnBfdxbVO34NHUuszU7EZMS/w/D6b7r84LuGP
X-Gm-Gg: ASbGncvr8QJ1J4pJgy4z+cOa1rOwvE8eiIWoBruD/2Rz0xBdkntkfTcNB2+J0hAEswO
	8pgaQsbi4ZmPt+qAK83HQ6+EM0wWXft79ModZrTq0xrZ0xHnTvUdaoAiDJg9z0fNmo2Hdl4xQIr
	UiQ8IpSirLrF82rkJ/HMlUBgrwORDbCFDsDI7F+dJarjudIzO7XI7XgELWDEhLUfYKVkNCb1Axu
	f6YlVTM5xPAPsd769X1bvOnA845K7DeO1aHYzfDvva5XLRP/W19RThKORAmLkgSMJmxRCHN0qVJ
	V9Djw5tzGKNK9K7r5jO8l4I=
X-Received: by 2002:ad4:5b83:0:b0:6d8:7db7:1f2e with SMTP id 6a1803df08f44-6dd091ad741mr48614186d6.14.1734532822821;
        Wed, 18 Dec 2024 06:40:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyzRQGpvUZbqZgyLjVnHF5h72ppRppul+n4A1Jc6kVaEXZPHIuVIVlWdxlnn8Hf5Wge4oTTw==
X-Received: by 2002:ad4:5b83:0:b0:6d8:7db7:1f2e with SMTP id 6a1803df08f44-6dd091ad741mr48613946d6.14.1734532822513;
        Wed, 18 Dec 2024 06:40:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3a4c5esm49404806d6.131.2024.12.18.06.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:40:21 -0800 (PST)
Message-ID: <5b46b684-3223-41d6-9da5-4e59a1de990b@redhat.com>
Date: Wed, 18 Dec 2024 15:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 03/46] arm64/sysreg: Update register fields for
 ID_AA64PFR0_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-4-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-4-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kkLvJj4HdyP2AoXwxeBS2V0KMqtK3V8WuWEJCV7FEuc_1734532823
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_064025_653671_2F0BB890 
X-CRM114-Status: GOOD (  12.03  )
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
> This updates ID_AA64PFR0_EL1.RAS and ID_AA64PFR0_EL1.RME register fields as
> per the definitions based on DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  arch/arm64/tools/sysreg | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index b5bda7c94689..59351931d907 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -873,6 +873,8 @@ EndEnum
>  UnsignedEnum	55:52	RME
>  	0b0000	NI
>  	0b0001	IMP
> +	0b0010	GPC2
> +	0b0011	GPC3
>  EndEnum
>  UnsignedEnum	51:48	DIT
>  	0b0000	NI
> @@ -899,6 +901,7 @@ UnsignedEnum	31:28	RAS
>  	0b0000	NI
>  	0b0001	IMP
>  	0b0010	V1P1
> +	0b0011	V2
>  EndEnum
>  UnsignedEnum	27:24	GIC
>  	0b0000	NI


