Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D35FC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9vnjuLto9+1rU3NSYkM8aaoyxJ4wq394y7ayDcBF8ls=; b=syhkzWKEkHbPB2TOeW9hVfwbEr
	J38mB0Fb7Q44ia7M3YOWRQXx84AZmISXADGSyee7lw3E+xcu4cu+0PD6XKZNFwUPz8vtdnMkCgBd3
	NYRmoD+neWSR+OaRLzat5lhphfMMbwRbkesKc1P6pAMSj9QxHhSo6XhYcCLzZsl2QN5uZ0HDbAdJv
	aqnpf4+BHWb3h9lJjz0YvwHdoGuWfTljvWpRTRdxuINDkMvaJbKyQy/oQPUm66J2ztlLrNcnP3Hfl
	YB0YIWZ6VIMztBTBqBoNBMglz55VXfHBDpcV1zW6MGWyEGrcJebfopdRoRZlE8ioq1UP5ORIt9r8k
	u/HMO9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbK3-0000000Fcp0-0DaJ;
	Fri, 20 Jun 2025 12:58:23 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSavz-0000000Fa5m-0KWW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 12:33:32 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb2e9fd208so360304266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 05:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422809; x=1751027609;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vnjuLto9+1rU3NSYkM8aaoyxJ4wq394y7ayDcBF8ls=;
        b=IRzN8tIscTnagPNGuedkau8SF/6A+DTxLVAU2vOirHwpB91Ngar/Oo3wURFwBkokGI
         GNmaOQdqN0c/zJiJORP9s12Xc9m98Gpx/0YokoF05pghnS3ijnAwKbcqMs3OzseOfZoM
         YJm9AeDkOgYpQGX/ILVJmFnKWswMirOs130MOxSYeTYxDN7L9x7CBZ7QrvUACdsAC7cd
         hPGY1timr3t02uJHrQNcyq6fh36uRVr5taL4DOkdWhKEe91iGsP5ubv+RgzY9yaz5nUZ
         iQMrqDb/yuMwXPhps0fX4ko/QGrznnRRXzGBvSPEeLWse49pmLSGrLlpNIbAtW4mTiNR
         qNDw==
X-Forwarded-Encrypted: i=1; AJvYcCUJST6HYLDTyF/S9osBF9Y/K4pLBak5JypHDJWp4PUgXNIimu0/5YwkkAS3d3vXsJNZmV0Ke/g7MaquGGb2P+oE@lists.infradead.org
X-Gm-Message-State: AOJu0YxblSwpoH3rZ8Q5Am3sQbmDyXNlYu9rC75VNnivWzpv2w/h3Av0
	d+ZpFDN7il1btNcDDXXfs3k1ixOiR/nnf6yzd5KZ+QgZNvSQVXiOgLv1h7vjzw==
X-Gm-Gg: ASbGncshClfJ/W0cdujqGGl7y4XSH/AkpkyOoXgzuZB7jrn/SFMovBFQRFJ6PDos+IJ
	Jcfu9ELJ53CUNEtYD9U6++iZJ33KF8IUZQ0wqNpdsJ9UYpI+UcO5WvC9n/PZgkKGR5tpMc5nNyg
	rWm1rPrMEHU7egEXtmYoekEztpK9kck8/jA7NwPWHc+DoYksvqKWy2nXd+C+HBMo8EVdJsle3Vh
	IviWrHVLebQYN+m6XOy3kVHUOboCaHShgvaSm1mbr68206BCtHlImEsKXf+NT9JWlhJHUNIu/A6
	V0IUCb2uuMX2pree/45NZZo9CsmjjeFcj/htzWvEprtQx08NenBP
X-Google-Smtp-Source: AGHT+IHuGs4z676rtXsa4VQCGOlNjWawBsN9+d+XOo8McOfrrQWSyohD4H7xAjyWIB2rTyqyp8v7ow==
X-Received: by 2002:a17:907:d8f:b0:ad8:8c09:a51a with SMTP id a640c23a62f3a-ae0578f5642mr266573166b.4.1750422808480;
        Fri, 20 Jun 2025 05:33:28 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408303asm154565466b.83.2025.06.20.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:33:27 -0700 (PDT)
Date: Fri, 20 Jun 2025 05:33:22 -0700
From: Breno Leitao <leitao@debian.org>
To: kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, song@kernel.org,
	mark.rutland@arm.com, usamaarif642@gmail.com
Subject: arm64: BUG: KASAN: invalid-access in arch_stack_walk
Message-ID: <aFVVEgD0236LdrL6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_053331_116713_C686D9BF 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

I'm encountering a KASAN warning during aarch64 boot and I am struggling
to determine the cause. I haven't come across any reports about this on
the mailing list so far, so I'm sharing this early in case others are
seeing it too.

This issue occurs both on Linus's upstream branch and in the 6.15 final
release. The stack trace below is from 6.15 final. I haven't started
bisecting yet, but that's my next step.

Here are a few details about the problem:

1) it happen on my kernel boots on a aarch64 host
2) The lines do not match the code very well, and I am not sure why. It
   seems it is offset by two lines. The stack is based on commit
   0ff41df1cb26 ("Linux 6.15")
3) My config is at https://pastebin.com/ye46bEK9


	[  235.831690] ==================================================================
	[  235.861238] BUG: KASAN: invalid-access in arch_stack_walk (arch/arm64/kernel/stacktrace.c:346 arch/arm64/kernel/stacktrace.c:387)
	[  235.887206] Write of size 96 at addr a5ff80008ae8fb80 by task kworker/u288:26/3666
	[  235.918139] Pointer tag: [a5], memory tag: [00]
	[  235.942722] Workqueue: efi_rts_wq efi_call_rts
	[  235.942732] Call trace:
	[  235.942734] show_stack (arch/arm64/kernel/stacktrace.c:468) (C)
	[  235.942741] dump_stack_lvl (lib/dump_stack.c:123)
	[  235.942748] print_report (mm/kasan/report.c:409 mm/kasan/report.c:521)
	[  235.942755] kasan_report (mm/kasan/report.c:636)
	[  235.942759] kasan_check_range (mm/kasan/sw_tags.c:85)
	[  235.942764] memset (mm/kasan/shadow.c:53)
	[  235.942769] arch_stack_walk (arch/arm64/kernel/stacktrace.c:346 arch/arm64/kernel/stacktrace.c:387)
	[  235.942773] return_address (arch/arm64/kernel/return_address.c:44)
	[  235.942778] trace_hardirqs_off.part.0 (kernel/trace/trace_preemptirq.c:95)
	[  235.942784] trace_hardirqs_off_finish (kernel/trace/trace_preemptirq.c:98)
	[  235.942789] enter_from_kernel_mode (arch/arm64/kernel/entry-common.c:62)
	[  235.942794] el1_interrupt (arch/arm64/kernel/entry-common.c:559 arch/arm64/kernel/entry-common.c:575)
	[  235.942799] el1h_64_irq_handler (arch/arm64/kernel/entry-common.c:581)
	[  235.942804] el1h_64_irq (arch/arm64/kernel/entry.S:596)
	[  235.942809]  0x3c52ff1ecc (P)
	[  235.942825]  0x3c52ff0ed4
	[  235.942829]  0x3c52f902d0
	[  235.942833]  0x3c52f953e8
	[  235.942837] __efi_rt_asm_wrapper (arch/arm64/kernel/efi-rt-wrapper.S:49)
	[  235.942843] efi_call_rts (drivers/firmware/efi/runtime-wrappers.c:269)
	[  235.942848] process_one_work (./arch/arm64/include/asm/jump_label.h:36 ./include/trace/events/workqueue.h:110 kernel/workqueue.c:3243)
	[  235.942854] worker_thread (kernel/workqueue.c:3313 kernel/workqueue.c:3400)
	[  235.942858] kthread (kernel/kthread.c:464)
	[  235.942863] ret_from_fork (arch/arm64/kernel/entry.S:863)

	[  236.436924] The buggy address belongs to the virtual mapping at
	[a5ff80008ae80000, a5ff80008aea0000) created by:
	arm64_efi_rt_init (arch/arm64/kernel/efi.c:219)

	[  236.506959] The buggy address belongs to the physical page:
	[  236.529724] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x12682
	[  236.562077] flags: 0x17fffd6c0000000(node=0|zone=2|lastcpupid=0x1ffff|kasantag=0x5b)
	[  236.593722] raw: 017fffd6c0000000 0000000000000000 dead000000000122 0000000000000000
	[  236.625365] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
	[  236.657004] page dumped because: kasan: bad access detected

	[  236.685828] Memory state around the buggy address:
	[  236.705390]  ffff80008ae8f900: 00 00 00 00 00 a5 a5 a5 a5 00 00 00 00 00 a5 a5
	[  236.734899]  ffff80008ae8fa00: a5 a5 a5 00 00 00 00 00 00 a5 a5 a5 a5 a5 00 a5
	[  236.764409] >ffff80008ae8fb00: 00 a5 a5 a5 00 a5 a5 a5 a5 a5 a5 00 a5 a5 a5 00
	[  236.793918]                                                     ^
	[  236.818810]  ffff80008ae8fc00: a7 a5 a5 a5 a5 a5 a5 a5 a5 00 a5 00 a5 a5 a5 a5
	[  236.848321]  ffff80008ae8fd00: a5 a5 a5 a5 00 a5 00 a5 a5 a5 a5 a5 a5 a5 a5 a5
	[  236.877828] ==================================================================

