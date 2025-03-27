Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC37C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s2Bk2jjEjtn0ANWrGki0cYBsYkeN6iSQygrdQRlBdU=; b=wtb8Q5XcT/c/To2T/fimJBZvWC
	2qB9TFArJ8wYTIkGsdijGO8ALYlg3fv7chUY9ovkTUOVBcXpsc5L0kvPOoIhSM1W+H04j4JGEAIAr
	XFMSapEAjQw0DwLpCEwSfEXniMhwZIg+SjKP//1QHcQVrvzQIIgAwqy1OljUWmTT/ySawNQB8LHdp
	QYT711OzCIoa8rvjMGdOWCs3ovHD2JlzDbSjmSUjQIFdmVJc9Wx7vmBqP5+QqaHMwQJomTwYnBE80
	8rU0gSU9c6jdKd2ZK8iwXMQqBJVSH0HFLO1rm4wHvh2iMsqLzigytXslBxhayo44aLj9zkafeUvXf
	6r2ehqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsW1-0000000Bmrw-3P1M;
	Thu, 27 Mar 2025 19:03:45 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsP2-0000000Bln6-0CDx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 18:56:33 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-601ad30bc0cso1514404eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743101791; x=1743706591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s2Bk2jjEjtn0ANWrGki0cYBsYkeN6iSQygrdQRlBdU=;
        b=AZVMP9TEsEWrnDicsjyI8u43J5dALxd4iTTvo+3B1TDUDadiPyyGO+CBdThH6TdE3p
         ZXdRnsrDQrQKWo1N8ulrOQAWCwNMs+1hS4eMDc/loY6Vo6J3gWLgmksRC7ZB85lVokUP
         j8Xlo5WAvIpO/fvIsVm9wzjiRCwNABx8Zu4Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743101791; x=1743706591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s2Bk2jjEjtn0ANWrGki0cYBsYkeN6iSQygrdQRlBdU=;
        b=UGBlklMOTofuN03fOeAOkuxqw3w1AS/LRQb+qou3u6M1Y2+P0bi7xlLsdDpLdTkHcG
         /m/InguRGUGsWRMBM7wA+EU7EAoi8eCKGnS26iB4PE5/lktxLIaSQGijfXBVjdSRE8zv
         tEhInW2A3KUlPDM3ORergwZ+OS0glMW5a3dBtwMDAScrlF4Cb6mUb+jn6OyocHlj5gHu
         ZrOrnMxZx78n+mSHrj16jUik8nFILURu3Tkmp9LfFFvGPRX5zZykj8oUmZJB+TaNCCCJ
         hGhYiOf4kkmeW+Q+CFWQyA8MubRBC0mkUTvbzzHte4nffKuDvbtUjJ3DWlyLjnp4Vopt
         i8Sg==
X-Gm-Message-State: AOJu0Yx42eFFwZsZzN6z+0vKhjCDBpfD/Q/6A6mzGqmaIncsFNsscMrr
	SLFgwnRqgQhwyb9YmJ5WopwaU/l+2TRafoazDBpylf8E+BvLk2MU9aZs+nMUvRu53Fdx/81VNeu
	YRke5MQ2jEnWg9d719Zzo5YiRYYfbR5hI43A/UeuVP18vHvARF3MAzT5o3RDqP+9nE8vhTZHnRG
	6nUBnQs2cvjYDGEagrAvblbfYQirimyIr69Z9HshnDO815RyvNF1sxbwzfnA==
X-Gm-Gg: ASbGncunqKvUOetqO5NFOp04k3lzpBJ6dpfBnaiLpu8gMKUGYYw6T1p4u1sEni0c/yj
	Ewa/TxM5yoMVnI1ID8TiZ9K3AjjLYn8c3xITIBbZkKgAi/6buSJDnPzmeuQoUpxdeCiMdiBdO7F
	R64eqNl/DF6cSsEfxjyhG/AqvxyhpwfvL8rQ/bGrVU2/0Ph89Lr8yG2JNPIBPVQcQhq+Z/jO1Hq
	XK2TgHS0cIYm7/KPR0ZZ72a3XWgpAkyHqXFm7gZOxG9kIslnXx2T9H2j+aS7kFZ8kDQlfONtI8V
	bxdJqfx08/IAaDn7OIwWTQZsukPFgDRjduj23WPGpU5nrl/YUz4VUpx3ZJHbGXL7Sa7D0Rw59+Q
	aP75rcpcuG6ZLcAmqBWfB5g==
X-Google-Smtp-Source: AGHT+IEQeyF1ChzfQPByDWuHLCAdty2HiuEDVVEA5CMpBaviN7elicCmvvVu1wJZngtX0tBCNiGcdA==
X-Received: by 2002:a05:6870:ac2c:b0:2c4:1b1c:42c3 with SMTP id 586e51a60fabf-2c86626514emr1043383fac.9.1743101790608;
        Thu, 27 Mar 2025 11:56:30 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a3f3db1sm77997fac.4.2025.03.27.11.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 11:56:30 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110
Date: Thu, 27 Mar 2025 11:56:23 -0700
Message-Id: <20250327185623.3047893-3-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327185623.3047893-1-justin.chen@broadcom.com>
References: <20250327185623.3047893-1-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_115632_080556_8E14567F 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Justin Chen <justin.chen@broadcom.com>

bcm74110 brcmstb usb phy adds further power savings during suspend
states.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
index 580fbe37b37f..2e668935b454 100644
--- a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
@@ -15,6 +15,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - brcm,bcm74110-usb-phy
       - brcm,bcm4908-usb-phy
       - brcm,bcm7211-usb-phy
       - brcm,bcm7216-usb-phy
-- 
2.34.1


