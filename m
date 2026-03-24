Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F533F532D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 04:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R08g5rCsq9whHw36ZZYWUOiHQj5R1FuEsuKvwJiGAyE=; b=1ToxH5EMEqMsDRWfaRkTk3abd4
	50ZbvPuKkokgKnjfsHqAK2kAYrduieFHD5el8/8PNbidjH8/rIacfHwaeseT/p7f/m21FKvzDxl5v
	bqn1ofHcM7mbhioq8LfkoD1P8uE8aFQfiCoMlHnpKZLIlyfkyvS0dsw46r4TMAV3NwazRnXTJKWXI
	13tiGsfz+7/Xn2efGxVFj1J8NiGk4X52IqoXWc7heC9qG/oXg9m/RMwX11grvw8nrLvU2yy4xsrmd
	PUBy25UeZdx4qrMB3iugeKD/55YXutcyKCij8K3wOypiWLBpQ+j4K/JtLsh51w5ohgqKpTXaW657R
	77DVqGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tFD-00000000XYN-3CAo;
	Tue, 24 Mar 2026 04:19:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tFA-00000000XUS-3bWT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 04:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774325991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R08g5rCsq9whHw36ZZYWUOiHQj5R1FuEsuKvwJiGAyE=;
	b=DGVpZLd2K8LXDRJ3uJhkPcA4RcO+zhbKHxzw/fRJMZid+So4nvKjMGXEIx17bIQjHAxG1D
	Cg9QESJwkytCViSJmQvv8L9Qj6+6A/c6C4NrxaEnLnWr/9MNRsUDNjZ2MjvgHRV9/AGk/c
	/v0ZVRs68yZe6PsyMTikRrlzjjlgk9A=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-T6A7MZyRO8qm4yElxDkeRQ-1; Tue, 24 Mar 2026 00:19:50 -0400
X-MC-Unique: T6A7MZyRO8qm4yElxDkeRQ-1
X-Mimecast-MFC-AGG-ID: T6A7MZyRO8qm4yElxDkeRQ_1774325989
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0601ff3d9so16225285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 21:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774325989; x=1774930789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R08g5rCsq9whHw36ZZYWUOiHQj5R1FuEsuKvwJiGAyE=;
        b=ps5WmPCC3zHd7ckiP8/tDFoMi4/L6u0/BHCI4+bc0cFvCZoEw/Y/vSK1l4ixRd8CAG
         ZjL3RbfEVqpRR6odKRgJH3PokzfjjCNdl9KD4qI8dtXvhbCBy8ZDIgww/8NEWXl/lCuv
         JHPZ2Y397Kn9DBVfQt5308XVQGykTrlKZfEFbJhp6Me7q8VItCQlDd0QmEmIqHoR2lL6
         w0n7QG+h9l9OsQjND4sKWOg+CjUoauK6HZOHRvV9b3g9yvBf5qEo8tkv/WCopAlvIxhs
         ELFbbljDGgwxZpiirSwYIl1L6FNNiP2p2qkVaMzaQUoAvmms9TXezhBhtfqxvmVq1Z6R
         y3cA==
X-Forwarded-Encrypted: i=1; AJvYcCVRvZDBpIy/cgdASJE5Z47OjcabxztcL9ubOIvOVDxfxd3JpVPIP/VwqfYFt6cmkfK5/by/eLEHiXVo4rQmI+vL@lists.infradead.org
X-Gm-Message-State: AOJu0YwNC6eNLnMwHkdVARkOvblZoDsFTK+tTPKNW38z4DIxGvA5QxKi
	HjxPbg4A7SCgIKVLMQD1bAQ4LJ3FY8HVXemEO6lvrCcRNUc3a/OCQuGKYSJ8EXRpXuVm8nl1ua+
	7VYJ3jrbQZLB0wqRX3iz/FdE6KOtEfndRhpLGL3kxSBUtEPPxeCQy9z2/9/fqoUy4ay95rugeMY
	4z
X-Gm-Gg: ATEYQzxhZjdbWIucWUfg/O6lTJvmpgb0chHg8SC9EKSYSEHOZcQN3OisA/WZov9ZL6k
	U33QeIDdzuth3x1dFLjTvqjrFeukEFBB1L3LgzQ7kgBYoBNcQ6r20WCOomUy2XzxY9mtEZdZArG
	l33PM0221xne6fCcJu22eJcG3lVDEjdMunl2TezrdVyF33A1YAJP/913fgamHM0YPJsv8fS/qKz
	W++Ht6MG3x6Au2A463/j+d5NGcwatjRMlUDwjkDgJMYFvcmug1g2d9ArRewmbFAANIdHfs7o3he
	KHfPF9YrdhHGxYF3i2H4mcCb3mDOpDHxKe8XQr6DLsQS7dQSbdMvLjGkLupg36q5rCs9Nxzgkso
	3n3qzjrs5ysyXLT7rwQdpZU79pnkJk1BHYYdRLjGAcelk2V7L9xbX9cZvj8eHxKYk
X-Received: by 2002:a17:903:94e:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b0826e2f0emr124388545ad.12.1774325989075;
        Mon, 23 Mar 2026 21:19:49 -0700 (PDT)
X-Received: by 2002:a17:903:94e:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b0826e2f0emr124388145ad.12.1774325988661;
        Mon, 23 Mar 2026 21:19:48 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm121045485ad.13.2026.03.23.21.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:19:47 -0700 (PDT)
Message-ID: <48fdab87-7caa-4e84-803f-3fbad3dd306b@redhat.com>
Date: Tue, 24 Mar 2026 14:19:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 37/40] arm_mpam: Add workaround for T241-MPAM-4
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
 <20260313144617.3420416-38-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-38-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rmP39-_wxmCkvBshr7FxdNlCnD593cZVIVtwkvWrXtk_1774325989
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_211953_004772_F909B5F9 
X-CRM114-Status: GOOD (  20.18  )
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

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> In the T241 implementation of memory-bandwidth partitioning, in the absence
> of contention for bandwidth, the minimum bandwidth setting can affect the
> amount of achieved bandwidth. Specifically, the achieved bandwidth in the
> absence of contention can settle to any value between the values of
> MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.  Also, if MPAMCFG_MBW_MIN is set
> zero (below 0.78125%), once a core enters a throttled state, it will never
> leave that state.
> 
> The first issue is not a concern if the MPAM software allows to program
> MPAMCFG_MBW_MIN through the sysfs interface. This patch ensures program
> MBW_MIN=1 (0.78125%) whenever MPAMCFG_MBW_MIN=0 is programmed.
> 
> In the scenario where the resctrl doesn't support the MBW_MIN interface via
> sysfs, to achieve bandwidth closer to MBW_MAX in the absence of contention,
> software should configure a relatively narrow gap between MBW_MIN and
> MBW_MAX. The recommendation is to use a 5% gap to mitigate the problem.
> 
> Clear the feature MBW_MIN feature from the class to ensure we don't
> accidentally change behaviour when resctrl adds support for a MBW_MIN
> interface.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> [ morse: Added as second quirk, adapted to use the new intermediate values
> in mpam_extend_config() ]
> 
> Changes since rfc:
> MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
> Handling when reset_mbw_min is set
> 
> Changes since v3:
> Move the 5% gap policy back here
> Clear mbw_min feature in class
> 
> Changes since v5:
> Calculate min from max when resetting
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  2 +
>   drivers/resctrl/mpam_devices.c              | 55 +++++++++++++++++++--
>   drivers/resctrl/mpam_internal.h             |  1 +
>   3 files changed, 55 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



