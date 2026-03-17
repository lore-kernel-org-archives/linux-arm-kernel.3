Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF0FD707A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Df0BkW3+WFtbc+05LpOma2mHXyroUqsKpSt0hTLJrY=; b=uYCJOzDxLT6ince1rukPmrOv0G
	4waGGTdeSLX52m5p1ABi3YtkaNOSqJGAsknM0XwoPIgZv/re0ImQlSCcpHOBzmyoOLRzVWE+Tzi40
	OcnmDes0ccMdhJ+L1+ex1nSBwgwbIthNyMeOJJk/EyNu4EI+ZZccE6/dSIyaI5HZF7/dyQdVsZcpQ
	Y5ECL7jpzhG5udlCMp4iLWMtigUq+SuEwD8D6/h70X4q6QhR3qNdWMofVtKCyLaJX0oY1zBMovTNY
	ZTmTRhRuGPpRfNaKToJUrzirguSFW7s5lj2P1aW6W9RRwnWN63TwOm2LxeDEhQcgGaNBtcx18xy/s
	oe2fRuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SCe-000000065FH-1GPx;
	Tue, 17 Mar 2026 11:03:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SCb-000000065EV-32zL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:03:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso49376505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773745386; x=1774350186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Df0BkW3+WFtbc+05LpOma2mHXyroUqsKpSt0hTLJrY=;
        b=XqwHmOvn9sYV8FG+TefPM7iZW5wULNj0pGfSDqAcj2sUurIZauzjKn2aSMBTf48mUD
         2et0weNdDrhNezXmc2k4Xmi3NPUOYXDDRco6GSGg54/3j1HE6aM2T3eF8jgWgo6RoAcH
         Tc5fCCNCSX1FdRXKHXQddkwMBNg0vTmjZ/+3CjRykYL+Rp6BrPPJpNWXOQ6x4aTU8yoi
         aCTFxo50qeK0dHAHGOLGEd7ceJiC0cJDRBcOLYf9SYzpzKZGBwPvarPLVzwTDW9gEesw
         iURmpM1BqUC/6Au5BL/kWzywmz3bYtIt5aZXRj3voBa11PrPtVsXkQKN1mV6FPTZZwXE
         955Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773745386; x=1774350186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Df0BkW3+WFtbc+05LpOma2mHXyroUqsKpSt0hTLJrY=;
        b=Dfm+5/WNbN3yc6/qgbPye+RxGQctVkqD16mzVqB8W6oUrJoKGk7GUhE5EP9O9NNacf
         pZzCWb7RAQQpt3qSms7lIRrM8R3BiOddbC1jOg8K0oLw3YgR6LxN43B0f8q3nJR6vYyN
         A7j681OzcnOaGQ2Ki1A/VSEK+xQtE2cjpBf9sdd3Of0AGfODU61NgMVYv/SezOmRUSNH
         VeMC9Bz4CMo37/xDw7A+iYrjyZ/WvRiKWsA3iRrKqPcbFVBrw/J4Jgc6PeTD7xYNoF7f
         LGm8gdqSQ9EQy6G0DKTP2YwXqlcyOQFjWMx5D+6xCOfB4+uQgq6/z/rlQ7Zi5Dy6vN8D
         G02w==
X-Forwarded-Encrypted: i=1; AJvYcCVC4ZErjQ2p1J+zgo5Lytvy7f/d8XL3y9s6EaYGvLBm9LVsUS1vGl5SDCJ0ZQWIx86rXg27NYa5EUBEidcaC42l@lists.infradead.org
X-Gm-Message-State: AOJu0YyPIKDVdoz8+ZkFdxalBO1eI9ssJrmAFfG+oEdC31th3KtJYoZt
	0VPQzAcDnAsOZqdKlc2naZq6FMVBA1P69zeVmDGDrie5jPsvwCSqthGS
X-Gm-Gg: ATEYQzw1Ua5qIM5VczuE0hUvw9Jrdqtxge85/PVUt1OsKiRwdF4f8/LHZmcbtvWn/Oq
	wO8T/dz5W/7TH/d1fzmKjTKBS64wnyya/aH+uG3GIeSYm7sguw/5AdTCHIvIF225qzIxHn1MTLL
	Xjbg/rH5m4wrOWEy3JR6gNiGhzJC/pSFonPLERPWTCdyI1yEkr9L0ZfrUI0+AqvDd1nW0gKovaE
	QABtkUovnzU5bRxl4ivDUumSGN+D62F0eS3rxkmeZluAAK1eae3WQWM3CiJ3Q+QShUfcd3iglgo
	srDXmzudWkuW9C2JQU2RXr5JN4Iz27byCK3xSa7vfpDJLp1vr1Sl85RvGJ9B6jfM1A+Bu8mcK/f
	nl+t/CCdyCXWl9PT9LdVmlqF1SvTIkf9XL/gSLasPoNcVQnROWM2BijZYpQiEAtK0DnP9wUX+YF
	dcvZV2KCla4Lg8RIwV3i0=
X-Received: by 2002:a05:600c:46d2:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-48556728c71mr279412485e9.29.1773745385947;
        Tue, 17 Mar 2026 04:03:05 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856e850634sm106157845e9.0.2026.03.17.04.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 04:03:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: common: Fix probe failure for devices without EINT
Date: Tue, 17 Mar 2026 11:02:06 +0000
Message-ID: <20260317110249.391552-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_040309_772361_CBF3F9A5 
X-CRM114-Status: GOOD (  12.40  )
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

Some pinctrl devices like mt6397 or mt6392 don't support EINT at all, but
the mtk_eint_init function is always called and returns -ENODEV, which
then bubbles up and causes probe failure.

To address this only call mtk_eint_init if EINT pins are present.

Tested on Xiaomi Mi Smart Clock x04g (mt6392).

Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index d6a46fe0cda8..3f518dce6d23 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1135,9 +1135,12 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		goto chip_error;
 	}
 
-	ret = mtk_eint_init(pctl, pdev);
-	if (ret)
-		goto chip_error;
+	/* Only initialize EINT if we have EINT pins */
+	if (data->eint_hw.ap_num > 0) {
+		ret = mtk_eint_init(pctl, pdev);
+		if (ret)
+			goto chip_error;
+	}
 
 	return 0;
 
-- 
2.43.0


