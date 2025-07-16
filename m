Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A397C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=; b=2GCwlXgZTxvQADcqLMK7eg6daw
	aeAXRQcSIg5usZLIyEl3gz8FybR302i8Nhvyn9ERKSoprwQe5AbsVl0lkuTd3vW9Fv6cf+FhF+8Ia
	bSYnlPMjYq9kwDe42hj/YMsDo6ErE33aYYPxOaglCzqAbcAcgbkoTxr4FckGY1ksFaAnpSRXsXRRc
	6zI6gxznOuzcQRwAwuYs2ll2xekf/iPmq7FNmwYblnYdfe/wMP5O4NhwhQw4EBQwecgXL+1/PFlRH
	FgbtpEdwQ1a007ou4T1XUTQYVPwZ39F8+ZUlHMvdLiJ3LLwgpvdGeQgbLbLt39wz1TAUnj2AkN/bw
	+qhnwT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8MK-00000008ZLa-2Yuh;
	Wed, 16 Jul 2025 20:04:08 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7r4-00000008Ut2-1r00
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so297559a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694309; x=1753299109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=ei79m80bKaImmtR1G9ZaFpObeASV0sGme+ljG8MFRtTBvS1fpKwBBQc4vJ5BNyswGz
         Y6vc7K12WHW7mXJN3ciHr8Pl7tdABQ/IlTu9nD+IMXOXbl/wgcEA2YRvU/XMCfzvkq/o
         pYWTzuUyfHJCF3tEMK2MKcR5sXOCif2oPgSnuFkfXReTB4xyGD66nBLF8FbuGpurv0Ps
         Qk/8scIYpcPWHZiZNy1XJnSGEM7c/P9ZmLOg/DZ4ONRrOCvyBAbrjVmJOMR62k7SoYOr
         +IHW05cd9PnRYNiei2w27y+3H84LL8joiAzmegW/MU51SDB+Igbgmt3FD+jQhDD50pmF
         ghPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694309; x=1753299109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=d3e2rE3QCeaTPxPcz1I5sMJaV42HdNPn1F52gkIJswQdCDzgj4aZfAvxKgM3/z1duO
         CDHMGpoVwOnWmpx5DH9FOyHl/Sd4BZO7pyMfzrYNo6Z0BGVPRVNkSrC5gkZaM5PDaFKQ
         1+rRicYU6Z4g+BwTBgMSotoin0O/LSYG/IoG8wlyqgyGJcrvVgSGrFUXaVAk7NKIrM+r
         uOpMOwoNyzy9f8db+SCMQp3rm8Zp0GEyV7PG7MhHQ4/aYUqWp9RuNMS1DxMIx5q3tKnA
         sZKkhVB5ZOLfqVwchs55EVJuWwMOSxyGngALbKDIU9mvVwi2vfXVZBo/lvn7Y/ZcG4vw
         TLzw==
X-Forwarded-Encrypted: i=1; AJvYcCU4nVFkbe1A/9Dn0vsuUb0sF9kl5pcPbvB0cdd+XF3LE5OgYyqnepmHz6p3qx4qP1Bvx+I9Low21kkjcx6u8tO+@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ9HGrRlPND8qZ7Jl8GhIj83nD8Moezbx39v0ROyxRIO8QJSbP
	y2WpPHiVv1GdwTA3+6z2uV1B4I73eDuFtYxQLfDL51jvW0lCyApnzxlC
X-Gm-Gg: ASbGncuEuJ+ZU2gZWNm/ZZn0bCxCYxTx33qc3q5ZkqI+QkD9bPY+RVuWqNhBwd18CnG
	fjOonLahs5Dp8kQNgreDMGkvZtL45pDHJpW197r8rScLrgqUcCK8QBBoL5gzkC84eW+CbJM0Gau
	GJ5dfivAhHUW9uy/LdM9ahS2ICYcM9v1wRY7ibPC6oJUfHD7/H9KUgGPPFJOEk8Trms898Cu+8n
	qIkvb6DXKnooURBudlihIDlS9OslCjXxqZZZJAEYSvp2WhW7gdq+PIQczg+kKQLCJYlKuWHrbIK
	3jwjY48v9v5ANHLZHEEI9GBiD2dQPSIqsJUXtHMcbByPa4vgVEz9zRyKU/jHrNBboyvN8uO5BYg
	StnGFGe4Wv7CfP2rRJXpPo+Hvmn5TQ2VT4GA=
X-Google-Smtp-Source: AGHT+IHHlWroyZIAzbjIooKRhrsUTXEx8/lblNbRFcxi6xG53BBEHU5lpzkZPyY/mfo8NS6RlQGa6w==
X-Received: by 2002:a17:907:9450:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-ae9c9b15e4cmr504054166b.38.1752694308932;
        Wed, 16 Jul 2025 12:31:48 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:48 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:57 +0300
Message-ID: <20250716193111.942217-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123150_477474_C581AFFB 
X-CRM114-Status: GOOD (  12.12  )
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921b..f53c72e5c5727 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 3117345d0619c..93e22dfd61c17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14755,6 +14755,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.1


