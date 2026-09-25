Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB75BC98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 00:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwFdRAn9knyJ21BVNTcGe7areSLJLdB+xLeTWdZf3T4=; b=4ZxIfA+UVj/ZQTye6FZEbnVxJt
	J1bp8XAPoN7GvA3n4YR464QkynBJoj8ODlVUvbF4PLVv0vkSi5TOWyYtpAduPdX07RGLP1ZsVZhPn
	av/YGo6xzFpMxyxu9d2IZPK8SM6S0xs5QyEjxplAzytiqg6zRCSTnO0JRL0JjgK6MUK96I+XGbL+Y
	1Yvfs8hgCWk2KXFAAhxb7RJwHWYY4IkPNBI6v3JCu4PUn63qi9UXr96xwrP6gac63iVa+Xk9cfTxv
	JO93rDRMW0J7NYGfWPfXHTnCPBYCs+r5oCExfDQOzcJ6T8YMrpd5xM+6OtLJT2pMrkNN3sOUK/UHu
	Fk5ToFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tPj-0000000CQck-3iKb;
	Fri, 25 Sep 2026 00:03:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tPh-0000000CQcD-0eeB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 00:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790294619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwFdRAn9knyJ21BVNTcGe7areSLJLdB+xLeTWdZf3T4=;
	b=fzsl40gzpR4agNfy2jv1I51KxzJB/tobeZo71jseE0i9X1skp1n6VGxlDpBUsJNEK6m/HS
	/MgZJ6DR9+rlQPc5/R7z0+q7yfTfb10GINk/rQTVvjeBP+KJzVdXEGAo93L3Vo7lBWOxjO
	0Rk79IvOmhZCKOKRltufwHi+Il+te6s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-6tBV9BZ9Ok64aVaSCmlpqA-1; Thu, 24 Sep 2026 20:03:38 -0400
X-MC-Unique: 6tBV9BZ9Ok64aVaSCmlpqA-1
X-Mimecast-MFC-AGG-ID: 6tBV9BZ9Ok64aVaSCmlpqA_1790294617
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3f521346so397257a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294617; x=1790899417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwFdRAn9knyJ21BVNTcGe7areSLJLdB+xLeTWdZf3T4=;
        b=WpREvltv8k+JBetxFK20hug5FSUudDx3vHjzms5zu9/ey3m+b1r+8jnuJvQseAYYJr
         y1SUHexBt2ReYi6/Y3bzt1cC4nXpbBR8Cbph4kZqRz5xb7S0sn6zcBRPkUo4t4yRq5Yr
         xwzrEOU+fGSDnbJXrBYi9jCS8c/6Hzex2uC71UrK3D0AsZSRLULge6XfHJ0Soljk+C1o
         ajo5JpNF9mznMfoAe25W5htaHJMceiXdRchXJVcbgzYTz0qR5IqOXJX07AnJyGXv7Rfb
         bajczJtpMJwIH4PoudA2cMCv9IY17aXPmOWyy3SzUK6EqOEXGrX2YX0cHETYyOkQZxsU
         Ir1A==
X-Forwarded-Encrypted: i=1; AKwUvBz6Ljr6v7KlsTnIiAa3bQ8uY/8EOdet58AHTlnzfkfhhl2cb4brR1L0O4rgO+/ejPemRAnzZxrSV2VAFH/ZdV2p@lists.infradead.org
X-Gm-Message-State: AFuF++nd//bag4AZsoxUwOAVbU97jlynLhxpEtNzjlnfAP/TIbTdUMYB
	JsOhilM1zI+XNlnEYm13XqSV39tbGGWVBQKoHhYaG5EMr8xbhzeKzCLlH8lhLxuCSD3sSiC5vUs
	u+ViWmu4bYghFwKmtWj88XzLz4lGSnRE04GUAIui6OASOZkkLCCBIIgbkvhMRxnu5jeyq+gTHSD
	JE
X-Gm-Gg: AYBFou1TJYPNyGcxFfxt4zMBJHyH8xyoGgP1mqjbQ3+/zqf80htaer0HAlklEFjxx14
	C0aBFdvwe39bHflnCnJw59wz1t/lAZtsyxqHIKXFCQTX5BClA0IeGpAixMLqyV6yHe//1FdugFj
	JktMw+sjXndSqDICYMw32u37lZA1AEeZ4HqTU9HyTws+diLVwGfnrGUCM6hVd4o5Q1PPEOOc3KU
	63NHf+8Lmo8ZhyiuJXR93e4bX0tz2+7rne8Np2raAT8aYy22bRyNEQls+5IAKj5Hm1qFLvr1LuN
	dRSqN03Qb8e2C3mXZ8UiUS81ta4kRaFTlePRA1IR8vENrR5+1FBjH6Q02iJFdc6RnZu5ybM0Ig6
	ES4EFb6H8NB/B3+ufkTXpUHlbvXtPU7CFydqVNGYLTQ==
X-Received: by 2002:a17:90b:4a50:b0:3a0:bdd8:fb11 with SMTP id 98e67ed59e1d1-3a0bdd8ff40mr225061a91.66.1790294616818;
        Thu, 24 Sep 2026 17:03:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4a50:b0:3a0:bdd8:fb11 with SMTP id 98e67ed59e1d1-3a0bdd8ff40mr225029a91.66.1790294616280;
        Thu, 24 Sep 2026 17:03:36 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm7318263a91.12.2026.09.24.17.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:03:34 -0700 (PDT)
Message-ID: <cd2d60d7-fd6a-4f61-ac94-2190d364229b@redhat.com>
Date: Fri, 25 Sep 2026 10:03:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8V9s1Vwk_b7_JZJ4e_zyx0LH72hveQhiW9tjpwYpalY_1790294617
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_170341_279170_3E096921 
X-CRM114-Status: GOOD (  13.62  )
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

On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v18:
>    * Move the rmi_config_set closer to rmi_configure, drop the comment
>    * Use __free() magic for rmm_config object
>   Changes since v17:
>    * Move rmi_config_set() out of the header file.
>    * Print the error message for rmi_config_set if it fails
>   Changes since v15:
>    * Actually check the feature register for the host's page-size support.
>   Changes since v14:
>    * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>    * Moved out of KVM.
> ---
>   drivers/firmware/arm_rmm/rmi.c | 70 ++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


