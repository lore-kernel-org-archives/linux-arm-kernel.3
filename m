Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBE8CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tbdz/rnk5XYs1sNxhaGSOYuYNRBLnymKQPJwzl9yArs=; b=Qm1bg5DG6eNCkn3YjCzh7f/TgL
	3BlmxLFFa2J6IYR/G65hzK/co7Fa5md4ryg0p8xU7Tn+RPE9OD0VNmWvKHy5lS6PVtcL8aEJxNzcV
	mk1tr8B7SlR44b8kdYWO9zA0rnu92wPA2ecbElRMsooa6gdh+3A7adKLvotmqedoMtSYOttUe2Tuu
	0ztOjqYecYT0C60g6fxviaNVcPgqan3Gip0ruzW5okz7Yzfvz+tb2cY475Eyr29PZ7Pg22YEL7c0m
	Efv7JPBFP4+byxgMcpnLGU5i7etbvR4mxdZOZGsx2tqi3gAqfScZcQVDYx9Vg/IuHYVWB79T/ZTzw
	+ff22VGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ushBr-0000000A9yb-1Ujr;
	Sun, 31 Aug 2025 12:29:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ush4m-0000000A9Ui-2j8t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 12:22:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3d323be1617so114030f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756642947; x=1757247747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tbdz/rnk5XYs1sNxhaGSOYuYNRBLnymKQPJwzl9yArs=;
        b=TttSm7AVqrDWNkgXQgXaKQqqZgjiJw7zS/jKtidInmyaIvF4YeLqOTOZUWbITRxuZl
         0q48fi43cCcN8byZunDGu3IaPhTPMd7q5U0eSbdlZ4jFRJUh5kZRqxRERmO0Io3QxhEG
         AtrroG4NSE2/FxyG4tEjvu/xKVn/Cwu7/+qkoidtIOTiTkDTpT7sOS7pXOoNnllv/87l
         o4Fy8ScAlQxP9BAZ2KvtFLP5F3RQ1CIav227lKToquvj/ZEEIyb56fl6tlzTE3lgcXkf
         Br4uGsQeTdQQNEBcKr5l72A3ijhPLExO/Pr7xIRnOWi4/D/4pGBelw+GRseZCFWfoTWi
         k2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642947; x=1757247747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbdz/rnk5XYs1sNxhaGSOYuYNRBLnymKQPJwzl9yArs=;
        b=bzuHGtSrHWU21JivRr8F/PPEk9zhRUPjRf2Xj3hr+VuJN6ZxkbdVv9tnO04NHSa9Ni
         PtyPDylNLE0tdENu0UFzgcUST2lppePK4FFOVBxBJNYF9RkKgR0eaCwIaUjCwJ4KqVKT
         J8peWz4gf3dJk+D/34Z1ggCj5THEiuLRBeAxXOoUciRJbS1HzZhbIdziy/fKUw/UtqeV
         Q+00qM7x9hqLyMi+scdXVr8ToZDAx36YtFyQTp7bEPdcBYjs3bbn/DhbZa6mqvQBtB0t
         pC0EyAk1LagExGSz4n6baJv+5I21OkT86Zio3FrD7K2JLijgVZ4DEyMj9Yy0czU5iX10
         2+6w==
X-Forwarded-Encrypted: i=1; AJvYcCWfRaB7Sd8QMp/aXTyjh6fW0HwY/a1k726HQKhDlmzTKpjN7DTztBQAU3fIGJ1SQm5oMY26t4SrS/qsjQoKoxVl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9thMKjoYF1uHK8SVBfghkrk2AEx8Kv+jldsAdxl2sN307Qeh/
	XCl0E9JSzd8II/tVNIm1MJzvTWuOUx6cDEqwbk+bvFyqfzm2hkQ4U0gMRTVGaH+fhCY=
X-Gm-Gg: ASbGncv/BHM64oz+Cm2mXdt9qHiAnjSwXMq8lfrMOyNNzF/Ry71k2dI74sQrTw3AMIb
	1NScqvSDvJa3lXO6EfFm45O+cagn7loDzjz4nWEozKRXzcKyep6lT01vV9YZPuL7g1vpW1pv23U
	hJIvWPAWUC7qQADjDk+IOcfIwGEC/ydjzc9d4nVqSl6aqmcmSW+0VwnGzTDYOJCn6NyTsNP19Z1
	fo2lhrRg0HVRwr4X3nAJExu/YLGmTJONWBRhoDLZN/CkUfH5szq01yW7QPCZBLH0y8d+joUwtxV
	Oq+3PrLisaX2MrklMQp5rBWC2DbABwC8z9yXWKWE5WExe1z9A47keSlxzQUhZ81uOAw15IyhIj8
	RiRf3Pj/hhnQq+BQJMWD7Yodl+yTaL71Giw==
X-Google-Smtp-Source: AGHT+IE/b5iJsNRkZ58Htd00eUR1h8c49rg/ihy2xqZajld0Xwde0K/MZR/16orZ6YWVgu6EdslHzg==
X-Received: by 2002:a05:600c:4fd5:b0:454:aac0:ce1e with SMTP id 5b1f17b1804b1-45b802c5548mr31769935e9.4.1756642947010;
        Sun, 31 Aug 2025 05:22:27 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6b99sm194866225e9.4.2025.08.31.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:22:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] usb: ohci: s3c2410: Drop support for S3C2410 systems
Date: Sun, 31 Aug 2025 14:22:23 +0200
Message-ID: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=v5nyT8+tGZRsO9dAtikr+4PQWjweFrMo06731HGMRIU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotD5+nEPqC2MIN8fjO2Pd41yMpJ+38QYiDL69b
 6llNeR4wHWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLQ+fgAKCRDBN2bmhouD
 13HfEACBXdBXTLrrWqCSOgYhgpk6KYuSF8sG1d7wBgJglr/sWcza2pYYGs2qRYb4pn1VFmpkE+Q
 6eH4CnJgGZsf6PQmkvKnc/kf9Oy452Iw7gpLFbWkbj0oZgd1LI3hPZriTvqrN+HwIGq7Q+JuY8i
 sYPNCHqYDXDiDDAE6R4IQhdowiPwx8VUhTA5U+RcyIqmbKuJZmOdHhe710wAsG8yTe70EnkaIiz
 51W5JdNTrXjlVEyGR2ucuQ0MlPAptnMVQEjJdYiXOGD9cNaLPbrE7Dt9mhI7Xy2CJlNnf3KRzxH
 dIo6Lwf863V4no9rAersy28ZUcte3ze4gM24jjmL/oGT04VY7yB4yhHk4YbUzk1EuYCE4dhPXdJ
 8s6mCALIBw0SeUk5uC7+gGhug92YNekj7QcmmqO5UyjAzZAnwCZN1GMDxq5JaX3JJI9K92ypb4P
 iYd240ThCF7IemH/v8ApKYEhBiDW6gacsyOMuaxvImcXEKIAaN02awiJvMVHUWKY3RFkvVsfFlm
 R2/vNaAFcAnTBLLlvFvUcZzk70dvmfmMPIaYnFr/yr8AvKQVGlNojywNHqvvHMhqFBLOq9y5gSA
 Bgl1WObRCdpuwRSKU1yTzz1Klpi5TFTlkBkkWOL0uKalgQH07Gk7vbtsFYH6b8NgnTsFD0brJFL akZAgNUk7bJsXpg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_052228_690845_9142701A 
X-CRM114-Status: GOOD (  15.20  )
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

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

The driver (named s3c2410) is still being used via platform code for
S3C64xx platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Commit subject (Alan).
---
 drivers/usb/host/ohci-s3c2410.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index 66d970854357..e623e24d3f8e 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -448,13 +448,6 @@ static const struct dev_pm_ops ohci_hcd_s3c2410_pm_ops = {
 	.resume		= ohci_hcd_s3c2410_drv_resume,
 };
 
-static const struct of_device_id ohci_hcd_s3c2410_dt_ids[] = {
-	{ .compatible = "samsung,s3c2410-ohci" },
-	{ /* sentinel */ }
-};
-
-MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
-
 static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.probe		= ohci_hcd_s3c2410_probe,
 	.remove		= ohci_hcd_s3c2410_remove,
@@ -462,7 +455,6 @@ static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.driver		= {
 		.name	= "s3c2410-ohci",
 		.pm	= &ohci_hcd_s3c2410_pm_ops,
-		.of_match_table	= ohci_hcd_s3c2410_dt_ids,
 	},
 };
 
-- 
2.48.1


