Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1197D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 01:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaN56bNHDdaDU4xaAsWBhkgyh1tI7ov9fWzaVcBUtA8=; b=TB6ZHbp4wZ8PYqAQuIowDMuAsK
	ylBt+s9SBkNypfhyUKzVw01EZ31+34pMh8Pi+ZsxjBUYKDjf5zeL1pYleTLZeYGkvqiGbI5/a/oQx
	9xUL+wjep7MHDrQ05qGxkJ6a4yVmdV7tP39tUZckPu/IFQnHSsEk3gmUPU96BXX5hTZbnYqj0VJos
	MgapgO0tSPg9v1bZu70oqEpqdDgZjuFC+gWGMVSaHwR+1fIN5e1Qm1bH3No40eMXMABYHGKvSjnr4
	pQ01s6pVj41Y4Jr5bjw6rAcYhD5z0XS3ozgQyR9fBbg8HX+gTlw5siuHzr+HteA5RKHgoIeskNliR
	i29/JwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSmYp-0000000DhlM-2c2R;
	Tue, 09 Dec 2025 01:30:39 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSmYn-0000000Dhkt-0PNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 01:30:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EaN56bNHDdaDU4xaAsWBhkgyh1tI7ov9fWzaVcBUtA8=;
	b=S0Onu6kYl9D8cUbpZTYsCtWPafYB7opD91x91GJEgAsQozI1jQu1RjI3r+YUxODEgOrBO16G4
	4rudE/tl/ISBlGPl73FxPE7obeVr4McmRTQApR9kNXgBFAfoNDCG51gTbJjvPO6iIYhfcJjKNJ/
	i74oJ0pNGViS2Nr3mDxm6bI=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dQLpK2wChz1T4GD;
	Tue,  9 Dec 2025 09:28:25 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id D0A49180BD8;
	Tue,  9 Dec 2025 09:30:25 +0800 (CST)
Received: from DESKTOP-A37P9LK.china.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Dec 2025 09:30:24 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <brauner@kernel.org>,
	<catalin.marinas@arm.com>, <hch@lst.de>, <jack@suse.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<pangliyuan1@huawei.com>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <wangkefeng.wang@huawei.com>, <will@kernel.org>,
	<wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>, <yangerkun@huawei.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger sleep in RCU context
Date: Tue, 9 Dec 2025 09:30:21 +0800
Message-ID: <20251209013021.2537-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTbyPNINxjzU3Lua@shell.armlinux.org.uk>
References: <aTbyPNINxjzU3Lua@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_173037_643347_A6F6A800 
X-CRM114-Status: GOOD (  14.53  )
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

On Mon, 8 Dec 2025 15:43:56 +0000, Russell King wrote:
> On Mon, Dec 08, 2025 at 09:18:42PM +0800, Xie Yuanbin wrote:
>> I had indeed been lacking in consideration regarding do_alignment()
>> before, so thank you for reply. But, may I ask that, is there a scenario
>> where user-mode access to kernel addresses causes an alignment fault
>> (do_alignment())?
>
> If you mean, won't permission errors be detected first, then no.
> Alignment is one of the first things that is checked if alignment
> faults are enabled.
>
> So yes, if userspace attempts an unaigned load of a kernel address,
> and the CPU does not support / have enabled unaigned load support,
> then we will get a data abort with the FSR indicating an alignment
> fault. So do_alignment() wil be entered.
>
> Whether branch predictor handling needs to happen in this path is
> a separate question, but as it's highly likely we'll take an
> exception anyway and userspace is doing Bad Stuff, I feel it's
> better to be over-cautious.

Thanks for your reply. I know it now, and thank you.

