Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EFAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fh6IUA26lEyrJEifWIUg0Aon6jE68Po+06xiKRDzRZA=; b=GSBDStScImxeYzJ6l2leWmjaw2
	fA794nGlaSzjByEzkgFcY3w7zGuSJx6LX6SrtzOtWOEQB6el0ztYQgjGdtkWF3gWeew5EgdRCpV0u
	K6e1sapwvkOgN5LdU/I4CxyV48UV5q2KWFzteAW12BxzefmSSQUPEPT78k9Mc9heScgX5dWNSVxIO
	l+6hWUlGl2yX8WoDYHag/GIno00oVtoOZ4YR/TMTN2KfFSCNXIUUvhpVtQoQR4p4sZaA6cPKQ2iq3
	vcXRjBKKig8FD2pNODLPFqUn+Q9nIJ+R25tQjEzUDgJ5WRv4iA5RAgsXoFmvilXvFCki+tmrtiUi2
	MtCd+d/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzixu-00000004QpV-18vA;
	Tue, 01 Apr 2025 21:16:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzipp-00000004P3v-3EXS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Apr 2025 21:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fh6IUA26lEyrJEifWIUg0Aon6jE68Po+06xiKRDzRZA=; b=gjwanOdaKHehhGfBJDtCGVkvoA
	ctlw1R9BCcErUeJbbX1e1XIb0+4TEAAhirxr0EyVS6Kjf9vvsiH3GZ1WcKChqArTDeWCuiA+IjFYI
	8PFxB/K4fAlp+YdHQJHFtEAvGxrLZq7Ncq+6IJ6zeZlPSQbkp8iwME+fxkrNg0q6deCxKYLbUWEA7
	UeAhGgjMDenRtVsiVoQtMoqM88GkCMe53zqXR+eb4vSWLmsEqy/Nj4BzNj2EJQ0rAikfPF52rl+ai
	Ir2xYD/3LQdDdVw8UQJ7IGvFyskv7PwwHhsT1lmYZ7DCjKsWCR2uwZ7ILglzEBaW2IMKgTcaqX1yO
	Gz/URRag==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzipl-00000006sXe-1KG9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 21:07:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2254e0b4b79so155113355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 14:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743541661; x=1744146461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fh6IUA26lEyrJEifWIUg0Aon6jE68Po+06xiKRDzRZA=;
        b=VTdcog1jMqllPgZJjEt6TJ8tczN1HVc7ehAUUeiQ0OAXHM5Rdvp+1+Ogm2c1TGP44Q
         mQmZEZ6hItznFy79bK1e0uy0ASZVXCMSKVAKeQgMGV7R/WO6+p8Wf/SE2dFF8PEWS/Gv
         3DOdCGARhxhd7YAp7KYc/7w5AwsBYyhSs5GsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743541661; x=1744146461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fh6IUA26lEyrJEifWIUg0Aon6jE68Po+06xiKRDzRZA=;
        b=ueixIFQgldg5rWuk9k36Cuvft0BWzhvfxaKbCgNusPsH5rEDa5p1cX3nTGHL3F85P9
         poXL/0961D8yvMySIJ5zDQsYjH9TTKFOBoC87liixU/69qcHhbCvrMh+u3ctibvO1X7v
         d15BHJVcoJaQ32PpmRBAUcjwXH6MCPjUeL32qSW7k2x2fQysFJVeXHL7R7ABq1XFW3Zy
         m3XPhlPQzYusYZOj84R9C5ElEMU1XUAEuxWDzEtW4c+0io+KV2g/2uyOh//ggZhnrnVu
         P9j1opS2glBlwIn/MP0R4QuIcAwB86l4UJ049Vs5mMiA5xuchghCFZTVxTYR8WJASNcd
         X2kg==
X-Gm-Message-State: AOJu0YxP+8LD+KQGbhKondiMHO83qVRESQZo5nes5WJmqZzLmBlbFpKy
	NyuFx6RsOaPrGu1V8Q2WW8XLzw3xdFXobdhZLAGEfYMPuZFL+CWUeGJ0apwRYQQ1QREB7eBXV0s
	ehfLy7kGSLfH05NBn73kmEEhH8CDhrkvus2BNRYqgdAm6odpRQ2WfeOgZyqSY3muZxq/3x5cCAy
	rBVjPN4aVpjsTtSFEUYne/A3IHohouSG0f24B2iMOYGkIwVDMsODbjV6jLZw==
X-Gm-Gg: ASbGncte3VzITYEWpIGUBPrdZ3kjP5+6IZe7afETZBg3+qQ6v300pH9UllGoaeRBBcb
	O5pvmR0zje0RVTtHWD1hufL7Hp/yRsz4motEKGcszDQGwgfvaYDPD5mCSNvht4uBGIFS/tKr1Q2
	gyESLmMRIXkXrXfORCKXZrcG6BSyMycRHFJPGS//JD74SnzOiU2XGVxOIcYFyGSDwd5Teh8uERb
	wOdl8GDPiGjLKtFb61yNwCF1SHFK9Ya5yNWkkGYBFPOEOD+Zwk8/DO1+/RUEHEaONpYfZD+0q9f
	stv6SkZ1ZtL6vbPYh2d1q/doj1JvRpFChXrkt8Xezm3dC1M3nhMr6o1sku/fAqKZuU/MZVpdmrG
	JKnCfAYmskmafSmxTtvmPBw==
X-Google-Smtp-Source: AGHT+IGf9oq+B6UHqEuTrughCDWV/clMEy9Ly7iIk2+4GYzd43PWpBaNMRG0niwSdY027BBWwPy/rw==
X-Received: by 2002:a05:6a00:2da1:b0:736:4b85:ee05 with SMTP id d2e1a72fcca58-739803c5d57mr21662614b3a.11.1743541661474;
        Tue, 01 Apr 2025 14:07:41 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deef7fsm9414995b3a.9.2025.04.01.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 14:07:41 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: rafal@milecki.pl,
	alcooperx@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110
Date: Tue,  1 Apr 2025 14:07:35 -0700
Message-Id: <20250401210736.2613748-2-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401210736.2613748-1-justin.chen@broadcom.com>
References: <20250401210736.2613748-1-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_220745_673424_26DCB727 
X-CRM114-Status: GOOD (  10.40  )
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

bcm74110 brcmstb usb phy adds further power savings during suspend
states.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
v2:
	Sorted compat string odering
	Add new compat string to constraints

 .../devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
index 580fbe37b37f..28906bb664f4 100644
--- a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
@@ -15,9 +15,10 @@ maintainers:
 properties:
   compatible:
     enum:
-      - brcm,bcm4908-usb-phy
+      - brcm,bcm74110-usb-phy
       - brcm,bcm7211-usb-phy
       - brcm,bcm7216-usb-phy
+      - brcm,bcm4908-usb-phy
       - brcm,brcmstb-usb-phy
 
   reg:
@@ -139,7 +140,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: brcm,bcm7216-usb-phy
+            enum:
+              - brcm,bcm74110-usb-phy
+              - brcm,bcm7216-usb-phy
     then:
       properties:
         reg:
-- 
2.34.1


