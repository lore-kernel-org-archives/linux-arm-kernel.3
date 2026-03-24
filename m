Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F233F532D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 04:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7h3rGPOyGuFqglRPNrUoy4EwKeWamb75bpgun6g1Zg=; b=qEuDxmvABW+ARPXjZHIitWcSdA
	2PTdkD4Cu/Q8nmv86N9sOG/+VR/s4CpCRr9XhF1pXCi4deUgbgfUrSOzwGnnGb3j50AM5R4RO6cXP
	qrD+7Jw9GkplZYmGPp0/ENyP6jIWIAtZSH/P9ilQnBWthTEZwiFC4FXGi0LlamRSTpOmkqBn3RmA3
	mv+BgMrPIzg82dJ0Rz0hA56vqBv4juw7HuQuRBXAcODKEO9WDiSyS7oK6EdNyYH87T1IjD8cmTDmg
	+zQvd+Gc1VttO657GpDIU2v8eg7YkFf5aVLU7189oSAAVdr5kpFfw4sgiVcvcjcfI5FPEYvGxMZQk
	XsHPm3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tFr-00000000Xmc-2qfV;
	Tue, 24 Mar 2026 04:20:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4tFo-00000000Xm1-2j48
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 04:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774326031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j7h3rGPOyGuFqglRPNrUoy4EwKeWamb75bpgun6g1Zg=;
	b=MXGD+lRgTrmxM+EBcfcnkL4C3Pv22/xOkIqgoXwB8M+rwPouKhySD2bvqxQXKBmm0d21RC
	1nyjc9LVicIf/TN8Zq0bSznIfz9n9ziJe5E8jBoYjv4mWFrvt3BzEy17A95Y8H7lHvo4we
	/hnN67n7qsrcmbKuHeN1bToC+rkXpyM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-1uGYiZOHMOG4cdKUm4H2Tw-1; Tue, 24 Mar 2026 00:20:30 -0400
X-MC-Unique: 1uGYiZOHMOG4cdKUm4H2Tw-1
X-Mimecast-MFC-AGG-ID: 1uGYiZOHMOG4cdKUm4H2Tw_1774326029
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c709551ec08so2870752a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 21:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774326029; x=1774930829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7h3rGPOyGuFqglRPNrUoy4EwKeWamb75bpgun6g1Zg=;
        b=fpvQ9dhLTYPCxbdWR4Ocnkym8g3+8cEe+IY0hmYopDv/QJ1/O5XAZmFHg8f1nw3N4P
         t0yAs7ygj92lnVbbhzCt5CbS48GJE8dZu1vsGP81EoX0dHOkiCnLwaWc+YcXgXYL3hC+
         1xjxS1A3ykKq7qCQ1af2HRHo2NXaIsUeyBfUMwDhR8LkZDmcGU1ONm4JO7L6nvb5zlG6
         3PliwFFaKoc4TQEHKsk9sY+SMnnCdF3P7Spiglu/mI7ipqqBr6V55QJb4Zl46QSQdSzR
         fu5st0ZQl0dP43w7QIGLP+c4odwuUlR9gnqHwfMUvZ1SOuONRfFuzyZ+gByxbSLu2bPG
         i1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCX92S6FqBAZgbajJ8trrRuCSlwemrlwXR6Vc33H0dgOD+VXubvYHdJpSjGtpH5KK7kBWb+8QkWAT0mtk0AT/rBb@lists.infradead.org
X-Gm-Message-State: AOJu0YxwkNDSP+1DSN++igLzWgu+/XdTax3yxh8QcwkzRShv80WEQiPP
	D8R7rO+0ui12DWMK5EgVBES9y/b1lR+6J1wi8L8n6m8vYcS/8qdn9FRfLaDhPKiGiMjDhgk6PEU
	6GXpql6ugRGI2Kuuha9ut/1V5mb/9lfZtXTn9XSzsFKIdZmqskx90+F3a/fE6jawPqYp5WZW/1q
	qc
X-Gm-Gg: ATEYQzxC8LslRjSHGUEi4q4qs2l+5oJHAUGOH8X0isN+XSyRvlc598XYiGKhBne88WY
	fQJc7o/VR6kk26aTwGNyvf/tQrqu5zDKpGW4HRByBJHWxJJdkjfGmXPF+enOcoc5Z0Lu+SzFY6P
	kR7hNY3NWUEZQegQKbfsmcun7v3hSc+I6SwkT2GYiJDgnaar6mdQHtJFgPE7N/JX4QL7Q+cvGCP
	JtrUVjuBGGN89VlMWyIn8spMOeIYDB2W3wbSCiv6UvKmw0ZGcqR/8rEoo1oUvzwo5MTYLQV9Fes
	4d8/EH1Vy3GhI+N9PWEQTwQb9TPUTTOFxWM5rWY/EewrL7t194QYp0a+AcDqnXsCDpKHq1ek1rt
	l8lw8jL1rEPZMVuDbCR5B4EK/lqlRZr9EpL9OknKGYpCQqygPnfCWczID+6n3rZ7e
X-Received: by 2002:a05:6a00:1143:b0:82a:687e:c048 with SMTP id d2e1a72fcca58-82a8c2ef7camr12586339b3a.30.1774326028976;
        Mon, 23 Mar 2026 21:20:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1143:b0:82a:687e:c048 with SMTP id d2e1a72fcca58-82a8c2ef7camr12586295b3a.30.1774326028616;
        Mon, 23 Mar 2026 21:20:28 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be2589sm10542710b3a.24.2026.03.23.21.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:20:27 -0700 (PDT)
Message-ID: <ad5694f7-0885-4cb6-a2e8-112df5a498c9@redhat.com>
Date: Tue, 24 Mar 2026 14:20:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 38/40] arm_mpam: Add workaround for T241-MPAM-6
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
 <20260313144617.3420416-39-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-39-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kBjPLBljh7SCWVPUcx1YWBS3ds4PtKxwdQDenFNqx1w_1774326029
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_212032_766951_2CCF24DB 
X-CRM114-Status: GOOD (  16.89  )
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
> The registers MSMON_MBWU_L and MSMON_MBWU return the number of requests
> rather than the number of bytes transferred.
> 
> Bandwidth resource monitoring is performed at the last level cache, where
> each request arrive in 64Byte granularity. The current implementation
> returns the number of transactions received at the last level cache but
> does not provide the value in bytes. Scaling by 64 gives an accurate byte
> count to match the MPAM specification for the MSMON_MBWU and MSMON_MBWU_L
> registers. This patch fixes the issue by reporting the actual number of
> bytes instead of the number of transactions from __ris_msmon_read().
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
> Don't apply workaround to MSMON_MBWU_LWD
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  2 ++
>   drivers/resctrl/mpam_devices.c              | 26 +++++++++++++++++++--
>   drivers/resctrl/mpam_internal.h             |  1 +
>   3 files changed, 27 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


