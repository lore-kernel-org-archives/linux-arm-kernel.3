Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703E8C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+kyPVB1rxXM0m//xddyhd4EsUDRcFjA3X1gP8LtL3Ps=; b=uMXUfvnbDS6UX2qzRxqfu0oEEh
	DBFpIsP2OZND4QfG/bU4v7Sm4jOxKSMMp91JXXTAehhV0FvhE1+JVwVrWRYySZikV7bn02bIYIMyd
	DLnyjcW0pmQHEbOHQmBC4RWVy6P1Aei/rzbhRbYAVVXfJUpYURlZpEEsqR9BXLUOSmoXHrwE/Yrre
	d2pqy56L2jXCzYnk0ATvmAhF+L7bLJV42j+BTX3b7XLysy2K43ZnTmBjWgCVVdoTwq8ojkbXkNxD8
	nkXquELTB84nRm5a+d7XgX/R+pQMRDEdrmP9EQAsGUjeKdSwzNCjrzu8Eg6LSMBdSHl9rAs5FFmWG
	EUXqfB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gJU-00000008skq-28Z1;
	Thu, 10 Apr 2025 01:02:40 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGM-00000008s8V-3FmH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:28 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c560c55bc1so31377085a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246765; x=1744851565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kyPVB1rxXM0m//xddyhd4EsUDRcFjA3X1gP8LtL3Ps=;
        b=JiyFAwj7bTTbcc8q7HPKJ2e++fbSt8kZNb/mWrX2zm4r8F0oIFpCU2VgTEr3d4lUfM
         PXNzhQt26SZFzI/fHDKvnOMlUQ9KAuftykQQhjq3zaWNBbJMioEXpzeiJgVI8VTf+d2F
         aMDSsBHZSCQOLK/5cW3nM3Yk6DIFvoNXIs7ws1ZDrN3c2MF8d/HBSExDxElokh5Yw2q9
         3nASU5y3xwh5ozgUFTd1CkYyjhQ968rLdfaR3O6BfXpdUGNUeRcPhQw9Ie9ABNR7rwVV
         qpng+GnQVlvLECjgIhU195MIK8LevH/8kRin7b1zhTpURcwolgHnWbL9U/ZF0ndN1DTQ
         TIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246765; x=1744851565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kyPVB1rxXM0m//xddyhd4EsUDRcFjA3X1gP8LtL3Ps=;
        b=gRcD4pyjqdc5oIyHBWAmJ5llkWI9KbW56JGm1PDOwfddpr486bHzfCWeDK+h24SAPP
         3GYfJx8Y6cSFXn6JYacMeiYiDJopTOOxyXikLFj2nNXhG+aopmDaBe2xwRn9GFw4k5tE
         hUWeZMCtJLvJzwBeAZoXtjjeOEQFfbyBF2ALQtVpYZ8Sy+MWRe+L4kJs+5VGq8NXN5+T
         eEQwF8akqC1YtjMKXQ7otzmCwyiwZRFEJLkr7pgwdMTSFRrtq5mv57gK6gpEdus/eogC
         GAeE/4HV3faxyd1kZotRma6gESfn0A2SGau2VtpgPgUHHyK2FFSgDIOrySxkuAK+YYnm
         wS/A==
X-Gm-Message-State: AOJu0Yx6/7yREeoyRKpz+HEQcFikj7frS3q8zykXYFuBH2mQWS9VaPcg
	vf8LfxEBJQkZUZPaZxPQvYwZHbT4Es04xjvyXbTBVb4f1Xi2M6q34WsXCg==
X-Gm-Gg: ASbGnctc2YeMScxMCPMVSTrz1/x8nJIUfPRe7Ai+5A+nie9+LpIITjN/3PK47Ox65dP
	DYgICH2cmw/F3C3tie2OSQ6nosHagRzyNlJbzgL91PAKVizj6eyoSUDaxyKiV+7py/MAWwkpBnb
	yHKDfcNaJ8ZJsZEZDQGUHGa1N2Lci4hzwjzNpfulT5sbigFD1lEyI2iNX7T6es7n2dFc/qoWkUK
	fqD+dbIxZmIXl2ntdPXf4xIc1ybajwHeMkr+vXSOuJvLE5doUbHfXyZQYqZcXXQzYSel9PrwNLx
	n1Mtb+yUGWXVUusjYhAr1AF1juW/rZyHco4jvyjoD2Q6I55Gzj9kBaIfX3+ZSf7+jSNobdOsSpb
	3NmQ8udVS0Nufzyo=
X-Google-Smtp-Source: AGHT+IE/6x1aCGCmhdtAA2IZ9Tq3qv3Y1gkoo0rM9bXUYtA375cdw94zz6Z3IyZoPnI/FmVsMxW2XA==
X-Received: by 2002:a05:620a:4550:b0:7c7:a543:d878 with SMTP id af79cd13be357-7c7a7654195mr115046085a.12.1744246765254;
        Wed, 09 Apr 2025 17:59:25 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:24 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: imx8mm-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:55 -0500
Message-ID: <20250410005912.118732-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175926_812286_92445798 
X-CRM114-Status: GOOD (  11.21  )
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

Although not noticeable when used every day, the RTC appears to drift
when left to sit over time.  This is due to the capacitive load
default being 7000, when the hardware is really using 12500.
Fixing this setting to fix the drift.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49..9ba0cb89fa24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -233,6 +233,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1


