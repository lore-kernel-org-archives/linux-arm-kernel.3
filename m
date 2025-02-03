Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1E9C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tIzZOYUpu+a9dZG8GPKM77gyMrEbYFRg9tCIw5HJ87c=; b=gprNd/hZmCOGkvZa/DM/LV595G
	nxTt61pkJXVMHVxoa64fUUT047XTthZLu2vy2oXm992gMN0qIc9QABDrEQVbFOY7XcraSy3jtfYWC
	IfO8UGjuNb+hupMnNq6EeiAVyOihdoCYOT8qMwNGFA5HhLqf0xFcdfjfFZdwsxt4a1sLE50/z21od
	9BHN4mmJhE5m6hmA6Ea0xfeG1lLOMewA8mWjCUcj3EX9JyKdPUOZ/a9AcGMxOpuZleO6jpsBcfywN
	IWhPocTmKZ2WMjRRmlCbuBlIueB2XrlCe97eisd3NpBAh43XPlev+sI9KZHqpBChC9g4iIDTCQasI
	DE/7OoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teq1e-0000000EecY-0tTZ;
	Mon, 03 Feb 2025 06:33:42 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teq0K-0000000EeZ7-0BfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738564338;
	bh=FJMF8I5ajPpN5Y2/kDQ/re4S2W3srhBYMde3V9Wgc1U=;
	h=From:Date:Subject:To:Cc:From;
	b=VlV9tDY9G7jj5G081F5exjxom4xsU2HTL9jPqWWBTYxPbMpS1Opiy6OJ21NHQaB8i
	 CTq9QqDT7l6G2ZAiMi8PbyxR/6uBCAhKrIOxo3B1xnpPP5bL7cQD+MlmAIvbS73NZY
	 0UVOQJgFvecHVnk8rFe+LR+xiO0DsikQlljSZCI19Ls8M/IqKi+gzJJRGWxYtWwJL5
	 Dehji/xPHfMgD8l2e/PfUm8jsgqQKq6W2mdwRjAfReP4TyJEDazSqyoy6v2Hzc728j
	 se+S3z0QDKeEQyhcjXX12l0PR7N2obhA9kkvt3X37mIhPb/2ZO/ESxhhtWnbVNsgzp
	 Y6f0M2CLftr9A==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 4CBF135D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Feb 2025 15:32:18 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=PldBml35;
	dkim-atps=neutral
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 1ED7435D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Feb 2025 15:32:17 +0900 (JST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so11714656a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 22:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738564336; x=1739169136; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIzZOYUpu+a9dZG8GPKM77gyMrEbYFRg9tCIw5HJ87c=;
        b=PldBml351ana5lOzp/10fJAP7+29RO9NqokERo+rJPCZ1BJSiPUXbm1JzPzY+UMrDd
         V66RpZdepade6avxSiu4/X7BO5oKf+LeFzcv2G6Cow03yVmBgnRoWNcbzUMoeVUOhrKp
         QZUAmP4s5aTIU3j48Su1ZTUHv9FbvPKJenOuZDAxI5U8Gu6tnvwMvI6BhPG8KXEzkGsn
         clXZ/iJkguv/o27/fB2H5At4C6BiTzvWYGAWsPIPnG2R/+WuTttKofX6Ht/UPY9o2p5o
         p8YZqnmcPw4dKh9pb0KPecdzibntStxqX7t7LxjsqMPGjV6CGfFR2qdlT9hd538wP485
         T87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738564336; x=1739169136;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIzZOYUpu+a9dZG8GPKM77gyMrEbYFRg9tCIw5HJ87c=;
        b=VS83q7llZ4fO+8E5Ci9nXo8P93j78RyYHzrwEt7g5qx4JEP4DSSe/VoiEqItUcm25C
         TiPHU3r96MrHxf9q7pJbQKdvMQdVEZ9Ye0EHdFL3ZLJgUFm8wSXqW09tWj3J1mMhs5SY
         m3r2R9Itdbn2hg4jQOsNQDe8Wpy0td5fcuI/ma61bn3khBDTZB/HInn2M4Fx4kFCYpUj
         Mx2e+b8SeN4QGALNax2DsRPAvtM1wdv5pNduhjAVMVmG8Lcws4mPvNJMl+FAJq1Xjw0I
         1LpL4Sp4FkO971UDPfZtZA0T3VyDz5C3nGJYoc7LdKl94+89iUoliIJlQfhJM4mh120X
         Q/sw==
X-Forwarded-Encrypted: i=1; AJvYcCUClfANnnOrDWAU2i+naGivvRNcUegpCFpNJku3wya57gW9V3plQrRdM0ZJFMhfGJ1UqX3iydAiJBaLPSoe0nPp@lists.infradead.org
X-Gm-Message-State: AOJu0YwtBTFhH6cxyBAzn7DmpUIZtyRKWgBgV7UIzuAV8yZs6uC9osVN
	XbwxOcEiy07FAUyY6kvhcN/GnuHcS3JdftkhQ3H4en6ltsgoHfDmCkqyT5HysyQaVawUYx7AsRH
	hYPWBUVlSUlqt/Y6FyINVwVQhOJb8avlEsf0yRRyJjlpa6jy/mNHBQTbIZuKaFOtj5ekFHM9CxA
	==
X-Gm-Gg: ASbGncsoOg959TZJyq1W5MT58sRy91pXRQZ1BSidO8OU2XsdgvMyt/BKAKO7Nug7Iu0
	9gzhemMJJ5aL5MrkE1ULSwQ4pzrb3iPoUa14bT27569U2AUXNAfXkDjc47npjVCbYQv1sYl8EXq
	zNE3tnLdybWCryGeEBB5taRxT5E3SWzpSNFV0bGcBdwPmAPRH9iqTeu66ZxHV2r0N0LZzViQJy4
	4v2zxQlRSo1phMFlSo9h8SdiOg19aEK0givcz/jahf3zCjs7tPUvcsRv0gfQ1cvnVFo1gZr7tdW
	Rdar/gjZzoyk4CvrJKuZdfDR9LXlFoZYTYPDM6awkKabv8vMaa/Nut1Gi89rm/SC
X-Received: by 2002:a17:90b:2b86:b0:2ee:f687:6adb with SMTP id 98e67ed59e1d1-2f83abb403dmr28797267a91.3.1738564336187;
        Sun, 02 Feb 2025 22:32:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGarftDjJG90G7YVRs6D/mMSQKNkWuKkn3/GO4LgDIV8/LFojSbEyi2eC4i6UcBS8OPq8mV1Q==
X-Received: by 2002:a17:90b:2b86:b0:2ee:f687:6adb with SMTP id 98e67ed59e1d1-2f83abb403dmr28797250a91.3.1738564335875;
        Sun, 02 Feb 2025 22:32:15 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97ca8sm11556441a91.1.2025.02.02.22.32.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:32:15 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:32:05 +0900
Subject: [PATCH v2] usb: phy: mxs: silence EPROBE_DEFER error on boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAORioGcC/23MQQ7CIBCF4as0sxYDU52FK+9hGoMwCDEFA9hoG
 u4udu3yf8n7ViicAxc4DStkXkIJKfbA3QDG63hnEWxvQIlHiXIUlh3n66vcUDAjOSItlbbQD8/
 MLrw37DL19qHUlD+bvajf+pdZlFACRyKHdCBkedZ11vkhKhsf096kGabW2hePdwVVrAAAAA==
X-Change-ID: 20250203-defer_usb2-ee26f66a01ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=FJMF8I5ajPpN5Y2/kDQ/re4S2W3srhBYMde3V9Wgc1U=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoGLt/xToS2Y0fiRAeRpW2bj2YZIueibGgFcFf
 cRM6sb7I9CJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6Bi7QAKCRDyimB/1oxx
 BxtoEACi2GSPB02A7ekZV4EL+vRQ2dOHbU2hEUMmX+7J8QYC3sKcqVuvfrNcujJrgbN6igycZgh
 hbo51gNKd/EkiT3hr6riNqiHGIYI+a/qCN454NI8Lbmq+8KWyvSV7PMUdLUufk+FlYjNirkNAfR
 LFMrmv5tmgX/WWMSIM4vkKoycgRmGQkWDy9hllRe5xxGSwRYPcnANeNP5lABU5D2IhOziKSwYc8
 JDVCxkJpWx6VQYloYokMpVLoKUbXECo6jmgWT9nvCWwQVO526POcXkHC+pzMSZx+/0UqDBjgheU
 ZTE0jw7MXNGAj1H0HEJrq19XB21yw91CXASMwjYGbz1acu0weFz76c+dqPsxQcl9XxFo+CY41sx
 4CM3xB0VLDqt0CJeqZMMZTX7cJ6b39VGLBBy+P/De5BfBX3fNZpsIRda6Vkg3rczkRiD3+Mqf1g
 Imo11uXVPQoyO2fl/UNrf2nmvTnmvgwOeCqq7G8V/72x55fsG/Yf2i9eWI1PkgHrCwQmqDKynTe
 KNo059v1eqjkG+QzNKSpTP1EoksGtT0UtzpGI4CKbF6xSFikAjG7jquQSAObj8vrKEkl6vv2YOA
 g6tVcepqeQtZmO6d7Vzt1wJ2PL1+hnZS9GUrVBx94HFxn0wb8ZkimC1/o9pHnIJQfaHAwXvhlH6
 BxGtCdrshYkKrAg==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_223220_217164_3E2087C8 
X-CRM114-Status: GOOD (  15.33  )
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

Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
[    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
Changes in v2:
- removed redundant error message and now useless braces, thank you for
  the quick feedback!
- adjusted message alignment (that was also bugging me...)
- Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
---
 drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..39b75199d11c6f9ec21174c20d0465cb79c133fb 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -769,11 +769,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev,
-			"can't get the clock, err=%ld", PTR_ERR(clk));
-		return PTR_ERR(clk);
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "can't get the clock");
 
 	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
 	if (!mxs_phy)

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb2-ee26f66a01ad

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>



