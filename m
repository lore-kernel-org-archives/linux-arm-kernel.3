Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD474C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=; b=wtiraLjC+DQqXv67xGwVmmE6Sg
	lBMwsxGtzM8lAYEmsEiZTKyesMEQT5fITOVn22XtFDhzIA1gcL/8ujhpwSJJZ7zRQYMPbK/lSjPRo
	2E+W4F3j9mMl29zfhXN/bPiBmstF+alAsMnZVSumKQ+f5nWYwJYFpvv9i97Rnoezt3Gtd7MgSEJwE
	pTfK7ZroKgyy02WxIYjH61L28CDNUFcrwm/UCM+fX8AbovAZwkyKa16aJ+WPKVquK7ShKFHkJkGbt
	KOZjBV1K3NG4HZSCex1j3gsEJNWgRwiL9nVN2U7KYAd2Ef/RU6toz/Pm687Nu6Df2Km7WHNCeHQ6l
	qsK7psXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVnJ-0000000AxMD-0JMK;
	Tue, 14 Jul 2026 05:35:01 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVnG-0000000AxIu-1fyH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:35:00 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso2302171a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007297; x=1784612097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=M4vgRkTRiYnuAThbb+C34zqrk0C6GipIId5fcgSj9fU377rTe3hNgHgelPAa+Mg5LO
         LvTXEfhaLCmh+/DtDavSG2+HBlcViJ/1XSSa1FnYUHZQiA0/cUy5Cciu5PVmtkJi/Y1j
         nFrA4AKv8x2TzbAbSqVcBk9TCAkkvUc4SP/9+hUryZDT2F1G00W0s79/iJ6G+BF9Ugj7
         BPjh8bogWP4/sSdGbxIyglvAjRGNv31pGeUc2OzVV4NwevGOmvJm3GhcRoUaDD+6FSfD
         JMOrkcTuBLTM0VWewPvM/P+TAMp6Gi404RdigAFBesru1qqcnLgHJXe3H5Nd7bFMksvA
         vq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007297; x=1784612097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=fvj8BufW3N6z5uJ1IYPQ7dqks3BAMdmUtwEjVmjpEKjDe5chjk4AE7oZUkXoFguLkC
         uIlUitqvovQe9Cc9kiu56mQjUL0ffy7Pdu23JDv/qD/3e37WRHp+Snp8hoptodLpO1Vf
         f0xhpJc7WA4gGAopG1yC2qxg2WPvcbcTXTrnTEhAQUaDL/91IL3aLF1GrqFoB8rYBsJc
         dQqcEio5Zf9y6gHAzHJ9uMcf3zfWA5+rdmvxl8DgxKBDVQRdtr7f2W3ULed/X2kn/eld
         eMNkkh7QXXVhRAdZUCIqDQBoK9tULkUDojOQk5+riMf7VUWRjxkzri7BnnCCAEvLto0P
         rmhw==
X-Forwarded-Encrypted: i=1; AHgh+RreZJq7Qx0lyasbstxgTh3rgpm6UairuNSyUOCLrjkJOtvpG2BDKIabQNG5CmtyMTfQJ1QWayUGto94OPWhKt5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxWMuzU1+NMOePPF89toITQDEfkXJXZAIXDrIS0fndwnpS+iFKI
	H7hvRGfNGcVz1V9k2xlDna5TSzc3gzrpGc0YDbRsZAOw/973H+Rl8CKQ1n2Vcseh
X-Gm-Gg: AfdE7ck1p4jUAUEyEDaJkA8DEBujEyjhfnGbJyS7U3Eaj3MzfTL+zxdLyJUpR84EsOB
	yX/MC7kjSx+ldLE2nG3x52SgKMLjlGoHoBuYBNBFx5hv9jODkltNiJZqpj37V1li60QKbWtky3P
	YLLairnmL2aQRpLUzidQNNRVnqk1UGQb4VOc/q5Oyl0PFo2eAL2CfB5kqp7QKkX25s8hWE5dQFD
	CFvI4BlgKAkpUQIZk6a9br05TbO3x2tmHwpQeRn3dtnnvqvH+NZbRMzi8fG9r2Kp1siG/WX0zpE
	l5DmhWh69Ru8igMPju5Z+8Oh5a12xYCOIn/T87vwpT71trpIwgj7KEhkGdiw1WVJybXY0eF7gos
	oLQj22Zm9gyXYf/C+MAIkqiJ9LeSexdlNm26FufKbT7ODeRr6e1tPJpLCBTtkelTZJsUMLx7u1e
	Udg8lYO2faCSdgyJ+5A5xJ
X-Received: by 2002:a05:6a20:c6c9:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c35724a49bmr939151637.56.1784007297473;
        Mon, 13 Jul 2026 22:34:57 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm131882715c88.14.2026.07.13.22.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:55 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Tue, 14 Jul 2026 11:04:38 +0530
Message-ID: <20260714053442.265587-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714053442.265587-1-hrushirajg23@gmail.com>
References: <20260714053442.265587-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_223458_470194_887AE83F 
X-CRM114-Status: GOOD (  10.07  )
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

Add device tree binding documentation for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index b023d4cc9842..b5a43fd5e546 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1311,6 +1311,11 @@ properties:
           - const: vicharak,axon
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman2
+        items:
+          - const: vicharak,vaaman2
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


