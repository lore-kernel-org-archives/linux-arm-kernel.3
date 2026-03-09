Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A750EF36E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/VoQtoxtMjinR0wQxRIglh5sEAwoToR0YD9sANGcxY=; b=UbDwmhKSpzdZksBQyG4turzyWK
	EgbktYBEWPxE9embh2WfYcfBZ4spa7rR3Ds1GIG6GNPvIMlg2T7vcTspQNrcMHQj13RiKhki8uHmT
	xXWSW3L5ct0gFcpW5ald5RWVpxbhZaooDS0NA5gw8BulfYMtKk/AKSeSDuzv7OWjP3pZI5g+decdU
	4Nju/NzXjetA5ngDgzkyzz2/FrQEDLQ7+Jyg+ndP51gSH/TpZwp9DPfg1WXkRrrjTBgUZJp65qsBy
	5wwElFIuhOM+2dOinERuT9B8xrvRY+UmXCYbFaswRrKVomZU5Sa/WUy1mGwZckv/3Mbq0kDVD2tcH
	FRJbWzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUNS-00000006l2l-2Vjy;
	Mon, 09 Mar 2026 06:46:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUNO-00000006l1Z-0zWr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 06:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773038761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/VoQtoxtMjinR0wQxRIglh5sEAwoToR0YD9sANGcxY=;
	b=hgY+E/Iq+A6xeGG1Uzh/JzOpklN6SXHZmwlnp4zQbKZWElo9riqOowLFR1Uo6FHVOzPOZP
	21wDTHnY9+xtoJ0Y/0UJpY98IS8ltiLWRlnoVWkOECVKnESgkhyRS2rhPBc9OH0GIKPKGv
	JH2BzZFNHz0jev66uRPrfiU4eOu0doQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-Tr-F4yOlP_mv8rQXJAB_gw-1; Mon, 09 Mar 2026 02:43:39 -0400
X-MC-Unique: Tr-F4yOlP_mv8rQXJAB_gw-1
X-Mimecast-MFC-AGG-ID: Tr-F4yOlP_mv8rQXJAB_gw_1773038618
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b8bb5173so361465b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 23:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038618; x=1773643418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/VoQtoxtMjinR0wQxRIglh5sEAwoToR0YD9sANGcxY=;
        b=NjAGdZ3ceh6R304RMbv9gH0mXJs2WoVUkONz4MZl+LVYwYgfnL6CbYUywmpRN7vVXT
         2YfaVpXxxBXzAKpnC/hoFKBQOAPkZZRWZ9tTP4ChnZkRG+BHuSCIhdr08WQ4XcfFtaQE
         4KzxnFLLdpfEMa1modtxUz99Xd/xtvlFJzfwBWkyCG0lA9OruRGLzWncw4ZbnClHA/pL
         cPZEnsnzA0GZcP4MJATTyDC+i2iJzz5QJ4MwOedc+fq6K6jzNpMq19DRQZp1N8k2z63n
         o6WHWY9R3XETBjbQv+Ci+pkLrec+7eUT7nIOC5Uo/+dFYYCT88bTdGlTXX4ftRBtwpOc
         2zqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdJPIDQsbGGyoekziJ+QPToGjZHkw+EdvW3h6ZxBnTibttZlXnGh50vnObpjt2kftrGHiZ97T+GkJmI38WosYq@lists.infradead.org
X-Gm-Message-State: AOJu0YyBwEIT7reqCsMbWneoCysRKo5kMR17ZJqsuE1kwRKumqyBUEki
	pUU9mBv6GfumV3zeqgH3DnkSGsNEc8JaWx4CoYtG/isstrkxuunzJBGPjTM2OamAdK9rCvO3f2X
	6oisTjOUi2GUorfHypFz7ynRMp8lcIz8zmRJOty7o0Xb/D2nbVQEmSZ5CDftcA/+8vdmKzcxmBr
	mN
X-Gm-Gg: ATEYQzyYKVt7zq1gTpigwJBlqo1a/2XhiMFy+nDyk7YZhgD7YhXa5uqHWzxwOC7BiAo
	5c1gvCc/o8R/nDOsXMnYaQnGZ+GvjuvM50+RvO790yotRnfm1yjcrOtOvuRRKweW1nwRt3QyhyC
	NgdhhyHG1/gi91BQL1oAW4jTTwpZMGd+EX0SXdSPoc0UrppKQXPhutiAKAlUzsq9DBdx8ily0x8
	Hf4XDiW0enGwr/npsrfhSrHS0XpJnX8fo+IjRAlhHvz9yVT8tyV5rRAx/jfvY0zuiDycljK6ei+
	afKLLnjezHHdVSEmj+W8RUBCECqOF9QhuMHzqAFFwg5GAgGl9W77BZvtxdR3FF2CVi0jYTMI0P6
	nIZSXLP/T6tYbNfCjN2hz6lVBC12uqK+NbxVU385e1i3ct/IabbNyQDgLcGLAnqRI
X-Received: by 2002:a05:6a00:3e14:b0:827:2995:3ba0 with SMTP id d2e1a72fcca58-829a2f67981mr8452998b3a.32.1773038618123;
        Sun, 08 Mar 2026 23:43:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e14:b0:827:2995:3ba0 with SMTP id d2e1a72fcca58-829a2f67981mr8452979b3a.32.1773038617730;
        Sun, 08 Mar 2026 23:43:37 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3871sm9235407b3a.60.2026.03.08.23.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:43:37 -0700 (PDT)
Message-ID: <57dbec80-4cfe-468e-b32d-7dc0f872ed67@redhat.com>
Date: Mon, 9 Mar 2026 16:43:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/41] arm64: mpam: Advertise the CPUs MPAM limits to
 the driver
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
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-8-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-8-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mHuQF3KkjxMrvW0Z3GIcsDa48voWuuGVUilTssWEDt0_1773038618
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234604_354511_03798C5E 
X-CRM114-Status: GOOD (  16.13  )
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

On 2/25/26 3:56 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Requestors need to populate the MPAM fields for any traffic they send on
> the interconnect. For the CPUs these values are taken from the
> corresponding MPAMy_ELx register. Each requestor may have a limit on the
> largest PARTID or PMG value that can be used. The MPAM driver has to
> determine the system-wide minimum supported PARTID and PMG values.
> 
> To do this, the driver needs to be told what each requestor's limit is.
> 
> CPUs are special, but this infrastructure is also needed for the SMMU and
> GIC ITS. Call the helper to tell the MPAM driver what the CPUs can do.
> 
> The return value can be ignored by the arch code as it runs well before the
> MPAM driver starts probing.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/kernel/mpam.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


