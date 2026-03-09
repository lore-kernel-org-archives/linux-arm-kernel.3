Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F745EF36E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmyjTIiffZpRJPT+RQ+3fTrkf/WN2/enrX5xBacS+iI=; b=JNa/f4RxXP2GUH95Y+Ux9SC4BV
	GgDnHknL1tPGSXcqjNQQ1FjZIecEC65JM9HupCR7Bn2Ueeh4Dksy5chpJjh4pN/ciYboXqy3ZvOCt
	qzx62kIaLxH+LN/MCvT3n0WZ9SdMlne9wjsC9nQTXnCRrNVMXyHmL9fn43HVmUynMPuZMunljuSKd
	9SCNxxgTRTPohcktdmANPFhJ/7aq848khkbtbGr2JO+ukBEG5HLCA9e0CPE1qqrGvEs4ypIBB45l7
	FzEIRUDc+bWhhCPzaFaSAr0U+e+IFuoZ+N/Z3Umw5du+QWrdM8u55X06sgM2ffEREU4H80vhK76zM
	rk+0dVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUMC-00000006kgS-07d9;
	Mon, 09 Mar 2026 06:44:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUM9-00000006kfo-41lA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 06:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773038685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmyjTIiffZpRJPT+RQ+3fTrkf/WN2/enrX5xBacS+iI=;
	b=dt7gBblBNujXao6MSRhtJ+zbVHg2KPJmUEdxaItd4Q2u7CFLa2/7xnyKlw+vqLqfsu9yCY
	zCQfwG57pYZE3hf5jt/2d8TfmuvLJWmDbxotldyrKjiWC+aGIaKq658ABsfVjGq3u61PUf
	m3Y+GpC2KTgWJcZ0fyndnHS9lwMvb5Y=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-1RMsomRxOC-hyiYtBrwxdQ-1; Mon, 09 Mar 2026 02:44:43 -0400
X-MC-Unique: 1RMsomRxOC-hyiYtBrwxdQ-1
X-Mimecast-MFC-AGG-ID: 1RMsomRxOC-hyiYtBrwxdQ_1773038682
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35980affbf3so5600133a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 23:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038682; x=1773643482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmyjTIiffZpRJPT+RQ+3fTrkf/WN2/enrX5xBacS+iI=;
        b=SDFaHx6H4+t0NIXrH2WbvUQDFU+eNR8CS0jWXTc5OW/BxJfn/wWTDEL9hCwd5115ps
         K6fdE7ZiCZ9D2Qqi3lpNdhbftpChVHql4ykqrBDwMaK1q/oFR+3dZWk37YjFxkqZHE/K
         +WJgW8P31oYRAiiygecx9dIjgI55UWMQktSXNtJDSnuN8PUWfAbNg6WomTzoG3RQWCAQ
         Y9iqu3Y8MrHjw3pmxi+rrMDBxex0aHlh+EA/8/z/ENvJuUbGfoo3oXyELv/3icSKFLH5
         7O12DzOorz7rSPG/OI6nx2CvkCO5Op9aCHy2kLhadbTTuApNh9305W22bryeA1ie5kLs
         acVg==
X-Forwarded-Encrypted: i=1; AJvYcCW9AtY4WNtm+gLAuceK1swD0z2KdtObpeUZIOCKVPuHaTPFlCvfGPGz0YwZmevJ48VtBFTIRVPpGED2xKOjWPCA@lists.infradead.org
X-Gm-Message-State: AOJu0YyqXXWrEpYvXoF7oGhsMr4Wn9aLZlJcXX1l4tKOw2ZCzhGXW9iz
	sHtKrymLb7kWHqEdV/S0WTpufFSvlZkhMYLf5yrebe8Wjvx/c+jsFAWSR5V497EuzKkWtfXgAcO
	iaXTDZ6fo84SOCIlJQOw3l5GchlQafTqXOCwEKpH8uYjGalVUOgV4mu9WxdWvFBosITZOZtgyz+
	bZ
X-Gm-Gg: ATEYQzzFqEEU39B1KPMfXZFUJPXV8tn2jUnzE/bqJWKyoTHEB3N6WMf/3T6c4TOmMQy
	2fSLukjY5RdY50sNN3YGgOKFdmwTzjz//fbMeF8FhrRzwlyk6OJVdEzUiMF7vgGVV9gl9WKkEdu
	ImhwUNWmKOvKWHpls5le+0s7wVdcjLn8EUtc7Nik4iOFd7zQ7DqZSmhTViRiJo0uzpmNt7ONIuz
	W+WQaJD0h4rKQJUZAFj4XJ0zU/fs2m8cnNRfotEak1V59gg6VOoM75/YVfhiy6IMk5VFoTawfiC
	bEh0FPPDhWfzG9ZMxifxCx8mVWmxca8PJHPLUy3r99YZ7l+6iCeNFwm7XYVK2xWUmQxF7CuoT8T
	FbR+306cAdu4gYCEH+Dx0PuHp/UNYrJzHJUNJgqMYsQOiozxIvUKyEdcLkk1HrVK+
X-Received: by 2002:a17:90b:4c09:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-359be233b87mr8593296a91.5.1773038682467;
        Sun, 08 Mar 2026 23:44:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4c09:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-359be233b87mr8593284a91.5.1773038682083;
        Sun, 08 Mar 2026 23:44:42 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d50ebdsm12993555a91.5.2026.03.08.23.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:44:40 -0700 (PDT)
Message-ID: <c9a544ef-5c12-4ad5-8503-39c28375b419@redhat.com>
Date: Mon, 9 Mar 2026 16:44:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/41] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
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
 <20260224175720.2663924-11-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-11-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ImHu9Vg2pSMOrndZaGi_pab8B-GdLoXpGH_JWFgGCIU_1773038682
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234446_078077_AEEE1BD6 
X-CRM114-Status: GOOD (  12.55  )
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
> Care must be taken when modifying the PARTID and PMG of a task in any
> per-task structure as writing these values may race with the task being
> scheduled in, and reading the modified values.
> 
> Add helpers to set the task properties, and the CPU default value.  These
> use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval() to
> avoid causing torn values.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> CC: Dave Martin <Dave.Martin@arm.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Keep comment attached to mpam_get_regval()
> Add internal helper, __mpam_regval() (Jonathan)
> 
> Changes since v3:
> Remove extra CONFIG_ARM64_MPAM guarding
> Extend CONFIG_ARM64_MPAM guarding
> ---
>   arch/arm64/include/asm/mpam.h | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


