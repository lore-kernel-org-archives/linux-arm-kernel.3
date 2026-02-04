Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65390E9536E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iwwxy3noKPthWts2g0NLeHIWJ+yBKjzgf4fExmNwWaY=; b=Hqkruvym3MJq4WSUMVHP/Sm7o3
	q1vUmgYz0A49n7SpaYv2DNaK5Am5DRQd1xTtxzgnzXjjECNkcQbVnYjPRqU6+f3RSYbJCBO/cSzbg
	8gf9J4Ev/XUsydkUB7t3tsBY+aDlVvGBRn7gdccSQubdjZMU7q9BzjJetMkqkB6v9FvHgtgtg5n34
	2yuSgLRnipb4EUYvAUkRkgRBtSG4ndlmPPJjd6k6M7kjjNTbpczXjFymrC33T1g90T28ei3WSBleP
	L0Epu8N10ONtFGW+mwPeOH/Kzkkhqm9o8axzF8vPyW/zuu8CwRAHNTDGCG4kA2FcneW8BsnLHiXmJ
	9CJs+SMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZbp-00000008FtX-0V53;
	Wed, 04 Feb 2026 09:55:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZbn-00000008FtP-09YN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 09:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Iwwxy3noKPthWts2g0NLeHIWJ+yBKjzgf4fExmNwWaY=; b=U5LWLlrScnl1VcYNVBMIlK0/Wa
	1peT6FjERuGHcgtbflib9KnMkTixTBHeWCeVvHrTgNaW690joaUNu1HebtPwp7ianVB53JukD8ool
	lOcqVoedy6BOVqaEutkl2ZCx+d/yiUDQlajZYgU7nLKOqttHVM7zOxVuWqLqaPxpY+Y1fYjhgh4b8
	uTZtlHpTM0FZPblLx4m4DrCXcb5VQOdZfnIawuJ/slL0LwgaDbS+wMLDjGGc/nRCeAMZ0w73AkVsJ
	yxkob5gkCP6oSCqK4scoPOS4a98YkIrKiz3+2Wzlpv6++3bwOlZ8+qcBB1ZiSltWCRWoJqTjbCk5U
	9GDOdaaA==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZbg-00000000G5j-3uyd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:55:35 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f5bHk6JbkzJ46l1;
	Wed,  4 Feb 2026 17:52:34 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 766D640572;
	Wed,  4 Feb 2026 17:53:23 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 09:53:22 +0000
Date: Wed, 4 Feb 2026 09:53:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Colin Ian King <colin.i.king@gmail.com>
CC: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix spelling mistake "ouside" ->
 "outside"
Message-ID: <20260204095321.00006324@huawei.com>
In-Reply-To: <20260203210735.5036-1-colin.i.king@gmail.com>
References: <20260203210735.5036-1-colin.i.king@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_095533_925074_BED8154A 
X-CRM114-Status: GOOD (  12.79  )
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

On Tue,  3 Feb 2026 21:07:35 +0000
Colin Ian King <colin.i.king@gmail.com> wrote:

> There is a spelling mistake in a pr_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
FWIW - obviously correct.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index e24ce3d9fb62..8c4cf8430871 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -902,7 +902,7 @@ static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev, msi_alloc_info
>  		event_id_base = info->hwirq;
>  
>  		if (event_id_base >= its_dev->num_events) {
> -			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
> +			pr_err("EventID outside of ITT range; cannot allocate an ITT entry!\n");
>  
>  			return -EINVAL;
>  		}


