Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47FAC83F0B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L63cfSvnDXH9DB4EgrgFoF//uYH+DmeGPIriamKHA+0=; b=I4c06kjdy4sCZuiHlZmwwn7Ak5
	rvNf+57DieBe0Ce9ZY64ZPTVTQGwnkAKjEVyA5INCoCedII4uy+VHJTs/X0FD9Ke7fEwqJZWS/TT0
	GDieG7PHxcrKhtzfKFyM1y24vXUf5IMevU/tejC+nvcOsIyl+K4U8wsnDg19ozvA+GCoWsvCR0o15
	RW/m4WZvgcsX3VC1AJeseF0PyPvwCw3meGRoCu+VgyvZ0Zl80w3baqK8uYcCgXfCCuOnk7MvkckMp
	OwimdTPxEWrukPet4lqtryi8TOBFOoYThOrbt4plbCNg5Orbvvf+jfK3jC1C6JFZ79CquAZqkIRDx
	bRXX+Izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZJ-00000009ANi-3Nl5;
	Wed, 02 Jul 2025 17:48:25 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0yZ-000000095iL-1OWA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:10:28 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so11526060a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 10:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476225; x=1752081025;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L63cfSvnDXH9DB4EgrgFoF//uYH+DmeGPIriamKHA+0=;
        b=KnjcdwBpWjL6fzmKvgpsAFgQ6mW8B4bDCuNuLNB1S0vPV3xHZv673EQqfLfAdtesZf
         PBrivrXMLrFj5WrpWIr7mhqbmcORO4rdNdBldPOFLpHCjvKc2XseOUmBDlQMPFC8yayB
         rtLjB8GY5GfKFEsUGea7RN+2fvw469NAfbjzm7tL1xZZgjYGSE+ibODq8ko25lk9Tahe
         03Q9PGzmCVMmRiSFUjyf+9qplaAYdihm5VnE9gfK/0/l9VMQHuHrnOdI5xP1ePoQyr4t
         FOgh4cOQQNO0tFfr6x7cEWEz4cEwv3cBgPHt39RH4VuH9/cUipIQi1lO8vatxyeWh82t
         7nMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6l81AP4693MgQy9CftPH2XG1P/I6MaJ9+PKWxt2yI3wPPS42ziMWTXgGYec+G7jG9tHB8KwkKXHMDR/WBFUh8@lists.infradead.org
X-Gm-Message-State: AOJu0YyftbLoqf2pizMfAsJ9j1xQ+GYCPdjVFQQa43J+bLskDnZA6nOt
	1dI41+Am1qiJ4BruJ6H2T2jM1bXvH1ZaXhjCV1IzI6RTPbrvbNHc6rzE
X-Gm-Gg: ASbGncvlQVQGJ3qZJ7NuyNsn8imczcwu1S00yiq45jExABbu9m/oFWUMxEoRZO41u8y
	lGLgJZNcmto4GFgcdMOWy4wLpDBG6M67/4CzXEyQ2sUyN+BfZ/JhOgPvSpDLx8KxfCf3oiuUyVb
	NzTiA8zXkWLCuB0KJF3WjRhOGDn1TUdmsRjypU+QDuEdEHu9jp4zXh5yR7XmWNu/1Cua20t98jn
	zNov4+jFTRntUNAIyQosGN4WLAva61t8iRKGrOmlkPTbLHOLqUghZ+v8hrXJ+qLFmTlt3bHJgxO
	646p61N4K4zrkz+/iQ1TpquzQuTRBEHlASfyy59o71LbjigjtKmvtIyYj0Rw+hk=
X-Google-Smtp-Source: AGHT+IGnC3lQFbafqaLA6sanJmrlJcYjRCas5njjZkxtyABSR4KndYWH+LDFo8yq2ojKT8y+ZX4gmw==
X-Received: by 2002:a17:907:e895:b0:ad8:9257:5727 with SMTP id a640c23a62f3a-ae3c2dca4efmr400653366b.51.1751476225007;
        Wed, 02 Jul 2025 10:10:25 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a75fsm1112854566b.67.2025.07.02.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:10:24 -0700 (PDT)
Date: Wed, 2 Jul 2025 10:10:21 -0700
From: Breno Leitao <leitao@debian.org>
To: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, mark.rutland@arm.com,
	catalin.marinas@arm.com, linux-serial@vger.kernel.org
Cc: rmikey@meta.com, linux-arm-kernel@lists.infradead.org,
	usamaarif642@gmail.com, leo.yan@arm.com,
	linux-kernel@vger.kernel.org, paulmck@kernel.org
Subject: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <aGVn/SnOvwWewkOW@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_101027_369558_3FB4916A 
X-CRM114-Status: GOOD (  13.01  )
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

Hello,

I'm observing two unusual behaviors during the boot process on my SBSA
ARM machine, with upstream kernel (6.16-rc4):

1) A 9-second pause during early boot:

	[    0.000000] ACPI: SPCR: console: pl011,mmio32,0xc280000,115200
	[    0.420120] Serial: AMBA PL011 UART driver
	[    0.875263] printk: console [ttyAMA0] enabled
	[    9.848263] ACPI: PCI Root Bridge [PCI2] (domain 0002 [bus 00-ff])

2) Occasional CSD lock during early boot:

Intermittently, I encounter a CSD lock. Diagnosing this was challenging, but
after enabling PSEUDO NMI, I was able to capture the stack trace:

	printk: console [ttyAMA0] enabled
	smp: csd: Detected non-responsive CSD lock (#1) on CPU#0, waiting 5001000000 ns for CPU#02 do_nothing (kernel/smp.c:1058)
	smp:     csd: CSD lock (#1) unresponsive.
	Sending NMI from CPU 0 to CPUs 2:
	....
	pl011_console_write_atomic (./arch/arm64/include/asm/vdso/processor.h:12 drivers/tty/serial/amba-pl011.c:2540) (P)
	nbcon_emit_next_record (kernel/printk/nbcon.c:1030)
	__nbcon_atomic_flush_pending_con (kernel/printk/nbcon.c:1498)
	__nbcon_atomic_flush_pending (kernel/printk/nbcon.c:1541 kernel/printk/nbcon.c:1593)
	nbcon_atomic_flush_pending (kernel/printk/nbcon.c:1610)
	vprintk_emit (kernel/printk/printk.c:2429)

On reviewing the amba-pl011.c code, I noticed that each message being flushed
causes the following loop to iterate roughly 20,000 times:

          while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
                  cpu_relax();

Tracing this, I found that flushing early boot messages is taking a significant
amount of time. For example, trace_printk() output from that function shows:

       swapper/0-1       [000] dN...     9.695941: pl011_console_write_atomic: "[    0.928995] printk: console [ttyAMA0] enabled"
											|
       											-> This is trace_printk of wctxt->outbuf

At timestamp 9.69 seconds, the serial console is still flushing messages from
0.92 seconds, indicating that the initial 9-second gap is spent looping in
cpu_relax()—about 20,000 times per message, which is clearly suboptimal.

Further debugging revealed the following sequence with the pl011 registers:

	1) uart_console_write()
	2) REG_FR has BUSY | RXFE | TXFF for a while (~1k cpu_relax())
	3) RXFE and TXFF are cleaned, and BUSY stay on for another 17k-19k cpu_relax()

Michael has reported a hardware issue where the BUSY bit could get
stuck (see commit d8a4995bcea1: "tty: pl011: Work around QDF2400 E44 stuck BUSY
bit"), which is very similar. TXFE goes down, but BUSY is(?) still stuck for long.

If I am having the same hardware issue, I suppose I need to change that logic
to exist the cpu_relax() loop by checking when Transmit FIFO Empty (TXFE) is 0
instead of BUSY.

Anyway, any one familar with this weird behaviour?

Thanks
--breno


