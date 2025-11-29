Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D63CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9dVSOpcR3NajjbHJM0v+Jek+ZgTYIb8ZcFiF66ekIA=; b=FGKVVNGKA1dH1BbZVpPOjM4qxt
	LV8fop1fwPRsOopukMDBL4F2OL4tYV5RshpcuSoBGsOG1TcXSrXQHvzvi63flAvfcY9CvEhqrawJC
	eSDngaajaGCE2+RNqmxInQqJq6hWhMMf/uL8iq6c/9enzQg965z6LnFAv+fLBoaVzJB/t7ULsIhuU
	L6QIrlF4WUNsnq3YJJBGnWvXLPOcYZCw14+1N9h48mPalz2t7rJays11YkdsNFpEI+y0SKj9EbW0v
	AVZ4ndpbI2KPVi34+hAxjI+cl9Z/psNS8BPmQiKQTu1qfs1h4wtf+HjTuSJo7GMRMwdnJbs9E0S4Y
	b73gRvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHDr-00000001Qas-0eU8;
	Sat, 29 Nov 2025 09:26:31 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHDn-00000001QaF-3LO6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 09:26:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=e9dVSOpcR3NajjbHJM0v+Jek+ZgTYIb8ZcFiF66ekIA=;
	b=iAWqeivURbpGsCaVtOtNoNhK+3A3QPdc5EYzynM0vqm5qsEhctuFpESwUvj0IsTqCEVGPJrqD
	TjamLg1p5w2bEtnjHO2Dy2fRNExVPHlsJe+yDf8oL/w2evWSdtRf4WV+Xk4uI3cEXGJmnixpM21
	mBUfN7UzPFTCweFA0c+Ysak=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dJPrD1WKQz1prLT;
	Sat, 29 Nov 2025 17:24:28 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 22071180B3F;
	Sat, 29 Nov 2025 17:26:19 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Nov 2025 17:26:18 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <viro@zeniv.linux.org.uk>, <will@kernel.org>, <linux@armlinux.org.uk>,
	<bigeasy@linutronix.de>, <rmk+kernel@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <brauner@kernel.org>,
	<catalin.marinas@arm.com>, <hch@lst.de>, <jack@suse.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<pangliyuan1@huawei.com>, <wangkefeng.wang@huawei.com>,
	<wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>, <yangerkun@huawei.com>,
	<lilinjie8@huawei.com>, <liaohua4@huawei.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
Date: Sat, 29 Nov 2025 17:25:45 +0800
Message-ID: <20251129092545.5181-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129090813.GK3538@ZenIV>
References: <20251129090813.GK3538@ZenIV>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_012628_315733_1ECFE976 
X-CRM114-Status: GOOD (  13.94  )
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

On Sat, 29 Nov 2025 09:08:13 +0000, Al Viro wrote:
> On Sat, Nov 29, 2025 at 12:08:17PM +0800, Xie Yuanbin wrote:
>
>> I think the `user_mode(regs)` check is necessary because the label
>> no_context actually jumps to __do_kernel_fault(), whereas page fault
>> from user mode should jump to `__do_user_fault()`.
>>
>> Alternatively, we would need to change `goto no_context` to
>> `goto bad_area`. Or perhaps I misunderstood something, please point it out.
>
> FWIW, goto bad_area has an obvious problem: uses of 'fault' value, which
> contains garbage.

Yes, I know it, I just omitted it. Thank you for pointing that out.

> or
> 	if (unlikely(addr >= TASK_SIZE)) {
> 		fault = 0;
> 		code = SEGV_MAPERR;
> 		goto bad_area;
> 	}

In fact, I have already submitted another patch, which is exactly the way
as you described:
Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com

The only difference is that I will move the judgment to before
local_irq_enable(). The reason for doing this is to fix another bug,
you can find more details about it here:
Link: https://lore.kernel.org/20250925025744.6807-1-xieyuanbin1@huawei.com
Link: https://lore.kernel.org/20251129021815.9679-1-xieyuanbin1@huawei.com

To keep the email concise, I will not repeat the description here.

Xie Yuanbin

