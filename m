Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1D9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ9GCrtAretZKfXj7tthAfLvZfypJ301Y2Vd4rdlpH8=; b=Esah6afQENpIZKz8Hi8KRiLpCw
	DV2ozpfqDM0aQvQRf6mLzvl3r/NiMAb+mlANSym1caaO3bPlzTNB/u2q9qktPcHjGogerRpP7HmOm
	1KNnuIKrTPRcOOm5jqhhg7YR2T9P+LR3UBmKfARiiEm9zoKvMyQ/Uu5RmVR3s7zHthvyQJAXur0VE
	2pXGpgu7u3Ig4Tk41FNCiQhvHeg1iZqGZIwZMsfbvuCU073SisBNNnYkglqY4Jtk7x9LUQuK/dJ8p
	5T8cZLyUU16f6JE/qNLYaZlSl7/V7wDj0CMIXJwAhafI4XLCyfXFFS4dfMwz9SMIcmhzNFcVtbxcm
	vBWwgUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xbn-0000000EOEe-0vCR;
	Thu, 24 Apr 2025 14:31:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7whN-0000000EBly-1jeO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 13:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cQ9GCrtAretZKfXj7tthAfLvZfypJ301Y2Vd4rdlpH8=; b=dvoIfmkwjKuwRR28oa/JQubVh0
	K9w4SyeD1bFVDcMfWTSo6YWUnl/LGfDHQ+nqtZ8yi0wjSTp4//X0vmhiEuA6PqbMKBfCDR2crmeK5
	a7lq46HIq4LR/z5zZyo/tLL+UNjrYLihPyeD3DTXNE8h/kXfKCEVgEqJp1/1w/I0CgoxgWpN0Cpj0
	GIII8+MpmKW3O+uI5PGVlc/+X5CkNKw7vkyFYZ7unqc6YWIAWezTssovgOIN56NF8lqVqFv8UP7Fa
	/BQeDhJBIPkb6NwbpiG5b1q76vuFsOJqz2Gi0MKSPy5Dk4AljYUzdXK2i/aoLw5aBI/Nsrn1B4HUR
	oh8Xo5gA==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7whI-0000000BneS-1SXV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 13:33:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZjxgD2r52z1R7Xh;
	Thu, 24 Apr 2025 21:30:32 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AE3B1402CD;
	Thu, 24 Apr 2025 21:32:32 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Apr 2025 21:32:31 +0800
From: xieyuanbin1 <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <liaohua4@huawei.com>, <lincheng8@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nixiaoming@huawei.com>, <sfr@canb.auug.org.au>, <wangbing6@huawei.com>,
	<wangfangpeng1@huawei.com>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: RE: [PATCH] ARM: spectre-v2: fix unstable cpu get
Date: Thu, 24 Apr 2025 21:31:33 +0800
Message-ID: <20250424133133.40122-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aAoQwsldwmxAKA0A@shell.armlinux.org.uk>
References: <aAoQwsldwmxAKA0A@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200012.china.huawei.com (7.202.181.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_143300_855660_C69C060D 
X-CRM114-Status: GOOD (  10.01  )
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

From: Xie Yuanbin <xieyuanbin1@huawei.com>

>> From: Xie Yuanbin <xieyuanbin1@huawei.com>
>> 
>> When a user program accesses the kernel address,
>
>Please see
>https://lore.kernel.org/all/795c9463-452e-bf64-1cc0-c318ccecb1da@I-love.SAKURA.ne.jp/T/
>
>As I see it, this can't be fixed - certainly not in this way due to the
>reasons I set out in the above thread.

Oh, I'm sorry that I haven't noticed that someone has submitted similar patch before.

I've actually thought about a similar problem. In areas other than put_cpu/get_cpu, tasks may be scheduled to other CPUs, this cpu actually does not execute the spectre code. 
However, in this case, a context_switch must be happended. Inside switch_mm, the spectre code is still executed, so I didn't think of it as a problem.
But there is a situation, if we switch to another thread of **this** process, we will not execute switch_mm, which is so sad.

As mentioned in the previous patch discussion, this is only an alarm. However, I do not think so. On heterogeneous CPUs, the spectre code of different cores may have different implementations.
If another cpu's fn is executed, there may be illegal instruction and panic.
User processes can attack this point, which is very dangerous.

