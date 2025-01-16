Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BCCC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 17:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cw8bDVhWC4DZ7iFBTJuoMnPRKeQXkQkpwuO4pmzE3V0=; b=dHB/c15utz6P0VRT6nT7p4t7G6
	+77IqS1I+cxj9MnjKfM2kq+z0W2+TwVOMPB69dkwfB1PCU6XpivRiVlIcJQzjR6CYh69QHDXE3JT9
	SmbW2leBTGDn4ILFpciQ9IChBwa+N/a9ppdzXlXiAunAs1nYl4pI5H6AjOjn85mGnYUW0GTE4sgrh
	pnp9f2voML2VxYXrebDENUxJuYYN3SQpRbusQA7iEFv55R+mun4tReHakMsRw7H1+zGzuWY6ek9if
	jQTcTUbJ1HN1KFWJwkJXK1YBDQuFQeRByO2yBeMk2I/6xcYtLbabxRD8aXxcPJRtabTiykyw1H0ii
	peCli77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTRY-0000000FeUL-1xTH;
	Thu, 16 Jan 2025 17:14:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTQI-0000000FeMG-3X1a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 17:12:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43618283d48so7854725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 09:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737047568; x=1737652368; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw8bDVhWC4DZ7iFBTJuoMnPRKeQXkQkpwuO4pmzE3V0=;
        b=hi87VPaw/PvJgs9vNn0RrOf/wegzPOtlTWDfw5Oj/0XXmmFdP4QrkmMVA3xHoM7GIh
         KHwhwLCXcZ2POfribeskHOk4aqunhSX1EdocIg8AjtSkzQMpRy3AZQfBbGt9dfvxX6u8
         0hJwZuS/Cn++9FXNXKjXXUWIyz6nnD0bOpeQN/lGDODWPc35VX1jhFyH3naUonpcD94O
         KicddaPSY2sSj4UeRkm6bdymXMdonApTevd3TF4tn8G7qA89c7onfOmtYzUpFTapgwGH
         DyPlmps+vpWR/kAlybXFcIPNMGRh9icwGfdIMozsTF99qjLNP1crC5dQeD2PalP5RzqW
         NiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737047568; x=1737652368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw8bDVhWC4DZ7iFBTJuoMnPRKeQXkQkpwuO4pmzE3V0=;
        b=l15fJJCSLRtuPVCQmipkJ+cVj6f8PYmH9rFkp0pDgnRFjXQaZ7hvg8C0uC3O43hHzv
         /xI4tP4wiw1k9Lc1O98dyeCtaKDE3bjhYL0xMDw2R8Wb3l2hfeTBsXYU0pLWLPQMT1QY
         +FzyHjmr4AWSKZaIUUFB02lM8u/k0oYI6pPTSkq2zxrZgJzfj+SnA+B6qHMdKTParpkq
         HgFl6E3i1ZHnubtUIn7xsmpmwXx20nhtqBGQuKKUpBwayQHDslfayeZWdxk6ADUiyMp4
         4zzltYDRZF3aYqIMP0In8V5tD5X/xj49HDSCL1uelPrgxRRklPLitjF40Yhfdv8M+03H
         3u2A==
X-Forwarded-Encrypted: i=1; AJvYcCWA6/4txqckHxxGlcJFsAFJKYOX/MMbmlUHtKFPlOpSRr0DMUvimoB/kv2uIJ2Bv9Loxvb6U5u9n4b+MI2mGW5k@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6AQKwXwgph+zLQ0HtBt1/Ow2Fm0euAygoR7No+02kK6BMQ+sk
	/jamnRjGove0lJQ4NALLPdGMFW95eNcDxjinW5GXi/kuwWjdX9hGmtKm1MgV
X-Gm-Gg: ASbGncv01cpIdcFvloZeaXV2nCBKV4TAmph2vwusFf8Ov2YlLBS7OQa3Kx+WHmISc7h
	wmXy21DTGnlcBW9xdY2nVnZZww64QDq30F4/6A6olMCAkDXSsVkLDX/HQ9zGr2jA8kjNtFJMp1W
	BEjcOrLGsY21jDol/K6IEmAw8oZjWXQP05BgfBMtrkm4I4GiszR3nMcIbPxUui+QIKPfcNdv84e
	I6kLPdzivRj1WgANgzZEwo06GVTHJAsTJXCvIDxrbuLyeSdymAKTiR0
X-Google-Smtp-Source: AGHT+IGtLGwyml6Hx0in5ut9hFjk73RQS7czX4FZAK2dgjkWdVTUUYWRBke716qnI3YVynil/kPGPA==
X-Received: by 2002:a05:600c:138e:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-436e26f5f3fmr348174505e9.30.1737047567988;
        Thu, 16 Jan 2025 09:12:47 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:6c4e:8d77:c1b7:309e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm64609915e9.33.2025.01.16.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:12:47 -0800 (PST)
Date: Thu, 16 Jan 2025 18:12:46 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, shivamurthy.shastri@linutronix.de,
	anna-maria@linutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/irq-mvebu-icu: Fix irq_set_type for sei and
 nsr
Message-ID: <Z4k-DkMt8XQYs_kf@eichest-laptop>
References: <20241217111623.92625-1-eichest@gmail.com>
 <87frlkcx2b.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frlkcx2b.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_091250_883878_A95D4C87 
X-CRM114-Status: GOOD (  30.88  )
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

Hi Thomas,

On Wed, Jan 15, 2025 at 09:15:24AM +0100, Thomas Gleixner wrote:
> On Tue, Dec 17 2024 at 12:15, Stefan Eichenberger wrote:
> > A regression was introduced in commit d929e4db22b6
> > ("irqchip/irq-mvebu-icu: Prepare for real per device MSI") that causes
> > the Armada thermal driver to fail during probe with the following error:
> > genirq: Setting trigger mode 4 for irq 85 failed (irq_chip_set_type_parent+0x0/0x34)
> > armada_thermal f2400000.system-controller:thermal-sensor@70: Cannot request threaded IRQ 85
> > armada_thermal f2400000.system-controller:thermal-sensor@70: probe with driver armada_thermal failed with error -22
> >
> > The issue occurs because irq_set_type is assigned to
> > irq_chip_set_type_parent, but the parent IRQ chip does not implement the
> > irq_set_type operation. This causes the trigger mode configuration to
> > fail.
> >
> > This patch resolves the issue by removing the irq_set_type assignment.
> > With no irq_set_type, __irq_set_trigger safely skips the trigger
> > configuration, restoring functionality to the thermal driver.
> 
> I'm not convinced that this is correct.
> 
> The original code had irq_chip_set_type_parent() for the NSR/SEI chips
> too and all what d929e4db22b6 does is to convert those chips over to the
> new platform MSI mechanism. Here are the original chips:
> 
> static struct irq_chip mvebu_icu_nsr_chip = {
> 	.name			= "ICU-NSR",
>         ...
> 	.irq_set_type		= irq_chip_set_type_parent,
>         ...
> };
> 
> static struct irq_chip mvebu_icu_sei_chip = {
> 	.name			= "ICU-SEI",
>         ...
> 	.irq_set_type		= irq_chip_set_type_parent,
>         ...
> };
> 
> And looking at the potential platform MSI providers for MVEBU, then it
> turns out that GICP and SEI both have the irq_set_type() callback
> populated, though ODMI has not. So either this has never worked or there
> is something else fishy.
> 
> Can you please enable CONFIG_GENERIC_IRQ_DEBUGFS, build/boot a 6.10
> kernel and provide the output of
> 
> cat /sys/kernel/debug/irq/irq/$N
> 
> where $N is the interrupt number of the thermal sensor.
> 
> Then provide the same information for a current kernel with your patch
> applied.

You are right I somehow didn't look back far enough. I tested once with
kernel 6.12.5 and my patch applied:
root@localhost:~# uname -a
Linux localhost.localdomain 6.12.5+ #157 SMP PREEMPT Thu Jan 16 17:32:21 CET 2025 aarch64 GNU/Linux
root@localhost:~# cat /proc/interrupts |grep thermal
 35:          0          0          0          0    AP SEI  18 Level     f06f8000.system-controller:thermal-sensor@80
 90:          0          0          0          0  SEI-ICU-SEI-f21e0000.interrupt-controller:inter 116 Edge      f2400000.system-controller:thermal-sensor@70
 91:          0          0          0          0  SEI-ICU-SEI-f61e0000.interrupt-controller:inter 116 Edge      f6400000.system-controller:thermal-sensor@70
root@localhost:~# cat /sys/kernel/debug/irq/irqs/90
handler:  handle_edge_irq
device:   f21e0000.interrupt-controller:interrupt-controller@50
status:   0x00000000
istate:   0x00004000
ddepth:   0
wdepth:   0
dstate:   0x02400204
            IRQ_TYPE_LEVEL_HIGH
            IRQD_ACTIVATED
            IRQD_IRQ_STARTED
            IRQD_DEFAULT_TRIGGER_SET
node:     -1
affinity: 0-3
effectiv:
domain:  :cp0:config-space@f2000000:interrupt-controller@1e0000:interrupt-controller@50-16
 hwirq:   0x74
 chip:    SEI-ICU-SEI-f21e0000.interrupt-controller:inter
  flags:   0x80
             IRQCHIP_SUPPORTS_LEVEL_MSI
 parent:
    domain:  :ap807:config-space@f0000000:interrupt-controller@3f0200-2
     hwirq:   0x0
     chip:    CP SEI
      flags:   0x0
     parent:
        domain:  :ap807:config-space@f0000000:interrupt-controller@3f0200-5
         hwirq:   0x15
         chip:    SEI
          flags:   0x0

And then with kernel 6.10.14 without any patches:
root@localhost:~# uname -a
Linux localhost.localdomain 6.10.14 #1 SMP PREEMPT Thu Jan 16 17:52:59 CET 2025 aarch64 GNU/Linux
root@localhost:~# cat /proc/interrupts |grep thermal
 35:          0          0          0          0    AP SEI  18 Level     f06f8000.system-controller:thermal-sensor@80
 90:          0          0          0          0   ICU-SEI 116 Edge      f2400000.system-controller:thermal-sensor@70
 91:          0          0          0          0   ICU-SEI 116 Edge      f6400000.system-controller:thermal-sensor@70
root@localhost:~# cat /sys/kernel/debug/irq/irqs/90
handler:  handle_edge_irq
device:   (null)
status:   0x00000001
istate:   0x00004000
ddepth:   0
wdepth:   0
dstate:   0x02400201
            IRQ_TYPE_EDGE_RISING
            IRQD_ACTIVATED
            IRQD_IRQ_STARTED
            IRQD_DEFAULT_TRIGGER_SET
node:     -1
affinity: 0-3
effectiv:
domain:  :cp0:config-space@f2000000:interrupt-controller@1e0000:interrupt-controller@50
 hwirq:   0x74
 chip:    ICU-SEI
  flags:   0x0
 parent:
    domain:  :ap807:config-space@f0000000:interrupt-controller@3f0200-4
     hwirq:   0x505a
     chip:    SEI pMSI
      flags:   0x0
     parent:
        domain:  :ap807:config-space@f0000000:interrupt-controller@3f0200-2
         hwirq:   0x0
         chip:    CP SEI
          flags:   0x0
         parent:
            domain:  :ap807:config-space@f0000000:interrupt-controller@3f0200-5
             hwirq:   0x15
             chip:    SEI
              flags:   0x0

It seems with kernel 6.10 the controller device was not set correctly,
probably it was ignoring irq_set_type because of this. Do you by chance
have an idea how to properly fix this or should I do some more research?

Thanks and regards,
Stefan

