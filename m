Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB199C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gc43alueHNjQq0WXaXpIZol5pNQHnDbpHeJQ0elMPno=; b=FG3RGE2GAjhQ8nBVGj918nmyfU
	B+AU2g1Dx5YOMFziqa629cYDMkRrzmiJUqvJDpxFjfTnyMt1oAzWExdyuvbBck94UAh4aBxFFvQgN
	NSM/in6DNTpH4h63O0rADlvYbgkflxApxLQEq0dFGvReczY3pTD+mxykt26eB+iNuZvvrwoMbzmZF
	zFsCO/jNUBFE/N/caUyLtmfQZQcSr7oKlZehhHAPZqimekyPpAn+o/x9gRHLkYGSxj2tQHk4FdUhH
	sBsvdqvk645M6V8T2ZLFeY+gem5w7MJRfCqAOiLean+g/hPTFCU9u1GYVTDralI+Vr8ILAXEtPwJr
	wyxzJZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uSM-00000008xN1-3kjj;
	Tue, 08 Sep 2026 11:57:42 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uSK-00000008xLw-1fMA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:57:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gc43alueHNjQq0WXaXpIZol5pNQHnDbpHeJQ0elMPno=;
	b=lGXJG+z+qP/9knI6Q1Chyv/DIPLN4L+ZycdyfPWLPkNPDqokYAfbRHAPv0PH8mAh9qQqRlQ6a
	EcZbJC/Ur7G6AzVCrYdQObqHEsB/X8bMHp0IatNh5GYe0WcpJeKxDdJb4sSCnCEnPCTZ6KSrzP9
	Ie7+hNJ9ovEbtSJ2Tp+CGdo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hfMbk6sWlzmV8f;
	Tue,  8 Sep 2026 19:46:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E137640586;
	Tue,  8 Sep 2026 19:57:36 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 19:57:36 +0800
Message-ID: <1f63a6fd-6e09-47a3-96cb-236eeebf8c20@huawei.com>
Date: Tue, 8 Sep 2026 19:57:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/19] firmware/psci: Cache PSCI v0.2+ version number to
 avoid redundant SMCs
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-15-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-15-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_045740_625796_18F97578 
X-CRM114-Status: GOOD (  13.52  )
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



在 2026/9/8 0:40, Will Deacon 写道:
> Secure monitor calls to EL3 aren't necessarily cheap, so cache the
> PSCI version number in memory to avoid asking firmware the same question
> over and over again.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  drivers/firmware/psci/psci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb23a..8bb3f7c37678 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -155,7 +155,12 @@ static u32 psci_0_1_get_version(void)
>  
>  static u32 psci_0_2_get_version(void)
>  {
> -	return invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
> +	static u32 version;
> +
> +	if (unlikely(!version))
> +		version = invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
> +
> +	return version;

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  int psci_set_osi_mode(bool enable)


