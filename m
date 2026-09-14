Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10869C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypy8vva409xUcIhg7UrFn+M558mkrKtyBpJ0I/QZb8I=; b=KwGwgiMDiWQj14na+5LJwOxekx
	7IZWUQvB//GJlJDVsGJ9FcVnr4Re+h73YDi1FlP801tP/meO447tuucKv5gZARJXaT8pdLgTKXfRd
	oBWtxFSzkVjFsQF6cPD4PuIUEabjlAidjeDhazGQFQA0siqmhPnEBxqc7jHTSyauxNsTvXHXWcc3T
	Nq0dtNARAbjrLEYUTSa0gLuM8bAZ0BB4klKRonXQVBW9j9L6YmhXjz38p16BoVw4VcXxZHPfbo2a+
	6itHdJ/zMsGElkvMn9mT41l8jll1tGKdgJY94qbV7RYtPSAYcyoAccRiHyNuLrQlxZACzGflryGna
	yt7S5dUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63Ts-000000032aL-2fwl;
	Mon, 14 Sep 2026 10:00:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63Tq-000000032Zv-04bs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789380003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypy8vva409xUcIhg7UrFn+M558mkrKtyBpJ0I/QZb8I=;
	b=bbghDKFxXTO9icGnG8Bs2gPRHJMUXlzrpzk3zmMGgheHK4Ild4tp6BHRC6EWLCVLPIbGQx
	zgDErQWGy/HrLLmXX6I/e/5QI7RzH6GuuHhr0le977WPAj4gMzHtEEwHzzKrOz0LtCp7E8
	0JBWeWLPLGaJZs+rmvr0abBFUd+q+w4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-IcNvqAXzOpeoyNp5_HSosA-1; Mon, 14 Sep 2026 05:59:59 -0400
X-MC-Unique: IcNvqAXzOpeoyNp5_HSosA-1
X-Mimecast-MFC-AGG-ID: IcNvqAXzOpeoyNp5_HSosA_1789379998
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5677898a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379998; x=1789984798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypy8vva409xUcIhg7UrFn+M558mkrKtyBpJ0I/QZb8I=;
        b=P1FYyqDjs7D3GxjPx+gwXMnVt8K6iZuddxywBPINYfz6hrpaMphWWR1CEtpGrBqFkN
         R/ZkJqTWGrodue0W1z/m5zOzJub83/Z14GMdFDbA+w3wu3TEVlU24TYKkhNoz7/K2wiw
         c3JD3tzZTOR8I8+UI8MvJhi6272fmByRuADzw3X1T1d7DF6ZRcOPj9yrp94WFT2DziWY
         H2c06ngItoQohgeJuOn7tWGRNU4XNpDs+KlWtw+9DMkmz04axL0OrtRy5D4cZS/1q/K7
         tQ0B4jAoUutPgvlToUCSrzDEotxTYMIKv/dTp5lR4As1jT0Vd02swh+Cngm1l6Jy0guk
         ShXw==
X-Forwarded-Encrypted: i=1; AKwUvBwlo3NEWiIyhL2MCW+XekgOBlZbrrG1YKBDyra+hAErDXfVxV5GCppJ8COuXTXzkyOmTDM+RNqQ6KJAgYl2nJq7@lists.infradead.org
X-Gm-Message-State: AFuF++lt6wBcmuT/u4OUAUzJZW/NsFebpWu9td6uj2OT0pc6zGGyYKbu
	szNfPnT0r9P/z0qHWXQuRwhP6UBNet53vnkHIGSQuZ8V2mihO1RBArQNhPIUn8NPZ1yvE2ilv84
	IFd8DsJpNbjH/aOffItj7WYt4nScqzVReX14XQRWCwJmVl2TdC0HTMnABJSJnSRaYzI3jtBVQ0k
	G88WBLCbET
X-Gm-Gg: AYBFou3KGSMhq3gea4wVxYNNBmNLxemA901506v6TzNMXDj8VPFWuIANfF+VZFENlI4
	OyLxHa3Dx3ZTvwxeZWJveLZqgyAWratQk9nqv/jHs+n00nL6kpvpMvrA23B2HksD0+xYF+SPqKK
	zUYDu8DrEJB1SuiKbfc5PjE1ITCc4Um3TS23tan/HNJAaGnYN6zHisoJpR+iVID6O8EGNZVsqT7
	K4BnRNd1qwtorVwL3mnJ1nLOcqkEkoda+mK72REpzYdeiWHABF1HwK7zRjkEX9nI512yWNdFU72
	cGk00sgGaWbza9FaLFfH0Zxft6OSxpG0wJ0fFuvdt3wT396ipy6uqzNaOh3OxeuOTR/0jaYsdb3
	spfeT4UhYwJCYpT1+Wk0aYGveQfIdFPFcWRDqBdMUjw==
X-Received: by 2002:a17:90b:4a47:b0:39d:eda4:43f2 with SMTP id 98e67ed59e1d1-39deda4487amr3464039a91.7.1789379998049;
        Mon, 14 Sep 2026 02:59:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:39d:eda4:43f2 with SMTP id 98e67ed59e1d1-39deda4487amr3463941a91.7.1789379997512;
        Mon, 14 Sep 2026 02:59:57 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm27206495eec.29.2026.09.14.02.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:59:56 -0700 (PDT)
Message-ID: <ca30e5e2-2bb5-40ec-8357-d5c3eab8a6f3@redhat.com>
Date: Mon, 14 Sep 2026 19:59:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/7] firmware: arm_rmm: Add support for SRO
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-5-suzuki.poulose@arm.com>
 <f00d01d1-8df0-4865-8e52-c85171cf4ca5@redhat.com>
 <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
 <1fca136f-5802-449a-81f1-3a76c31a2f74@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <1fca136f-5802-449a-81f1-3a76c31a2f74@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tx4soxeozeroFHcnlVJLyDk_6r09ljo3Kiq2BBHppvE_1789379998
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_030006_139160_2AEDC297 
X-CRM114-Status: GOOD (  16.62  )
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

On 9/14/26 6:19 PM, Suzuki K Poulose wrote:
> On 14/09/2026 07:22, Suzuki K Poulose wrote:
>> On 14/09/2026 06:04, Gavin Shan wrote:
>>> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
>>>> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
>>>> means that an SMC can return with an operation still in progress. The
>>>> host is expected to continue the operation until it reaches a conclusion
>>>> (either success or failure). During this process the RMM can request
>>>> additional memory ('donate') or hand memory back to the host
>>>> ('reclaim'). The host can request an in progress operation is cancelled,
>>>> but still continue the operation until it has completed (otherwise the
>>>> incomplete operation may cause future RMM operations to fail).
>>>>
>>>> The SRO is tracked using a struct rmi_sro_state object which keeps track
>>>> of any memory which has been allocated but not yet consumed by the RMM
>>>> or reclaimed from the RMM. This allows the memory to be reused in a
>>>> future request within the same operation. It will also permit an
>>>> operation to be done in a context where memory allocation may be
>>>> difficult (e.g. atomic context) with the option to abort the operation
>>>> and retry the memory allocation outside of the atomic context. The
>>>> memory stored in the struct rmi_sro_state object can then be reused on
>>>> the subsequent attempt.
>>>>
>>>> Wrappers for SRO RMI commands are also provided here because they depend
>>>> on the rmi_sro_execute() implementation added by this patch.
>>>> Delegate/undelegate handles are also added here because they now use the
>>>> SRO/stateful command infrastructure and are also used for the memory
>>>> DONATE/RECLAIM flows.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>>
>>
>>>> ---
>>>>   drivers/firmware/arm_rmm/rmi.c | 586 +++++++++++++++++++++++++++++++++
>>>>   include/linux/arm-rmi-cmds.h   |  41 +++
>>>>   2 files changed, 627 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ arm_rmm/rmi.c
>>>> index 5b0e342ce3d58..4f9898ece7547 100644
>>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>
>>>
>>> I would drop rmi_granule_range_{delegate, undelegate}() by combining their logics to
>>> their only callers rmi_{delegate, undelegate}_range(). More details are provided for
>>> rmi_{delegate, undelegate}_range() in the below.
>>
>> Ack
> 
> I have moved them closer, but kept the logic separate, since this is not
> a simple RMI call.
> 

Yeah, it's fine by moving rmi_granule_range_{delegate, undelegate}() to their only
callers. However, the unnecessary if statements can be avoided in their only callers
rmi_{delegate, undelegate)_range(). Besides, rmi_delegate_range() would come before
rmi_undelegate_range().

	while (...) {
		ret = rmi_granule_range_undelegate(phys, top, &next);
		if (ret != RMI_SUCCESS)
			break;

		/* Buggy RMM ? Let the caller leak the pages */
		if (next <= phys) {
			ret = -ENXIO;
			break;
		}

		phys = next;
	}

The variable 'out_top' in rmi_{delegate, undelegate)_range() may be renamed to 'next',
indicating it's the next (starting) granule for the RMI calls.

Thanks,
Gavin


