Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25256CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eaIcG+r++rKQesZ6uTroJVEBEjb38vwPSHlk+jRRLok=; b=RzVNAd19aTLxf4JgynZ6mQOzCu
	6alpLDXls1FViR2cA4/zfJLk/jhpk7h2qBfM7oeOFq7wD98v8c4j6Jeg7mF7U3/6i8lTuZrGtKRdr
	1OdMMnIVSFiuE5fTTVoZvrJdEwgnLooUdMrz3kIelQAgRjRL8sbyix5DFxHftXFI9xZGQktunyW1r
	dtw5P2ZRZfq87LA1gNedGImWy76ZxZ8BgY/Q96RzGa1SFr31cne7Wa3Sn9kvDD+HVSwr6fp6S655v
	2kYmSrsvrIxiS1D2lVlBZjh/88oEOpEeMlA8JADYKGSiO4M35BnUnW64hqYXpeTkNEGaa+fzkCunG
	VXKZ7o7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRcZ-0000000GbZB-0TuL;
	Wed, 10 Sep 2025 20:40:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRcX-0000000GbYo-1tGs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:40:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-244582738b5so62231725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 13:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536848; x=1758141648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eaIcG+r++rKQesZ6uTroJVEBEjb38vwPSHlk+jRRLok=;
        b=HQOmblhBLXe9CAAertzGGR5I/hwP1dHY1aIWX41UEszqqAbQpNl3xwW8Q5zQYXnMhg
         F3pKoeCIgTURs7Tv4MOyQ81dTwwxqscLUo5lD1iBNOLSlOsdZByWRSi0tKPfUnwtZ6DE
         0roq4SLnHhtlt/fnpJVkl+PhOF7IfISJgercnmYBiBV3cvEkzrEizre0xAZ6ptY1W19Y
         i4pC2/BCu0TZutdUCjSGdk1XulT6f5tET98VghZL+aqsmx2w1WVcnaMvrnTCYFP+q/SQ
         YLvZcO8uj8dtNhv2fEaxmgb3xWEhFu8JpAOLY1xVziPCsZEyQy1HmMY9NXPckATJCVFE
         XBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536848; x=1758141648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaIcG+r++rKQesZ6uTroJVEBEjb38vwPSHlk+jRRLok=;
        b=c6BJISwpGYZy3wcLxB7wlBHW6WmnS/3A/GDW7w2aWY9KGS8p/KKmdpRY9eaOl4MESX
         mDMavZfvhEdxYUeFOrN8CAg5QGAOMlWqsoxZjbCKSbJZAuES4Wr4J9odW8Wrnsbvujqw
         TK7/4nD/2SG4VG9ltJsNOrslh1gO0w6cmZ5Iu3+rZN94kid/e6paywyEThDy7fjZb+K0
         MOBvXAMU31AAtvjEN+k3Wcg4UKvJIz+p22Srg30UfVZ4PfFUN+3tn38fXbwpDVyM48dw
         BhH90zVjMN7KqWxhuffXnsgE3ick/NRX0RTHHtU4nr6/KSJrHvVS+TQY4hc8NsOCiTZ2
         Nebg==
X-Forwarded-Encrypted: i=1; AJvYcCUhDU58D3ohJLeDT2RpDZlmpH94SyNMr6Rc2JnY1MLDCbwgJ1iRdRf6J6pYHQOCVGZD0GOoS0mqkPi7RAzJ9pWf@lists.infradead.org
X-Gm-Message-State: AOJu0YzbDRkjF6bfEtWFGDBDatVWRX66OU54IliF46ib4U6VHPlaSoMb
	d+EpwAaPqzt8JEKFVmXqedOUiFKo0Z4TV0lJP76xni1MfjMOvALSwz9+
X-Gm-Gg: ASbGncuUhp8fK6jHikKd1wytA3VJ8mL0I7iJDjeZK80Ykp/+4Qp1UaF85IQK5MBqc/y
	BDm2ghBheLrUGhINBGZnB+p5am0b8LGlSYdw0uVJLn3Dux5gqbqpTOnBvgEIHsnVSXeBF1KneCv
	PsNr8aAeSTzZclmWXifPt6BG3tdE96f4nF9VJh8qdMR1VpnU9vBP+mnnVzUjhGt7ibspesrS3Qk
	e32vU0CbkzcUwYGwFvWLqWZ5ghayQiid6zKS1ljBrhZOH3wUSe9I+9+RO7khbxzA8zkVmBpeb6p
	YM2Ds8KQ1rR3QWgew8aCLqyxCl5xFLTq9ooLMdKLMvusHp55JO6ht6d8H0pyQ5jTGT0PtsVuuWC
	iyktmnCMPZ5VUeytqDH3jkvhw2fkw4ndWyK/qFDDEGDibIds=
X-Google-Smtp-Source: AGHT+IE9v49aHrixobJrjLVJ1lg/LgXrVROV3HeQS3k5SxqiXiAnJBtHP++WEO1FJDJeeelbmzDCSQ==
X-Received: by 2002:a17:903:2282:b0:246:7a43:3f66 with SMTP id d9443c01a7336-2516e97e7dbmr243437855ad.7.1757536848226;
        Wed, 10 Sep 2025 13:40:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d19c:8c03:e9d7:2ba6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a274258b6sm36800835ad.26.2025.09.10.13.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:40:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Date: Wed, 10 Sep 2025 17:40:35 -0300
Message-Id: <20250910204035.540945-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_134049_494401_D81535DA 
X-CRM114-Status: GOOD (  10.30  )
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

On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:

- ipu1_csi0_mux
- ipu1_csi1_mux
- ipu2_csi0_mux
- ipu2_csi1_mux

As they were not documented, dt-schema emits warnings like:

  'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
  '^pinctrl-[0-9]+$'

Add a top-level patternProperties entry for these CSI mux subnodes.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
index 8451cb4dd87c..c5eea48c19fe 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
@@ -50,6 +50,11 @@ properties:
     type: object
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^ipu[12]_csi[01]_mux$":
+    type: object
+    $ref: /schemas/media/video-mux.yaml
+
 additionalProperties: false
 
 required:
-- 
2.34.1


