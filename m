Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807B5D58CBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKHlNzVZ8flcJLfDOJhZcXKBIi7eEiUriVf/nusyPOU=; b=FzbVwGaXCZNGEF/yv1jCCuzb4A
	5/8jzqg5jruQK9pBQ2zuItYYhD+iKzki4+ftbDWn/zhDIJfibFwesi0c9DmsXF72LqIxDqyceyink
	tO21RmO66s+Ov6mK5F6Bjp3HpoqtnFpjtcWWW/MbtLdMcXbmKKQWqBD5IaHZa9zUOssF+ZhaNpvaZ
	aPf3syrSwbhXKGGivq0RaBKvSKF3xjrF0KPqomCFqlg5tOqWT6ObkQ1mlUMF/GylRFtN2bJzgFSpz
	LDoPhaJFsx+DyQ6IcnYHaJ2LMdAB55MJi2FZ8IvkT9plAW0PRuXFQBsAPCyPj2LF5bVsmsbCxonsM
	eE6IxiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4XAG-0000000G29n-1YqB;
	Mon, 23 Mar 2026 04:45:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4XAD-0000000G29N-0G2d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774241115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tKHlNzVZ8flcJLfDOJhZcXKBIi7eEiUriVf/nusyPOU=;
	b=g1c0Rbw191iJO0lVKy3Kk9UH8kX44htvhOSXjqUWRbd0x5kwN/l8hsTs7LxuZWF4WgABrL
	2shNjGD+yxG9ayw63ZhwDuHJhnb9UPE5Lwd+KrnqNHUSmCwHmzcMLd1LEcgjN1rbmcvkA+
	7gaNA5l0T92VfCTw31rhC3dJDzdMZrU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-LLjlH8Q9MemGPxGwMoy_jA-1; Mon, 23 Mar 2026 00:45:13 -0400
X-MC-Unique: LLjlH8Q9MemGPxGwMoy_jA-1
X-Mimecast-MFC-AGG-ID: LLjlH8Q9MemGPxGwMoy_jA_1774241112
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aed1beaa73so49104875ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774241112; x=1774845912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKHlNzVZ8flcJLfDOJhZcXKBIi7eEiUriVf/nusyPOU=;
        b=QMearfPZej0AxnH/AZ3P01jA6eSxyeuxc/KGV/BauUGhJUYljrOXcGhIAjRxYu4r/6
         wpUfw5UZ7e0hsf9MMcZ86oEA5Cfr4x3jsLTlxW++O+KjA7yXiTEKX7o2N0P/7HjFCeFd
         CJqGmvJ2R6JapMS+wYVzmJwXI7p9k3gvmszYjQoMIzKddgiPfMir6O/cB0vaG0/GGpKP
         Pe7BGU3shWW2xR+LePAExlnPlYz8iJqOOL48QLeYOTFTwFAzeaavq+RosRMINwvfg1Fk
         B7f3Iwit9oXdA7CHhu3fPysyoNO7PhvdWwD0fugHDoQsJ5akoAZxsuX1lGtQSJLXB6vp
         oyiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDO+ielE49/akZT4eBXzYpObLS1Xr5ZHhHDV1S9qnfuKKU8HKb4HZbrNjVpxZZh0VuZ3p81GJrFswCvahlJftS@lists.infradead.org
X-Gm-Message-State: AOJu0YxrnGBXC8j80blhoAcg4sYRb038EbB2ePiovbZ7rHoktIT+IRzC
	Jo5fVPRI8dHFAQnU4k3Gc09ku1AfYGdCPtTe1ban6DnWRbvg5HbK8R4dZJn1p7/G0pKFp1jd6BF
	2tc12cnxWyv0i/EneXq6EqMFjRlUxktmLzzc9jNKIRlFKfU/nUbc64lfLpMo/AxdTJEuc291mw1
	nS
X-Gm-Gg: ATEYQzzyjI0ohMOBUB5RptSUYC2WIsjftl+J3Tiah30aAt9Vfq015nxppdlXBMMKoIc
	Y6DcRX6TTl+SUHRZ/WD/ApklVO5x6+4sC39hZmsxggSXQldnb5IARei01IPxWawvNYO1FS5PsI8
	Lo2qGzqtVW70HAgOa2qpnImRsV739dB1hKPII35B+QN/wN3L/Tb4kzbpEXqZ03yPaxBmRUY7NPg
	zpCj26sRSunI6Sl9ofb25vSf7CzkqLYIUB1R0np9HyJy6ORhFrvRa3KGoNEPpx483JS57IlrSt7
	a7Ew5lx24+YpaihCd0Mi+0WIX8L6v0TYovo1wFYlp0AqIp+h4BWzp/nyzQz5NNmyHyX9LZIK4Zf
	SezJx3ONYXqDprBIdeydby2k4GQhax837Lav2sBHwetWFyDo6JAmuskZZp3ABW8nP
X-Received: by 2002:a17:903:244f:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b0826c7097mr103435975ad.1.1774241112000;
        Sun, 22 Mar 2026 21:45:12 -0700 (PDT)
X-Received: by 2002:a17:903:244f:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b0826c7097mr103435595ad.1.1774241111581;
        Sun, 22 Mar 2026 21:45:11 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369e41csm96333595ad.74.2026.03.22.21.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:45:11 -0700 (PDT)
Message-ID: <35f92bc8-1eb1-43a0-bed2-aaac87a61c19@redhat.com>
Date: Mon, 23 Mar 2026 14:44:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/40] arm_mpam: Reset when feature configuration bit
 unset
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
 <20260313144617.3420416-3-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-3-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ziDpLuS0ihBQP1HqO5e_zOPHYigyeYQF_LkCnhZMwuI_1774241112
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_214517_181733_EEDEBCFA 
X-CRM114-Status: GOOD (  17.82  )
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
> To indicate that the configuration, of the controls used by resctrl, in a
> RIS need resetting to driver defaults the reset flags in mpam_config are
> set. However, these flags are only ever set temporarily at RIS scope in
> mpam_reset_ris() and hence mpam_cpu_online() will never reset these
> controls to default. As the hardware reset is unknown this leads to unknown
> configuration when the control values haven't been configured away from the
> defaults.
> 
> Use the policy that an unset feature configuration bit means reset. In this
> way the mpam_config in the component can encode that it should be in reset
> state and mpam_reprogram_msc() will reset controls as needed.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> This goes back to the initial feature configuration policy that James
> used in the MPAM base driver rfc but I unfortunately
> suggested him to change it.
> ---
>   drivers/resctrl/mpam_devices.c | 40 ++++++++++------------------------
>   1 file changed, 12 insertions(+), 28 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


