Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFF7CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=; b=dqqExXMP98K+rsB0RxfmZtyqMM
	vRacISRBGuYFk8FNGYX1AELkK9L1RKEMr3EDOfL7ChESGNI8uRb4DzvlyMZWO7OGMvZ/YIyi4dtb6
	QEwBSEDRDCYb6EM2hkdvamtS5XCufAcjSLtxtYl4lDBSxbMej7jezpi2hJRo/lkl3WZzXHTV8U49a
	fF82/zOY4kPqg29xPufnxQklsz8hvVLie3Ymzb7c0ylA8rvMwoEQMLLbmjR0AJb0uqSgZm1ttnnqE
	m/ZyEMcbW/d9mFGtzPVzFNhWahK9U48VunnXvsj3CrUClwkSX91kzPvyBGGsXeemvy0liv5r84+T4
	JsIVCkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIK-0000000H7zz-0sBw;
	Mon, 05 Oct 2026 20:28:20 +0000
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpII-0000000H7xx-1wk5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:28:19 +0000
Received: by mail-ed2-x0e.google.com with SMTP id 4fb4d7f45d1cf-6afb7d4aefbso3270878a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 13:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232096; x=1791836896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=;
        b=AZZHTmcZy8uSzKBZ0CJCOvKTDGL0EJaqBBX+3Yy7p94E7894RObAMM2G06No/6pDfK
         v/R7O+fCMjhR0iVBS6d8PrKh5OLRt3aZrFMupZ8CiOe3rPOhQgwmhLUhbuU/vyDf3qN7
         dzhGANE7HuQ1ur9oTDCACbKZqK2lED0OPGNgxMXtz+TZHD5wIFiei8yqL28OVx5No3Ve
         jF2LSlZLmZh+voJvRhqCbMx6XeHsenHZ58adVcwJZ9LCXi7CGXoqKrDJB1TvE/SBIxrO
         K5CZ0KevDdz47CF/gVBu8SEeQM8aRKJTLWIjv+7G3/Z5cV53pKcW0tSGYW4fIu4TXV0T
         TlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232096; x=1791836896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=;
        b=qejvwpVqSv+qL+8W8v6sYEQmpKfWboggX7uQZ/ylo1rzr8pQteRnpqyP56/6e/WpUD
         iuocWFL+8x24IP4gJk5MPzPm/gAyPzNoFUZ9LJpvETxmo6hl8iIEo3yoAHhT5jVX2VW/
         ry+mXDd7cMTnyghaAmHOvLofjHZCP0rX8G/xqcRbMhfw9Ew05p9DKUl9YIhfGU4/MLa0
         5LWIXt5fyyVoWKOVV5UctS5Kroq+gbTH5OE8Nnxkol3rDMybFUWFS882I1b2mbTZirzm
         bPUqoMjhw49Y5fEUQoSk1qjvNat9tgMG7RzFbC0Pi9pMLqDekwXecdTRefO/Wf5/i9YP
         OKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzifmzauQ8vnFCxwbCMYA4xcJIjqZD7ZFSPQQffxt0IIuxOHt/uXZt4PKhugeEkwHBNMqltqGm1O0AjVeL/hnc6@lists.infradead.org
X-Gm-Message-State: AFq9FYJxP67lHFCMDHhqyr1KiLbHwJQkLX6esa9LYYAgq/RUhNesFwfg
	jKFJU3YP513iKWbIv+0vbx6z6pPBrlFod/EMrRlDtS0gpZGnvoZE6a+8
X-Gm-Gg: AYBFou0Ut6isHQu8ZFLGzoXySIXfqKIN6tAvhNuQKpLBMP3LIYzZb/j0jK2Gl50DXC1
	eeRi5xo+JXvlfbh8g9uIXW2jspC9lM0aAwuJ8R4ybaUKF6p1O2wg3VkH+kfEkKg82DRpyPvJvJI
	LyGUDgvVfVtWkjeJz2aEL3XbfQOhQ7imjx5GrB3Of7sergIQTh4Dp7JtSiGuDxQsZUtODqNBHaV
	0qyxGkwLM4o8LL30kyfuMlmCEAs03mpYZUd89uNmKF+uV1z//VsYSsp0z2whjPE6O65HukGChFw
	o0rX5IFjjryU0rHi+N3d76nCaNGSI1Al/oPdkuNlXRMEW8UQwqXitU9Ys61gcyxXJAAaAZ161rW
	6aLRVsZ3maniQAyLkAz5Qrbqb/PpJAwp1cV/TYO3YLp6GZqBnSMCpAak1d+l3YLx4KHUlHuhc2H
	3RR5SeAcqSr9DJBFCUyaMJAI/r3SsLslF1a4CeXtqAr/seFHUIpueRtoOE2uEITSm9O9c9ulU51
	ewtFLQKvBgc00kkBlib8w3cb6CCfaBr
X-Received: by 2002:a05:6402:360e:b0:6ac:72dc:c3af with SMTP id 4fb4d7f45d1cf-6af9e373012mr9651907a12.38.1791232096315;
        Mon, 05 Oct 2026 13:28:16 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:14 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:25 +0100
Message-ID: <20261005202731.153971-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_132818_523060_6B45FB38 
X-CRM114-Status: UNSURE (   9.52  )
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

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..ebe35f893f8c 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
@@ -162,6 +164,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.52.0


