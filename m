Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1975FC72CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDPVpBhxfGUvSSN0XoYbTldidy0ABB4XqU6mDSv+4+w=; b=Qe2UNphylI8/87Q9dK15cibED2
	DkSZ8I017jiaIwCQM6ig5imaUyUblNbHZEVSAyrVHjoKPyDkk8mpcp210uA9RKfgeMC5lOQTuC/hV
	wmRPe+7VrLz0U9GoKYFiUkoPKDq7eG8SvR5HlKl9mQ9tuBRRhIHWJ61r41L2eA+IDkX2PlmqE1dyZ
	/592xqu+LlQAxggImgQWfT4f29FIEpJMQ03gYYo8qgUtm3gbZqjloHm3TmtyRQEkHXX3HOz5M05ZX
	qHg6K/oIi1QadUSmadfnYql8TMmJDL2+U10WwwcchUwN2uRNkRE4o5Ev6XbrOaqoZtovAQwheCzVI
	O/WeHq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nsw-000000005CU-0h5X;
	Mon, 23 Mar 2026 22:36:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nsr-000000005Bt-2MiB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 22:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774305388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDPVpBhxfGUvSSN0XoYbTldidy0ABB4XqU6mDSv+4+w=;
	b=hyiJJV+aWolWWFwMNwZ6mBJg8GxwDRyZAesdMjz1jIQHNzT4EIYWp5Cs6LjNqgwdh8A7Ut
	Nj3s4a+9O/Ju82PCFWMwjEFAeC63w5dCu7TlthdWZMsgHqzYWZsgi9octuU+4iMGH99La2
	VVxFHMqdzNGn1dj4uWuVUDtxrD5rwZs=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-xjvRT-I8M1SEl18MBGVegA-1; Mon, 23 Mar 2026 18:36:26 -0400
X-MC-Unique: xjvRT-I8M1SEl18MBGVegA-1
X-Mimecast-MFC-AGG-ID: xjvRT-I8M1SEl18MBGVegA_1774305386
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso1032727a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305386; x=1774910186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDPVpBhxfGUvSSN0XoYbTldidy0ABB4XqU6mDSv+4+w=;
        b=aTK3L7FWxFbmh/maB44XBqF4Sp3sD1na0IUIRt9af/W85vRfS7hXUcLt36g0ITmP1A
         rrJ5WVsvbTJ/dmESitS/gz/aGPQ6uuEITBXYVo7GBF1ur/JOHbmVhgRDwSzaxmq1DvgY
         hYxA3nMdRTyltT8a8nL38jq8W1bKpt8/fYgAks5ceK3BScxx9O8y5fyVX/nj8kQGAl9+
         sIdwpyiFbTQneAGdEFEF/BnuHgC9/cXE6/tMgkA/aUkWSBu0vgJeDhtucXOJ5cMF/FNq
         jajYawORecNKirVHFccbN3MJYKWDR7gg+SHy1TF9+wnRXMJQng0Sw0AS11ki0vLqvm5T
         oHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXHWJfOvd0HBpneHFocGpmAzH8KLIVppuiw1SDs/2d3Iptff3A9km5tv0NGEcqS3goDQ1NcFdNz9VnHlIMxRV+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmk6S9Tje8ykjuSLyJWw4vZlvj1nsNMj0MixBQI4/171J47FOi
	t8aGE5q6mwFtYSkFmnTUk7/tC8yGx5HjqDh0qiFTEKw3JtOmIkc6+dl7mob+SxU+zaHzb0uus8L
	2rycNDvrvWz3qf3UJi/AsCPkJSbwswKGu9Pbaa87uqs6jW2Ih64qzG/t87/oyRRf7AnNucx14ep
	E1
X-Gm-Gg: ATEYQzyjnnKyOwPpmp1JnOcwzKbbNt8o8nSN4ctFEqYNzscDdcI2glQq6KVChfUxnIF
	Kd2DNsnv78JjLhTr9kUMUUDO7mq+tzasVo3VP8tAbM557AKZNUJRgM1r7g2KK/OBiA9/eaZCeQD
	CzPlWxyeMQEQ9U2DxIGQIPpyImOnLGdRxS4Cek4Chj/M66zmYzviCUaTpC3K24y11f4YbDyrwu6
	IUHGNQV9jn/ib4kqIe0L5m+U34oPN6nkdaHlFPD9dh30kGLXU9NWJkGQJLXWF0KOUi20k2vjUXW
	Y1NU03/vyMGeKLboUVqQDRMWbZjUpSfAasfABeF+6Sugan9KBORdQKHaYusN3PS0b6hGt8YGKMg
	2yvq6T1uPn12udWUNb/JW1z+ySbwUk8Lcslu49ZwzHVU9HaRxymjqqRfWW/Jk9ckA
X-Received: by 2002:a17:90b:3f44:b0:35b:90e7:c453 with SMTP id 98e67ed59e1d1-35bd2bbe40bmr10223077a91.6.1774305385952;
        Mon, 23 Mar 2026 15:36:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3f44:b0:35b:90e7:c453 with SMTP id 98e67ed59e1d1-35bd2bbe40bmr10223032a91.6.1774305385578;
        Mon, 23 Mar 2026 15:36:25 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c017a161fsm139948a91.2.2026.03.23.15.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:36:23 -0700 (PDT)
Message-ID: <078a7efe-4f5b-43b4-8252-4de36769a94a@redhat.com>
Date: Tue, 24 Mar 2026 08:36:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/40] arm_mpam: resctrl: Hide CDP emulation behind
 CONFIG_EXPERT
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
 <20260313144617.3420416-22-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-22-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p4bbjYax0gsQBTfcTWVXl5CboTTjzoFuSt-srGbvkPY_1774305386
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_153629_681836_A72DA77C 
X-CRM114-Status: GOOD (  15.76  )
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
> When CDP is not enabled, the 'rmid_entry's in the limbo list,
> rmid_busy_llc, map directly to a (PARTID,PMG) pair and when CDP is enabled
> the mapping is to two different pairs. As the limbo list is reused between
> mounts and CDP disabled on unmount this can lead to stale mapping and the
> limbo handler will then make monitor reads with potentially out of range
> PARTID. This may then cause an MPAM error interrupt and the driver will
> disable MPAM.
> 
> No problems are expected if you just mount the resctrl file system
> once with CDP enabled and never unmount it. Hide CDP emulation behind
> CONFIG_EXPERT to protect the unwary.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Adding this ugliness in the hope of avoiding patch churn and extra
> reviewer work. I am looking into the resctrl changes needed to fix this.
> ---
>   drivers/resctrl/mpam_resctrl.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


