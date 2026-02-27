Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C54FEFB6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7vc13IY7ZLjB19K/DPnMAGdw1kS+zbTwHhwRJW3V8k=; b=zl7LKQTeut8nVA+HFcQmzKw6sz
	yyvMm9LZGyMFb35mZ4zbfLyu6OdbtIJDU5P7twlKKdUQQSK/xYYXomPE6nikl8+JmhDJYTrs3j93e
	9mWA1rItv5ZnkoeFVhgfkZ589k229YPTrMFz0ZAr09z2olQC/dT4FyJeFAPqWDdSDxUkCX90bUSUV
	/WJ3s7XbXSGGmoZm1Kayj5DeMsJ3GnqwdQaDoOtTl5QJwFQQ7lvnQN6r7a+qo/1aqWSQom0Ac2fY5
	wtzumndlJ4fQ6cAVbhRiTnCNZLlxwlYnAP7hR6OyiKx6aAVNAYtQ9JCYDVxaT+bZsSIsFWffbgv02
	uX2CJGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0EO-00000008h5D-08wT;
	Fri, 27 Feb 2026 15:58:20 +0000
Received: from mail-dy1-f172.google.com ([74.125.82.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0EK-00000008h49-1XGd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:58:17 +0000
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bddf5091c0so2087799eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207895; x=1772812695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7vc13IY7ZLjB19K/DPnMAGdw1kS+zbTwHhwRJW3V8k=;
        b=ELC5jJRkufK4ZVy3MUN4aN7Cv7iXKEwAsBeNsvBIUcS0UZ1/BD3LUXnwmpCKc2ZOzs
         SecZU2wkmNE7QPKj0UYXrGDrKiObwuFcBw+N8RjHcI6o/MQzWTPZYdCbHzBpSSP6MRKG
         SCIsadBSibqjq7Ws401TxgHzD/CXkVlQRf+wK32nUmIxWFujSPpIbMSi7D3rQhXA/P0M
         7JmBdiJw9gq45+fYYF9rGvqW1eYcT9wiHJyWb9RLWTmZTwSCNGAZI1erTHohAyVfIsWd
         C4EHz62ASC13yirOiBfMutNCVk0Zl+CcohKHtfoxQ+c4t5qOvHw/c/suWDk6Io1LoofF
         HzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207895; x=1772812695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7vc13IY7ZLjB19K/DPnMAGdw1kS+zbTwHhwRJW3V8k=;
        b=SuCKkFxrtebVQm1eeYjHc6E0a07FFxE+HJw684m5WALB+oR3qFsv1UYstlEiKHhXV9
         iPMsk+BP425+BPrV/47juf53Nzk7g2uXR6WK9L1kWcrBnBud7qYBV23Zua7tw1OdTDrC
         cOXukHHlppVrPTGBVEwyKLs1TxEpVk+sVHEObi0MO+NmevuLUnf9SUWHuGzofg7yh/dm
         jsJiqX5oZWahWbS3Vleeqeq8gMSBGSHgUuNjCaBS1XKfqdVFiv29jJMkfC6X5Ukdm7kb
         QD0yC8IteIut8zDpaDXMN5kWZC5JLuXacVbtXtqiM3mkc88ZkzCMLhfIhddgoh7Sou6m
         wa6w==
X-Forwarded-Encrypted: i=1; AJvYcCVJfXP4EoqW7TWrmlpx9JUmyntnQCEzIH9fYDFejdAwTI54jH+Px8WjMxInJt8oPzy22t+b5iA2ge68GFfwaymp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/cRLrQKMDWbNqpqeLm6GTvVN3q4WzGAMkpHp8zO5YSci5JR2w
	4lvou6oBrngmGKaxkjNHerIaOfmbDA9bW8qdtanUC2JoZoRl5MORVAt0
X-Gm-Gg: ATEYQzzYMVRZhlgKw+MlWMHaMmCTpd2YwUnvGzod6Wvdgli+cKdaeW4RekYGhEYZaV7
	pP9sZuipAPZiBL87YXVmZHM2IdCa95rENbOLuCZ6AZPreiJfJtioByru+8Q/ThSyXnH5EI4MD5l
	dfGbLgcYv+oTVJVIXsopjkzqoyJ+Vr9kgoz5rKAqpwZp3+ng2OKyyEYRy3p9AgoinftGckgJOGf
	QNk655Wm57xgjoFKqqUYj2eliXYRQc5GRa94t+isRvbYJkhMWXgGwnK2ESe1GjZSgkF/f6rUZjp
	FfORqhagXDFyMW7Fh1jIFjUa76NFAnFOLVSVywbbNWQ1EL8vrnfTkM71L4yfz7Dl8k3QnQxvLw2
	g5pMNlWKGrUKicY7WjMpBUijAXT+Eg9ioL/OjgaoGyGDtuOHOi8mPyZ2WQl2AptsiloRHX1iJ5r
	57/r00kCbiXdniU/p28QvggIxVa9DIY/RXZbWY3xO1vGrsFyrBoY12LqoP+DgnNw==
X-Received: by 2002:a05:7300:730f:b0:2b7:f7f:6ad with SMTP id 5a478bee46e88-2bde1e842f0mr1484815eec.26.1772207895222;
        Fri, 27 Feb 2026 07:58:15 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cf0115sm3833508eec.8.2026.02.27.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:58:14 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Fri, 27 Feb 2026 23:57:59 +0800
Message-ID: <20260227155801.211376-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227155801.211376-1-jerrysteve1101@gmail.com>
References: <20260227155801.211376-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_075816_402671_9A0E8918 
X-CRM114-Status: UNSURE (   9.23  )
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

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 9e4627f97d7e..e6443c266fa1 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -901,6 +901,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: TaiqiCat A01
+        items:
+          - const: ultrapower,taiqicat-a01
+          - const: allwinner,sun50i-h6
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1
-- 
2.53.0


