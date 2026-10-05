Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F65CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=; b=kA9MHiN0AY36tP8ZvUQQ4llu3j
	TsJytQKamErK2B9x0N/s4kyLgS/ZVFgXbIACmyaURxVvqHieakr3RMWbm42iwdt1QnemxGPs5sKK2
	6z2G6SDaec64JU33EF7M0LE57Z/EPj8ikklB/m9bmaMgAUYzPpMf1exiIbQNX1drGAVyCxXszVd+t
	SbxeZ0dZXIM4EG9cCoBbMkXhdFk3ASbzoUIsGjj+dopStTuWKDuJZ5pCToKTH+AWHv8d2iFkeHy1T
	5/ThtGWwPeSh6XNArinlZJ+54VdgbYCVNaOHhZkVMix8zEnX7ccaTeq+LnoJt55VYE+EzZPLc3Xev
	xq/Jsw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIY-0000000H8Bf-2f6C;
	Mon, 05 Oct 2026 20:28:34 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIW-0000000H89a-0hjq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:28:33 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6af7d408b51so1622020a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232110; x=1791836910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=;
        b=Aj5KKRaKqNrPb8hCnOwWeKAv70IoYU0VJ06PNUXeFBdKn6ujzg7R7DSzg2QSJVNkd5
         RCJvFnGZUUVZMvOrD7+RMSge4CJoc4YcdGGFgWXYRlcAKgWMx6MSku2pnf0YjxKTk2l9
         ZJ/uayQnlc7wl9DXlKzdJvDY9bnLjSy6obcsRlxNXMEJut0ew/q8QmQzC2GQlhZWPQSo
         NOVDEOOdLsM3x/3tiWWrYzkMUYU5gkPv6Oe6R8O9PR7KdZmXQ+NbQEGQJcrwJRDjitfd
         u0IS5UJjQ0NKJdzC0+buS/d7W73L4mOANcl5v2dQU+ZUFC/8oB51hICPk7+qndwacdnw
         DDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232110; x=1791836910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=;
        b=NthVX2YdU5wloifzziWwR1RoxKvuIADHu9VJWpNtLUIzWqQwaS3M0pTKPfoVu6jseP
         0evpozEbD83tkYO5S8pFmULXE2sITW4ywbBacGj4X57JcPat41JXrZ7lPDXNtOhtEOwn
         P2kIpDisp1MnHoVVWRnLsDJYnnrUMWR5KQj2rXVYZAY8ckCQMjTGBgbpuEq4DhA7yZQ+
         WX8/JiwnuvWWOX8qEK0pQtHwoyK/WtSZSQeb2pm1kdpSJYmpohJnMaKXX5DKBXTiG0Ux
         cjeyJvC5R7Y/t56b9ugfhPbpaMERYLSODaITZkigzLoUyVqCWTD6psrypsbsgIZJLNBf
         SYVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRKIi3wSFf8qtr6m3kbTI9wldjgHRa0gtXTyNRrz+ryAtIm0dCZyo2rLoeTp3EZIXZfqxD2Ag6l3PyzAn4Ud/3@lists.infradead.org
X-Gm-Message-State: AFq9FYIyV1MMrCpEg3zDkrs3TgqiE+GNROANBZMW/K7bk8kIk2QMND7i
	QtaTx/fh9Kvvesbw6zWt2aEmQOfkzZF8snIOsYv6HnKRnGNzEdImVW0x
X-Gm-Gg: AYBFou3DJbTvHJ1xlnr6VyoHH/PjT8y5LcmZ35zIXvDHxOoenYd6jrHxuJs1jX5fdbv
	ZbcUkRd0eU55U/tE+Ze0Rlq03IVvRiOZ2TdTsrR7/uNd6W8UgWsu2AiiIHpCHbOMuv1vUea0fRx
	zBXDpA3hmEc+NOzPjUugu5+HmLKYR8NqrrmhZY/Ap6T8+AKEJhyjdGgwbZvnTWDyZT/HIPlbq3o
	Y7F3FxevzsUlrwir6bE91GheUmqxIlLo7wtLAnEz9kl8ujIPK08Y5H/l/gBtsLn/5UUA5re4N1S
	Z/tiilHkniUrfTYZLlM4F67/P3tM2pL3oxa5auZTiPtjm/lHvlacED3cAXb3ENNsdy0XELLl6pT
	/sAUoqH6Ggi/QLHrUV63m72t8Gco0RSXISAJ2PTC5hq+PlCi0Y5VUEWXqEwqP90nyT3o0aM+YhC
	g7SqAh1yMEiSxNaSHhBjT4hOm6E9Vdz500HMTCZMyZdTQU3dBy8A5VOqMKEEM/XpoVStoO4Md5O
	LK6FrsLnKxdJUIKEpXJpIQQQaIgFJEn
X-Received: by 2002:a05:6402:21c4:b0:6ac:7d58:dbed with SMTP id 4fb4d7f45d1cf-6afd834a917mr673140a12.3.1791232110172;
        Mon, 05 Oct 2026 13:28:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:27 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:29 +0100
Message-ID: <20261005202731.153971-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_132832_224188_2F689B3D 
X-CRM114-Status: UNSURE (   9.74  )
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

Same watchdog as the A31, which it falls back to.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index b35ac03d5172..b70a6b45a33d 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -20,6 +20,7 @@ properties:
       - const: allwinner,sun6i-a31-wdt
       - items:
           - enum:
+              - allwinner,sun8i-b288-wdt
               - allwinner,sun50i-a64-wdt
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
-- 
2.52.0


