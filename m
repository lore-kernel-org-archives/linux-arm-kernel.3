Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710CAF4613E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 22:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNabF40iumNbt7yuFgKTAYx+laicPNx0TXvhfX8ttWU=; b=VbQXSDwZjqwNwTMHNeICErvreU
	TVXA+FwNzbvuRgE+8fwJbepQ6k+GF2dsItnMCWw0yZTtGaW6AgWrxg72JxJNyk+RAAFvUozH2Fa2F
	Oa6BgKwPqTZvAOT+FAtNX4re2CaBiS0HSHzFitLgIN/YKgdchwfuwG8KiWuI0Tg1pqQ4ntBHFsFDy
	7MelvewnnhyXy5NlO/EKMorwNA4YvjUYarx2P7O3Gk4RiDIoVm1rUHZXwmacCu3lc4ughS3HDGTem
	NlNXrLTUqjdBDLiWsRN2Q2Ni85unwRJySCURDpjCHK1KqlKIzXzEFX3D9gHD0nnIN8F+a0s0ZWf4n
	p//dlGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nsf-000000005A4-3eMw;
	Mon, 23 Mar 2026 22:36:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nsd-0000000059h-1dFK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 22:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774305374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNabF40iumNbt7yuFgKTAYx+laicPNx0TXvhfX8ttWU=;
	b=XjZf/7vRJiE1aQXp4vULpr8YHj3rAGPtrWyRfbUgbavWp9hFZciUTHgGicSTC19h0syRdv
	amRyCj23f6fQD0Pa5ohjDI4iUunC/wRb2h1XbKOSwqsL9RCzzkHRfihfk7ZW1jpvgqp+no
	k2TooAk5qAiMubzmF5R1kkOGvKGnCYQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-eOa-mM4uNrWO4CMIqj1lvA-1; Mon, 23 Mar 2026 18:36:12 -0400
X-MC-Unique: eOa-mM4uNrWO4CMIqj1lvA-1
X-Mimecast-MFC-AGG-ID: eOa-mM4uNrWO4CMIqj1lvA_1774305371
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a1e725a8fso23858018a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305371; x=1774910171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNabF40iumNbt7yuFgKTAYx+laicPNx0TXvhfX8ttWU=;
        b=Ju70bH1tg6w7eObI/JMAA5mjqZLdbnTnLpuyC42XhIo69VI5ialfTgrZ+xWvWqYDW6
         Km5fnr8uMzInIcXwMrmpoXaBrYxtZ9ELAa62Fv6EhM0mHw5sKD53618lAaLb1bJDVldh
         Vb50M0OKNA/KU9ReSr5ql+To1OW7hfppF+Yrmlet88JV7rBE8h3EqnNUawfwVd0Juq/t
         q5a+5M7RFpp2/7cicGeb8LC+rs6KEh8BNiyjFX0DwxmCa3rf9uQtfhwP4t7OK71knRVh
         APfXT/04dNZRE2JMfCkRkqwvu4vaSqCPZPXDouDxWUcCubn11i7unQtJFhPD1jkS5Jn5
         T9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVE5BuV6qaMoyJDFoI4MYkzVhn1dCaQzexcX+09pnPs/I5QRVUfRnqbvwnuGvM1mk4UOKNACRBfBI6wsv7+cSnp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3O4egaDPJ8o2ufcjgbMxknKC6xllhQPxB6mORVq7EZqmLubaW
	CjMwq/q+yPlmeWHQNbwOWNzNQ1acVBuK2h49YuLjuaV32d/Eb+KCzSCW6yuUcopT7ZcSYvml7fE
	L/MDYBn9AZIQ0YgESMvju5+gzeti6C0PUpbe2IwvhOx7AI0Gon+w5kkzdhdVpc/EE0/p2jFh9UT
	Tg
X-Gm-Gg: ATEYQzxRjcfDXuAmq/XThLuFjaX/X7XuuA+NeXY3MXBkfx9ZXQXW7C3M8RRuFFmGcn0
	Csp3CjXzylMT/GLFWfKBLohji3Qb7nSIPKkPtWh0FJnqJCGSUk0Tj/HB0/hhjtxGnNzWmQt8ZFi
	Pv11b0AjUK5UvJevr2cREwvzwGLI1rcn1Ejs3u7kUPddnuByKhwXUJZv4UcDZoAoRsGJhES05EX
	PpktUJp/sKFbR5cMzIvYYsFi+1Plb8NwVLCvF3itnO65Y2Cu+vX9sqGkneErlKGnIRjpmrkpI+r
	RPribaJb/t3hSXtNsJ08W4M4OOsLSSbjp24xyW1HUvm8N71E539AZcs2FaroBmHkew2ZxeoDALQ
	WrinMmYAalioKgPjiN5B6tUWY4v6LvrwKggrNe1OwOZ2bSWcn1qRiNq3Vrji2P7hB
X-Received: by 2002:a17:90b:1a91:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-35bd2c20675mr11602602a91.4.1774305371177;
        Mon, 23 Mar 2026 15:36:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1a91:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-35bd2c20675mr11602567a91.4.1774305370690;
        Mon, 23 Mar 2026 15:36:10 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c017a161fsm139948a91.2.2026.03.23.15.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:36:10 -0700 (PDT)
Message-ID: <b5029581-c846-432a-837e-f02e225e2fc7@redhat.com>
Date: Tue, 24 Mar 2026 08:35:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 20/40] arm_mpam: resctrl: Add CDP emulation
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-21-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-21-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uhd9B1MQNNtmqybEnD5_nJBrOj9D9LBYhgxnrXBQPws_1774305371
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_153615_526050_EF2BB84D 
X-CRM114-Status: GOOD (  25.83  )
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

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Intel RDT's CDP feature allows the cache to use a different control value
> depending on whether the accesses was for instruction fetch or a data
> access. MPAM's equivalent feature is the other way up: the CPU assigns a
> different partid label to traffic depending on whether it was instruction
> fetch or a data access, which causes the cache to use a different control
> value based solely on the partid.
> 
> MPAM can emulate CDP, with the side effect that the alternative partid is
> seen by all MSC, it can't be enabled per-MSC.
> 
> Add the resctrl hooks to turn this on or off. Add the helpers that match a
> closid against a task, which need to be aware that the value written to
> hardware is not the same as the one resctrl is using.
> 
> Update the 'arm64_mpam_global_default' variable the arch code uses during
> context switch to know when the per-cpu value should be used instead. Also,
> update these per-cpu values and sync the resulting mpam partid/pmg
> configuration to hardware.
> 
> resctrl can enable CDP for L2 caches, L3 caches or both. When it is enabled
> by one and not the other MPAM globally enabled CDP but hides the effect
> on the other cache resource. This hiding is possible as CPOR is the only
> supported cache control and that uses a resource bitmap; two partids with
> the same bitmap act as one.
> 
> Awkwardly, the MB controls don't implement CDP and CDP can't be hidden as
> the memory bandwidth control is a maximum per partid which can't be
> modelled with more partids. If the total maximum is used for both the data
> and instruction partids then then the maximum may be exceeded and if it is
> split in two then the one using more bandwidth will hit a lower
> limit. Hence, hide the MB controls completely if CDP is enabled for any
> resource.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: Amit Singh Tomar <amitsinght@marvell.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Fail cdp initialisation if there is only one partid
> Correct data/code confusion
> 
> Changes since v2:
> Don't include unused header
> 
> Changes since v3:
> Update the per-cpu values and sync to h/w
> 
> Changes since v4:
> Enable separately for L2 and L3
> Disable MB controls if CDP enabled
> Consider cdp hiding in resctrl_arch_update_one()
> 
> Changes since v5:
> Update comment on call sites
> ---
>   arch/arm64/include/asm/mpam.h   |   1 +
>   drivers/resctrl/mpam_internal.h |   1 +
>   drivers/resctrl/mpam_resctrl.c  | 122 ++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h        |   2 +
>   4 files changed, 126 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


