Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A10CD3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4FBci3+O4afQtw23umY0BKlPjTmvjUx0lyWZ4/itP0=; b=MXxSb9Y8bgMYa8c/kcK7DvFIup
	0OXmljPBtiCTPHpgeGuWCrdfJlkr5ujPG1Dxte37i4q1/UhVHp83c3WLNeVWgngVQs8apCV7JgCdB
	tSDsu0PBGY8YZbBzeO55xwmW43FgdEN3hMLqGHfeScj24S0Cn9+/Yeh6aAsVP4zBhj8vdoUTO5aFa
	YIGiiev3VIbOaxXcJq0Ycjox1JNLa9x5Zg3SP5eDjwS9583BjWFA5q0DMqBTWFDQZiarIr+5eb6Yr
	RcbdhkDoLgZb9zdPvSMfaSwhI1Y1vVHZUZrKJ12UEDnsx8HvtO9FNdvuHQnAJc2VSRNkfI1S3qhG9
	0twDHx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRneS-0000000AkRK-1b0U;
	Sat, 06 Dec 2025 08:28:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRneQ-0000000AkQG-2PpV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 08:28:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47774d3536dso27691405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 00:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765009701; x=1765614501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4FBci3+O4afQtw23umY0BKlPjTmvjUx0lyWZ4/itP0=;
        b=DzuuJGF+kfMZ09zZusfXmYsfOzGMd2vUur+vP3NR0g8oY91zRo22xMWGUQPgzpYVo6
         7sz3IGlrw/DVanFCMruOAyq+AU5J/3RAFlC3RnHgHagX5mhVOrEWLv11tWNL5c5p3qZV
         9fDHD5zfyKEmU4Jtpdzam6/Rodw49JAo4VJ+SjCqWPeoVgQxw8LpdBeUYUCBBc0Co7+i
         5a8LiYolJG2z5UdckL3xT2c9ATzCw8GS02vbRgGrAVeutjUpvIF+j7x++f4QQx8oNDQI
         Ktb+PSFz0fqCxcZdXhxnYGljn7T0C2BeS7UHoJ0loRDmisbjkwqAZbMnNuZB9Y/3VVGZ
         cZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765009701; x=1765614501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j4FBci3+O4afQtw23umY0BKlPjTmvjUx0lyWZ4/itP0=;
        b=fmSz2edwIMubOJ+E1BgO282d9SsoDoIeZXGj79c52fGsPwxJBBemmj9gkgpoH1dBh3
         s0+3LnucucFV6OLsaMenHdzmRNysPb3piiydM/F/Cif2ofVU2JElN+hll77i19KZu3hh
         yFzPfyASNNIIaRENfgOR88A2NKCDc1/7sivWkpyuwdSTbH1MmhnM/hzs3DRWew7UH/ug
         NAnzdKHOfIkzrqaxKCrnwDrLiTV7gx8G2NOX0dwl2OA2Jz4osjFzMsDZeEskQTcntb4k
         DZznOHBv3CxQ3p8Nhtj8eYrE/oUu8ABdpnFKX7YQa9dQw/smM8BFP/LaroouCR3f4QgK
         Ez1A==
X-Forwarded-Encrypted: i=1; AJvYcCUAUtnBecz78UgRs2XmSe0bkVEgJNHwRaKfcTad0NnDcUGbJLSoSiwN5M55hR2xah/2DKeRtActrxkWoZBsjHXi@lists.infradead.org
X-Gm-Message-State: AOJu0YwX1ZtVLebIvr3KRtakIjbl6trDsg0F2PoI8hdHYzBMix1+A46a
	6AmkF5SVN1Yk3uM/on7u3gbUp6R09yAFH3Ke5JVTScNSFZMX3QgqzFB8
X-Gm-Gg: ASbGnct80flk66ACnTrwe1Esbrni5JiXHnquzY3XXsHGXNOIaNWCJ7VQEwuLiSi9dqw
	Ms34jRsmLWaci+NIMD40QFjWM+sYln4GuNkBT+Ypf1dtvBk2nyQq8RI47+0TeCKOu4TcyqX5R0l
	OQ1/QsfSShEjd0CZenOeITlbYoJrZSpQAfwQ588WCGyjOg35JPGWfnaH4hfENc/Na+ub68TJQfe
	nN9O82ur9IfmS5H/Dr6wznxnW3ucbus4zkSK9FsIJZ/aV2ml2AuiCo2miB26sWmDIKajeR0zsJ0
	e3wAr6O3ye0T/rNsTban/6NEe9CWTXVjvqhOSlfteyTL9zcJ9F5XxWChJNFjiu8wgb7gbCmxq3M
	TCzxyzC6BFhmRigGZS8JVYQfa46PvAxVIivDfiT+AASWE2ObKWaRMgTDNMUgELTgMBICBRxVLzM
	EXEQgj5rVY4cyFFhI=
X-Google-Smtp-Source: AGHT+IGduH610rn5UO5W1I+quoffTQLyEbtEowPhpEB04wS1de/RlDICAj847j9oMdvdQqNq4Iisag==
X-Received: by 2002:a05:600c:a08:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47939dfa053mr22028575e9.6.1765009700413;
        Sat, 06 Dec 2025 00:28:20 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm123094705e9.2.2025.12.06.00.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 00:28:20 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
Date: Sat,  6 Dec 2025 08:28:07 +0000
Message-Id: <20251206082809.2040679-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206082809.2040679-1-christianshewitt@gmail.com>
References: <20251206082809.2040679-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_002822_660549_7B115B2E 
X-CRM114-Status: GOOD (  11.29  )
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

The video decoder in RK356X (vdpu346) is described in the same way as
the one in RK3588 (vdpu381). A new compatible is added as the decoder
capabilities are a subset of the vdpu381 capabilities.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
nb: I've chosen to us rk3568-vdec not rk356x-vdec as other compatibles
for these chips are using rk3568.

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 809fda45b3bd..656ceb1f116e 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - const: rockchip,rk3288-vdec
       - const: rockchip,rk3399-vdec
+      - const: rockchip,rk3568-vdec
       - const: rockchip,rk3576-vdec
       - const: rockchip,rk3588-vdec
       - items:
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-vdec
               - rockchip,rk3576-vdec
               - rockchip,rk3588-vdec
     then:
-- 
2.34.1


