Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5E8D3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVLNaYRdyTd3Y3bYKBBodLvCmiY6IvN6c8AunBjxbBE=; b=VIrkfGkz4cxVIAx+Me0yEgHksa
	PFeIVmuHDIFeH7fYD1PX5IyUkhJLVCVNS6/kG3+PwjlOI5W9CJ9rkaaM77+w2S9N+EABgwigCEu77
	uQQXlq7SD2m8lsLPqa/iI8IH836UocyE/Hnl5kLrVFSi3YATPX8Ypck2zGj4XZpFukuvI0fc2uOrx
	G0vy8eWv3cDeya8XZXUn2U9PnDz/KYxfNQ+u2Bsn4BKBXma19ObptZ899oQKhk+R3I5LKSvNtZlPL
	i1ewFLgGz1BEUAPm3MtGVW5B7WtAgHXi2ftkhdyZV94ggg5dyDef1ZBc5M1JddVG7c8cQHPxO2HDm
	O08vmORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCtD-0000000BVsy-1vPp;
	Thu, 15 Jan 2026 02:15:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCt8-0000000BVqf-3Nel
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768443305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVLNaYRdyTd3Y3bYKBBodLvCmiY6IvN6c8AunBjxbBE=;
	b=B1sF1iF77g7nkwbe7xlbuXaijsKAMNqC14BNYpbxc3SLKCGCMf90TLBVt63PEh7kopax5Y
	WVLHC9lDAZBlamx0cl2IEIExTz8xmocZZAQjX8ORD+WUXl+gdQ+9Mm/tjkgMlwlWBWfkan
	pfTHDjPVMoCJEXsnIXtPlh1UbUgMEsE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-SjBxRIiYPtad9AQJopNaww-1; Wed, 14 Jan 2026 21:15:04 -0500
X-MC-Unique: SjBxRIiYPtad9AQJopNaww-1
X-Mimecast-MFC-AGG-ID: SjBxRIiYPtad9AQJopNaww_1768443303
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so312311b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768443303; x=1769048103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVLNaYRdyTd3Y3bYKBBodLvCmiY6IvN6c8AunBjxbBE=;
        b=FWudvoNcla5GlxJE4/mznDcT0SCMAFY8hC0vIng/ZQWnG8OOI98gorcgD3IvuaAD+d
         aA1pOWHhY7TXM+HLw9gfbnWhyQ24uuft/E3+KJzXZhu8e9ATNnerdTyTFYcLp3zk2r8/
         mM/ZwtBBbpSNRq7zkM23XeL03E/DpGMhMSuBHgLFGmmBgF7rWDMSYIL/L7+wXYhm+vEF
         PazmrfeFfhvr+f8kcRRWPwD9j0XnoHzmjaCJjz7DdeBkzNyKXsIdnNvPUsQIGa9SIh02
         vFc2Df531hqYE82Ri1o3m6SisYz6YO+TtMdzdCcbIELU41Nf9qWZ2bK8NRUN9f3VJ+uf
         RScQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTgU0bwIH4THB+5oNhJYZisEWJu7t8p2q1Ley/q8RGycTrFnpzTNKIUdTJQFIr9GvDmSBgQIp2h+9/L62sRABe@lists.infradead.org
X-Gm-Message-State: AOJu0YzrN6vJL4rEZO2OjCOm8elbBxK8MinbIzmBoCLKluUn4KQeume+
	WQYYbhQab0bjn5vS0w0C55G9lM4wHG9eU30XJ/MXyfI44Q0L6gQ0FwzhZtb9m48pbXQl1VganRX
	tt0g90HrL7dQX4kfNNCLjwoUlzf/28tXi7A7bwHHDspn2DU//faka3dN8hmXP3Gf1uFPDYxxW5x
	R1
X-Gm-Gg: AY/fxX5QFxyBIS3jPboBbdeBhIfAtLseFGY34jJDcEHq9Z0LFIBWxNoNbLnNlFJYF+u
	yq6LqFkuR3fjUnS8zFX1xPSihcdzvWYIGxfejwAsOIZ73jjRup9het91m3hwyRGvPwcg6PqFqv+
	Rptj4mcsHQNO9EXVYlfyF6WLJBKQgnqA+fi3nog55USqKm9HMzsDuKqvdn2HDOG1eRK2+526e8c
	CZany1GYnnt++pWPBMywFIzUpO/hucA/369J/PmFHB3nEKgwiq+QyhvbUBDqWDXty+Zco6d8grF
	tG+vBbWfVDhPHY6PECSjxAvu+MZu2KzGQTrCxJMflvXslwZMBRTMGce/n3ZWzJMcQuazUxrhDOH
	6cm8XiL54lv8=
X-Received: by 2002:a05:6a20:7f96:b0:361:2c56:fca8 with SMTP id adf61e73a8af0-38bed1ca1c6mr4829249637.50.1768443302921;
        Wed, 14 Jan 2026 18:15:02 -0800 (PST)
X-Received: by 2002:a05:6a20:7f96:b0:361:2c56:fca8 with SMTP id adf61e73a8af0-38bed1ca1c6mr4829208637.50.1768443302510;
        Wed, 14 Jan 2026 18:15:02 -0800 (PST)
Received: from [10.72.112.168] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfc2f481sm23240011a12.10.2026.01.14.18.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:15:01 -0800 (PST)
Message-ID: <cf2cc08b-9170-4ef2-9f99-e2d901b40c61@redhat.com>
Date: Thu, 15 Jan 2026 10:14:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/47] arm_mpam: Use non-atomic bitops when modifying
 feature bitmap
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
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-3-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-3-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V4fvrYk4xW8DDLUrVoKJC5nUcLAMB_e2Srgg_X1b9nI_1768443303
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_181509_790238_D7744CCF 
X-CRM114-Status: GOOD (  11.01  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> In the test__props_mismatch() kunit test we rely on the struct mpam_props
> being packed to ensure memcmp doesn't consider packing. Making it packed
> reduces the alignment of the features bitmap and so breaks a requirement
> for the use of atomics. As we don't rely on the set/clear of these bits
> being atomic, just make them non-atomic.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Add comment (Jonathan)
> ---
>   drivers/resctrl/mpam_internal.h | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


