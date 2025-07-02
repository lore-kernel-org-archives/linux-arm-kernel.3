Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA88C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 00:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IS6DmHZ/EPn9vNNwu1p5P0DKnu56R5jJnANztZV8U2U=; b=E2nRsHOXh3FD8rQmiRQzFxpvDa
	s5VqHEmSs0IE1HIB+FHn+XmXoBKzRA5pu07t+XaDvJN2w/YMIH9wuyWoJkBvqw8sVn0GSKZNI5S5e
	3KIuVDELfapBlmGiLddJzFkEa2bWm+xtlAk1HVhDQKOFjfV1sDl/LAA1Tsjb+gmR7IdW4GceOhbEx
	HWBs5gSNi+fDkj+R89TKNyc16Zh4J9eNDqMaNwYHKuVzvPnZfglXx3BzsOpfkYPngmepWYFlcOZzV
	udgqps8WRaTqEKc1tWAPvtpCHY1VanTtd0b+S9SMJP5ixt+TSFwSdD940y1nNf0DCaQvyrgfSeKKV
	4NOOAhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWlbc-00000006vGl-2A3n;
	Wed, 02 Jul 2025 00:45:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWlY5-00000006uwz-3bCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 00:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751416924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS6DmHZ/EPn9vNNwu1p5P0DKnu56R5jJnANztZV8U2U=;
	b=JVcrtNIE8yxulcOdAODuYuUr5Q8NQymb0PNXg3oR3Cz/lsVKGti2WcxK0yY+AhICoVwnOs
	HknfkA30haE2v6pKydVJtF05bXnjbE6g1WdHXat1oMKkBcMNzvknJFwHBztMC4BH9bw6om
	Oa6Bx21Kq62idg6s9bz+I9xyW/7bQvI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-FKobmuE2P6qyqu9WXUZZsA-1; Tue, 01 Jul 2025 20:42:02 -0400
X-MC-Unique: FKobmuE2P6qyqu9WXUZZsA-1
X-Mimecast-MFC-AGG-ID: FKobmuE2P6qyqu9WXUZZsA_1751416922
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2363bb41664so46837845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 17:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751416922; x=1752021722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IS6DmHZ/EPn9vNNwu1p5P0DKnu56R5jJnANztZV8U2U=;
        b=D40eGBljL+FMu2ncIn1N7NkPQcfQw+je2zNMD3efGhIBLRM3unXJhLWPhP5VpOSq41
         1i5+q6TLkGpG/KCTOUewPgTt694qpHG0D7PmlCAPUsGBC970tbeRS/7eNoXHurHIt2zF
         LFRPPKd4CQh2pIyKPZdO2RuC0s/e8c/ODUOtqVwGzoWrAaHJtKD8+3ob+sVpc8KJ2PH4
         KnJErVarEt2bF7U9MxBJCSIBSnlnq0tvE1AYLgbl6OSZr/7cQ/mgU+OGEQPpKCgAcyl/
         hJQvofGdDa7IJwPfMDXEEXkWptyQ8+ePLQgHZ3ldHnFLHQ+OXVejDbuggm6q31wKX1SQ
         /aLg==
X-Forwarded-Encrypted: i=1; AJvYcCX2A7nztCT4BODW2taxoVsRbaYL4v372AY1ZqGD0R411KD4j0uTGDQb0W+kgPHmBZDflZkMz4mRUcIdwjAt3znt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+bsOHiC/ShZMa89U/FouzfeL3WW5hXZzDfcD3xLXzEKef4hrL
	AYPC/RwmPgs7wKDTgT5oBh5EMC+dxPA6U/UGVljw+xUTqDW9MFgr+N73LjOtbBerO5EjRVTfPzE
	eSuhk8omM/pgaaeqWUCX+XJFCfbCHsFh0MUq1q7G1J5Rc9QxRKDaZzyoHXgyd62KaIawF6TS78x
	9k
X-Gm-Gg: ASbGncs38Ijjv2rcUzRX/Sn07XIRy8YF4QOdpnnGUVTkslQHa/wzbBax0LGxhhRgW+d
	jiyoZZ3cave5rPaF5y5JRUm1W0s4SmLjkPGSd1aYlbvCgaxvI6fM6jwCsuASf2zIZNneN5IhRVT
	+GSm6q3DK82CvHSUvxmdkiDO+gaLaKEAD73O6jy104CmsvoRZrLMd+PpDni4bBbyqq4sbnKz259
	HBHGwjZj7bPxo9RLAXYBlL2LKyozWBLH/nOwZFH+rEkeSs9jdfF03Vu8jOknj19whHPEJdD1foR
	1NUOTdjQBjN6ZA+fohLPvBZkOvJVbY9w4UoPAKVNp3JIkGLE9D3yeJTGBLzv5Q==
X-Received: by 2002:a17:902:e809:b0:21f:5063:d3ca with SMTP id d9443c01a7336-23c6e81e812mr10088095ad.16.1751416921653;
        Tue, 01 Jul 2025 17:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLaYwVOFkrc3uXeDo3lLBdt2ODjpAZgoQY+FVxCUbATRGn8q8nteuTtaLiNL9kfSpsCG8Ldw==
X-Received: by 2002:a17:902:e809:b0:21f:5063:d3ca with SMTP id d9443c01a7336-23c6e81e812mr10087595ad.16.1751416921150;
        Tue, 01 Jul 2025 17:42:01 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31c2252sm11480507a12.49.2025.07.01.17.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 17:42:00 -0700 (PDT)
Message-ID: <d092bb97-d552-49f2-ab93-bb2bd7809c3f@redhat.com>
Date: Wed, 2 Jul 2025 10:41:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/43] arm64: RME: Handle realm enter/exit
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
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-17-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-17-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3AvYdpNF6kJIQDLt2SB_veLw-h9yt8VYmPoStdjRd1o_1751416922
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_174205_978120_92250C8D 
X-CRM114-Status: GOOD (  23.54  )
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

On 6/11/25 8:48 PM, Steven Price wrote:
> Entering a realm is done using a SMC call to the RMM. On exit the
> exit-codes need to be handled slightly differently to the normal KVM
> path so define our own functions for realm enter/exit and hook them
> in if the guest is a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v8:
>   * Introduce kvm_rec_pre_enter() called before entering an atomic
>     section to handle operations that might require memory allocation
>     (specifically completing a RIPAS change introduced in a later patch).
>   * Updates to align with upstream changes to hpfar_el2 which now (ab)uses
>     HPFAR_EL2_NS as a valid flag.
>   * Fix exit reason when racing with PSCI shutdown to return
>     KVM_EXIT_SHUTDOWN rather than KVM_EXIT_UNKNOWN.
> Changes since v7:
>   * A return of 0 from kvm_handle_sys_reg() doesn't mean the register has
>     been read (although that can never happen in the current code). Tidy
>     up the condition to handle any future refactoring.
> Changes since v6:
>   * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>     vcpu to the error.
>   * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>     this exit type.
>   * Split code handling a RIPAS change triggered by the guest to the
>     following patch.
> Changes since v5:
>   * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>     change on next entry rather than immediately on the exit. This allows
>     the VMM to 'reject' a RIPAS change by refusing to continue
>     scheduling.
> Changes since v4:
>   * Rename handle_rme_exit() to handle_rec_exit()
>   * Move the loop to copy registers into the REC enter structure from the
>     to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>     where the handler exits to user space and user space wants to modify
>     the GPRS.
>   * Some code rearrangement in rec_exit_ripas_change().
> Changes since v2:
>   * realm_set_ipa_state() now provides an output parameter for the
>     top_iap that was changed. Use this to signal the VMM with the correct
>     range that has been transitioned.
>   * Adapt to previous patch changes.
> ---
>   arch/arm64/include/asm/kvm_rme.h |   4 +
>   arch/arm64/kvm/Makefile          |   2 +-
>   arch/arm64/kvm/arm.c             |  22 +++-
>   arch/arm64/kvm/rme-exit.c        | 178 +++++++++++++++++++++++++++++++
>   arch/arm64/kvm/rme.c             |  38 +++++++
>   5 files changed, 239 insertions(+), 5 deletions(-)
>   create mode 100644 arch/arm64/kvm/rme-exit.c
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


