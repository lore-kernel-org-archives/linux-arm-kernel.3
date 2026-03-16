Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1773F506CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F1b1jbbseevrfxoqPkF+lAWkN6R2Yw+sAuGiH3k9yEI=; b=axGmjaHUYo/Rfy5eGvLHOtA3XU
	rZk6WIsJqLmegZBQ98nJ0YxblEvHP6RU7VUaBW/rgCf22PpJ4pwbjUuQWcJ4CzId1AsOWCNmHmSw3
	+pVANEzgnhpFa1kPw7EOQ8QSgom8I+xNdO6qRfYMRqRLi4SJ4Wh9tuGSH+8HYYRLjsEsOQlietVWZ
	xapgDSutoobf7O+aWkr4A3dqZG2JLnScFQa4dr1xw5/i9UkdhrQBZRQdbKm3x5NjhCPaFJViUG2+Z
	0qsyG2Yc3ldolzbJXYOXJLEZJwWHsRuh00tj8ok8rrfxcU3w0KySRMM8FJ8Xjac02DY9JezhW5NGY
	zzjey4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27jP-000000043FN-2mpg;
	Mon, 16 Mar 2026 13:11:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27jO-000000043E0-0FK9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 13:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=F1b1jbbseevrfxoqPkF+lAWkN6R2Yw+sAuGiH3k9yEI=; b=PNrt8KxfEIawuhnUGRzyZifV5t
	lg/kNqhqES01G0fupyAJJA+XS4giJ3QwROaZ/Uip11xsbRoqbTyJhPO6O7v2bUgtZNnAqyLi5Ekld
	v73uWxPbuMjBT5bqHGQGDFKs7c9hoZo1mH5QS+V5OlJDuOB9EwchS9KMcyj5sxO/tPkNo2hy3Ndn9
	uAwwp8276pfyQAypAOQKODng/jE3SeOXbUdQLMhJFXiVnl8+9KD7eJcwRTrNRbRqWIpSYhSdY3Enx
	uBAdH8qeQ2bfYaYcD+h2ULX7x9X9i9k/7STbUWmU4HdSO0xFaeLefNlSpNWVT302agC1iK5c4bPsb
	Ww7nyK0Q==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27jL-00000006mWH-0Mz0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:11:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ad21f437eeso36455555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773666693; x=1774271493; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1b1jbbseevrfxoqPkF+lAWkN6R2Yw+sAuGiH3k9yEI=;
        b=DaUx1jw8nQtLb0biAzsAEGzDamY7LhsL443UcfDN2nxM0K5C5wJuvT7klWWcupE3Dm
         TkfLQRhrzECIxXCL/Xxomep5qBKkZ0cdf6a0tCOrkwc6dqYHHUn3pfxp62W7xPqSMoJ2
         Iz7vgmZKJuOEsFy/GufvBhpHb/rFpgD0Q+JD/f4UpqgqsVIMaCJ/fpSp3XSahfg1jcR2
         Mud6wqFZGDLRKNpmuW8imJnIP3lWXOLvCJvg9I4p5Dkmvf5dUutsmB9LRhWera9EgUtT
         C1QbbZfZqIN6GCr92u9A3uWgJ/gtqHDwCwtF99R7fyy+lgBxYYcbkatp/aUzmZFMeIWL
         3LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773666693; x=1774271493;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1b1jbbseevrfxoqPkF+lAWkN6R2Yw+sAuGiH3k9yEI=;
        b=TSPPed5VLtrKiWdoHDdLkA9GPk/9RB8+IB3rsxFHd57xXP0NJMLyE4Szfo7ViBT9io
         qYH+oIucE066u+EOg3QSNJ7ZyesKEIzsVwN2FJH4EossuO897lf3Mta9Gagq5WKUuy8P
         jmZuSYUPAeKH8cPtroaeUOQ4qGo3mLO5mowXLPI3tdPw2uWYqvrpSe5lVNtjePOs+6X2
         HCHoVRnhepYFHv1L1AT4XK9c3QYh4q3XCT2C5cDnPceJ4ABO6XdsJXmcgHdkJhtgfsCT
         2L1BRe2xc64oEphMR22cRjsgaHUI4F4uIYtoOJwWzkREsSVGc4XglwLaMK7rmvUe02p8
         0DKA==
X-Gm-Message-State: AOJu0Yy5k1ZZeB+6hR/9wnj11tkHz1jDcf9E8UQ3j1TloMH2Sl7NvFT6
	uHVhzAxupCL6IMbdKCzJyBYCt23SW1y4ZUgtw93/giHYql2XTblCp0p6
X-Gm-Gg: ATEYQzxIItM5tnie/DWmrPcltrfNEAuNRPldrihKc+LU6+irardsHnl9ARVC8uo05vR
	RhwXg6T+piIw3EMAYgfE+7nz8TWrIxYbq2FQJq4xL1URtkgN0EGzezMXwl4QpzXPCTYSlaTvRyG
	GnZKkrrchaI1OlD+fY8pOms9317hOe7JxiaFl3WB0MyWpjMPoyneFdP91hJjiYky7h2GX29VU1w
	t4WY2TkH+eAGYL1pSKcH64y7r9eyB0O7VS3z8yuPza+CTUD0vXGuBzztl01ldjbgjsh7lcSG2xk
	VMIrAar4u+5eJNEPD6pVsuRbgG4JCYHGz78PvFxR/cdOiQp9wdUMtxBtnztWbtihyOKMW08z74N
	/CrlSDQThKRDgjlhqW/8MWcg5sdNv3ch4GGuJ1LhzVyzcUwiWvuyV+KPp7g13HiR2eWfl7zdysc
	vjtJ9qB6tqdGIz2I2XgjnSjU4BJSzAUsdr/EzI
X-Received: by 2002:a17:903:1a0b:b0:2b0:4d7d:fb9a with SMTP id d9443c01a7336-2b04d7e03famr53040625ad.26.1773666692409;
        Mon, 16 Mar 2026 06:11:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee3d6sm110144905ad.57.2026.03.16.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:11:31 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 16 Mar 2026 21:11:26 +0800
Subject: [PATCH] phy: google-usb: Fix runtime PM cleanup on probe failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-google-v1-1-30a034e87a2a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH0BuGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3fT8/PScVF3jxOS0RKM045RUyxQloOKCotS0zAqwQdGxtbUAer6
 7BVgAAAA=
X-Change-ID: 20260316-google-3acfa2f3de9d
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Naveen Kumar <mnkumar@google.com>, Joy Chakraborty <joychakr@google.com>, 
 Roy Luo <royluo@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773666688; l=1551;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=grNch3YEfme4XX2YLfL8Yx6byNhRmXe/JTenfdWfyZA=;
 b=sP8QxL06sH+Slw6m9BD5RTi2uMzfGj1T1foGh8SmtqPEkOB/2wc388Tqw4bIOUUQbOdBNIIz3
 MNRj8JVFU+DCPWHNmwF36TX1jYZZ07sf5SJyoMTTGKZqzD3RY82YNH+
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_131135_247607_F79982F6 
X-CRM114-Status: GOOD (  12.37  )
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

In google_usb_phy_probe(), if typec_switch_register() fails,
pm_runtime_disable() is not called, leading to an unbalanced
runtime PM state on probe failure.

Switch to devm_pm_runtime_enable() to ensure that runtime PM is
automatically disabled both on probe failure and during driver
removal.

Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/phy-google-usb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index ab20bc20f19e..79480f8b110e 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -251,7 +251,9 @@ static int google_usb_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy_provider),
 				     "failed to register phy provider\n");
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
 	sw_desc.fwnode = dev_fwnode(dev);
 	sw_desc.drvdata = gphy;
@@ -271,7 +273,6 @@ static void google_usb_phy_remove(struct platform_device *pdev)
 	struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
 
 	typec_switch_unregister(gphy->sw);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id google_usb_phy_of_match[] = {

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-google-3acfa2f3de9d

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


