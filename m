Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60278C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAavuciIg1ufF/nLSzbvyqBHXP95xTYHvpXMTvIAkvE=; b=fmLHzwyIE1X18B
	Ppab6Liq4IUqpyXOGTlDwOvtTjE+BzL4FunlaeerbGBDDoJCeDhU2ZQim2WUe0ZJrtYQpQU8MgfZC
	ZUy7SEKbKLokDRFN3gCgEKvw51JNFbs5ToxeFQfoFZpBrnve+JkAbMiPdHoI9Qox58w6Kj31YTh/L
	sjAp3+/ehYzTS4silMEd6R5F3k/LQqWnecWfoqQ2oe+5r3Iq7DfMz+Q67r/cfG1uxoG+e4fMjn8hL
	wtsyXmzmiKGFD5JcSVaP+FNs85n02hGvBAP3Ho/45EznK9uyoByFoQixlVlCn9qMoEq0DZd6LetGr
	Yq/9Vrs8nN32N2KhJRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi19A-00000003yS7-12vK;
	Fri, 10 Jul 2026 02:39:24 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi197-00000003yRd-2sci
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:39:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VAavuciIg1ufF/nLSzbvyqBHXP95xTYHvpXMTvIAkvE=;
	b=kAZJ0w7zEcogApri4nexUiLh2HZrXG2vPQJ0/EFRqQsEGlLwjmVJaCrJosvj5fjxSBIj9SWNv
	ABjBGhDHvuMZaKhIsc/FAVoCQU3gkBOasyut0z+DGAXkKOsO3+ThUnR4d6M60DNnvg8v+8vsTPn
	lOIx974FF3e44yKm306pEVw=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gxG5D15WwzcZyH;
	Fri, 10 Jul 2026 10:30:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7980F203C1;
	Fri, 10 Jul 2026 10:39:14 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 10:39:13 +0800
Message-ID: <454e79a0-78f8-4c8e-9fca-aad85a6a5aaa@huawei.com>
Date: Fri, 10 Jul 2026 10:39:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 24/36] arm64: booting: Document boot requirements for
 FEAT_NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-25-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-25-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_193921_885404_BE5A7FC3 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> In order to use FEAT_NMI we must be able to use ALLINT, require that
> it behave as though not trapped when it is present.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  Documentation/arch/arm64/booting.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index 13ef311dace8..3170b26ae981 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -568,6 +568,12 @@ Before jumping into the kernel, the following conditions must be met:
>  
>      - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
>  
> +  For CPUs with support for Non-maskable Interrupts (FEAT_NMI):
> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HCRX_EL2.TALLINT (bit 6) must be initialised to 0b0.
> +

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  The requirements described above for CPU mode, caches, MMUs, architected
>  timers, coherency and system registers apply to all CPUs.  All CPUs must
>  enter the kernel in the same exception level.  Where the values documented


