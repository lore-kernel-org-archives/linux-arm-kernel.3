Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AEAD58CDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 06:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISK/exyUdJ23yO78+Gn42xzI5rMH8hkY//83Yc4RV2Q=; b=MewS3OkIEvwJ4D2Yn31cQFb+KI
	Zxo4yr7JMShwtLm2vileQpXH/0c2gpsd6qplHWxdjECB5df9l4OcagHCPJD6B/4kUmHSign5fy9qM
	ASFvb8Zrekgj0blILxzzsauPfAv4s3wcGSooGAtX8Pn9sOo2ysv2hXgO39eiKeXXiyzrbViVwGucQ
	5Dz1hpMbPEPATt9tvK+GBp0U6hqI1Z/2nUzukhCw1u211Bkts0G0fxajIv0V5mvxcfyVRb5OFDjJM
	QSPESm72GEwktxb/izXlCLmxP6PCWoJclyQXV1PWSYTT/OdJM/s8EVxZ4f+1gLjgZJjjhi75fzeT3
	tpFHDqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4YvE-0000000G8Wu-0ifO;
	Mon, 23 Mar 2026 06:37:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4YvB-0000000G8WU-3ZMk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 06:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774247872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ISK/exyUdJ23yO78+Gn42xzI5rMH8hkY//83Yc4RV2Q=;
	b=UB2IdYLcd4yOyAhX4gKG3HLhsMAaNZWK/ctv05+d94vqUEX7boBoxi5NSG+u8eEWOD4jTO
	f43H6Z7zY5di8iifGNn0xCTmlcKknlAiYGlAjCJ2W6cR6JvyfF4UcnsLLFu8QbVDLc3qyx
	F+ybfIxCXY9G02jGiyF3rqtWoly7CpM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-YuBwQvCfMA-sYT1wqY25PA-1; Mon, 23 Mar 2026 02:37:50 -0400
X-MC-Unique: YuBwQvCfMA-sYT1wqY25PA-1
X-Mimecast-MFC-AGG-ID: YuBwQvCfMA-sYT1wqY25PA_1774247869
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35842aa350fso21423605a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 23:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774247869; x=1774852669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISK/exyUdJ23yO78+Gn42xzI5rMH8hkY//83Yc4RV2Q=;
        b=IEcaMFKrTNyzI+oV0o3bmVUK/Jan2DlkOUvfbFSrCnE5tgIt8eFf+Fisu+n7zp4yPM
         whRZpVVaLK5AOIS6OP5l0EcJp0brL4c6E0gy2I5d4vwXkAD+tGgJ46ZRB/Okpk5JcHwQ
         shFIN38/TCfHYDiAWav4N887ddu9BT3NDntH4cG1h0i4TTc7Cquz7BAOw08EgN7r+zgO
         ptB/DI1DJ2WopTeOLjbRdtHHvh9s3k+5s+CjKwJS0qKfxDbtP+YTnDgp/vyezakOK8/Y
         mh9tgEtu8OmDkZ9jKYICeCZz5+cH2JseVUkt2/fe68Bw1Ub9FVUjesx+7PMxRVfFRbrL
         lwcw==
X-Forwarded-Encrypted: i=1; AJvYcCXmiLHmTJfNrpTKtOZYD84NA/n4z7q+piNSA+kAJvayVZ53FHOPeF64fgUA3RDQ0UrtvH/c/KUHlzhvkoUT508o@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk86pGsHpG3ltTnshAa1xlp2pC2KQkAGiBexDXONqzzO9kTtI6
	0QmOxms+VfwfGkwcWD7QWmuUuKps8Z+32sBI+Ei26HWD69ZKu570TCbuGjq8/ny2d+7l/qnZC1Y
	QjJXQsArfK8jyKQVgXR/ORMywCYW2gSHjgDM0n28UzV+Qu4uKVPxHRuRrVwWpvflNeYAaMG7GyM
	20
X-Gm-Gg: ATEYQzwDKXLoNBe9/fMTCy9/lNYwHsqJ7zTwUET95EOKuC49nmASPHt4Z/T1iYaQ20u
	UFAMDJatYPnhFze+fFitWUFAr92ZkuuEP3j7497/rOKwcfP+0yZWuPagmKLuYTwbtWJC9AANYmS
	ane2E7PQ4pINOILNo0snoeGowkaAvc17VpIdanXHbGT9TvsUhFXXNUBDhMI6FZAliKXK/fw5izB
	C+CjY5DLfxYSJ++CPvfwZTjObb/PITxSuuFEF5DpbYOHlnCAt0g6sZrb5kklzt1/hUA2sJgL4/t
	vock100q9mQPgWJTQ8NC7aAE24Xe6jF9huXPUfSYMEa2XZOIOXfVkLXvJ+BX3EyTDziS+T+tAzl
	p2uScmxJshNyKqLTJ5msas0K2V4HbjQowSGYSjWhX+6nHP7H4MQUojYgFA7Z/aMuZ
X-Received: by 2002:a17:90a:d406:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35bd2d1f007mr9090106a91.23.1774247869489;
        Sun, 22 Mar 2026 23:37:49 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35bd2d1f007mr9090083a91.23.1774247868996;
        Sun, 22 Mar 2026 23:37:48 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ec3aasm10906457a91.10.2026.03.22.23.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:37:48 -0700 (PDT)
Message-ID: <9f5fa983-155e-411a-b543-e7626d6f04b1@redhat.com>
Date: Mon, 23 Mar 2026 16:37:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/40] arm_mpam: resctrl: Pick the caches we will use
 as resctrl resources
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
 <20260313144617.3420416-16-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-16-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mqbfu10L11yg0euMREwWMI2dGKal5eTHRzwTdPmuUME_1774247869
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_233754_000313_38E461E2 
X-CRM114-Status: GOOD (  12.07  )
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
> Systems with MPAM support may have a variety of control types at any point
> of their system layout. We can only expose certain types of control, and
> only if they exist at particular locations.
> 
> Start with the well-known caches. These have to be depth 2 or 3 and support
> MPAM's cache portion bitmap controls, with a number of portions fewer than
> resctrl's limit.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Jonathan:
> Remove brackets
> Compress debug message
> Use temp var, r
> 
> Changes since v2:
> Return -EINVAL in mpam_resctrl_control_init() for unknown rid
> 
> Changes since v4:
> Set alloc_capable after other settings (Reinette)
> 
> Changes since v5:
> Missing 'have' in comment
> Set cdp_capable to true for L2 and L3
> ---
>   drivers/resctrl/mpam_resctrl.c | 91 +++++++++++++++++++++++++++++++++-
>   1 file changed, 89 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



