Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ED1C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUVN8bE46YEYReQkt9kTI3JLIfp+2d1gEpoUDSdg5gA=; b=fHfjgrIIsDGWDP+X0L1aU9OPxR
	Rnd4YWwmoVxnFaMeexAZAJPk1H4moSm2BQseTp/jJBIHg8YHs4hq3o5SxDpVlNBmtH67hz9DPcpyg
	7t6IoiJCzOIhawX7k9756266S6SnTwVFulSF3SF58nm3zzf0qApgEuL2mvkIDwhKkfUgSfr27pIO6
	JTHevLLeHijJvKN6wCvl0ebHBvyCqxjiWYCGOsLbzgPCoIK07yJSVEY/bL39sk7utKu/qcOEXYfbv
	0binjsM/Xr2OvB/WGLqFZzEJZ2CjHwiyek/mbM3lecMcGsbOCyF9H2l9oMjGGVd4RinYkFqS9CDdo
	QRJh5tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHLZ-00000007ZWn-29ee;
	Fri, 07 Aug 2026 09:58:37 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHLW-00000007ZVe-3TdI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:58:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nUVN8bE46YEYReQkt9kTI3JLIfp+2d1gEpoUDSdg5gA=;
	b=HRBnb5sjNtcag129YEGv23uhLHjutWJzveRBQVkcpbcndMqKjdFOrE/3etbwkTyfHLcLGKSky
	bpfr5lP0vhvxZycZV0sakquVv/7FFZPrNYDwv6uw/SsAsn/6FLg5KdwxgvGHkJT+fbhnie+9QLh
	uhDwmIIH3DxeLdXdxd3SWc8=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hGfTK3hHBzRhWY;
	Fri,  7 Aug 2026 17:47:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C25D640538;
	Fri,  7 Aug 2026 17:58:21 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Aug 2026 17:58:20 +0800
Message-ID: <12ab0600-abcf-4e6e-85b9-57a7d35f7007@huawei.com>
Date: Fri, 7 Aug 2026 17:58:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 34/45] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-35-vladimir.murzin@arm.com>
 <f54fb8f7-2bf0-4fdb-bfc3-b11ccb924e64@huawei.com>
 <73f0c621-44ff-403f-9cae-d94095accf6c@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <73f0c621-44ff-403f-9cae-d94095accf6c@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_025835_030162_B5E9B215 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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



在 2026/8/3 20:33, Vladimir Murzin 写道:
> On 7/28/26 13:25, Jinjie Ruan wrote:
>>> @@ -924,6 +967,20 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
>>>  	 */
>>>  	arm64_debug_exc_context(NOIRQ_CONTEXT);
>>>  	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
>>> +}
>>> +
>>> +static void noinstr el0_interrupt(struct pt_regs *regs,
>>> +				  void (*handler)(struct pt_regs *))
>>> +{
>>> +	if (regs->pc & BIT(55))
>>> +		arm64_apply_bp_hardening();
>> It seems only after enter_from_user_mode() or irqentry_nmi_enter(), it
>> is safe to call normal kernel code.
> 
> I do not think there is issue with that. Here is call chain:
> 
> arm64_apply_bp_hardening()           // always_inline
>   -> alternative_has_cap_unlikely()  // always_inline
>      -> cpucap_is_possible()         // always_inline
>   -> fn()
>       - qcom_link_stack_sanitisation // noinstr
>       - call_hvc_arch_workaround_1   // noinstr
>       - call_smc_arch_workaround_1   // noinstr
> 
> That's also in line with el0_ia(), el0_pc() and el0_softstp()
> which call arm64_apply_bp_hardening() before enter_from_user_mode()

Make sense

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>


> 
> Cheers
> Vladimir
> 


