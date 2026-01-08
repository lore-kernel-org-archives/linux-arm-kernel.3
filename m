Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093D9D1D486
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hYAJbT6qiXt1Oyt06EZqhtlLm5MZ6kbmeg0dNzl/duY=; b=hKxMBQS8mmA0mXHd/Aa6/B8vmI
	BkXz9EpvivdXVxMWUVnFpB0L2RAQ7HazS0QnCds9osxRTFmUemZrQFmnoApBW6gAP2XPykIhoA80w
	n/80/ULrPEgKIwVN2FdvAwuaWLHtCzruaTnJGRGJVYXQoAPCcYvq3Wj4E1R7I7w3sV861pwF37tM7
	zMtWq/7hn3Lze4jsMYNrI1UnoTIYDH3Z/FwI9mRN4bGPbC53sR7iLnWksRAbo0canY56HmyAarha6
	Z70CJnWRFNB4WD6Z8/Wux3toFLHORBwyKUbu7gTMZ+2IIYDrlx14zQyD0EchnlSvRxXhBezb9mvFe
	iUH3kCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvQj-00000000iuS-2OLO;
	Thu, 08 Jan 2026 19:12:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvQh-00000000ito-3m9Y;
	Thu, 08 Jan 2026 19:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F61643A35;
	Thu,  8 Jan 2026 19:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA272C19422;
	Thu,  8 Jan 2026 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767899539;
	bh=z58YjI9naACNod9LOsx9aXafudrnXjr+TBbt5HgVpuw=;
	h=From:Date:Subject:To:Cc:From;
	b=P4IlBCPxK+RgWYdPuBKzOhldC9QrcojKaimIn1KA1HarklnzxHE/qtfcVYeOvl1hv
	 gbiDS2rs0jD24ganiJOAn5KNo0fBXnVzeOt8QY3hfewRpXgdRQfrocCYmuIeIxSkRo
	 cPtI+u2lhjN3/uSkJmb5HN3hhY8/CeSUg77CXYnkqMDaR7N0dOnOUfkj+scnGDJ4YC
	 CAN580zxHSuUeIfkDdxTMiFcDeGqESvvfQCIKvC8xaee0ch2Ufk6EH3Dq8ZkM2YVKW
	 B+kqSViwLtdfut3lny7UTEGOmqe7H0eQ2IzN51hFvKL5FvHjSXuzw6w69FC5WE6o9h
	 MDfsCVaIG5eSQ==
From: Sven Peter <sven@kernel.org>
Date: Thu, 08 Jan 2026 20:12:06 +0100
Subject: [PATCH next] phy: apple: atc: Reset USB2 PHY during probe as well
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIYBYGkC/x2MQQqDMBAAvyJ77sIaYyz9SulBk7UulESSICmSv
 xs8zsDMCYmjcIJXd0LkQ5IE36B/dGC32X8ZxTUGRcpQTxPO2e7bH234uSWEjKsUpKcZldOkBz1
 BK/fITd/XN3guGT61XhGkcgtrAAAA
X-Change-ID: 20260107-atcphy-coldboot-fix-08652d404347
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=sven@kernel.org;
 h=from:subject:message-id; bh=z58YjI9naACNod9LOsx9aXafudrnXjr+TBbt5HgVpuw=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ2YCY9+UzFuyso9/fGfdmF0iU8AsMPePwHd1n0exE1qV9
 Vcvkz3dUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhIuQbDf/+JjxUvnNc+tGxt
 1h3ZrzPFiltui8u2Md4+x/ZUc92lg/aMDLN8PO92z9xZt+FspcbhGcabT5ksLjlxi3PTvWmaHU6
 Ne1gA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_111219_993593_3A03CEC2 
X-CRM114-Status: UNSURE (   8.43  )
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

Now that the upstream Type-C PHY code is getting broader test coverage we
got reports of USB devices plugged in during boot or those plugged in for
the first time after boot occasionally not working correctly.
This is partially caused by the USB2 parts of the PHY being left in an
unknown state by the previous boot stages. We reset all other parts during
probe but forgot about the USB2 PHY so let's fix that and actually reset
and power off the USB2 PHY as well.

Reported-by: James Calligeros <jcalligeros99@gmail.com>
Reported-by: Janne Grunau <j@jannau.net>
Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/phy/apple/atc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index c8a58ee64b7aad3205df51cf16ae778471ad2c5d..ab0b40b72533f1b3878b646b59820c730239e85c 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -2227,6 +2227,7 @@ static int atcphy_probe_finalize(struct apple_atcphy *atcphy)
 	_atcphy_dwc3_reset_assert(atcphy);
 
 	/* Reset atcphy to clear any state potentially left by the bootloader */
+	atcphy_usb2_power_off(atcphy);
 	atcphy_power_off(atcphy);
 	atcphy_setup_pipehandler(atcphy);
 

---
base-commit: add66a6673bc4aacd0ef0f3c4a51271501770b17
change-id: 20260107-atcphy-coldboot-fix-08652d404347

Best regards,
-- 
Sven Peter <sven@kernel.org>


