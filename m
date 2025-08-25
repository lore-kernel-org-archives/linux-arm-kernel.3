Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9935FCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 04:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijAEsul+Wh0/2NZ5XmmNiW4iAtYhHXqOAp24GjJzTNk=; b=kPhPBvN0e1KpyMd4zD+2sAR5OB
	iO88mOtas5/K7J0EkyL41Hpn8izwST0GQ4f2yF3eXnmVfDg3NPEmC1ZJkKuIwLxUSlbmA/BsiOcay
	nFwX1Z4ch78Eh3jwICoQfYmvpu0YuRUVvSgjAD7ToXV9/DjBUvL3IKDsqVrI3cUYmpjYU7mDpMOED
	cKOT/rI9DW/+rMeUTVMq+XbFaX+EiQT5WVuaJDEVp42R6vpyNVpy83VoFDWqSHeT5DmMo/VCXcGCI
	odVtSmcudBauadRLrerTBc6ewSlnbQeg86xq8pdIPaQ57T2rA3bE1S9FBi9TJfYfkeeyuckYIeblk
	eNPmDYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOPP-00000006rFA-1peR;
	Mon, 25 Aug 2025 04:02:15 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOIO-00000006qhZ-1xZB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 03:55:01 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c9H0y53Pnz2VRQl;
	Mon, 25 Aug 2025 11:52:02 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id D8980140276;
	Mon, 25 Aug 2025 11:54:57 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 25 Aug 2025 11:54:57 +0800
Subject: Re: [PATCH v2 3/3] irqchip/gic-v5: Fix error handling in
 gicv5_its_irq_domain_alloc()
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Sascha Bischoff
	<sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <cover.1752777667.git.dan.carpenter@linaro.org>
 <c9ee3799-8b70-4109-aa13-2febaff9973c@sabinyo.mountain>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <d04c798e-cce4-6e08-2632-0255d48b0564@huawei.com>
Date: Mon, 25 Aug 2025 11:54:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <c9ee3799-8b70-4109-aa13-2febaff9973c@sabinyo.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_205500_679266_5941FF1B 
X-CRM114-Status: GOOD (  13.20  )
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
> There are two issues to fix in this code:
> 1) If gicv5_alloc_lpi() fails the original code was checking the wrong
> variable.  Fix the mixup between "ret" and "lpi".
> 2) Clean up from all the previous iterations and not just the current
> iteration.
> 
> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: In v1 I had the wrong goto if gicv5_alloc_lpi() failed.  Also change
> the label name from out_free_lpi to out_free_irqs.
> 
>  drivers/irqchip/irq-gic-v5-its.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

