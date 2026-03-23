Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199D9F46120
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEtCE3UFyC9EUSjcg5HmiHx+sSKd6jmOnMFqB60P6ro=; b=nn2Ek0aG9L0oqA
	7aKyzL5yy1Fp6z/fY3PRWqs7HyOaUVqF+oSwxHoc/d8elLK2r0ysFy5avGWB/wYhgQGxlkyC6UYj7
	QLZNSFL3xY+iKZ7W2xZEKqBo0ndK2NktBBdqQSPA56cUrSM3+65cTtD75lqNgpLQBOLBPvUykKJtb
	MTHzxAPxlqpR4MciwmqktmsN33N+/hTVSlXJKLLY8d9GgNMrK5vE6ZKFR7k5WMjO7vIDY6bhv/4O+
	88t2H+wjqCqw31GeIBTBhYe3Qp4u5zHt0uy/bjb2wOIAYd4PkDQkJAciyy1ba6wZPz4cLTRpsSqkY
	CFJOkW0BSzWcQRu+eqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fpl-0000000Gt3s-1ebB;
	Mon, 23 Mar 2026 14:00:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fph-0000000Gt3N-3Sd2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774274440;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEtCE3UFyC9EUSjcg5HmiHx+sSKd6jmOnMFqB60P6ro=;
	b=GU2EM6qfj+ExM7yV2/wOGIHKoNqCqZ7d0pOFXx5hBhcFaBl2hzY9uukqw8uWGFY2p9cBoq
	8igRjrFA6iiCr30mN+8m4hem/f7kGfG8woHhflSWZ5E6HdaNlEqVpf3R9KHG4vd94q8nJC
	FjCnL/ECVGlHSKl1iUx2WMJyItZb+sE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-S5OkONWCN46kMVa0-btQTw-1; Mon, 23 Mar 2026 09:59:05 -0400
X-MC-Unique: S5OkONWCN46kMVa0-btQTw-1
X-Mimecast-MFC-AGG-ID: S5OkONWCN46kMVa0-btQTw_1774274344
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b468229e8so2167003f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274344; x=1774879144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEtCE3UFyC9EUSjcg5HmiHx+sSKd6jmOnMFqB60P6ro=;
        b=Jjf2++gUOCgbazBrcY8+aCVSwyABId/U1VToNKTb6EQt7jbOaOGSxRCNVScXtw5xCO
         3zw2JvDM8Ljjj37fKIf//MkI6N/Vt4RHq+YENZkbPMS09g67XSTI/Mw9AOkP0Ft06Hom
         QFmsZstudcB7RUH9YbLNmw6eO9svx36nIZL33sKQFXbQYHoK/ouFJuxg/Fis5rZ0ie/0
         heSukKpEmaumGbqGhHU4ZMVC16rexcG7bqJ7UnMZpunEedKBLjYOfcD3vRWwWZ0kz+QC
         dfk64OB+Hm/0KN3HHVA9YAGIY0PHYIAOWUxnIHbk89s4TowsaSvA9EAnJlhWxWsIMJop
         9wbg==
X-Forwarded-Encrypted: i=1; AJvYcCXOEbuitZbLRQ/AnvoUFgJ+bshFb4JX9+h/zny4zv/1u/BrKzD6j6XY/x9emg6+CMbUWHoTiRDJpoaCCntGDl13@lists.infradead.org
X-Gm-Message-State: AOJu0YwbOKo5eeHLc9mbO0u2hN92dqdkhAQriOURhzK2hyODA32xPTER
	zqWTJFc1R883vxBl2p7L/T4PAwb2pgpfD6VMig6YNwPKFlIClrlPf3L7oom5kwumTHpR0aQE2m5
	sCh0+plvf4zIagmUHujXZiXExonVNxcoe7GilDUgRdUh58GZhR+9CysmhK3ehTc7CUk396R4EDe
	/T
X-Gm-Gg: ATEYQzzEX9Q+Auv59WO06oeI94ikwG3E+pHXFc4wlQTiRK5ZZ+Aln2RXnnd+A7aMmbZ
	SDq+yudhCk1ySxx/k2fkdCWskchv4z3ABTxJ0K8tc1P//7C4Dc2S6pAd6wFdLRPbMJJX+lphP0U
	2A8bX7RGdnJEUptUl+SphrxiPcf3tYN867jM9/T9Fg6yI62K4+sBXU6WiipEz0OpfyXCFh5HjyO
	zktbslB34oQPiH3oEWNQEsY4iiY9Jnaqd5UUNSMRJ/6cdEDL9HqhI5c3QKV+iN4DxuoZWo4xYTH
	rsNp/xYLHmH5vxX8On2rJmjbWTbUOWLlZy2Fo1QULdrCrdo4bnVtkOzPCe4JyfUqJnTpgvBVSKt
	QvMCuzvCe2gFdbW2EBBkjewyewYYGzroj9uHbaFqZq2A9mYk+V9Zl8mJQdrLKZsM1L7CInw==
X-Received: by 2002:a05:600c:4fc8:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-486fedbf2d4mr182477855e9.9.1774274343807;
        Mon, 23 Mar 2026 06:59:03 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc8:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-486fedbf2d4mr182477085e9.9.1774274343151;
        Mon, 23 Mar 2026 06:59:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm416952505e9.0.2026.03.23.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:59:02 -0700 (PDT)
Message-ID: <772708e4-2878-41bc-b74e-8869bce7529c@redhat.com>
Date: Mon, 23 Mar 2026 14:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/tegra241-cmdqv: Set supports_cmd op in
 tegra241_vcmdq_hw_init()
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, jgg@nvidia.com, kevin.tian@intel.com
Cc: joro@8bytes.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, skolothumtho@nvidia.com
References: <cover.1773361875.git.nicolinc@nvidia.com>
 <7988aa837f02e44c0f436bb236cba0573bd8974f.1773361875.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <7988aa837f02e44c0f436bb236cba0573bd8974f.1773361875.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F_ucv81MPtIj68hHnLP1UX66d37yOA2VvCcKJWqLRyk_1774274344
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_070041_936470_95591E6F 
X-CRM114-Status: GOOD (  19.18  )
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
Reply-To: eric.auger@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Nicolin,

On 3/13/26 1:36 AM, Nicolin Chen wrote:
> vintf->hyp_own is finalized in tegra241_vintf_hw_init(). On the other hand,
> tegra241_vcmdq_alloc_smmu_cmdq() is called via an init_structures callback,
> which is earlier than tegra241_vintf_hw_init().
>
> This results in the supports_cmd op always being set to the guest function,
> although this doesn't break any functionality nor have some noticeable perf
> impact since non-invalidation commands are not issued in the perf sensitive
> context.
>
> Fix this by moving supports_cmd to tegra241_vcmdq_hw_init().
>
> After this change,
>  - For a guest kernel, this will be a status quo
>  - For a host kernel, non-invalidation commands will be issued to VCMDQ(s)
>
> Fixes: a9d40285bdef ("iommu/tegra241-cmdqv: Limit CMDs for VCMDQs of a guest owned VINTF")
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Closes: https://lore.kernel.org/qemu-devel/CH3PR12MB754836BEE54E39B30C7210C0AB44A@CH3PR12MB7548.namprd12.prod.outlook.com/
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 6fe5563eaf9eb..83f6e9f6c51d6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -479,6 +479,10 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
>  	/* Reset VCMDQ */
>  	tegra241_vcmdq_hw_deinit(vcmdq);
>  
> +	/* vintf->hyp_own is a HW state finalized in tegra241_vintf_hw_init() */
> +	if (!vcmdq->vintf->hyp_own)
> +		vcmdq->cmdq.supports_cmd = tegra241_guest_vcmdq_supports_cmd;
> +
>  	/* Configure and enable VCMDQ */
>  	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
>  
> @@ -639,9 +643,6 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
>  	q->q_base = q->base_dma & VCMDQ_ADDR;
>  	q->q_base |= FIELD_PREP(VCMDQ_LOG2SIZE, q->llq.max_n_shift);
>  
> -	if (!vcmdq->vintf->hyp_own)
> -		cmdq->supports_cmd = tegra241_guest_vcmdq_supports_cmd;
> -
>  	return arm_smmu_cmdq_init(smmu, cmdq);
>  }
>  


