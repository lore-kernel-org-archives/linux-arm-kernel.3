Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ECD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 02:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zDcKiF+o;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bNhVfT4y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3JxJ1mJkAP6YmKqJllwbCK5BL3rqP3akD5+1IOa+bFQ=; b=zDcKiF+ojS+oxT
	zJN2xD31S5HfhI+gWLNQkEyVI+G+c2iUhOci7hm2HoafPWMp9Q+lSKHXPmv7JIav636fV7IgYHjUH
	YsWSoDalEZYTxn4UNlbT1NY/TJCY5WOY/OuGzKy+vH9ewDZoEYwuibs4ndNOxgF/2qGRDkzddrKRY
	tTOcsZ2bSiGiyNW+zZ210yDBsL7kLpfcuS6buWh45/s86EwMif1/FN3EZ8ihapfphYKk2LH0mz1cM
	k3T+1KBVJ6A4wqMoZoQr5gzDR1wDk1aP6Qd4vmr4cgq26bNoNbEWbP5yVmbPeC43366uvCe1TMpvh
	LkNZYxL1/Z21dENDG6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtoX-000000067Y5-0fq7;
	Wed, 28 Oct 2026 02:54:57 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtoT-000000067WG-0dF4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 02:54:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3JxJ1mJkAP6YmKqJllwbCK5BL3rqP3akD5+1IOa+bFQ=;
	b=bNhVfT4y44F46JNCoeHa7HQ9DTkar8M1LnxbRMIh7jithuf9TOZMLVbLUTl/wksEzUTuui4VE
	R8NIFIFQvN63nBQHDaD8dW9ewkumziT3EJ9WlALYFyb0pz8un/QzdgDOh8ldQ8ipUCNTfP3x0r0
	np6BKxqbTzQidblJke+l2Ws=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jDsQw429Tz12LJd;
	Wed, 28 Oct 2026 10:54:48 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 81296202E6;
	Wed, 28 Oct 2026 10:54:43 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 10:54:42 +0800
Message-ID: <6a13d463-b37e-45a6-b4f8-b7a28df24df8@huawei.com>
Date: Wed, 28 Oct 2026 10:54:42 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] arm_mpam: resctrl: Don't stop early when tearing
 down a class
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<dave.martin@arm.com>, <andre.przywara@arm.com>, Sashiko
	<sashiko-bot@kernel.org>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-13-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260917145617.2202986-13-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_195453_664083_B6AC8493 
X-CRM114-Status: GOOD (  19.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/9/17 22:56, Ben Horgan 写道:
> An MPAM class can back more than one control and more than one
> monitor. mpam_resctrl_teardown_class() iterates through all the controls
> but stops if it finds a match which means classes backing more than one
> class aren't torn down. The same for monitors, in which case the mbwu
> counters will be leaked.
> 
> Stop terminating the loops early.
> 
> As we are already changing mpam_resctrl_teardown_class() remove the
> misleading comment. It doesn't call resctrl_exit() and isn't required to do
> so as the only caller does it first.
> 
> Fixes: fb481ec08699 ("arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v1:
> 
> New patch
> ---
>  drivers/resctrl/mpam_resctrl.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 321741a702fe..9cec5843e8fa 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1943,10 +1943,6 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
>  	mon->mbwu_idx_to_mon = NULL;
>  }
>  
> -/*
> - * The driver is detaching an MSC from this class, if resctrl was using it,
> - * pull on resctrl_exit().
> - */
>  void mpam_resctrl_teardown_class(struct mpam_class *class)
>  {
>  	struct mpam_resctrl_res *res;
> @@ -1957,17 +1953,14 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
>  	might_sleep();
>  
>  	for_each_mpam_resctrl_control(res, rid) {
> -		if (res->class == class) {
> +		if (res->class == class)
>  			res->class = NULL;
> -			break;
> -		}
>  	}
>  	for_each_mpam_resctrl_mon(mon, eventid) {
>  		if (mon->class == class) {
>  			mon->class = NULL;
>  
>  			mpam_resctrl_teardown_mon(mon, class);

My LLM also found this problem.

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> -			break;
>  		}
>  	}
>  }

-- 
Best regards,
Jinjie


