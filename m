Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55749C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGpv5qbqQS7ZSoDmaLAuR5/2EqiThiMa2p7f3hUe5sA=; b=Wh415KvrygDiKSRYtjysiv1941
	5KMlKryu0H51zC8XhqPD7hXPMp+84Kj27ZngzzQf/CFPL7kMSkI6po+kGtoZBYsykYWWQ4HcCVTL/
	ZUBvOPTUyI6wAbg27n7Yjbq/PHrM2GLe2qW4rd1Mvd7zOXCpK9MlAEBkOkIdRTXQ/EpeC3ofTg/D4
	seth6E8iHSAxspj+FcuxXnQShVKIbatYT+q8X35dkYG3Z5lgRqGXB2oNlzPBwZzFzztr6E5+/4ek6
	7z7pdXvmpct4ZUKlxiJ0hB5hH7N7GKKQIFxujCnkRsOuoooMPWOfh+k/niIWDhe7LeT1Rj8trR36h
	XTdw1sZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7RP-0000000E0nj-0bSM;
	Mon, 29 Jun 2026 08:34:07 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7RM-0000000E0lh-2FAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:34:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qGpv5qbqQS7ZSoDmaLAuR5/2EqiThiMa2p7f3hUe5sA=;
	b=bc1eBkuuakI2e+0xCAO9C8iufRWXphlU95ySnEB0GneP6t5IhoA8eSkI2knUtlIxEA6Bu0EJy
	/wideb9nKgePC+ffTCMrkPEVpzeH3Dh3QxV6iPpnsnISRE7ydoZwt3QcrVlRHaRNt8Btc+HMri3
	S4P6EhoF6QOaozxPBgckAFI=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gpfSV4y5hz1T4Hf;
	Mon, 29 Jun 2026 16:23:54 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 879B1203C1;
	Mon, 29 Jun 2026 16:32:42 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 29 Jun 2026 16:32:41 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <bigeasy@linutronix.de>, <linux@armlinux.org.uk>,
	<rmk+kernel@armlinux.org.uk>
CC: <arnd@arndb.de>, <clrkwllms@kernel.org>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rt-devel@lists.linux.dev>, <rostedt@goodmis.org>,
	<xieyuanbin1@huawei.com>
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling user mode errors
Date: Mon, 29 Jun 2026 16:31:50 +0800
Message-ID: <20260629083150.72460-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629075726.McX9yWi1@linutronix.de>
References: <20260629075726.McX9yWi1@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_013405_060813_68874E82 
X-CRM114-Status: GOOD (  14.33  )
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

On Mon, 29 Jun 2026 09:57:26 +0200, Sebastian Andrzej Siewior wrote:
> In oops_enter() not only interrupts are disabled but also the emergency
> mode of the console is enabled. That means all console output is written
> via the atomic_write interface to the console as it the output happens.
> At this point, your real-time guarantees are gone. There is no need to
> worry about anything here since everything is lost.
>
> Restricting it to user context is reasonable: Here you kill the task and
> need enabled interrupts in order to send the signal.
> For kernel threads it is not needed because the "printing" happens with
> disabled interrupts anyway and without any buffering. Should this event
> not end with panic() then it will kill the kernel thread and enable
> interrupts before doing so.

Thanks. So, can I take it that you agree with the first one?

On Thu, 25 Jun 2026 20:26:12 +0800, Xie Yuanbin wrote:
> ```c
> 	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
> 		return;
>
> 	if (likely(user_mode(regs)))
> 		local_irq_enable();
>
> 	pr_alert("8<--- cut here ---\n");
> ```
> or
> ```c
> 	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
> 		return;
>
> 	if (likely(interrupts_enabled(regs)))
> 		local_irq_enable();
>
> 	pr_alert("8<--- cut here ---\n");
> ```

