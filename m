Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48797D68BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 02:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsOFc6XM0L9uhjU6B+P/mFrxYDnmPbomxjPnr3e+ghw=; b=pwkzwzA39SQU4WKCpBjAS8sIjn
	n2TtTmS68FrRJacU6eaXTKRUXPOwB1wHA2nLDExqXiu3mE4DgMHoalN//+JsYzbiYWLMeS0/sMd1z
	R0TbKOteC4pqOL9vG09LcQyDeG9jnKAJNiN/v+VhvFqISLHNJ3gkSx7/23qSv9k25L02NkU1sJ5w9
	8uwGkKZqIcO3orzxeE/Sb4TEWXAw2qW4z5GQ3+fiKxv7GIMAWaliGotkhhN2xjeGdVVH5Dv3zqFdK
	N9vCQgcUvq2ct33DCwHPORTsSKlhVhPizMLbRyFuS38uoiiFZfIxMvY/OaCwOwMpMbzx/amw1PHaz
	5uZAa3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC8xD-00000004pOu-0Fyw;
	Sat, 16 Nov 2024 02:54:31 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC8wH-00000004pKB-0jsG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 02:53:34 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xqz1t4yNzz21kVN;
	Sat, 16 Nov 2024 10:52:02 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 23645140109;
	Sat, 16 Nov 2024 10:53:20 +0800 (CST)
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemd200012.china.huawei.com (7.221.188.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 16 Nov 2024 10:53:19 +0800
Message-ID: <ae8ff0db-480b-0d7d-e2b9-ec81130e789d@hisilicon.com>
Date: Sat, 16 Nov 2024 10:53:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] irqchip/gicv3-its: Add workaround for hip09 ITS
 erratum 162100801
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<wangwudi@hisilicon.com>, <prime.zeng@hisilicon.com>, Nianyao Tang
	<tangnianyao@huawei.com>
References: <20241114082813.3865466-1-wangzhou1@hisilicon.com>
 <87msi0yscp.ffs@tglx>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <87msi0yscp.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_185333_376897_A321F9D1 
X-CRM114-Status: UNSURE (   8.94  )
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

On 2024/11/16 7:44, Thomas Gleixner wrote:
> On Thu, Nov 14 2024 at 16:28, Zhou Wang wrote:
> 
>> When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
>> during unmapping operation, which will cause some vSGIs lost.
>>
>> To fix the issue, invalidate related vPE cache through GICR_INVALLR
>> after VMOVP.
>>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> 
> This Signed-off-by chain is incorrect. Who authored the patch?
> 
> If Nianyao is the author then the changelog lacks a
> 
>    From: Nianyao ....
> 
> line right at the top.
> 
> If you both authored it, then this lacks a Co-developed-by tag.
> 
> See Documentation/process/... for further explanation.

Hi Thomas，

Thanks for pointing this.

We both author it, I will add a Co-developed-by tag like below and resend it:

Suggested-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>

Best,
Zhou

> 
> Thanks,
> 
>         tglx
> .

