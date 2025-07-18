Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AEDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=; b=fJBNykyXncfo7mpJCbSknIVQwJ
	I01srZmlJEMkErhJjKXgI8FNa1PMiqU/hGL8P/MQYLMG+k7GMl30KF4U9vrTxFszlSyEtzFpEBF6d
	fydhLvCuWUx/HNlOWy7zkY7f8/6taZj/63agQQG7VUT670RX6GB3NYfiW8bamnsbNNg+mcTK6SgN9
	LNaY2lnWi8flWPTZexqh5g/WcyjDgTx06GRNqmIpvQQdc8qKj6z4uIjEbHJnWHSMopDgtee8ucXpe
	aW7eDD0W1wNs6m+gkqoFX86TClZSwqcSYRtPWp8T05bBmxAyTbU807x4mSFEIhr8+mPZJChnIVt7O
	nOn2UhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnbH-0000000D2PM-0fri;
	Fri, 18 Jul 2025 16:06:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmy0-0000000CvwT-0FD0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a510432236so1338616f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852343; x=1753457143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=auWIHhLgYLfFheVh2ozivi0/BkYXZl/Qc8vzsNYE/ANsJ4G0X7DvFkBnv40JNqfCif
         G6yvlGOk0zKnagvMkvndjXz2vENVlk4XV53M1ahjUVQSfTMZjOm5xgt/OjjB5GPsOX25
         Fiq6zlir/NlPr52EqA5d7ZwEgKP93FACxaYfSpQP4nVW7XtvJHtiIAvqL6jDIxX+JyVI
         FCwI8ILV6CEzY4A2cvzhcjw+RHqtSk0gtASt+N1gbIaZe0JwRqId/whppSe1KvrzMIxm
         RicUrgiRTYkU8U9rkfNgJus7TGawtsJ2rCcj1v87gpPGlb5kVGHysOo3Z/HI6R5Y42x1
         Ckpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852343; x=1753457143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=DJiMMgUX5aACGMZTGEIIGJKBOADjb/qWV8uMAXaV5QYtk/+2SG/2thCqfWM/Beili8
         2CS8p+66TYtQ6egTNPvupmIbUCRvLqSpe4tbHLqiSQSe/OqfUz8gXaBWPQ30zNdu8SBP
         Sjo5YeTMf2FZds6OiOIVaVk04Ck3LFeyWI21bpFhNtSxYOpjeJR2otWr74pJaV94HjUB
         0hIsvAjqzOaFojZLnLs6GUWMDFu0RExta2I78vfGY1/h0t4jRs0ZsgnXqf0UQ9tSxoQu
         JitUQvO8lGdvXGLVNSx95i2DiChTHKT5wfUBWIZg/pDLxIYezkUuPBqrnuCMv+zfxzvG
         OfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJVwnubr/c/qvDZFx924VW8U/3Es73kPWc6KNLMLyNcw93UOVGWQ6LzBjnfFXcUY7eRoguqPVU76Plreo91Ryi@lists.infradead.org
X-Gm-Message-State: AOJu0YwBOEiLNVS+mwOjz9i3k8sEUFe2vHxi2OUMIgJlC8XklXoDVWF+
	ipsTWcRhD0W+TD6otP49UHntbByCQ9VnnfLVNxDHyyAIV1HAADxOZ9kZ
X-Gm-Gg: ASbGncsHdQiog3/Ra9YsOMITILhVvGEMPt71aOgpL/N2fRzGaq6izbqWx1wofv+XoxX
	GRpopVV17EpsyfoOf/L9nhOzpUtiUJGMK2EZ4FKu0a9UvdHsSHtkc0kkoMGbWGnb18JzcUvl3vC
	UvVjZEumBvFUhmI9eteWlleY0i5PBhUXrQgqWnNdsO1oALogxzBUN3rE++GPtOnMnYhdJA51SOq
	p4gLQlEvcEgiCugRyIPJpZoUaM+qqT00yUa1ttcZuK0sbft/49BwFFop7S8qYOESQMApm8XW6J1
	g+RSDCBaus31UejIKwT9NbClZL90rdwE6vf5oOUlUkjTayVjPmfsR4InzaJxnM3pHhH7sYfv7Jr
	VILYlrMFweqibVyR7OQS+MVIbTmijJQwkVlE=
X-Google-Smtp-Source: AGHT+IGK51BdL+yXQJI7ETdHEtahe2g0TA1zj3GYacJnrCDjJBB0ZM/jW6qp7Gsv+wdfK8sGbDTVrA==
X-Received: by 2002:a05:6000:4311:b0:3a5:25e4:264f with SMTP id ffacd0b85a97d-3b60e51caa8mr8808575f8f.31.1752852342522;
        Fri, 18 Jul 2025 08:25:42 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:41 -0700 (PDT)
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
Subject: [PATCH v7 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Fri, 18 Jul 2025 18:24:49 +0300
Message-ID: <20250718152500.2656391-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082544_090473_6B25E73D 
X-CRM114-Status: GOOD (  12.59  )
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c5727..1c97624833ebd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.50.1


