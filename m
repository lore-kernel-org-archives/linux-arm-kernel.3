Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CA6C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kbOFm9Q7fFBHZscYY11fL/APaCBS5q0JYfHLMJc2GA=; b=RibvGuVMsV/5G0SnQNWv4xDyRJ
	wMwbXyKWqL/uNELXvAVkt8mj49O7b9cZPdKRxCHDYNqOaFfFeRnliaO33+K2rTWLg4zNlbhR1vTVB
	gJltohgskVBEvG7Uqj6u7u6YOltjGiowz78Eu5b8H2pDBbOMKYPfKLIvTGifZ32xY+EUksVu1cEJO
	GqFfKI2Km6wi3YXhF4in0TUR76jl9eAkXAup7osNLBxLtwBePHfk1wmVmxurut76sMelZtqJYVWJq
	SWrnmfzzU5YAsIx8i/4XqZQH1XIcmYKcOPG37cbkoZrqff0XeIApWWfurIlizVETgbDENqINiWJAl
	5VVMGLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys0a-00000000whj-3AoJ;
	Tue, 25 Aug 2026 14:20:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys0O-00000000wZT-2Sr1;
	Tue, 25 Aug 2026 14:20:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 0822A60254;
	Tue, 25 Aug 2026 14:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2A0801F000E9;
	Tue, 25 Aug 2026 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667599;
	bh=7kbOFm9Q7fFBHZscYY11fL/APaCBS5q0JYfHLMJc2GA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rcb+ITSmpXQ9yDVdZsnOF81C3pecmwfa97695h1hb3I8NjctLJC+MwI00PBhKzVf4
	 EKRr//m8FaVy9IbJD4b0Fb6WxcoRocR1La5W4q/DJM59VhVtroERIZPkAIcQ3V0p17
	 RSNK4oiAzjodtv/lcqfAGdBGGEEvtUAYVCL8Na8BsDKOfaytSMkMrclvq5TuiFd8K2
	 uhEB0MO4/CRKlU30dFqgRE0AbES6UsHs73SJxwEps04kVe8WpO9dhyxZgXbb+Xq8fT
	 HvT3+74o8vOUBAZHboArXARFl/4pAnp8k9LATT2qktDclS90YkDwannlh8uA7+y8/4
	 FnrczFpQ+jTMg==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 3/3] mailbox: rockchip: Convert to use dev_err_probe()
Date: Tue, 25 Aug 2026 16:19:26 +0200
Message-ID: <d9fe1f923698066ba364295df7519770e2dc8557.1787667315.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1787667315.git.ukleinek@kernel.org>
References: <cover.1787667315.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347; i=ukleinek@kernel.org; h=from:subject:message-id; bh=e54aXlzGcps+TytsLYfn64m7yyNVmy3TFL/QXt0cNmk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqjaR8R3+yy+UgL4aM0YFZQKOc+8xHdAh7wkA/n EcZ7UqEc9mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCao2kfAAKCRCPgPtYfRL+ TuawB/0d681t1JSRae/ZmngcxUkB/0ubaM3S981Usz9hGmomb76gpu0OZ020BdAR5iQyt0jJNCy 7RKE405NSVJbPLV8KF9pYjPme1y5pqBRk0hZiA4Qi68vMJOqLjplzc4EVQ/ecGqplhkKTqt1fZF 59Sqiaf/JzpW+dFjQnUwsojOjHmqeeSM1tBCpsFzS89FtKxMHuceUIQJspNxOdmg/Q6zuA2uzUv EZjxAXNHzx6mUt4iOrCQUkh/caBD2DcQ24ceLdbOObs+eFuS/0Br4YxcjQBcrcIx2GyuQs4GVa7 lIKsnXnJzq9xIe5plIsBD8mucdA8mZfS0kFFxEUcR+RG2Aly
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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

From: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

This is more compact in source code and also compiles to smaller code.

Bloat-o-meter reports:

	add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-76 (-76)
	Function                                     old     new   delta
	rockchip_mbox_probe                         1596    1592      -4
	_entry_ptr                                    24      16      -8
	__func__                                      62      42     -20
	_entry                                       132      88     -44
	Total: Before=6693, After=6617, chg -1.14%

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/mailbox/rockchip-mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index ada2bd419880..790c34a22ec5 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -215,9 +215,9 @@ static int rockchip_mbox_probe(struct platform_device *pdev)
 
 	ret = devm_mbox_controller_register(&pdev->dev, &mb->mbox);
 	if (ret < 0)
-		dev_err(&pdev->dev, "Failed to register mailbox: %d\n", ret);
+		return dev_err_probe(&pdev->dev, ret, "Failed to register mailbox\n");
 
-	return ret;
+	return 0;
 }
 
 static struct platform_driver rockchip_mbox_driver = {
-- 
2.55.0.11.g153666a7d9bb


