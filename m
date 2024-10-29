Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC209D2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EbuUSE5KcCm27ppVhjAjLYAU0VIxIDBAfXEwSnPUGW4=; b=pnyT/+fcP1nK+OYiEbqrvf3UI8
	oOp6IVVWEitHQPY63oKWNSDlFbpSe4+JrorSkSk/V8WYcZgO9juauEKhJDfI2AAXQFVyW3DvKnGYA
	ICXqfzaGkSQ3tI/ohneMQ1YoMjFd8hug1QJsHZce1CdEgm2i6iLBHCXgIy6UE+9+xv8AJG2N1WRf9
	fLDrtDlKMLxcWjloPhV6+zrYoLQSZhvpIJgaoLUAJaOjF7GNRznfcNgf8KjDOHx5kTphA2iI6Ebsj
	bQLkVi5ghiKM1U5uCGBWlRuhwmqmwiYT6HVglcz9XFlrZ/noy96Gpxc9w0q6VMXfzPjUfFWKk0Xvu
	VfxyGvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5moD-0000000Efbf-38vb;
	Tue, 29 Oct 2024 14:02:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lfN-0000000ET4U-0gFQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 12:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EbuUSE5KcCm27ppVhjAjLYAU0VIxIDBAfXEwSnPUGW4=; b=TvY2mxsfs/33UqndRGWkWBb38M
	UowWsx6VsmUiarJzLeTmxeNBqLdquj/52ZNKM48j1dF2HSP83AE0Nwk5B0uGfNb1W04iKMR8BY3qA
	/TQXwQC/jHEkhqCr29pwXB1SqtHD00Z76RepjOvJ3IvmuhDVzQsXyDt5foJz2vg3tt4IaxAnybfuJ
	tOtOQGcUOs2a6iX0+AVIdnkw6qe7wuAuJmQS/ouUdxN/UyKD6LH02t2YDxXFbvrpyGJGws83W4XA8
	2vh32mhmHGu++ediUiz2Wg5lgA9VEgJuZQjqEYmwm8eGhE2e6m+va7pUrPHqzXymPuVR+FGsgJpN9
	7HvnrbiA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lfJ-00000009th9-0NDv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730206170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EbuUSE5KcCm27ppVhjAjLYAU0VIxIDBAfXEwSnPUGW4=;
	b=REvsEzEN8MNjmizsxJsVVnmp1245O1yhovmzjCfb5U3K0skb4nVV17nJgNJMvy0T/VPk3s
	X0l4+4m8MOdND4v5kVz14JvXjWdZI/29LFnl4bERWckjADQS60/6VQy+t354Yj+VPyDKUA
	V9/IPFgr0diXkTKVeeJrui4mYBKJ+SI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730206178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EbuUSE5KcCm27ppVhjAjLYAU0VIxIDBAfXEwSnPUGW4=;
	b=A33XPC5iySz+ztgp3pk0ado46O783DQ2FUdT8YyLspfcgCRpvxGDPfxh2h4FdtSWpAFrBY
	Rnwp7NnJnPneBA1WId46MwsHD7gu1Zdb4U9TWUHRhCWD4t6O2fQS3CkbxclxveGRL7hjC2
	W47ZYWxcLzrpry2AZIRfkhX7IIgBOUw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-np0esHEVPNaIcCuy79SlIA-1; Tue, 29 Oct 2024 08:47:52 -0400
X-MC-Unique: np0esHEVPNaIcCuy79SlIA-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3e5f78786cbso5087433b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 05:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730206072; x=1730810872;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbuUSE5KcCm27ppVhjAjLYAU0VIxIDBAfXEwSnPUGW4=;
        b=eHYaBGiyBHYz+1ZcbCYhTGNlV7E2qxnuU18tiGdRH79L1hidvx9Nl64AwtKRcbhns1
         wiq0TtASRLFcTDTGyHDQsdyfeilog5jiLM7MGCsktxPQsovYI38OyNr4xEiyvjBMSD1s
         X6hH2jZQYuhP4Amd7wFttTjTvxNwyDjMN6MbsLF8RUb++zImyJVgY2ekw3xIltyfqG5Q
         LNNW3MqBP89rq4NUc61URt4PuIsjAUI0AgjLXJLPLMStnZ5jMXqfMpidPogNLSTJiFsJ
         CA1L01pPHIx0VU+BjxaZId2KODZdF0Hf9Gox2H0Q7inThTAapMJzYeQbiHHf8Kld4wj+
         axqg==
X-Forwarded-Encrypted: i=1; AJvYcCX5SQXwonUJbdFRcF6cO7cmzatL77BxdQoLDxlBujIZv5AuAegL1niyswZAyzdkfCQdrUKqbSBccLh6sbGyt1Wv@lists.infradead.org
X-Gm-Message-State: AOJu0YypryktHUOmNxJj70gggWJzhXPhCSyAuUr43vj4cacuYTQ/sLIM
	rn1Fr/mFusbtfsSxvoKVY2NMhTzRRHbbD22E10Uy6qlbGMMZmf9I+XRrPVYknQ193SWqheZdurn
	N/UYICtraW5sWC6oc0hWT1GXesA3HWcTy/MJw1IHEAHrB+qWE0tVZQ46aI36cn/utnc8ED2FOT/
	iL09ydBoiqNW+8Z5kV0p6bqxvS/BiUvIz1QLVZ5A5m3LS4P18=
X-Received: by 2002:a05:6870:6492:b0:287:34a7:af9a with SMTP id 586e51a60fabf-29051b42ca7mr10065720fac.12.1730206071756;
        Tue, 29 Oct 2024 05:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGullmtDNvLggb0posTyl72I5gQMZg4uFkt5/3Q4PT0/o7RmIsjEZWTmMYwwGz2rk0gHm+c5JJemVCxqvaEIAQ=
X-Received: by 2002:a05:6870:6492:b0:287:34a7:af9a with SMTP id
 586e51a60fabf-29051b42ca7mr10065696fac.12.1730206071455; Tue, 29 Oct 2024
 05:47:51 -0700 (PDT)
MIME-Version: 1.0
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 29 Oct 2024 13:47:23 +0100
Message-ID: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
Subject: [bug] aarch64 host no longer boots after 767507654c22 ("arch_numa:
 switch over to numa_memblks")
To: rppt@kernel.org, ziy@nvidia.com, linux-mm@kvack.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Jonathan.Cameron@huawei.com, dan.j.williams@intel.com, 
	David Hildenbrand <david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_124941_438541_CDCA90EA 
X-CRM114-Status: UNSURE (   5.80  )
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

Hi,

I'm seeing a regression on Nvidia IGX system, which no longer boots.

bisect points at commit 767507654c22 ("arch_numa: switch over to numa_memblks").
It hangs very early, with 4k or 64k pages, with no kernel messages printed:

EFI stub: Booting Linux Kernel...
EFI stub: Using DTB from configuration table
EFI stub: Exiting boot services...
<hangs here>

Here's a log from successful boot with previous commit:
https://people.redhat.com/jstancek/aarch64_numa_boot/console-log-good.txt
and config: https://people.redhat.com/jstancek/aarch64_numa_boot/config

# lscpu
Architecture:             aarch64
  CPU op-mode(s):         32-bit, 64-bit
  Byte Order:             Little Endian
CPU(s):                   12
  On-line CPU(s) list:    0-11
Vendor ID:                ARM
  BIOS Vendor ID:         NVIDIA
  Model name:             Cortex-A78AE
    BIOS Model name:      Not Specified Not Specified CPU @ 0.0GHz
    BIOS CPU family:      257
    Model:                1
    Thread(s) per core:   1
    Core(s) per cluster:  12
    Socket(s):            1
    Cluster(s):           1
    Stepping:             r0p1
    CPU(s) scaling MHz:   100%
    CPU max MHz:          1971.2000
    CPU min MHz:          115.2000
    BogoMIPS:             62.50
    Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32
atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcpc
flagm paca pacg
Caches (sum of all):
  L1d:                    768 KiB (12 instances)
  L1i:                    768 KiB (12 instances)
  L2:                     3 MiB (12 instances)
  L3:                     6 MiB (3 instances)
NUMA:
  NUMA node(s):           1
  NUMA node0 CPU(s):      0-11
Vulnerabilities:
  Gather data sampling:   Not affected
  Itlb multihit:          Not affected
  L1tf:                   Not affected
  Mds:                    Not affected
  Meltdown:               Not affected
  Mmio stale data:        Not affected
  Reg file data sampling: Not affected
  Retbleed:               Not affected
  Spec rstack overflow:   Not affected
  Spec store bypass:      Mitigation; Speculative Store Bypass
disabled via prctl
  Spectre v1:             Mitigation; __user pointer sanitization
  Spectre v2:             Mitigation; CSV2, BHB
  Srbds:                  Not affected
  Tsx async abort:        Not affected

Regards,
Jan


