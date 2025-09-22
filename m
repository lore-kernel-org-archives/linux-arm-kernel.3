Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BA0CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHzyKmzufjHQ/1CbKy67U93TyoOgKjt5Maf2C2a8kVE=; b=QGaRNpVtX5UwgiVK60pnVZeFVP
	CJYC9fXJqRWeE16/eoPshH3hQWJAu59HxqDy11hrozWSeHS6TFa1hfS0MQsdVsZJbfvjEd72l9C6v
	OjfkgstJyZooLQV+OmgmjEFvy/IPsAJa0JbsKFw/ZRprvMy39dSM9zsSa1ReK/ypXhk+IQvwcXBkg
	WWZG//Y/vKU7UcJMSVaBofn4LdSFxPKMAnF80mpLbcDebmJXnQFwQFomy3eRr8vw4p2QPbYPQEzDq
	dnCLB89Lc6UC7qtz4f2C/qzLaQdbBCZGGuR6F2kmOziVUiur358sDqXoYU/aYLnDnCXAtPGCb63D9
	//JjvCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cCf-00000009nUQ-3KxG;
	Mon, 22 Sep 2025 08:47:21 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cCW-00000009nRE-0e9d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:47:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cVc790n5szddJw;
	Mon, 22 Sep 2025 16:42:29 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id EEB591402DB;
	Mon, 22 Sep 2025 16:47:06 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Sep 2025 16:47:05 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <david@redhat.com>
CC: <Liam.Howlett@oracle.com>, <akpm@linux-foundation.org>, <ardb@kernel.org>,
	<arnd@arndb.de>, <dave@vasilevsky.ca>, <ebiggers@kernel.org>,
	<kees@kernel.org>, <liaohua4@huawei.com>, <lilinjie8@huawei.com>,
	<linmiaohe@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux@armlinux.org.uk>, <lorenzo.stoakes@oracle.com>, <mhocko@suse.com>,
	<minchan@kernel.org>, <nao.horiguchi@gmail.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <rmk+kernel@armlinux.org.uk>, <rostedt@goodmis.org>,
	<rppt@kernel.org>, <surenb@google.com>, <vbabka@suse.cz>, <will@kernel.org>,
	<xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH 1/2] ARM: mm: support memory-failure
Date: Mon, 22 Sep 2025 16:47:01 +0800
Message-ID: <20250922084701.27811-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <91041fd5-ca37-4a6f-981c-74aa92bb2291@redhat.com>
References: <91041fd5-ca37-4a6f-981c-74aa92bb2291@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_014712_348518_BE5099DF 
X-CRM114-Status: UNSURE (   5.60  )
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

David/dhildenb wrote:
> Can you send a patch to remove the "select MEMORY_ISOLATION" independent 
> of any arm changes?

With pleasure, I will send a patch later.

Xie Yuanbin

