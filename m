Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCKtYd0KrS9iA86oHouqdvS8drpMdPPxhpD82omBp/Y=; b=m3G6Ul8Rnz9DBjL6tFspbrjvv3
	fSzADE1VhBlOfhwYYQKDHSwr/WrQT73mgGO/IiyWfEGM3+LoYQp5BycjGg9pfPb6Kux5ZadgSoqfJ
	zCRZfKgFqrvrO4gm+RYfUoiMk91rFlrnlaMplSjHPyYA0hoGA1u2SVU7QjsK4HDGnPa4ZZztY/cm+
	kqOvsFusFB9HQUTtLugW2XUUgZ3gMyAuI5tB4AdaLsAIXt2fWTyuTX6eKJx/zhWN0WwUJNE6+Uv/Q
	0qO1Th9UPjCvvL20EWuX3VF18affcvfcuM6voayqI0e6Fa/P+wD3QYfB2FjSwaXMJDUfC0iT4+bzC
	xF3mBTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAdl-00000008Jl2-2j6o;
	Mon, 13 Jul 2026 06:59:45 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAdh-00000008JkB-1M4W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 06:59:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qCKtYd0KrS9iA86oHouqdvS8drpMdPPxhpD82omBp/Y=;
	b=Hi1kKSASpycUH88nITCS9wSaQRX1V1nz7GEv9lLxeTiqYGCEAWyVINkgRk6o9kWO2MRNZL28U
	CYWceHDL93Ln97no6OtGvv/+xJmBAQST/9U09we2NtCk481lUxCzXlA/8jjSgGY6Vie6jCajINQ
	wLM7I+fKhPrE0F8X8RdoCOI=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gzCjp0RhGzLlTK;
	Mon, 13 Jul 2026 14:50:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1FECC40563;
	Mon, 13 Jul 2026 14:59:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 14:59:21 +0800
Message-ID: <86f4c6b1-d7e1-4f65-a566-d00ea3766f4e@huawei.com>
Date: Mon, 13 Jul 2026 14:59:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix: arm64: syscall: use live x0 for
 syscall_get_arguments() arg0
To: Yiqi Sun <sunyiqixm@gmail.com>, <catalin.marinas@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <rmk+kernel@armlinux.org.uk>,
	<will@kernel.org>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260529065444.1336608-1-sunyiqixm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_235941_540585_5BB43744 
X-CRM114-Status: GOOD (  14.73  )
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



On 5/29/2026 2:54 PM, Yiqi Sun wrote:
> On arm64, seccomp obtains syscall arguments via syscall_get_arguments(),
> where arg0 is currently read from regs->orig_x0. However, the syscall
> wrapper consumes live arguments from regs->regs[0..5].
> 
> A ptracer can modify x0 on syscall-enter stop before seccomp runs,
> but cannot update orig_x0 through that interface. This can
> leave seccomp checking stale arg0 while the syscall executes with updated
> live x0, allowing seccomp bypass when filters depend on arg0.

It seems that there is indeed a problem. The modification by ptrace is
inconsistent with that checked by seccomp. Similar with following
another problem.

https://lore.kernel.org/all/20260713025712.416366-1-ruanjinjie@huawei.com/

> 
> Make syscall_get_arguments() read arg0 from regs->regs[0], matching the
> actual dispatch arguments and removing this desynchronization.
> 
> Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
> Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> ---
>  arch/arm64/include/asm/syscall.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index 5e4c7fc44f73..4bdb4d3ce2b4 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -81,7 +81,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 struct pt_regs *regs,
>  					 unsigned long *args)
>  {
> -	args[0] = regs->orig_x0;
> +	args[0] = regs->regs[0];
>  	args[1] = regs->regs[1];
>  	args[2] = regs->regs[2];
>  	args[3] = regs->regs[3];


