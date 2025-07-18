Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39614C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=; b=4oTUPpCaYCyJwdcnlKuOpoEcUm
	OWeh0Gug14e+UWkRrm8lM1qI0LCC9No2G+UKZobLi4KwsK7awV++Phpk4JUkliy/Yy/OHubS6Lh6G
	Tbay/l3EkJkSgZ368vMs6OIfe8Dm3jrP8c4DVj0JTWf913+ZfGijhGqLzCZtB9K2jQ98cuO3Fw0ey
	B13Rq3vwqEV5xGZrHHPMb641U2EYEI8MQYOM2iQbjw1WC3GANCEXcJud1xSqyLmJRuQ10hb9H7drH
	FgwSMR6VP5nn5uUP7V+pPFgRHQzkpJuSnqDSeVcEsPpDPMojlSof7QqoRQha/mVrAKAhASI8HS9Oj
	9jpku+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnHq-0000000Czof-3TBz;
	Fri, 18 Jul 2025 15:46:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxh-0000000Cvnw-0hjk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ab112dea41so1323668f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852324; x=1753457124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=LXTGhxbr9YWKvZ4r+sV9I5uF84wlr2X0zICeXsfSj+o4OGJjgG2FSSLGlv4ZQG7K/r
         pkzAzgEYukI9gzH40py8vtILaVyylfHZiBWR0DFS6h26GsknVygTNoMKNtUS7vGPsXVg
         gAE62GgikzqmKuHE6RgXcIrWE6a3xwsFQo9uaM0o4XWHZDmjCb5ypMjcNWuJScEk93Kg
         ZSCJBlmKtXyObtNkW0s9Q/tyQRPZcJqaM+NQzKFYqUaO2DhSUqhtpysr/pAtEPF7yPNg
         AyCIXkmlzde4ol7RnnXp8/43tI0MJzYW4sL9TVaZ6TgVxtpV2+E8reX+JrjDXS+/6Oc1
         xhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852324; x=1753457124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=AIcOxZbdC2Hoy/wIzUzv/CovI4gBm+DglV5Inu4PIHvMXspf843+Y6QY/kDXV1SBOx
         Vl8p30wZQuqGUwb2nwu23N4gh0x/MDXMYO8CjdF/rVM91STyPfqheNTpapO43OAezZBW
         W+JHn4q4CkpxVC46fH4AjPMSZpvwLL2E5mGA1zQ5svghtbLp+uDw0GUd7OHXmpwbWT6r
         w24kpngDfnshHqBgdnOH8OFQTJr5uxoBo6chul44Y+wYxP24WC8EhawfdxOvSe9CJfij
         Ymbsl2PvsxOrd53bO0FBtahA2AqxpTgu9FH/IicR33xtFrXo46DvgNoF+2uxZ5h4ibCg
         tbug==
X-Forwarded-Encrypted: i=1; AJvYcCX7zDMabkMoy+TgqrgLHTU3qkcwubDbWFPqark06pFns0PVRLvPp0rTwc1Liiv9VFh6aV1xZ7oBvh4PFnOx4jy+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7bSXxIcNvk+JlGUvoqLcBRlIqr6F0slUq0jWT/9F7gDu408sq
	4lnVbhz4Ax6mjnVIow/YO/knF3eg6K+BcaETLdrPyUVvEaXC7l+4yQp+
X-Gm-Gg: ASbGncum8dsfoqJcUdeBPBxI9t5Lq+iihXnb6NZkoEva98e4WBMTE544PIlmeg2Ofnh
	Wc+aSMH+cCiKvcRoxLaka9+jFayG8Xeso0B7scGgx/qrgBU5RHtEeAQPWleVIH9USG7LKKLmOPr
	3Uvn8VjHSIAB3LWCD86y52YT8tSzzXV+MqkrruobhiVZn1/tZUUQTVGd/ziqQ2Js0I0dClYMZhg
	S95QZW3iuDNW5ZbN1530SDEzrOxXHqltH/o37VDDWRPhV8AT2aL2n+VR9eEbKH9s41lPB5640c4
	uvRh3lwFOPz38ngWQGCo95Q0kRoFQyCyi/JB4melJiv0ZvM0H54yfFHq+f/MYZJ0g68zDqokwMN
	4/SJeF5GNKZ3pV+cEFqCXHilkmwVd8Rz5TME=
X-Google-Smtp-Source: AGHT+IEnXhOLq8dbtFmyNRqfijqOMFTS9WGlEktcFzyG2EgAKBCwRInZoSo1yCEAsrfb5BJlPoX6/A==
X-Received: by 2002:a05:6000:18ab:b0:3a6:f2c1:5191 with SMTP id ffacd0b85a97d-3b60dd643fdmr8953385f8f.4.1752852323423;
        Fri, 18 Jul 2025 08:25:23 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:22 -0700 (PDT)
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
Subject: [PATCH v7 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Fri, 18 Jul 2025 18:24:41 +0300
Message-ID: <20250718152500.2656391-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082525_198322_CD2D6E8B 
X-CRM114-Status: GOOD (  11.30  )
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 9afaa8a7a3f52..78ecbab8205a5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.50.1


