Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868B5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 19:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqdO05o8i9/QOOI/IEIMoKVY2e0jYkwrLvfoaCsqNjg=; b=rFCGjnrD2AHHpayWOvtonIPB2Z
	b+/3vR/rE5OolxO7bG7ThnWeadyXMPtM5zlNNA27nurFQFMggyohardJlMU+oyqoHPIpmozyfu67Q
	BId8hiv+4DjsUSOUbgf3twb14/n2S7S/R+5WdhkmENWzH+YXli80o53qpl/BxGlT7PI8hU4MXzuwZ
	aAhYyVKiQtSMzfabtKI5mZRIlvy55uW4JdCiZQhThhIXdBv7uW/C6ezvOoMWS5zbkYwqfKtPqL2WW
	lwi9abwgN61FMnw2DOPAHUh4eOhOn7s7d4nrthsr4Hkfytb4V/BKtsJ/JmDIJIcY2kM9epeTYRFSG
	6D378Xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rmj-00000001kUC-3Wvl;
	Mon, 07 Apr 2025 19:05:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r0c-00000001UwW-2l5K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBFEA5C5554;
	Mon,  7 Apr 2025 18:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C98DC4CEE7;
	Mon,  7 Apr 2025 18:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049745;
	bh=ojmiIKC5JoIOY5ncsM343Ilta0QjoLb8LQTtRAMq5Mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftQIQVyzGt536oXaO7gh8Odq9U85GV04hk2FXfqtDG6dy12mM5wjDKlUN+nLTdRWa
	 enNvRrOnDbmFaG8ZuOvGBFkjTlJOP9u4pVJEgQWT55T00nE+b9tal5LTvT1V6gVZ6w
	 d2TMzVmtZWBPOIxOiG7LqtqU5n8GYBEAF1/yvo9B1haC33k729ZRRog3qDXhZr5m09
	 Mg81iFCxWXG6K1pIbIyClp6ZTq0A//2Ve/nbPyQBmb4zVrVQblNbATjyJbYU/FXALG
	 1wy9BwUwB7cSfv4GDZ9AAd6j219w2EDEgJ7Hlnt6OlLBqUv8UM7lvwDBkZKSIBZQx7
	 Df6tDh2epdNAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chenyuan Yang <chenyuan0y@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	richardcochran@gmail.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 3/4] usb: gadget: aspeed: Add NULL pointer check in ast_vhub_init_dev()
Date: Mon,  7 Apr 2025 14:15:33 -0400
Message-Id: <20250407181536.3183979-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181536.3183979-1-sashal@kernel.org>
References: <20250407181536.3183979-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.235
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_111546_751587_15DD55BF 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Chenyuan Yang <chenyuan0y@gmail.com>

[ Upstream commit 8c75f3e6a433d92084ad4e78b029ae680865420f ]

The variable d->name, returned by devm_kasprintf(), could be NULL.
A pointer check is added to prevent potential NULL pointer dereference.
This is similar to the fix in commit 3027e7b15b02
("ice: Fix some null pointer dereference issues in ice_ptp.c").

This issue is found by our static analysis tool

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Link: https://lore.kernel.org/r/20250311012705.1233829-1-chenyuan0y@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index d268306a7bfee..92755a2fe4ff7 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -543,6 +543,9 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	d->vhub = vhub;
 	d->index = idx;
 	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
+	if (!d->name)
+		return -ENOMEM;
+
 	d->regs = vhub->regs + 0x100 + 0x10 * idx;
 
 	ast_vhub_init_ep0(vhub, &d->ep0, d);
-- 
2.39.5


