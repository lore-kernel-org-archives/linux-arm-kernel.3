Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19D6CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OSpskV0b3Z0Y8Bcg2JJJY4wTw6TjjgMjW58E+iZS7o=; b=so7szAEwfWPXZLwxM4HYL/i+Q2
	mzhpVW9bK7AvmeKnDfP+NIV7npLBbVRbPNRy4oE+R+e+EIt+QGB4S2lG5EyZXq/Uz5GtS+tujMTcq
	d+OJO1K20IeQUfe/+PhT2AVsArgZc1wqbTORA6GdA0MPW9M62yGQN1gd18FSpVWC5cqtMedyQa+Cf
	mCqfbdpuCj8e8azrmBX/Ho77YkyHOCLZpN7bnH7mT2Jpa5SQcel0i0TSEeagq90xIUvoh5vVBM84Z
	gGZI+sQK2aUWXRiwOLalu73YIQz9QFHNTPq51JvlyBWJl8zS8BoWCQOS3IpXUpFmL1y8MiUl0vh56
	du2TfQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENLc-00000003eCG-3U6s;
	Thu, 30 Oct 2025 07:45:28 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENLZ-00000003eBT-2xAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 07:45:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7OSpskV0b3Z0Y8Bcg2JJJY4wTw6TjjgMjW58E+iZS7o=;
	b=kvOYlxtJmCYNMp9WeJIuVCzWorl+2SJZb2XtqxPvXNRCY0nlVMofkQ+a9r5v65P21+M9WhFCD
	FVRr8qK/4uSz5pYaj0sePRZA8tLa/sMzeo/p58khjgr/V521yOYLwExrg0hJYPoXCA3uKkVbYiA
	OJaDPY1NjSVK405Mgudpdf8=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4cxx2z0ZhbzKm6c;
	Thu, 30 Oct 2025 15:44:43 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 64FB41A016C;
	Thu, 30 Oct 2025 15:45:12 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 30 Oct 2025 15:45:11 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <bigeasy@linutronix.de>
CC: <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rt-devel@lists.linux.dev>, <linux@armlinux.org.uk>,
	<tglx@linutronix.de>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Date: Thu, 30 Oct 2025 15:45:07 +0800
Message-ID: <20251030074507.33863-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030072339.63vdFNo3@linutronix.de>
References: <20251030072339.63vdFNo3@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_004526_260690_794EE808 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, 30 Oct 2025 08:23:39 +0100, Sebastian Andrzej Siewior wrote:
> It is not a performance issue, it is a latency issue. If the scheduling
> latency increases by 300us because of this then the PREEMPT_RT system
> becomes worthless.

I understand what you mean. But this delay only occurs when the static
key is enabled/disabled, right? For users, we can control when to
enable/disable the static key, but it's a real shame if jump labels
aren't available.
Therefore, my personal opinion is that informing users that JUMP_LABEL
might cause unexpected delays, rather than disabling it, would be more
appropriate. ;)

Xie Yuanbin

