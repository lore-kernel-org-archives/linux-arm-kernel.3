Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A289AC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmHYt1Ti8nIvrqszBUhxBgvTrbJZdy2Ri6tFNNhqhDs=; b=u9kHaAuCLGfz9ID8ADsq7Ae3gW
	ITkgbrQxmUJKEzPKFx3jSsj0MDZRnEQqN2qY8M/NJFt++ksmDfxplmtCrWYGLpC0MdHJajLuvbdHK
	jqTSO/1bflH5rRRSJyO6vXU18nbl624jPe42vdQ2HUacQJ+YlsnrNSpU1o1jaVgqCwS4OyUYuh+FJ
	JeO9L2GZZ4vXRoKXqJ3UnMtFjy6hGTLIeVsVLMLNO4Xv3I47at1VtKrNe9x70ugO+cruebSWjg2g/
	SV5KcJ2tmaxlt1UVtiS6roblFV7rhLr3Emc1ty0LMRwLtILwU/qjlFgXQrX9NJUmoQcyA+w3INu9w
	0zVKhu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAztS-0000000H65x-0ZSv;
	Mon, 28 Sep 2026 01:10:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAztQ-0000000H65T-01DV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790557855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmHYt1Ti8nIvrqszBUhxBgvTrbJZdy2Ri6tFNNhqhDs=;
	b=U/mkyNQCaMNhbn2SuKMiEdH049f81duLJfLsX2SYRuB9yyr1twDoTOYi05q8BpTeQd6voq
	ANohikUNav2HTD2b8U3Jw1+N/PuXfADH52IDhBWNdAskkRx1v2l2RmA0oUwxD82aUGKCEG
	EXiMOcjYrzifYwopELzw1hGn8E6/ACg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-sX0U_4P6PKaYjz0fuoGZDg-1; Sun, 27 Sep 2026 21:10:52 -0400
X-MC-Unique: sX0U_4P6PKaYjz0fuoGZDg-1
X-Mimecast-MFC-AGG-ID: sX0U_4P6PKaYjz0fuoGZDg_1790557852
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so1135619a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 18:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557851; x=1791162651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmHYt1Ti8nIvrqszBUhxBgvTrbJZdy2Ri6tFNNhqhDs=;
        b=EHOlZN/L+s+2KsJMsn0b6ixYB3vcT/xBOFQawjr+5a6TBse23dTVIvA0fhDwpMhI2G
         oS9Z4l/3Gja8sSLGRRUo11nodTcFb+2OXqzAwl+YDNYP4bMmHGvRlaLFWupP+HBlurv7
         pCorv4WEFgotr2IyKfAQua4CkMjHqIwsdURsGxGpEsXVixy55nv7RKlStc9ZRqt3i03R
         RkVToZT6bcOsmqnUoRUH0Yrhj3LOjo+ZXQzetK0keUue6jiZhCv0c+5FxzNqbSSHYmBM
         lxyomrOpMZj2VQnwJ3i1Br3X4foKH+7vM0VX/SeesfNDuUvs19BvOPJhXkpf/0Krxy31
         cKlA==
X-Forwarded-Encrypted: i=1; AKwUvByVJqPJS0nDDTmH8Sjf8ej73xt4AXDBoLpjaNdZi/FTF5AsX0w0zzs7XtZvVgGw96MEZu090bi9hEdsTkm7vF2c@lists.infradead.org
X-Gm-Message-State: AFq9FYLin+Ysd3bnKyw8d74ULcPplsVkWTE47VnP70jzlOZmAJKJisVc
	3mNkkOkZuP3MdX0FZNA4P9n16WLCEQ2Tg/jGmTMZ1EFo73T5q7poFT/2G89lTcihtlYT0PvZZXJ
	mfBufKSrk393L8neK2HfFRHRhsTa2Ye3IBZiikd0cxQcVA0J/98Bkq588aUhUGH9QK+ySbnUo4b
	12ZfTFd5W1
X-Gm-Gg: AYBFou0qWdiJKKBpivaeNsULNpF43miQ338ZbwTsbrFA4Nw9OB9140A7YKytaHG1AVp
	P2NPi6fakesG7fo8KcN2DrrbohFOK20YPUiWkEdm6ZRjLFAIbKsJiQqrQP62T3rMAwW5VOmol38
	1T+bFOV3nWjbn1Sdd0njyyx3zNuAnjM+g3NTgIj0oiXdBdTb0EfQff38dMXg6xLtmDpvcD2I1+E
	yb3o/Zu93H1ZPiV9VMREdLvc2dreqEzOaCzP4HooxxKOZpaRim7ByT06gC1lD0qimWEok4hejPk
	t735kaA3qgtJyULSPxLZj2eFPY6ZvVoA5IMKeRfqLjZ10+YQDGs5v713MNCwOL5jDux5fJVkajl
	aHBcJk4Pl0vVYllmjLYSjuDT4cPLrEp7LE9Xgf8rJLQ==
X-Received: by 2002:a17:902:d2c2:b0:2df:4862:6092 with SMTP id d9443c01a7336-2df7dc52ademr80473455ad.56.1790557851475;
        Sun, 27 Sep 2026 18:10:51 -0700 (PDT)
X-Received: by 2002:a17:902:d2c2:b0:2df:4862:6092 with SMTP id d9443c01a7336-2df7dc52ademr80473175ad.56.1790557850985;
        Sun, 27 Sep 2026 18:10:50 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm32933225ad.83.2026.09.27.18.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:10:50 -0700 (PDT)
Message-ID: <a4961d90-42ef-4954-beb5-c07fa1d92fd4@redhat.com>
Date: Mon, 28 Sep 2026 11:10:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/20] KVM: arm64: Mandate VGIC v3 for for VMs running
 on hyp that don't trust the host
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
 <20260920212845.707-12-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-12-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8pZ6N0xbuvLmBB6PNnRw6vh8cIJVCHzGM0ZfpBIbVh8_1790557852
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_181056_119456_1743C337 
X-CRM114-Status: GOOD (  12.44  )
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
> pKVM and RMM, both do not trust the host. Add a helper to detect the VMs
> that have "distrusting" hyp. Use this for blocking ioremap of vgic-v2 into
> stage2 and prevent creation of VGIC other than v3.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v18:
>   - Cover pKVM guests for VGIC v3 mandate.
>   - Merge the VGIC mandate check in here.
> ---
>   arch/arm64/include/asm/kvm_host.h | 3 +++
>   arch/arm64/kvm/mmu.c              | 2 +-
>   arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>   3 files changed, 6 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


