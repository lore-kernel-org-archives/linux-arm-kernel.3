Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6347BD3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 02:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCK4Ah7STzYjq+AojQmQ7ZQ6COnSuCB70gK0z/V3b7w=; b=jf9tsZbQ25nWqcIviE/4/kZoth
	uQPkpSMX1bnx4qim4UXx6blvTpy8XXYCiS59HpcdrrnIGutDHsvQu9Y411G0WXOzbAilKqa+t1koG
	zOJGgMe/63W8ItrKUsuBU3BA3XIbPGpIT+VT0EHaUceygKvCtIUdQ5ZFqV3qnI48IxnQgktCQGtov
	8OYG8P3G0DZia7ctBFfLnZfIbvEF7l9O7NnyQFd69ARw5qoYTy+kkhlOpZzOMjppheN0k57EK4C0j
	L8hcOa8o/l0veqOw76zpbSvsAW20ngDrx1pHH4ejXVtz3RTJNz9JbTOxMZjr3EYohdfY9Q86VbD8n
	M0Htyh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSnqC-0000000DkRI-1JvU;
	Tue, 09 Dec 2025 02:52:40 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSnq9-0000000DkQM-1YOQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 02:52:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rCK4Ah7STzYjq+AojQmQ7ZQ6COnSuCB70gK0z/V3b7w=;
	b=cr76hlvMJgEMsW1eKjQswdcEYZtMWVlT22ir4BmaPg0/SgsBHpeAEDxZcZRkiUzILWPFd9IB8
	+IrYWU6qXxHoLejXcGgNUHTgiFFIOdTZcmo2HXg3j4F8IWrQEqpjESb2tE8JjCyvOrUkpL+4Y1E
	WstUGv169CxbH6/JEzARxv0=
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dQNcT6LQNz12LdF;
	Tue,  9 Dec 2025 10:50:01 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E6DC1400C8;
	Tue,  9 Dec 2025 10:52:20 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Dec 2025 10:52:19 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Date: Tue, 9 Dec 2025 10:52:16 +0800
Message-ID: <20251209025216.13282-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTcBHKFDBkSEp5mi@shell.armlinux.org.uk>
References: <aTcBHKFDBkSEp5mi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_185237_900285_100D4BD1 
X-CRM114-Status: GOOD (  12.41  )
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

On Mon, 8 Dec 2025 16:47:24 +0000, Russell King wrote:
> Also, would you mind giving ASAP some tested-by/reviewed-by for these
> patches so they can be pushed out to linux-next for a bit of testing
> there pelase? I'm on vacation from Thursday, so time is very short
> to get these out - if we're not ready by Wednesday, then it'll be the
> new year, possibly after the 11th January, before I can do anything
> further (medical stuff.)
>
> Thanks.

As mentioned in the previous email, this(these patches) should be the
best solution, I think. And I have carefully read the three patches, so:

Reviewed-by: Xie Yuanbin <xieyuanbin1@huawei.com>

As for testing, I can perform some simple tests myself, and I am trying
to let the testing team to help with some further testing, like
syzkaller.

