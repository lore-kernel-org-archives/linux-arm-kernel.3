Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C209EFCD9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1aDzJ0oh9aQEO800V2bAcY+ffAgEFL34SAN70Zrawo=; b=qSaijQ7UpqCGVgFnIHPDIdfXHD
	POCBdF95pDhI82hrJiYvIxDYMWQ55A+4NJtiupMGGYXTHFLxU/NdtLQdvs1dmDmE+VB9L7ZmmHXZF
	B72aJlWyM8s6cd3Gm7ZwfnEeBLqcJ3GzPr5yVG+7E0c+BeU/JItQvbrjgH0PmW7IPdabnX44PICq3
	BeF2CS2m5NpCkje9DZ9oU4A818rAAu9Y4p4dSigKECN2yBHxsqe+1wfFpEQIXZWzraKrIRAaKNNJB
	XzDLcV9yc0h2GU4bWAIkk2Ja/c6EZrw7NF+aaoL1T8VjMyH0asmbcos/TmaxLzACUF6ZSMY+y3BD5
	nb3F+v/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztiw-000000098EL-3nOI;
	Tue, 10 Mar 2026 09:49:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztit-000000098CR-45dR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:49:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aaed195901so58124305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773136195; x=1773740995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1aDzJ0oh9aQEO800V2bAcY+ffAgEFL34SAN70Zrawo=;
        b=GwDmaHNPRn10kMulopwV1xYWmbwqoCZKDTcodA5p/gGPBoBg0MZRN+Cem9xYZqjKxx
         mAGcDplrtexDuo51tec+dbb96AHRg27lzwORCmgRoAjpqIuhRHi0QjNyWnJgB+6v8ALL
         8k6F2s6SBv7u6Ve++PGshf6XqRq1aLQYAk6BkalNM5lDt/j09tJky5cKdlPU1PSpfra2
         FHPu/xevapAd32PgC2YMxib7Omq8J4VbeZl9G3nyScC7m3IOVxKlM+/4oy/BdDbScFqN
         KGx6tUbOiKshr50ef7x+nPYLNPwuVCcCOIheE1KyCKEJEgokxRH/RoMr8k10w1NTkX8c
         9GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136195; x=1773740995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x1aDzJ0oh9aQEO800V2bAcY+ffAgEFL34SAN70Zrawo=;
        b=AxPyaRHKoH/7MgqBpx+Hy07Ton67y+dZ6gAtXZuvraKSgbxziptbiVGPUxyIhs66gp
         z35A/P+8kTF9xfeLDrKBBXeRmoBBb9il9wOxk7tltTwlLWYgPzdW45OyNr1KIG6LuBRc
         qGJ87oykIPguFXde9K8X7vWxs2v+KaezpvFGzTZ4RZBO7YRSBtxiAcDpk3KryAHW8PDk
         mY0AbOqJOqsXQyyeQz/AiBcOMJmgBEKx5dlfNmGa0wkXyQVpyOhHzvUtB+Y+ju9T4zGL
         R03ixm9lhYk9zIRO1RrvlnOiLD6DvdDsOaLQFuybHacQai87E0mQUhI/NpORdwTfKcJN
         p7gA==
X-Forwarded-Encrypted: i=1; AJvYcCWfTUDuUIVF5BMtrCdOoBrBNCOHSdgaVJMLM+vQeNKELiLWMx0JrW0U65QP4cwC9nOa+/Ho0y2Fn+Kv4mP/1wOL@lists.infradead.org
X-Gm-Message-State: AOJu0YyJk9sj4JNlqNqsNRQpZGTC6kspCclAX+2Vx3l7qpYOgdnQQ6nf
	lKGtEpF3+wRHaJJYgJTbUQAr9a9HnBUOk+vbbbJaKjWKUCT7OMHIu6s8
X-Gm-Gg: ATEYQzz1ji7wzJoNe/gY+X+sWL5K2nMa5a7XeLjP+V03ZunJ2JyPBMzflS/2d9vL909
	v5j3vt8VkF8//jbGDs+4wJC9D3jrWNWwYR4xpdaFcT0/Dz0yNKWNXfwVS77p2HMcIc9EkP2vS4K
	1ByaXknJ0M/YlOS+CYU/SZED7mBHaJrGRT7S9H9xBHZg6QzAfH6Lva+BXfCZbJV/+NifXkovGDN
	9G2enhOAwMds5B0oDu8TkJaI/RnGHVlElFoFlXDnHmprTM1eFqyvoHM+XCSVCPdl9vYd3onG3eE
	bwGhK/TxxfnXGKnuHdEZnTfhVGDvH7eP38XdsIrei2MJQef6Mpxa6lkob5uQiKSiGLPnemRNooz
	Rb8BKWTZdJhrEG+EW0Fr11rald6nzZwk/jcDu1/uzSd0AB2DjTBUCJFBk45aMkYE6BvyqvbNSv3
	vd+j7d7bb8LTMV7RobD7g=
X-Received: by 2002:a17:903:b4e:b0:2ae:7efa:af93 with SMTP id d9443c01a7336-2ae822640a6mr144995945ad.0.1773136195150;
        Tue, 10 Mar 2026 02:49:55 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8a67esm199459775ad.61.2026.03.10.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:49:54 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 10 Mar 2026 17:49:37 +0800
Subject: [PATCH v3 3/3] ARM: dts: aspeed: anacapa: add SGPIO interrupt to
 PCA9555
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-anacapa-dts-sgpio-v3-3-12d9b7f1202e@gmail.com>
References: <20260310-anacapa-dts-sgpio-v3-0-12d9b7f1202e@gmail.com>
In-Reply-To: <20260310-anacapa-dts-sgpio-v3-0-12d9b7f1202e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com, 
 Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773136185; l=1232;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Mr3A2NRV9ww4HVUgXHL1FFtPeh7edkZ/s8D935nooUk=;
 b=YqK93JIpbhuvNaEFsUHhnrzvNaTcKHv35WX8dM1/furCKeZmzIncMXLjRrXqdce3sUiD9HJVZ
 4RhC2cb024VB3jSrsqvqsb3sdNsJ2txjXvbXc1TpHrK70iR31HeHvSw
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_024956_041002_73C40EC1 
X-CRM114-Status: GOOD (  10.01  )
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

Wire PCA9555 gpio@24 nodes to the SGPIO interrupt controller by
adding sgpiom0 as the interrupt parent and specifying the shared
SGPIO interrupt line,PDB_ALERT_R_N.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 85b7e027daef..933885055636 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -500,6 +500,9 @@ gpio@24 {
 				gpio-controller;
 				#gpio-cells = <2>;
 
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
 				gpio-line-names =
 					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
 					"RPDB_PWRGD_P50V_HSC4_SYS_R",
@@ -546,6 +549,9 @@ gpio@24 {
 				gpio-controller;
 				#gpio-cells = <2>;
 
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
 				gpio-line-names =
 					"LPDB_P50V_FAN1_R2_PG","LPDB_P50V_FAN2_R2_PG",
 					"LPDB_P50V_FAN3_R2_PG","LPDB_P50V_FAN4_R2_PG",

-- 
2.34.1


