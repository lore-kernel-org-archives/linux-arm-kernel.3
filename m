Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943DBE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 20:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PXvsuXMERf6df08VQWVzjea3IcYfHYsxE45+1XCwwhA=; b=or88cacnvKtj1H8HfFB3UzP29I
	Ztj/BUPVjVxjSRDYldx17/XaQrmLmpZAmXTGJy/3ueluZy8owE9oPyHE9WK7owhTejvivC/2dR3PY
	eyBvD2PeyIvbSng/Hd0JXJz+M1i/HnhMxVnHbylLGFYD317z/N7l3ZCwkiy7pcVliYmCyy5W8dlsb
	UqwUh9L3KUtRoma9fVSQFLPo2d98+cjEKFd6VnEElF5deukuPfMpZSOtMoox4mea8AOjJj1m9gicq
	w27Y4dRzcYC/lpl3ilagap6ihAzuxIwWhzDUcKTG7EQ0Vqwfe579TPqm0WjkiL8KSBv5tt87g/kan
	zJQ/Pprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKkZq-00000009CTi-0Pkr;
	Mon, 09 Dec 2024 20:41:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKkYo-00000009CN2-0XXs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 20:40:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-725e71a11f7so1179834b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 12:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733776851; x=1734381651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXvsuXMERf6df08VQWVzjea3IcYfHYsxE45+1XCwwhA=;
        b=bbdsTXkxzDzdvHrOLmOrm7bwkiX7LWro3ZW/jfcgbTimodFpC+BDhqTSk/nhgjf5H4
         j3mGFosqhdEpMlXqhN+v0FqhnK6BzIF99kFSWFiWf2iBWbFzm+aXrvKG8KggbiF0yyrD
         WujOqgBrtdGe7Cu2o7tN/NnhZH/2/XzZDxW5LQWRHeT+lz5edG1GraRjeDykSJlV9KZM
         u1YCctaTYjaGRDUwtcChZgAhQsMmS5A57QPHmNVf5qT7T0HdxyQg+K86MGz7IJ12Senj
         /OkCvOLQ+LGuutVuaBJiZuE2l22Rvp+KJMBgfa+jQvKqNFSN1Gphsav86xXkSxlQJ3On
         0NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733776851; x=1734381651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXvsuXMERf6df08VQWVzjea3IcYfHYsxE45+1XCwwhA=;
        b=p0LMtZf1lqUsAdoMKGw+kEFFaA8Bc/QR6alZObO4jCqnhxYiDvWBFGl3Ozd2abv/Qf
         XP9rwRMyjaMeNN64SbRytnB/UYeg+AsyyVW+ttz3qAx0jEkwO+HvqoFauudT0C6lf6o2
         WeQwTO4jX9tbInde1uZ1Atx+ocVofNK2qMOHaVs4NAtnFPSu1BzTmDCBKWd61q/aC9za
         RsqzCPLrR+K9AKVOQxAP7fcbuhP4iyfNDxZlV4H2rxuhOKVlIpXZQ+y9GsxqbcobNkBJ
         yMBRH3TDZRDGUqQ3B7wQ7sehkHXsuhAGZaE5ogSwgrWsW8dfiS0hzdJecocAGx9KyTSQ
         eACQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHi/gZua+xS/tWGXx7kDQDMvQsUCxQHRqjG08ZDitsM6e4hAsrQ67YmVr2Wij25Yftwrne1PRGbaYb73BAAVjG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3AWhibyHWrkNCb4SvLbU3nguWBTGfBOkQE2FOOCqgq3hMGBAM
	WQtKPyhawUJDLFqt1TkXhABSUg5pMY7P56Vszu733Bl3Oa/agcAk
X-Gm-Gg: ASbGncujE0dSfuG+8B8Q96oj2OAjPTTRyqYyGRIKF6WRUJUg446z2u6pdgz1pTROQPv
	E5lUQLAlyLK+VqCNgr0QWltuKVy38Qj6IDQAgUtg6H6WtVUVIvQmIq9ekMt/uOJg/xfI1fZcYlx
	+C4fxtP0mpfZ8cRnzVy22B58KkiiBw0qLyRBvfUPHg0IWkm75pRzBAb4TVayDqQ47h7TzbwoQ2E
	PpD46rsmPV6CfRWJYomqTsbd/vMiso9zY3JgDX1WC4JhJNzJcafkBOHXEDYxXILi74=
X-Google-Smtp-Source: AGHT+IFc2Lceg6DjJ7cqQKBERaygfwtBeBltRK5cwNCLJrhI05ONbYSi9ksuO0DeTsh5Sp/KeBQ1Aw==
X-Received: by 2002:a05:6a20:729c:b0:1db:e327:dd82 with SMTP id adf61e73a8af0-1e1b43c4e93mr1397192637.5.1733776851595;
        Mon, 09 Dec 2024 12:40:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7c4:c4a9:e35:ccbf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd5207528csm1707219a12.36.2024.12.09.12.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 12:40:51 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9
Date: Mon,  9 Dec 2024 17:40:02 -0300
Message-Id: <20241209204003.1295503-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_124054_169561_0078D996 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Fabio Estevam <festevam@denx.de>

The AUO G084SN05 V9 is a 8.4" 800x600 LVDS display.

Add a compatible entry for this LVDS display model.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 5af2d6930075..fcb5834f799a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -42,6 +42,8 @@ properties:
           # Admatec 9904379 10.1" 1024x600 LVDS panel
           - admatec,9904379
           - auo,b101ew05
+          # AUO G084SN05 V9 8.4" 800x600 LVDS panel
+          - auo,g084sn05
           # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
           - chunghwa,claa070wp03xg
           # EDT ETML0700Z9NDHA 7.0" WSVGA (1024x600) color TFT LCD LVDS panel
-- 
2.34.1


