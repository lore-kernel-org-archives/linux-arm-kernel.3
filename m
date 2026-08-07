Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD66C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfy/kLuYSBUzok4FzwzCtdd1fXn+6YVgQIjQLkSKroQ=; b=XAuCRQXCaP8fYeOW3iWuE4Q8B6
	BQIXsmBUXl9SpLT+RS+tQoZz/rlmSn0bPBNKM1YUCRGZ43ZbQ1RZdjtjHddwFf+gghu2qS7wjWlEa
	XIip+IeGg/FhRAEduNXQRn+ZMx8WdNizt0Dsn7Za1Yjb7NkubSoNzkx1ERdu97MPDQEKr/L/xEX9F
	7pnPXxc03NkvKWA3LTxukZQ6Sal4LYxL66qguNoMh9epiihFPTm5i6AZGmGle4j1dqoNrtAZNeczW
	VmUoMutwWV+euv3Ftz/dycKb6ENFbR2HOU0UJ+G2Oo9mHUWhRqkx/76Yma9gUOSe26IoO0qd3E5VC
	JQ66K4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEu5-00000007E0j-29U4;
	Fri, 07 Aug 2026 07:22:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEu4-00000007E0d-3BDs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yfy/kLuYSBUzok4FzwzCtdd1fXn+6YVgQIjQLkSKroQ=; b=E8MqSmP/GUYywTtM/KknAVP+0F
	cqXmTEMECDHQ/pFFxwHtsS2m/BET1rmtSQWsnvGKOyUo8SOgrNWnNnA8FaexD7/0lekifSNFptkF2
	QAtlCMPOhhrgfZYzOIHyPNws9ZgKL6/TmOCnc/vyUG2vFpN76wEe1CnCbkEjKkcrzkpQu2wQje2/q
	UrPHwCvhMDCxI0mc0p78qZnc79R+pN6h+j4wTU7xPF/lfcZhR+ZabeSnN0Vk9PDHLWkm3equ4Rsgw
	ywWQbcBO5Bg4jPF/KentFIiGtSqppCc5E8oyVtLt1VwoNUVbdQ4NKMFt9/ntR41YoBMJk70DBXC0l
	YNtpTaJA==;
Received: from [113.46.200.221] (helo=canpmsgout06.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsEu0-0000000C8fo-0OP2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:22:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yfy/kLuYSBUzok4FzwzCtdd1fXn+6YVgQIjQLkSKroQ=;
	b=Ke0qftcR4CIsMTXa4kh8sdaPvU5fo7TBaTBjvYEUJQxprcV9MtIMeDgPbPimuAalDTUdO2vgm
	/NRSgq7Uvx0l94NlDR809ZeHNvB4k43FgKX6jtLHBEB0gIxnX0sGXO9jily7/+JjkRKi5ybpPow
	3AKCtua5TV5uaoTdoQrI4Fw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hGb0L1blSzRhRG;
	Fri,  7 Aug 2026 15:10:58 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E2914058C;
	Fri,  7 Aug 2026 15:21:30 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Aug 2026 15:21:29 +0800
Message-ID: <5a3389e5-53b8-4fc5-86b8-87fe689e1b60@huawei.com>
Date: Fri, 7 Aug 2026 15:21:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: entry: Convert IRQ handling to generic IRQ entry
To: Linus Walleij <linusw@kernel.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>, Thomas
 Gleixner <tglx@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260623-arm-generic-irq-entry-v7-1-v1-1-f25ca7079e3b@kernel.org>
 <c10eb90f-3da5-48c4-9734-1913ea62bd9d@huawei.com>
 <CAD++jL=ZiU4K1h7Xo8-eOGcfLEWjsHTQ9xk843T-VFoOCX7BUQ@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAD++jL=ZiU4K1h7Xo8-eOGcfLEWjsHTQ9xk843T-VFoOCX7BUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_082201_917913_F8EDA340 
X-CRM114-Status: GOOD (  15.36  )
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



在 2026/8/7 4:42, Linus Walleij 写道:
> Hi Jinjie,
> 
> sorry for slow return to this topic :/
> 
> On Sat, Jun 27, 2026 at 4:57 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> I have a small suggestion regarding the `interrupts_enabled` logic. If
>> arm32 could also implement `regs_irqs_disabled(regs)` (similar to what
>> arm64 and some other architectures already have), we might be able to
>> unify this across subsystems.
> 
> Yes, the patch implements this, hehe :)
> 
>> Specifically, we could then replace the custom `interrupts_enabled`
>> usage in both the arm64 architecture code and drivers like
>> `drivers/irqchip/irq-gic-v3.c`.
> 
> That should already be possible with this patch.
> 
> I could also make a patch to replace all uses of interrupts_enabled()
> with regs_irqs_disabled() as a follow-up to this patch (which introduces

Yes, we can replace all interrupts_enabled() including irq-gic-v3.c and
then remove the interrupts_enabled() in arch/arm64/include/asm/ptrace.h.

https://lore.kernel.org/all/ZyDu9XHNmxMHBMSI@J2N7QTR9R3.cambridge.arm.com/

> regs_irqs_disabled()) if it gets accepted, I don't know if
> that's a good idea though, maybe it makes the code harder
> to read?
> 
> Yours,
> Linus Walleij


