Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69650C55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73+Vcs8356c8UcX6JzaxNcxmLM11GF7IimgXsgpettQ=; b=iN/wjVSe/hpIVHqfbe8Rbq39f9
	cs7/1RZMHPPNq3JMt74EsluPXQ9mxO9jGvLoRhOWXz1kz+HslRpWhtVnmsHMJLhAlW/ah72sGzlby
	Pw7f1GGSlh3W/biS3DSkOfktnE0MMwrZQOL2gS7ffU8PEnMbSRu5/1Ho+gMJc/+FG+yPVo7JyLKKq
	NvZIyj9dI0eP/eIUBIBNP7++XGcsceZgyqj5yLacz0EFAACwMCVFWLXDoBG3oAVGBW5zqVy+1YBu2
	NnwSetGmoKBoc1UR1Bxh0qGo8Q7+r3GOGY+l4j0FlOU2qYNEyJKtrUkxqoRz4EYC3iOX2jl/8yZIB
	s4iuP+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5qH-00000000uzn-1Sbj;
	Tue, 04 Aug 2026 03:29:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5qD-00000000uzP-2WjM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785814158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73+Vcs8356c8UcX6JzaxNcxmLM11GF7IimgXsgpettQ=;
	b=Epn5pP1uyec3eevHSuUrGxyNwAHsOIkalfbawJ8avoXm9Y06rrkGNgIjnDA/+VGHOnSpYj
	FReSE1DaJR8QQuQuYBpgI34pYySJnBd8wtXgeLfIB6Fxgk2S5VWHFaGXrVbIOHXTNAavaD
	RLeEY11ZHi0dSjFVG6nYy+6aFy41DdM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-z0N9tb3yMsqu7oNNfKx9zA-1; Mon, 03 Aug 2026 23:29:17 -0400
X-MC-Unique: z0N9tb3yMsqu7oNNfKx9zA-1
X-Mimecast-MFC-AGG-ID: z0N9tb3yMsqu7oNNfKx9zA_1785814156
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so4013526a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814156; x=1786418956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73+Vcs8356c8UcX6JzaxNcxmLM11GF7IimgXsgpettQ=;
        b=rTgDH785sUuIRn07IfJvT2n9uUadMCMAJabKuEJX5h0TAyYQK+vH5CP0kdsjYqgYgj
         /OZQU4QanDF4JvZ4/fcxkt7rdk03cuTOB+yV1YidNUvn5HLNVgO5Ihw13pXz9kDKUea9
         f9dVPpMgvkCTjqpToirU0S3jbftqAttqJMUfiPPOPi8SZ0rQ1M6siqA6RZa5zXDazX69
         ApF/qop/AS7xyS/keJg+204JRRZ3A4g2QBMzOoMZZbzmtaWwhdnMAM0PQYKYeMXkmPbu
         sjHVxRZlqgqsWIkx2Vat8cCREr5BFXnOXKjI/Oot+EnSlXLwKgj6fppzm/79oSGaQJPK
         EqJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEkOKhCwKCx3Ppg4vXdkdyjCGHbzyFTrPXzOZuFabBurfqCyg7i6dBaIwolCIfToqh7QcPJGFPkcVihLYGqTxs@lists.infradead.org
X-Gm-Message-State: AOJu0YxiXNvQ8Sz+PXHnrHk/oNVQX6f/t6turuvr20Nn5R+TYlNGojT0
	Vy0JYvAXcY1Kk+KLOjSvqux5/efX9V5oMvMQg6JmZc1VvHq2wCl4qFL1ASh+jwcwkUW4A+Jgntc
	vTcaCHg2LN/XFvo4dOBFiBgWd5Gezew2k+sua0303+ebUS17QRttLWJOQ079o7Vnh8zpZEx60vJ
	T1
X-Gm-Gg: AR+sD10SVY4RF7ghBWUDYPCmEMBmYtK40EKbkgXf0F/UiwRjan9+witPC6LbFLfplcH
	NrclLqzeJPj2gGG6Je4K1MDdjAfGmaDMg/FR4CeIq7e51to9JEKnvWWLuzgchxfyvVhsYky4jbk
	MiU5JOXLrKmFSxLTojeLAppiUSzXT83J6NOk4j/afX7GDRCiWoSZdcRa9fWk3OjPscr2SGzScaM
	4Uyy1067B71FqXKCw571F0mYp5MB55L0sykQ7bLiWpfIVpE7rLM6CFrc2WP6eiiaAADUZsaaTuG
	SDCAxNtsB0WzvUMoau0GawaLOvjvG2EGYzD7mT2du+jNRem79l2djZwfOo8B5yY0wpN1haGlNhJ
	e5Kvx89nom87ZkW8txnYhrHU1tVTD7BMsjWl9f29fNUk=
X-Received: by 2002:a17:90b:1b01:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38fbc548a91mr11429656a91.34.1785814155909;
        Mon, 03 Aug 2026 20:29:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38fbc548a91mr11429629a91.34.1785814155373;
        Mon, 03 Aug 2026 20:29:15 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm57772486eec.16.2026.08.03.20.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:29:14 -0700 (PDT)
Message-ID: <6f8bc358-91a0-4c44-9110-c071e10df385@redhat.com>
Date: Tue, 4 Aug 2026 13:29:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/11] arm_mpam: Add MPAM-Fb firmware support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-1-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E9GT4HgMbNidvhgDQhN1YALxyFefnItYuybt8OrNQTU_1785814156
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_202921_719678_BA168F2A 
X-CRM114-Status: GOOD (  37.85  )
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

On 8/1/26 3:03 AM, Andre Przywara wrote:
> v7 is another quick respin of the MPAM-Fb code, for firmware based MSC
> accesses. This propagates MSC access errors in a function where it was
> missing before, covering more functions that pass their return value
> to userspace (new patch 07/11). Also some bug fixes, formatting
> adjustments and adding the accumulated tags - many thanks to the
> reviewers. Find the changelog below. Based on v7.2-rc1.
> 
> =======================
> The Arm MPAM specification defines Memory System Components (MSCs),
> which are devices that are programmed through an MMIO register frame. In
> some occasions this turned out to be too limiting: the MSC might be
> located behind a separate bus system (for instance inside an on-board
> controller), it might be mapped secure-only, or in a different processor
> socket without direct MMIO mapping. Also the MMIO access might be too slow
> or it would need to be filtered or otherwise access controlled. Finally
> there might be bugs in the MSC integration, which require a mediating
> firmware to be accessible.
> 
> To accommodate all those different use cases, the MPAM-Fb specification
> [1] describes an alternative way to access MSCs. Accesses to an MSC
> would be wrapped in a message and communicated to the system using a
> shared-memory/mailbox system mostly mimicking the Arm SCMI spec.
> For ACPI systems, this would be abstracted through an ACPI PCC channel,
> which provides the shared-memory region and the mailbox trigger. We can
> lean on existing ACPI parsing code to register with these two
> subsystems, but cannot rely on the existing SCMI code in the kernel.
> This means we somewhat need to open code a very simplified SCMI handler,
> which just provides enough functionality for the very basic subset of
> SCMI that the MPAM-Fb spec requires.
> 
> The first seven patches rework all MSC access wrappers to propagate error
> information. Pure MMIO based MSC accesses would never fail, but the
> MPAM-Fb access can go wrong in multiple ways. The patches have been split
> up purely for reviewing reasons, if the number is a problem, we could as
> well squash them. Please note that until the very last patch of this series
> any MSC accesses would always only return 0, it's only the final enablement
> of MPAM-Fb that could possibly introduce errors. Hence all former patches
> can add error handling gradually, those code paths wouldn't be triggered
> before patch 11/11.
> Patch 8/11 solves a nasty problem: At the moment we protect stateful MSC
> register accesses (mon_sel) through a spinlock. Unfortunately the mailbox
> subsystem and the slow nature of the communication through this channel
> forbid MPAM-Fb access in atomic context. So this patch keeps using a
> spinlock for MMIO based accesses, but reverts to a mutex otherwise.
> We just deny taking the lock for MPAM-Fb in atomic context, ideally we
> wouldn't need that (no need to IPI another core when the MSC access does
> not need to be local to one particular core), or we simply deny that part
> of the functionality (access through perf).
> Patch 9/11 adds the code to redirect MSC accesses through the
> PCC shmem/mailbox system.
> Patch 10/11 reworks the error interrupt handler to use a threaded IRQ for
> MPAM-Fb, to be able to do MPAM-Fb MSC accesses inside (which might sleep).
> The final patch 11/11 then adds the code to detect and store the PCC
> channel information from the ACPI tables, and eventually enables
> MPAM-Fb accesses.
> 
> This would enable systems where some MSCs are not accessible via MMIO to
> use those components anyway.
> 
> Please have a look and test!
> 
> Cheers,
> Andre
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Changes in v7:
> - add tags
> - add new patch to propagate errors in mpam_reprogram_ris_partid()
> - prevent loop when mpam_diable() tries MSC accesses again
> - register MMIO error IRQ handler without IRQF_ONESHOT
> - re-use existing "err" variable instead of declaring "ret"
> - initialise mon_sel_lock later, to wait for interface decision
> - convert timeout units for nominal latency, between us and ms
>   

[...]

> 
> Andre Przywara (11):
>    arm_mpam: let low level MSC accessors return an error
>    arm_mpam: propagate MSC access errors for hw_probe functions
>    arm_mpam: propagate MSC access errors for MBWU counters
>    arm_mpam: propagate MSC access errors for msmon helpers
>    arm_mpam: propagate MSC access errors for __ris_msmon_read()
>    arm_mpam: propagate MSC access errors for state saving function
>    arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()
>    arm_mpam: prepare mon_sel locking for MPAM-Fb
>    arm_mpam: add MPAM-Fb MSC firmware access support
>    arm_mpam: change MPAM-Fb error IRQ to use a threaded IRQ handler
>    arm_mpam: detect and enable MPAM-Fb PCC support
> 
>   drivers/resctrl/Makefile        |   2 +-
>   drivers/resctrl/mpam_devices.c  | 820 +++++++++++++++++++++++---------
>   drivers/resctrl/mpam_fb.c       | 250 ++++++++++
>   drivers/resctrl/mpam_internal.h |  62 ++-
>   include/linux/arm_mpam.h        |   2 +-
>   5 files changed, 915 insertions(+), 221 deletions(-)
>   create mode 100644 drivers/resctrl/mpam_fb.c
> 

With this series (manually) applied to v7.2.rc6, the tests for the existing functions
like kunit-tests, L3 cache partitioning, MBW (soft) limiting, llc_occupancy monitor
look fine on NVidia's grace-hopper machine.

Tested-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


