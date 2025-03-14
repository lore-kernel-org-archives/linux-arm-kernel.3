Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE41C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUvS/1fG0ZegCESXVAqpgei736jkRfT0/CW7MJiM2hc=; b=X06IdY4pm8ELCV3EbUgAc1zDl3
	C04e99xN6J+3fx40MR4ZLjGwOnfI5U2r88/l0tAXcPmat3CJsoyVZxPail4y5/5DuOd3+yd4V/8j3
	BBXWvP4kyQ6LFWJSwCwWNm3sGdn6rQGQmXYbWpigRUGYeBKSrsrjcm74SEckne7w2I5MeflLNYwpw
	Y7828BpUaRpOJo4eBm5a84Y6ehG8wYfvN9WwN7MIdtNVxaXa//ZMm73RrMTB+tnGsrJ5zgbQ7jKSK
	EIjdj3CSJrP1kHTvOPbqGXJ7a/8I0EQgVBz4bXczaGOgKxpCDJmcwO6cHzDFqm4YbVnkars8BIn6r
	wy13gtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt23J-0000000Do9u-1iNr;
	Fri, 14 Mar 2025 10:14:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1rP-0000000Dl7x-2dkt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:01:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZDfvR03nTz6J7r8;
	Fri, 14 Mar 2025 17:58:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C306140B39;
	Fri, 14 Mar 2025 18:01:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 14 Mar
 2025 11:01:37 +0100
Date: Fri, 14 Mar 2025 10:01:36 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Huisong Li <lihuisong@huawei.com>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <liuyonglong@huawei.com>
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Fix incorrect string
 assembly
Message-ID: <20250314100136.0000416f@huawei.com>
In-Reply-To: <20250314082856.3257783-1-lihuisong@huawei.com>
References: <20250314082856.3257783-1-lihuisong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030147_810528_A1DF46F4 
X-CRM114-Status: GOOD (  11.94  )
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

On Fri, 14 Mar 2025 16:28:56 +0800
Huisong Li <lihuisong@huawei.com> wrote:

> String assembly should use sysfs_emit_at() instead of sysfs_emit().
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
Fixes tag?

Otherwise looks good to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
> index 8aa8dec14911..444a8f59b7da 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> @@ -1539,8 +1539,8 @@ static ssize_t used_types_show(struct kobject *kobj,
>  	u16 i;
>  
>  	for (i = 0; i < hdev->used_type_num - 1; i++)
> -		len += sysfs_emit(&buf[len], "%s ", hdev->type_name_maps[i].name);
> -	len += sysfs_emit(&buf[len], "%s\n", hdev->type_name_maps[i].name);
> +		len += sysfs_emit_at(buf, len, "%s ", hdev->type_name_maps[i].name);
> +	len += sysfs_emit_at(buf, len, "%s\n", hdev->type_name_maps[i].name);
>  
>  	return len;
>  }


