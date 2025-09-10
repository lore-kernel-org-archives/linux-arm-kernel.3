Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 01:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk548fHm1iFqRJudKg4BprtzWs1PtJr45Oi1ZXTax0k=; b=d5jwzwUKou0iyqONXbXZ0M8yFr
	OM9VjekSSMpsnjw/KNv02womUTPGBy8FyGSp2UdxWePTpZ1I7WGw0iVpNF0u9CwZBE/YJqG4hSiMg
	QXQj+DKaXZ4uCoEU77e3nqvPSPysw5H51A077xhYBt//IkksvIRe9F8EHOP63GCYGKNTCbZQEVnL1
	yog8V+sZRXnxzuyTiQs3yoBHcpyocAEbp7j/KqEvM2/PUyVG5SJhhtyI7f8HyPlhRzLkF1SLsIWGP
	zONSr9ApsSTSpNyTdItV+e8DIn+RVe4ozJ6b8MtvxhnuTvzW9JGkwz7+nUrAyJrgaiO6Jf8rK4908
	qpLWteiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9qz-0000000BT9q-2w9f;
	Wed, 10 Sep 2025 01:42:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9qw-0000000BT5y-3ZE5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 01:42:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cM3Lt6lpvztTX2;
	Wed, 10 Sep 2025 09:41:26 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 27FB9180B68;
	Wed, 10 Sep 2025 09:42:22 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 dggpemf500013.china.huawei.com (7.185.36.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Sep 2025 09:42:21 +0800
Message-ID: <3d57bacf-6ea7-4d95-b411-bde376006b9f@huawei.com>
Date: Wed, 10 Sep 2025 09:42:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] KVM: arm64: Make ID_AA64MMFR1_EL1.VH writable from
 userspace
To: Oliver Upton <oliver.upton@linux.dev>
CC: <yuzenghui@huawei.com>, <maz@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <liuyonglong@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20250909034415.3822478-1-yangjinqian1@huawei.com>
 <20250909034415.3822478-4-yangjinqian1@huawei.com>
 <aL-788d0xWThAVSl@linux.dev>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <aL-788d0xWThAVSl@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_184231_050755_F8FD0C3A 
X-CRM114-Status: UNSURE (   8.62  )
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



On 2025/9/9 13:32, Oliver Upton wrote:
> Hi Jinqian,
> 
> On Tue, Sep 09, 2025 at 11:44:15AM +0800, Jinqian Yang wrote:
>> Allow userspace to downgrade VH in ID_AA64MMFR1_EL1. Userspace can
>> only change this value from high to low.
> 
> I'm afraid we can't allow this. When we expose FEAT_VHE to the VM,
> HCR_EL2.E2H is RES1. Meaning, vEL2 is unconditionally in a VHE
> context.
> 
> I would be OK with a clarifying comment documenting why the field is
> non-writable.
> 

Okay, v3 will keep ID_AA64MMFR1_EL1.VH non-writable.

Thanks,
Jinqian

