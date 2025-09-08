Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D8CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IrjM3txTgUaqtwvyC+ZS0FCx9dQ6a8Gu3jhzPH8AGtg=; b=FiSwGAjFFxvOFQ2nwCg6XkFvKA
	i3Ul9UCPVVfbTztBapWjplTj0QZhAuZs8QZlL5pn/AHEtrxUWtvRFQxDDwA9R09xHtsMZUBuNB4un
	GwgYSTqA8fmfU8dTlWxBQqayDhHdFfTZzzv3gNQDDUHarl5IB5ts+8oAlkVeLJPRpZN4wjppKJsIG
	84ALbHnOR4yiHrOEjxWYJTYjOvQ0AbYueXJFsWPbB8ylp2as5ELuBbj9MUnXDs3F63go5zE/t+fZB
	UTPb4PEbbm0FmEhB3BlWBUpvpOsSy2qvCYWo/AIkK5JZCeh+WdAr5hYzG5U+syXin0h1SKm9nLY5f
	MjRX0Ubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvY0g-0000000FyHC-2FX4;
	Mon, 08 Sep 2025 09:18:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXE6-0000000FhQN-06Rr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E8164383C;
	Mon,  8 Sep 2025 08:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F75C4CEF5;
	Mon,  8 Sep 2025 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757320069;
	bh=Nb3qhP80Nlzt5njY6nq6o7jwZimes1XKvb1BpVbuRyc=;
	h=From:To:Cc:Subject:Date:From;
	b=A7EWGPpQfQu4EqhlcknsiynPAPp+Z8q4DF00ROmmFAHJwxgE0ohcGftR7RRqSFGz7
	 dRfioxr9+xpGeGr6ObnV8FR2X8ffOUeiOVTNSAr4D01AO763HmjJHxrgfTKzJqPRS9
	 30tT8K8DYCVo1l3mmgNu4kEkaWeVg21aBGmY0CsZhoPXk2mHzunmdvpxkVnasx0TyK
	 fK4apVrDjH54VK2G/cr0RkGAbIaP+l1T6EmXHGt8e0ihqioqeTmSBk+fw6Irb4WgMb
	 HRd7Xqy8Mc0vWik8tQ25DrP79SLl5LmpIm5LcDHrGGAcuqrrNg6h7MZxvVuJAjPxno
	 9XB7IEAtNgMLw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 RESEND 0/3] irqchip/gic-v5: Holdover fixes
Date: Mon,  8 Sep 2025 10:27:42 +0200
Message-ID: <20250908082745.113718-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_012750_089135_C9B3F246 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Thomas,

I am just resending fixes posted by Dan in [1] before the v6.17 merge window
started and GICv5 code was queued for -next to make sure they did not
get lost in the process.

I tested them by forcing the relevant error paths to happen (patches (2)-(3),
for patch (1) there is nothing to test).

Please apply them whenever you deem that suitable, thank you.

[1] https://lore.kernel.org/lkml/670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain/

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>

Dan Carpenter (3):
  irqchip/gic-v5: Delete a stray tab
  irqchip/gic-v5: Fix loop in gicv5_its_create_itt_two_level() cleanup
    path
  irqchip/gic-v5: Fix error handling in gicv5_its_irq_domain_alloc()

 drivers/irqchip/irq-gic-v5-irs.c |  2 +-
 drivers/irqchip/irq-gic-v5-its.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.48.0


