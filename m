Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E8606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NiCSIv7T;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Iz9X/SW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4OhIx2AoDO+FOC7guiaqcE3vlnq2l6R3lz4OdyJvCPE=; b=NiCSIv7TQgkCZu
	mpQ9i8J1FkWHQU6x+xUl5tJ2LJp6aIvNxmjUARKQl1FAIgPpWwzl18YzkjfjNwuFJJOtfEXVwiuKK
	qVvTwNWJf1g1m5BjiKcD3XG5tgRnfGxuIHLBrSaPjjKBCzpwJ7z7bzq5Z1bgPl+UNr1wQUO4wEU+H
	wnJemoTM9m3HBL+/zR59YY1CjxCAJ3YUr2iZsCdTnvF2iKrgYGJg3oe/Ju8dUTUCdItUkUPS594dd
	0X1r3mvj7PjiRXh8ADksISbXyZqnRAI9lD24SDy8UfacYNpm2NO0FiO760Cs4x2xzGDTWddTA5YFq
	4A9qCiPi6XtWpzEnz/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFQN-0000000BbWI-0zWU;
	Fri, 06 Nov 2026 08:35:51 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFQK-0000000BbUk-00Ik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:35:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4OhIx2AoDO+FOC7guiaqcE3vlnq2l6R3lz4OdyJvCPE=;
	b=Iz9X/SW8wJDPXz0+6M0Uit9z4wuo3nyxbBf/RRww9IaaX9NR/i0+qCYBk9jO2AQFaev46W4D1
	T6Cf7EqZouUeIQRQ5Xltx2H4qoFisvxCSAsB2ugkmA9VQ594TSkgqN/URN9zljCUpwXpl+1lilR
	4eqI/AodKGm9uZNSqubuHDc=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jLXYc5dv7z1T4M5;
	Fri,  6 Nov 2026 16:35:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4ACBD40641;
	Fri,  6 Nov 2026 16:35:39 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 6 Nov
 2026 16:35:38 +0800
Message-ID: <750c9d05-94f8-4936-a824-5ccbed1d13ed@huawei.com>
Date: Fri, 6 Nov 2026 16:35:37 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Leave CDP off when there are too few
 PARTIDs
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261031025257.1540228-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261031025257.1540228-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003548_222395_B3364570 
X-CRM114-Status: GOOD (  18.17  )
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

Hi Ben,

Is this modification okay?

在 2026/10/31 10:52, Jinjie Ruan 写道:
> Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
> resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
> recorded CDP as enabled, halved the monitor count and turned off the
> mbw_max MBA control. resctrl then believes CDP is off, which leaves the
> two sides out of step and the halved monitor count and the missing MBA
> control are not undone.
> 
> Check the PARTID limit before anything is changed so a failed enable has
> no effect.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> RFC v2 -> v1:
> - Check mpam_partid_max ahead and The partid_d/partid_i determination
>   remains in place.
> - Update the commit message as Ben suggested.
> ---
>  drivers/resctrl/mpam_resctrl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..aa3b3a093857 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	if (enable)
>  		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>  
> +	if (enable && mpam_partid_max < 1)
> +		return -EINVAL;
> +
>  	/*
>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>  	 * false on error and unmount.
> @@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>  
>  	if (enable) {
> -		if (mpam_partid_max < 1)
> -			return -EINVAL;
> -
>  		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>  		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
>  	}

-- 
Best regards,
Jinjie


