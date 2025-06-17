Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4C0C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=; b=QO6FyTGbFFpvnJ84SeiofQENa9
	wgZ4ImmvfO2NqStHn7etSCh+t8xj3jqdINVl90BsFrD2Bt9HcvXLmj7owPF7iRhDjDzn4xazMpUHs
	Ie3J1/zeZNl+VcBTjfIZvyG8uFHmv94U1kar3YlqcTxiFG1ifBL1E4gNMA3Dsu+0pQklHLEtflGzr
	c/FsFX8tvDUq2Vx/JIKvQOM4TGpakOtFUWM2UWdEf7CAKti920bWhv2IgsdFKBkLHapRQ3YLFOq08
	zOeCOqJ6RT+lK32KgiNsPNNbqTZDea0FG/aHqo9+qj0SJknuuL331f1kGWeB6IQgSCWhZow/Yixk9
	nfWyP7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRqU-00000006cdt-0LFV;
	Tue, 17 Jun 2025 08:39:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYa-00000006a29-1HYq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=; b=TQzY8u/tV02r/WcWcRPl5qabrP
	fU5UTdqnS6TVvGJK5/0y6ZD1KyzLn1Ka+a9AoIiqwAjw90ZF6CJGCHC82V9MO1kzOs2uFXuAaXA8r
	p/Qm65TkXvtb0Gi72v/U92yWmMIwNlQqpAwSPkAXtxwK29LWbn5WyYyrEqRyyrOObAT2/1I4UhCOK
	cDZ4htCAmfKNRUwnoRIiooYGalme4v1axpZHvss0/Hg01TUmk49yg6Z72MMe+8lSpF4AfvnmBf/EK
	yeg/o0HHvZ1CEGPwLcgTEnVihYkXzTQM54XRRgv6RSH5EpzTErJWkUHKlVPhGQD3gyBCZ3BE+jX7H
	iRIQlPNg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYP-00000003k6K-0EhY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2349f096605so71507955ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 01:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148416; x=1750753216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=;
        b=a9gPco95Fd3aWnW2NT4ImfOf1NhL2xB5xBlXVPKMcxjUCn86MnO0HuN4q8BuzEJ52r
         tph/PZ6AJzN8fQjMty/YFGP3XUYRWv5U3EI5X9bQtPS743ZBgjF4rRZTWkP8Pn9wjbpV
         MHJxvwsA3s++qnC+r2Q6i0zoKAF9ykFyP+9wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148416; x=1750753216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=;
        b=Cja/VtRYvBL+2MWtaZ03Rn6l6XJcqiyjZrgjijkQufcbCoK9vcr/Y7JYPzyiRBNwug
         vonqdh4Jmhzmxd/Djnx2SbxFZ1Lhhb/t1Ip1te4jX3IGh4lJkje0u7JtGqZs/mU15ZP1
         aHKjlENm68UvaxbYyqOMBoIgOHtNqZgSownT2MmB1fLInt/I/I0NXWy7kHhQtiG3crHu
         AviZW58qrCs+R1DzpTT6zQhEOlJV3rXGhJsvpEpHQl15MZYtZ5mRfb4dYzByWmfRa0s6
         Rtc1T6DeNlTwb8G0/9rB9x0Lx8SzYY5m9ublOYEosT7Ght9Evv8FTN4GCRoz5EnpBqeF
         Bvbw==
X-Forwarded-Encrypted: i=1; AJvYcCX1ndPGXz3xDnWBrb2SCcbR2HM+OdwAaZGZRvizw90ktFtAe6nyEwJDgR6ii+A3L74uFt3ji68NhbJDEFtjOziN@lists.infradead.org
X-Gm-Message-State: AOJu0YxfJl6cKeJ/gqUU40G98t/9bt5P/hUYaUDfNbyTCzYd6dsGozPN
	aFvAkUgdvfUw3lXDBbEMuXFa7Hs9H8Fa0gmrQvaPBcSRSL2UDfzyU6s128qY/CRyGw==
X-Gm-Gg: ASbGncu6sSS6mj3MnuEhxkKykQED01v+GjVPhj8QB2FLvQqlS0eQMDDMXhgrl/G80H4
	sLrgHWiXG51EAcBiQr2Fr0486oP11626etKuj5Sq8isEQT6TkFWZqidbymAhCdbuFqijNbFi8cI
	HTG0qQ+aK0+FZaiwd0JlGxfcUR0YQhpQrZP2I7/F6JdNiGlovsy/A31jdw5UdQjI2hUGDg9f9MC
	+5jML7lSHAwFOHbW9W8aPjtZNw4UO4bGk8DucodxVYT0F9oX91S80j+stWBVkgXWfgaF++waBT7
	VwVrSDaAKsAFe24YZvkzUSdR5Zz7h74dOEo/7C0+St7wPLcmpn8sIW+6beuM0iLBmFjxdCPKYTK
	JeDM6
X-Google-Smtp-Source: AGHT+IEDu/d0gvLMPkfg382ZhcCdbDKZbFxmgqE3AqPSqBv9agEnIVcL4Kq6GKfMPiLzVnBd6My2XA==
X-Received: by 2002:a17:903:24f:b0:235:ea29:28e9 with SMTP id d9443c01a7336-2366b3c35b0mr200531685ad.38.1750148416513;
        Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 3/6] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Tue, 17 Jun 2025 16:20:00 +0800
Message-ID: <20250617082004.1653492-4-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092025_193533_CA071B94 
X-CRM114-Status: GOOD (  10.81  )
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

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2032b0b64ba7..a4d9c72d10c4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -302,6 +302,10 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+        items:
+          - const: google,squirtle
+          - const: mediatek,mt8186
       - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
         items:
           - const: google,starmie-sku0
-- 
2.50.0.rc2.692.g299adb8693-goog


