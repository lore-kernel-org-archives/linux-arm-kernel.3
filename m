Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC453C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6BZb3O1nismz1AKQxPXswtAUctA0Amey6Fi5MYXg+s=; b=ULR2apNSw5fl/u9KF+3hgIVW2B
	ulKv6nup6Jn466nry5YzaD370qWfIFiLgorTTDT7+HUOiscvS3t4ZAbxjQNRbTVn9jxY2sT6PW2/r
	mFXDWdneS6nyVsnicOgd8MEtHAntVacYufJ+U+Zx1uymyUMoRu8qAVVjrfAMA6zBYyLFrqJOortud
	q9kWLsKrpXSbS7ky587SL8RXuiXat1ZbJ4R8b/eGOiFhPeQuk2YKp8BS696cP9bEb0sBCI0quJQmb
	+mzQenhcXibx085JCXtMqmNdf2hqZq2yyyklo6nhg/XusEsn+5wBL4aUbvRJ0R+F432urOKppxv91
	jBszWmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSGU-0000000BF00-1MsH;
	Wed, 22 Jul 2026 08:25:18 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSG6-0000000BEs5-0ljg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:24:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=h6BZb3O1nismz1AKQxPXswtAUctA0Amey6Fi5MYXg+s=;
	b=b2sbCmWEpti7/cbi8DB4wA8UPLpt8xTXHR7GETlKGzNJlYOzwBDazqBy9WU+9+2CdIl0etVU5
	lhPQELc3ZrrPvAKX9VyEHKGeaFTr1jbKcgx156p/KT1jteKe3p+gs6z5feriOAF17otDXffolES
	8OJ7ByFiS+/3zZr/BonySHM=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h4nB41nYbzmV7C;
	Wed, 22 Jul 2026 16:15:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 179DB4056C;
	Wed, 22 Jul 2026 16:24:47 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 16:24:46 +0800
Message-ID: <029735ac-7cfc-4c4c-985f-d53c16643c95@huawei.com>
Date: Wed, 22 Jul 2026 16:24:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 19/36] arm64: cpufeature: Remove
 system_has_prio_mask_debugging()
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-20-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-20-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_012454_626119_A3F9E110 
X-CRM114-Status: GOOD (  10.37  )
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



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> Users of system_has_prio_mask_debugging() have gone, so remove it.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/cpufeature.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index a57870fa96db..95cd8d4acd26 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -821,12 +821,6 @@ static inline bool system_supports_mte(void)
>  	return alternative_has_cap_unlikely(ARM64_MTE);
>  }
>  
> -static inline bool system_has_prio_mask_debugging(void)
> -{
> -	return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
> -	       system_uses_irq_prio_masking();
> -}
> -

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  static inline bool system_supports_bti(void)
>  {
>  	return cpus_have_final_cap(ARM64_BTI);


