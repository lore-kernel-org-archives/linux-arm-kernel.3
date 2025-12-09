Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058D3D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CmHbCvaeJmm/9w4N0HzSugfcSnalZn/Igv3l5av6O0=; b=ucFfyRCOFceOqgRG7up1XupNJs
	5Cg82cSZ0nVSNgNR0f+SvThhEjeXBHohrbhqPNN4ikooWL1zBYejU1prbH1vBoGxYdqIDoHAOYjbc
	sV1Xv73BYRU8eIyC0VyjzklDFPosFYQ/DXQkXqZ3hldQygfozutPTNaRx1fLeet/2yFYr9/U7DO6c
	Vg4qnFnwUTmn8RGI5Tl4klncvwt7NmdPUsmFjRU0KjWR+e+FfQURCGOqJnCLWwAEpEmtjfkwAQ08A
	ZhLxW6G30IUHr9efirfUgnDBoLhyDErkAc/eu4dLbQDGsr4raEyZhzxQFmrdcUTi6HTAGUxbYTJjq
	P+YWvgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSnGH-0000000DjOe-3Fe8;
	Tue, 09 Dec 2025 02:15:33 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSnGF-0000000DjOA-0XYY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 02:15:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2CmHbCvaeJmm/9w4N0HzSugfcSnalZn/Igv3l5av6O0=;
	b=m6EQPyNE+ABxFc3ZK0IGS5/Mi90ILwE0wxsOKUiqEKQFcG0lajEOaWElMlXzpNhdYCxihDaHC
	1QBXVohajeE1lZhF9C9zHfH1plrT+j0FWawrZ7ayWDjJJtGB04WSKihfVG+9A7LT/Zy9AWOMiWC
	bS54pNnlhqLSgHXaQNqtQwU=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4dQMpJ0xdTzRhRm;
	Tue,  9 Dec 2025 10:13:28 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id F2F291804FD;
	Tue,  9 Dec 2025 10:15:23 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Dec 2025 10:15:23 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Date: Tue, 9 Dec 2025 10:15:19 +0800
Message-ID: <20251209021519.8250-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTb19aN_8PNduyDY@shell.armlinux.org.uk>
References: <aTb19aN_8PNduyDY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_181531_699141_8E83FC34 
X-CRM114-Status: GOOD (  15.20  )
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

On Mon, 8 Dec 2025 15:59:49 +0000, Russell King wrote:
> However, there is a user accessible page above TASK_SIZE, that is the
> vectors page which can have userspace helpers in. Userspace can read
> from this page, and thus can perform unaligned loads to this page.

Thanks for your reply.

This is a key point, I think. This means that triggering an kernel
address's do_alignment() from user-mode is possible, and it's a normal
situation, not even a fault. And I also found that alignment_get_thumb()
and alignment_get_arm() might cause a fault, which will make things even
more complicated if we still keep harden_branch_predictor() inside
__do_user_fault().

In conclusion, this(these patches) should be the best solution; I can't
think of a better way.

> The system behaviour of unaligned loads has been configurable, ARMv4,
> for example, had the ability to check for alignment faults and raise
> this exception. If that was disabled, then unaligned loads would
> load the equivalent 32-bit aligned address and rotate the data in
> the register. Compilers knew about this, and would code for it,
> which made it ABI. Later compilers stopped using that which cut down
> on the unaligned loads that userspace issued. Modern CPUs (ARMv7)
> tend to behave "sanely" in that unaligned loads are generally
> supported in hardware.

Yes, I have a general understanding of this. Anyway, thanks for your
reply.

