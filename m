Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0115C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JruWqLA01B2dEv9gQhhvyux0+hQMfUg+msbaSzuOvM=; b=IYuKAzJZrKYa8ZODo9i4XqSEgl
	ou6iY0EoDcQwgxY96wux3jIxSfxO3Is97Saoxq4I7NMnF1SZWkKi978R6mCEy8nZHmZC6TSgIF2G+
	QvabdFnalmn+FczivdG0bfTfBKpGE7SI39ZpMYz6lTn6CXmBKiFMi/LVwIP6xA2wwwb/7X/vjEqtd
	u7wN1sqChv+UfC78ZFOdXlqFnaMqhthCdLRyiqG93gH67lSu5EGIJ09tcdoJsFWma+PG3ByFk9u0F
	l9koB38KHQNs8r509Be6yE2+crD06lN+7pnnbKN5MBUxIM8noe6VhPVFtPQWN3gZplwtVKNYRY6iB
	/wduPzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnzc-00000002Qrb-3XmC;
	Thu, 09 Jul 2026 12:36:40 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnzZ-00000002Qqq-3emV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:36:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5JruWqLA01B2dEv9gQhhvyux0+hQMfUg+msbaSzuOvM=;
	b=Og9I6RWoDyUFO4pMxOv65HvPAfknSuZpilJDlYiD+hchxwi3tb48g1GDesZHbAdMr7nZ9DZta
	Aeb4RxtPl0kSsNB3LeJ6MkiinWtMOYdMEwYElHSaf8FgALjc+FxxCxu/RKj/P7KtHIefVpeSpZX
	wMHzK6HWbeK8yIQ+pnDXuUw=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gwvP96ghvz12LDk;
	Thu,  9 Jul 2026 20:27:41 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 817C82012A;
	Thu,  9 Jul 2026 20:36:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 20:36:17 +0800
Message-ID: <171b8988-dc0e-44b1-892c-94142ae43f61@huawei.com>
Date: Thu, 9 Jul 2026 20:36:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/36] arm64: ptrace: Remove INIT_PSTATE_EL2
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-2-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-2-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_053638_068970_0B55EAD7 
X-CRM114-Status: GOOD (  10.12  )
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



On 7/9/2026 8:12 PM, Vladimir Murzin wrote:
> Last user of INIT_PSTATE_EL2 has gone with ae4b7e38e9a9 ("arm64: Allow
> sticky E2H when entering EL1"), so remove it.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/ptrace.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index 39582511ad72..f7dc5fb9427d 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -18,8 +18,6 @@
>  
>  #define INIT_PSTATE_EL1 \
>  	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
> -#define INIT_PSTATE_EL2 \
> -	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL2h)

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  #include <linux/irqchip/arm-gic-v3-prio.h>
>  


