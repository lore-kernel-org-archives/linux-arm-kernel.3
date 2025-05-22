Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED91C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N85CK9sWp6+mFnqAqGxmA0vF6xRLZ1OY4Jq5uN3nns0=; b=NAWZif9eg41pTRKZa08e8DAKrj
	CE880AI8P6C4Jrjg2fy85MgFO43RHeKwb8gJEIv0s+7Luy6meb0+bDuoM5eMaLG3v4Wmk1Hhvsweq
	hj4mkj/pR1slaGjmY3iRVdlrSeKJLQFCUSraN/tPBf23NxkHVI3Lq4tbqW4a1x9u1CQMW2s6cqFiw
	6yHUP2kejVCabLi3MNi7HS3sp8Wa517LZRRCuFgBu/6UUnfm6XTzPdPHzD8Ze2SMftkYTcgpsTn8H
	nio2p8esvVGqw2fV+prtPMcPerGZCcZDw5cN1Sfr2OUEtV/lWeQldDX5cYbWsXva/GgWBpuAcIfVp
	7G5YJ8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2go-00000000b7o-0nyR;
	Thu, 22 May 2025 09:58:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2eC-00000000aUv-0ctF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 09:55:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso77380745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747907730; x=1748512530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N85CK9sWp6+mFnqAqGxmA0vF6xRLZ1OY4Jq5uN3nns0=;
        b=V+iHKCXqsB5vwu/K579lY4waA8nLjCHISHJ4lzmOl34J0NzuFe35vPbE73UMxGIhkM
         phRUETVUlTUsh/g5YIVDo0905BnFddDa2GOpYinJgcScumuuV9lgzPAJ4LHMWqbF2s+X
         37PXep8RGpnuMHP3vZZUPA0nFQXgzVwjhVRYs8VeFELXBEHJYolcFzM4IFrXfCMmk9qO
         jIwmIgaEgi88Df1jS7fPN/w+YfgQEksmJuSTHiI9zfQsW975Yh2mjT9A30gBerOXOJ/q
         OaHiLqCx1/YvH0Jt4fX/TBl05jfHHKFv8NgSDXbfSfHG8G2Q5ViDKWfYpFOFfZaj29/s
         FhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907730; x=1748512530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N85CK9sWp6+mFnqAqGxmA0vF6xRLZ1OY4Jq5uN3nns0=;
        b=kPkDqAlc13991pQJhDIV3xNFrNN9XUmR0eVbD4JnKKNQsb1iV1O6DIHhNwHk6Ea38h
         PAdIyUQMCpDzG3UNoYEQXRX3eSRvxEAz+HQ+jtepML+t+EY+ENxml5ApGxs8WSOZ73Pd
         HOpvT4haZumkStbk/tZNl3W6w8Z6oC9f9UA+Ca4d3nP6+fVo2qEHHNO0NZ0ZVvaXBLIZ
         VPphWfHUBHDUXns7hrDlZjakQhKMAaJPR0JgffsMCagGElEMAycqDqPgPJHOR6sT3dGE
         8/oxOgYdIDtyoDey4Klu1Q0hWCb8usoKCOLGdBUkXUpHzDpkl5Yb225FKnV76kPB/41S
         A6gA==
X-Forwarded-Encrypted: i=1; AJvYcCW7T1PmvHcjfpfNAGg7tKcSV75pslbQ2SLBcXfiaosBReXco8MEFpyP3Q5skKuciRk8ES+/J3XLE5/MrZnxEF7p@lists.infradead.org
X-Gm-Message-State: AOJu0YzdEbSW1XE8Njti3v0TpkzlKLhIi2PyPCS9OTcbEXqMl5uc7nFi
	5p1VPbhlIdXn0HfIgw5F8A6rjZ+Dbj2ua/BjVRXHwPbNOQaLzDFAmnEEdavQ/Y/SUICSpOvhve3
	7SozhBf0=
X-Gm-Gg: ASbGncsZ0941aDgZJfqFRbblRtzioYJvnOkG/Hc4vYgTnmLkMBypXwc9L9ucFE0Hb7d
	5TDjcG+Sjakb2pVAERGug1Tn4O+ASaWAbeGZhOC7/xD8aRJFyJ/XISC7qmu2ej7EFfv9VwjMN5v
	vFEOrCY3izXdEbVFNgvDUD9bW499NcvOxmveFSNLEfLGxemnXSZ7UNDU2ujlgHhhKMsBL5mV95K
	XeENJ+6GvsMd3HRPYihHdS+R3KvwLDwpQyo9sGLvyHrsf3bWik3A6Ardpmh8AkcT6CBVp4zMUb/
	ud2vWtgPd09mFAxidpraAnFEevcAeazvOWTTS4p32KsXT22YUJf6xHTJ244kcawLMl06JPXhw9R
	bnxzwYqNUE/CRSEGRYl66
X-Google-Smtp-Source: AGHT+IGlBdPQ4Ket+t0Pzwh3J2o3hjvlvuhgKqsoA4ERFUZXVz8H96bSIMPAXq+HQL+iX73vE7/+8w==
X-Received: by 2002:a05:600c:c059:20b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442ffc60edemr147130325e9.3.1747907730316;
        Thu, 22 May 2025 02:55:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfdd9sm96314495e9.18.2025.05.22.02.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:55:29 -0700 (PDT)
Message-ID: <3c8474fb-75fd-4ea1-887a-53f625e4eadf@rivosinc.com>
Date: Thu, 22 May 2025 11:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
To: Qingfang Deng <dqfext@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250516152355.560448-4-cleger@rivosinc.com>
 <20250516152355.560448-1-cleger@rivosinc.com>
 <20250521074627.4042832-1-dqfext@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250521074627.4042832-1-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_025532_179841_87104DA0 
X-CRM114-Status: GOOD (  13.78  )
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



On 21/05/2025 09:46, Qingfang Deng wrote:
> Hi Clément,
> 
> On Fri, 16 May 2025 17:23:41 +0200, Clément Léger wrote:
>> +static struct sse_event *sse_event_get(u32 evt)
>> +{
>> +	struct sse_event *event = NULL, *tmp;
>> +
>> +	scoped_guard(spinlock, &events_list_lock) {
>> +		list_for_each_entry(tmp, &events, list) {
>> +			if (tmp->evt_id == evt)
>> +				return event;
> 
> `event` is not being updated by the loop and therefore is always NULL.
> Did you mean to return `tmp`?

Hi Qingfang,

Indeed, that's a mistake I made while renaming the evt/event stuff. I
didn't saw that since it is only used to check that we don't register an
event twice. Good catch.

> 
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
> 
> <snip>
> 
>> +static int __init sse_init(void)
>> +{
>> +	int cpu, ret;
>> +
>> +	if (sbi_probe_extension(SBI_EXT_SSE) <= 0) {
>> +		pr_err("Missing SBI SSE extension\n");
>> +		return -EOPNOTSUPP;
>> +	}
>> +	pr_info("SBI SSE extension detected\n");
>> +
>> +	for_each_possible_cpu(cpu)
>> +		INIT_LIST_HEAD(&events);
> 
> `events` is already initialized.

Yes indeed,

Thanks,

Clément

> 
> Qingfang


