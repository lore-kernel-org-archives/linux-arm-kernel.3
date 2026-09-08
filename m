Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC7FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 02:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CYzChcq0jx4/J4bNcbvKG7nba9LcgoUtWkF6NKKS14=; b=O/qAOm4qJNXwv3JaMvPymD4Id0
	1zs7ZSh516msI0aCoa/43Y8kvYUf+xVSpJeOYTC8Gdx/OY2a9Pmo3X6MaD+DZlIbJoQO/Xy1VRdEC
	Zk8imwMTMiLWiT9Gao5OKfZwMHmcS+BHFfbIw9XPoThRhHHXefZt5zVjZkMLYFWZpnU73mXP2FpVN
	ZJr9kDWfJ7tmge+IIrn0Zk6iKdaOdNUcX3N/JA1f0wbxG+h52kB9G2JsDYLTC19dJXAc5YmXAP1f1
	5GzU3ZdulHe0P12jvWnDRzHKMBP2+Hdrx9LkLogApIVo2flJygu911/3GzyNn8xA/0zTxL1dIWkvP
	iuEqDUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3m0F-00000007wnX-29rt;
	Tue, 08 Sep 2026 02:56:07 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3m0B-00000007wn2-0ekz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 02:56:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3CYzChcq0jx4/J4bNcbvKG7nba9LcgoUtWkF6NKKS14=;
	b=0WN9IDDVMyqZcOIqZk1aolIaLzCS8+U/xkoIGJg92XnTZjh6z/STHy0kmwOcCUspHhtmroeSf
	retW5f8XldEsKF7JHE8oloDvC/SQMEpsamKUzIHA1ERWrbh1JZqA3UoieGXIiK7XWqvsuYGp/z8
	UPXWgOhy5oqTCn1Qk0xE+qw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hf7ZN5L9jz12LHh;
	Tue,  8 Sep 2026 10:44:44 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B6D704056E;
	Tue,  8 Sep 2026 10:55:57 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 10:55:56 +0800
Message-ID: <39838d3c-6fed-47ed-943f-513e54e7d86b@huawei.com>
Date: Tue, 8 Sep 2026 10:55:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] cpu/hotplug: Clean up cmpxchg() logic in
 cpuhp_can_boot_ap()
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-2-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-2-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_195604_055329_414D2544 
X-CRM114-Status: GOOD (  17.63  )
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



在 2026/9/8 0:40, Will Deacon 写道:
> cpuhp_can_boot_ap() uses atomic_try_cmpxchg() to transition the sync
> state of the incoming CPU to SYNC_STATE_KICKED. However, this is
> unnecessary if the state is SYNC_STATE_DEAD, since there will not be any
> concurrent state modifications, and also if the state is already set to
> SYNC_STATE_KICKED.
> 
> Restrict the use of cmpxchg() to the case where the existing state is
> SYNC_STATE_ALIVE.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  kernel/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index b3c8553d7bd6..198c929c452a 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -408,22 +408,22 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
>  	switch (sync) {
>  	case SYNC_STATE_DEAD:
>  		/* CPU is properly dead */
> +		atomic_set(st, SYNC_STATE_KICKED);
>  		break;
>  	case SYNC_STATE_KICKED:
>  		/* CPU did not come up in previous attempt */
>  		break;
>  	case SYNC_STATE_ALIVE:
>  		/* CPU is stuck cpuhp_ap_sync_alive(). */
> +		if (!atomic_try_cmpxchg_relaxed(st, &sync, SYNC_STATE_KICKED))
> +			goto again;
>  		break;
>  	default:
>  		/* CPU failed to report online or dead and is in limbo state. */
>  		return false;
>  	}
>  
> -	/* Prepare for booting */
> -	if (!atomic_try_cmpxchg(st, &sync, SYNC_STATE_KICKED))
> -		goto again;
> -
> +	/* Continue with booting */

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	return true;
>  }
>  


