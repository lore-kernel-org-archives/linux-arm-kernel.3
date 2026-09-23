Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C565C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=; b=fYR342xEbSHSO5/k/oWrWlpd+j
	fQIyhjI8mKedvU/LFxmhRpAwIKN91gU/3SjJ/BVPJjgZe8zni1w0hX3G3UNm8MeEm6Pw2YiwAjAPt
	+3ixG+tkNPen22OG9zOmI1KpKhk2t1LX8p4QpM6iWqjHXomLeW+CqkB7QqMy+ODMdoXjcCZkv3+6C
	fPs1iOsy/hESGXA+Y+PYXzYkIszmLKd9OUuq1lVOb8xy9FenUw6s+rOloe94CHZE2ZbHM4zpxtZZb
	6bxdMgcNZvH4A51roSte4AMQZvYsoCvvJQj0NT/eTnM0l88TPzPEs6B5IQDDQFGKUeLe6uJLQU64G
	18dkaqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUn-00000009RrA-0Xlj;
	Wed, 23 Sep 2026 20:23:13 +0000
Received: from mail-ej2-x2a.google.com ([2a00:1450:4864:34::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUe-00000009Rme-3EKN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:23:10 +0000
Received: by mail-ej2-x2a.google.com with SMTP id a640c23a62f3a-c254f560398so182670266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194983; x=1790799783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=rG2jjGDFbjd8CW2TlVPAZQIMNrlkm7OtkxViIZT/HSdjR/hnytqQMOHCYZ027CxF44
         SdKlUoEHRrOv2ZoRDDRINLGDrQPiRNNk74Otlqj4536ItAzAG903VIX0BY+fydVKLbEK
         wy2nyYOKxevT1nkI0IhWV+/64u9n+6cAIXbx9uz1gcicMjO2CN1jgxCqnjXVWj7cl/nm
         7zLe2Md6ZSzFzb+zea0Z/iDVLRlXrv8ZE7zbhCfP7PAFkaty0seq7egJmGbsMLECv2e6
         XCCHTIPW2Bj3QVxIKl3tYQkZLX9EhEWJdoz7KOtbRBaLeMVIXG7yVcPqHGXl4ELXdZxY
         TdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194983; x=1790799783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=0FnGlGsZU/hSuoJRNmMZqSF2AT6hOdiSq8Gr+b5Rb12AABMyB05TI22nGLPkVrxHoA
         ilBvowjwBOYP3VTOw137Yc7lxWdTVV1IqWJFO60QoY1R1jk9FdONp1LcLobQbceCrDas
         SF+5Mah9VwdBKULXSHwaRbE12KWKx8mFN/1DEBwZWx0ytoRO2VGforoJZhTEoWHbgGfZ
         gmx5nXqRHzMBZeO7muWeY8dgdLbUq5oXciDDV0tz7roakVefQol8rP/B2vTu7rYBa5Ao
         weS9aqUFG/4DpryxCvHkyP4Ra2zyHBvlQrf45tjcluhe7U3HpMZYQpZJQi/zCPLBcKyA
         raAw==
X-Forwarded-Encrypted: i=1; AKwUvBxdIf/+58xn0hrHQCdll713yqq6tpoFYpF1rGyqEPR9aPOlciIS5uApzYULB9mLs3cioeGbwIfN6IG3/BhnA6kE@lists.infradead.org
X-Gm-Message-State: AFuF++lKrj4/hkh1KUm0U5I+xcsSDwDnNXyB69XABpVVL+sFS5B9D6Di
	Qo+2TgU4zn8Vlo0zRXtASWEojF7nIb8Agr/k40AyUag+ohEjLUWDsEC/g/CPOVb1jxk=
X-Gm-Gg: AYBFou2G0xPdWy8uHw0EfYu1vjBycbQoOSw6cNc8Dew1z7swVARv2Ul6FSDjwem/wqs
	nBnX92CCXjhF1OvLmLXSieP/F4zXiwlfFdIMk/naRMc9frzBm6Un5+9mow1HRbH8rf0FvXDjmPc
	NcL4AbC8kE6GayQf1kNAdUhNLd06Hlq7nyM4mnK2FZZnXri02QIGfir1xz3McPWjlUDcYRdzrHi
	cO95QVveXuXAWoAY8iqKQuu3lCA5WHQbpEF1lfFSnO3o87D6darUAAG0YCIzho/0h5dE520cfSH
	e+Wry1ZBSRYb9HrGVpe/GA5InoH+zXld5y4Wyeksyoh/4Qiy8bMi6Wx7z9VDd0UahD/L2T0xerX
	jN9DP42nnC8ZYrZoYJXPkTAiuX8MYnQRh1N+wkfoX8EJbUN7ajUhSHAktd1gVD3tvK7K/XSC9pv
	sgmj88oXk4TVgjr8YdrN4WacDFZhM/9SUGIrQzD23HXbKzbClri0wm9vpwdJXIJoKqt806U6HWt
	03WHEikcJiEhf1MQ42mkZqUtsxX0g6S
X-Received: by 2002:a17:907:a893:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c2ac262664fmr19261066b.39.1790194982908;
        Wed, 23 Sep 2026 13:23:02 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:02 -0700 (PDT)
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
Subject: [PATCH v1 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:55 +0100
Message-ID: <20260923201701.43391-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_132305_157482_694FFFA4 
X-CRM114-Status: UNSURE (   9.99  )
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
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..1699e3576b91 100644
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
@@ -162,6 +163,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.53.0


