Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AA9C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3K73ck1qcTjw5eQ/Cd3WvzHWsx2/6iy9qFn2EtdRrY=; b=YpngiFuWIuqgyq6Fgwd9wPT/X8
	Rbo2K+ApE1x4VOGDKY/dodSbt5fEj6aOYrIeETXKgEoGr+bSQFCG4H9YivVZ1CcPBkijb8l5hqcs3
	47TqZIypNx8XLPDftKP6gEnE8DC3ZhSPwwlQixoCZdkW6indZ7LnBFYVBb9SYdrGVqWPo+8I8XEFj
	GOv9a+o7THFyP061LJZGX+Vi25E6q5gacvNviwYSqq6WMzQSGfd0t32aLYTzl4fJPyHYiAu2e6dT+
	+86Ul6B3cNRclxPPs+wlyFbsxEA2m2FqkOQ+/urLlzKxRXShFmgjTjyYMyflbkwwbNMf+I4RoA3bk
	asil7NVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpvq-00000009lE1-42kt;
	Wed, 18 Jun 2025 10:22:14 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpa0-00000009gOG-3QXh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:42 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so13163607a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240779; x=1750845579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3K73ck1qcTjw5eQ/Cd3WvzHWsx2/6iy9qFn2EtdRrY=;
        b=BtN1kjAUYuMdr+u7RZMPFRXzcA+hmsOMYDJ/ccXYItwGgeIERkGqoxjdwNYgbv3h+t
         YhR6W5fLS+/Fvw7YPG6ytbsyxShOh9pEhZhx40XksWyUgJrX6ayCtI6eAn2oyhpayoif
         +bOcokJ8zVl8ISd9LKbZir6hIjBJ9GMWheJEykG7FSSzOueRGC4LDNcZX1+sQvpHPlWH
         r81FziFvUxZt4OnCnNCH0j2Myg/Nigl41XfsDQtiLnn049ENS2r8SsCpK9CoIy0lP8m0
         5PCtz7sMEDXGzjpmH7GhJTCA0F69GqJFfUCYObNxQSM49HHbZmKz4Q4WTADd+5Ms4JwV
         ZBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240779; x=1750845579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3K73ck1qcTjw5eQ/Cd3WvzHWsx2/6iy9qFn2EtdRrY=;
        b=egHAU7/P9HpSdaFwekJ+Jfs5C+B2oUAEvO6riQNub1sNo3sFLBQ3gnvfE6k+8o8CZo
         W6vL4cUtQjd7PJ9OJdxd86bUYxql5x4hMXtVqzUB7+tkep4efvgEgijSD1yKxZhFdDwR
         G2+Hy1EA0CAa/lotTv1BaYkj2lpN7KYGXRIOnmPoTIjNQn17gWZCvH6o8fQMVBqSHJVm
         0sfbTGM7Qjp3RJQMKjibdMQeGcZ2Eyt4MgVvka/brClFbs/+wKEZ5qoAkUSLf7oX6hoQ
         YED11c3d9+g/aJoL75jok21Ecb/ZBgwdKtsIvYrUhyabmrAC8VpiAi3XiKs1V8OPLMLv
         s5bw==
X-Forwarded-Encrypted: i=1; AJvYcCUmAODtxbn9DLCSAOB/BGhlKNp8hcCu/hx+jBPSMXwit7c8qDMJfpLFsp/z+0P+BgTrhBLsSB7xcF0C25SzGFzP@lists.infradead.org
X-Gm-Message-State: AOJu0Yza9cwVDR/wT+KuWlQmwoQxXnuKlKwSAU7GD8qLIqLdJmZUBCP9
	GMHunU1lwGhrWj+YXpDkDHHDsyqCBznXdgYZheKCAN0te0kaPaLOKN+n
X-Gm-Gg: ASbGnctG36dRVFoisNWU/xjzMtENFNn1t0ba5TSZmDGv/2djeFcj5BSZRUFd/xkN3+5
	m0tWYio6By35PpL7pvigiT7zcANGcq3tn1hjgVP1bUXeiPuF7X3qX7BfVyu7+ki90j0lthBNPAk
	6BynXeTpbZPdNbImtH/EmqdeP6fuNpXiuAVIz9Sqv151s4IFv4Bs/Q5apc0uGg6Qvt32mQuAuye
	nL5gmJRD01uHvuR6sPTBuizUM4p5wsZfivmYMFt+lClJ+O6K2WJTT0Rq9Lma7z9iqB2LMsxRAal
	qyLEiNVCX6QSmWw1uwn4aB0+I17m5dwS4dhmqjk2sWUEUA0TeBMqeV+oO6NKLOS95prNqr1+9wc
	=
X-Google-Smtp-Source: AGHT+IHArPLOCNMBFG1nWDN3wTJ1+S5KnCdJplNWr3EV5d16jBetdbbdgiTcJpvFD7zmIwoGGtOE8Q==
X-Received: by 2002:a05:6402:34d4:b0:606:a26c:6f46 with SMTP id 4fb4d7f45d1cf-608d09475dfmr14830079a12.19.1750240779368;
        Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed, 18 Jun 2025 12:58:42 +0300
Message-ID: <20250618095858.2145209-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025940_875611_FEFA25B3 
X-CRM114-Status: GOOD (  10.38  )
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index ab46a5f0bd7e..23f611177a87 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.49.0


