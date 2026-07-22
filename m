Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CCBC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Apht5fIcqQqKv5iQhxTxg3p1bBz/bZIJ7LKF41+U9UE=; b=0aSFahuzOryYn9
	I5hOUx8l1mTQWjckaIRLXndXyv0xzVXyMcmr478zdIQwu8ShByUg76mOm+yO1BTnsCqaHm2a4I/ZF
	mmsHtBRNBZy28wt6AyL0MOezDLMLaQeD6XxCeiwkbJ+zHIfj4Ipwx1O2b0wmfCjoFd4Il9fWnrMTS
	Ix551Zhf3fS45d7Zl/ZD9+0swwIPlL3pld3O0S9BmNYZYJWPH4Xqkpt5cU0YGkFfm1GfEuMwBBsTx
	x5tNAGRkPhXftPzAXwCTTCOV1OZGKGD/t+iCI9DUgZFFELqrLNss6Xx/NZbBSAbsrhYVK17HehA9i
	iIk+EFJ6lFriJr6M4foQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTQ6-0000000BROl-2qGP;
	Wed, 22 Jul 2026 09:39:18 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTQ2-0000000BRMb-2VHK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:39:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Apht5fIcqQqKv5iQhxTxg3p1bBz/bZIJ7LKF41+U9UE=;
	b=hSzo0urpFD59cCqvkBILw9kDlwTwP1mS0kyRrB6UjzvqLPw5vkhdXt/UxkQuTdo4fORpCN5Sz
	MCDpzDQNELKVFdTUFvg1uLFeLF4bkci/fwOueSB6tE2KFE6d1H9nyvoGxKtcRDZbS63KQR1yyrO
	GZAEYabSr29raOoYs8J2yTM=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4h4pqX0s8Hz12LHf;
	Wed, 22 Jul 2026 17:29:28 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id ECA264057D;
	Wed, 22 Jul 2026 17:39:01 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 17:39:01 +0800
Message-ID: <7e4b07d1-36c7-4397-b7aa-8c1090c6f898@huawei.com>
Date: Wed, 22 Jul 2026 17:39:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/36] arm64: entry: replace DAIF helpers with entry
 helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-13-vladimir.murzin@arm.com>
 <5129a523-142f-4834-ba4d-6ff15278d12a@huawei.com>
 <33c1b5c2-3e64-46a4-88d5-2f589625e777@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <33c1b5c2-3e64-46a4-88d5-2f589625e777@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_023914_795038_588EB216 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/15/2026 8:31 PM, Vladimir Murzin wrote:
> On 7/10/26 10:36, Jinjie Ruan wrote:
>>>  static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
>>>  {
>>> +	arm64_exc_hwstate_t hwstate;
>>>  	irqentry_state_t state;
>>>  
>>>  	state = arm64_enter_from_kernel_mode(regs);
>>> -	local_daif_inherit(regs);
>>> +	hwstate = arm64_inherit_exc_context(regs);
>> local_daif_inherit do not trace_hardirqs_off() but only
>> trace_hardirqs_off()，but now arm64_inherit_exc_context() do it, is this
>> a functional change?
> 
> When CONFIG_TRACE_IRQFLAGS is not set, there is no change in
> behaviour. Otherwise, IIUC, we may continue to tell the kernel that

I was just curious whether trace_hardirqs_on() or trace_hardirqs_off()
is idempotent.

> hard IRQs are disabled, but that should be harmless.
> 
> Could you please expand on your concern?

The following code seems to avoid repeated calls to trace_hardirqs_off().

So, I understand there should be no problem here.


22 >-------if (prev.flags == next.flags)
 23 >------->-------return next;


> 
> Thanks
> Vladimir
> 


