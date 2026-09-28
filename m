Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582B2C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPTRGSRmIEuAgsqdZVsCgUbEv8K5pyxuaYYIDQSv9zo=; b=pURZWOz12aBNQR/9o+B45fCYkq
	BUBzAxMZC9cZiQn+VOTCuATvaAq/NhTky5OW90IrYQ0GmqkEXD3VN24u5LnXgRyT/LfFsUIeemAZd
	2grslu+2R2EMmXF6X3DOCTbtPlqpi+5p6oLxMMxd3Bkqr/oQcvHAkscYeyfVtwoYN4i/VDCNe5/6D
	6kyaSJ3SoaoBFd1FLhcuH0Zul04iirgew7ozijKSZhKtYy/fe0jpsqf8kj9RH452ooJw6mKc23Aw/
	zvK9SWQeDSYlch6WyXqXHnpuvNaMUhNFIjD0zSsCxDkX1fSzVByO8WkuplYYhl8ltAd3PC8q5aTMZ
	lMToT3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0BW-0000000H7Vw-40x1;
	Mon, 28 Sep 2026 01:29:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0BU-0000000H7V6-1cML
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPTRGSRmIEuAgsqdZVsCgUbEv8K5pyxuaYYIDQSv9zo=;
	b=hRt576a4KJt62ApXwcWicM3QJaIIWuoSAsz6Y0oRkbA2+wEM+QIhNs//a+kHJYwka8UkIS
	0FEYlFKL8WCTNCgMVnMU0YFkeU3EFfwYLvE0SQtOPxIYkNIFvRLwlpopeOtAdmnHzy0vB8
	rS7o2uO+mi+mCUScn+dNiPBCJEeH4yQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-qz8vOoSoPJS14VJLWPCP-g-1; Sun, 27 Sep 2026 21:29:33 -0400
X-MC-Unique: qz8vOoSoPJS14VJLWPCP-g-1
X-Mimecast-MFC-AGG-ID: qz8vOoSoPJS14VJLWPCP-g_1790558973
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so3047853a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 18:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558973; x=1791163773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPTRGSRmIEuAgsqdZVsCgUbEv8K5pyxuaYYIDQSv9zo=;
        b=h84EWCJVtxG8LOD/bVXTTq6D4Rqac7qJjh6P1LzSUEXkFh/XgwDdLZix9QB3jdgrNh
         FClAGHV2j1At7L2wVtHtEDKg88tyriD9w72GWHZKJ1wfqqguco0l89Ji1DGJlxWF75r0
         IG+wvuARgJCkRxMiyrbFESIz5HUrrKiOCMNHvE6aqCAmanNBvqEK56oYKo2JVUL6G0Ci
         DGtDwy8IBPd1AtVRTK6FrjznlQmRpnYpz7xNoRz7H9doNQgGe/Okq8+dIa3J6fH3XQgd
         Q1CJBUPF+ln+65cPRLmgZE0Li2MreGZKQdD9BCgyTWzCnsNiL813zzSwUSRm3KJTpS7s
         8kDA==
X-Forwarded-Encrypted: i=1; AKwUvBwwuE3xyq2wTnfSwrm9d32/LUyMt4LZTJBWYE5yKGW0hu2AiqAU4b6cONsQSt70X7BQi0egHqoBwosSmeb9sAEF@lists.infradead.org
X-Gm-Message-State: AFq9FYINdR2F7JP7qtEBLoWEYl9QApYX21RnMR+XavSSjnJBpwcaawJL
	z2vXQNmr1X66JRTIRiGMPQfofKM93wuIMghwmSYRoRpJB75i1S8jB0Gk7Kdi/1NCOi+nXkVHhjT
	pJi0TtganNFcj0bZS8Iid/SHzFHZXISkEZv5ZrBPjnmYczNhl9ICnRJMlxGafQNnYszYNVv8e5r
	Sx
X-Gm-Gg: AYBFou0/zCPwumf9vH7340HpPzLvTx80Ok2cYqLxH9isUU6nfshbxm9KTkVUfsPozYb
	FqyZH9xoX0iy7RFhyz21Hr9fmz2aSRlPu3LCfGkfEhTCKKsjdeYO3hMYrX1wt197Oy5XJrgLhKf
	rYcs1LOnoCfk2tBlPfWwdhH9fNHhbr85urfz6dqthZEtYnnYUKM9tyG1eM+aF+zJxDoMeHw9B+L
	jCrAISN6NV1MPnPYcoQsmr7daG/CALmBRY56kkFw6c0l/WJAjAuwdZpb7mgmNu181GlThc7C0vh
	8iY/s+ykhtM6orsa3+ABvZhTVi33vMcyXwskegFhwQJq0jHHKaKtlAqsrC7HhmXA1EImzfV80DD
	Er5CAMXCQl7GNWcujdkoI6h9D8s2KjVw5ANOHjEFqgg==
X-Received: by 2002:a17:90b:2ec4:b0:3a2:b59f:639b with SMTP id 98e67ed59e1d1-3a2b59f6deamr1580742a91.54.1790558972765;
        Sun, 27 Sep 2026 18:29:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec4:b0:3a2:b59f:639b with SMTP id 98e67ed59e1d1-3a2b59f6deamr1580702a91.54.1790558971111;
        Sun, 27 Sep 2026 18:29:31 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913ddc55sm32916295ad.23.2026.09.27.18.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:29:30 -0700 (PDT)
Message-ID: <d1ad37f1-f87b-4812-a202-8b5e949fa1a8@redhat.com>
Date: Mon, 28 Sep 2026 11:29:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 19/20] KVM: arm64: CCA: Expose SVE VL register before
 VCPU finalization
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-20-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-20-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BbrXAJWAUEuJ7mh9Q87VrMLjMtGHR5kP03MArBI8Xh4_1790558973
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_182936_512670_E8BFCF63 
X-CRM114-Status: GOOD (  15.34  )
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

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Userspace must configure the SVE vector length before the Realm is created
> (as it is part of the parameter for Realm creation), but the Realm VCPUs
> cannot be finalized until after the Realm Descriptor has been created.
> 
> KVM_GET_REG_LIST currently rejects the unfinalized VCPUs, which prevents
> the userspace from discovering and configuring the VLs for  the Realm.
> 
> Allow KVM_GET_REG_LIST for unfinalized RECs and make the SVE register
> enumeration handle the unfinalized case explicitly. i.e., only expose
> KVM_REG_ARM64_SVE_VLS before SVE is finalized.
> 
> One adverse side effect of this change is that a KVM_GET_REG_LIST call that
> only probes for the array size will now succeed even if SVE is not
> finalized, but that seems harmless since the following KVM_GET_REG_LIST
> with the full array will fail.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>   - Rewrite the commit description to clearly describe the purpose
> ---
>   arch/arm64/kvm/arm.c   | 15 ++++++++++++++-
>   arch/arm64/kvm/guest.c | 10 +++++-----
>   2 files changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


