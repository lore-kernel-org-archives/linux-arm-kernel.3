Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7ADC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKl8iRi7t2S1UDs2dRmpXhJRCp/W8560Av18KRMEXdk=; b=WoAiPLpWUV7YceCHkdjF7OMJ3E
	Muz26oCcPYWnld63H7vXGrZYW3zaxKl2mlo0DKNYTnq5XxF0P6HABqsIeM0sN96lTMkC0cqk64A8w
	Jl0/EH28gBdJ/6Ha3gGQm9Mgon8gt6T1Lm7xH8rU5r5487++unCVpjg8KMrc28TfCuSGFpx0bK5+5
	V3okbZ7Yrht5JtN2gSWgwyyvVWUVbYizZQEiaASDO5UrJbSujUTZdxn3qYPnSdPIcyk8wKNaGEC8/
	mGCVne0nB3YgDBDyN9Uy2NTatiytSMoY7ojPDgNuG8X9WnL9tBFHm+T9CZ5m3eqz4CFsnZpApe6GI
	dLmyayMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIo-0000000243r-0XPN;
	Mon, 07 Apr 2025 21:46:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r0q-00000001Uy3-1swe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 626936116B;
	Mon,  7 Apr 2025 18:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B4FC4CEDD;
	Mon,  7 Apr 2025 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049759;
	bh=k13xiQCaT/GS6dWcuXlaBInjqnzPmqms2Dv69by3/rE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhHBcldpetwj+Px1tlBUuWitjT07SZP+IoP3R9vvpPEOWbLi8eKgSyPqXXjDd99d5
	 SD1kdDcqxtHEt8+TKorNtwYKWKztXuIBgxmfJqtKWgTtNO6n6a+r+uFOgtZr4k8hHP
	 V5vGz/SdpNfX2wGjsQAdADsYL/nk+5uACGIOqYngshyIEhWoJXKRrCjiMYHyqmic2X
	 AcbNGhrZNhRjnp4ErPrGyD2eZSEJzynZRWYb3hYkrapgqx0foxf7BffNp5cETvDIzZ
	 Lo6AEiw378Xfb7aX22M1HJocqeS37bitc6+d6P22TXh33hd+BPQFuq2oWqwqYJLFDn
	 EM3urwhIEDsOA==
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
Subject: [PATCH AUTOSEL 5.4 3/3] usb: gadget: aspeed: Add NULL pointer check in ast_vhub_init_dev()
Date: Mon,  7 Apr 2025 14:15:48 -0400
Message-Id: <20250407181550.3184047-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181550.3184047-1-sashal@kernel.org>
References: <20250407181550.3184047-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.291
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
index 4008e7a511889..89d7d3b24718d 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -542,6 +542,9 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
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


