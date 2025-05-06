Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26DDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dho+mYo5unorecow3GNU5PY21xkyxq/EFfczBzqYpMQ=; b=HioAamholLaTOLl/9RdYxz5bTm
	Rx1R0f5O6XlbaDO209q/hS96aQ5iD63q8kcl5tObqjwDF/c64eZQ7kOoUEA05XeGLxOgJRf66wsVL
	GJeW1fVPnZKCZnmu4oebqoxJP9dxYXPyUlnm/Z+J8DMY+6XfMNQUZEEAQB1MX0LCIQ4rsJczuIfca
	58ntmrvE/8tPEBfSLrhC6uJY4Ca1lXpsWMSPGKm86eII9D9j+d9TQSIz4Hxx/amTRukA4Fn3td8kD
	owUjtKknEOPHSKPNOtl1Z+sZwzoJ/4JL9uxKtxJph9rxF1gk2NDCuq/56SOepb9Hlv8MNRppNN/xo
	LB4kY0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBF1-0000000AXZz-06o6;
	Tue, 06 May 2025 05:53:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC94d-0000000A1AI-0rZy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 03:34:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Zs3mq2C3BzyVKC;
	Tue,  6 May 2025 11:30:03 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 2974A180B5F;
	Tue,  6 May 2025 11:34:18 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 May 2025 11:34:16 +0800
Subject: Re: [PATCH] arm64: kvm: Replace ternary flags with str_on_off()
 helper
To: Seongsu Park <sgsu.park@samsung.com>
CC: <will@kernel.org>, <catalin.marinas@arm.com>, <suzuki.poulose@arm.com>,
	<joey.gouly@arm.com>, <oliver.upton@linux.dev>, <maz@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <cpgs@samsung.com>
References: <CGME20250415012410epcas1p42b48977934c21b5db0b19f4185f7a63c@epcas1p4.samsung.com>
 <1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <112b336f-40ee-113b-2b10-4ba2f19573de@huawei.com>
Date: Tue, 6 May 2025 11:34:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_203427_399878_8931DE95 
X-CRM114-Status: UNSURE (   9.81  )
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

It'd better to write the subject as "KVM: arm64: Replace ..."

On 2025/4/15 9:24, Seongsu Park wrote:
> Replace repetitive ternary expressions with the str_on_off() helper
> function. This change improves code readability and ensures consistency
> in tracepoint string formatting
> 
> Signed-off-by: Seongsu Park <sgsu.park@samsung.com>
> ---
>  arch/arm64/kvm/trace_arm.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui

