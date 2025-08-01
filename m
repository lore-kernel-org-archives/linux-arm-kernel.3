Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F802C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XH5a2VQAaaQ4ZI3DoGHt/qvwcnbj045BwWW5pl2b3M=; b=Su+EgEYutpSRRAOi0VTf0EjOn0
	GeZ3++LNbLpeijWXW8Fm5mAottI9+/zzlBa2Ojcs3Q1pQXgi4jpQemLbZFHbBPlRh55JCUaR8Se0Q
	BACXu7Y4zxJYgtnn1w8j+J6fQtrTAAtaa/spccD/99AWlYn9DMNsiZb7Ky3UrQ9LD/gR99AfYCi5A
	M06LHdYOBOz93jW1Z91YcgvDKjrLRPkdBAOn2+2Si9zI8V/tEfGDK9apRMTh4j1lDlDKmifieb0p+
	xy+fmBa3HVqQzmZZmfbXAPfHK2+yGZE1XYMf4rEpAReHuJAOyHe24fpdQGugiRfwZy8uaUML22XfD
	2ilEiVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkzV-00000005EJQ-06E5;
	Fri, 01 Aug 2025 08:19:49 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkht-00000005Ccj-03Qt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:01:38 +0000
Message-ID: <ea6bf206-6a68-496e-a941-4423973ef4ba@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754035293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+XH5a2VQAaaQ4ZI3DoGHt/qvwcnbj045BwWW5pl2b3M=;
	b=tlGvfOWP21kSoCXQKImOlhOGKD2x1g4VfQdo2eONBhh5YEnNrfL3+R5Q3wEPpKl+ieKovZ
	Nkkc04era8z9viThVlAOAkILZ8eFIFj1jMElYCY1z3Yvfl4x0kjm0v61HSAqk74PF/gOAx
	23s1e5cDQTFRdTCPGrH166R1Lh5wt2M=
Date: Fri, 1 Aug 2025 16:00:43 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] KVM: arm64: Dump instruction on hyp panic
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250717234744.2254371-1-smostafa@google.com>
 <20250717234744.2254371-2-smostafa@google.com>
 <4a807c89-d57b-463a-9166-836301ee9947@linux.dev>
 <CAFgf54q3KVOZ0Tji+dpnvnPCbvpN4z1Yhm5jfpEmDPhndo6bXA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kunwu Chan <kunwu.chan@linux.dev>
In-Reply-To: <CAFgf54q3KVOZ0Tji+dpnvnPCbvpN4z1Yhm5jfpEmDPhndo6bXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_010137_494154_9253AF90 
X-CRM114-Status: GOOD (  20.86  )
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

Hi Mostafa,

On 2025/7/31 21:05, Mostafa Saleh wrote:
> Hi Kunwu,
>
> On Thu, Jul 31, 2025 at 1:59 PM Kunwu Chan <kunwu.chan@linux.dev> wrote:
>> Hi Mostafa,
>> On 2025/7/18 07:47, Mostafa Saleh wrote:
>>
>> ... ....
>>
>>> +     /* Dump the faulting instruction */
>>> +     if (!is_protected_kvm_enabled() ||
>>> +         IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
>>> +             dump_instr(panic_addr + kaslr_offset());
>>> +
>> This part seem like unnecessary, cause it'll be remove in patch 2(Only
>> the comment left).
>>
> Yes, the idea is that the first patch adds that only for CONFIG_NVHE_EL2_DEBUG
> while the second does that for all configs, I split it this way as
> doing that with stage-2
> requires intrusive changes, so at least this patch can be picked
> separately if needed.
>
>>>        /*
>>>         * Hyp has panicked and we're going to handle that by panicking the
>>>         * kernel. The kernel offset will be revealed in the panic so we're
>> Another confusion is that no similar wording to what you mentioned in
>> the cover—specifically "Cannot dump pKVM nVHE stacktrace:
>> !CONFIG_PROTECTED_NVHE_STACKTRACE"—has been found in the code.
>>
> I am not sure I follow, this has nothing to do with
> "CONFIG_PROTECTED_NVHE_STACKTRACE"
> This series added the print for for instructions as:
> [   12.016044] Code: a8c17bfd d50323bf d65f03c0 d503245f (d4210000)
>
> All other prints are from already existing code.

Got it—I see what happened now. Turns out the confusion was caused

  by my CONFIG_PROTECTED_NVHE_STACKTRACE being enabled.

After turning that off and testing Patch 1 standalone, everything works 
exactly as you described.

The test results:

1: disable CONFIG_NVHE_EL2_DEBUG

--> "kvm [5375]: Hyp Offset: 0xfffec95693400000"

2: enable CONFIG_NVHE_EL2_DEBUG

--> "[ 684.715883][ T5525] Code: d51d991f d51d9901 d5159001 00000000 
(d4210000)

                   [ 684.715974][ T5525] kvm [5525]: Hyp Offset: 
0xfffe992b13400000"

3: without this patch :

--> "kvm [5497]: Hyp Offset: 0xfffedd4993400000"

Thanks for the clarification—really appreciate your help!

>
> Thanks,
> Mostafa


Feel free to add :

Tested-by: Kunwu Chan <chentao@kylinos.cn>
Reviewed-by: Kunwu Chan <chentao@kylinos.cn>


-- 
Thanks,
        Kunwu Chan.


