Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEFDCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 00:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3i7MRKG6FjVJNfFDsY2mBV0HH5ceLNdSFuRKrXNOfM=; b=jvr+ZZmeYgKrYQtxFw64nWCfxK
	Xi12PamkaV6lukcR/qTdmLCjCSKymvvgJEy+sNH+ZsTOvlkfrcYevEqStNxND4mIb/iXlF1Wj6rVQ
	vMjk0OUCp/QAf/1PhOdOOq790acUASISNTCD0ErTR4x5S8h289MTS0GOy0pI61d0SL7u2vhPYIdE1
	tLRdRX3z3UH2chpnqkJMNBBQg+8JI5n5eVdQuFpdbeAGESZS1kjVItGICvR9nC9Myo9UyuoE/07qP
	VAuxVBxuUyXg3ERYYDDf+NMbmcvXSuWyKQy6cd5O1AuAr3CjH9zyVVoEPdgJZ8mONIzn71xDK9ml3
	hsFPAXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPrB0-00000006GSW-474o;
	Thu, 21 May 2026 00:22:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPrAx-00000006GR7-33RR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 00:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779322928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3i7MRKG6FjVJNfFDsY2mBV0HH5ceLNdSFuRKrXNOfM=;
	b=gkWKd8DrCi+rf20WXOLE9+wwfO5Gt2AjRbFHCsI7gONgpB0DOlEqIXsK7+WXChBFzcgJe0
	6eIf6/ukTbcucJiOE3tEPsfn2aBk/MMF8G2QfHvnjZt/thI+YTcpvEczLCSUUOJdZtwYGx
	LORyFAc6ai/mFFp94mLV251mSyaf1Ik=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-irF1E-oMPTKHKTz8rADMsw-1; Wed, 20 May 2026 20:22:05 -0400
X-MC-Unique: irF1E-oMPTKHKTz8rADMsw-1
X-Mimecast-MFC-AGG-ID: irF1E-oMPTKHKTz8rADMsw_1779322925
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83836443305so2768657b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779322925; x=1779927725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3i7MRKG6FjVJNfFDsY2mBV0HH5ceLNdSFuRKrXNOfM=;
        b=W+6jwWx8yNH9qeKvstbGZGjn6ieFEldgAQkoPRmlNCsaUjALn1jHM2naKcyY2V/9b0
         SsuP3tnuFCyKIqNKKxDHnahx36S4EgHXQfxJpH0H4ueJoIyCItAJfh+70kPYpwJNwDyX
         05cFCgWNJ1e2pZv5yakddpovgqxC8Mf+b6O1FrocexMPkvqDHIftwjqaWx2OXqe/WKZN
         h5G5AKG+eVly7jvBzBSQTHMEEOtJxafmZqDpq1djT/cN4q0shMsJmr6IzM5CQPpGixL9
         Lp7YgDB/r1M+t+cZLqVeYxMteYiQMuj++s9W51fuhdRPJNG77/sBZFwnAkMgggM2YpRB
         svIg==
X-Forwarded-Encrypted: i=1; AFNElJ9z0NUnqDr8GPTVCKaqXs/5EN3A+0ymz1KJsiCYcw8TY03jRXqTyeSP4pjO/2j37JEbRHm5F1o5gX5hBbh/7afc@lists.infradead.org
X-Gm-Message-State: AOJu0YwQhqtdDMzbDyHrXHHI3pAIbgzaSDe6yp6pGzC1JB5QwDWKYb1F
	bjmtYverZdH1IFJdHpbwHuz6LVVQYY600uhrWlcZmTtj64Z67xf/smf+d9YBBHgazuxu0NsZYdB
	KmfdHNlP9PZBByt2zX7wE7g+1/joxQGq0zM3M0KPUILlp/mY1/pgtLvvF71xQOgaADCkUy3lGin
	zL
X-Gm-Gg: Acq92OHw6jU6V3azSv0gTi4AfxilTua8LBgt0A3CKgBvRbmAWOT8i27AhAxGpZm6+cK
	pfLLl8XvbnU56N31rWul2lf1/w4gVCM9aviqYDJw01o9XtKZgkS7FQ3uEbcXiDfl/JbBaeUlws9
	xgVQ8kOlgOR9WvozYzphcTKPaU8RSMrztJhhla86KFDHLleggM/4ldtvesrznL+1zG/dGPQ0/+b
	/bhHati33lfCS26y17jBj4W7wpyc0Fi3jBSV8rAmeLUzyXNxJdXqgYRwK4MM2Nd92biZyixvjLk
	i7taOf9Gj02cjDG1XTgtkuAvjYsuo/8fZhFBBukxtRht04g3G2L3tiSxIYdIfoXwK1HLCaeXa4a
	Byvz+KmZl0kvCI/xc7lc/6C24T4VoPTKzo+FT02hTxoOiJBvgthxa+uwqYMeDUGKd
X-Received: by 2002:a05:6a00:3988:b0:838:af72:fb3a with SMTP id d2e1a72fcca58-8414ac7f34amr670248b3a.7.1779322924827;
        Wed, 20 May 2026 17:22:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3988:b0:838:af72:fb3a with SMTP id d2e1a72fcca58-8414ac7f34amr670212b3a.7.1779322924310;
        Wed, 20 May 2026 17:22:04 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19794e6esm20725723b3a.25.2026.05.20.17.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 17:22:03 -0700 (PDT)
Message-ID: <da87fa25-d979-4d22-99f1-3ba1d81cff23@redhat.com>
Date: Thu, 21 May 2026 10:21:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 05/44] arm64: RMI: Add wrappers for RMI calls
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-6-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-6-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hgEsm2Z5_4mb_hny_YvjG1jcZrqavqCnQo24V7knjh4_1779322925
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_172211_842983_631F3CC2 
X-CRM114-Status: GOOD (  26.16  )
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

Hi Steven,

On 5/13/26 11:17 PM, Steven Price wrote:
> The wrappers make the call sites easier to read and deal with the
> boiler plate of handling the error codes from the RMM.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v13:
>   * Update to RMM v2.0-bet1 spec including some SRO support (there still
>     some FIXMEs where SRO support is incomplete).
> Changes from v12:
>   * Update to RMM v2.0 specification
> Changes from v8:
>   * Switch from arm_smccc_1_2_smc() to arm_smccc_1_2_invoke() in
>     rmi_rtt_read_entry() for consistency.
> Changes from v7:
>   * Minor renaming of parameters and updated comments
> Changes from v5:
>   * Further improve comments
> Changes from v4:
>   * Improve comments
> Changes from v2:
>   * Make output arguments optional.
>   * Mask RIPAS value rmi_rtt_read_entry()
>   * Drop unused rmi_rtt_get_phys()
> ---
>   arch/arm64/include/asm/rmi_cmds.h | 661 ++++++++++++++++++++++++++++++
>   1 file changed, 661 insertions(+)
>   create mode 100644 arch/arm64/include/asm/rmi_cmds.h
> 
> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
> new file mode 100644
> index 000000000000..04f7066894e9
> --- /dev/null
> +++ b/arch/arm64/include/asm/rmi_cmds.h
> @@ -0,0 +1,661 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#ifndef __ASM_RMI_CMDS_H
> +#define __ASM_RMI_CMDS_H
> +
> +#include <linux/arm-smccc.h>
> +

[...]

> +
> +/**
> + * rmi_rtt_destroy() - Destroy an RTT
> + * @rd: PA of the RD
> + * @ipa: Base of the IPA range described by the RTT
> + * @level: Depth of the RTT within the tree
> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
> + * @out_top: Pointer to write the top IPA of non-live RTT entries
> + *

In most cases, the parameters are well explained in RMM-v2.0-bet1 spec, I think
it's nice to keep the code and the spec synchronized. For those specific parameters
of this function, they're well explained in RMM-v2.0-bet1 spec as below.

    @rd: PA of the RD for the target realm
    @ipa: Base of the IPA range described by the RTT
    @level: RTT level
    @out_rtt: PA of the RTT which was destroyed
    @out_top: Top IPA of non-live RTT entries, from entry at which the RTT walk terminated

> + * Destroys an RTT. The RTT must be non-live, i.e. none of the entries in the
> + * table are in ASSIGNED or TABLE state.
> + *
> + * Return: RMI return code.
> + */
> +static inline int rmi_rtt_destroy(unsigned long rd,
> +				  unsigned long ipa,
> +				  long level,
> +				  unsigned long *out_rtt,
> +				  unsigned long *out_top)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_RTT_DESTROY, rd, ipa, level, &res);
> +
> +	if (out_rtt)
> +		*out_rtt = res.a1;
> +	if (out_top)
> +		*out_top = res.a2;
> +
> +	return res.a0;
> +}
> +

[...]

Thanks,
Gavin


