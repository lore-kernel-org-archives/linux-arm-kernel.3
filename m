Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD67CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdKoLiN4BRQR4DmjNDMMqfI3cdNQZlmAjUao5oPGRe0=; b=iuiHCG3p2TEY/mb+YoeZ6j9J1V
	YDM58vP/wWSIUWtPyjSuqZTDfeXYWInH03fibwRZqOJs+3+Dw0HLoYbJTCDlLOwEopTnNzZrf3lx6
	v/C5oANRJ1TF8IwfbiG3LxnGP4gP+HUpoCiyvCwMvELPvrsMxVmDDXdbCYLyu68JaSOXk/g1h+ucz
	bdCbAGJnaNPc8vxR9gabjGg9CUh/YI48XVIIyWnD1Y3JFLur2f6CPJFiA/aU+zZTrVVyzaKQk6waC
	lB5r3tfZPzxpDY/zWZJnSuBw3Q/Wf9+XpQn8iC1eyjyXp3UzHrxYrCSrQx39Ei8vkbo++9nlChbew
	DYzPk/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul5Fy-00000005awQ-19qc;
	Sun, 10 Aug 2025 12:34:34 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul53f-00000005a44-0FsS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 12:21:52 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6180ce2197cso1929859a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754828510; x=1755433310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdKoLiN4BRQR4DmjNDMMqfI3cdNQZlmAjUao5oPGRe0=;
        b=d9QMlUGU2xb6VWXvqcJ3GhiUnTJ7uWULSZGvzrBwkSwLY0SiOx/agp+f4spBFaMT4R
         fyjhWbsXzLGgw1LrKAVo9AZ2TKbVF2v6rHcuSeN5XWzBnvQ99xX4N8xt8nMmogVf3Q2W
         r+Q8ooCAX5O+98wPSgWue+jc2RTtVwuGqIBVB25Sn/+m5c/3HFsUVWqO+mybzB87219q
         3enb601j/jKdmeyzrP+pWs/qvjiQ/+C0nX7A0IJVEWmyREFsxm+IhLLOX+CBsQ2+x58R
         U2XifiYTzJBlREVGOY9pk97IZ3OQdUhotzvfkrl5KhMh5noJ6T9yzZyhot8Gv1Kgn0Yy
         noaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754828510; x=1755433310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdKoLiN4BRQR4DmjNDMMqfI3cdNQZlmAjUao5oPGRe0=;
        b=tFVlZas6OZLeSUlGwzDhtPHEGyNO7Bhjv3cM5DhCrNqrfFV9L+ArDvi+DCMV4mckxf
         kru5qLvotOdS1m28JrvkiG5TlHbnbYc9Ys9Ctp+443Y9bNE/Ig0diP3mgH3xIkrcnK/+
         TvzUv34nZGqCV4QrZWxufAjXgQgrOEUh9f2wfDr4H6thUJW14JzUMxi9ecxN1CFjqDtu
         NclH4o+BCuGPNPHO5rnNQ6/3OHF7PM8H/2FWZ1Y96OWxGEQD3BYDkSeq5/cnAlVy0TP9
         H8BaLL6F7gVCfOzDbud24tAR5vz98mudzJL8ZqAZF4mn7RU5jScxDfLqCJLpuuMOawyE
         oLvA==
X-Forwarded-Encrypted: i=1; AJvYcCVtXzMyRbPvxHU9L5AMifxE6Gl4PlVWe260lMTD44hw7jABLB9qKU29zhWXfK7e6cDhFWQyOoIUkhqefQYvb3nU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpwqf2AuAFJjCVmHsL6xVUaW8QodZTjCnFLVaFH/OZjPbQSqMT
	rYvyUX9jmkKuXndPj9zVm0PkqahUlUSPXk8mUy9AzzRqf1ISmDHWVHX+yK4aPeUkenc=
X-Gm-Gg: ASbGncuQgryesdzdFfQNRJsy9W3PNECB6O5IlBTG9hLOnA4AVVmhuPxjnVKtFB/izwU
	6uhf7PxmhXmK6Y6BAOItLfirxBfLYGg9G0RIM3EcKUrB5zCIQ/b5+r65dk91pIU3r7fWiEGi+T4
	eQUpAEgoDl5YzIheIKai656W/rZE0pXNu+btYPFfLmr1OQCl3DYOEHjgvUXVMbwenQURF4f0fQd
	LG3PKxywrXWMF2y4s5n20qHoXGvCBg7W77STjk8oON09JrtNMTLUOKhpLupOiZ2jWnm+69McFaN
	M3pA0YRbwmB4Rj6k8Z14GSco6nx6iEKdmCFVOOhzGFka3dLihqP3NFFayuHAI9WKritdSS/QPUF
	7uZjXWiaboMnYaAhZZ9n8O/no92s2nhAl49f+Hl7am9Dsd5NfELKA
X-Google-Smtp-Source: AGHT+IG1VR8s9CUfGvRNrN+MgDdRWdkJbvcTgCrAzRGDjCO8ytytK6dbDH9qosonfYZ+QdH1pck48g==
X-Received: by 2002:a05:6402:13cc:b0:617:c6b1:70e4 with SMTP id 4fb4d7f45d1cf-617e2bd993cmr8435556a12.15.1754828509709;
        Sun, 10 Aug 2025 05:21:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a86758fcsm16611897a12.0.2025.08.10.05.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:21:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	niklas.soderlund@ragnatech.se,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 4/4] arm64: defconfig: Enable RZ/G3S thermal
Date: Sun, 10 Aug 2025 15:21:25 +0300
Message-ID: <20250810122125.792966-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_052151_098047_58099414 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..540e85a0c676 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -728,6 +728,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0


