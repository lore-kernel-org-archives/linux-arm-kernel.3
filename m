Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010DAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmg9QF7g6+RGBqa8lAeiCv+Pq0crS7eN559cYymqtdM=; b=blDNI6eBK/dH/oB7L42qyFEAap
	xRh3TNFtb+HsZJc62zzfNyZ+n3ciKBnahkTdRXtgaEhiEe7gr8X0wmokYVI/SLBIPshCmyrjmusOe
	KBg/L2vygdJgwG+d36WVAyswiwEK0tjw0jqeWPZBcgL73sslvfWWj9B+tZxcwjDHJaZbqyasiq1xe
	TOW1j6MmCNrbQ8zCLJBw0Uq4/v9yUbBwBi27WXvJYX9fobcOkZIVmd7B530kvppMX7fE7Bra4Uhh8
	t262QWSP1lhUNi7LmDTULvZiuxLRSkLXJuKdKma1nkUzBVFCYYw4xZyaATLoyLJ54gBCuZtyMgM0O
	Z8NwShEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDGV-0000000GNgc-3Md4;
	Thu, 16 Jul 2026 04:00:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDGS-0000000GNfr-1QT4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784174397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmg9QF7g6+RGBqa8lAeiCv+Pq0crS7eN559cYymqtdM=;
	b=HYUvLQlXanppV1F+zZ85YqmqCxdE1gLhjkruPCnl4OA5nZ2iNsK8YaYrnTUpeQewvB/Kpx
	F4LlOSovYC/etSFvCJZ5fQk0poC/qL0lud4aQox4NcvP9Oi5dTBKhL+6ZBQUpRy+LONEeh
	XfF4IPeiY4MoDJmn+fXsn5O3e1aY5hM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-FrE6kXEjNwKuz2C2s3vEUg-1; Wed, 15 Jul 2026 23:59:55 -0400
X-MC-Unique: FrE6kXEjNwKuz2C2s3vEUg-1
X-Mimecast-MFC-AGG-ID: FrE6kXEjNwKuz2C2s3vEUg_1784174395
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca860baea9fso6802301a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 20:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174394; x=1784779194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmg9QF7g6+RGBqa8lAeiCv+Pq0crS7eN559cYymqtdM=;
        b=PKKgDXSuZMqbAta6pjO31dYdZohGN7f5Od8EU54LNDPsDzkT5Y9VWf6sAPvkS6TIGm
         BB01O07Pl/LWSYaljg7FI/73Qw1SY6nmlqtq7166rzr6Uj6Opj16BCgscp1KFPUoMkC+
         o/QbczygHn1nA+cRfojfaVi/SFW+xCUGvT+pcr/bJYyGdvu6yU/JxWvoiyKdvJ+m/8iI
         cQx/sQm3fbw4kmXIYui+yaPOqfSR6+qiDl1h7H4SuQxUT638put3gXU9nmGTh7+Jbn5P
         1RgaG9z4yRsVz9JseXbXJ4fOXy6VSJbtcOVM6parAMWz4J1MNrkcpmy5WS397NocyWmq
         GEgA==
X-Forwarded-Encrypted: i=1; AHgh+RoDi2OyZ66cSt28zB88hPMkZZg25I8jxViS4e928OGIV/5pUCiIKmN5mHtPi1Ty1YIYOa/qniGQxIw35WWrGDkn@lists.infradead.org
X-Gm-Message-State: AOJu0YxzfsqZkZmGvzT+0KFRHKLjsTfWHWaTK1gHOGMVzyBYGNznuw07
	zeBy13ToGEbIqIuX44cJld7b+6ObX47ra/MWB2OOlc3quYHgTSL6t7JPfbW6k+wRmjGIZ1Z9xCD
	Cu1FMd0kKsk0VlEsVHAzOzVTyYl1SHBW3wQ1UVhc2RcHEkAuJdd8mkTwNLWYoRtlknCXUyaud+8
	pr
X-Gm-Gg: AfdE7cno7Xl12TwxuUqQeC8AGnQHUDmJ2HS84OXWKPdyOftSSauONrplbVCitfnTFCU
	WdzeZwPOrcopD5Sa49giCgVMUC1k9m1m+dQGKdsOU27jsmuGazR7tDl954yzP9ew3H0ketGnmRL
	/HFQ4uKQ0MepG6PqwSAOye22SB0MHX6YEjZLn5xegIvLav3A6/06FuliaX7usb8ESRQ5xTB+0rg
	snDyBx2H1aoecOCMxdWSrsrWLd/N/8NuBJknah0c0leLdwZdTWsF+j53umPrplx4qoRgQnbPnGm
	S3D395+EEEaM6yZLJTWD9I1v6Cimn3srNWSSYEPZAhYhTOHy0o7S4MZAaDCVzMkFseMyvzLf6oT
	oKQycMMyhL3dFc8IUBBbEFhNy34DgmARVCIKcWknNc2E=
X-Received: by 2002:a05:6a21:2d44:b0:3b5:6b5a:4f29 with SMTP id adf61e73a8af0-3c1102a1727mr19496070637.30.1784174394515;
        Wed, 15 Jul 2026 20:59:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d44:b0:3b5:6b5a:4f29 with SMTP id adf61e73a8af0-3c1102a1727mr19496050637.30.1784174394071;
        Wed, 15 Jul 2026 20:59:54 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4365b0dsm10762330c88.15.2026.07.15.20.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:59:53 -0700 (PDT)
Message-ID: <519cddd8-d67a-4aef-afdf-97c933b73f82@redhat.com>
Date: Thu, 16 Jul 2026 13:59:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] arm_mpam: Restore the error interrupt enable
 from mpam_cpu_online()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-3-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-3-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KUBJIfTW9vVAyk1oIY17xQEB0xJzKJOTUOJ0d_H5vX0_1784174395
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_210000_478435_03C926FF 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Ben,

On 7/10/26 9:55 PM, Ben Horgan wrote:
> When all CPUs affine to an MSC are offline the MSC may lose register state
> which the driver then restores when an affine CPU comes back online. The
> error interrupt enable, MPAMF_ECR.INTEN, is missed.
> 
> Restore MPAMF_ECR at CPU online.
> 
> Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 82966ca2a631..acfa9a4dc2fc 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1852,8 +1852,14 @@ static int mpam_cpu_online(unsigned int cpu)
>   		if (msc->reenable_error_ppi)
>   			_enable_percpu_irq(&msc->reenable_error_ppi);
>   
> -		if (atomic_fetch_inc(&msc->online_refs) == 0)
> +		if (atomic_fetch_inc(&msc->online_refs) == 0) {
> +			mutex_lock(&msc->error_irq_lock);
> +			if (msc->error_irq_hw_enabled)
> +				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +			mutex_unlock(&msc->error_irq_lock);
> +
>   			mpam_reprogram_msc(msc);
> +		}
>   	}
>   

I don't understand how this happened that MPAMF_ECR gets lost, but msc->error_irq_hw_enabled
is kept as true. mpam_disable_msc_ecr() is triggered in __mpam_irq_handler() or mpam_unregister_irqs().
Both are related to mpam_broken_work, which is invoked to disable the driver completely.
I don't see how MPAMF_ECR is cleared at CPU offline time.

>   	if (mpam_resctrl_enabled)

Thanks,
Gavin


