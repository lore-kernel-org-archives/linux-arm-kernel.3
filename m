Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F232C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoqwnQXDi5UEpd9l7OJUi6jTChWJKQD2j/6ebt1X+dM=; b=GSHVpM4PuVJ1YJCIeaDRccFkOp
	sSmugYNYd9ZGe0IRMlFiawRxMm3QLNDMDXWFbLRQYZQcsxBewY/998sC5O2j4y8jezI/Hvkhn0N+M
	m8Ue0L74JTwcNtnhHQXmtQT5AJbIG8Iqx6DaoiLPJihGT10auAkY2Nn3Ifgd9r8uiDJzAUzqx2m2R
	ea9J+uCVqdQhBkGgfKYEJt1mNBB90LTAwWBh4/TuJup62ZhjxSG8G3WZe7O1KdawdgjKDopMbF3xf
	6/1ujY4s6blOUWdb8MTnJayYxh4XwZ/cUuycBQAJ/MuJfCU3dzq6Ebg6IDjNkORWkHVspLC6LMRvR
	auYNobkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turXZ-00000008oMd-1QL2;
	Wed, 19 Mar 2025 11:24:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turVr-00000008o0g-1Qak
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 11:23:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB306113E;
	Wed, 19 Mar 2025 04:23:14 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D1AD3F673;
	Wed, 19 Mar 2025 04:23:05 -0700 (PDT)
Date: Wed, 19 Mar 2025 11:23:02 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: psci: Fix refcount leak in psci_dt_init
Message-ID: <Z9qpFlBJeLrGuEXq@J2N7QTR9R3>
References: <20250318151712.28763-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318151712.28763-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_042307_418930_8C65DE9B 
X-CRM114-Status: GOOD (  16.81  )
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

On Tue, Mar 18, 2025 at 11:17:12PM +0800, Miaoqian Lin wrote:
> Fix a reference counter leak in psci_dt_init() where of_node_put(np) was
> missing after of_find_matching_node_and_match() when np is unavailable.
> 
> Fixes: bff60792f994 ("arm64: psci: factor invocation code to drivers")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

The fixes tag is wrong. As of commit bff60792f994 the code was:

|       np = of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
|
|       if (!np)
|               return -ENODEV;

... which was correct.

The bug was introduced later in commit:

  d09a0011ec0d511b ("drivers: psci: Allow PSCI node to be disabled")

... which added the of_device_is_available() check.

Other than that, this looks fine. With the fixes tag corrected:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  drivers/firmware/psci/psci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index a1ebbe9b73b1..38ca190d4a22 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -804,8 +804,10 @@ int __init psci_dt_init(void)
>  
>  	np = of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
>  
> -	if (!np || !of_device_is_available(np))
> +	if (!np || !of_device_is_available(np)) {
> +		of_node_put(np);
>  		return -ENODEV;
> +	}
>  
>  	init_fn = (psci_initcall_t)matched_np->data;
>  	ret = init_fn(np);
> -- 
> 2.39.5 (Apple Git-154)
> 

