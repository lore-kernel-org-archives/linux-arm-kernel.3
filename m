Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8F5CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Jla5beV2t2z5D0nAWo+a0ebiE0Ok8ugNH6Zp9HBN34=; b=jsOBpLgDrrR/sWIqqx8+PQXM5K
	oqC3jkxqdQqOuLzRUf0w8kKofBg/fq78+fSpCaiFl7Uob57CZ0T07c/ledfgaUHq005aZf9oU7the
	NOKo8slg7wTKzdaOqh7R8ZhdG1b4pLir0w2r+lKwS6m8Fz/tZy7yhMNoiQ7JM67Li9KSrHBPTnbOC
	TK93ek+MwIdBI96GCzvAzJJPg1E//Zvkj/NEYywYND6fDPr2t5MNKY2ZSc9C66OmJV2UaU0jv28UU
	0PBKE/trx8TbfU3zarF/4joYYzwA5fvJwgBHUnZqiG/8RRYjzGhk5E2m9siZgRGOJHMkMR4cdwbtL
	u5/07o5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOMn-00000006r5h-2nAX;
	Mon, 25 Aug 2025 03:59:33 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOI0-00000006qdw-3bDp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 03:54:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c9GzY0NZ2z13NG3;
	Mon, 25 Aug 2025 11:50:49 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 6DD6C180B58;
	Mon, 25 Aug 2025 11:54:28 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 25 Aug 2025 11:54:27 +0800
Subject: Re: [PATCH v2 2/3] irqchip/gic-v5: Fix forever loop in
 gicv5_its_create_itt_two_level() error handling
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <cover.1752777667.git.dan.carpenter@linaro.org>
 <a6dd885a-5a1b-41b5-9673-0d42f7fa929d@sabinyo.mountain>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <e360d42c-bd83-0cb9-7298-86e197668508@huawei.com>
Date: Mon, 25 Aug 2025 11:54:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <a6dd885a-5a1b-41b5-9673-0d42f7fa929d@sabinyo.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_205437_060144_7FA9895F 
X-CRM114-Status: GOOD (  11.68  )
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

On 2025/7/18 2:45, Dan Carpenter wrote:
> The "i" variable needs to be signed otherwise there is a forever loop
> in the cleanup code.
> 
> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: no change
> 
>  drivers/irqchip/irq-gic-v5-its.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

