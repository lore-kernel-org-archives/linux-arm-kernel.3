Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0F0CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiXnh+B7JiCGrkXuz1WWSKeQSMq3KHxW7sbUHbPPStM=; b=Q5NYtALal5TbIVT1+MMqP+56I3
	e5ptsZoAJfFdc11iWdowpxAOlzaqrX9Rk4BL+27aYNyPO7H3YJKv/SPsifYueBzWg4Qmi9DtHATQN
	FpXtNYO+BYTDdz/7bdXWSwdocqtptpBqN33WGh7DZ9hoDSqNpBHx4OXUSsogZOOzdPuuQMQHg8b1m
	9fqTCqCFQqNK+q6RwzPSVr/t/Ay5Z4FNPWXu+NP4cPYMhmxX0+nlgButOG4vKewWgs0ZjK9XUv4S0
	DKuHsu75dzPC0ePGE6LBu3Q4GMDj6e5RjXcGtWiQRLBTtGkmpws+JBGEwZwMKMpzFBt1IVtDZzmGd
	uj/LKFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF1k-00000000xjU-0Z8R;
	Thu, 21 Aug 2025 23:49:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Oe-0000000HQe5-1OX1;
	Thu, 21 Aug 2025 15:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XiXnh+B7JiCGrkXuz1WWSKeQSMq3KHxW7sbUHbPPStM=; b=fGZ1l5uV6xx/xT6pCuBy7JEkKo
	EOzc3xvYpYa9FZnY87MMIJ8LIrHFyG/CRnBlsgsS18GIJgreJzxSGkTK/ll9gw+TanEi7DSelSdXn
	eNvuAj31mxVg+xXckIT9ulWfO4JrBTqg6nzz0B0T4zt3Y0LlbKrHReEfYufqxLPuzkFkK8r4tYoTm
	TlMxyQ6exWIsURr4SBjTE+CmOCwz0mLJ79KWJkbf6vxjhX7hbJEBuHefMyZ+rf0TQXcpAjYesv+as
	dYfEQWiGNCCw8GN1MyJ6JwRch9IXRoFPSc1rhokebl4yiNZuUwihgr+xzAnATLv/+ZljHU969T3Us
	7WIsLE7Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Oa-00000000bK6-3kRE;
	Thu, 21 Aug 2025 15:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CBBF419D0;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4AF2C4AF64;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790804;
	bh=C86MXQmNc7kleels4/FwPfEBEO3GlObgdaJqsVfJRGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bV3tjymFqK1wFff8Nim+X7fmIih1Dg6TJqGO9p/YanfNVjcFeYO3RZR3I0nzFbixU
	 CvfzvWrcyPBBwZpATBHg0D6gHiOIdd/p8IyDygI00+7jkKG8ki2PXwZ+H45+H+VYZ7
	 khgKXJGmXnX0alb/DVJPAFpUAl6aSLkAYDBNG4Kr3Gww2m8kgT12ze+UuOcAtaaSIV
	 NGetzUl8a5fd7J3CdUzHdgytM/HIndgveC2T9w0uQ2L1Uzv+XQJYhJfAureFUotGW+
	 EM5wh6WbIZWrSGLbhLEE1qPlSaBk4FB/Qn5bIOQJfGghjAawUCygUPV7vW7b7mCama
	 EiT4zFGLgp9rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D964DCA0EFC;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:07 +0000
Subject: [PATCH RFC 15/22] usb: typec: tipd: Update partner identity when
 power status was updated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-15-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=SCOtQQKEz98UryM3qGwaYKjximp44wDd7gohi1eJ+XI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy2y1nI2M8brztf9gRnfXv6vJgse5PZRwtubOYgw41h
 oScnfOlo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRc86MDPP2tJ9zlfv9ybJS
 vKlCUTHQxbaVqX5mHIe82ttXgfMXWTD8r9i2tXa3s2bd4rW+WeHaYVc/X5kvvTi6q9yHU/70pKe
 mPAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_164009_446613_4CCAA23B 
X-CRM114-Status: GOOD (  12.30  )
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

From: Hector Martin <marcan@marcan.st>

Whenever the power status is changed make sure to also update the
partner identity to be able to detect changes once de-bouncing and mode
changes arre added for CD321x.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index e369897bfa017ca96e559a8bd70da11207d4513a..b0fdd4dddd3a490dbc2a8ced21ea0803658f36a7 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -636,9 +636,16 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 	if (!tps6598x_read_status(tps, &status))
 		goto err_unlock;
 
-	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
+	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
 		if (!tps6598x_read_power_status(tps))
 			goto err_unlock;
+		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
+			if (tps6598x_read_partner_identity(tps)) {
+				dev_err(tps->dev, "%s: failed to partner identity\n", __func__);
+				tps->partner_identity = (struct usb_pd_identity) {0};
+			}
+		}
+	}
 
 	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
 		if (!tps->data->read_data_status(tps))

-- 
2.34.1



