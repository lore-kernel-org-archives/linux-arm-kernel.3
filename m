Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E13CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Px4DGTedr0t+HqBVc78Zx84UzxWlcHUehvdoHcOj/G4=; b=lZK4J1/8om1F7gJEyECGDleYS7
	6H7hsVb0Z/Fs4AazxtPS4RzZ+TuKppRalE0AVHEtkH8jr+CP1vDSCrVSgRp8IKJz5zHxyF0zRXiKU
	CQLk9R8VK+zs87yO5+c1/4cSETrsrey0CcwrXhIcAMSjS4L8CPQDYIkgEar6hO4uhYyP93PJCGiWt
	CmzDYGS8v5FpbHCLI3jrLfqH3jmPk7xrD5fh2j/m8Bh059nEeSPAi76jAdwGvi5xTDlF+3yGwfv1+
	sK/9+xoz9FKBmJ8UfDI4R2miUyNX6SLWG/1bINx/NpWux5t8WBfO1NJ+bxL2ZRN79LoVa1toCyqY5
	N3Iqh5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD2IG-0000000CTjO-05k1;
	Sun, 26 Oct 2025 15:04:28 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD2ID-0000000CTiP-14FT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 15:04:26 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-290c2b6a6c2so40273975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761491064; x=1762095864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Px4DGTedr0t+HqBVc78Zx84UzxWlcHUehvdoHcOj/G4=;
        b=ncjtlyHZ1J2dw52S4Smcu1pVLZXh2ViDLoVqPw7pCMJvZT5HvFkpZ1TkgJkE7PDaF7
         OY4NfHXMIq7ouxmvwhzxukyQZbrQo0t5oMWf+gBODrc7VX+xqIhwAnHXDtvGvdFqMNA0
         4KLQmO2km1qQp+PaffAGDaW6Pwg/9UfLe6JL62V4gaD0DvH/WRruxmM0RackBlmtWWA0
         xjlSXSgdaHUTfyesL31fR2vpmqrubtlGC4Sa/E4rgoRxu1BlQwhe3iBNQQTyOfDQG608
         P4YH28hEY6GLw2aFGcxvWG9vh9jZGZhwEITXhVNN2xJydibdMNY4g2zPBHO7pCKMtu4Y
         LOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761491064; x=1762095864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Px4DGTedr0t+HqBVc78Zx84UzxWlcHUehvdoHcOj/G4=;
        b=mmRUBbEXjlURtFavJjYA5ch+OZJam/wr0dFYr1K8iDaUPgsbA8+OaiGfJCgxPvQKFV
         xHX223TLjEViva53UlqX7QI8E91H+JjGBtm1Wp0kiij4xp5UY+TXj/9v3YAn+8OEtF4q
         UuuzlkRj/aTt41fHQZ9IHDDDrCM10ZtzN8AbVhBfb1dPWVciDB/OkWqT3ghsfg+cMfHu
         5fJGxrt8RfraQKs4X2k+/VLTpStVcft1dnuDtWKuj27vitoZOW1oUTRmcnsb/83tioeE
         gErv6QZPy1SJSkx8qcJEznUS/REUN4vR0FeY2q9b5+3Wz40I/Z1QKR91oXEnuASfNgep
         rftg==
X-Forwarded-Encrypted: i=1; AJvYcCUKXzgGNVqUDFm0s60n/j3KACjH16eHd5guyAFh+rhNhe0231l2DJVcl7sdwiJUEiq+kJHSxZ5z/oA810PWM/2q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvr/0HVfD/V0t69QulmLvhYzWOKFbZQv3NeZIpvK9jof4AiB1J
	ayNCsblwSUg8FVCF+TA0NpnjeVw1ui6+RkNIOCtw2dg6omMQvv5eHzpF
X-Gm-Gg: ASbGncsMw3OgBSVgXymDwlYtRM+5aVe6ERPATcopE/e4o04Ibt+J2jjuGx2z/3rKuGT
	t8PRJXWSkBspOSsPcv81to2VLRk6fa/JaKG7tbmq5/UyH7byWr2VMuzh2bLmaDbem5txv9NVuDF
	VfICyClsX2kDuGorJSsX5CzKd2vmHafNJBE/V9bsqiGfQmyMJVas53l0H6AJOb6Sx7wvd7m31Fn
	/ZgDyv8v/SyzR+rh9OZVLs+dpSXKRHk3fulF3oX8RyvWBgGUEB+gUFnZg7wIDfxQoVhcQSRzDaI
	Sf1RanLVBNMgNajjTCN0jfjj+0oX8qoDNLyO5IvpN3YynE+ze/p5TYosh+vG5L3ep5iOyOmwduH
	pRqQfUzrQ+D83ELOsS9k3J3g4mt9FfZsi61mWMJ1RQXJJkNoE9LSDErM/mRLIV6WhzBPcVTVNOh
	MhayX+UEi5AA==
X-Google-Smtp-Source: AGHT+IGL4spg1O0mDgF7D8EgJ3Ni4wTgAIJZGQLvD5iwsaPiYkWPvkdowdH8iIGlLOxo0R0ZBTdCOQ==
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id d9443c01a7336-290c9c8a738mr391932175ad.9.1761491064394;
        Sun, 26 Oct 2025 08:04:24 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d09958sm52320375ad.24.2025.10.26.08.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 08:04:23 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add NineTripod
Date: Sun, 26 Oct 2025 23:03:56 +0800
Message-ID: <20251026150358.1078453-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_080425_289166_5FCF9286 
X-CRM114-Status: UNSURE (   8.61  )
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

Add NineTripod to the vendor prefixes.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d188200..37687737e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1124,6 +1124,8 @@ patternProperties:
     description: National Instruments
   "^nicera,.*":
     description: Nippon Ceramic Co., Ltd.
+  "^ninetripod,.*":
+    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
   "^nintendo,.*":
     description: Nintendo
   "^nlt,.*":
-- 
2.47.3


