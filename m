Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A886CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 00:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDFj6k/aDmm3juPYr/fQM/Yto+7HWelNY9uNTEiKbGU=; b=vxqNrTVwl4QITpMhw0Nw9ra3pC
	KMmX5YOFoRIXoplF0J5YlzT6LO4CWP02Ir/5JJg8IGvjEhFESuCswMGQdfwKAIqrrN6SMQUbGco8L
	6xp1BEgaYS3NkhK435lvO0G4aBfIRY1NoK//G6SPQ84iZxb8KooCDgfiDInxWB7pPsrh75+04vXkj
	asMAXRl/hhmSZPSFiJnUVbTdwfeFHWnbFdWlAM3vEvY2IrKz4w+XhEODZ4xAN5xOCgBsG/xjEldhR
	cdLA4OdwtNqmrvE4/NTg9/EKr3e42jPBEtJJ3KlxO8KW+KMlowwdscsbqLJH8R2FEVYjkhUfNMZqW
	IMjMWMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsdr-0000000HMdV-209c;
	Tue, 06 Oct 2026 00:02:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsdo-0000000HMd4-06ct
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 00:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791244959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDFj6k/aDmm3juPYr/fQM/Yto+7HWelNY9uNTEiKbGU=;
	b=A5kDqcbusbjPFv3CRK+fSmbb4j4powSr9Mi0QUNTLBW1Rm+rCiJfebLL11kAw9BfyKeQzq
	uJAiebUa/YFXo/RyU3bdFIG2LR1Yz1egCTWJAn8d8GkD7jMzZ57a4EZr0T6sH360ZbM3n0
	Rmw1HSOns994T6ymlBDjtCuNDUZnLJY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-8xiw_wbCMe-2Ojg8OzF9QA-1; Mon, 05 Oct 2026 20:02:37 -0400
X-MC-Unique: 8xiw_wbCMe-2Ojg8OzF9QA-1
X-Mimecast-MFC-AGG-ID: 8xiw_wbCMe-2Ojg8OzF9QA_1791244956
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2187483a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 17:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791244956; x=1791849756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDFj6k/aDmm3juPYr/fQM/Yto+7HWelNY9uNTEiKbGU=;
        b=RtAtL2kUa0KzpUSux4JS2lf6MBsTL4PTSwqzdHun0NyVwSsQqltkp8Jn6XWpnirTBJ
         tlV0CZMSxNMUOlQzvTzWNeNgomS8utP2LSvE47wfZHqbltCI5Y+tjFiH7XFkdgEpf/Ri
         gTBGzlLz/JMRrFjYV23qMwFAHwmMsjDqIwoa+xHIqe6ea6iVBywdZ6IENwLsv0DGODy2
         Gq8ZZeWIgQBhXlZZi8T++5FxP9KnzlxvGIu0JrSZgTwpYd7xh7CFS6dx0qc4Wiha0cn7
         5XczbyUzzCld5f1W7I7Wi/O5rox86jw64eMI8R2Soi+5u4A4NeJFaNzT9c/rObtaPh9y
         cLVw==
X-Forwarded-Encrypted: i=1; AKwUvByGv6vQ2EJbK1gahuCRgsr0UO/Rc/nmkQr2CfDcItrzLwPvHUfYbWr2G/BtDSKBAk6HAw/0NWrb+2p+t1tWaZwF@lists.infradead.org
X-Gm-Message-State: AFq9FYJwb6gX8TBBxZ3iUxdM2wIua/EkXKkTzTTR3vobKpFjq0mHU9Y8
	8llSrpT4rYUjX/sl2KwZMk+Nk8DyjmEkP9v6ZxT4KCfVLpyVbVqsqn3CAr9K3jYsY1u1rWnTH76
	RKrVte670hxe4kLovpDtKCoSUiFkDpmvZZhA9abgSmIRegSn2Q3yaXKBkd5jFagZSAfoUgPRkwD
	mY
X-Gm-Gg: AYBFou0u43N2JmwVnyXG6elqRLjohVJEIu4KSRBGn/FMepTB8qVFqVRA37uA/ZkKeu7
	I9I74EnITjnCcNky4ptRuVsMTbGpC4DBcAtC5EQuladNbeKLt7MbNin3HxaqE1TFRygFjHarvLI
	AqIafdFmueSjfVaiV01aYbMq2G6KNAYX9WsB68EW4y/2+mo5CeoLIAt+Tkdc2z3vx45U2EoANo2
	gPpVWzDS5Pmi7zLn0JP7Belus+zbYN68l6pNdNaoD5MXUgQrDtfKugk13S06bEwZX3cJkealEUf
	4DfmkJWKoNHDkSMVgSHstl6Vkmj1k/iCetiRrWtnc85UekvHo09C7CrdhtyuIkkHAe9WflDlI2+
	URuiFIXVTixg+zgaOJxXtM4KjqjNjRl+DF8qlWgI1tg==
X-Received: by 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr5001526a91.59.1791244955898;
        Mon, 05 Oct 2026 17:02:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr5001495a91.59.1791244955239;
        Mon, 05 Oct 2026 17:02:35 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85436fb54sm1801682a91.10.2026.10.05.17.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:02:34 -0700 (PDT)
Message-ID: <0fa5d03c-9e6c-4d81-a0de-e7aafc34918f@redhat.com>
Date: Tue, 6 Oct 2026 10:02:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 01/23] KVM: arm64: protected VM: Handle user writes to
 CNTVCT_EL0/CNTPCT_EL0
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
 <20261005090754.2140522-2-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-2-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4V5BNwZHKCCMzSxJdu29nrl4Tps2va9xNueUOTjSluc_1791244956
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_170244_147925_83FD3A97 
X-CRM114-Status: GOOD (  19.82  )
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
> Protected VMs doesn't allow setting offsets for virtual and physical
> counters, as the offset is always fixed to 0. The VM ioctl is filtered
> out based on the cap. However we don't prevent the userspace from trying
> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
> 
> Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for protected
> VMs. This prevents the access to the VM specific vm_offset at low cost.
> A userspace writing to the CNT*CT_EL0 would observe success, without
> any real effect. This is cleaner over spilling "*_is_protected()"
> checks and "matches" what we really do in practise. i.e., always run
> with "fixed counter offset of 0".
> 
> Reported by Sashiko
> 
> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v19:
>    - Fix typos in commit description and explain why we choose the approach.
>    - Improve comment in the code
>   Changes since v18:
>    - Retain NULL vm_offset for protected VMs to avoid host tampering with the
>      offset.
>    - Moved the flag setting into kvm_timer_init_vm(), where it should have been
>      in the first place
> ---
>   arch/arm64/kvm/arch_timer.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


