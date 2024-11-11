Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5987ED2E9DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 11:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lMrSmta7fHOUctB/5AJidvIZnIncGO2UNey3bSwk2a4=; b=AY7P8bS14XHQjcYY+s6PNRhmUJ
	y4Hfxje4OS2cYZgItEg+YrkTomExLAq5Mo/k0vSKIKodTJjeQpAojLJDsmGsVwuxpFMSu2ijtBKCj
	nAh4xIiyXdXTt8oB1LaydSdTtbD2O6ksKCakRRfX9ZZZeqBN5plu/1FrDcjNA8xMvbOoamN4XKHJD
	q5tYxrNHfNYnLSJcN17jgioGCTBBkdSaKOGCLmjTo6yJr+QqCYQ17/FXD4O6v6cTaJoR0ya2vGHiT
	DZ8Xt+4dXjuQBbsKiU8DWxJKh+MJTQcyIndSaW8MXuhXoAdAB1g06NrMyySQuM/YrqvKy1JUVtPrN
	zleSueGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASUR-0000000HQiK-0kre;
	Mon, 11 Nov 2024 11:21:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASSX-0000000HQDG-1sBs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 11:19:57 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9a68480164so655525766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 03:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323991; x=1731928791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMrSmta7fHOUctB/5AJidvIZnIncGO2UNey3bSwk2a4=;
        b=o40q3x+PsdlDXgslhadxOygjZ+FPR53JM1ImUEuHbfaUQ5VSJ6aamDOLADtlx6DSy0
         1ywdaAQa8Pp0u4KuIfF67+B1XYkIvAFboD9eRiDj8SWBd1QcjhsCqHwbdXTPF4e8dpiR
         QUbkSB8weFav3tcxESq7GBXPXQyH72DJxpjhKEMmdBEplqmmsz3tpMNymbUynfYGowIv
         kxx2uXLjCgbyJ0qwTDLmJmbRuhX1jIEZGTXrOixKuB4FAl/iB4QGLNaSoI4+1kDvy0es
         ONMumGygos3LWq/2Ey8h39sWonNpmewSoeQgntf1HkEsMmN8SBCGkQLI2pp+NTe26XdQ
         L+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323991; x=1731928791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMrSmta7fHOUctB/5AJidvIZnIncGO2UNey3bSwk2a4=;
        b=sdo73sc/2PUbBXFfaQ8Vm86nGj3l0NqmLoQQ5UIfdQZxb31Ts26KLKsHRkbM5lsS5h
         nn6hcq+owOwfqEMmjd7fz4i+U4YczwXlMJKHHfXzO2QlA1o/AtmPQXGM/PKc8kwL11Z8
         bfK2Ht9vaqp6pa6OZTl0Q+OVO48aZBJU4LIPIvXuvB1/cy9RtbSjHOMosBxdbw7cUJJo
         +ycYWu2RAXkA6zI05L1J920QcpY223+VFRU2jVKXmsnn2JVg236cftcccbg9xb/WnFI/
         dwUdlIc+5VtG+QCs4SjOYDO8VybzWCY2fdxe97lYw3U3l34MIQ2EfNWCmF6FNeyCNoUu
         OWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDotad4jwrN/kYfzX0rTdpglaQ4em8g1/tc5Ze/QMUjrj9sSTi7Dc9enX6KqXAXd5K33+9VvZGffXqO9jyWcov@lists.infradead.org
X-Gm-Message-State: AOJu0YwNfqZSFtn3oj8tVc/0tpNvu39t7TKnXtGx3V62gYw4ssscF+ZG
	rLgxfWqVbeiIdgk768leSz2zVGKqxoEgwjHhVGQ9z4MTco35Y/y44fOQsJl3Du0=
X-Google-Smtp-Source: AGHT+IHOXkjlkrDrtvlnPceOnN5si90LVUaiVILWy4AO1guCrPxVvXLDLxRd0s7RMfvfwDzqJwxOIw==
X-Received: by 2002:a17:907:3f13:b0:a9a:b9d:bd93 with SMTP id a640c23a62f3a-a9eefebd119mr1154918666b.4.1731323991120;
        Mon, 11 Nov 2024 03:19:51 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply
Date: Mon, 11 Nov 2024 13:19:44 +0200
Message-Id: <20241111111946.9048-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=tudor.ambarus@linaro.org; h=from:subject; bh=/+Hab6B4EJ5Dh9SCHmRGYARDt8d1ozFiUUdntiL5/lk=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehSLAOWEq2QisQo/KwTNHCKeQe1lOWHd82ps 5T1iSUMhUKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6RatCAC4xwOyECtAGIseOOgysDe7h7v7SgsjEr0sfn28ZspNaS/95AIqQMCfPSy2qy0reu67pKZ pCg8oRQQfb3u2HfTFOANgCtFAvUU7byNiliCO09Xw/vU9C9LdcuY8F6L/FvGyghiMvel2oXw9Ht jm506UJHfuIDMw1XINeUG68aULrEnhlGPJQfJIVn2XMCxiAq3u8l/3KN7r+bNbltYTHoiXnHXSA hKoSjlCj2GvfWO1ADnETrU7j9ckN4gikrHQvgxc2MSXGg6MDrI5p5PZJcsKjq+PjslQVcnEro6j sz+KTxRqSUMXxVLeIuVuiSw6EVHibHzUNsjqTuJGpAfOBm7O
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_031955_145371_731765B5 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Peng Fan <peng.fan@nxp.com>

Introduce optional vcc-supply property, SPI NOR flashes needs power supply
to work properly. The power supply maybe software controlable per board
design.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v4, v5: no changes

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926e..335f8204aa1e 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -96,6 +96,10 @@ properties:
       If "broken-flash-reset" is present then having this property does not
       make any difference.
 
+  vcc-supply:
+    description:
+      Supply for the SPI NOR power.
+
   spi-cpol: true
   spi-cpha: true
 
-- 
2.34.1


