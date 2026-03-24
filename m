Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD7DF532CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrY75ExbEGwLC6e6b4hm5qIxC9Qaxczyg7KXVZhCcHs=; b=hq1DMQ/QGB4Tb6kCst25vfZCtk
	bv5vq+h5y4uOJ/mle/LVdfujW8n2cMXXYARJ64/wJyhxwOPRwIwSllZovlmpMQoONo0LQo8WBGBJP
	oah9rjhX2BQEWkKF8kJVztGi7ORwxRcBZWdN6Wo7T9FYesaYMEqtDQER+iF6NTWYvBjAeZT8nol8o
	rB5MtAAPqtaWofcway3Q6yztTEIg/baOwWm0gXVO56wBAZXFYqSeqMle6BS60f+9kf4+6M4npGsGw
	gINQS22X15pQ5at3Z0MO+j0vPpRHqNSVVgoVUGFU/7wfGso7CEXNKq0FhJKV/YGLw2JqvbN3smfje
	nIRGifow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4set-00000000VC7-3r2E;
	Tue, 24 Mar 2026 03:42:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4seq-00000000V9t-1eRA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrY75ExbEGwLC6e6b4hm5qIxC9Qaxczyg7KXVZhCcHs=;
	b=VMclFvxL8GlFT4RJJBQoPoo3wXQI7izBAt2msEO2Wdk9IF8Z1wUkPm3p5nx5bcVmRogzqj
	zyfMeo2y/HszsRqnd7MhlMG9/N1cOBEPsU0W7HS0Y+t2RHO4NB3o3m2nqPVsTSLxeTMAvj
	6K4FNVeScRqFoueTMwPxmZDeK9pvKKw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-WC11GOF3NCumwhsL6VENhA-1; Mon, 23 Mar 2026 23:42:17 -0400
X-MC-Unique: WC11GOF3NCumwhsL6VENhA-1
X-Mimecast-MFC-AGG-ID: WC11GOF3NCumwhsL6VENhA_1774323737
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c74217894d9so1965074a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323736; x=1774928536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrY75ExbEGwLC6e6b4hm5qIxC9Qaxczyg7KXVZhCcHs=;
        b=V2NTWehhZWBSflqjO/GbUtTC3QhAfodHSdQ8bS1cVZP3zM7etdMHZq5qh2S/CI6F60
         ucUHGxWHFCaSbkGRnTe5MtVeKNvOZ5AP0hDExH/RcbbWveIIRkQ1vGNU6XF7XtNSP0iI
         Kh5Gghj2Vf6h9ulLWObOruCSMfa5Bltn0bVxsfiCArPkR7wVJnuAznAqXJEIFzhtz3aa
         MCxzy2E3UvrjbXFFUNLynxVVAFSxGTz+fPZN2pH3PQMlbUdfR63pM15eWjHgsWDWBPNF
         QNq7uLvpfMRAh51kUEYWD69utSTR+dcKNe7wIpe05Uvig8so3qawqcBAqB3ddZqxOT0A
         tyxw==
X-Forwarded-Encrypted: i=1; AJvYcCUTaNlOmRhJPWoWvaOa4gzRaio56LFqUrKweMKcTXG3bLjoqoIloRQtXse6Kkzk/xrli0j7/woJGctGes9gx6eU@lists.infradead.org
X-Gm-Message-State: AOJu0YzwTFXCUvS2I9pXJO162HEV5z/i2MmZCJYPVpBFKqym97yq8I/P
	pkN9zGftxjGQS1SdHT/eDk+URj5BndHT3U16hHe+VeD6lApm2bfUNssxZae5sQ/g8Fni7lcs+yL
	ywkfuPzS5HK85HK2HLLgZ21guHsxq9eYpkHeNovIlhgL/oVFncpe7L4ZlPLMPrCE7BhsXsqYgSI
	82
X-Gm-Gg: ATEYQzy4IO66c7mpSR9snf5CcxQM5xx7Mi6zbBVbm2GYeuTk7kIkqUNMt/ZuTAjLoa3
	coRsWq00aedeh8lM2mOi9Kx4X4RknxO2+d0Yc0LJAMTvd+pphMg9xmp+00MY9XrhyfxvuyOQubg
	JVr1Fmtqic2cT7rR7IkZP61u3LDAOstenFZLZC5TxW/gBjCqCpBMPiWRboYVwGEk+JtP+E0z0gF
	4cFr8vvPWBVOcW908Sj4Japs8S326USJ4f+g6YFtXrs/Hng8acbVGdFtv8PF8EAVgbGJxgetCRW
	HDI1jmMCEg2Isdf7RUn80JwbSrkrqliq663s1FlcbxaFk+9iHXS9nkl/akZ/+e7r5xiJXkcB3tH
	Lsm3bP7KCY/UqnULeJE3EWEcqkgsuniZz1BRgVQoi4zS+Nq08Na2eTWnTW9VEaeyg
X-Received: by 2002:a05:6a00:9082:b0:822:682d:2c5f with SMTP id d2e1a72fcca58-82a8c351e8fmr11844800b3a.28.1774323736535;
        Mon, 23 Mar 2026 20:42:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:9082:b0:822:682d:2c5f with SMTP id d2e1a72fcca58-82a8c351e8fmr11844744b3a.28.1774323736109;
        Mon, 23 Mar 2026 20:42:16 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc1ddasm11266861b3a.19.2026.03.23.20.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:42:15 -0700 (PDT)
Message-ID: <2821b930-3cee-4358-bcfa-1374c5cb2055@redhat.com>
Date: Tue, 24 Mar 2026 13:42:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 31/40] arm_mpam: resctrl: Update the rmid reallocation
 limit
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
 <20260313144617.3420416-32-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-32-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s0ZpR5mgcnF9NB7nsVVEDKquClH6i91p1jI8BRdG7KI_1774323737
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204222_269973_F304D534 
X-CRM114-Status: GOOD (  14.48  )
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
> resctrl's limbo code needs to be told when the data left in a cache is
> small enough for the partid+pmg value to be re-allocated.
> 
> x86 uses the cache size divided by the number of rmid users the cache may
> have. Do the same, but for the smallest cache, and with the number of
> partid-and-pmg users.
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
> Changes since v2:
> Move waiting for cache info into it's own patch
> 
> Changes since v3:
> Move check class is csu higher (just kept to document intent)
> continue -> break
> 
> to squash update rmid limits
> use raw_smp_processor_id()
> ---
>   drivers/resctrl/mpam_resctrl.c | 39 ++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


