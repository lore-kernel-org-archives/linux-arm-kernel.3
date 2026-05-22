Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED1BCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=; b=OL5CvCMpQTsX4t7LZKe7T+ZQuz
	7gQ3oNKHoy6/dqAVzcT+coGxykUxR5yfXxvyHHa1+VI1wiA2+nU0UBBjRaXZmmtXi0tQ2dW8FcjaR
	cXVwsPGcksDQV3CiYY/kPJziUDJoPW3wfNl/fOOA+NEXAWWPsXXwbnG19u2jc1Hp561q5WSNUrBgl
	d+2RvYuXClMkfH/1tWf9ubSBDS0u4lEqeXdIhufdcN9eSE1QXnZTl1LcUvZcSebySFdoeXspdMOpZ
	I53GQXLvPBLdLF/DyFzATUG/LIFEclySRQBdkBSH4scN4pDbXvdEyn/wpCuRo4WnSOEHQn+tqPmX/
	ql/iCoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTW-0000000BNkX-0AjN;
	Fri, 22 May 2026 16:11:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTT-0000000BNik-0C2T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49039a8851fso21236035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466305; x=1780071105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=;
        b=NzQdqj4chQN5nnebypFpGZoflpXaqpsMkCW47hGEUiMPOkyZhOvn0BWtBJ5y0vVQem
         RwPG7RvOG2RwC82PVzZveGXklazQtYl5tKJVxbeows2PmAjhLCUncoHtID9ZkffdhSOA
         PmgQbQjvhdbO1zuFfT0SzTTdgFsK6IPmVUtAusvlVjuMQYJPCuas6IBpleG3p+FYXJLx
         PuuLx4fvmqAbTNnRfi3xMJ1Cv07VoonSh3jbE3ODESZ6Af0jobFQ/Q8aGpt3rqa+URFT
         VSq+IAEMcSkm26h1I4QRBoZ5Xg/7gI1jYZKZYJW1ZwCoJ/SfXMajHYd+2By1eaK4GwuY
         oyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466305; x=1780071105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=;
        b=OZLvR50QcNczLQbQAGvaRPh4nUrw4JrsDc2W/sisnvklLms4gDnylDAsWWt4XBn3wm
         RN+d319zxcf5lKT1p6GB9BLo0OX94MK+AAB17PgqWOrV4MGzz1YrPJuVcrveH+rZoKLS
         0oKEZshiLBgixCDfUeMQszzK91m+BBLeXn9t/alHwl5WTd5FcoHhoL03XeBb4kzoUBSc
         QZFRnF5uYs1Zy3B06rzJ/Awgr7u2vF5bzRn1m0SLf9/7zALY3v6NfmrTX4swBl7yZKme
         mrEBFN7ixrPEjNQxUTdqL62EKNEu9Jxweq47j054ZY27ZG6vl990mwgZOV4wcLcn6lUy
         w91g==
X-Forwarded-Encrypted: i=1; AFNElJ9pHhGC4biVfCdkDrm045H5L88VKU1fhZOjbMxiKwKR+fW/UQ3c7Sf9/sdxQEt79ew4Bx77mawoT48e/iUBqiI6@lists.infradead.org
X-Gm-Message-State: AOJu0YygI9g3nbaayDU4PlYFwfBp27du4gw56iMzYH9KVwlyhSHcNRe4
	5OBbbg/9F97NSfe8p53LY2Htco1QKaqvk+ItX7JoM1cRkFPoVr/QQm7G
X-Gm-Gg: Acq92OG+7D75s9IE6aDU6keLFeJrzJc8MBMcEWNeoRzfoVI4YG6X6NnIRTXWGctFqGB
	jAsq1xSAmvJawam/LYl9EjgrZPjAbPEA1eBmm6m5bJLplP82buYI16dQwYBc40zYfvBAvNGCfUJ
	r4k3s3lJVyzfENMs0xscGi5CDA7neITCI3Q1XKsEkeqjg4CdZnQ/hcHdZDkgkCP0X4A8jqnRHd1
	M5Y71yxNeupj3s5S2JBsQrKEXWAre6fqysbVe7H5lhu41apCvsXqZ4ntMERV7J0vZFVY86bLA8o
	iYIrH5q1uYDBjXYBRMV5pYXitZXJPIkqoW/SaPfgsC/AlqUMeai8DmzanjGajZyxSkTzorJ3H/Q
	DHfVmqNPyfh3PkJ0TTqQqDTCWU2tYnqqZa7lBAhxDGkS2ct2TnGXiDId/NZKvMPgxsCiW/m3PSa
	NH/4LVe+UNEJ70H0fq8s/n91OlG/2uynm+y43uPNLHqPnhZHTXzeLX
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49044ebc2edmr57464185e9.24.1779466304832;
        Fri, 22 May 2026 09:11:44 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:44 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 03/11] dt-bindings: vendor-prefixes: Add Riverdi
Date: Fri, 22 May 2026 17:11:07 +0100
Message-ID: <20260522161105.277519-16-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091147_096909_D90B9F5F 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add vendor prefix for Riverdi Sp. z o.o, a design and manufacturer
of TFT display solutions.

Link: https://riverdi.com
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..bac056d486e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1403,6 +1403,8 @@ patternProperties:
     description: Embest RIoT
   "^riscv,.*":
     description: RISC-V Foundation
+  "^riverdi,.*":
+    description: Riverdi Sp. z o.o
   "^rockchip,.*":
     description: Rockchip Electronics Co., Ltd.
   "^rocktech,.*":
-- 
2.54.0


