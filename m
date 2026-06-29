Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C79C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+/YUQD7YAYGSS5DehzY5s76C5ID0xVuOZFRGvMTkns=; b=aUVk3uOALNQHAnloFFKH+z2aEW
	1omNdjOYols6akXExWjeWnKeVWwdBNsP/I5vXkaBfEoYuK+3CK+iVIDOKLk5b/3kFS5vxhl1Kbdyn
	zbJJqrDnViyB/9R4IL1Q2AjI/VCVrc+Xo9zLPByRvBdT+Yd8/VIMqf00E8whgTjPHyLZZWcA+J1eu
	CPBx2uOLFLHm5uI1JXZkw3+VrB3rd1Dg+L1XqtIEzIVnQ2L1RN7MpvLOOOHhc8tErsxuWo2EO+7v9
	SDVWE/2S9CoPHF9JVjC9RjfIQTyR2VIicSPFxpyY4E9O7upiZdgCnYy6E3R6uLyCncAtPWLvHyK41
	Hl25W80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBQQ-0000000EceK-2nhu;
	Mon, 29 Jun 2026 12:49:22 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBQN-0000000Ecbj-0NaS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:49:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=O+/YUQD7YAYGSS5DehzY5s76C5ID0xVuOZFRGvMTkns=;
	b=2WZBudhenS3hM7mMwRIBVvPr/ThfSgz9lYWaUAUXKzw+rms+JuhUfZ2f2Qvr4Ol5Tv83L3W5M
	R82qUDI/0vzLePM/Tt9O/T5egeDzpdeVUoyssT5fm3z40XZ8yZOdimhg6N7GvGV+qJIewGrlaLr
	K4lVPTsnMqFBoWYxGanvTc0=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gpm7w366hzmV8L;
	Mon, 29 Jun 2026 20:39:56 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 22A4740580;
	Mon, 29 Jun 2026 20:49:05 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 29 Jun 2026 20:49:04 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <bigeasy@linutronix.de>, <linux@armlinux.org.uk>,
	<rmk+kernel@armlinux.org.uk>
CC: <xieyuanbin1@huawei.com>, <arnd@arndb.de>, <clrkwllms@kernel.org>,
	<liaohua4@huawei.com>, <lilinjie8@huawei.com>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rt-devel@lists.linux.dev>, <rostedt@goodmis.org>
Subject: Re: [PATCH v2] ARM: enable interrupts when unhandled user faults are triggered
Date: Mon, 29 Jun 2026 20:48:16 +0800
Message-ID: <20260629124816.136079-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629123349.134224-1-xieyuanbin1@huawei.com>
References: <20260629123349.134224-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054919_621205_D9971A14 
X-CRM114-Status: GOOD (  12.03  )
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

On Mon, 29 Jun 2026 11:40:22 +0200, Sebastian Andrzej Siewior wrote:
> If this is moved to the callers of arm_notify_die() then I don't know
> what to do about baddataabort(). It looks like it gets invoked with
> disabled interrupts, too but I'm not sure. This looks like pre ARM v7.
> Is it reasonable to add such a check there?

Oh, I'm not sure about this place either. Would interrupts here be
disabled? I'm not familiar with the entry assembly code of v4t, so
I don't know how to construct a user-space program that can run to
baddataabort(), and I also don't have a v4t device to test it.

