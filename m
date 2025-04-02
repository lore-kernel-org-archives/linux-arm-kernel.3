Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F183AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqDKtnr5GaD9ToBXpFolLKV1wlSZYYAQ0+Ag5ew6NeI=; b=HWJpqd9KLIySEq+BdH/8sM7HYK
	wdaBJHgD86icxM6e13pDqUzTntw2xwtyHmBkmU2YT9UEAS4BNtG8tyhgNmuwljCdc75mSXC2Vjd6m
	fGKbSJBhwy7ZF2EMGZqz8YSln0bMxJhaGicCgbJ8LMax9rgSg0ggGosrweVX8Tltyxd9Omfygm+TE
	k99gxdeXQVydch9aVfXY/oLUpLRf4jgAXpQKgJye2AHc2Hflvgd2aTawEArdFH9sjxQawsG+4awGI
	pm54TZPsukQDQ9hdOo4FkOUIZ2wwdKLnFPtRh7cxn/OFnw7+avrxVm1Prz2dWACKq8v++8PsMp7dz
	nsbkemdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03Fa-00000006ytd-4A0U;
	Wed, 02 Apr 2025 18:55:46 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u03C7-00000006yWb-1uDg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 18:52:13 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3fbc00143d6so56467b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743619930; x=1744224730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqDKtnr5GaD9ToBXpFolLKV1wlSZYYAQ0+Ag5ew6NeI=;
        b=h+7oaD9RBartBG1FSlvcqqSsPHKTQME4LgEGCG7ac0ao41mUFNZ+yf/fVmwOcf3g+O
         FWYsvyhJX7s3H5jo8n2GHr3tAmVckP45jvslfbGndFhchBf8gj08dyllD9cnGzVib0Uv
         0HI1sphIXjMT6DW2GYuWOzn5XJbDBCjWPuTpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619930; x=1744224730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqDKtnr5GaD9ToBXpFolLKV1wlSZYYAQ0+Ag5ew6NeI=;
        b=YmRxTPmc/IF6S27lzkJQf/vuqcpXdFSfodO1yAnr7cEcjbEamD4pvu58XInQta93Nl
         Xk7x+vL7P75S9+Yd38UY0TqsDPrsEuJzKT2P1j+ZVG1ndNhNb8ZhIsvUw/ab6PATiu8N
         rV26Rk32gcaCLNwDpbCW5hupBYYxSkLvKHZ+VgusC5/Yib8J2nn/X0bAJhSkI4PYgzg1
         JKrPrlGwEPuBU1Gj8IeN2XEDJzJtQBsML9Q6cWhje4lai9ZiMQ7iBKZGNWn9cLufBXGm
         Z2pGkcWeieLQ3LilBOMq8JKwXDbz/PHf3INM+Usm50eTuTbWUf8I9pLdPDpjhUg6/BRO
         Uemg==
X-Gm-Message-State: AOJu0YyEc1QWrHkvfJgQn68bVh5l9AYdlEbxJNVv9IYbbQF7RN7ldOIz
	YavUVLreEuLvgPGkDbxKlAOsUaS+LEO4nD4sslvK3IGuMFk2lNcNJyafTe27V6LK7IGwbq4XxGf
	l79GR5CyVArNNSrvaJ9LC7ePqBijNUuYwviWOFOLhkNMlHcXrqux3wBu8S4Ijo1IMji7KrlhyAX
	2gAwql4LG9skIj8Zo15ZAYvba5910nxQ7LvLVNVqT7Jz23Lh5AM/C0fJJc1Q==
X-Gm-Gg: ASbGncvuaYLnnCxDhyAhFmpl5Jotagr91hbpIGLHtbkfBDo2Z8/HfjRF/hueyvjhB6W
	UxMQTle8DLx8YlpiP9M1RFy3o4NHz9l9uJm2RF1ZB/YqmjyQ0o9jcNk/knKmCPV9npiCs+d4AyV
	sArQa6bwy2x5fNdee0SPFIzapq63/g+aopxce7goVza+5bgECEyANrIQK0Qj/9WE/Dhksuotk4N
	veVQcSPEodmJnYKcnScALeltpKcZvubMfXhY5nOsGKVm6AEqOw2dz8iTJUUzjaaqJeGXF/twowN
	fvFpK7Alxio+gckWtwBDKfWK7pO03KSeUow4ltYqQ1fAOW24CSCq3Y5UArB0GRQ1mR6CWJwXU1x
	IFyit6M2Y+9NlvM+ro4WMFw==
X-Google-Smtp-Source: AGHT+IEbIiVI9NkR/CoWxd2DaTFQafqUnLyrs7RI+ylIFJC0k46MclFsgarT1oYobJHD6u84PnaCPQ==
X-Received: by 2002:a05:6808:218d:b0:3f9:3de3:c8de with SMTP id 5614622812f47-3ff0f523e06mr10176623b6e.12.1743619930225;
        Wed, 02 Apr 2025 11:52:10 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff051aaf60sm2470462b6e.28.2025.04.02.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:52:09 -0700 (PDT)
From: justin.chen@broadcom.com
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
Subject: [PATCH v3 1/2] dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110
Date: Wed,  2 Apr 2025 11:51:58 -0700
Message-Id: <20250402185159.2976920-2-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402185159.2976920-1-justin.chen@broadcom.com>
References: <20250402185159.2976920-1-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_115211_483757_2AFDA9C7 
X-CRM114-Status: GOOD (  11.79  )
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

From: Justin Chen <justin.chen@broadcom.com>

bcm74110 brcmstb usb phy adds further power savings during suspend
states.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
v2:
	Sorted compat string ordering
	Add new compat string to constraints

v3:
	Sorting try 2

 .../devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
index 580fbe37b37f..843d04027c30 100644
--- a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
@@ -18,6 +18,7 @@ properties:
       - brcm,bcm4908-usb-phy
       - brcm,bcm7211-usb-phy
       - brcm,bcm7216-usb-phy
+      - brcm,bcm74110-usb-phy
       - brcm,brcmstb-usb-phy
 
   reg:
@@ -139,7 +140,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: brcm,bcm7216-usb-phy
+            enum:
+              - brcm,bcm7216-usb-phy
+              - brcm,bcm74110-usb-phy
     then:
       properties:
         reg:
-- 
2.34.1


