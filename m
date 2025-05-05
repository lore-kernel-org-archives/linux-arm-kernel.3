Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0E1C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+3PIdJC3Ht+VlEO5rW2bxgqfN/WfvLUVhrpIT2zCns=; b=glWds43J56U5Nhk8st9E++KUx2
	5h8fSA1leKRKyBtxv+jBB4aOdJKzgjN3KXvXiF+CP9QzaV0iMgR8TUH0PocldDu0U1bWec3FYSUAs
	ToQBoeK9xLrQfg02aW+D5FPsRf3EOH3NSICjP0DqdPfJJQtZW39/gj3rc6D03d79cw1Cvgsz9j0ZL
	+4CQVbsPK5Fc3CRO9kGuPfDrpOuFbl73Ry8f25BEyEtcAs+jtr5H/HPkAO3r+4ngQc1KAmEuICSR8
	0yI11wkslNuITG0zdvYuiMKQce/gq9CR/Qy7UkB9uy4/I6bnWs0UDHRdVuESB4vgYQz0Ob5W+StKs
	eeKRMnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByEX-00000007uCX-3KMY;
	Mon, 05 May 2025 15:59:57 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy6F-00000007sqF-0uYl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:51:24 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso8797703a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746460281; x=1747065081; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+3PIdJC3Ht+VlEO5rW2bxgqfN/WfvLUVhrpIT2zCns=;
        b=kYUFe7lgJo2Dc0qqHM6cdAag8G3GF6GTHuhlWG6824Vx+pTKBIGxKpOq3q4UFQ5KsZ
         j4VWS0PSVdDqjP/VjjVpvt7/x6X85xdeealQ5A+pFCXONUo4JHS3p27hXVqkLlYMN1AO
         guhGNTwJr/oyUm/usyqI+L1nkbl+eQiFHyPyLIAH1aW/kmtzH9Ri21k50f/VdVwBPnBz
         LBHB/Gi8tHwPJ9PJM5U07W9tSG4gSkSFovfuPQyw+QlGRT0i/MhretWd6APn3bfn6oB8
         fl+UDLCtbm3g4aSgexf6YZP2aMc6Q4kq/3fTdgNnp4PK671C83ynDB+BZbPElwAte0oT
         fkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460281; x=1747065081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+3PIdJC3Ht+VlEO5rW2bxgqfN/WfvLUVhrpIT2zCns=;
        b=HThHkJF/Vt9G0tkBA1zzEGyFn72LICFGr2V1OlfBaTsZ+KgrANT50bL3IgTYEyIdFk
         g57huI/IGpeHKXLavRkAxmckEViEmKt7ohGjgqO91b/1j4SoLbaPQ7xHK+VgpE0fKZMM
         dSZhWqiUAyJKx+F9l9m1lshF+mUSwOVDmOpCrNh2Ac15Ug1TTfrxeD0EhCPgukZPjtJj
         mLUhZhdbidqNpb5ZDtoCSGsLxW+cn1ygOIICKINxOlU9LqIdrG0whNOtwSgD9U+ilZ/m
         xDirZ+AcnEGMB2EWuAa0VMInx7peu4z4/bu0QCrbTaI9BDeb/jyeNiCk9LGQOU1I2zhB
         14og==
X-Forwarded-Encrypted: i=1; AJvYcCW9XAk5yaex1y1/63YT/2SlLe9Q1HuKNlq6pn2cFH3yEla59BC2kw3uNgW2Gt0CR6LJH1SyUJiF2sdXlfXAq78O@lists.infradead.org
X-Gm-Message-State: AOJu0Yy79STmReHTOHb1P6yEBnt9tDQDgBUku7cwPsU+sERfNEzOf91Y
	krYpzvh1do01A33FmYpobcYxRoKKlRzz8ijXkwIHlyT7jzXUZhGpi/3LmEiUTKo=
X-Gm-Gg: ASbGncv6Un6j3lKiIhJ6hEmGe6HhrJzYCpxH21RWHUt9RF+w2lZx9Zg4thb/6Lp58U2
	nkQn1WgbkpSpiY5iPOLWfZBTk20bON0R+EtkQKbpS1MO7/N25e0FwdT3askamh8mIuW7m6BRn5L
	enoGksvkqKSfim9S+1vIp21N5VOTksKM4cXzUusYxiy4j5MFm4Lbu0KUWpQ4RJ7iQnGJHQ4VRx0
	PVT69ADxwTHfMjyl5yWVIZi2J3JxFUPfKU365OsKc3pi1eNa8pzGOeLwxxl01cpyz2T3E+4dCfK
	6Qgeyutjgmnaz9s55Rg7NePmnNcG6xfkH4FjRpkhYauegJZ+
X-Google-Smtp-Source: AGHT+IFeHXSBcW5a6cMPyYFCWSmdfc0Kw0YJs6QfCUivNSYazQwUq3W3k9Emuwo7XD2iieH/6V66Yw==
X-Received: by 2002:a17:907:8dcb:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ad1a4a8d95cmr752485666b.37.1746460281158;
        Mon, 05 May 2025 08:51:21 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c01c9sm516621766b.105.2025.05.05.08.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:51:20 -0700 (PDT)
Message-ID: <6ce50077-2c64-40b2-82b3-c63c16fa1898@linaro.org>
Date: Mon, 5 May 2025 18:51:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, senozhatsky@chromium.org, peterz@infradead.org,
 mojha@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 vincent.guittot@linaro.org, konradybcio@kernel.org,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-8-eugen.hristev@linaro.org>
 <aBjYbXJL-GJe4Mh8@localhost.localdomain>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aBjYbXJL-GJe4Mh8@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_085123_272762_D79593E0 
X-CRM114-Status: GOOD (  25.55  )
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

Hello Petr,

Thank you for your review.

On 5/5/25 18:25, Petr Mladek wrote:
> On Tue 2025-04-22 14:31:49, Eugen Hristev wrote:
>> Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
>> to kmemdump.
>> This will allow kmemdump to be able to dump specific log buffer areas on
>> demand.
>>
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
>>  }
>>  EXPORT_SYMBOL_GPL(kmsg_dump_register);
>>  
>> +void kmsg_kmemdump_register(void)
>> +{
>> +	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
>> +	kmemdump_register("prb", (void *)&prb, sizeof(prb));
>> +	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> 
> This looks strange. "prb" is a pointer to "struct printk_ringbuffer".
> It should be enough to register the memory with the structure.

Yes, from my perspective this should be also enough. However, when
loading the generated core dump into crash tool , the tool first looks
for the prb pointer itself, and then stops if the pointer is not readable.
After the prb pointer is being found, the crash tool dereferences it ,
and looks at the indicated address for the actual memory.
That is why the pointer is also saved as a kmemdump region in my proof
of concept.

> 
>> +	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
>> +			  sizeof(_printk_rb_static_descs));
>> +	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
>> +			  sizeof(_printk_rb_static_infos));
> 
> Also this looks wrong. These are static buffers which are used during
> early boot. They might later be replaced by dynamically allocated
> buffers when a bigger buffer is requested by "log_buf_len" command
> line parameter.
> 

I will double check whether the crash tool looks for these symbols or
only the memory, and come back with an answer

> I think that we need to register the memory of the structure
> and 3 more buffers. See how the bigger buffer is allocated in
> setup_log_buf().
> 
> I would expect something like:
> 
> 	unsigned int descs_count;
> 	unsigned long data_size;
> 
> 	descs_count = 2 << prb->desc_ring.count_bits;
> 	data_size = 2 << prb->data_ring.size_bits;
> 
> 	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> 	kmemdump_register("prb_descs", (void *)prb->desc_ring->descs,
> 			  descs_count * sizeof(struct prb_desc));
> 	kmemdump_register("prb_infos", (void *)prb->desc_ring->infos,
> 			  descs_count * sizeof(struct printk_info));
> 	kmemdump_register("prb_data", (void *)prb->data_ring->data, data_size);
> 
> 
Thank you. It may be that in my test case, the buffer was not
extended/reallocated with a bigger one.

> But I wonder if this is enough. The current crash dump code also needs
> to export the format of the used structures, see
> log_buf_vmcoreinfo_setup().

It appears that crash tool looks for the structures into vmlinux
symbols. It can be that this information is not available to some tools,
or vmlinux not available, in which case all the used structures format
and sizes need to be exported. But right now, the crash tool does not
work without vmlinux.

> 
> Is the CONFIG_VMCORE_INFO code shared with the kmemdump, please?

I believe CONFIG_KMEMDUMP_COREIMAGE should select CONFIG_VMCORE_INFO
indeed, which is not done in my patches. Or I have not fully understood
your question ?


Eugen
> 
>> +}
>> +EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
>> +
> 
> Best Regards,
> Petr


