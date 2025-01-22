Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F36CC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP9YoD1i/LSDmCGYFxq6dpyZTAVVlj4uIBrs32gFZLw=; b=5G9+4sEteDN8CPi++iHmrognb3
	mB0/bU5uCdmntgdRmzIAv3NVz29AZkmKKRtParrj2KAChNPjp+ksLuQ+ufqM2RvgMtcCamgv1/zi4
	jkxz7vIWaK6da+0OA5ULqtdMBH8PKkF8Vd2gtaghlFJZihxWYsSfh8H8nbtGuGQ054eNQI7Pyve/I
	tep4mfaPOgoWE2bx50q1poFwEpkeIyRV54XIk+4U2aRb4fJzbrfjsD5zqSoAWDO9dz2KswGrOeE1z
	YACan+CTpiUTiWWvmRgri7Bc9rWVrVkVRAxa4tbGQI7jf36YSXfNKPbJNaqwUB8upYlBI+6gcupBo
	U4B0CK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taY05-00000009wTS-3FPQ;
	Wed, 22 Jan 2025 10:30:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXv4-00000009vSb-3D9o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:25:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436a03197b2so46652465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737541509; x=1738146309; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP9YoD1i/LSDmCGYFxq6dpyZTAVVlj4uIBrs32gFZLw=;
        b=Bfwkwum5EI2FKlKULjdWY7qQpCq9xILGTJ4QKZPB1C8LkEcEBoZkjfqrQgwyI3GDSm
         KtqGE0Pyu0zXtGHBM1Ulk6Lmn3yLJ0ohhw0018/p+OPCj89bM5CHswJDUirbQdfy2a9S
         CNhLLu1+DHY08/I24JWvDH+UM+xms01KKoHxKKSiSNny4Ok7OcZlOxyUhpf+v0w5QS8b
         oMInqcWNcENNcp6Q6AV76iaw6piHApnyWDoUg24iRSZh4lWmWcXPWAKE9IgocbyAOmsi
         af1v/p/VRl8MB1jMPFZ0X9VxxYYi7siC5hlA/B1z/JA+hL/NdWDOOnSOADb2E6Hr/qJv
         1RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541509; x=1738146309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BP9YoD1i/LSDmCGYFxq6dpyZTAVVlj4uIBrs32gFZLw=;
        b=a5ABHOcOyYLP+GDt99UF+4ypYWwq1ZXYrhirDnxC4eN0oIdVXMCjLdyrxEveq1jvwu
         ojnnHjseMgwpOpnoqPz/3biNCVM7ubapLL5Vg2YBvMOYEuzFqUe7Qeae7HWUEH36zdsa
         TaXnahGIL9kvIdFMI7AMw/f211VdrNIeqThJLX2DpkqE4sLbrxljw7DBCV1BmOMv6KG+
         DU2oRykwRSOT+VxRsT+QyDaac8JVfcMvusvYE1swgiHdU/+HKbrvXQL5O5hUNEvaMKbx
         O1Yh4HHTJ2hNkVq1RKn89R/pa/WrHsAnPgPGZJBeOQXMxpMFvb9Q+EpxB9uCmxdqZ8uW
         WQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUDCz72GC0uImxl31eNy4202joAhJYLKhT0LYFUpHaX/nC4MzRiCKQ1+Qz6WoQtxQl5rZMQZkrk4MICVVh6r/e@lists.infradead.org
X-Gm-Message-State: AOJu0YzF/3KBiLEKevExCH60lJa7or6Atrb/Qz+ZCrNyOA3tgsovY8Hy
	ctvZdVmwL2RtfZUvDKFWgNLfLNS8AZfByKCjSssE71xECPVx8YC80CdzbjJCTSY=
X-Gm-Gg: ASbGncuyiC+SxWuJBDwZLeRSk/RT37fyPRJYSfd6XbljvXFtpwxYI7/G7Outl9ulNaG
	1c8A/O7UdnngWVzWdwU+m2lyOkqoGDJ96bTZfdVgiScUHwjY1NNle6zGWK5uxNvvk0DrSpGFE/r
	9NG62g9agyIdsiE0KAD+8drgLy8SBS4tA9uW3mGRmPQjBSDrkFwrkty+NF1Sd1afq81AoPgI/nG
	3wHc0ZYzRcPteZqCo02oSuhiH6GSyWDm9awUQtzuXzsTLUq6SyrwLahL4uK1nezhYc=
X-Google-Smtp-Source: AGHT+IHf1SGtbowYcc9tUYxc5ermxJbA44A5Ao+uF+UtMtDBlktlF57uZ9mNeChyxqdXa3/d9wNrGA==
X-Received: by 2002:a05:600c:34d1:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-438913bdd91mr187163175e9.6.1737541509094;
        Wed, 22 Jan 2025 02:25:09 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318c0efsm18964115e9.6.2025.01.22.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:25:08 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Wed, 22 Jan 2025 11:24:34 +0100
Subject: [PATCH 3/5] dt-bindings: mfd: syscon: Add ti,am62-canuart-wake
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-topic-am62-dt-syscon-v6-13-v1-3-515d56edc35e@baylibre.com>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1236; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Kpo81x2Y4TdW+Jd6LVcmPcH1pTM7VMyezCPlvqHWyMI=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHC/q+qoccsJ526qO9/xXGaOfWslM7Thx9pTJkhv2T
 dX52T15HaUsDGIcDLJiiix3Pyx8Vyd3fUHEukeOMHNYmUCGMHBxCsBE4jcxMuwN0br1YdfBlZeF
 /xvZ7u17bdFaWf3pSx7/t+9pnTZf7j5k+MNtUCYj43TV1GZ/4dTvpZcen4r8xxKoYWu+edWkoxu
 qw/kA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_022510_806875_326F66DF 
X-CRM114-Status: UNSURE (   9.79  )
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

The wkup-conf register space contains a number of registers that control
the wakeup through the CANUART block. These are present on a few SoCs
including am62a and am62p.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index fa2e904b52ea0baecbdbdc14a4fb636eb87abe59..2c8a3f654d82fc6114e71be28f2824597757e328 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -110,6 +110,7 @@ select:
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
+          - ti,am62-canuart-wake
           - ti,am62-ddr-pmctrl
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
@@ -209,6 +210,7 @@ properties:
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
+          - ti,am62-canuart-wake
           - ti,am62-ddr-pmctrl
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl

-- 
2.47.1


