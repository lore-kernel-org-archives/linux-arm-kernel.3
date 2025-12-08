Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393EED1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InKH1/gynvVQk7glFamhjKgZ5wYewPEcLp8Bz6n3g0E=; b=EUjS+khgnwIia7aFf5gkpotWVj
	NJA9FwNpI1xzdm/zKoThFrB4/zw1096NP5cQyYnETxKSiF1h4Q6QNHH72aqDsGjiMHCQzNhL31IZn
	YoMUeawDSnbVAn9V/J7X6ECbGewAR3Jj/ZkYrPblKoi1fbxp4NirYNha2X60pj/GnyRSTKis7bl/u
	wXv1fQBGaNp2CManD1p9VNfi0DfXEMF8hROYDdPOSf98Wg6hH8xO4CCbmohE3NLhSdAza5Wa6P57X
	BrDJrw8ITiWrS98kMWwX3o7lTCVKdGp7Io/8BGxRCEjzqartQmccaxNVxI0yD2NkBjkiqJeWSZ+s3
	UJrz7KyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR3t-0000000CUIV-3J3p;
	Mon, 08 Dec 2025 02:33:17 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR3q-0000000CUGs-0yyS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 02:33:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=InKH1/gynvVQk7glFamhjKgZ5wYewPEcLp8Bz6n3g0E=;
	b=op1FV9mhWKOiJNfy0ymBe3cwCenJiplbd147oSBh5IvbJX0GynPf0KApsHSnlDjDq8hX/Jco6
	4r+TSLkKlwoZIAPybGNW6uIFwPJ4p07fGbN+wyjzLkBqqn+StRvmZ2zc4cH9EaPNq5XZx0VhhlS
	P3UREAHZNBweKmeyLGGkNFM=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dPmF14b2jz1cyPb;
	Mon,  8 Dec 2025 10:31:01 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 072BD1A0188;
	Mon,  8 Dec 2025 10:32:57 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Dec 2025 10:32:56 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <viro@zeniv.linux.org.uk>, <akpm@linux-foundation.org>,
	<brauner@kernel.org>, <catalin.marinas@arm.com>, <hch@lst.de>,
	<jack@suse.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <pangliyuan1@huawei.com>,
	<torvalds@linux-foundation.org>, <wangkefeng.wang@huawei.com>,
	<will@kernel.org>, <wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>,
	<yangerkun@huawei.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger sleep in RCU context
Date: Mon, 8 Dec 2025 10:32:06 +0800
Message-ID: <20251208023206.44238-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTLLLuup7TeAqFVL@shell.armlinux.org.uk>
References: <aTLLLuup7TeAqFVL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_183314_648916_C8CFA5FD 
X-CRM114-Status: GOOD (  18.92  )
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

On Fri, 5 Dec 2025 12:08:14 +0000, Russell King wrote:
> On Wed, Dec 03, 2025 at 09:48:00AM +0800, Xie Yuanbin wrote:
>> On Tue, 2 Dec 2025 14:07:25 -0800, Linus Torvalds wrote:
>> > On Tue, 2 Dec 2025 at 04:43, Russell King (Oracle)
>> > <linux@armlinux.org.uk> wrote:
>> >>
>> >> What I'm thinking is to address both of these by handling kernel space
>> >> page faults (which will be permission or PTE-not-present) separately
>> >> (not even build tested):
>> >
>> > That patch looks sane to me.
>> >
>> > But I also didn't build test it, just scanned it visually ;)
>>
>> That patch removes harden_branch_predictor() from __do_user_fault(), and
>> moves it to do_page_fault()->do_kernel_address_page_fault().
>> This resolves previously mentioned kernel warning issue. However,
>> __do_user_fault() is not only called by do_page_fault(), it is
>> alse called by do_bad_area(), do_sect_fault() and do_translation_fault().
>>
>> So I think that some harden_branch_predictor() is missing on other paths.
>> According to my tests, when CONFIG_ARM_LPAE=n, harden_branch_predictor()
>> will never be called anymore, even if a user program trys to access the
>> kernel address.
>>
>> Or perhaps I've misunderstood something, could you please point it out?
>> Thank you very much.
>
> Right, let's split these issues into separate patches. Please test this
> patch, which should address only the hash_name() fault issue, and
> provides the basis for fixing the branch predictor issue.

I conducted a simple test, and it seems that both the hash_name()
might sleep issue and the branch predictor issue have been fixed.

BTW, even with this patch, test cases may still fail. There is another
bug in hash_name() will also be triggered by the testcase, which will be
fixed in this patch:
Link: https://lore.kernel.org/20251127025848.363992-1-pangliyuan1@huawei.com

Test case is from:
Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com

Test in commit 6987d58a9cbc5bd57c98 ("Add linux-next specific files for
20251205") from linux-next branch.

I still have a question about this patch: Is 
```patch
+		if (interrupts_enabled(regs))
+			local_irq_enable();
```
necessary? Although this implementation is closer to the original code,
which can reduce side effects, do_bad_area(), do_sect_fault(),
and do_translation_fault() all call __do_kernel_fault() with interrupts
disabled.

Thanks very much!

