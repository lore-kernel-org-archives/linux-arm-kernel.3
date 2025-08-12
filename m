Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E0ACA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CQwup3JJa1ayhdQThgOgG4MUx5X/EUx4Tii1T+qif0=; b=AhsfVxyJM1/NK8xStMm/f2okHJ
	6pp2nejQPNcPKzKRCvT/K+M94P9/kjnaH7fFvIIwB8i+HhHbFRTSwRuMYG5qyBzG94+i06giFIuDk
	NPn47hfVJd91bcj3bqWP20vcGCqlvxvfnoakyQyDK28k6EjbmFi4WGAM6endXf4tYvoKAAHSqIV35
	zK5BeF6PF8nj277Xh3wAYBR18nP+Xw7btEmMM7PUqKKwzxsIsGjgtQgunKjZi/GVLSYAHjqfrc8lG
	DZBgHmLPEqvFjTI3pl7qcUrRjiM5Ath3zbxqVuydxCVuBNE3IupTnajx+V5jpZMKFcwThGdkDO2hc
	WxJw5ZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrod-0000000BPAw-24WD;
	Tue, 12 Aug 2025 16:25:35 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloZ0-0000000Aqqg-34Gw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:57:16 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso4972497b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755003433; x=1755608233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CQwup3JJa1ayhdQThgOgG4MUx5X/EUx4Tii1T+qif0=;
        b=ZHfvIb2W0wVUDnPnmdRYEDbUrer53eVb4ljgU3Pios+S15mh4hJcVaAcdjsnFpf7f6
         X8hr4z3EkXlDX6hjQz4RHwTjqO7EctOwd3qps3haO4LIHRcAeiDac274MHA2Zpsr+IiY
         7qYj/YQKG+CQgg9hbY6fYERP2MFOMeitiSv94VIDV6/GkCzkZLU6sWamVp8MRpGI42il
         d16W6auBIZrQEAFwGjo+HfvMDH+ou+FmEsdIx+o7trJzBdUHsysbUBlp7qNNzw90yH0i
         07F601+6YSezKntMphJpn7DJcedFiYp+FBshZhVuIZnlsiNGO62fMo6itLQGEtnFtCDi
         r7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755003433; x=1755608233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CQwup3JJa1ayhdQThgOgG4MUx5X/EUx4Tii1T+qif0=;
        b=T67MLNFNKhpDcayxITWnoVe4dTpkbmQvfw8Ss5d/U6yVgB630bnUeq5oXr3IyYOLdb
         hKNteFVjCT2mlXQddlBfR10J3qLY2aiLv7Pirk7HioGsu3bAoaC8Qn8WruIf/OFmD+Vn
         1i2rlpJESxg1wee7RLumnKq01Q1TU8Z+zAdALlFCehlfb+RC+2dLhC4mSsNHTOjrUgyr
         Iuo+3L0K7Joo+dkjUaNNI3KdkQ5l5Omf5gWbUBjgOiXDVT2n/XcvzmxmNngVtNC0yCPt
         6b5FKGmKmlrEq6SuzE4S7NMb5gIUWJAh7JuJYzeWgPotb6CyP5LCRrFaa0Wdm9a1rmbP
         q1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUv0j9IZxEpeSo2yXeGQutNfUbSKOAlmuI8rVBi3ObYNPJYu5HgUfzcfmWKUuX1v/x6pjV96oM2XHsEh/xYPSdm@lists.infradead.org
X-Gm-Message-State: AOJu0YyYxPwlONpnlSx+bq8NOGmISo6jE/WBmnZv5bkGKFQmGN3edaC6
	KN6JFjSNwiRzjWKLmowaeefGvSamuS0KyTVDMEo/oVigdbBhhC1sROgxar9HmiLc+4Y=
X-Gm-Gg: ASbGncv0I4mFW/2kWq4Zo3eHSUq57f7vyEV1gotfq9gtISBzhaWDKSKeBirswQ9d+o3
	+6hh82pF4q7x5gCsKvwbN5AgPK6I7ee1m6FqYWkUI165Huo2mo3jwykubUWLzeDBu9JPoezBiT5
	tM8V33T+Whuy8t5//ZnIcB7Hc43Sg+bJHDesxxruvO8+dZ0y638YKZalvEpjUakNguOlIUTYv4y
	1zPTMmNSneWd3YhGEFI8Bi8hqnRGSuV2JzGkvfNSzwLVEMqti7r6x0+canFgxgyxkJRgoNAU8x8
	NPePhoPM6A6fmmLB7PUdvEOomYJz1keOsl1qDXSvE+qDwhQwgDytxHUXcT/zWrRGj/LIEcj9B/r
	or8EJUqLVM8JTpj8VqRCdx+PhsRO35JnTOYoECcaUvjhi9jFgo1MMFMFzqUaBvVqY/Lwhmjqpoz
	hP+Q==
X-Google-Smtp-Source: AGHT+IHLx2NmNN4eIHAGhJaj/DxTDLbTh85qThe6wdpXJOc29/KjHDsxypcCoyrdkW0QCjfRPpKYfQ==
X-Received: by 2002:a05:6a00:2d7:b0:76b:cf2b:18bf with SMTP id d2e1a72fcca58-76c4603e0c4mr17297275b3a.2.1755003433445;
        Tue, 12 Aug 2025 05:57:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd98csm29222812b3a.67.2025.08.12.05.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 05:57:12 -0700 (PDT)
Message-ID: <56c18c70-ebb9-4018-b8b6-9041337bb3c3@rivosinc.com>
Date: Tue, 12 Aug 2025 14:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH v6 3/5] drivers: firmware: add riscv SSE
 support
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20250808153901.2477005-1-cleger@rivosinc.com>
 <20250808153901.2477005-4-cleger@rivosinc.com>
 <CAEEQ3wmUvQRx3HLG=i7fk60-wf1AtYmjV20Xbe2c5_RHi1c1gw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAEEQ3wmUvQRx3HLG=i7fk60-wf1AtYmjV20Xbe2c5_RHi1c1gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_055714_906799_4177D946 
X-CRM114-Status: GOOD (  10.67  )
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



On 12/08/2025 14:54, yunhui cui wrote:
>>                                                       &preferred_hart);
>> +                       if (ret)
>> +                               goto err_event_free;
>> +
>> +                       cpu = riscv_hartid_to_cpuid(preferred_hart);
>> +                       sse_global_event_update_cpu(event, cpu);
>> +
>> +                       ret = sse_sbi_register_event(event, event->global);
>> +                       if (ret)
>> +                               goto err_event_free;
>> +
>> +               } else {
>> +                       sse_on_each_cpu(event, SBI_SSE_EVENT_REGISTER,
>> +                                       SBI_SSE_EVENT_DISABLE);
>> +               }
> It is necessary to check the return value; otherwise, the event might
> be passed as a valid value to subsequent logic, such as
> sse_event_enable().
> 
> 

Hi Yunhui,

Indeed, nice catch. I'll fix that.

Thanks,

Clément

