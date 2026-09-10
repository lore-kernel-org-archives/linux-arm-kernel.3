Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633D7C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/H7/x7jrZUwe3gjvxEalG5iN9U5i6+Y9YANROw43qY=; b=tSANfongcHHOsBndEGESo4GVCu
	lhy3/TheWBDeLViNMAtTLnOfbPBcMtZ+ULJ4tjhAnLi4xAz6sQIDbqvl3OBkhJmZPndrseo1kHskf
	n9iH/CoM4Kb7fidY/xFSoU019Cts7AA3yrDSTRqqaevsmVlCanCVmIIXsKD870tIWm1YItg33Vyl/
	GGt5vqVuwtT8OKBslFHSEZh+9A47D9u31wsPjs2Kh5XRSV0r3MD7erHNR2nYXwliGMb1PhHC4qd6T
	wOUWoKgJ4JZThDwSgHippHOjfB2geZ4kiNto15pwf4TJ4EH96o3kh/kiGrNeYl24eC/vj4urygRQs
	P9iiYJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bGn-0000000Duut-2yFl;
	Thu, 10 Sep 2026 09:40:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bGl-0000000DuuM-0MMg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789033232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/H7/x7jrZUwe3gjvxEalG5iN9U5i6+Y9YANROw43qY=;
	b=NKZ5cacAcuN7mbpNR4iCohIwEwYtwjhyns25Kft60c9AryPxgSIDVnK8pc1JboskiqBWA7
	qktrlSsfDTePoUwiq9eHeUwwDcgUV56eHKcZzUCG7GV6H6nIqpKepM4OVpe5FG4NMbe5GS
	VpgXBPPA0e55OVHxkA0M6TJYslBrXs0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-S4bZein7NoWIwe7L1n-8KA-1; Thu, 10 Sep 2026 05:40:29 -0400
X-MC-Unique: S4bZein7NoWIwe7L1n-8KA-1
X-Mimecast-MFC-AGG-ID: S4bZein7NoWIwe7L1n-8KA_1789033228
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so9697905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 02:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033228; x=1789638028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/H7/x7jrZUwe3gjvxEalG5iN9U5i6+Y9YANROw43qY=;
        b=Ck0FuDgYogjXKDMIjOatO/yQUeW1n0qgtOJZ0OnNR1Y3Mf2FoNPNpn3UQQKQCGy2NX
         P6kT4z8z6MyTugX2w2/E+e4XAzczRu6q8SH9Yvfd8uBbhr65ESf0qViJtECqZNZvocXM
         aFbY7nj95kZnoJiJ+C3T3JIcklUYfJCzjOJOetuMgVIPqN0ViC+h1yLxf0q2on48bmt9
         n/y3QHKdTfj9oPxfljQjwEzv1mrpFsIHm4NILsd6TfV1n9BKNFcMGW2dyfrIeRvLyofT
         xdElHSpaUW+XlabcbifAnDumY4yI9mTe00LzjkhL+ih6XK2kQyaodjIKWubLg7WFq2u0
         jQ8w==
X-Forwarded-Encrypted: i=1; AKwUvBwdNNp/wrUTAO7nqo0yNHUyq2AonZgpLfWXcs9qpB33rsXtlhVNpn199qbpQAYRrD61OXKFyg4S3KUeuDCua7WW@lists.infradead.org
X-Gm-Message-State: AFuF++nFuGsSgt6QKRLbf2MsNevOMfJQXCw1xLAi7urSWuaOFpO4VrIe
	VHGKPk+Rjm6h5t8C5+9VLWb5xJ3KuiHBg8Fv1nP4iyQ2Y8Vy0+/EGlxSFBFzrQgLh8/s7iFwvlr
	REuD+1L+YxQpFjB/KnhCZ26BRWt+/0A/rwtGTorKh4FqIcXN5dDJ/4rZiASnMj33gcbrorqb3qO
	rT
X-Gm-Gg: AYBFou3/phrn7d7E9p3JXj/U9nkqgEEvSgs/4OxO/YAiSDU0Gwb5sQ97sQ9gToi7M01
	BT0AASs/iBiLk21XFxCVOrSJg7GxiA0v9V8vuTGQn9ZiCexutoFbIjyhzgeXyq0eOhgAp8/85EF
	MoxHr2FiRiyeV5HMcoghGuZjB7rfIwj7lMrYOT2K0g5UPBtMT+lPiEm2y5QGRziVvVinccL7IdQ
	B514HXda1acJfS5SsjrLZXnluy4XjYbzxlocwGKyR152kTu3RyPLYKQiBHlr7Wgi7rCz/WLyoXH
	b0qzFgNlaBA/6m7CknuAXeJ1bhLxZIsSsppywMS04LVqEVnqt66lAzpTrFZSfSsNATuMZGPquWY
	aD4XIfYQJTOZjjobd8s1E3ZOA3um3fIKjeuzXWynPHg==
X-Received: by 2002:a17:90b:4490:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39d77a08755mr3066651a91.5.1789033228090;
        Thu, 10 Sep 2026 02:40:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4490:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39d77a08755mr3066617a91.5.1789033227578;
        Thu, 10 Sep 2026 02:40:27 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d80f0068esm3343502a91.10.2026.09.10.02.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:40:26 -0700 (PDT)
Message-ID: <472daa5d-19e5-41f1-9650-44e0245bc1f0@redhat.com>
Date: Thu, 10 Sep 2026 19:40:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
 <e66698e1-e582-4ff8-9881-4ddda5bc1d94@redhat.com>
 <40d3312a-c695-44ed-857a-fc6bf293f3e6@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <40d3312a-c695-44ed-857a-fc6bf293f3e6@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lcyN0HclMzq_3Ed9Tbu9ronlMFiBqZ2ZoYWSr0UeQKc_1789033228
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_024035_250212_5D8E7223 
X-CRM114-Status: GOOD (  15.64  )
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

On 9/10/26 6:43 PM, Suzuki K Poulose wrote:
> On 10/09/2026 06:53, Gavin Shan wrote:
>> Hi Suzuki,
>>
>> On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
>>> Add an explicit mode to support Arm CCA guests.
>>>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>>>   arch/arm64/include/asm/kvm_host.h               | 1 +
>>>   arch/arm64/kvm/arm.c                            | 5 +++++
>>>   3 files changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/ Documentation/admin-guide/kernel-parameters.txt
>>> index 68647ff4bdd24..1afe3df3b923e 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -3256,6 +3256,9 @@ Kernel parameters
>>>               nested: VHE-based mode with support for nested
>>>                   virtualization. Requires at least ARMv8.4
>>>                   hardware (with FEAT_NV2).
>>> +            rmm: Support for running confidential guests in Realm
>>> +                 world using RMM, as defined by Arm Confidential
>>> +                 Compute Architecture (CCA)
>>>
>>
>> I'm not sure, but 'realm' would be more appropriate name. rmm (Real Management Monitor) is
>> the term limited to the firmware to me. Besides, we have been using 'realm' broadly in this
>> series like kvm_vm_is_realm(), kvm_realm_state() and so on.
> 
> May be. But we use the "mode" of the hypervisor in question here, mostly. e.g., nvhe, vhe, protected etc. So, I went with RMM (in favor
> of CCA). Does that make sense ? Also, we rely on firmware/arm_rmm for
> the support. So, it kind of make sense to keep it "rmm" ?
> 

Ok, lets keep 'rmm' unless somebody else has better suggestion.

> Cheers
> Suzuki
> 

Thanks,
Gavin


