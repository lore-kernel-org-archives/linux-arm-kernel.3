Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490EDCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSDHOW5XasPVJqQA0pLiGIBUxgDXQ6cYHB9Lnz+lgvk=; b=ggZqWpEAQdrjo3wtuCOv+rqhlG
	QoKmk+tchmZDeiRg2auBdQHyRLiituPp8M6uKIA2wK9mwaDn7Bj/tzpKd5vte1C2syqOzKWcbO0kM
	Va4WbWLYnqZubfvPIeWIw8VZMfft015FPiEHN41Kuj1ZxnCSC1cdc69RT8ThsXz7ib4OMm8Uc9vvi
	lilJnaB3brQCJ0kCRObXIDTymbZ56zmolL9wZ+8Y4+mydYVh8RnZnbXPXYZ+bcAVx8ECDpAs2lRBs
	emhJF+nfPUmjG2YukkdTA3aItUsi9HS/d0ZZWWaPkNnmexI1jtX3rugFiDvneGULlpZUJzrWIJCON
	TMnfOjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEf1-00000004TzN-2xov;
	Sun, 09 Nov 2025 23:17:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEey-00000004Tyj-2ddb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762730243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSDHOW5XasPVJqQA0pLiGIBUxgDXQ6cYHB9Lnz+lgvk=;
	b=SRRp9KkkdMBcttx0I7aIGfW8n6Q/JQwQEoKCdomnleVmmVm5ZKR+YG8mcDyuuJf/YSwTsT
	yfgt+gwAAbbHr1pt5MKmm23R8lp/lyHCviAqIIn46iAKYxoREBM+z5QbrohC/NmpaURc7m
	xQCwDHsziv9fwoPWpVSzsCwuSrJfDyg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-B886ITX0OiuvcOoIUMt4lg-1; Sun, 09 Nov 2025 18:17:22 -0500
X-MC-Unique: B886ITX0OiuvcOoIUMt4lg-1
X-Mimecast-MFC-AGG-ID: B886ITX0OiuvcOoIUMt4lg_1762730241
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f610f7325so2029209b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762730241; x=1763335041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSDHOW5XasPVJqQA0pLiGIBUxgDXQ6cYHB9Lnz+lgvk=;
        b=tXAEk0sZ7hTiAgCc+HpLZoulQznezfaB3R9ff+cofTWOq3T6OP5K2r/deMyLR9VOvN
         mJFR+/2PoZvHH2MuQ5dnNkixrgf3W7DyHuzA/EXlwtBtbuC0IDjKaSqkI4teB+5YqQnR
         2tTYEsFLRBQrqkghdILYD3FxftmjgkGGSs+Wzx1mU0sjct0vkFsAJdLvfYZT5Gm1iejj
         LIUVvPXbHpd0LOKdETigAn6gf9F8ZxIMfomgpxj7vQc8VnDId4t3KG9YLBN/YeL6I6+S
         yENujnvT0bNJnx2V9h+NB3o4+CmxGSbs/N+rLhd88CEmVOeH0dSsM5DwT3+oHHfyyKRU
         gvFw==
X-Forwarded-Encrypted: i=1; AJvYcCUN+syXejHkyweMB6VZX6BP1oC7TCb9n3u+c2Asp19SWofmIb85aWzTx0d2ifacunfFAT8yBjmdX0F46nuCcTwj@lists.infradead.org
X-Gm-Message-State: AOJu0YyTXzaU7jOlUbxVhFmHUfnAUWJXNXz2PuqJKbeEHPZ3Ohwmp+nC
	OJrC03oeIUpSOzJnx7yX6biyrJQqM4H9nLGiehGQATinS3bcwgTjQPNmmoqwyeyXSgaukGf062E
	jjM29uswMJzWMBsawc5Vsta03x/71qv8jmvINo+aBW4hmAy3CMlHL7U/vQdEHQBmHEJkxybk0lF
	bp
X-Gm-Gg: ASbGnctMF3mQjZClTn2lSoq4qLsMhopFZr5WD66vGUrmeO8GTKTJJUqK2oecdNOyJCX
	RRZmh7mOK8r25nyKoHuL0yHlAjU0U4hyBIiDwmb0+tRRoAjtKe/sFl4HWGX72srE7aOCNVtTGtj
	5ddcQUXDIoCV257vGhh3mwjY5n4sGAYRtSPdn/4kzY3890wd1dSPjtR4G3mHjQ2aIMMigtG6DsA
	4ONZ8+aZTL2p7Ln2XKo11NMLyAXtCFlE0b2XknHToAt/ze/SHs4GgNqkc7UAkvsuag1CmVBME5g
	gEzY+OHrn2xavdVD88QW9UMTIMRitbHJcetqT+ITT9AmHTCAFvOkw3kCSN04Pb/QVBYDG4pqnv2
	rsUh07oY3Sso5RuVgrxJ6IhINRJuK27SNH0I8YjI=
X-Received: by 2002:a05:6a00:92a5:b0:7a5:9cf5:b34c with SMTP id d2e1a72fcca58-7b22699a31bmr6235511b3a.23.1762730241538;
        Sun, 09 Nov 2025 15:17:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyJ8mJuDYzT0bH6fnz8FfZfCseiPLOpolrjUCoQmaU79/ynR3kBTkMtZAcp2qilkrB0mYBjw==
X-Received: by 2002:a05:6a00:92a5:b0:7a5:9cf5:b34c with SMTP id d2e1a72fcca58-7b22699a31bmr6235495b3a.23.1762730241214;
        Sun, 09 Nov 2025 15:17:21 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccc59e44sm9611875b3a.64.2025.11.09.15.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:17:20 -0800 (PST)
Message-ID: <06833ea2-0f9a-4429-8f29-4a41f462c0c9@redhat.com>
Date: Mon, 10 Nov 2025 09:17:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/33] arm_mpam: Use long MBWU counters if supported
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-31-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-31-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QcpbzUtzETMcq8gQwqC2obnSjAjyzJjGC3_LWtYFhBw_1762730241
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_151724_771171_1B9EC53F 
X-CRM114-Status: GOOD (  14.50  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: Rohit Mathew <rohit.mathew@arm.com>
> 
> Now that the larger counter sizes are probed, make use of them.
> 
> Callers of mpam_msmon_read() may not know (or care!) about the different
> counter sizes. Allow them to specify mpam_feat_msmon_mbwu and have the
> driver pick the counter to use.
> 
> Only 32bit accesses to the MSC are required to be supported by the
> spec, but these registers are 64bits. The lower half may overflow
> into the higher half between two 32bit reads. To avoid this, use
> a helper that reads the top half multiple times to check for overflow.
> 
> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
> [morse: merged multiple patches from Rohit, added explicit counter selection ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Cc: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Peter:
> Fix type checking, use mpam_feat_msmon_mbwu_<n>counter
> Reset/configuration order of long counters
> ---
>   drivers/resctrl/mpam_devices.c | 145 ++++++++++++++++++++++++++++-----
>   1 file changed, 126 insertions(+), 19 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


