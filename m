Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066DCD12D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 05:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RM89Z8X1J9m/vAfwktJr4x0l9qOUQLpLqVFpzBQlXNg=; b=yMo8EhU+BElnw0PUBU47cwcq/c
	UBtU4zeZvNWdmMa46tz9ESfPhdkhWIihPqxLxv3k/PsLTSq1JJLQGGJeBOGDBDT2VnQacTOeUieXF
	PjBCm2S1/P9RVViweYnPJPcj8RbX6ZE6N/PhGpzRtaToRRJrE4HE3qjauJM8ffFl0X7OtHc58pGbd
	f2PDz25e0pVShyAcQTwcG+Ia8W5Lxjsud6gPpZN2EBFRMLuxH8Fucsq82DbM9ELwSlXb3HpjhLPYP
	wSJTnk3u6t7CHBtbNCPKJxwQtcdzyHssabp1OxJSNL+rd8G8Cz3CbL0BHW04Kk0Pf7apSIlQUfa+v
	I0TaZmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAMWo-0000000GMgr-3DiM;
	Mon, 11 Nov 2024 04:59:54 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAMS6-0000000GM4S-1g7b;
	Mon, 11 Nov 2024 04:55:03 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7180bd5b79dso1407835a34.2;
        Sun, 10 Nov 2024 20:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731300901; x=1731905701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM89Z8X1J9m/vAfwktJr4x0l9qOUQLpLqVFpzBQlXNg=;
        b=ENhpiCUnkS9r/auX2P72/hDcZHlmHiYPd2QXAvZ5Vi8qB5A2Soz0rdTnmyoRX6d7lv
         M9sgBh162QgtLQ9TppWNX/BhVpVMem3Z7EFwcyX3NL0vgg5ZHD9GAyc72Z5bdqEecp4V
         GPgPufwj2I9qbjZjJh64qSvAKPej7boKVnn07aZJy8JuM0rDHdIopvx+ndHQ+uAj3O1V
         9GKWKkFCDoDQqsmQ6Y4cpo3HwkRYSVQocDMyHKOf7QD+f9MpNrrXrWKynsUMm39+QnuW
         6yDkKpG22JXO+kbbraz+UY2p2iojYmcDb42BKpzV+bhoYfyTGtWqIFeQ7snCcrZpVbBL
         80Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731300901; x=1731905701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RM89Z8X1J9m/vAfwktJr4x0l9qOUQLpLqVFpzBQlXNg=;
        b=GcN1pL1EE4x4TC9OGw5maGe0qo5xcAk9i5hbThlO1S2eQm2V2S/D+GGJkkPeKyUrlm
         vdmhNLaSfjKrA6oEEYk3GB+vMo5eSujBkshInwgBxc22mGLroXuBVruRTJQm9X1i2WDY
         ZruRpS2in+jb7erqHdqSnuV95vQxSH1jo0uB6RK1DGZUBWzuT0mKmLvnZ+t5RSLXG12W
         gzBDsCFbSk5QDZa+d2DGUgWOjknqulMN0W4Io4h0VK6Himo9jLzk/8w5uVP+vWLp5dxg
         abZ0ILO7HevE09gsfKFmbHGjjgGwDSyRz33pLI3A/QYqSumMRm1Rpvfd+gOalMOrcnjg
         8zUA==
X-Forwarded-Encrypted: i=1; AJvYcCU/KrOeuo9Z+/EcSYPExGkISgVBAvBaYjERcTRNdIfg/RbsGjG1zx/wSWjNPbUpXvy/0G260RixV5Ez/xwKP91E@lists.infradead.org, AJvYcCXnckH7+3h0C8GpBCiO2OCDAZ26TD257wNbM42cFfEPmHuxX3wRfb8ZRm1GtEpmzxoSo0OCqQcmLqUG6OEQxFA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUDBQwic3tOo3GLC4FqXGlyRP46EJghXwDPa6q5apXn4zXarVf
	ZS/UyDM/Wxg5uVS2tsUL8EPwUqPwjiCTwT6IKZq1tyQ1ipsB59ZF
X-Google-Smtp-Source: AGHT+IGJljlRh/Mfy7crqu/pWQzecRFC7oqT3sDgsTUU9vusu3hLddExKcAbC5V7MC6l+cGlQBJFKA==
X-Received: by 2002:a05:6830:9c3:b0:710:edf4:a6f8 with SMTP id 46e09a7af769-71a1c2088b5mr9756225a34.9.1731300900973;
        Sun, 10 Nov 2024 20:55:00 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:9ab7:85ff:fe20:5865])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a107ebd11sm2089439a34.10.2024.11.10.20.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:54:59 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 2/3 v3] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
Date: Sun, 10 Nov 2024 22:53:25 -0600
Message-ID: <20241111045408.1922-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111045408.1922-1-honyuenkwun@gmail.com>
References: <20241111045408.1922-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_205502_590369_464D83BE 
X-CRM114-Status: UNSURE (   9.62  )
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

Add devicetree binding for the Xunlong Orange Pi 5 Max board.

The Orange Pi 5 Max is a single board computer powered by the Rockchip
RK3588 similar to the Orange Pi 5 Plus.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a5a8f8bb9e48..82fbb22de207 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1070,9 +1070,11 @@ properties:
           - const: xunlong,orangepi-3b
           - const: rockchip,rk3566
 
-      - description: Xunlong Orange Pi 5 Plus
+      - description: Xunlong Orange Pi 5 Max/Plus
         items:
-          - const: xunlong,orangepi-5-plus
+          - enum:
+              - xunlong,orangepi-5-max
+              - xunlong,orangepi-5-plus
           - const: rockchip,rk3588
 
       - description: Xunlong Orange Pi R1 Plus / LTS
-- 
2.47.0


