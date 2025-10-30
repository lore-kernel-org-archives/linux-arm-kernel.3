Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751F5CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 02:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=La6nPJ+mBWseLc1/q4pp6q2DuHjzkflifv8qvL4nzX4=; b=O138/ZL8gEICOwdWf8f4zMf21O
	2TJsu4lHsX0zLr0OseCs7Qvez/DpLKXxxalHgMF7ivG8BHwz56IdcfPcy3//UAAatn9jCIXicuTCA
	LQKd8YA4txA06VWDQnULKNeex0zdTa0E/wwLUT92ngY3AIYGAevrZLNakAILlHIZ6Cpe5cNn72mox
	F3HK/Vbl+1FA36FUs0gs7ywohAMBJSlVouLjcW3arhHhgLqgIjDcIL3rK33Gv3maIYjYWFcxdd0X6
	8r3eYwAUXiQH9GJS8x+AWSNZyLMqOgAhLPRc5u1KUfEyn6Ekk3x3nYW4uThWhKgkVZzQ6T6FvUiww
	A58dgobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIaH-00000003Nn9-0QB3;
	Thu, 30 Oct 2025 02:40:17 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIaE-00000003Nmc-1z88
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 02:40:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=La6nPJ+mBWseLc1/q4pp6q2DuHjzkflifv8qvL4nzX4=;
	b=YY2VUD/FrWicRGdZjmf9rAAXDLpTB+d/eRKZ2rxky/tJM45Sw1unhKMR6wMPUe54TrYRoPChy
	4zFq0W0Lc0wAZMYrGVntdUPMWN0EFIIUGK/vYes3eOKnA8JRcFJ6r12N15zs4yRpUgPXN4pL16t
	e/8WgXYlW6dPbySqpKL5oco=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4cxpGv5HWyz1cyVh;
	Thu, 30 Oct 2025 10:39:35 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 021511800CE;
	Thu, 30 Oct 2025 10:40:05 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 30 Oct 2025 10:40:04 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <bigeasy@linutronix.de>
CC: <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rt-devel@lists.linux.dev>, <linux@armlinux.org.uk>,
	<tglx@linutronix.de>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Date: Thu, 30 Oct 2025 10:39:59 +0800
Message-ID: <20251030023959.5416-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029155918.503060-5-bigeasy@linutronix.de>
References: <20251029155918.503060-5-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_194015_022043_10B0AE0B 
X-CRM114-Status: GOOD (  12.75  )
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

On Wed, 29 Oct 2025 16:59:17 +0100, Thomas Gleixner wrote:
> jump-labels are used to efficiently switch between two possible code
> paths. To achieve this, stop_machine() is used to keep the CPU in a
> known state while the opcode is modified. The usage of stop_machine()
> here leads to large latency spikes which can be observed on PREEMPT_RT.
>
> Jump labels may change the target during runtime and are not restricted
> to debug or "configuration/ setup" part of a PREEMPT_RT system where
> high latencies could be defined as acceptable.
>
> Disable jump-label support on a PREEMPT_RT system.

This sounds like a performance issue rather than a feature issue.
Banning users from using the jump label because of a performance problem
seems like throwing the baby out with the bathwater.
Perhaps we could add a config like CONFIG_ARM_JUMP_LABEL_RT_FORCE that
allows users to select, and inform users in the description about
potential latency.

Xie Yuanbin

