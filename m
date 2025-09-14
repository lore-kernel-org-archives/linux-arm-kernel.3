Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B68CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VUmDhIUO1b2n8hUGs8s2tzSHmIIiWqRBJj6hxNHl+w=; b=jMJutC/dgqu9miO555+129OrrE
	5zYM93pqJf5MNqAKTwttv8FTY7MvLMw5bVwQENSgtiO0IdHnneW4ksu2+mTbRT5/UAQqKteOOsrnm
	eAr0t5UaAUk18y1Agy26iGJ19CBM6Uq0Tx5O+hsDmtYzZTZmAVtBvmWNCmDf1GFk+JYzFt2dTaeMs
	q4oBnvzGGXZ3FT6ZdGYVTCy8mIUskbQOlRED/ZV/kaW8tLSoWNISObE1KSVgfJI56NhaeWuFcmNvq
	Rj5C7iUEf7G3P64rnOIZuo4ZNCMNICQVNb3sPt4exEwuDFCdncoCmfGnbEaZxLLYD53CsCtsBWdwH
	kwU1rrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHv-00000001ENQ-276J;
	Sun, 14 Sep 2025 12:57:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHi-00000001EFN-3vUW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:56:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2F7F441EE;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 828DDC16AAE;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=vOCSchiqykXCoVM7fs9znsbVw4UvLeu+/CcSAFHKCss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VRkdzLI8aXCkPTftCtYSvhS0yi6xG7iIeE5bYLTAM1jFOVZYXJu3LV5d+76dHXnta
	 mlmcnuySMKsQIOIaY1AhnLeC0U0JcZblVIUixdNFQSb0b7f2TOnVTs9WNOlkHhQf6a
	 q7xW+FzMjtkrs9ZzNr09C/BP+/RV0X9mTLpDBdzBJqEXRxvnRnfz6Qoaqk9xvSTru2
	 vBXw2KsTNPrDrCFbJYDLRs/fQUM7Oep10BDxEEH9ZK8IrfrQMZdnuqQhQsC5Un4G1o
	 FWl55ssNbHe7p3IQpgFUL7TLia8gnT+Oc2bBn1w1VIO+pDRAOtkQYP4vflEwBK9diz
	 QY6miSD8fx5qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799E4CAC58F;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:13 +0000
Subject: [PATCH 08/11] usb: typec: tipd: Update partner identity when power
 status was updated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-8-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=rY6V5NMDdkiVm06hCdoOp7C9X1kzTeKeAD8FlJOwjT0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3c1eu7J+1bkbGjw67pdp3510yy7oQaDmhx9GeqvOq
 USX2E/sKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzk2F1Ghkd6Jj1dRwsvHa+8
 cM1X8mDEMltubt2iTYx2LlaiV04aXWNkWNVcX3opq3zTqybJv6r/J3u92WwsqP6nlzdCxGj19l4
 1ZgA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_055651_007179_035FFAE2 
X-CRM114-Status: GOOD (  11.82  )
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
changes are added for CD321x.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index c7cf936e5a61a331271c05b68ff1b77b89c0f643..e16c6c07c72a3e285f1fc94db72bed8dc3217a1d 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -635,9 +635,16 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 	if (!tps6598x_read_status(tps, &status))
 		goto err_unlock;
 
-	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
+	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
 		if (!tps6598x_read_power_status(tps))
 			goto err_unlock;
+		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
+			if (tps6598x_read_partner_identity(tps)) {
+				dev_err(tps->dev, "failed to read partner identity\n");
+				tps->partner_identity = (struct usb_pd_identity) {0};
+			}
+		}
+	}
 
 	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
 		if (!tps->data->read_data_status(tps))

-- 
2.34.1



