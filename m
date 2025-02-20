Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3CFC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=; b=YigDtq0HvHVyovIA4InpeqDnj+
	VbAlyae3BO/13fC94L2mw4Tf7lB+l5JtlnjNbyfxLJEw2cq4J/TaHIVr9gbV6xPVkgP6FBm+Prd9B
	Jh/whJC9+JqX6iCEJECQgAMf2yhY0md3kc01qnjvzXlB0I52hL1a7EqO8nkNxnGgWt+zoeYr9hIuI
	os4JjWtOpXUdb/OlWlka5FrQl7DWwaSLRcPXR5ZxKxx+Z01TTLZmFpGpy2J23lbp7oGivwcX4HBi+
	2tOhFaJRS2epYOt2k7ydt5vyU5Y86Jh4/rO0HDkH/Qjx8uZDucJkvnYYop4N4Yv2Lnu26LntwcPGJ
	vUtbkvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFkV-00000003GdE-493r;
	Thu, 20 Feb 2025 23:14:31 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFey-00000003FJH-3GSw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:08:49 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ab744d5e567so265226766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092927; x=1740697727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=Py9ZLPh32oslJ/yAwH+E6nOWyAQdy7+aoJG8tv2Tu3EgIh4/kmeGbPocSyl5+V+9sK
         BrzjTY3rQZpddGTtvkTEBWXOZ+kjcTqdtjubGOWksQYfOA1qmbcoG2HihLWq5Uj1LpJP
         QlKYuWZ9hwE49nYqtJlt7TmLz4PnZUYWMolu4Pu66ylh+WrQWjwRVGX9rfK4GVdsYMKh
         mLiWOveQBEoEV68IPob3D15ZiWatrgsjbs5UmqLMzcFcYG9nRrIS6x6AhGHKqCJgnE2l
         C1FbB22rjoQyyqwgDlUWw/UkurOp5Hnjlca/bZgjsOwaeRX3Zl0pn8VIBKYn1XlL2FO9
         MP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092927; x=1740697727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=aN2p6DSbVUg+p/3EupUEaD5+nrkfMFagbNtqXcnmnonPu4DW52TkghcalTWhL/YcHW
         mG7g2dO7nrA2v0Lr/5Hm41gsILrzZIV66tk/Xe1cm4U2sE/K1wL5OVC2gsehuIJ/GaUT
         hp6ir8iQ+00CixQLLP7UQXHGXWyzzQxYjPmsRqhyuH1VqEroS40NRB9DRRcTvNbCo0nl
         KTQO2O1dJu7lbQhIUw6KJLQm0FaHFlkLSdwPZq6x1UvHhNLUsGlo3/l5a2WU/roiiBZr
         /vfWx31qKL0ie9mZSVr6Oe78WJ5uH7Tom1Blr+22bWY0hymReQeD5gj+HBAXP8dHJEzb
         RmUw==
X-Forwarded-Encrypted: i=1; AJvYcCXgTDR14Fd3FMgDMGtit//GXE3uicilOiZOyVOVkjpduetNPkwdn0qIbm2YZVyKqNaMOO/g6cWBpDZUc0upVrS6@lists.infradead.org
X-Gm-Message-State: AOJu0YyYVQrODQh7nc+dR31bQpp3wR1X655YKRHIRvwdn6gr0ggbq8Ai
	fM6HerTM0bSFlBlHv01uB5NYB1yv/lLk0RepGqistVpoKQtMnVu4
X-Gm-Gg: ASbGncsWIf7oCBko0X3UHbsud+oNJVseOrfEkAV8OkqjU3V14888Tvgx1vMRiNPlOQD
	ufgBvGhsUiqunlcA4cgW6zz8fgCdYKqKkqf2aig3/OpwF/BONLaZOQEMwfygKW39l80sD9A/e29
	F+zq76LDQWVNyMubtDJx+moOkc3Z3NK/J4u6jg+X6TOU7EVplV1isj1Fpru0I7FqWByeMExK3In
	EjnvcGcNhp9pINIc9mH1rsWs6MWe6QSusOW1bIe+mdksBMRE4KDXb0axReS+rrSM1pioL7q2vOl
	6Bb8rC77lQUMCJlvdAV5GEfXr//x
X-Google-Smtp-Source: AGHT+IHxCyp3AmxX9+y1FumuMZ2w71DFr0p5Hi7cNfrmyJDTIG49fuCS7zq2b1FXlJ53fyeJ7aqZdg==
X-Received: by 2002:a17:906:3151:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-abc0b037859mr72192566b.24.1740092926822;
        Thu, 20 Feb 2025 15:08:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:45 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 3/6] dt-bindings: media: imx219: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:11 +0200
Message-ID: <20250220230818.275262-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_150848_809581_4F498110 
X-CRM114-Status: GOOD (  10.20  )
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

IMX219 supports configuring the Virtual Channel ID used for image and
embedded data streams.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index 07d088cf66e0b..766b0e5fedb05 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -66,6 +66,8 @@ properties:
 
           clock-noncontinuous: true
           link-frequencies: true
+          vc-ids:
+            maxItems: 1
 
         required:
           - link-frequencies
-- 
2.48.1


