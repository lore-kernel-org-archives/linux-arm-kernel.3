Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D237CC02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 07:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=11ZT4H9fbLzjQvrQILyhKp3+cau0oLWEvJGvUrDp0l4=; b=nbjwBJjfJt5wGGQgiqJ8W21KYe
	3OwPJKlk49SxB9/qqOVEdFhYJHWj7KeUytYK4hTvgXzxUrqyppSD66Q6fV+X0zr6OTapw+lEvLTse
	4nQR0Wjm5cb/HeTce8B9MZyVXxAjVVRwF+jLb49vojboY2/E1niGAXnVVw3imw4ouQUcttKAYDf8x
	1Eues89mBR9H9+jOR/PQzWqpU49Bcns924QPM7jvZcQbV+YXIVYy52/KzM1JY+U6ys2Vjo4y08igN
	PRNW6GywiC+MeWCYXd7NjQQ4n/7cJXSzS3T3/oZZh9YMgC+Bhj6cpLyG+OwUqu8b5XPnlIlZnA76U
	Tx2LUOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teqRJ-0000000EgD4-1nXd;
	Mon, 03 Feb 2025 07:00:13 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teqPw-0000000Efza-2iwt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738565927;
	bh=HpKfWals6gvV6hSueqjY8CYDxxN+av46LngYDKJxyFM=;
	h=From:Date:Subject:To:Cc:From;
	b=MKS0AEph4ruaq7mgzdD4DiyBe0fsD3DfkZfQEONyIEwK5XTjQgj8ZyBwHOWJPC5zF
	 JuYlVINMwOeSatdGmI4X1TCbPpx1SSJBs+0AUCRRnDFzi2QNnXjE5+vxOwEDNycSd+
	 tH2t/pfzYsZSMOFwytJLHnC6mhCy0Hj63WqEI6yOnsSR1vp6PnZsVB+qHl6nCSPhOs
	 w/ngwnq53plL0W/SELygelKof8eoWDLn2gbxY51RLvouJAta3auma2RZyxI9Hb38Ue
	 fgR4xElybZNReb8i2Q5d5GcRdRagLX8PwRPC/43i3wulLooiSiS5SyqkJ1AauCBps6
	 KfdOs0PipAWNg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 85A441B3
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Feb 2025 15:58:47 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=h0OGA4s2;
	dkim-atps=neutral
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id AFA2D1B3
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Feb 2025 15:58:46 +0900 (JST)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2162f80040aso84406915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 22:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738565925; x=1739170725; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11ZT4H9fbLzjQvrQILyhKp3+cau0oLWEvJGvUrDp0l4=;
        b=h0OGA4s2eKXCTBWY/NF3yYeWm8AKVirFCm+87s4iWVqVBT2u7Nh6qfJn5v1s+cl8Wq
         dtuaOqKNJ4FdnJ6wrgShpLfXgBsYPIa9VYlc82axHFwMLrCbWmZgVn4SzgKLQ0vlCl+c
         YwiZxUhs1yBjflzLd80s4CrDVDNbOGVyy4rZhYn6cHlbvO6yIw9C2jln1rPq2nulr+9G
         AmNklzZSBg3o+sOFXNfOSOKjKPImYToJInJGiXh+mYF/NzF3VV62hBIFpuQGVkEuMS8l
         I3QLVomPMQ6RrkigChxYM8nmvCyn4XxuWpyWb8Zb7FKlthNTTWTuYtYtLT3DbrvrAjIK
         NnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565925; x=1739170725;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11ZT4H9fbLzjQvrQILyhKp3+cau0oLWEvJGvUrDp0l4=;
        b=ghbYpJeCTfTlZVxs6Se6kQQuxJc0HvaByNmYcTZGeBnm6GW++mLXvT1HeD2vYAq1KE
         ezDBgPHhuc3Lct4xnClwd5/zclX4gb+hxfh1EXhX6ewCmS9u17iAWQ8B07BszRXMmRsw
         zK7EJMtvGAH4MHJRmq8IuzOyDwQjy+hlDH5o9kmZRbxUb+qwIpqS4V7uSnEZADK4icpL
         reH4UtxLdFUZQsLmLkicqiUdulg24s5k2Cbug2gnOXr/4XxPzr+OetnRBNKR25z8Ed/P
         jXNvHqK0MX4SEc2dEy8PcxyWdRjrDWmtxu00SH/BpfnfYetVRk7tTDqmeCeLINomH02E
         jz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/3gtytcQLV6141UIglfd6v3jSCWuwEMZHdv1Wd9+KKKjUlu0A3neAvS/LeKOWPuiSBgZIXCTx9u4guGcLdnpH@lists.infradead.org
X-Gm-Message-State: AOJu0YyeWO4zZnv/C5AOhspvPPDBbMXcbCh4DBSxj5+FkkrYMbN0BS+O
	gVxrbm42u0dDLVjWi53C69YTxmydt8CFBhmtMr19b7LaaSvQuuL8Am0HecPQCKOdLe5rF7nmNj5
	4A003o19zO+2iShmObcAwIuAy+1TirLOj7jVp7lP++o486Dk8Dp4GiVK2ZTf9WNIDj9uMMDwrbk
	eJGMqX3Q==
X-Gm-Gg: ASbGnctDmdj+5Um86zbIAI8L09b9Z+k6ZzElyVoqLtSRgFVlHbhGAeKgiObB/hTeW96
	huqv9ymQYLEMqRUdlfdSbjl8aH3W77RXaA8Xt+Hcb6Bo9+qEioL6ssNwLCBlLJTHcTOJmjU0QZ7
	6kPB+aPBxg3jb9n2V/dOldtJckZIv+5COqjWyWPe+5As0eLZ+isGtkpLsYWNpYi71ZVQcGkMFkj
	/N7KVI0XtE3VD0zRVmX2Fy9GWkj5nTv9QxFEfYlsluw1T0y6u3mk8wwDpiAa/RnwSFwx7Fy5fAS
	GTTVRstkH1i25yKBbGbDHi6d+BWWuJyBR5YUf5eZTb1xF7//yHZ02vsBmpzME149
X-Received: by 2002:a17:902:f54a:b0:216:282d:c67b with SMTP id d9443c01a7336-21dd7ddfd33mr363334375ad.35.1738565925805;
        Sun, 02 Feb 2025 22:58:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtPhFFH++bFRKPkUR0RSviTIbqX4KaViWw6lqaxHu4nVbbFwJqQuzm9j1D4TH/k0qb9akCSw==
X-Received: by 2002:a17:902:f54a:b0:216:282d:c67b with SMTP id d9443c01a7336-21dd7ddfd33mr363333345ad.35.1738565924336;
        Sun, 02 Feb 2025 22:58:44 -0800 (PST)
Received: from localhost (117.209.187.35.bc.googleusercontent.com. [35.187.209.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee774sm68121615ad.41.2025.02.02.22.58.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:58:43 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:58:41 +0900
Subject: [PATCH v3] usb: phy: mxs: silence EPROBE_DEFER error on boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb2-v3-1-428182286ce3@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIACFpoGcC/3XMQQ6CMBCF4auQWVvTTnEMrryHMabAVBoDJS02G
 sLdLaxx+b/kfTNEDo4jXIoZAicXnR9y6EMBTWeGJwvX5gaUeJIotWjZcni8Y42CGckSGalMC/k
 wBrbus2G3e+7OxcmH72Ynta67TFJCCdREFqkkZHk1U2/CS0zcdIM/Nr6HlUv4n8BMUFVrU5VKn
 5XZI5Zl+QGqRpKf7wAAAA==
X-Change-ID: 20250203-defer_usb2-ee26f66a01ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=HpKfWals6gvV6hSueqjY8CYDxxN+av46LngYDKJxyFM=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoGkiGAgewFMK0YZ3yZfvnyEBWvr/Xmg4ikJng
 7cJqrs3tbOJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6BpIgAKCRDyimB/1oxx
 B+L+D/44ciLQ9mN59Ny7bJdaq49k967IpOp18rI0KfriGa69NjMQEO/K5y3wjcY0TPuzMKilRvD
 zyBNlA8L166gDqfeFgLcQU8HXTM/3SpBBDhobiqwlPa90oz2i3q4aloqI342t1FoVHDufKB+cbk
 +3WP1FRNWHoueXQl1Uw/nehPEXdQB0gT/9FlYPNxg18gSy2M+eCXUqF2iPbYnTK4wrNgH/JUMDs
 I54fYL1X6T+oBi8frOQoWMpfXOWJ5smH8VKsw2QNOQw3LhgvB22N9fiiHjBOHiAE08D4rV9PhxA
 mNAygFkK1hI/ZU848NdtLKZU13IvB59c7iLgZG4IxaOE9oyTs2umM/TPftO/GgbLFgieD1SC+ff
 vdXd1bO5AYiRxryP4gQ1yJr/gxOjogvm+YmbHxiqjyaucTcJ7pedbig2xcwG7QQ+vzL/+oNRa19
 BLjCHARSk5d7zL2C+v+n2LpoUxmHy2hujw+HWsTmiA9Da+RVkPwDnhsCkfF+wsM6Wc3P6qmF7UG
 mgWiw25TJRPAezrkB4ymMPDGhTwhdvZmBxuOGw54Thh3GZ8FwDDSfwQsRPIemF/0bq6PMRDa0ED
 ScFwDUH2Bj70a2eFTFOMnxobUmPYM12xwMb6b2K1Cffl9DKRcqpK0aaxRsJW06tsFmNq2uhs3va
 E0LB7IbIEf+G3Rg==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_225848_812521_C721CDDC 
X-CRM114-Status: GOOD (  15.75  )
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
Changes in v3:
- add trailing newline to format string
- Link to v2: https://lore.kernel.org/r/20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com

Changes in v2:
- removed redundant error message and now useless braces, thank you for
  the quick feedback!
- adjusted message alignment (that was also bugging me...)
- Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
---
 drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..7069dd3f4d0d9433d62d3c3b494c2f99858e1899 100644
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
+				     "can't get the clock\n");
 
 	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
 	if (!mxs_phy)

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb2-ee26f66a01ad

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>



