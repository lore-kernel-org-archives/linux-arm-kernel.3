Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2841FC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5votifnwitH8Ds1fhrux91JN6J8KXmnO59qVNlCSXwA=; b=gjM/mGa/APQm6y8QEUoVv8rjLm
	38JEr9gHUANaMmxOxMyhjWc0CWMEFaXDWU6QSaeAacIVmh9TNqxqXZfB72J7+DHIEbIML4N+627lo
	Sr/x5x4nBLmtt3n7M+owM3bdn8uyY4tgLPeneUkOJu0gBk/xVmIfWoyb6ZWaTvev/ltMOQMx/AWoF
	0WyzQ2zxqXaal4rjV+UpI755XQwMo3Y2TdAEN2nEzXVe8xFmzL8zTVulU0WXPQl1z2z1ma1F4vAy/
	oEPY+fmYllIOPKjj/MoiL8ed+D4qUf+OFXqlqaBiDw4rQzvWjyT3B9/60IKHDv6ZDLtdLYv5cB28V
	gua/yofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB09Q-0000000H77l-4Bnr;
	Mon, 28 Sep 2026 01:27:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB09O-0000000H77F-1Fc3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5votifnwitH8Ds1fhrux91JN6J8KXmnO59qVNlCSXwA=;
	b=bQ4aPz5Tklr+4Jix+7lUH72KJKQ7MCx9AoASNuH6G3s3cLiFiAUqezNAiX8GTqR4lgmmoS
	QlDiRmPy+2XLfQz2mKnec6YdXrVqWqrAe7OopKbizNDqO65z/cC+usIjq/Z7hlkMVE8hr6
	Tqnd6+Tbc4L0aIo1o7USGNL2wn7/t9c=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-M5btfUhwP9OpgGac336DNw-1; Sun, 27 Sep 2026 21:27:23 -0400
X-MC-Unique: M5btfUhwP9OpgGac336DNw-1
X-Mimecast-MFC-AGG-ID: M5btfUhwP9OpgGac336DNw_1790558843
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8814bf38f80so1198868b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 18:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558843; x=1791163643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5votifnwitH8Ds1fhrux91JN6J8KXmnO59qVNlCSXwA=;
        b=lkWXK01JAu26UNoLLZVjJoMq0rLqalzSGhSQz6umDN9IUzmt1JeKiGtlz8sjLlLvlF
         T6Ee3qmUvZWKNg+MhtClVzkHGemiVZUO/j+SEqXPtojMpssMXy9uEGnX9M7MIwJaUP8U
         iehB20CAP6nB/Mcb3/wQwt+i6+SZu+w2BJwKpOqevOuKybK/kLunC/MaJK3p4K0V+Z4g
         3L3HhdVUjjMYxwfCAU8H3AgvTKIYGlIazkUEQQdYokRcgJP36ut+dHmx0bGHVF1/Gap1
         mlZwN+nhSVIPiJbtqkbxQzGuBJqALRKRdp9ck+CRAMMFg4c4tGTLB9G736QYR4Ynfa4b
         G4mw==
X-Forwarded-Encrypted: i=1; AKwUvBz+IBTg/QnkzTK5kqypv00oV235r9Aygs24xf7vKXDoZcY0Rmq2QFaz3MTsEJpXhdaIX3iKTrVFlLun2/+RMxN4@lists.infradead.org
X-Gm-Message-State: AFuF++ler5k6Xq6anCUsumGPGrkhwyNIzzCBPguJa4TsqqEHYp7Hiy2T
	QwY+dVJ2Yw5LJ2ZX/Z/005J7RvyedxitykJxQ3nyLTNbT8Vgt09yLAKU4riV90SMbY5EsN4gTul
	jmg9xmDlmoULlad2DCnPqdkojC65wNwCDjhbF0YS3Cd9CFLirprKTpmp2GE7Mik5F6+jmn0me5h
	Ej
X-Gm-Gg: AYBFou14eASlbfCLTBLkId9tYZno4crVWtuLQQDXDB6r9G7d5URSZbB3MKwaZmIeLeI
	lKrX7fcoQqNBrZ2mNFOpz0U43vZ5fDVBlybsWCOJ7tqbr1QjB35vFnkhWCvlEuXgvQ1Qkm1FDsY
	QZff/vR91LYf6dK/YgVfkmwnvw/J0/7rwVBeCPiFM8/GGvHhtOFiEQprNGwxkXThFXYSk4RBCCh
	931/piRuWrdNpY6Ptm752Db6o7NQ15M5iXjcQU/Fch6Nq00D7e3uJDeuYZ7f5LHaaHqXUOXjGJZ
	QKTBrvFwu8Rae7qponFglEPCtOBWxMzCflV+ct90jJHBsVqZMeLB1etvi9ZCVx+ImtPVsTwYh+L
	2VXFAwV0KOmzDlMrQRa8LIh/jRvNc4XzKxDtu4VCKBw==
X-Received: by 2002:a05:6a00:3d06:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87e9aee4a61mr9245890b3a.17.1790558842677;
        Sun, 27 Sep 2026 18:27:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d06:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87e9aee4a61mr9245873b3a.17.1790558842219;
        Sun, 27 Sep 2026 18:27:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-882d579ca0dsm907806b3a.21.2026.09.27.18.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:27:21 -0700 (PDT)
Message-ID: <2c7a9780-1846-4b5d-b743-42ee1bfdda22@redhat.com>
Date: Mon, 28 Sep 2026 11:27:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 14/20] KVM: arm64: CCA: Add bare minimal S2 operations
 for Realm
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-15-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-15-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wSmq-EB22YwsRt-k2EMXsWwBaHNv-1lJQhmnVU_dCX0_1790558843
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_182726_615242_AC9FF96C 
X-CRM114-Status: GOOD (  11.79  )
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
> Add bare minimal MMU operation hooks for Realms. The mem_abort handling
> is chosen as the default KVM variant. However this cannot be reached for
> Realms yet and we would need real RMI command support to make it fully
> functional.
> 
> RMM takes care of the TLB flushing as required, when the Stage2 is
> modified. So host doesn't need to do anything explicitly. RMM doesn't
> support access flags for the stage2, even for the shared IPA.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


