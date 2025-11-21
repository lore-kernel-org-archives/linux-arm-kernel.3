Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41224CFC261
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0xm/PimYBI7QTShSUbqekIyDmRlXD3/nFnREaHBgqw=; b=ylgCd69Gcjxh06MDUDGNYxGgGj
	CFiZXaB8ejx8DGx3MsEKIBJgbbmBIhHp3pVdfbsPst8aAFdlVKnpgpsq3R44fgbxAmmXJ5dTBjjNZ
	9+ZOhBUM8QSP21rVLCzBWerTz3O9r+4NJtIaRVd6jdM7SChPVRtigsSVdREgSnJnojdK+Rdi2fAD4
	njbc3u298po2f5NtRtAtw9K4SLT6kS3Dlxkcjj9yIOTUHt2ISrEMaIe9PmN8eWQhooLpjVsvGQ6o9
	rERD+N/jUUDPsXerCFKywROYQOVYNcipA8nNDtapsPKxOBcEnZEg/LL7DIm3rpnQS+UhWdybTaLvD
	lAQGXSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPGj-00000008JIQ-0N41;
	Fri, 21 Nov 2025 11:25:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPGg-00000008JHx-0g7B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 11:25:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so5823315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 03:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724332; x=1764329132; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0xm/PimYBI7QTShSUbqekIyDmRlXD3/nFnREaHBgqw=;
        b=Wea2hSEAJJzw1eLoFqqn3byPVJ1rwOKh8CoJNaqJJaxV2sBsYJf1WfPu3WJFroi72b
         CSweISENqZ2zs59SdWZyWU1ZhUmFHkvuMpW7Z6EugDMLjyK34m0vyEQ+I5Z3i20dFBMC
         TzAwMbSbZmhegj21DN+baEmkak0WCSifWElIyykStW9cRHkFT3FggE5GdGnuMSKl6Bv4
         awGqjZNSzYdiu28FJFFPE9Mxi75eJZuCj16I6YmtKFxdNsUZbipsoELh+/XwuxNnTS2J
         nxfr0xxPjnq5gTeMJ2JiKOBHZbhMo53CIn8vBwXSjSFWMhj+wzAbXfaP3FRK1GO9vx+j
         XXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724332; x=1764329132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0xm/PimYBI7QTShSUbqekIyDmRlXD3/nFnREaHBgqw=;
        b=xU09LG22GymBBatHtLYjdK6vUxUA9iup081UZGjU+HeXIsXfjYLmMlfRe168LCteDg
         wK5xaEfl3I75UcAL5mi2iHHzo4kdNhwJxVnrXlHUBdcLM618WgbKUi730IW/7CGN1NPV
         PBJwKkCTCLAxKZijkrds8+GYShAhmmCtLJ/yED8fWKQ+oeDPVdHbE5P6re78EmjVQGL5
         Txaawr+7L4tT8myfi3oyVoQ0tIVlQZ5os7gtjK+V46Hm521fJMmJahMvmqN7octZRzot
         sgJ0hlfDruVKB9A5BvSai82FkTpXAEFfL0i6xJ8zJ5pWQNDASB48WFduqFKTE0TXZ+3S
         tYow==
X-Forwarded-Encrypted: i=1; AJvYcCWs7j1CoDIDaCDRsmPKSeKBz3S9sdN3VzW9Ch0ExFrSO1NLNfTZg+afDNIzEH6pMLhhyJjdDvUJIGLsYQlpveLE@lists.infradead.org
X-Gm-Message-State: AOJu0YxfttNmnKy6jbGGfZEIRi9QvxnxtlZ/7iJDcxGWMRTZ1SRg38Eb
	XchCKulgYT0e5Jsr2GySCA2OgphXzshEvHyyZ2UcIvoyLKXPDY1Zb9Z9
X-Gm-Gg: ASbGncvvzaVLodYJCEdvC8uKvFgR28B5FSK8po+klGqZgCF1uxh+jDfguvxWobyFpKH
	uDV7s/iC9V3YjFXFKwhUVnz9CWcuwhqV7yZR13FOq4xnfkcCHHsNrTtIMam+CxHfcwOi+ToQABn
	QRhvSM6IInfTNl8LF3WV3+9bysnEoICSd4Y83HxJgVImoeCQPYHB6sh0kYL9QpdIK02DIe4nhzi
	Tv0Ghy32+qqcSebFzg2h6NRe7d7NBYXd2Xmz/XBbuNPXgufeEIPjtm+ex6FAsg7HVBMyaJCmTFt
	DfV1wwGFlSwcP0X1Sv7ZRRnISCTS86DTRtLh/mDqtBzExNJLwP7n0RaGdEv2xpcTXvxIjLCZz60
	JFqq5Q8iH8p1sqb2Ba6gwwG0Pcq3dyPeUza+mUpaNpp6z1Ony05QxnIxaSFkW1pPqTTsnbGV0/5
	jQw7mEfRMG2TFdOos6boE+tvQ=
X-Google-Smtp-Source: AGHT+IEQgLDezxuB/3Bt5w+9c4IjI+5mMo4URpXWEj4gL76tDkRoyLjFbJw02JhBlsBW/bbk9MSoqg==
X-Received: by 2002:a5d:5f48:0:b0:42b:3867:b3a7 with SMTP id ffacd0b85a97d-42cc1cd5cffmr1874053f8f.8.1763724331793;
        Fri, 21 Nov 2025 03:25:31 -0800 (PST)
Received: from [192.168.0.38] ([86.12.216.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e598sm10317686f8f.4.2025.11.21.03.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:25:31 -0800 (PST)
Message-ID: <05dd180e-f12f-44ef-96e2-2a6013da14df@gmail.com>
Date: Fri, 21 Nov 2025 11:25:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
Content-Language: en-US
To: Catalin Marinas <cmarinas@kernel.org>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Oleg Nesterov <oleg@redhat.com>, Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, David Spickett
 <david.spickett@arm.com>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
 <176341325906.789443.15370787298292895484.b4-ty@arm.com>
From: Luis <luis.machado.foss@gmail.com>
In-Reply-To: <176341325906.789443.15370787298292895484.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_032534_245448_605B1303 
X-CRM114-Status: GOOD (  13.86  )
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

[off-list, as I'm having bouncing issues]

Hi,

On 17/11/2025 21:00, Catalin Marinas wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> On Wed, 15 Oct 2025 18:56:35 +0100, Mark Brown wrote:
>> Currently it is not possible to disable streaming mode via ptrace on SME
>> only systems, the interface for doing this is to write via NT_ARM_SVE but
>> such writes will be rejected on a system without SVE support. Enable this
>> functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format data
>> via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
>> writes currently error since we require that a vector length is specified
>> which should minimise the risk that existing software is relying on current
>> behaviour.
>>
>> [...]
> 
> I don't think we'll get gdb feedback soon. Thanks David for the LLDB
> ack.

Unfortunately this flew under the radar for me, and I haven´t been 
following these discussions closely.

Is there someone working to rectify/validate this in GDB from Arm's side?

I´d gladly review it and get it through into upstream gdb.

