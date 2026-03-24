Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF46F532CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9oHoK+qgr+hzDA71sg+T7mBzxA/nxf+7FTfYBCJoWQ=; b=EJDTcifjkP4PW23Hx3F3xxo3IY
	klpvtueeQhjP2jqXsATPiFpXI2REaIgM4B59C1xn3GKnyhQbIQnKDwKwal0OJ45SD4Gf3V+wbCT98
	lhGNjIwOfBuyX1zvh7uZ5k/tyiWDCRaG57arZxaJtQf2OGNoHKyStw1+ZM2uzpFaNSfF5zrL7+zif
	olN2GUeHkz5VxmTGTKDKIPqp7OkCCJB5MB86tHW/TsNRrmnCkF3aYjl3QL0pcjMm6o1yADHnHkdIZ
	nj53gB/kAdnPEN2PhWRe+nxGFzhDjdG0u09nIzFOhLpXJjf5gLqWUIprzFUZWifoh0pgNF6bl3jAe
	mVCXKNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sfG-00000000VMa-3bQs;
	Tue, 24 Mar 2026 03:42:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sfE-00000000VKX-18Op
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M9oHoK+qgr+hzDA71sg+T7mBzxA/nxf+7FTfYBCJoWQ=;
	b=gDxz0Fr9pDXxJm6xmmE4GqhJIINbvUsKfZ4mbqZi80tn4KZDcj5CLY+GrgWqOrzogcpE10
	G3pX9PhNJQTPnFYY9IipKXFDQXgrFS20KWjSXOwvqOrXeySgUug90vs3tf5sBBgbtneKoQ
	gg/QOMxJfIj6NsvBThRaocngQuHycaM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-IGxTdMBlOGGn41SI7hVXEA-1; Mon, 23 Mar 2026 23:42:41 -0400
X-MC-Unique: IGxTdMBlOGGn41SI7hVXEA-1
X-Mimecast-MFC-AGG-ID: IGxTdMBlOGGn41SI7hVXEA_1774323761
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0601ff3d9so15749415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323760; x=1774928560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9oHoK+qgr+hzDA71sg+T7mBzxA/nxf+7FTfYBCJoWQ=;
        b=AsIFDDMrpLxgKtsXsT3qG1V0a/KDPxsCLmSAXqDbP7cu8nhkr7oGK7RnXQEvEpKJlo
         9Ya6cyo5pcfKyl+AsAYtVlzOjjEZYdv3q+Afkw/gE4UFYjNsSEjbFHH+W6eFctRPkaoX
         RllkBnwM5i4LAfROjfZ7F/3Ps7mYTjIP9ZFUk4MEvdobgX4JoUDU/6RLBww3PwUDd+uS
         Wy0WPmUML66aCjY54fySGuxgfeb7wwta6Xrn7e1kqhyTclt/Im1n3l9c1u9rKha2hVxO
         2sNGvesA6AT23xCITVzPXzI/BB+L+3p4UWOsgKxrQw2qPd+ZMpf0RLPBDEgJGPeiVqtE
         I+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWAn4uV8E5F17bn/NJ010shDyCVRFtcfip20zOotnZhSFtQcRoQ80h7/7of8caMDcmeBLF27KRADjMswhg1mjcP@lists.infradead.org
X-Gm-Message-State: AOJu0YzigVeS0kQ8nW4z9kdb2aG0Vxx/ZsfMhV4dUS3dGVoSlQGo1OtL
	QwAI2Ki+mCI11IybJc+U6FsLyRdXGJwLgdwZs8bqL1HOO14nLiN9DPUipwKtM2bs03RJP/PuzBG
	4dTKdBXD59m3YqEdSntbKNzlwwiQNgSNJmkaF/vHAZoxxj0xrw4Tu8shtHtT8qAGnt/4ciDp00Z
	s6
X-Gm-Gg: ATEYQzyysJ6j5vLJxFGEGGT9wSe9Fv6WANP1bd23YCc+jEurFxWIW4FWto9ZA95/R0T
	jXm3sDd1DXfES+gtWJrK1cXOKqAbHLkUrHKxT4o3/BHlMBEbrABlWQUQ9U/6TJXAaIqMM0KbvSX
	CiOyJnHd//ZanVq6l40X0gC0K1Ky3wpcmfr1mTpJ1pFFmlMMmklcZv5BSHOC8XDkaKiFHKIQ79t
	AqREciF4fnmlfv+QTmQf8QXN8J6yg/1tbgEWbi2djKBQ9tzvwwcvPdKGAwahe6pTle9fudmnfWS
	ctYY9K0qk7aeLK+n6tHksi5UBzMuMbylC8yeCFPcJbZB5vlkFCtjalsKMjixo7PrBDMvYhEkr0c
	aLcldmiyXezamiLqiN9diqnX+20x0NkNSr0MTSGr4N6b6hQ3TH7IYkYqpsjwZb15P
X-Received: by 2002:a17:902:f685:b0:2b0:4a1c:b847 with SMTP id d9443c01a7336-2b0827d55dcmr137215295ad.52.1774323760646;
        Mon, 23 Mar 2026 20:42:40 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2b0:4a1c:b847 with SMTP id d9443c01a7336-2b0827d55dcmr137215045ad.52.1774323760248;
        Mon, 23 Mar 2026 20:42:40 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369617dsm161821885ad.71.2026.03.23.20.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:42:39 -0700 (PDT)
Message-ID: <be4c52da-b345-43d2-b251-f0760ed4417d@redhat.com>
Date: Tue, 24 Mar 2026 13:42:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 32/40] arm_mpam: resctrl: Add empty definitions for
 assorted resctrl functions
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
 <20260313144617.3420416-33-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-33-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mbMWkbnO7kpWnjPf5UwpOOgPx2V1EDT-Qe9zkjUyD2o_1774323761
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204244_529221_4A37E923 
X-CRM114-Status: GOOD (  17.19  )
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
> A few resctrl features and hooks need to be provided, but aren't needed or
> supported on MPAM platforms.
> 
> resctrl has individual hooks to separately enable and disable the
> closid/partid and rmid/pmg context switching code. For MPAM this is all the
> same thing, as the value in struct task_struct is used to cache the value
> that should be written to hardware. arm64's context switching code is
> enabled once MPAM is usable, but doesn't touch the hardware unless the
> value has changed.
> 
> For now event configuration is not supported, and can be turned off by
> returning 'false' from resctrl_arch_is_evt_configurable().
> 
> The new io_alloc feature is not supported either, always return false from
> the enable helper to indicate and fail the enable.
> 
> Add this, and empty definitions for the other hooks.
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
> Changes since v3:
> Add resctrl_arch_pre_mount() {}
> resctrl_arch_reset_rmid_all() signature update
> add stubs for abmc
> keep empty definitions together
> 
> Changes since v5:
> Add resctrl_arch_reset_rmid() since mbwu will always use abmc
> ---
>   drivers/resctrl/mpam_resctrl.c | 65 ++++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h       |  9 +++++
>   2 files changed, 74 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


