Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B556C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 00:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pHPTXlsx3JeIcn/vypuvLo0a6E/wjvoL+H11fk+xgI=; b=dc9h6RwJwjEhurmf4WF5827941
	TOg4cvQubM2lL67fzLMq5qED4T9aa+75HJBLfen/+74/rzMWjZkpwl/fuOC1i+zQVxzhFImRKSFF2
	UoxLBD8L/6nEPO7PVQHmgOtm598GY5oZ5Kty1S2BJAPEU57pRLstmey+dhhKiVIqwI7xs4c8bR9oU
	uj8i5NTlowcgNaQYeTTaCpvp9UFahuZyTlap71X0nDlx3e6DO83aEnua4rJVwakQdaKWeiESeFiPb
	ZTvFuL1MPIn+BcrV2y0rXmC1/Rr7h1L9CVuEh9kY3rpqD6zgrrOKIyEs6VlQsMeldI6+CDOOK4BPP
	93WwOwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAz0r-0000000H35R-0d9P;
	Mon, 28 Sep 2026 00:14:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAz0n-0000000H34y-1ftL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 00:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790554466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pHPTXlsx3JeIcn/vypuvLo0a6E/wjvoL+H11fk+xgI=;
	b=PbBgAn564dLOz1h5F8N6agKyxL6Ei4tZK/tUoRQrSxj6Ek1RGEXthhVuIYzCXTtk28i3iL
	DmNPNK4N5EFj+2WLoWlRvVw19FzpvRN9T3jU4aiXOMB++VUD7lnvoJM13pdL9I9uyCr8jG
	ade2j2UZlYThTmddQW2yE512Tysbcjo=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-aiONuMCoOeCgmCydO40kKA-1; Sun, 27 Sep 2026 20:14:24 -0400
X-MC-Unique: aiONuMCoOeCgmCydO40kKA-1
X-Mimecast-MFC-AGG-ID: aiONuMCoOeCgmCydO40kKA_1790554463
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so4794370a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 17:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554463; x=1791159263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pHPTXlsx3JeIcn/vypuvLo0a6E/wjvoL+H11fk+xgI=;
        b=tZwqF8TiuHGYCUJ5VnvmHzYmoNhoFT0sBRRgj7gzDFQrtqH0Go2gH2pty3UEQVf0RA
         h5MUfZiXZYvUswj+RY6cACJ61u0ZoFoCgAJVLdgk5367f6lXMSg/JrUUBcjs46itMJzr
         B+Ai3Dw1QqjD8pKEAkxtSKot0hr6Baiunqq8yrLorD2GZC3OY3zZxXpHBPOT4tQEdhb7
         BjB2KgzTNUYMeOFG9+eVfH8s0sbDR5Je9B3Wc8++zOdmxifxyhVOh11Cfdx1uQFj9U5A
         /8vBGRr5OvEDuwGrkx+ab48kQmLROASczT/QyyQJOmt/7GeAsaU4UidnxRQQHVA7S/Qo
         yiSw==
X-Forwarded-Encrypted: i=1; AKwUvBw6lh1VMImPrFlUkcmOUIG07LxCRrYQiCC4nHWbTMvYVU8GFbaXl3iqI1WggkOxKqFAKumLW0nRg/X4/0WYdVrN@lists.infradead.org
X-Gm-Message-State: AFq9FYLL0veL7hLJJdivkSskiF+o4eOeyI5pTmB9qOHG8Dh1KiEV0AXB
	GT7J022y3akIOkkTWTgBFnNYT31LvD3XBzbr6GV0UWKcQBwiJaf7Dh5zqVYJCutvZ6Xqz1mpRwn
	CNU1dJXNt0V1+dmPQlOe1V8x/XI+6eKzEeVzjpqM1mkyvOLtXyvrASQM6eLcVGwxfCxE/lrIEf4
	3u
X-Gm-Gg: AYBFou0eXsSHjTpm/gkm0Vcs3Up++vVHKpUK974EC+4TRcCRUqEb36SJFGjyxhmZZUZ
	gtveMWqfblQP0F0eODXEtZpyWtSmt4ATlqsp9aAQw9cznbjL3WqmpskABfY+FK3sMvBN4wzj7ke
	Vwqa6cB69ke2vgtwZWRw1hU3oD6/3/cT72zuE4t0UDRE9Z+zL2eMEEYnn+mNrczDFTYBbxHo+dO
	IcdMW/rmVzwfLuVR0snExzY+Kolh/ipSqvtBXBDrwjnVYWCrpu0zg0w5XKC8xn5FL02CvC+zmSG
	2ws4IYrDioObu8YpzF7pB55FLe+5JwXJdsXl4kXvNnsTStoY9MzBv1gGpaf22SF2UuyOZdul5C1
	4ds8LXA8konIzqUf1qXuDY83Oz/R6YCmefcckMa0zDw==
X-Received: by 2002:a17:90b:274b:b0:39e:6ec6:f4d0 with SMTP id 98e67ed59e1d1-3a0bb553222mr5783302a91.8.1790554463422;
        Sun, 27 Sep 2026 17:14:23 -0700 (PDT)
X-Received: by 2002:a17:90b:274b:b0:39e:6ec6:f4d0 with SMTP id 98e67ed59e1d1-3a0bb553222mr5783291a91.8.1790554462940;
        Sun, 27 Sep 2026 17:14:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm16424179a91.15.2026.09.27.17.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 17:14:22 -0700 (PDT)
Message-ID: <5987866e-92b6-41d7-87a7-ca1dee2647af@redhat.com>
Date: Mon, 28 Sep 2026 10:14:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 02/20] KVM: arm64: Disable Steal time accounting for
 protected guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6zK02rahr_T7OfR5uHchvHblw41lIGZZ9n5mPC536Mc_1790554463
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_171429_551768_E4A1633B 
X-CRM114-Status: GOOD (  10.21  )
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
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check
> and proceed to configure the PVTIME as we don't do further check on the
> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
> possible and catch things early.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 +-
>   arch/arm64/kvm/arm.c              |  2 +-
>   arch/arm64/kvm/pvtime.c           | 14 +++++++-------
>   3 files changed, 9 insertions(+), 9 deletions(-)
>
Reviewed-by: Gavin Shan <gshan@redhat.com>


