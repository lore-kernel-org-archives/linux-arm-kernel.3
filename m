Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1168FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zgUCdWpblI3F1DgOMBM4UZ2prMSNQGxKSsUtwrt9A+E=; b=uM9zWIcGR/8ddxqhfwGqwWbxUU
	Uzdcil+o1vVsouqvW40riWrteS5tpwWS0/IzgydiC7F5zcfTp+dO6HbKrzoOHwIHzf/zIaaGQd4lt
	Z4Htq8oDx7eZgXf+wQ+70Jz0jYkjOfnYU/kL7P2Mc/PhhAPDM60wyX9BCcZ6WKYklPNR3kwPFspEv
	ZEL5Qq0g+WrJwddHumNt3UsBAi0BAjdTfdAw0S3cpkcbTBJBGLa41bjSipawi+1aiFliGGlTHJlgb
	2PppRXUy1oVD19gB9FFJbyxOmu8LSgCE26LnbqwYz8TLJ6iU8an6l+SLTC8G6lmWFh436BbM4r69y
	BK6pNXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxyI-0000000BEfZ-2J15;
	Tue, 10 Dec 2024 11:00:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxvZ-0000000BDrl-1GDC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:57:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-216585cbe1eso17535515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 02:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733828236; x=1734433036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgUCdWpblI3F1DgOMBM4UZ2prMSNQGxKSsUtwrt9A+E=;
        b=OxvERS0Umsv+uzozs4QFmUiW1VcBZqy4vt0FOJ30Df7MTecoKJ51OS1Keylba31zfV
         JxAjNbf9scsrX7G0j6Dec9zsfAVwuqyDHlXzPHt6AK7+Z17DwlA3tUkRU48VNcEpp/06
         cx7Qv+MNatXYnDqjFEnDcAuYKXSHJvs3oXCvHaZe820U7RB7kYGgaBP9VbhqsNAbsPwb
         6lgM94Vrt35/pVLLOAjTUR6G9+bzo/EgrOiuWDYfEw1BwZkuok2yWTNTsqA56hQc+3ck
         z7cq3vjISlUnadsyHCMxtupYrisgHld/Ggy927kPY7GD+EOsF59z9DIuphBUVKYnOq3C
         cCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828236; x=1734433036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgUCdWpblI3F1DgOMBM4UZ2prMSNQGxKSsUtwrt9A+E=;
        b=gBP6SLoG+3f3D+nIPCnOrn/g3zr22eMwp4Zyc1lnTYq/c7OVYmP+EjUnDtilMSfm/Q
         TW5NK98wsHOqDWgLAks0uHeiaVG3VO+nJrbOMNMsrVZ47tC4JuF26uLnfF2dmbCfJbC3
         J8eFj1OV9DBNuVgevervPowk7StUwa/+yUQ6PcZTN1g2cfD7TVXk+Z5LDG5NZJEFD5aQ
         ZDW6f0rzXlVhEVKPcCyWuCkl2uCQlIhCNkUVaAC1GQc4AtP4iCMSePCh1A6sPBj1pv1T
         yb+WaNBKBUX6W86vx76DHBDOhhMXCI9WcrPkI7D2AKP0eXPL/gPFW3AMUUy8OSbysRmT
         9LFg==
X-Forwarded-Encrypted: i=1; AJvYcCVblCiQQdlCI73GtiDIbp4VrRQgoQ+j7dzxPCsNI45PpJOC6HRwVwIwq9ktvSwlUsi+hX8l6KzOJcXRRmOnrMIr@lists.infradead.org
X-Gm-Message-State: AOJu0YzFEXNMFQQO9mALtHQc7VyanPKrOmrj114H9u49wYBWciBx/vI6
	mZWKY+V6VOQ+yGfPYnFTn7ZEMFjEGnp9uzA+CP+WjvZaMssqXjQxIfa8+w==
X-Gm-Gg: ASbGncvTksRB/DY1rqZ1lWe2FZMABPLeH6qonxVPQhIQTzFdt3fULoRSQko5YHzXEF3
	rsgwr9DuWGB5Ir1nj2bxBjFfW5SMXhafn4CHY534ugnxnZIV+lbyv1WeH4/kPy5tZwee6dK/Dfh
	zOO+vzdnWCsy64IisXeINImCI/2AxGRLGG3B6f39n+q0l37X/5hehJ06y9X5bSjMU64zZiOISar
	dWc3cKGGL6XGEvK40U3wdTqc5DDi9/N4RXeP5wVcwi6sdWIunP7nZTo1CXlSob+t+vv
X-Google-Smtp-Source: AGHT+IFZS+CwL6DlemunV0X7hNvE9zPcFuht9fokHFareRkZRku0/80LFiQQ4eLAdXdtO7akoWhD/A==
X-Received: by 2002:a17:902:e809:b0:215:8dd3:536a with SMTP id d9443c01a7336-21669f9985emr60165085ad.4.1733828236463;
        Tue, 10 Dec 2024 02:57:16 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:23ed:f795:ef82:746f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21615b1e6d6sm71068955ad.104.2024.12.10.02.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:57:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9
Date: Tue, 10 Dec 2024 07:57:04 -0300
Message-Id: <20241210105705.116116-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_025717_346085_1E22AC55 
X-CRM114-Status: UNSURE (   8.98  )
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

The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.

Add a compatible entry for this LVDS display model.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Added devicetree@vger.kernel.org on Cc.

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


