Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF28CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6Vlr6IjEZJ4HXKB0HJH8awIxM/NowdIhVK0gPa/XrQ=; b=AlTzgVysTHKn5B4sl5NrqnfNAk
	nxVytgvybZpW9IJATnpYr5lo1L5TqnvVG+M7XxPODO0AKGzEnTLaHMZAdMm+RIXYi37rKs/y+NNnv
	dEzoA9dWgqqs41TcG5DOn9d/u0nXh2crSbXGFJztN2nwx9gPL+vmCVFEn4UHGA8zKYZlXtyCYRmwv
	hpS3b8cUiWqRGb6owwfvKUHCjzHiubDI+TsN+Eg/7M8W2MRqDik8zLhZlYKqCW4pDFuWCpWiAuyfH
	dS1ID8uUr4BPGg0jcB1lxmtCoPSuK8YEIfvA16g2o+kwg1iST2bbm8DRbtbLqdydWP02keonw5nz8
	1LYZeUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxr1-00000007ULB-38Tf;
	Fri, 29 May 2026 14:06:27 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqz-00000007UJn-26NP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:06:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bea7176c72so67503545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063585; x=1780668385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6Vlr6IjEZJ4HXKB0HJH8awIxM/NowdIhVK0gPa/XrQ=;
        b=JNQQVg8iznLrCmVmmD0SF3LpHdrwEKtNTXWTnL3o7yPSygfPhUbXlfuYCdHrGWMCoq
         1Pr19s3pQCmt9VNBjOhsZx/s8D5aKOI5mr3r8AuMpPEqIowBTHp3Xvt2Eh5xo4kun3qp
         f2p09FizXKBHr6BYe+xlm1IdBNlYaL7tk47fVtTufgm/k+5I32Awlp6UiQEoys9Pe+Ca
         u1OvePO4uttZpy1m/7gk+pQvlqdsOlqbB9ZPAILiB5FizYGfce4Hgkz1xO2REz0IetR+
         7Ts1tECDOjdJD1zqQ8FF139bgPDScHken7NYYUOFAkMCGEHd7XDHl2cWtFPD65LJSyDf
         0vvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063585; x=1780668385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6Vlr6IjEZJ4HXKB0HJH8awIxM/NowdIhVK0gPa/XrQ=;
        b=G2+kQSpUahm1ynDdiQxCGr93v3U/du/gwd5hMbBwXhSDJNre5pya2Np0fg1BslVgAF
         IJPnjIR0pZS9BsxvX9nJOPLMInapXYqkvRN6PfXXo2ZNi4GUT0I8+xzvsoKvBEh/BuKl
         /2t0LjQhk9AbK1W8apoAf1e13wnCVxGFPwilglbfphAP7eQv1MezVPHY6vTutPZENp07
         VqTkQez8EdstbaAP/vqJxlcqLzrnVPb76rdvIcZbS9xxDVNJ26y6PPF9pdskoURH5wwz
         Qm/Ny2AFFHX/G3q/aiZSUQ7vzCmZJDVbzHCpqpdXwxF4t4gESBDrMIXausxnQbhyOkMt
         3EFA==
X-Forwarded-Encrypted: i=1; AFNElJ9nkJmmJePFlxvdxuvqmI8dRyyPQ0z5IPr3aW39IuqKEeOTWW+QZw6DPgzUQBYsaRsE8EsNV4sl+KOF96qi0TfM@lists.infradead.org
X-Gm-Message-State: AOJu0YzHVEkcmZ7HbHZyuj8YN/TjpgduEaY+ydvG8sO5I+NaUXYksQBB
	ZWf3p6RganTdXVODBS9t/uF7EOJ+iKQu5CwG0L/Bp2rOW/1QLTDVdvpR
X-Gm-Gg: Acq92OHg65hmSUcLOyQFZJCk2YAnGrnl5VU3RioLG4YFZJ0o97FE+okEVxHYc96JFdM
	fga5vI1DVjxjaC3o/B88bIcYvwG+z5v6YQ6zOQiFhPlMqBkTLlLyfvzs3NSZ/ZwawTMx77Spz92
	h7jAUYA1ew+VMCjm5gCgE2CWFHD+CqK1jVLC+BYcZJ13tcvuTbTeD3bvBMEX+7EcS2nMCYIpWIL
	/T3+gLiDwWoPKJ5Jgncw1ezpDXMZYjzjO7PezcvZEOMCUxhEcXQ7zRjuptCUSHiUHDSLvSQI8SW
	5QLKY8m3F5pq8NNWtV0QERzN/+TqIAs4xGoZw8DozJd95YZOHtzAkPFMoaMzmCgUl8jYnsG207e
	QaHjQkYpF1xTR15RoO1FKOAF35Drb0bI3IiGc747OLYYnOFMEbpKNMHuP2vUOd69et2faw38PM0
	U4qJNL+zQj0vcWziuqWNAvR4mSotCuKdaoEIXN+o7MPsZ2RnpdTA==
X-Received: by 2002:a17:903:37cc:b0:2b0:ccad:de1a with SMTP id d9443c01a7336-2bf209b860bmr44254305ad.30.1780063584729;
        Fri, 29 May 2026 07:06:24 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:24 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Fri, 29 May 2026 22:05:58 +0800
Message-ID: <20260529140605.1070764-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070625_543294_F8E25AFE 
X-CRM114-Status: GOOD (  11.89  )
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b7a7f4fae7dc..41a75e3d286a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0


