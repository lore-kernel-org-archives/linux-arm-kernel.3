Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C0ACFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YqJ/AFwz9hvCPI5sw/ablDGOlePYPC10MRrnxTyt8YU=; b=bej045HoSn/Km1VGumsrxhUapH
	qwsF9yEgxjATapcch3+M3MCaWbThwy8lHYRSpaPX5gQwhmDN5+RYVK39r3cm0tAevlkcrrUo4lZ/g
	0JPaEkR9Cixco1uj/rEmH5rojbb2UIi2BLtN/mZPTn1h/BiEBJNi3HuHfF/D8EuGKltyf9zQ9zvVW
	KTXh/YiI7QDbW+shFDZHJdXIlCQx9lnvOcnoV2iHEzE3W3UbPLLNfhIF/52QMxWCx2jLzwAhPPgHa
	hxXPgAmtzNFz3czTxdc9OiAINJRyu/6Z4n2WfactdSufDnC96GOHQd/7PzxHnLhsQN9FSuayDdc8f
	m0y00oLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObF5-0000000GZQC-2ZWy;
	Thu, 27 Nov 2025 12:36:59 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObEs-0000000GZMG-3bkO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:36:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YqJ/AFwz9hvCPI5sw/ablDGOlePYPC10MRrnxTyt8YU=;
	b=dLdJLMCP3sI7d8cagy1+bvJOcMCC14cjoMSwAp9iZHHI60G2HplsCP9GPDrobrz1tbbII/KR6
	1P9+ji1n03UEyPxTlOTjr+PNWDLi8ggKj/Xv6884LOGzpgIqjivbSe+sUcAt3rYDgw3F3aA3yro
	LMyVUbiRyq2PULvYhMO8CYo=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dHG8q2P5Qz1T4HH;
	Thu, 27 Nov 2025 20:34:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id ADFDA140278;
	Thu, 27 Nov 2025 20:36:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 27 Nov
 2025 20:36:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chris@zankel.net>, <jcmvbkbc@gmail.com>, <akpm@linux-foundation.org>,
	<macro@orcam.me.uk>, <charlie@rivosinc.com>, <deller@gmx.de>,
	<ldv@strace.io>, <rostedt@goodmis.org>, <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 0/2] syscall: Cleanup and improve syscall_get_arguments()
Date: Thu, 27 Nov 2025 20:36:28 +0800
Message-ID: <20251127123630.4149828-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_043647_140747_3F2A42A7 
X-CRM114-Status: UNSURE (   6.50  )
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

Remove unused SYSCALL_MAX_ARGS and avoid memcpy() for
syscall_get_arguments() for arm64.

Jinjie Ruan (2):
  syscall.h: Remove unused SYSCALL_MAX_ARGS
  arm64: Avoid memcpy() for syscall_get_arguments()

 arch/arm/include/asm/syscall.h    |  2 --
 arch/arm64/include/asm/syscall.h  | 10 +++++-----
 arch/xtensa/include/asm/syscall.h |  1 -
 3 files changed, 5 insertions(+), 8 deletions(-)

-- 
2.34.1


