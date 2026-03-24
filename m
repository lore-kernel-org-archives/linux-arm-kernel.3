Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A9AF532CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LD86M66XQ6z2RDnVdKVUV2lC/ws2IdjFX4ukZlHTEIA=; b=FhRmXdQCc2zEGo13BZ1cD96lYJ
	e7gknDVHTo8P/LjJgU65uO8DV6lMut8W+zadtzkeVVaeQW6n1i3ZLHrsghcZhYoOCiWOxshDdie8v
	H43SYF8nBW+0Li7JgjNG5WnYZjWvm0O9XheVSqizgf0xcOhE7EB66AJrIlgp8t2DHUO6cc8icbk3N
	xi2TBR9G/u2fTbngDXghQU7wzZr1T3GtPTitvXW2QIEFWniBiWzZ7qOJRn2wy8K2B6oTk6lbdnXWT
	u+cD3rQEIMnmJ04EH2MBzp1QO1JJjneJnqNOOqjopircUKsNrUi41PIGlYLrXho2nnXCEEzA8sRUd
	utWsLKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sdd-00000000UqL-2hPR;
	Tue, 24 Mar 2026 03:41:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sda-00000000Uo6-0LHL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LD86M66XQ6z2RDnVdKVUV2lC/ws2IdjFX4ukZlHTEIA=;
	b=dHWBRbGTCRFGliDRKXv3clCrBZvIDGNlc9OIkt50khnNpc4TjBgDefrLU0vJpgd6a39E8c
	QKoZqP+kW3E64eMwLhJlDFiHojkXxAE2zC05lm5e+atvrFyntf4pk+AfwA00ETctvvk+Q9
	zEk6fK90tgQf+6wD1dviEIy7s3Ryktw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-da7BPq4lPcSYgDHIi65j-A-1; Mon, 23 Mar 2026 23:40:58 -0400
X-MC-Unique: da7BPq4lPcSYgDHIi65j-A-1
X-Mimecast-MFC-AGG-ID: da7BPq4lPcSYgDHIi65j-A_1774323658
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6906e35fso6325940b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323657; x=1774928457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD86M66XQ6z2RDnVdKVUV2lC/ws2IdjFX4ukZlHTEIA=;
        b=SgnfvXeY5Tm3KFTD8noW57e+05HnN7rL++n1TXH6r2ABgTv/yaCHrMdjVrp4ZjCT65
         alZRIGHD1AaU2ylFfkFOreeoX8SEPOb7SyDxK7f6lMQBw7fualL3s24hub0v87JPYmv7
         kn7SF1w1gQQqJBwDR7JWa6RDS11OeWtX59gWnm01kr4EeqaOHuKkSLi1W+GPRdufsltm
         mQQ3Cm7Pni0YZM8r9eix7tEBwVRzzsshFZK9OW12bJR6Zf/h6LMa/6HDTX0PfAkL7F2M
         vuwcOREgE0SbJKb/QO0tP3A/2Os24A0aqhFCmW/d7A0NS2/jmsWBt21RYmdCXHX/fvdw
         37aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBNDpdKgN2Yi7uNlxz4zlrkPRrz4tMhGaPRGP0WRfeRwbd0uWXKVeDUT7rjyYjhQGBJWN4ho+O/BAhmbYrZ3EI@lists.infradead.org
X-Gm-Message-State: AOJu0YyzwxHIqVszSsrJzSYfccL1WlEZrMDkbnfJRVsPC63Z697qruec
	gkyX03p6qg70tlJdFDVQrsfKZQhzYTRKzXItmT0gFm1isNGbW/un38sRFWrY2xwc1DaBdXI0fd/
	RjGCSQIWj7ZXcGzFcQlfDpaGX1TxCG2bfbTvk6eAfIDYgAieY3ab2/NdY5Ie5YWMaVIKp5VqmRB
	9I
X-Gm-Gg: ATEYQzzzU9NZJzEz9jbxBXxKlQ3OsDXVQNf4SUm4CWI4TljHNR4Jmn6Kq13a0e3WrjS
	SzUP288w+4GfD23oWoHjn1005MOYbS7bDFM0QvmlCql5lpKizza2PnOzN4OzAvWf4PEDVNvHHgT
	RywcDJSZu2EeK50cctr73tGha+NiNVAjZ/rE1GnCZ+CfaBK6Zr/R04weKIsElblt+hIbnh/5f5Z
	NFkadJTyr9hVMCRvYcAVCQnoP/3Q4HNuZ3B9Gzz/Ni69zwxU7oPGPlxBzanHHmMawxLY2102R3g
	3bD8PqRYG8twyZj7krH/DZN437+S2mDW6gMBupsPEw34DN3/JSqsvn22oVkgxGRWjvlnHxwcC4l
	yGMG38Rk0FsAOH/ypCTe1u/CnXEL9OLTYbg7NGdSrqQmZxRK/fRBcavxDvvi4Mu4E
X-Received: by 2002:a05:6a00:2d82:b0:82a:67ce:66de with SMTP id d2e1a72fcca58-82c5bdb0f77mr1586843b3a.14.1774323657553;
        Mon, 23 Mar 2026 20:40:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d82:b0:82a:67ce:66de with SMTP id d2e1a72fcca58-82c5bdb0f77mr1586793b3a.14.1774323657062;
        Mon, 23 Mar 2026 20:40:57 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0354baefsm11044528b3a.0.2026.03.23.20.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:40:56 -0700 (PDT)
Message-ID: <6ff8f2f2-e7b9-49a5-bbc1-3cfdc2fff4fb@redhat.com>
Date: Tue, 24 Mar 2026 13:40:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/40] arm_mpam: resctrl: Add support for csu counters
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
 <20260313144617.3420416-29-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-29-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ulKuQ-Zi58BP1onlBqxqQTWkzPQhGJ_VT-Tfk4TteiE_1774323658
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204102_197379_1E6DF7F8 
X-CRM114-Status: GOOD (  20.11  )
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
> From: James Morse <james.morse@arm.com>
> 
> resctrl exposes a counter via a file named llc_occupancy. This isn't really
> a counter as its value goes up and down, this is a snapshot of the cache
> storage usage monitor.
> 
> Add some picking code which will only find an L3. The resctrl counter
> file is called llc_occupancy but we don't check it is the last one as
> it is already identified as L3.
> 
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Co-developed-by: Dave Martin <dave.martin@arm.com>
> Signed-off-by: Dave Martin <dave.martin@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Allow csu counters however many partid or pmg there are
> else if -> if
> reduce scope of local variables
> drop has_csu
> 
> Changes since v2:
> return -> break so works for mbwu in later patch
> add for_each_mpam_resctrl_mon
> return error from mpam_resctrl_monitor_init(). It may fail when is abmc
> allocation introduced in a later patch.
> Squashed in patch from Dave Martin:
> https://lore.kernel.org/lkml/20250820131621.54983-1-Dave.Martin@arm.com/
> 
> Changes since v3:
> resctrl_enable_mon_event() signature update
> Restrict the events considered
> num-rmid update
> Use raw_smp_processor_id()
> Tighten heuristics:
>   Make sure it is the L3
>   Please shout if this means the counters aren't exposed on any platforms
> Drop tags due to change in policy/rework
> 
> Changes since v4:
> Move generic monitor boilerplate to separate patch
> ---
>   drivers/resctrl/mpam_resctrl.c | 83 ++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


