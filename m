Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B08C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTqynH+CVAJRHbKGRrcudBFPujhxA7HTDmMj81b0q+0=; b=D42cremMn4dFG9Pq+qcKzN68rj
	4gqrWlqKtbdqB22/Wvqcr6NkkmRQ76rxXN0WpBZSWicx9vF7BclJzJP8XMsUyjjr1zyy8WBITAT6U
	I3Ic+mn0M/ErEVL63/668iW9mCZfPbyVbCNXeTADnZVXYhO2Hv7x5vQpejTMwdyW/19saFTFzRpa0
	ZzxzOPqhe0TaZGgdxWxxX/rvPO+iIrci0IVMyomdZ10fR8TLGx5aEmWcYss6D9XSLMruVv6eDS1or
	qKmwIWrQEuYBRXqg7uaCnqu7OfVIBQacSk0RwzNOoeRz225FzukMAZ7zt/iLhKMtn2GGGmpPfHdjR
	s2Sbr9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz37-0000000Exk4-1wCM;
	Thu, 23 Jul 2026 19:25:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz36-0000000Exid-0bCk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Jul 2026 19:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eTqynH+CVAJRHbKGRrcudBFPujhxA7HTDmMj81b0q+0=; b=TZhWEOATHIhK0fzXv67Xwoao+I
	cuiUOCiAbu+c9IsC/C6G2MiVm/cCys8+Qq2xSygHwzbKVkdCvpGumpB1buKEHdQA4R1vwaze/aI7u
	5Il2RNK0fFqVXTEiOr//CWk2mfb98tn9zJtxeTZme4BspRLG107FfYz8qz/uW5Vua0N/E7wxVrjhe
	MYd7mfHFlabNLSMXU+FoMTG0tZ4+xRI5NsI/3yRov7WHU59wC92SDAcEshNuuGvhvCAQnuhQC93og
	VJ0RFPIIAeYJW0eArAbu00cy73Flf64EyXQAfWR+hrPQwkAvs30yg0rr8YOL7L7GLkrRqYsmDwnQ5
	+8Vtkoig==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmz2R-000000020vb-309p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 19:25:34 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DD2B79D778;
	Thu, 23 Jul 2026 21:24:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sm6cQttzSK1e; Thu, 23 Jul 2026 21:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784834676; bh=J3J022ZGj9ZwKPT7jAjojwthMO7BRByaqpFAI8V+BqQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FzMWymWb3aucVymjRY+8heXQP/xL6u/90f0d0wa9YrMhAjvcyWfjgrw2X/R35dq9j
	 Py3o0a2hMV2rGnQqgtJ623XpzGVTbxve3Y6TS2rUqQCe+4yLSom6MzDunY3crok5C6
	 s3ym6ZVQOJf/ezHYDDg5IqDHQO784+tknzMng3+stXb6RuSmmV6PJB1qDBrNxPzwyb
	 a85dyiObGZqqVbwR5OmJbZabqwQSASX+oNkZ4h3CrXHZnxflWEIonyXc9vCO2vHdDf
	 2g1mj/suyQWKV/r1UUUO34OsCaA5GymUNKFGNf+fe0I76dalUoWwFSfOQmQiF4XW2e
	 lvnhpJNfwffow==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 24 Jul 2026 00:54:04 +0530
Subject: [PATCH 2/5] Input: zinitix - do not ignore non-moving fingers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-zinitix-modes-v1-2-f6df7d86a878@disroot.org>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_202531_143712_5DEFDA2E 
X-CRM114-Status: GOOD (  14.02  )
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

With the ZT7548 touchscreen present in the Galaxy J6, multitouch does not
work reliably. This is due to the fact that the driver reports fingers
only when their state is changed, so it's either placed against the
scren, moved, or drawn away from the screen.

The function which is responsible for this is zinitix_report_finger().
This function is called from the IRQ handler, under the following
condition:

		if (p->sub_status & SUB_BIT_EXIST)
			zinitix_report_finger(bt541, i, p);

This implies and ensures that every valid finger must have the
SUB_BIT_EXIST flag.

However, at the beginning of the function, it refuses to recognize any
finger if it has none of SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE. This
excludes fingers in reports which do not move from the position since
the previous interrupt. Add SUB_BIT_EXIST to the list of valid bits.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/zinitix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 3421b8ffb19b..fdcb80f52c91 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -406,7 +406,7 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
 	u16 x, y;
 
 	if (unlikely(!(p->sub_status &
-		       (SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
+		       (SUB_BIT_EXIST | SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
 		dev_dbg(&bt541->client->dev, "unknown finger event %#02x\n",
 			p->sub_status);
 		return;

-- 
2.54.0


