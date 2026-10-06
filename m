Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A773CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxIeuyPsGM6bXB1gP5y8RQMrIArazkFLfv1yfn+nqd8=; b=ZuFixkZqC9ecax8rT2s+vfRoWX
	oWp/btUlbBzC3FVSqFydb8kYVt/JS+hVhy6quu/m9kPdJbSsUzgqjv8XdJqnE++TgN9cKCBIbPFx4
	h3aiZ69OiRC/+wFKQZ5AalZRdtxVMIv8HfESy5AKnOnzbg3ipavN9o/tIb9AizHpPjkPE/zSp8NV2
	tdvqchQiV8/47UeIgDh7PXkJ/SxjFRECcRlyuRp2c8Ipt3QEX70dzKEZ7TIO+GzsRvBexomWS/g44
	yCddfsPn05/HNkuqifNdE2ToYane7dxR9/baqT9P1EUwkrb2i+hAqb+GyzsiKi9o6Hk3MWeCRNHBz
	qvTKRssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuiW-0000000HUYN-2OpL;
	Tue, 06 Oct 2026 02:15:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuiT-0000000HUY1-2GVt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 02:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791252940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxIeuyPsGM6bXB1gP5y8RQMrIArazkFLfv1yfn+nqd8=;
	b=G5WafGFc4YOxYm28QAizVYszBFEn4sv1QLo7oCrIfdQc7/sRXo8JjaUU4dgWnF107SWaU6
	ycxNDdQ8msS8B0V+EJAgtMtWjtxqrBFeln8AYefp+0QSRBVgykGY744yeZQMuJyh8F4ivE
	lTmCNwD682IJ5DIsrMMuMqsujLf3Uks=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-SgwcR4O6Mq-emV6-4MYpAg-1; Mon, 05 Oct 2026 22:15:38 -0400
X-MC-Unique: SgwcR4O6Mq-emV6-4MYpAg-1
X-Mimecast-MFC-AGG-ID: SgwcR4O6Mq-emV6-4MYpAg_1791252938
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2643737a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 19:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791252938; x=1791857738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxIeuyPsGM6bXB1gP5y8RQMrIArazkFLfv1yfn+nqd8=;
        b=lg2gcTwQqWuc+cuwoWjpk5jygEV88eB3dByw3wVXtS/pfNqz5qkkJob8PsXcm4KSWX
         c1UTY30ZRXmgDCRlS4qsvAKrtOzBT2TjZR7gt73y1JAcSMjyedED+ssrlAC2HK+38DQU
         zbLxrp6D65cocpqJcQCz5ProLM2hyrhlsYue2yy52CwQtZ5z5UBtuZtN+gKvuxtUlncB
         nusmmvb5G7ZJYO1tddsMO8f50d7L8hqTGSmYKbi9nqQE1H2sdEH/qUYhCBCnIbzBjDSW
         i7a2ZDMtseeIkrOotyNRe1T74HTTXlZ3jZbn6myO1mnaAOJLIWETsj/9wsDbKveXME21
         zHQg==
X-Forwarded-Encrypted: i=1; AKwUvBw56uC2IqqD5hpfglxv3LEOXMf8MMpoixBbEd/YRE42pOc6ESislUbBT1qpzjQab3N57nxK73b7PDOPRv2rFO35@lists.infradead.org
X-Gm-Message-State: AFq9FYLvwhkTpMXCnRCYvTXqlg7URvldPJkuiO/qqZ8CXj2TnUO1uFo6
	GeApr/BiRYWBTOTSazwEzjlhPy/U0V31oqoq48ft1IUPqeGRJBlbdB4e1UiDeO8FJo/0cpGvlIs
	RQN+fNBWxU4ZIjbzxVBp9NeER0TIaRKY2xgPQmdiYYLkTUlFeDpSmRCJOov/xOamJaq/hFuwZCy
	BCFAjDHZi9
X-Gm-Gg: AYBFou1lnY0XFAiRf+8QKBVKxThc+i8pyhUlCq2Pq8gs/s1nKSEieXVWXXIMBPyzocu
	CDjG6VKglapg5VIm/fzfcsSsOAAdwXN4B/zurv0F5dR0UU0/lnR1h23C8jROeL+/sDxsIMTVspg
	OT84zjtPJSkXjibtjC5EoyrW0Dh5EsldiRTVh8v+jSmo8jlaqmDnJa27ZwhDoLwl76bFjgTJXA2
	LY6ss2vg+2zayODGjMJZophP6PoBycWxsOeRgrEYwWFrclpCKDVAP1NT/gSjBgbFMwim81AHRty
	NuKUPwblHLdtuQnj5Mw4YQdJLOVhzbeiX9Ig7SWHKCBhXNDacThpw0Lnac64dmyL0lCpUDQmlrA
	U6EDD0LO3g4UX4MtCakA8BB8fHpw7Q6GG6gOlvG+EvQ==
X-Received: by 2002:a17:90b:3e86:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3a6ce7f67b5mr4922640a91.37.1791252937692;
        Mon, 05 Oct 2026 19:15:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3e86:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3a6ce7f67b5mr4922621a91.37.1791252937271;
        Mon, 05 Oct 2026 19:15:37 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm5404856a91.1.2026.10.05.19.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:15:36 -0700 (PDT)
Message-ID: <0f463e25-1536-473e-809e-6a358f27275f@redhat.com>
Date: Tue, 6 Oct 2026 12:15:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/23] KVM: arm64: Add vcpu load/put call backs for
 flavors
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
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-9-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-9-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qkUccBLXDwTpwgn4JoLNkQBix2GvQnun-m6b0-ye9Nc_1791252938
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_191541_713528_196C1FB2 
X-CRM114-Status: GOOD (  11.47  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code. pauth traps were removed from VMs running PKVM
> as it is a no-op for them.
> 
> Based on a patch by Marc Zyngier
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Add '&' into the KVM_VCPU_OPS() macro
> ---
>   arch/arm64/include/asm/kvm_host.h |   6 ++
>   arch/arm64/kvm/arm.c              | 138 +++++++++++++++++++++++-------
>   2 files changed, 114 insertions(+), 30 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


