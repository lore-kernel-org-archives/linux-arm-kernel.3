Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3960BCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWzgkEXj1zq4UNNnpINCriQKGxQChcPS+GE0OzhntmY=; b=pCr7jysc5L75lnmiZdhNTJjfGj
	vWUvoY82gpywhtrxL8t10OL9OvDLOeE4AUE85MXtXn9y6Jsqe8RXtA5vOc/FB3FP4Xb54o5U4EfF1
	nYFA+j0aALGRf/6zosclqQ0las2Tpv4wqXJxZzuFDfsrXCyOF/6QGvgGIEWN57BWJmsP1DuWj/Utn
	swGmeVwBWsGr4ibLybpDUaseQrCiPNvfuIe1CP/1eO3F2QR+NMyQacZgR9d+wU8pIBgelXFlEBTPa
	358UJ29QlmkdOv5S6rBIYKm65CVNDmEV3jmY9mt5jKzTO4JHhtGSE4QTg4oCGTkvftZv1KYEhHjg7
	b5YC7H8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcjAl-00000009BdT-3z0x;
	Thu, 25 Jun 2026 12:27:11 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcjAh-00000009Bcq-3FfG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 12:27:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lWzgkEXj1zq4UNNnpINCriQKGxQChcPS+GE0OzhntmY=;
	b=JFThUlrEgJaJEZd3nOvfE8L3ZGL7/zBgx/ft69xExuuGC9sRI1HfG62d6fG+bd2qH6NeQYIk/
	YVRI/Rv0aggkbbH/Jv+OO4bHnXCz7pHjSzzwuRDMAtZji8dT2IRDSR71+jpgK1spMLv2owG6gH6
	BsV0IVd5cflNBeXtSWQix1w=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gmHrP1c8nzmV8G;
	Thu, 25 Jun 2026 20:17:57 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F07E4055B;
	Thu, 25 Jun 2026 20:27:03 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 25 Jun 2026 20:27:02 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <bigeasy@linutronix.de>,
	<rmk+kernel@armlinux.org.uk>
CC: <clrkwllms@kernel.org>, <rostedt@goodmis.org>, <linusw@kernel.org>,
	<arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>,
	<liaohua4@huawei.com>, <lilinjie8@huawei.com>, Xie Yuanbin
	<xieyuanbin1@huawei.com>
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling user mode errors
Date: Thu, 25 Jun 2026 20:26:12 +0800
Message-ID: <20260625122612.43501-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aj0BpqlaCh3cVw8Q@shell.armlinux.org.uk>
References: <aj0BpqlaCh3cVw8Q@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_052708_130408_C2086EFA 
X-CRM114-Status: GOOD (  10.07  )
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

On Thu, 25 Jun 2026 11:23:34 +0100, Russell King wrote:
>> 3. enable interrupts in do_DataAbort()/do_PrefetchAbort() after
>>    `inf->fn()`, this may be ok.
>> 
>> From this perspective, arm_notify_die() also seems to be a good place?
>
> If one is happy with higher latency for preempt cases, then it may
> be, but if we want lower latency, then it ought to be earlier.
> My preference is (3).

```c
	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
		return;

	if (likely(user_mode(regs)))
		local_irq_enable();

	pr_alert("8<--- cut here ---\n");
```
or
```c
	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
		return;

	if (likely(interrupts_enabled(regs)))
		local_irq_enable();

	pr_alert("8<--- cut here ---\n");
```

Which one do you prefer? I prefer the first one, because for kernel
fault, kernel may have encountered a serious issue,
and enabling interrupts may be not appropriate.

