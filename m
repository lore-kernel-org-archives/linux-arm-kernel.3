Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37547C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ajJLa5miM3AL5goGOKRZtkQ1TmX4V3MyI+Ci8KWiok=; b=kmpOTKAF+vfznKH8CH6I9+0Tar
	79L5STqKC9ti9bXp1WCPs61rN4z+miqKV0r91zMvc4Q1S0Rv/rqkfj3l3SIWiP7feBY53WFLIn9CS
	dx2YnCbgq0Piyx2aq2Pa2rs/36xGYaK5Mfhcr/UbSeiKuoriO75XS1shlXi/EVE7YZx6BzZZ1DkWg
	YrixJ2Q/LY4+D7EHX4YqpoA8eWZyE3Gx+0HbwOi8iw17gjLzEObQQmUC76Viwzx/NIYI3Q6+eVkQo
	7gJ84VGzWU0CNgsUJfASHl+JFIeDpnJrGDRGpZCaFMOUVSH9BU7oPloPUtz0mxrD8BGdZgu98ZwHE
	jBeTg5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxjJ-00000007pTy-3j9O;
	Mon, 05 May 2025 15:27:41 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxhK-00000007ozP-0nnK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:25:39 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac29fd22163so769520366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746458736; x=1747063536; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ajJLa5miM3AL5goGOKRZtkQ1TmX4V3MyI+Ci8KWiok=;
        b=bs0rughjfcGNAnHYUXj/cp4ZNA0Yly/wj4PwIeExmLbyfl4L4cj8Axa/fQYdWLDIZK
         x+vWKKilp8Uea/B5e7fgPSfYQ3Nc+g9qzI+KvPwdSu4Nbnn31ibwdIdC5myjtJSb9kNb
         hSbAiyE0zDnO2zb2eHdvdMuTi279bK57R4T4TG+yrmN7UBmPXFJsxO81tZRC7Yu0LSr3
         7b2Nd4zjpYvpdOaXgN2DAeQ73mhbv90oFnZlvEt7Q5BuXBVF0kM71Igp/s0KyV7Z7Yff
         wtS9ubphtDlY64YGPiRMNZDxXRi4KEHP4uGPLa3TGupuWKu9J/WvP/OH+6u7k3BIm3j+
         ATPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458736; x=1747063536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ajJLa5miM3AL5goGOKRZtkQ1TmX4V3MyI+Ci8KWiok=;
        b=fRBYdUbGLG5p8nqWG0M8Dr8CTd/T6rviW34NGNQ0MMXF7C3VOgnp3wDbh7PhbAenlu
         oih/UTVDFSH6u1zIEC30SN2bSqUY2DPJ9psaoOk8lIgVrnpKB38I3Ir3j4mPtC3JIk6a
         2kPqp3peozyGYvl2ackMEvqUmQnJa6ZEZkN7Bw2PkkxJYDH7BaGaKyVPfLKCxvERXXev
         G/Q22Q/x2qvrP4r2xfTjWaFXoQV3OFGuGmTNFVk3ivEz/bIa7sJVl+/cMjO+r1MBs7/L
         UOBJOhfmv9OGhdVuw/d0nOBSonc15lI607PHZdwK30Ge4J2UMFSkaKwyd25wi6abbnQZ
         sAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBVmd5EBuoG1p2rO8goxDFKnI8VQNSUeodlC6Ty/jaXbf+iNZbnHZJaEItgcbEPAoFqw6BnpAC+oi7TSMSmvl7@lists.infradead.org
X-Gm-Message-State: AOJu0YzHfKEnlnETwDGrSNYOoE7uqNKDY6vUYpmJSE4fZOMUH9eifPhL
	/WsH0RXRvD3GetXREegy56p6P0YWpd8CkuNHQ1Chwki7YnwdtHyBmkGz9RFRbJQ=
X-Gm-Gg: ASbGncsYmZ6QF6DmIlMMvyQGLNqQFYM0mF3yq71PyTwX5iqSAuBKddVs2NzRIL0QrQR
	rIAxhahnAi9egnDtsHi4XW4SHT/lYDSm3tZC71fk9nkYxqvLIQVNlL9gReXnYmK+4vzUNG19cd5
	UYu053wXqCpqY0U8OZf9Wz62V8itDc7QYbGqAusoMPV9qZHDPRXgWtxhkpGNiqnLk93GIqADlhJ
	POZF5xRNcQRBwIY5EdGZ8RoBSZuMJSPhVwOFo2cEKMpJtVd/t1P7gCQzHeU/YFYc7RkXXelAbX2
	63hJDYb5rlpSR5BwtmNySIIWJM1DPMdzH+3ilUXukzHUCPWheAQ=
X-Google-Smtp-Source: AGHT+IGYG7m0T03TgljojHgEjhUKNwr/b12nUjKBhKn/d8sk3hJq1ietBujLlydEzb85jA5VfGNXkw==
X-Received: by 2002:a17:907:9406:b0:ac6:f6e2:7703 with SMTP id a640c23a62f3a-ad1a48bc5d9mr610686166b.8.1746458735844;
        Mon, 05 May 2025 08:25:35 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914733esm506520166b.33.2025.05.05.08.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:25:35 -0700 (PDT)
Date: Mon, 5 May 2025 17:25:33 +0200
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
Message-ID: <aBjYbXJL-GJe4Mh8@localhost.localdomain>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-8-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-8-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_082538_234417_EA4E2569 
X-CRM114-Status: GOOD (  16.00  )
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

On Tue 2025-04-22 14:31:49, Eugen Hristev wrote:
> Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
> to kmemdump.
> This will allow kmemdump to be able to dump specific log buffer areas on
> demand.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
>  }
>  EXPORT_SYMBOL_GPL(kmsg_dump_register);
>  
> +void kmsg_kmemdump_register(void)
> +{
> +	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
> +	kmemdump_register("prb", (void *)&prb, sizeof(prb));
> +	kmemdump_register("prb", (void *)prb, sizeof(*prb));

This looks strange. "prb" is a pointer to "struct printk_ringbuffer".
It should be enough to register the memory with the structure.

> +	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
> +			  sizeof(_printk_rb_static_descs));
> +	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
> +			  sizeof(_printk_rb_static_infos));

Also this looks wrong. These are static buffers which are used during
early boot. They might later be replaced by dynamically allocated
buffers when a bigger buffer is requested by "log_buf_len" command
line parameter.

I think that we need to register the memory of the structure
and 3 more buffers. See how the bigger buffer is allocated in
setup_log_buf().

I would expect something like:

	unsigned int descs_count;
	unsigned long data_size;

	descs_count = 2 << prb->desc_ring.count_bits;
	data_size = 2 << prb->data_ring.size_bits;

	kmemdump_register("prb", (void *)prb, sizeof(*prb));
	kmemdump_register("prb_descs", (void *)prb->desc_ring->descs,
			  descs_count * sizeof(struct prb_desc));
	kmemdump_register("prb_infos", (void *)prb->desc_ring->infos,
			  descs_count * sizeof(struct printk_info));
	kmemdump_register("prb_data", (void *)prb->data_ring->data, data_size);


But I wonder if this is enough. The current crash dump code also needs
to export the format of the used structures, see
log_buf_vmcoreinfo_setup().

Is the CONFIG_VMCORE_INFO code shared with the kmemdump, please?

> +}
> +EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
> +

Best Regards,
Petr

