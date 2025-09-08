Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE24CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDZ2trEpHX9ZwFFeD8Ehoa4jKYVxOfctmESHuWQJR1Y=; b=1+zvQcQJylwt7pPD6bzmB5kE0M
	s7EgpBlKfZgIAkl+fPshGrZFmxRLKMF4WJkj9jH9r29tv27jG1/UL1SP/v5gmKmo2Q6E+ejI4pQ0Z
	NS++TH7GWpSssMJR2zQSbybOjWTQKpVMQWmEIBsEc3TDOH6mW0yeOKzmWZvEMeflz2g4BzM8NbVya
	5AswQIv80ZzfYrfNiRwUEpLhsdhqAWao0yIpVp9PyDX3CdURunvzd2MFFJqQXzEjPEwcTankI0GBz
	nZwIdvXHuxWC5plYGIwd5MGrdtbk4bMnesAo5cWuiRE0FXnIx84mzcVVjG5hbHbzdVW0uW2RJQByn
	M9X07sOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBQ-00000004oWL-38QR;
	Tue, 09 Sep 2025 06:50:28 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhNl-00000001pu8-45RM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:18:31 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=GkuWSbhVXHil6qIMMVjeb4t5gL7UJ7Yi4LzVMs5TQLBluMeuudRFY1o9X3oxzkxw+2XThPtfuccv7WFGQQcS8mqq8NH68LTfNaAb9FxtKOsOm2Q95oduqqC6DPQdjV6DJWvUGZCi9BhdheZsfDEbPW4/1qpFxvmJM0ey09+ELw3jC5v4fFzrl7HirltiyKwb2l1RL4XfLGA2ab3l4Xxx2NBOSMusZb3SWlK2tCl7SQa6Zbw+HvmiRyA0rz3g2OokGryIbBajAVeOeLIw6g+ZFCQK6A+nRTPX3mfUd1BU1Ywb7FlFxqhIdyG8fXK3uUDvyWT5SWPfbJ4wuyzYZaJ5lQ==; s=purelymail2; d=purelymail.com; v=1; bh=69wZ5GHrPC28zn0t4afWJoHx8q9PR+vnYPu2VWKajxo=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 292196779;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 08 Sep 2025 19:18:14 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 08 Sep 2025 21:17:57 +0200
Subject: [PATCH 3/4] pinctrl: mediatek: Add debounce times for MT6878
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-mt6878-pinctrl-support-v1-3-3fb78c8ab4e8@mentallysanemainliners.org>
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757359086; l=1463;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=69wZ5GHrPC28zn0t4afWJoHx8q9PR+vnYPu2VWKajxo=;
 b=DdLiMNyKJkAG5VtyMqqRyNaNB2fQY33/0dbJMn98gXZidxqgMaWMM6c02MQBPL8pcqhuIk6XU
 iG1FN2hUtMSD5YJm/3HnNCCKKeAYejNjD37oKJS8NKmftXIB42Y0Y+z
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_121830_111118_926D329D 
X-CRM114-Status: GOOD (  10.97  )
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

MT6878 uses different debounce times than other SoCs. Add them to the
EINT driver.
---
 drivers/pinctrl/mediatek/mtk-eint.c | 5 +++++
 drivers/pinctrl/mediatek/mtk-eint.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 9f175c73613f84b47c0160947f32da7aca7d5a18..c8c5097c11c4d14eb41bdd7f9cb93b4a5756d2b2 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -66,6 +66,11 @@ const unsigned int debounce_time_mt6795[] = {
 };
 EXPORT_SYMBOL_GPL(debounce_time_mt6795);
 
+const unsigned int debounce_time_mt6878[] = {
+	156, 313, 625, 1250, 20000, 40000, 80000, 160000, 320000, 640000, 0
+};
+EXPORT_SYMBOL_GPL(debounce_time_mt6878);
+
 static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
 					 unsigned int eint_num,
 					 unsigned int offset)
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index fc31a4c0c77bf28b106943e9292d0dcc425c4922..3cdd6f6310cd0da5aa74623c5f1dbe8f8495d689 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -52,6 +52,7 @@ struct mtk_eint_pin {
 extern const unsigned int debounce_time_mt2701[];
 extern const unsigned int debounce_time_mt6765[];
 extern const unsigned int debounce_time_mt6795[];
+extern const unsigned int debounce_time_mt6878[];
 
 struct mtk_eint;
 

-- 
2.51.0


