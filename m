Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323E5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOcHvWwtcoTypbxp98VhNVRdsQUyhh9BK+9txW9PWA8=; b=0Ds2DBOrQ0levOcRHLz9u7BKZb
	4YqXULEs68jYSTs0UDRmanEZuGr0wYuDw7xXUCuoYagAV05fssGQTeIZlZzdcypYU0xGCS/b6/Bg0
	AKMzhx5WIo9pwYU4act8IPCVMb2FtB3YadoaPfLxvMpJopx1fduDNbCKszqQpXGgFqd8vxX4e8VTY
	4i07pBguuiKeUrJKJ6uU5DSIy2t8v8yklTbKeUGkBPqkrHRD1Q15L2jwuwRthH4e/bSQr3Q51Xj8H
	k2RDlBbACp2kX86ADXd2gBzAfmsG14BtOba1UX0VhG3C/ux3BGzXEa+I4wp4abGGilMpFex1Gwpal
	Sqha8P1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBdz-00000008WOX-3q9y;
	Mon, 13 Jul 2026 08:04:03 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBdw-00000008WO6-3i0z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:04:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rOcHvWwtcoTypbxp98VhNVRdsQUyhh9BK+9txW9PWA8=;
	b=rETe63FDmlieJ3+otJUtNf0xmKNxBe9Ums+CpfELs16QYBRdDzmfGJYGflYY32rqRxVERJY7V
	RxjJRSbGQYM+ncytbxo4xbRae1/p014CxhchtggmteOm5OLAnByHuVJeRrEe+ahccTRjdV4fxtT
	2OmISUK5UIuiazO7R+kLdi0=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gzF886M2XzLlVY;
	Mon, 13 Jul 2026 15:54:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F29124055B;
	Mon, 13 Jul 2026 16:03:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 16:03:49 +0800
Message-ID: <e9b309ce-467e-4c98-8d3f-279ba233c3ac@huawei.com>
Date: Mon, 13 Jul 2026 16:03:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 33/36] arm64/efi: Add ALLINT to IRQ flags checks
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-34-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-34-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_010401_077012_32D7F3AB 
X-CRM114-Status: GOOD (  11.08  )
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
> EFI is not expected to modify PSTATE.ALLINT, so check that it remains
> unchanged across EFI runtime calls.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/efi.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
> index 479741d52c90..ea8403c7bdaf 100644
> --- a/arch/arm64/include/asm/efi.h
> +++ b/arch/arm64/include/asm/efi.h
> @@ -78,6 +78,10 @@ do {															\
>  		pr_err_ratelimited(FW_BUG "DAIF+PMR corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
>  				   __expected.daif, __expected.pmr, __actual.daif, __actual.pmr,			\
>  				   caller ?: __builtin_return_address(0));						\
> +	} else if (system_uses_nmi()) {											\
> +		pr_err_ratelimited(FW_BUG "DAIF+ALLINT corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
> +				   __expected.daif, __expected.allint, __actual.daif, __actual.allint,			\
> +				   caller ?: __builtin_return_address(0));						\

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	} else {													\
>  		pr_err_ratelimited(FW_BUG "DAIF corrupted (0x%x=>0x%x) by EFI call from %pS\n",				\
>  				   __expected.daif, __actual.daif,							\


