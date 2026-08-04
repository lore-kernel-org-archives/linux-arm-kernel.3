Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944CBC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHMZ+hX0V0vr0a9Nft0AKjYbaEjQK6WSHNPIE5IxYn0=; b=PZNcBAdLu4OMCBI0YcgoVh2SLF
	sVcs/TLkSylWuMl4V04JL5s0SfaRGIxtu6Nstn+WQMhnmyX4NM4TBfQNoIz1Fj6C7TKJJtCTB8mgW
	H80l/uoCv7idUxfjKLIf5JEFkYQyB/UK8RBWO65Ah9UuZ3tP2LmbIJ4v7u1om1d/WR4EjkEGIO9+K
	jHjSDc3EUBApS4Tnx/WgIiF2zirl2eh1/IXiX6SIjDaVTCjO/bYyztoeIVFEB0mEYeUBZDgy6LyBG
	A6R08gB+44SdgR18XNa+jWE32TCrn4M0/thsMJWktCfhELJutUZZunaNI+1eKAzTtYCih/Rf7PyTD
	0Af57kMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAxI-00000001Oq7-4AUU;
	Tue, 04 Aug 2026 08:57:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAxF-00000001Oph-37Dt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785833816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHMZ+hX0V0vr0a9Nft0AKjYbaEjQK6WSHNPIE5IxYn0=;
	b=DOpS8RFoH8nLWmU92dPU8G/VIdNuOX525HKoIb3d/WwHsBmCRH5j8ElinE/KleI+aumWgV
	Xyp1r38lyjMZSGtQLR3f4HzM7csfSxlvExU9K51hLV11gtAP6lX1HhavVmlZV5sm2k9j1d
	FT5IPLDG+QQWYnr4xOaWYuUHKR748iw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-qasc6pOLNG6TgWwotHFncQ-1; Tue, 04 Aug 2026 04:56:51 -0400
X-MC-Unique: qasc6pOLNG6TgWwotHFncQ-1
X-Mimecast-MFC-AGG-ID: qasc6pOLNG6TgWwotHFncQ_1785833811
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so58447275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 01:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833810; x=1786438610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHMZ+hX0V0vr0a9Nft0AKjYbaEjQK6WSHNPIE5IxYn0=;
        b=O4DEnK5dYbEdKNu84GyHguTH2wpukb9KfTFLBNurbJTDwJmX22ic9o1QIAcFBipoCr
         KH+i4ipiQM5teyaJVOV0lpLyYosNprQzzt0/5VCofWicDtmVbJsUWR7fOre4fcK2o6wq
         FxR/7kgGoUaVpL3uGiKTAwAJVRReLYMnd6+x/XEXCXIyVFxDKhwwcMjlysgjnCCvsgGG
         J/Dm9TZwRvBmVCf38GLIiUAPJLvZhICPIBpuqas+qx5z8scFOogeuOrFAcZrNZHgbk1B
         B0tBJQN00Yuc509Mp81SnU3U4gpR6XXCzh4JdVBj7VOyZrqgpPrWwioDOgWzLgF8pQll
         ONHw==
X-Forwarded-Encrypted: i=1; AHgh+RpHVUYA5BADTqXk40nb3yE59nKCiUr4k1GX/35wQd2Twt470tgCeJmReW4niGQi9NBJUCShkvGdNE8iM9LeGi4r@lists.infradead.org
X-Gm-Message-State: AOJu0YxsnnrZludQDepWiOynlmUA7NfQhFr0A4V/m0CCDuWpgTPqRgJn
	2GElJKSFp5KEh4DUsi2jeMgPZSE9aOfvupGcbbjHjag+JhegUHfzRm/rel6FS1ZVENVFCpQsCRG
	PcW024mb48kad75DuLW21vE4VGTRu+4k8q9eKM0zEO8SPAKAJYQ4jt7XwzTWJUYfwoIJiyOe7CO
	R0
X-Gm-Gg: AR+sD109jrbSejMIixY/J29hOh3OwLtwwUsRbMD5ehnGe5SouhXN6n+et2WsB5E8OXM
	S0ytGOs2HV5Mo9+UO+YW88etidkmS9PkDpF0akXKHz4ke1o04GzWmkYn/UmKb5RbZYoM9esibOD
	dmnktaqfjKaKLbXg9eEKFqOYidsiY3UoIIbIIxlvTfhbADdd1ty5tWAPXyzUGPuZxy6U3Kn+/Ru
	6AG0HKxSGKn4tO0XhrDOT6RlzG7ON/tOls7R8Ewz0Ttx4B0jJFAc+PBLj1VtSmo7RRNsUgmvEr2
	nLGtQ8hYNgIoO10VIkmZJbmWR3cXxybe9JgSbVT/ZExFztO1sdUjr1XSIQsWZUwoUAVfXC/stGC
	8LQ1ry9+cA1K2tlY9fdaEV0DswM53MlduRFnIglzrWZA=
X-Received: by 2002:a17:902:d48f:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2d0521e2704mr122370705ad.16.1785833810461;
        Tue, 04 Aug 2026 01:56:50 -0700 (PDT)
X-Received: by 2002:a17:902:d48f:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2d0521e2704mr122370395ad.16.1785833809903;
        Tue, 04 Aug 2026 01:56:49 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d9b86sm2899145ad.76.2026.08.04.01.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 01:56:49 -0700 (PDT)
Message-ID: <8a5e291f-f547-4dad-8a90-1ebb1511a280@redhat.com>
Date: Tue, 4 Aug 2026 18:56:37 +1000
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
 <6f8bc358-91a0-4c44-9110-c071e10df385@redhat.com>
 <afb75484-2739-4b75-a164-dd90433c7179@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <afb75484-2739-4b75-a164-dd90433c7179@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sNPnyaR8vguxJ8ZWrhHbcc2N-km0S4BgBlpCYe-4RwI_1785833811
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_015657_855090_B272FBFA 
X-CRM114-Status: GOOD (  30.91  )
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

Hi Andre,

On 8/4/26 6:50 PM, Andre Przywara wrote:
> Hi Gavin,
> 
> many thanks for the review and the testing!
> 
> ...
> 
> On 8/4/26 05:29, Gavin Shan wrote:
>> On 8/1/26 3:03 AM, Andre Przywara wrote:
>>> v7 is another quick respin of the MPAM-Fb code, for firmware based MSC
>>> accesses. This propagates MSC access errors in a function where it was
>>> missing before, covering more functions that pass their return value
>>> to userspace (new patch 07/11). Also some bug fixes, formatting
>>> adjustments and adding the accumulated tags - many thanks to the
>>> reviewers. Find the changelog below. Based on v7.2-rc1.
>>>
>>> =======================
>>> The Arm MPAM specification defines Memory System Components (MSCs),
>>> which are devices that are programmed through an MMIO register frame. In
>>> some occasions this turned out to be too limiting: the MSC might be
>>> located behind a separate bus system (for instance inside an on-board
>>> controller), it might be mapped secure-only, or in a different processor
>>> socket without direct MMIO mapping. Also the MMIO access might be too slow
>>> or it would need to be filtered or otherwise access controlled. Finally
>>> there might be bugs in the MSC integration, which require a mediating
>>> firmware to be accessible.
>>>
>>> To accommodate all those different use cases, the MPAM-Fb specification
>>> [1] describes an alternative way to access MSCs. Accesses to an MSC
>>> would be wrapped in a message and communicated to the system using a
>>> shared-memory/mailbox system mostly mimicking the Arm SCMI spec.
>>> For ACPI systems, this would be abstracted through an ACPI PCC channel,
>>> which provides the shared-memory region and the mailbox trigger. We can
>>> lean on existing ACPI parsing code to register with these two
>>> subsystems, but cannot rely on the existing SCMI code in the kernel.
>>> This means we somewhat need to open code a very simplified SCMI handler,
>>> which just provides enough functionality for the very basic subset of
>>> SCMI that the MPAM-Fb spec requires.
>>>
>>> The first seven patches rework all MSC access wrappers to propagate error
>>> information. Pure MMIO based MSC accesses would never fail, but the
>>> MPAM-Fb access can go wrong in multiple ways. The patches have been split
>>> up purely for reviewing reasons, if the number is a problem, we could as
>>> well squash them. Please note that until the very last patch of this series
>>> any MSC accesses would always only return 0, it's only the final enablement
>>> of MPAM-Fb that could possibly introduce errors. Hence all former patches
>>> can add error handling gradually, those code paths wouldn't be triggered
>>> before patch 11/11.
>>> Patch 8/11 solves a nasty problem: At the moment we protect stateful MSC
>>> register accesses (mon_sel) through a spinlock. Unfortunately the mailbox
>>> subsystem and the slow nature of the communication through this channel
>>> forbid MPAM-Fb access in atomic context. So this patch keeps using a
>>> spinlock for MMIO based accesses, but reverts to a mutex otherwise.
>>> We just deny taking the lock for MPAM-Fb in atomic context, ideally we
>>> wouldn't need that (no need to IPI another core when the MSC access does
>>> not need to be local to one particular core), or we simply deny that part
>>> of the functionality (access through perf).
>>> Patch 9/11 adds the code to redirect MSC accesses through the
>>> PCC shmem/mailbox system.
>>> Patch 10/11 reworks the error interrupt handler to use a threaded IRQ for
>>> MPAM-Fb, to be able to do MPAM-Fb MSC accesses inside (which might sleep).
>>> The final patch 11/11 then adds the code to detect and store the PCC
>>> channel information from the ACPI tables, and eventually enables
>>> MPAM-Fb accesses.
>>>
>>> This would enable systems where some MSCs are not accessible via MMIO to
>>> use those components anyway.
>>>
>>> Please have a look and test!
>>>
>>> Cheers,
>>> Andre
>>>
>>> [1] https://developer.arm.com/documentation/den0144/latest
>>>
>>> Changes in v7:
>>> - add tags
>>> - add new patch to propagate errors in mpam_reprogram_ris_partid()
>>> - prevent loop when mpam_diable() tries MSC accesses again
>>> - register MMIO error IRQ handler without IRQF_ONESHOT
>>> - re-use existing "err" variable instead of declaring "ret"
>>> - initialise mon_sel_lock later, to wait for interface decision
>>> - convert timeout units for nominal latency, between us and ms
>>
>> [...]
>>
>>>
>>> Andre Przywara (11):
>>>    arm_mpam: let low level MSC accessors return an error
>>>    arm_mpam: propagate MSC access errors for hw_probe functions
>>>    arm_mpam: propagate MSC access errors for MBWU counters
>>>    arm_mpam: propagate MSC access errors for msmon helpers
>>>    arm_mpam: propagate MSC access errors for __ris_msmon_read()
>>>    arm_mpam: propagate MSC access errors for state saving function
>>>    arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()
>>>    arm_mpam: prepare mon_sel locking for MPAM-Fb
>>>    arm_mpam: add MPAM-Fb MSC firmware access support
>>>    arm_mpam: change MPAM-Fb error IRQ to use a threaded IRQ handler
>>>    arm_mpam: detect and enable MPAM-Fb PCC support
>>>
>>>   drivers/resctrl/Makefile        |   2 +-
>>>   drivers/resctrl/mpam_devices.c  | 820 +++++++++++++++++++++++---------
>>>   drivers/resctrl/mpam_fb.c       | 250 ++++++++++
>>>   drivers/resctrl/mpam_internal.h |  62 ++-
>>>   include/linux/arm_mpam.h        |   2 +-
>>>   5 files changed, 915 insertions(+), 221 deletions(-)
>>>   create mode 100644 drivers/resctrl/mpam_fb.c
>>>
>>
>> With this series (manually) applied to v7.2.rc6, the tests for the existing functions
>> like kunit-tests, L3 cache partitioning, MBW (soft) limiting, llc_occupancy monitor
>> look fine on NVidia's grace-hopper machine.
> 
> Awesome, many thanks for doing that!
> 

Glad to give it a try :-)

>> Tested-by: Gavin Shan <gshan@redhat.com>
> 
> I'd assume this is a regression test, as your machine uses the standard MMIO interface?
> If you don't mind, I'd put this tag on the first refactoring patches, so 01/11 - 08/11, and leave out the remaining 3, as they are about MPAM-Fb, which wasn't really tested, I guess? Also patch 10/11 (the error IRQ changes) changed, so I would drop all tags from this anyway.
> 

Yes, it's a regression test. My Tested-by tag are only applied to 01/11 - 08/11.
I don't have a machine where MPAM-fb is available to test 09/11 - 11/11.

Thanks,
Gavin

> Cheers,
> Andre
> 




