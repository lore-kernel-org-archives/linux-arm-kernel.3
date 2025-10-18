Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC2CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 03:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrL7s/yHucvSFN5OrFoyTGqXmwSYjGi9IJVI2DWq6E8=; b=p3o1YxrFZ8wiwh7ElyBsVVGhsF
	Uf0tyLiQE8VLhw6sPNa6KD71cGJ9oTK+7s7j6w3IcMVqI1NSeBKW/y8AwtUhMeQNPJI47pkv2iwvf
	4Gi7pJOe5MHQPvKWC2FoF2oxmmmueJK2QYOoKHsA2+ZmvQg9hiAMUboGUgHDzGbepsuoZKhLg/DUI
	DlZTEcre5a2eTWZ1chcZYEZhmnFQsbItvAslvHAJDWwCUlepSh9ADMLu2ZFr17pX5Nkk694VIpUDz
	JJB4zDMY6X+yILBm+FN97mZir/yajq0zidrugReUiy9G4X3L6wD5Ltln9WTgaL5utg6GDvZqZ+RSK
	rfTcYtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9xRq-00000009RVj-0LCs;
	Sat, 18 Oct 2025 03:17:38 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9xRn-00000009RUr-1URn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 03:17:37 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4cpRgg4m53z1prPw;
	Sat, 18 Oct 2025 11:17:03 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0825918048E;
	Sat, 18 Oct 2025 11:17:26 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 18 Oct 2025 11:17:25 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 18 Oct 2025 11:17:25 +0800
Message-ID: <c349eb9f-9f8a-f268-c765-a59c94bf6613@hisilicon.com>
Date: Sat, 18 Oct 2025 11:17:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Question about heterogeneous VM live migration
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
References: <866aca63-1f6b-2109-fa76-6d68cb7c547a@hisilicon.com>
 <86wm4twu3c.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <86wm4twu3c.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_201735_573977_A4CE9B4C 
X-CRM114-Status: GOOD (  16.43  )
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

On 2025/10/17 21:12, Marc Zyngier wrote:
> On Thu, 16 Oct 2025 03:00:07 +0100,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> Hi,
>>
>> We are now trying to do heterogeneous VM live migration among HiSilicon ARM
>> servers, seems there are problems about disabling a feature in guest.
>>
>> For a feature, if we disable it in VM by configure related ID register field,
>> we should make it actually been disabled, e.g. configure related control
>> register in EL2 or trap EL0/EL1 access to EL2.
> 
> This is in general not possible.
> 
>> Possible problems:
>>
>> 1. Some features can not be disabled actually in EL0/EL1, e.g. FEAT_AFP,
>>    FEAT_RPRES, FEAT_CSSC, FEAT_LRCPC3...
>>
>>    Disabling it by ID can not avoid a stupid user to directly use it without ID
>>    checking, which may bring subtle problem in heterogeneous VM live migration.
> 
> Yes. There is no solution to that.
> 
>> 2. For some features, it can be trapped, but KVM does not support yet. Not sure
>>    if we should support them in future.
>>
>>    E.g. If we disable ID of FEAT_HAFT for guest, we need configure
>>         HCRX_EL2.TCR2En to 0, so access to TCR2_EL1.HAFT will be trapped.
> 
> That's wrong. If you force TCR2EN to 0, none of the TCR2_EL1 controls
> will work. For example, you'd lose the POE/PIE controls.

Yes, it will impact other control bits, same as SCTLR_EL1 trapping mentioned below.

> 
>>         For FEAT_PAN3, it instroduces EPAN to SCTLR_EL1，if we disable ID of
>> 	FEAT_PAN3, we need make SCTLR_EL1 to trap by setting HFGRTR_EL2.SCTLR_EL1.
>>
>>    Seems there are no trap setting in above cases. Just a quick look, maybe I
>>    miss something.
>>
>> I am not sure if we already consider above problems, any help will be appreciated.
> 
> we know about most of these things already. In general, you cannot
> hide features that the host has, other than indicating to the guest
> that they may not exist. The underlying HW is still there and will act
> as expected.
> 
> I think you're simply expecting too much from the architecture.

Many thanks about above explanation, I get the situation now.

Best,
Zhou

> 
> 	M.
> 

