Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386DBCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ui5tTWxJ24mYLV11DTjF2SiOWTz6D5IXHniLYM1RLCw=; b=I87g2gjMCcsmnls2gKS8zTNxjV
	e4PmUD34hq1b8/ByUYpJ4gt/iO7Vgir9+ObOzGNJG3W18567uNeRuuX53fF+0fGT0rn8D3mkQR8yY
	wQt3nSjgWbPHfiuHFZLKewMLeEcGjT3n/4U2KFTNlOc0qpePO2qsrfierFyNU+nVwOs1AaVEAuUfM
	fvt9CZFNporTWhdF3eSVcYbWlXwzjtaB97P4HIwMSkDyyKX/cyqJ85XV83KsRYdLHDozIJdKCx+IZ
	jMNgh95M9gUR2Aq6auFPkyZdxcOosLXCZmbG9US+6KExh/rouOVVpZNbM75Jz9RxCALyCqODEb9TP
	ZNj86JWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEw7-0000000HaMO-31rf;
	Thu, 18 Sep 2025 13:44:35 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEw5-0000000HaM2-2OOP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:44:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45b920a0c89so4520595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758203071; x=1758807871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui5tTWxJ24mYLV11DTjF2SiOWTz6D5IXHniLYM1RLCw=;
        b=WZgN8FL6yH/PnzhdO1KIFDn7Hc3IZ9SzPPJcq9FYfalYsSsdM6fa245C1Yn69xI+B/
         qh/0Qp4KXyilL0XkfHrB/U7FQTTx5aDZL3GxD3U7Ezr2jTG72DOh8QKu30jpOyRDx//S
         cMeP3N5oQpOfWNj8ACmAXUDJgnfuL/2T7B6fklzIFl0kGxax8n+tDve5FUqATGRADvZl
         avy2OL+/7G/fQi0ADlHk0NO/Xcj4NTr7C1nsVwMqys8vpwxmu0TPC+sPOG0afqPok/3M
         fmwHW+vjbLhuVk6PQy9UPf8dM0xCIoVTvmDL1OoB3HKOCzcSzWV0ARcw4oIigInryWjX
         OR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203071; x=1758807871;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui5tTWxJ24mYLV11DTjF2SiOWTz6D5IXHniLYM1RLCw=;
        b=YOZKaV9opy44MenTPdskzFQ4mSmw297teawDuqYss+5X+9EAfqWtOMJAT+SA/L05ZS
         zhr/MqBnmqxsTKKskqBNYf7HYyg7N10gr/6+6T3j4fa94nS91fwkWj39Q2eAc0WAq7e3
         zETrasRiPbBStE6Jv2jPOiqNqTBnHa68tY8FBSv+exYt/+BpQNF6bw7FVWeNmtzClPvw
         bz/ukljHvsRspg7T8aTVz/evQ22tYfl1Bz+c/9no1hK4JRcbjW1y+jSHyyNBStZBhqOc
         SodPQXs3Vj8GdgfaMFvtMJcDbeMa9AWuTqLS08DwLrGdiL+aj2kvrKi108FnC2GHIDVS
         jQsA==
X-Forwarded-Encrypted: i=1; AJvYcCWfpc/deeJ1oeX47siK34mn/Fm+pJxOU875RvPh4hJ9z+YundoAY1ounAqB2cjxMPwgBLBZmhIM6Ab/NGeuZ5yb@lists.infradead.org
X-Gm-Message-State: AOJu0YwauI3O1zXYX46SP9G2VMU6yWkA6+LSXP60Zfa6fAYsRTAgGVOd
	30LM2AWGBxFMl4Nh88o5yVwCF5DrsymtBC0PyyRJ5LMYherSRmAkDUVsrrXMaRZD26oM1neqgKH
	Z4Uw+gKlOTg==
X-Google-Smtp-Source: AGHT+IEkBbKrfoI0H8uPH3QdEl5PEuuy96uXEpRRSsfVmacTDuWG5tsTGBzmx1eB6WxtriqBAzOrNhmtQrjf
X-Received: from wmbeo3.prod.google.com ([2002:a05:600c:82c3:b0:45b:6337:ab6b])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4511:b0:45d:e326:96fb
 with SMTP id 5b1f17b1804b1-462066563e4mr65848755e9.30.1758203071419; Thu, 18
 Sep 2025 06:44:31 -0700 (PDT)
Date: Thu, 18 Sep 2025 13:44:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250918134429.270814-1-abarnas@google.com>
Subject: [PATCH] arm: make sa1111_bus_type const
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_064433_614523_4B0ECD84 
X-CRM114-Status: GOOD (  13.59  )
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

Because driver core can properly handle constant struct bus_type,
move the sa1111_bus_type to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm/common/sa1111.c               | 2 +-
 arch/arm/include/asm/hardware/sa1111.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 3389a70e4d49..04ff75dcc20e 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -1371,7 +1371,7 @@ static void sa1111_bus_remove(struct device *dev)
 		drv->remove(sadev);
 }
=20
-struct bus_type sa1111_bus_type =3D {
+const struct bus_type sa1111_bus_type =3D {
 	.name		=3D "sa1111-rab",
 	.match		=3D sa1111_match,
 	.probe		=3D sa1111_bus_probe,
diff --git a/arch/arm/include/asm/hardware/sa1111.h b/arch/arm/include/asm/=
hardware/sa1111.h
index a815f39b4243..90b6a832108d 100644
--- a/arch/arm/include/asm/hardware/sa1111.h
+++ b/arch/arm/include/asm/hardware/sa1111.h
@@ -368,7 +368,7 @@
=20
=20
=20
-extern struct bus_type sa1111_bus_type;
+extern const struct bus_type sa1111_bus_type;
=20
 #define SA1111_DEVID_SBI	(1 << 0)
 #define SA1111_DEVID_SK		(1 << 1)
--=20
2.51.0.470.ga7dc726c21-goog


