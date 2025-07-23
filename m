Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D87CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 03:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=; b=BIJDlnWzig5LO72lI7Q/UQOGAc
	oC6Tzw8YSA3AvZL6cNOpr8gR6eCWGZLYtKojQ28Ll2LkqUtzWd/hTJmRhG5u9dbLFzm3fkp34HOhe
	kQfxX+tKMyyARVGfTLwyLaFCJ9ZPyspl0lgqwDoq4LU7KzZGt1OCDZubdS/5mfaennr/wqEZbGM/P
	LT0KRHqigB7jKPMfbMCbczXfXUCjgVK78lQ3QJKqJN66osm8EzwD6UU/1yscM0Yz6EjY9hlrAwnnN
	04MOP8CCwNr1UWfx8+dQGOYJ0ny0WBVwvfepih0ZrBY9RF04oyn1a7TtMO6/BQwo4xkHR5SZuiocC
	tVobm63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQSc-00000003wFf-2Ft8;
	Wed, 23 Jul 2025 03:48:06 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQNg-00000003vPr-1Rv7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 03:43:01 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b170c99aa49so4453059a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 20:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753242179; x=1753846979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=KnBS6p1nDKKW0PincNedDhT/jPDOPsnIcCyQ5GQksc9z8b9ZyqslVRtJBxrON6OGCW
         M9BqCgVoegXSQrLyLmUt3sO2z7j54iriaZPV47a+8W22oPZYw1/SqrHeOs8v7QBaTCeU
         3Q2NGENsLBrn4hqVu6vfuvEBBQmZWt1bEadjBV5iVXbTRust5dJxsEUaDuUoJ8dlWGNu
         9/2OBiTd9nafNOkUd1MrvkD4JP33LNErJDDI8BoVNlWlfkkXHCuuLYl9QCVClOl1PjNZ
         zmZGq02aDmcutu6JzEZp0pIICsASz3Ikzt1C36dRMFMkpaT3M2wqaeOltAmz8EaJmJLK
         kW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753242179; x=1753846979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=LDxowh5bC1zyrm+OqAASJ64IcI5VqEf6X4e1ctig2SGxsVES92nqtyJQBaOt4PlYO1
         xWf5qTRhwYkNE6/Yw07Zha2C1IrQvQ/kY58wWK5N0UMU8syNWtN4Z9Y2Q/H4psVJwrCu
         dENwwqddk35Vqh/mJ9ibJpf3OyYNuzjnvOCJsh45F1zS6kpJd++ncHqIwtf9BVtFRCNy
         Z24qtzlWpTG5pNKa4OrEY2aASNUqamZtYpbLaH9o+e7lVfvgdFUUay+Zf6R7jJh1vExh
         nmdnsu8Jg/v1cT9mpoMi7JRWTpYaOTek7p67cpPg7uy0IaaCQvGuASQw0gjHOysNmYUD
         FEhA==
X-Forwarded-Encrypted: i=1; AJvYcCVYK0wMeheYxQcty0b5qdGUWZkhGBLkwFp5H0stirTFXv4ddPn55spC06sWLG/O5GKDbx7zybz42H2Q5b1Hh/SW@lists.infradead.org
X-Gm-Message-State: AOJu0YzixlKQHA1b9SYdHlU/ZD5Xb3xcYkS+xajpw+NLH0GESOSR7jV3
	AYwi00kTBJJNNvcSd47r6OyYDp/j6rQB7fJ8YK1t4CSpkjkcocJUWvq3
X-Gm-Gg: ASbGncuksDFoKggDz2HRQIp8zgbVgkCoSQhCvB8xpoe77cuxXFIhTMMVJIjlUqZY3Si
	9gjeI1zkzkt37OS+6nxiwY7HWuiZ2iOit3Oz0Qlb4n29Yj53NO3uQYQ+cw1yQVCp/m8sojTIliJ
	xk0wVptdSl7aO6GDBY/OCx4GFqacgejTQbruha3RLm+9NkGTyrbsNAZUCjISk5CU/zAbIDgrEtQ
	x8JT2cxgiwZ9IGs+i8qt7sYZlNbI1oA338DEeWC6L7UR8s7IER180BSpQ427oGhDy90ad9sJBxk
	vixhA08ZqchIOa+0pgxDkv72NUcrP8Nm1ktrhjmE7hFBEXvD/ys2fe1W1cvUQhFR/UW1r4uW0Af
	oo7lTv1i4otJ/fpJKd7XYH8I++9NHMnkyg3e+JvwtPL25uWQTG85C272xzgCc4hOAeYw=
X-Google-Smtp-Source: AGHT+IHHjKFVRY0n3ORvJ/3tCcnOK/FTC9oaQ2WPdkygTI1KPwN0ZyYuDsFX8L5lqzEAzGwyYH1SkQ==
X-Received: by 2002:a17:903:1b63:b0:234:986c:66bf with SMTP id d9443c01a7336-23f9814686cmr18960685ad.11.1753242179340;
        Tue, 22 Jul 2025 20:42:59 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d47sm86197605ad.99.2025.07.22.20.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 20:42:58 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 23 Jul 2025 11:42:40 +0800
Subject: [PATCH v9 1/3] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-add-support-for-meta-clemente-bmc-v9-1-b76e7de4d6c8@fii-foxconn.com>
References: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753242171; l=933;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=UnfBA/U+nB3GVshcJhQl74M74uA3eyzQykqLq1TeLXk=;
 b=+GgM3+LvWhnm2FqtnNygp4YoEvMVXUlT8wog8dP/1q6l8MnZguge5Wl9WcS72UyfKkcvYZDhm
 2Jre0Fw6cIPC0FdWrh7UNQvuzjCapzC6NV2twAE8FkKulLeqiGmTJI+
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_204300_388226_7DBC9998 
X-CRM114-Status: GOOD (  10.35  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


