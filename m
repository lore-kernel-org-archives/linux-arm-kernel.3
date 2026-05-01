Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2600AFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ltJ1qk7ArZg0qL7brVsQZxHqLIMgRzChfwso+j23+0=; b=jrxWE91NYUtNdk1YR4xZT4xaWS
	M05QkGQMrSgLZO6QxBzUuCVPyiUx9wI6mk9PbOTIvXk2CeMgjn/GvB/hiSqpniYGtGE+VqmsxgtXb
	EZl4S7+QY5vLnw8x017B5b4sgLYtwcoHACOukr4KCQzqC2+VY9v4FxeyTH3Dky1OEvS7OaeULcdaZ
	sHtBEL0qMi1kHyun56l09LsZTyz7+MAnXu2VIZWHNaCChYy+EK+hZUWEDklQKev195w6xKoAwt+yh
	3b7lWSeP6xrR7BRzcMDbNH0MYuUMQ8twmRY87AHdJIz/xjtMTnFbnxuqKBKg+5ItjCQTTVCe0+YSj
	JuH57sKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIdeX-00000006GJw-1c9S;
	Fri, 01 May 2026 02:30:53 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIdeU-00000006GJU-1BEY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 02:30:51 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-7bd4c61765dso17509257b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 19:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20251104.gappssmtp.com; s=20251104; t=1777602649; x=1778207449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ltJ1qk7ArZg0qL7brVsQZxHqLIMgRzChfwso+j23+0=;
        b=XXnG4c2pvPEColP8AEVkTPHOgrKv7JEH1z48VLg2OeGMIHum2iofPHyixLAEd71fDA
         xWuzCYBwHEGDSGRYsfnUbBpGV7xR2QvqiOCUfCHCkVNXbV1MQmVrVOGqyhxQU9tGhoxC
         RbCjNiuL0Dg7PJxEpSuNjF20ZmW/SlIPD6amB0pK/vGvVLVO7dU1ltIDQAjY04ZiGnOw
         1HnDQbEYDlKXMCxckLH7ObYruFahZJcP3wI3Ik4MxPkoVZUeG7ghT+CU0pm4/ssPYwq6
         jmRc+j1U1i0JUslYDJOASWMR9vsVSJSilJsGEJQM0d1qcsHFQU3I8g4YIOgdTy5ajitT
         bgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777602649; x=1778207449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ltJ1qk7ArZg0qL7brVsQZxHqLIMgRzChfwso+j23+0=;
        b=aPzHRi+eQeA9Big6c5I0Ebxoujsylb+xBtrMkJxxcu7F/ixU4cJEu5yD+ND5ESgEIf
         DPx7DG/HL7w2X/X+f+lqsHIh1Bk1pCTKxOXzi+LcAW/fpsU8NbSISg1DUJVBHEXYyAel
         wmxcPvDrRuvuUNDy5qiBOdpiDx7krqmjCoLorQy7WEDBW459fFdVuaoMMZKp8MRfv3fX
         xwJgQoU4gfxwC5rB4YAskUC59NBxJoVbSh2ZdsHsJ4wMsgB6eN2pWfsvtBad2w4JN7Zo
         7RJnqpitfUgTBD0+crP0pk/lYOahgRoI97BUEtXtOcVkmgbMdNl2otlvWrWfsDQJzYXU
         TjEw==
X-Forwarded-Encrypted: i=1; AFNElJ9aXARIYGt25AoeIJkttdm8qwfvBBmay1xg1rIfN+chQpAvMc3qZbuKt+g6w61PrVVs+9QO0HKueLlngA04IPUk@lists.infradead.org
X-Gm-Message-State: AOJu0YwLQ4pEFBio3nxVYJBWokVEx6BtinecMBN6pxc49ZuLLnlrYPym
	XlZwEn1fgUsqGSL28nQmt4qpLpKnK+KESr4aj9BUReXo+JdvSkG/g94AZnJIVgikx8E=
X-Gm-Gg: AeBDietr4G4jLQ+JefnTZ7/dKI626WBth5OFX/0KefrW2tu3IhHYHwLuLkHa85pwXfP
	wYwCX2jA0K80F41kWitntL2lJpXJgCdCjIQIh68fBgJLROFyUdJiK46vfBBvGqMuApzosJ4fBs7
	hxXg/fHimy5SPAZ2duJpsbuiT2GEj2I+ZXdknoIpSCeWwOV9jM2wO/i6PQobDVnAU+3xNT45/2y
	PxTxR3iD+tr7SB+FN8BPrliqteAdA1PRpcA4XzyHQB9yTek3/ODpZQ13yALWwyXXjAABxdYfP40
	4gQEnbvjOKnfJqOpjdf84SXqjdfkIs7dgPyGYgoCTutYo5SOnru7euYLChpozRPtaipq0SJvnFb
	iP+fDVxFPSwwKDk0iTiXI8VpDSQ5VtnpKGM5mSP8+3WDR2n961XIMhywen4SLOA04kMXbwGkU28
	oNgNXHrLuwpHGmZzRCpiDQkxjQVjRhZqk/iNJ/Hzffr/ScDkkctSjx0qILEUfUiPvQ9Vj4nyFkY
	u3Q33s=
X-Received: by 2002:a05:690c:e4ea:b0:7bd:696d:5125 with SMTP id 00721157ae682-7bd696d561cmr7221337b3.45.1777602648819;
        Thu, 30 Apr 2026 19:30:48 -0700 (PDT)
Received: from [10.87.48.52] ([12.15.201.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6652dae3sm5424557b3.8.2026.04.30.19.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 19:30:48 -0700 (PDT)
Message-ID: <e03a3c1f-4b1c-4431-80e2-62051c8d227f@immunant.com>
Date: Thu, 30 Apr 2026 19:30:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] KVM: arm64: Support FF-A direct messaging
 interfaces
To: Yeoreum Yun <yeoreum.yun@arm.com>, perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Oliver Upton <oupton@kernel.org>, Armelle Laine <armellel@google.com>,
 Sebastien Ene <sebastianene@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260121-host-direct-messages-v5-0-2c1614c94e80@google.com>
 <afPMQ29x5fjHwtDo@e129823.arm.com>
Content-Language: en-US
From: Per Larsen <perl@immunant.com>
In-Reply-To: <afPMQ29x5fjHwtDo@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_193050_333575_2ACDE681 
X-CRM114-Status: GOOD (  14.71  )
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

Hi Yeoreum,

Sorry to keep you waiting; I'm addressing v5 feedback now.

Per

On 4/30/26 2:40 PM, Yeoreum Yun wrote:
> Hi Per,
> 
> May I ask how this patch is progressing?
> 
> Thanks!
> 
>> Support FFA_MSG_SEND_DIRECT_REQ unconditionally.
>> Support FFA_MSG_SEND_DIRECT_REQ2 if hypervisor negotiated version 1.2+.
>>
>> Framework messages (FF-A control plane) are filtered out. For
>> FFA_MSG_SEND_DIRECT_REQ, we look at flags in w2. Messages using the REQ2
>> interface are always partition messages.
>>
>> The second patch was part of a previous patch set [0] but was dropped
>> since the use case was unclear. A clear use case has now appeared: use
>> TPM device with CRB over FF-A when kernel boots with pkvm [1].
>>
>> Tested by booting Android under QEMU.
>>
>> Best Regards,
>> Per
>>
>> [0]: https://lore.kernel.org/all/20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com/
>> [1]: https://lore.kernel.org/all/20251027191729.1704744-1-yeoreum.yun@arm.com/
>>   
>>
>> Signed-off-by: Per Larsen <perlarsen@google.com>
>> ---
>> Changes in v5:
>> - 1/2: do_ffa_direct_msg: validate that sender is HOST_FFA_ID.
>> - Link to v4: https://lore.kernel.org/r/20260109-host-direct-messages-v4-0-95da4221d186@google.com
>>
>> Changes in v4:
>> - 1/2: do_ffa_direct_msg: check that flag in w2 is zero; drop unused vm_handle parameter.
>> - 2/2: ffa_call_supported: simplify logic by reordering cases.
>> -      do_ffa_direct_msg: switch polarity of check and update comment.
>> - Link to v3: https://lore.kernel.org/r/20251119-host-direct-messages-v3-0-c74d04944b26@google.com
>>
>> Changes in v3:
>> - Filter out framework messages as suggested by Will Deacon. Update cover letter accordingly.
>> - Update trailers: Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> - Link to v2: https://lore.kernel.org/r/20251030-host-direct-messages-v2-0-9f27cef36730@google.com
>>
>> Changes in v2:
>> - 1/2: Drop support for FFA_ID_GET interface in host handler.
>> - Link to v1: https://lore.kernel.org/r/20251030-host-direct-messages-v1-0-463e57871c8f@google.com
>>
>> ---
>> Per Larsen (1):
>>        KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
>>
>> Sebastian Ene (1):
>>        KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host handler
>>
>>   arch/arm64/kvm/hyp/nvhe/ffa.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 38 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 6c790212c588fddeb0d852f2790840753bb604b1
>> change-id: 20251029-host-direct-messages-5201d7f55abd
>>
>> Best regards,
>> -- 
>> Per Larsen <perlarsen@google.com>
>>
>>
> 


