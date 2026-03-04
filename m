Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1F9EFCE53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 23:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3Yf+D04UD++q2u6SPTjJOtp/z2TTx4w7P+/iR0x8sU=; b=ixuAUZFVCPzOyAThkrDhDP2V/Y
	5ZuBoBAL8F0WCDPxG5rOR0r+apoCOv+6x38aBKUGOicSnta7AS7ENWowAAhSPOwgPS6dJbG0P/4ED
	1ppEgjW5aDasJaIMSQ1oGr6mygGChRk73AuDUL7f8inmlRjLGuk7scNdg6QC6NmeKqNX7GdqKffAD
	9W7SQxGw8XUVwP8tlKkTNVslJvriLOQDssBeV7vKZqlB+x+AxeQr2lzafmThP3dH84dAHv7KPiYTE
	ThRgEQVKMixAn7ieb2jDJbNY8RY0onkacgTAZBalimy4EK/ZsAwvvllSWa0jcxNv0f9HYMdHdW9t4
	eDWjpBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxveT-00000000d5h-0K8c;
	Wed, 04 Mar 2026 23:29:13 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxveN-00000000d4e-1t6W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 23:29:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8272a56b91cso6211374b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 15:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772666946; x=1773271746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3Yf+D04UD++q2u6SPTjJOtp/z2TTx4w7P+/iR0x8sU=;
        b=XfIWDXZrTgKF/MjvnWefnBSHVoOhFktP+oVyMvpupAvQcJHigBTWxDWobekWcE3Uah
         cv4HRT86cSqONJAQzJVYe4tox68z3n1mH4atw0FIp060PYVLnoWuHDoam1NhRSFVeLn6
         FFPIG0scRZcEXFPgacZfXLM5DDPM/7Z8fBUJDB/MlQgoqtDyRvMDkfXTyvgtsufDye0t
         6IHFAz0qIxE1erZhI7C5DaoJfUKBsD06Ajda0cfPG9FnWcNX3xvNOzsle+rTUS+vZG5x
         3F4AfsVqoa2B73y0QcpW/P3lGtQ1ke/a+MP5i0Bpo2V4pTydubdseDq+c7H8zfCS8fJf
         2SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772666946; x=1773271746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Yf+D04UD++q2u6SPTjJOtp/z2TTx4w7P+/iR0x8sU=;
        b=Ip/cProtlieFT3nRtC6EKo9PsqhJ3dFzhE8yuYysmaotwdhFyLy9a9G3a6gcXJAvVa
         3DpgA0R6rHbImQ75jNQ6XuV9UsEz5pI3zP6N/zbODsCGsIc8pIumUImgWicpgjCgfwzm
         nRdJ7AGnttmW9mj9feF8Qqa2sCzNNJ86dVCLNhizkhhJ/9Ye60w+wwAHqXSsLEBSaUKY
         v5fWOdJEQxguH2DROpPw79/IK9irEYB56xYJ+qe0Jdh4e2PDhVaZUVmPNyQWpXA3/DtV
         DtHxMUAAb38jAJgeMwNATxD5uwZEsp6Q7ty9wwsnmdI92t72sGssDTlrqY/fFU8imqMK
         tdDg==
X-Forwarded-Encrypted: i=1; AJvYcCXxSttWHBBn2RMmNLbmxj2fScJ76cn/a4EZOk7NwpCQxMq5+9iUIsLVWe+KH7/xlDvnGjSdseSl6ylS0ItTM0+Y@lists.infradead.org
X-Gm-Message-State: AOJu0YySfpUG+mHtV9T22NJ2sKibk842MEF62+MA24wXP3BNZPtSQcZH
	yylF96/0StEcozsEU0tBWhlB2dR8jwAisImxFnF2tQkKQluVM0ncEw5Q
X-Gm-Gg: ATEYQzyHugMXFSgtUtvo7sIdPcyuNa6alX3RqAphA66wdnaYOrlrWKyYMdviIEyNvfW
	JqHHFGyZxc0R6H2r5LG+zW7dpfaDwMxdXu4mNsYJlo0dkA2CMU2NQMP3ueIMsUV2/jbNxeGhY4C
	QWtlZJtnmHXQz/4UZea986TZj6d5gpiEuIQlAKoF50d/v30P+mW2LP1OeZiov70Ro1x3wzyTehz
	xJA7ZA5bAOZdtnqHdX42nxhVAhH/Qt0l+omO1ZWfzg3kC8sAv5KkR16IdrFSHM+Gu1cbXiALUDt
	jdswo9wYeQFTfcOFUf0YXMoGj8SOidfNCHWddE1XKVSkq+SGaYfSKOlkIp83lVMKh6m0j0X7AmL
	WIBEb9WRvzMerQsI3ugR5gpIauhV8dqdk9ihYSVO5XJY9GntJwJmU6kNtg+6WkuvtsXaOqEk4aH
	JZvEJu4L6H+bDgt+pE60rAOIuPyhN/WivmQ6z7z0s6+Gv3fgNMFm2Waw==
X-Received: by 2002:a05:6a00:91e2:b0:829:7553:afbe with SMTP id d2e1a72fcca58-8297553bf5emr2861233b3a.57.1772666946447;
        Wed, 04 Mar 2026 15:29:06 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8296c9f83f3sm2904789b3a.0.2026.03.04.15.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:29:05 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] phy: miphy28lp: kzalloc + kcalloc to single kzalloc
Date: Wed,  4 Mar 2026 15:28:48 -0800
Message-ID: <20260304232848.469446-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_152907_495914_7E2B9690 
X-CRM114-Status: GOOD (  12.29  )
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

Use flex array to simplify allocation.

Allows using __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/st/phy-miphy28lp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/st/phy-miphy28lp.c b/drivers/phy/st/phy-miphy28lp.c
index 43cef89af55e..fd931ede7162 100644
--- a/drivers/phy/st/phy-miphy28lp.c
+++ b/drivers/phy/st/phy-miphy28lp.c
@@ -224,8 +224,8 @@ struct miphy28lp_dev {
 	struct device *dev;
 	struct regmap *regmap;
 	struct mutex miphy_mutex;
-	struct miphy28lp_phy **phys;
 	int nphys;
+	struct miphy28lp_phy *phys[] __counted_by(nphys);
 };
 
 enum miphy_sata_gen { SATA_GEN1, SATA_GEN2, SATA_GEN3 };
@@ -1168,16 +1168,14 @@ static int miphy28lp_probe(struct platform_device *pdev)
 	struct phy_provider *provider;
 	struct phy *phy;
 	int ret, port = 0;
+	size_t nphys;
 
-	miphy_dev = devm_kzalloc(&pdev->dev, sizeof(*miphy_dev), GFP_KERNEL);
+	nphys = of_get_child_count(np);
+	miphy_dev = devm_kzalloc(&pdev->dev, struct_size(wiphy_dev, phys, nphys) ,GFP_KERNEL);
 	if (!miphy_dev)
 		return -ENOMEM;
 
-	miphy_dev->nphys = of_get_child_count(np);
-	miphy_dev->phys = devm_kcalloc(&pdev->dev, miphy_dev->nphys,
-				       sizeof(*miphy_dev->phys), GFP_KERNEL);
-	if (!miphy_dev->phys)
-		return -ENOMEM;
+	miphy_dev->nphys = nphys;
 
 	miphy_dev->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
 	if (IS_ERR(miphy_dev->regmap)) {
-- 
2.53.0


