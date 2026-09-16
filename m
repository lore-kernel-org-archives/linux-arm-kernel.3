Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0BBC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQvVovAsk4MfMfVt3dCWT7eSlsH9bgSlNla/bSeMA+A=; b=1PsrngIqo+aBtI71lAt1eVqLDc
	TbIQJMxP2tX9JdaZFA3YIn3oXVyv1dmdKgC/Q+k7R1dIu70/ZpZgklQwrLklk43Ok1s+JojECRAuR
	vy+kXbu5s+Q9+g+17zyalL3VqF07PQ+37qMy1jvI3lN2Ood75vMObPU0BUiij2knQ2iUghJ6Xtpma
	xTUyLmrI8lb23WHIDR7oLw5S9wibL7fcvvBvjk0thtQYPHk05tdxsiUrDkyfGYxHMkjQ0kPOkorrY
	aUPzgq+SAHmC9Wh3P5f52LHOqwCUY9Pm5xmbjk39wF3Egnki081CEx5qJFQdo6SgZq63cmW4mk1Aa
	tP70coWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vJa-0000000A1p5-2gAZ;
	Wed, 16 Sep 2026 19:29:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vJY-0000000A1oN-3Gyk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:29:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA877600CB;
	Wed, 16 Sep 2026 19:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06711F008BE;
	Wed, 16 Sep 2026 19:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789586943;
	bh=hQvVovAsk4MfMfVt3dCWT7eSlsH9bgSlNla/bSeMA+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IIe52iSAYbJtgF4JVNN8kS8XX6AY8PdObMQGnXuGzBF3aABqivPG3HHfKFQlDla3p
	 rfaQ00VTLJ6amVhbuEOBGZMkE4SViPMO1OL4zQWrF+7WOZqDZctRGZy1RrcNvC/Z7I
	 HvAuZ8DPlmcDT0InYNqlPEqiJCE2dyM1gHbx0COFPy1L4RARfoZwkNH8u/dEIb+n7y
	 QOcVLI0XawN8qPfEQh+kOOXqvv/e2fAuMcHOUCvRuDp/8HvVdR2h5CoVWEe9k7WyOD
	 6Jm6AF7r2pei1J0xnSCrq6focMo8Ux5Z0Y0pfJ6MhMiKvR+8z2LP7UV4D+hpqoDYBM
	 X/PPmQ8b8dbeQ==
From: Sasha Levin <sashal@kernel.org>
To: gregkh@linuxfoundation.org,
	linux@armlinux.org.uk,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	rmk+kernel@armlinux.org.uk,
	linusw@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	arnd@arndb.de,
	xiqi2@huawei.com,
	ljs@kernel.org,
	wozizhi@huaweicloud.com
Cc: Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org,
	patches@lists.linux.dev,
	lisongze2@huawei.com,
	wangbing6@huawei.com,
	Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 5.10.y/5.15.y 4/4] ARM: 9484/1: enable interrupts when unhandled user faults are triggered
Date: Wed, 16 Sep 2026 15:28:20 -0400
Message-ID: <daily-reply-20260916-0031-re-arm-9484-already-queued@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916080011.170295-4-xieyuanbin1@huawei.com>
References: <20260916080011.170295-4-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> [ Upstream commit e79ca91165d4fd18549c536abdb86101e889052f ]

This one is already queued for both 5.15 and 5.10, so please drop it from the
resend of the series.

-- 
Thanks,
Sasha

