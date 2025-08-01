Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58036C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:CC:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PbG8XQYG0g35yJ9gdzlcsnnlLyMa3IkLVqr15YnaMcI=; b=1DsBjTd46woqE0EnO7aeii5KEj
	Gx+psg1NserCfCeNXKpj8brKYpwemqPJG791gwIrnUpS1tp6H4GmoU0ZTUv/KRkTh0P4zwM63BQEP
	HDahDDO9rakB0P1Hv4sBBez5J1FahIosTtEybxwOAZX3V87ojX8CXcFNd/CmU9oq+smy9v5Ljl76e
	vY/KKE3MR40lujtNficrqcpSHfRRU+RZAezucIOfr8wsdPXfEBKx/Y3rINetuI+Xh7M4hMKHnoGOH
	bTrwxiPSQm0mDJGtZcopbYUNQUShM3pz5/wo4i3lIe5qumSnYoe1wV2tGFUkVt1Ko1aZMly5vRHeT
	0QLQyEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjGS-0000000548o-2FyY;
	Fri, 01 Aug 2025 06:29:12 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjDt-000000053xZ-1m6Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 06:26:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4btbSR0xLFz14MCN;
	Fri,  1 Aug 2025 14:21:27 +0800 (CST)
Received: from kwepemf500018.china.huawei.com (unknown [7.202.181.5])
	by mail.maildlp.com (Postfix) with ESMTPS id 10BA91401F2;
	Fri,  1 Aug 2025 14:26:21 +0800 (CST)
Received: from [10.67.145.254] (10.67.145.254) by
 kwepemf500018.china.huawei.com (7.202.181.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Aug 2025 14:26:20 +0800
Message-ID: <8c6eb963-0a3a-8b75-8ab4-a0b2e10f3d40@hisilicon.com>
Date: Fri, 1 Aug 2025 14:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <yangwei24@huawei.com>, <yaohongshi@hisilicon.com>
From: wangwudi <wangwudi@hisilicon.com>
Subject: Question on the scheduling of timer interrupt and FIO interrupt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.145.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf500018.china.huawei.com (7.202.181.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_232633_620143_6601C33A 
X-CRM114-Status: UNSURE (   5.49  )
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

Hi, all
When running some FIO tests on ARM64 server(Kunpeng), frequent NVMe interrupts occupy the
CPU, and the CPU's hardirq load is 100%. The watchdog feed interrupt arch_timer cannot be
responded, triggering the hardlockup.
GIC driver uses GICV3_PRIO_IRQ to set the same priority for arch_timer interrupt and NVMe
interrupt. In GIC spec, "If, on a particular CPU interface, multiple pending interrupts
have the same priority, and have sufficient priority for the interface to signal them to
the PE, it is IMPLEMENTATION DEFINED how the interface selects which interrupt to signal."
Shell we consider setting a higher priority for the arch_timer interrupt to fix this case?

Thanks for your help.
Wangwudi

