Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89243D58CC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpzF/CEF7fwWVk/imLxKyu7B/chXAu6y92czDhmcd0o=; b=CwLQLGunLw0l8ngg7DDl+LrcJj
	67QOCJa0K3oAII+3ePCNp9euPZW8BuMYpqELbXQtgBRGvN/+Re4uQZiAGdE7mc1t8gv2AyGsQLc/3
	Z0+31oRfR/I6hs6My5zIO2YxWNLNGskoBCm5IE4w3pPeViydA8Lc/ewdDyPRRl0X7gOC5I4Ob8oku
	rATdYbv7f8u78ha/8LgcMtTJXP/ZzjMerZCnlrLm/dHpg30KNVpXvf3o9dyCv+lvwYpjjmFZOAszJ
	uDEQt1IlR+ezD6bLVAqWq3WfBxBXtIdgqF9rLu+8YuCAQZg93YnCJsVqSv1tMr2gxYOfTnOWfK40H
	QJQ+5N0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X73-0000000G1te-3h6B;
	Mon, 23 Mar 2026 04:42:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X71-0000000G1tJ-10bT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774240918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpzF/CEF7fwWVk/imLxKyu7B/chXAu6y92czDhmcd0o=;
	b=IQh0coUvxzjvf3YqDSHotoIiaBClcc1BbOWuf8lR0NBvhZhsX2BGBBfpHcojCUQmQHu1OZ
	+IVy9RON7O2GkClAfT3l0TtBAB8XVYoJC4ASMgSExOyjAl6RNAHP2NeJVk7R1KPa2bjpvr
	hZEYGLJtGBvgRz8SdlUP+11NQusM8c8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-3WqPwMSyOa26GPOOjczoIA-1; Mon, 23 Mar 2026 00:41:56 -0400
X-MC-Unique: 3WqPwMSyOa26GPOOjczoIA-1
X-Mimecast-MFC-AGG-ID: 3WqPwMSyOa26GPOOjczoIA_1774240915
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829bf6406ecso9650769b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774240915; x=1774845715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpzF/CEF7fwWVk/imLxKyu7B/chXAu6y92czDhmcd0o=;
        b=BpW/BvpL7PxtuWeIcjb/cEvZ0d7/CTBo4r4XEqkMrP+m1U6WG0UEBCb8/fSxEt1jOm
         QxshChLjZdTfyIdM8UGq3dNkaq7I/jaujbQNf2mubWAGCKMLMtxebhsCGw1dPRrdn4lg
         JDZF2KIweR+WHhGw2k9V0hkUMIxljEevMTjyalqo2AvCIVGx2lOJG0J0E9shkfhE5EeS
         kMtMiRqFlPIhvTsXVSKfcC/LmXVmUMTiSVu9FvGlj++H6i8gUvdJuGsifODNTympvwSk
         R3/quRvPOUeAx9rmZbwAeP6xi0yqYEYx7t2OkDEw3PjpXBYdfronctGJydONJAHeQsKA
         rnpw==
X-Forwarded-Encrypted: i=1; AJvYcCWphI4iGL8o0Um/nvwLH9aKp44EnxNbQUEmUe8rNIBOFU4Hl8CF1+KrWEJOlLX6CpOqygaoINOrFBM+UEXyCOPk@lists.infradead.org
X-Gm-Message-State: AOJu0YzZU0kzVRNoPTmqF00G0S8uY03di6FZgi1QTsLLesUUNuAE6ZY/
	ocrcROa6cGkKFatilw/ht/wNYyNmeR64NsTzXKedzzSQNL9OHX3z1hyz8EWmWE9bt0IME4HGOdH
	uRWNgfx4SiRTtqRIKMlpjNvo4ifELjSlnoPadtx6k5emxKdBMcOqfqI5NV/5a6x83xj3PnDfizA
	CO
X-Gm-Gg: ATEYQzyX0jptyk/RJMdAA5BTTIy6iqmThFnQWji9GN8i5HgDlU6dLAYV7yJuPObywTu
	GhaaoVw2P9bUZygDIzgjuyHbz5IGoMjXEm6ts/B3zv9urVjfbZcKbfnoiPPkJuvtELrsottTIDb
	vFEj59FQI2zW7aOtEpjXLklUmSSzGD+2qVn1Gc4clkU20/wLv3BLlk22d62/i/x/VudhhWVv6S6
	60pr272AfXvGtQpqMiaHYg7DifiWSuy8xIB64sOwij5wqtk0PaOqsGrziE0HXhINRQKKqNJgyRt
	gB7PZqPiI44La1d3p6Dow7+7Tv9mh1QgJG3Gj9P/b59sn6KistC3+dqUR/zeHkGxOK5QhBuQMQp
	NeJtqvymeIvFCKAQXp/ORZF3nTrEN0t7Pv+5y1Jw7fiiaMi5ttRBRqDSnXXrTWk12
X-Received: by 2002:a05:6a00:21c4:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82a8c37fbfdmr9102369b3a.43.1774240915352;
        Sun, 22 Mar 2026 21:41:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:21c4:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82a8c37fbfdmr9102343b3a.43.1774240914907;
        Sun, 22 Mar 2026 21:41:54 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa9fc6sm8259697b3a.7.2026.03.22.21.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:41:54 -0700 (PDT)
Message-ID: <71f9ac1e-9f5a-4f12-807b-bbe0803f99e7@redhat.com>
Date: Mon, 23 Mar 2026 14:41:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
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
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XAPqTJJOy3MHnjSyg9LH3As-aYnSvfwWoVljk198eoA_1774240915
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_214159_357592_59A5F76B 
X-CRM114-Status: GOOD (  29.68  )
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
> This version of the mpam missing pieces series sees a couple of things
> dropped or hidden. Memory bandwith utilization with free-running counters
> is dropped in preference of just always using 'mbm_event' mode (ABMC
> emulation) which simplifies the code and allows for, in the future,
> filtering by read/write traffic. So, for the interim, there is no memory
> bandwidth utilization support. CDP is hidden behind config expert as
> remount of resctrl fs could potentially lead to out of range PARTIDs being
> used and the fix requires a change in fs/resctrl. The setting of MPAM2_EL2
> (for pkvm/nvhe) is dropped as too expensive a write for not much value.
> 
> There are a couple of 'fixes' at the start of the series which address
> problems in the base driver but are only user visible due to this series.
> 
> Changelogs in patches
> 
> Thanks for all the reviewing and testing so far. Just a bit more to get this
> over the line.
> 
> There is a small build conflict with the MPAM abmc precursors series [1], which
> alters some of the resctrl arch hooks. I will shortly be posting a respin
> of that too.
> 
> [1] https://lore.kernel.org/lkml/20260225201905.3568624-1-ben.horgan@arm.com/
> 
>  From James' cover letter:
> 
> This is the missing piece to make MPAM usable resctrl in user-space. This has
> shed its debugfs code and the read/write 'event configuration' for the monitors
> to make the series smaller.
> 
> This adds the arch code and KVM support first. I anticipate the whole thing
> going via arm64, but if goes via tip instead, the an immutable branch with those
> patches should be easy to do.
> 
> Generally the resctrl glue code works by picking what MPAM features it can expose
> from the MPAM drive, then configuring the structs that back the resctrl helpers.
> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
> counters are considerably more hairy, and depend on hueristics around the topology,
> and a bunch of stuff trying to emulate ABMC.
> If it didn't pick what you wanted it to, please share the debug messages produced
> when enabling dynamic debug and booting with:
> | dyndbg="file mpam_resctrl.c +pl"
> 
> I've not found a platform that can test all the behaviours around the monitors,
> so this is where I'd expect the most bugs.
> 
> The MPAM spec that describes all the system and MMIO registers can be found here:
> https://developer.arm.com/documentation/ddi0598/db/?lang=en
> (Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
>   This document has the best overview)
> 
> 
> Based on v7.0-rc3
> 
> The series can be retrieved from:
> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v6
> 

[...]

Retested this series on NVidia's grace-hopper machine where L3 cache partitioning
and MBW (soft) limiting worked as expected. Besides, The L3 cache monitor counters
are increased as more cache usage is observed.

Tested-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


