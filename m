Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B83D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 02:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kn01DPqEWVsRKnyDlfL02PwCBxz8cu2USXRLYTQgCgM=; b=qVrv2tWK8jfK9PYYe/sIdjg9Th
	WpBZoroNb9lfqaSW3ckF5QNa2WSmOrgXGW2Q4Nw9NWPn3Z6xhJ1HfrmRKO1TeN7sIknY2oqDYrKgK
	723gT5S+Sg6wnMuXp4GE4ZrwABfof66dDQhjqqSlk8ubPxyZnw1ds23m8Y/29KMnSpJ/H3qhPc/1v
	sgMBZNE06iA3mrxl1IHdxgMln5mSy9sq7ymdAoENvWJ7EAhNEzxSSIN+7gl2lza0c1xiN274+aw87
	9meeOc5c7ap3Vcnj5qP2w0ZaDEIvizt99xfky/7PM2ukc3/TdXkyrAMCsaMflonRskXC8xKHdwYED
	Z/sboarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPAXl-00000001AZe-1qM4;
	Sat, 29 Nov 2025 02:18:37 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPAXh-00000001AYs-3HMh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 02:18:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kn01DPqEWVsRKnyDlfL02PwCBxz8cu2USXRLYTQgCgM=;
	b=rDScHZVCx+yxOePYn8Wcv7pT5EneAyhEXpKgyfyNlZdFO+SZjIfif2JCM3YYpKX2AogeDsnam
	/17hK+QDSVVTcvAMpeNH1ZD5mzB3UTmEMrJEwauBJgQWVmdxVILASAgXYxRyzaIgfUZb+JMrv57
	oTVqNBOiz4Z5xvjvvJvwaQw=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dJDLT42p1z1T4Fk;
	Sat, 29 Nov 2025 10:16:33 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 18451180B58;
	Sat, 29 Nov 2025 10:18:20 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Nov 2025 10:18:19 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <torvalds@linux-foundation.org>, <will@kernel.org>,
	<linux@armlinux.org.uk>, <viro@zeniv.linux.org.uk>, <bigeasy@linutronix.de>,
	<rmk+kernel@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <brauner@kernel.org>,
	<catalin.marinas@arm.com>, <hch@lst.de>, <jack@suse.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<pangliyuan1@huawei.com>, <wangkefeng.wang@huawei.com>,
	<wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>, <yangerkun@huawei.com>,
	<lilinjie8@huawei.com>, <liaohua4@huawei.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
Date: Sat, 29 Nov 2025 10:18:15 +0800
Message-ID: <20251129021815.9679-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
References: <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_181834_310491_0377B35D 
X-CRM114-Status: GOOD (  12.62  )
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

Hi, Linus Torvalds and Will Deacon!

We have some discussion and solutions on other threads, and it seems
that there are somthing missing on this discussion thread. Therefore,
I think it is necessary to synchronize some information here.

1. There is a test case that can consistently reproduce the bug, which
might be helpful for us to do the test. The test case is located after
the '---' maker line in the following patch:
Link: https://lore.kernel.org/20251126101952.174467-1-xieyuanbin1@huawei.com

2. Al Viro give a suggest on 2025-11-26 19:26:
Link: https://lore.kernel.org/20251126192640.GD3538@ZenIV

This patch is similar to one I submitted long time ago, which was
intended fix another bug: missing branch predictor mitigation:
Link: https://lore.kernel.org/20250925025744.6807-1-xieyuanbin1@huawei.com

My patch was not accepted, Sebastian's patch:
Link: https://lore.kernel.org/20251110145555.2555055-2-bigeasy@linutronix.de
fixed this bug, but Sebastian's patch has not yet been merged into the
linux-next branch, so this bug still exists in the current linux-next
branch.

I hope there is a simple solution to fix both bugs, so I submitted this
patch on 2025-11-27 14:49:
Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com
This patch is based on the linux-next branch, therefore it does not
contain Sebastian's patch.

3. On 2025-11-28 17:06, Linus Torvalds provided a solution similar to
Al Viro's suggestion and my patch:
Link: https://lore.kernel.org/CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com

Currently, all solutions have been tested that can fix this one bug.
I still hold the view that perhaps there is a simpler way to fix another
bug at the same time, because the solutions of these two bugs are very
similar.

Thanks very much!

Xie Yuanbin

