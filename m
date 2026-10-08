Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EC3CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4HbqLovK92A6TAwb6P9llvvE6m7BStHvYxN8zYGpyw=; b=Je4rN5hSqRTE6X
	encLUMvYqKRqgQ0/tHzfDPR1gTGAMw65eWUdpkIuKUcmF23KQuRAxN5hrO+fEhIE2eNR3sUzdYWL4
	QX8K+TAyx19h0WRBLERccSx4x/tshWQRVcQbBzMcEaohvR3CSWeUYrLy/OnG28eCXbZmNybmVwL0s
	+1a1hmGca5kAOHWOlf2EKyAnEM6mJfqPWeMt0a0krpvVShuSgfc9taUoBNygPx9FZOv32xtzlf6gE
	oZgDq/sYNcSFadSsdilLYhIGQoLUELf2Yg5NAfIozQd6XVlLtvgqUtG1r+sBosjXACj41U5x8O5kW
	dekwi9sCeQAnM9+GHC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEizq-00000003o9R-1bjI;
	Thu, 08 Oct 2026 07:56:58 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEizn-00000003o8r-2J38
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:56:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=C4HbqLovK92A6TAwb6P9llvvE6m7BStHvYxN8zYGpyw=;
	b=qv9HfR3QrszT10UTjPpYwRDXkRXy6+IUUZu1DdDU9d47C5a8siP68NwU2ZltaChZlMwVNvN4e
	KC3GtRwt4NOQRzhUPjsF06rPBjU36zSnCgsvQM7gHQgXCAixv6WM0DRyqxnUAU4u/0wXNhRv5Ae
	nY6lpLYIMKWJQM38y9fVd10=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j0hpS1F12z1K9D2;
	Thu,  8 Oct 2026 15:44:32 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E0B524048B;
	Thu,  8 Oct 2026 15:56:46 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:56:46 +0800
Message-ID: <da4bae65-7dbf-4f47-877a-be1b6bd5f533@huawei.com>
Date: Thu, 8 Oct 2026 15:56:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/21] scripts/gdb: arm64: Use TPIDRRO_EL0 instead of
 SP_EL0 for 'current'
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-9-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-9-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_005655_737435_8966B47D 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/19 0:13, Will Deacon 写道:
> The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
> update the gdb 'cpus.py' helper script with the new register allocation.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  scripts/gdb/linux/cpus.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 6edf4ef61636..547a623280ae 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -185,7 +185,7 @@ def get_current_task(cpu):
>              var_ptr = gdb.parse_and_eval("&current_task")
>              return per_cpu(var_ptr, cpu).dereference()
>      elif utils.is_target_arch("aarch64"):
> -        current_task_addr = gdb.parse_and_eval("(unsigned long)$SP_EL0")
> +        current_task_addr = gdb.parse_and_eval("(unsigned long)$TPIDRRO_EL0")

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>          if (current_task_addr >> 63) != 0:
>              current_task = current_task_addr.cast(task_ptr_type)
>              return current_task.dereference()

-- 
Best regards,
Jinjie


