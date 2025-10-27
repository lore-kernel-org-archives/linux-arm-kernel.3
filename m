Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8A1CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Wt2P3rgJn+5UKGAbxiwQscDH8snP1L4I/rTGNdNX60=; b=lpjg+8cN7B0Qi+pV/MhweEpxMW
	SdqH//sY5YDWqqJVNBKjPb7TzPpnPS5Fl2V9FrpVapp/oYXCmh5DKlVT6ZryaQrrCW1aexKIqQCdy
	LaEESKpKquUxCmpbM90TfgPvxqgOBT5FDUwKY+fZUUoosbfchltA09LeGerJhPiy1uRLNxbuRTN1V
	BuuwUwSx0kiAwLhjrfO8yfCf/gtbTPCIMVCshgrF6m7Q+CevAKUNS/KDytQYIF3uHgy7nGpJpVN2Z
	wvPD+Gj0ASrdmBN5whxSWSUrIcMfY5elJKY/qfVVkB7a5KYbIGONu/ao38MSN+FOEbcoGISiXe2vF
	7sb7XA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNI8-0000000E1je-0AtG;
	Mon, 27 Oct 2025 13:29:44 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNI5-0000000E1iE-3izi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 13:29:43 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b6cf257f325so3802968a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761571781; x=1762176581; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Wt2P3rgJn+5UKGAbxiwQscDH8snP1L4I/rTGNdNX60=;
        b=IeEr3prJr25wZmZRqtzvAljjN7kIBa/ib3StTQ9oSy5d1MhgdS6emRR6D2xx8m1xxw
         x32StbW0Sr14n+HSVpoa4VUo/YaRhfdp+ikICBkwIQDxqYFB/j9WKkYvEMSFLxrMLLwV
         E4q49kR2UeA4cURYWcWu5iA02KgmMLFE9cJyXgp48nGiC/WL9z4Ooy9j19ibpKV6KXsn
         EWteaePH+1AdcJWzN2chC9bs1FSdpOCARMg5ASIP6FXvShXZAkCGB5jLCS6ys3nCf4Ti
         up9XIkZmw9KQKb1eg8OCHFIAI5CLOi1qcEdywLnQ5mYB/fafToaa7WUhVxzJ4yT47q82
         U7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571781; x=1762176581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Wt2P3rgJn+5UKGAbxiwQscDH8snP1L4I/rTGNdNX60=;
        b=jBd9OkZ1CGgF2AneTGa5AmI38JnwEjBjSxfVKcvohu+tG/MwOkDqBE86QJ1vL4kbRS
         GaCKRFw8zzWDL/xE3t7eg+2h3NEruEzb4O7uipGpVHGiTVZm9JQSkD2XXdQLRw93qZ39
         xE9Zjmd5Z3Gz/vL0MUveh6puttLCJtUKoYFEruQxzQzypCiVvN+P2cUztIqZzaQ1JIWi
         A/d/hTedZzjhnoGyWaaUpjQBAayc4YcY8m31nb5zw8zSHLBjsNnVgwPoegMNUcercIk3
         k8b1wgNPamBQmidPX7wu5zpIhzG2R30DJfhiQrM50LXa2csIJe+poK5czmPQ9RfcObcV
         PJYw==
X-Forwarded-Encrypted: i=1; AJvYcCUBGqx2jFUtVlkkz3R9lDcRQw0MdizMreqi3yJn0HYJ+k67r5cdkwl8R7Gp66jSvOeX3jv9xIE72R3VpvG0B9zi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh5i99mNo5CeV67d/IDspV/7PRx5tD4YxoclplvKrqEOZyyxJV
	NW5AMozhHE+IgviY/hKC0KUJy2luXEoCNUYu5aP2+IrEjwy4fCddnvD25bIDWbmj8o8=
X-Gm-Gg: ASbGnct2rdUzs9Qc8/tJ1TG0eS/LePpMO972l1UTs+59toDKAONVa4iqVhws1pgimiG
	fEHvKocQS9cOYG8Qvmpf/vgQb8/W1gw6PXu0q2PjdtCKcSvd3B7fsh9DlUsmdfc1nNBq6s92u27
	0q1/1BOGvp9VfCcao6uDZYOAUo29Y4tEwha/d+4hex+1Z4YklYfQyCK2OqEgy9XQP8ha42UY3Y5
	PvXwTfwEWlTJeyauB/P4OEVs3hK0grRdn84kunJPAkGZIaYMZGt7UpTJ+d05vczznn/fz5HRLen
	iO6W4mT25RUShK6kML2G8SG+z/124vzBXpnaJTzDlK429ZIpvdTvjLU70EkiR9zSdke3Kj/HZIu
	2csprQnEqyIkcN3QQ7e0G0K8jWpY39QFN5kSZm1XF65HCIButeu8y6S2ph3HsdiLstB1T0PZPl/
	RCJp08icvDqEl1gKxQgS01ErDKQn1L8tBxVRrDBs9LtF5qag==
X-Google-Smtp-Source: AGHT+IGhfwb4u5norrCouP8BPxoTLYfO2XYGgio+ddfcnsYJ7Y7fRmFkfkRRSKjz9BOxITMsUStHfA==
X-Received: by 2002:a17:903:9ce:b0:267:bd8d:19e with SMTP id d9443c01a7336-2948b9a823fmr133319325ad.22.1761571781056;
        Mon, 27 Oct 2025 06:29:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed5b056dsm4181028a91.1.2025.10.27.06.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:29:40 -0700 (PDT)
Message-ID: <2b4cd5a6-98f8-4ec6-bdac-c6c7dae84049@rivosinc.com>
Date: Mon, 27 Oct 2025 14:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH v7 2/5] riscv: add support for SBI Supervisor
 Software Events extension
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <20250908181717.1997461-3-cleger@rivosinc.com>
 <CAPYmKFuVC3CwHbytPzQCHOYPoQp2LhucbLRRRRsqHk9upkrW8A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPYmKFuVC3CwHbytPzQCHOYPoQp2LhucbLRRRRsqHk9upkrW8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_062942_071884_2F4896D2 
X-CRM114-Status: GOOD (  13.31  )
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



On 10/27/25 13:00, Xu Lu wrote:
>> +void do_sse(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
>> +{
>> +       nmi_enter();
>> +
>> +       /* Retrieve missing GPRs from SBI */
>> +       sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
>> +                 SBI_SSE_ATTR_INTERRUPTED_A6,
>> +                 (SBI_SSE_ATTR_INTERRUPTED_A7 - SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
>> +                 arch_evt->interrupted_phys, 0, 0);
>> +
>> +       memcpy(&regs->a6, &arch_evt->interrupted, sizeof(arch_evt->interrupted));
>> +
>> +       sse_handle_event(arch_evt, regs);
>> +
>> +       /*
>> +        * The SSE delivery path does not uses the "standard" exception path
>> +        * (see sse_entry.S) and does not process any pending signal/softirqs
>> +        * due to being similar to a NMI.
>> +        * Some drivers (PMU, RAS) enqueue pending work that needs to be handled
>> +        * as soon as possible by bottom halves. For that purpose, set the SIP
>> +        * software interrupt pending bit which will force a software interrupt
>> +        * to be serviced once interrupts are reenabled in the interrupted
>> +        * context if they were masked or directly if unmasked.
>> +        */
>> +       csr_set(CSR_IP, IE_SIE);
> IE_SIE may not always be enabled in CSR_IE(for example when we disable
> CONFIG_ACLINT_SSWI and use imsic for ipi). Maybe we should send ipi to
> the current cpu here.

Hi Xu,

Indeed, that's a good catch. Sending an IPI will be more generic.

Thanks,

Clément

> 
> Best regards,
> Xu Lu


