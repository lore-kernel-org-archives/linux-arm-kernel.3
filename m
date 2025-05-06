Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75975C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbL28/Q5fCjpT3qjIse0voCquluax0ysjbv1wgZ9OdE=; b=mtKgECdpFnl2kmdgJrBOagbILp
	bzWK59X1lZLajOxvV8PdT7Vt4jdjKPO7mxcGfZP+E0bnbGjtMwckPOFdvrODehgRzIuk5lY3N2qd1
	oGwqvKEQjVl6H3VahQsMH6AWoNhle6MOI+jiKwlqmHtfMrdSG0CWYzUTEyY7KCkMfFQBkLy6Q06vk
	VOeMMRd6oXcqoYNHiojSvzj09h0iDnggXt3+CKKLeVv3cdWvi4R8mvZ9s5sWFbaXn1wKcqTqyLJRm
	+IxZr9ykNyOVIG81Q2SDUAd/S1I2fp55cH4CVDwVSYyOVd1kpMhGaJMGISLPyed3+fok2yMIVWQDP
	J51ViMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCCha-0000000AvYn-1TEl;
	Tue, 06 May 2025 07:26:54 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCCfc-0000000Av51-2z9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 07:24:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so736759166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746516291; x=1747121091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbL28/Q5fCjpT3qjIse0voCquluax0ysjbv1wgZ9OdE=;
        b=fpZKzyI8BRJoQJ3J9UYGj1/7Yuq1UUDQTE8aq1C7T4tT+NGvbVYgPvJb50ofNdgU6f
         EsxxkDk79UsIrFrG+gD7O6rgaQqer9fopK0y2LObOrAjhQk+LilJAiMlS9gBoIH+Wgx3
         WogryKMw5F64oYbaQs447X/IT9F4bg2e+uUuj9LSmUWL+YqtblWhUF8n7YKhSTosmg+8
         2jdMXH+DvO+402kjYd3qgzGHCYa1oWho6rLMGFXNUgibuFGp+MnLXdHZXcUY5MKQQUtO
         KB5ct2FT1VyEGePHPG6ZH1Xr/QJWGpmF87dcyLPr6IAFvijk2YEL4QuFULN8O9TrNePN
         4r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746516291; x=1747121091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbL28/Q5fCjpT3qjIse0voCquluax0ysjbv1wgZ9OdE=;
        b=RWpIdMS4kttaCB1fxgNx8mlV7lLvc2Jhuq0cC0fWpH4RVIR48C6+9uoNVlbtrelMah
         oikche6CYRlAvaDf1zHQseZ/wwHQ5pg3MteLaVFyJNCSAmmKcgQafj/E/Lza7BomAoVl
         e0Fikn70og5RE4sGJpqf+VSc/ejnXfT3Cs4EjmqNY0vmuP1TTcMd4Qq+pg9Wx3W5JYd6
         qhKOnrNjx/z7SSqIT/gf218Jrx4c1Vmpmyhjh6y+U3l4RmN0GiCTwReBMqVVosFP8GJR
         CWR63QtLYj/cvwky+4yRZOt7prbc0rPAJRdWIz4acxdIINz69oH1SwqVBlYl6IacbuRu
         wvFg==
X-Forwarded-Encrypted: i=1; AJvYcCU/qqH9iUfI0jut+rMB0RSjQ8oyjR3qLE5+Xd0EeKsChJ4pf4a0hCHENhd4bT3wLxZBkEwxsQU1ZSetMw/Vucbt@lists.infradead.org
X-Gm-Message-State: AOJu0YzCKH7wQuYsLzAqUhapnC6kKH/BPo5pvQ15CLrcvV9bR6S8mO/g
	7pkLqiiDe8PCQ/Eqz/JrVelqQzDzA2Q6K8LsxrIvWs75zHfEnM2O2eVWIMZQFOk=
X-Gm-Gg: ASbGncsctZwXeIMdoI8BH6sojlUobjWmsuWFmAg70buehXeHyQyZpuER8Pt9r9mWA3E
	LdXWoypCQqvJAU6HP3Aiil0iq6kED+6G+w4lnJLn5JARZEu7lyKnantAugQ790WJ9Fr5ihwmC+e
	crTEytKep5TYZ4rncSeRFtDEBnS11O/ivqiLj1vUBGfT9kINyKgxYaFdZtUZgZ4xbXlj/I7miXX
	7I+zazGmJdW8Yps8nwNVmZjzkJ2nqfOTXL1M/6ViOijDQQ07UuKsulVeguOECKRGXKv99sNV/Bv
	3XMrtsDAnlN4SWGojQPukgEqUlImgLdTsm0vZvBXdDfN0isT5sY=
X-Google-Smtp-Source: AGHT+IHCFEnbJ0GDLTWa83tTmfCGMhh5WwORYTYmcU3ggC2S+IScDWzxdZRGqMZ8tE3BuqiylW508g==
X-Received: by 2002:a17:907:2cc4:b0:ac1:ea29:4e63 with SMTP id a640c23a62f3a-ad1a495ad79mr1006272766b.26.1746516290877;
        Tue, 06 May 2025 00:24:50 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c01e5sm644433166b.87.2025.05.06.00.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 00:24:50 -0700 (PDT)
Date: Tue, 6 May 2025 09:24:48 +0200
From: Petr Mladek <pmladek@suse.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
	tglx@linutronix.de, mingo@redhat.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	peterz@infradead.org, mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
	konradybcio@kernel.org, dietmar.eggemann@arm.com,
	juri.lelli@redhat.com
Subject: Re: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
Message-ID: <aBm5QH2p6p9Wxe_M@localhost.localdomain>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-8-eugen.hristev@linaro.org>
 <aBjYbXJL-GJe4Mh8@localhost.localdomain>
 <6ce50077-2c64-40b2-82b3-c63c16fa1898@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ce50077-2c64-40b2-82b3-c63c16fa1898@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_002452_749960_B4A04004 
X-CRM114-Status: GOOD (  39.07  )
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

On Mon 2025-05-05 18:51:19, Eugen Hristev wrote:
> Hello Petr,
> 
> Thank you for your review.
> 
> On 5/5/25 18:25, Petr Mladek wrote:
> > On Tue 2025-04-22 14:31:49, Eugen Hristev wrote:
> >> Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
> >> to kmemdump.
> >> This will allow kmemdump to be able to dump specific log buffer areas on
> >> demand.
> >>
> >> --- a/kernel/printk/printk.c
> >> +++ b/kernel/printk/printk.c
> >> @@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
> >>  }
> >>  EXPORT_SYMBOL_GPL(kmsg_dump_register);
> >>  
> >> +void kmsg_kmemdump_register(void)
> >> +{
> >> +	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
> >> +	kmemdump_register("prb", (void *)&prb, sizeof(prb));
> >> +	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> > 
> > This looks strange. "prb" is a pointer to "struct printk_ringbuffer".
> > It should be enough to register the memory with the structure.
>
> Yes, from my perspective this should be also enough. However, when
> loading the generated core dump into crash tool , the tool first looks
> for the prb pointer itself, and then stops if the pointer is not readable.
> After the prb pointer is being found, the crash tool dereferences it ,
> and looks at the indicated address for the actual memory.
> That is why the pointer is also saved as a kmemdump region in my proof
> of concept.

I see. It makes perfect sense to store the pointer as well after all.

> >> +	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
> >> +			  sizeof(_printk_rb_static_descs));
> >> +	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
> >> +			  sizeof(_printk_rb_static_infos));
> > 
> > Also this looks wrong. These are static buffers which are used during
> > early boot. They might later be replaced by dynamically allocated
> > buffers when a bigger buffer is requested by "log_buf_len" command
> > line parameter.
> > 
> 
> I will double check whether the crash tool looks for these symbols or
> only the memory, and come back with an answer
> 
> > I think that we need to register the memory of the structure
> > and 3 more buffers. See how the bigger buffer is allocated in
> > setup_log_buf().
> > 
> > I would expect something like:
> > 
> > 	unsigned int descs_count;
> > 	unsigned long data_size;
> > 
> > 	descs_count = 2 << prb->desc_ring.count_bits;
> > 	data_size = 2 << prb->data_ring.size_bits;
> > 
> > 	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> > 	kmemdump_register("prb_descs", (void *)prb->desc_ring->descs,
> > 			  descs_count * sizeof(struct prb_desc));
> > 	kmemdump_register("prb_infos", (void *)prb->desc_ring->infos,
> > 			  descs_count * sizeof(struct printk_info));
> > 	kmemdump_register("prb_data", (void *)prb->data_ring->data, data_size);
> > 
> > 
> Thank you. It may be that in my test case, the buffer was not
> extended/reallocated with a bigger one.

I guess so. A bigger buffer is allocated either when explicitly
requested by "log_buf_len=" command line option. Or when the kernel
is running on a huge system with many CPUs and log_buf_add_cpu()
decides that the default buffer is not big enough for backtraces from
all CPUs.

> > But I wonder if this is enough. The current crash dump code also needs
> > to export the format of the used structures, see
> > log_buf_vmcoreinfo_setup().
> 
> It appears that crash tool looks for the structures into vmlinux
> symbols. It can be that this information is not available to some tools,
> or vmlinux not available, in which case all the used structures format
> and sizes need to be exported. But right now, the crash tool does not
> work without vmlinux.
> > 
> > Is the CONFIG_VMCORE_INFO code shared with the kmemdump, please?
> 
> I believe CONFIG_KMEMDUMP_COREIMAGE should select CONFIG_VMCORE_INFO
> indeed, which is not done in my patches. Or I have not fully understood
> your question ?

I do not see CONFIG_VMCORE_INFO selected in drivers/debug/Kconfig.
But maybe the dependency is defined another way.

Honestly, I did not study all these details. I focused primary on
the printk-related interface and commented what came to my mind.

Also I was not sure how the dumped memory can be analyzed. I expected
that it should be readable by the "crash" tool. But I did not see it explained
in Documentation/debug/kmemdump.rst.

Best Regards,
Petr

