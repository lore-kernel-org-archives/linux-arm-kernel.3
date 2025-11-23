Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F5FCFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCX6WT7m7rVOFFnbXXZfQ29NTD0s+0MEDDI8eQG4yUM=; b=Oyh/srll9aAN6wGvnZtC0Eju7l
	cXJfagdX2Kv1rWnfbRnOzP36rgLwJsYfcdfWceKYQuGPywwXfXNIGu3uawg7bkPfyk1cQpf2wtfc1
	X0ZR/XA2lgZvxURADeuxqXI9JId7bGw5HLvVlyBAJyMsgDf88inb2fbG95Fr/MCTMKLNdFrI3SaSM
	CKN2yFdgRjA7YWWJ15Ai6DUXDjmB1Yc/4KFtW87ExAJ69sLkJ0namVmu/Sf5c9V+2JPn7c4RgKWb0
	ExJaifL3DM48UHPb/451nT4MyMLEMh3IGPy0mo4b6XRspEmDBQYHlJ7/8wtFmsL0Qme352EVWYsY0
	juFPEUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNEbw-0000000AbSK-10Ya;
	Sun, 23 Nov 2025 18:14:56 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNEbs-0000000AbRk-3xW9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 18:14:54 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8b31a665ba5so333890085a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 10:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763921691; x=1764526491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCX6WT7m7rVOFFnbXXZfQ29NTD0s+0MEDDI8eQG4yUM=;
        b=koxYRz6h5z5uhWew0EaVQUqFPjoLAR2JzOFSKOvsff86XHUIayftE53LCF9pO0+blD
         jplPfeGLteaoSv2bTAOlFG/gp3kl210dzkQJO2LFtS/QqoxJNYCvhJswcAdiX5nN/Lhw
         AHaygG/jbRf5TmEi+FaFla1bQY8RSmvp+zgSBKxRUF99dFnNdpo31Z74kvaNQeGYYDVt
         01sPvwj7r7F45TzCYC5pCvvifzMVNzsjjXpJqO9kthoQ+vEPixJ16E47jv/lzUFWUU13
         SiJ6eZVx1XBmSw5yD1ZdaI+1z/aOHz6o44/kX983NQFYp7+4umHXS9Xu2igV03m6I/ep
         yMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763921691; x=1764526491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCX6WT7m7rVOFFnbXXZfQ29NTD0s+0MEDDI8eQG4yUM=;
        b=s/lpbNY1SRbKah6Y+kgT3SgMUw9WHMsS35EV+wF4C/8xHLDiRRU94sd38fJOmobPZ3
         qfz5qmJXn2hmGHR9qJTnuKu4y0WveatKoE+T8kCzWmuL+DxQ0JYB4vU95mC1vT4hNgb1
         +WFXZofx23flvoziVsCxlTFX2zzaTOTNmX0zp29ZQt9j3Yk24jR0QTuMoqyohq0tIFnA
         OK1bwbXWLQu8Q/oBAE6aWFcvc3Ja0a2QtIsd47xRmTGUQFi+iRuI7ygX2T/6XPr0Qkzp
         nPjCiEC2q/zRdbMM1HEEngKF+bopYUV9uRne57x0zYXpu3h20bguly9wB0qlWO4G4KV8
         5D3g==
X-Forwarded-Encrypted: i=1; AJvYcCVhmqBid0FiKKPrrt+tMsmKP31OP7wG03fwk0L6M045oCN31QWysTcaD4CXMIfrr4w32e5KteS7Ig2OHnBT1y6x@lists.infradead.org
X-Gm-Message-State: AOJu0YywJh/M8tf9+dSmxVmZTHNZmum4FmqGb9wcMg3VcvdwSL7KL0qa
	D/j2gZuYDoAyUQNcfO89vJOHPTV/B4DDSJpPfbkYRtdnc/dIYXI7vTYZ
X-Gm-Gg: ASbGncuRWq8AEowQIl5a0e97Oq0DZwxj5cOr69B2hvDQvuiviButpllNF+Louoknj85
	9PJqNCk6vKRUYzljbWUOFPwA3t4gwKtEx6GK4bautC/fJebS8pQ6PABjm/glFw8p9zWDmVgMOdT
	8DbIvsLz1FcnhZjzVyHrNvI4aUsJJ9Dk7NVlh5KiFQQ846df0HxqrU7HPyxjb8NOht2A+xrf/yW
	zU6i/GLV10+0uxqu8ZsCFU67CMif32B0XbJKFk7YojbCGqp2ZIhTmbnxoGUspqOm81mdghy9Vyh
	d92XC6rqyWa7ezTN7jyJGzFTC92RwCX0Zii3J5n7VIgT6roimPjw87xa3aYZiK6xsZ0njKDARzZ
	l7h/YB0Vf18+thVgXsb1fd/UWSmXiyzb2FHKMRXQVfN1EEr6pRpxx0WgXCiI1i4R036NtO2s6ge
	K3CXRSR1qNo3jnjz5JZGlFQNvpQg7t
X-Google-Smtp-Source: AGHT+IFCca9D0Nqlxq/e//g/tvSDD1qUyYElNo9V329H3YLMPI6JAiHun0zZOL76EY5TDf4OeItFbQ==
X-Received: by 2002:a05:620a:1a03:b0:8b0:f2bd:4764 with SMTP id af79cd13be357-8b33d4d84aemr1213451985a.63.1763921691498;
        Sun, 23 Nov 2025 10:14:51 -0800 (PST)
Received: from rogerio-laptop.home ([142.188.15.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295f17dcsm782010085a.55.2025.11.23.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 10:14:50 -0800 (PST)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	krzk@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Sun, 23 Nov 2025 13:14:43 -0500
Message-Id: <20251123181444.266030-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_101453_014002_84D14509 
X-CRM114-Status: UNSURE (   8.15  )
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

Add device tree compatible string for the i.MX8MP FRDM board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---
No changes in v6

Changes in v5:

 - Include Acked-by tag from Conor Dooley

No changes in v4

No changes in v3

No changes in v2

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..960c0ce8d128 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1


