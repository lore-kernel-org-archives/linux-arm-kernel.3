Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC8BC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:CC:To:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNJNm/sXbTRzkUJ8kN4EcHCqnFmPI684Yqg2otE7lKU=; b=0NuDNQ4tfuSeozJI4KGuKvyzkd
	9wg1xsPZz7e2jnM0ARw2Jr3V6WJs+OyspGWISwJPrq1nN93mdGPJIAi+BKId8a+JSXHA1NTdCDWYm
	wXRr789ysdTdonkvzflC8Ihx2dKuOonACXbWQPHHMb7HZMcOj1ldixi23BdM2o426eTozRSt1bgwO
	fv1ZSM8/XIRhGy0zVhctqVWtpkZiucjjQpd/FqWl4Vsdi4mgwd3YzI9hdF/Gy/BButLQixnWQyzFm
	i/fptHrG/Tado2A64QLirsozyZY1ID3WJfRelHIRxdDttDEcGEs9wrJxlpSIyRvajSpCnciBzo5ha
	TFUPnZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIbG-000000080dH-3SMg;
	Wed, 12 Mar 2025 09:42:06 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsINh-00000007xs0-2GWH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 09:28:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZCQHR3jggzqVVr;
	Wed, 12 Mar 2025 17:26:27 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id C2D6F1401F0;
	Wed, 12 Mar 2025 17:27:56 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Mar 2025 17:27:56 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
Subject: [report] WARN_ON_ONCE() was triggered with pseudo NMI enabled
To: <linux-arm-kernel@lists.infradead.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Message-ID: <ce10f231-4ecd-cb12-4b5c-1c503d9177da@huawei.com>
Date: Wed, 12 Mar 2025 17:27:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_022805_729860_7E5B3FDF 
X-CRM114-Status: UNSURE (   5.06  )
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

Hi,

With pseudo NMI enabled, I can trigger the following splat when running
selftests (e.g., arm64/signal/fake_sigreturn_bad_magic, which will issue
a BRK instruction).

 ------------[ cut here ]------------
 WARNING: CPU: 5 PID: 386876 at ./arch/arm64/include/asm/irqflags.h:34
send_user_sigtrap+0xc8/0xd0
 CPU: 5 UID: 0 PID: 386876 Comm: fake_sigreturn_ Kdump: loaded Not
tainted 6.14.0-rc6-00017-g5e35b5d3ce97-dirty
 pstate: 204003c9 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : send_user_sigtrap+0xc8/0xd0
 lr : brk_handler+0x3c/0xbc
 sp : ffff8000ade3be00
 pmr: 000000f0
 x29: ffff8000ade3be00 x28: ffff00209777c600 x27: 0000000000000000
 x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000400e30
 x23: ffff800082cb8458 x22: ffff800082cb83c8 x21: 00000000f200029a
 x20: ffff8000ade3beb0 x19: ffff8000ade3beb0 x18: 0000000000000000
 x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
 x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
 x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
 x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff8000827e6638
 x5 : 0000000000000000 x4 : ffff8000827e6638 x3 : 0000000060000000
 x2 : ffff8000ade3c000 x1 : 0000000000000001 x0 : 00000000000000d0
 Call trace:
  send_user_sigtrap+0xc8/0xd0 (P)
  brk_handler+0x3c/0xbc
  do_debug_exception+0x68/0x110
  el0_dbg+0x28/0xb8
  el0t_64_sync_handler+0x50/0xcc
  el0t_64_sync+0x1ac/0x1b0
 ---[ end trace 0000000000000000 ]---

I use mainline and the kernel is built with defconfig + ARM64_PSEUDO_NMI
+ ARM64_DEBUG_PRIORITY_MASKING.

Thanks,
Zenghui

