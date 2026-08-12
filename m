Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076A3C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 21:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eS0igH6p3phd0yMFsnOQZ+4mmHdJrMcSmVlciJfLpEE=; b=yVDQ/c102xpB1EcOxao8FeYDIs
	UMX0w25eB8ZSIeoDAPzLq5SVSYieTuDGHLFe6hTncCxer6hCyl92z5HigC0vY+rg0hrPNk6xYr5l3
	UyJvxhwGZan7uVTxXpCpgNdVBGugdDlGiBNIhzxqqdVlTjVpN8hV6v00807W9N8OBGLzz8T+Q2G5o
	pglbm7vSCRS5eNHsNDBZK6kjMYV2CB39Mcu7SuRqdCeOcjDzLw79hye2dzLKhmQGeEYix3y0EivJ3
	2cYgvsTLb8h6w8nwp8B5bhmk48g7t9guxlvj1CY8ujqqWK5BWrP+vjkWs+xd3W2PDFl0VvBDI9vq4
	d3a5Z0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuG5c-0000000H1nW-12ks;
	Wed, 12 Aug 2026 21:02:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuG5X-0000000H1mz-0IBS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 21:02:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f71156e1aso561f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786568533; x=1787173333; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eS0igH6p3phd0yMFsnOQZ+4mmHdJrMcSmVlciJfLpEE=;
        b=UqykV1a3Pc8AqQHMzhdSEanmyp0ABZN7yBtx7ppKpI8ro4lO1gOgLhmSacvyvxFF/Q
         FDmj1Bhg2MpAwx2AzXSD/rVp0771YwMIrW7r+jCz/XF1vdZfi4FuceCiSgECfO8pz82U
         E8KZVcb+tBfzLps/MmyMGYBSSnGHmDTAtymNPtIxCk2DKezeBgztJ63ijWMuamWzz9I4
         WcEvrZqljsu15q1ZRnu4VunV/khtnuYgD2KrVjE8lrlvGC4v386dI1/hcLESgboNz+d2
         53c54i8jzc1/h00mk5JWzDOsXtkXDWQPf43YJ9gf6R9pwp70WnL4eSC0L7F8sMWlnmM6
         dQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568533; x=1787173333;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eS0igH6p3phd0yMFsnOQZ+4mmHdJrMcSmVlciJfLpEE=;
        b=ifUwfU61BwCd97393dYJUxtdmJz0NZIs5InSjcq11K/X9SXzkzheGWG1EgIK85FNbT
         WsJvQZAZilulhOT0UZQgl2+QmnR4IaqT0Pv4v5K3Pe/Lnhmo5W88a9z5/Vv38SjkL0Pp
         dqWwUpEiRq6oMlMhVa5hWwB2Yzzu83MtIhfXVwVIwgLiZTNnytyIVI4bI63u10HHPIYg
         5y3z2PoUMRNdzskIlKqbXwZy2m+k8roIieGrOeeFF62OiF4qavtnqsAdKEsoBy9LRNXu
         0lA9+5LATy5Vv+PZRQnzdqe/KDgESaLFJigx3MPVKd6TePxh14yV02YPjm2Or6fpD6zE
         1bKA==
X-Forwarded-Encrypted: i=1; AHgh+RrODifFJefzQgOK7Dx1M8hRM5A6QyaE5RcDrH9rUSPXCyIoX74zQt/JA41MYQzjMLBIA5CErzcsxfrPKXufx9a2@lists.infradead.org
X-Gm-Message-State: AOJu0YyFCWF8/bFJGE6VKUuZ6VEa8z7FeVNs2+aW+l70FIlPA6SceJj3
	Qf263PAGttcX1otOCB+wuPavSy5bWxg2+i7l/n2kC/fdph65XrGCzX+RjNmsWvrBLgE=
X-Gm-Gg: AR+sD108LSCaHrGv3hEJzyAlYGwnuefLFfBotMyrhOYw8pOoHUXcIy3y3oBPzAddpkj
	osEQ/BoOK/cP9KU007v3w+cee930woN/xTOmZG6W+k4ONHo9/fDtXa9dPcN82rQ40tK1vYmpdRd
	g8IXQkfFzy2VhtnPyOAS8fxCeULnqxDM/lmqN7hzICWVBOLM4k/XoK+qwmMw/732z21CzCQGB4w
	Q5z+2m9TUEg+GDPF5hk6f37vnEEunm8nSZGf5g7hKpkaaxstURxazL+efaRKu8L0b3lkQd6rhBe
	Bz7ankHD9AqAE7YNmzikaZW0gepzejQWmhLzNDb5uvVF7BQhGb3zSjh18N1mBQWsrOQpC1+QUAR
	xwbVPGxgI5+2IrCJD82+0I2IeHqaRP+CSMIK6I9Bp5FgYtZWW82OGOFtFI/0TT1l96AN8SLzXRm
	F+zIxh8e6nzErQYifDZIsb9LHVqqUKRhBf2zU1WWMxP7c8vgB4FDEHTLinTs4=
X-Received: by 2002:a05:6000:2a89:b0:47f:776f:3838 with SMTP id ffacd0b85a97d-48159ca6049mr1024076f8f.6.1786568532369;
        Wed, 12 Aug 2026 14:02:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5c2769sm426055f8f.36.2026.08.12.14.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:02:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 12 Aug 2026 23:02:02 +0200
Subject: [PATCH v2] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-allwinner-a733-spi-support-v2-1-937bff0fa78e@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAEnffGoC/42NSw6CMBQAr0K69pl+RMSV9zAs2vKQZ7BtWkAJ4
 e4CXsDlJJOZmSWMhIlds5lFHCmRdyvIQ8Zsq90DgeqVmeTyzC88B911b3IOI+hCKUiBIA0h+Ng
 DKq5LbXleaMXWQIjY0GeP36sfp8E80fZbcTNaSr2P034fxeb9NRoFCChMUwtxEmhseTN66shEP
 Fr/YtWyLF+qmJyj2QAAAA==
X-Change-ID: 20260805-allwinner-a733-spi-support-e30a9ac057a3
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0CBhCBU2Ye60x8lfkWT28rE3Pec6oVMCAnjppoXmg0A=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfN9Q+u0hwY5bmCREf8SoJGx0s9FOJ2i+Jt28L
 XwaflMwzwuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzfUAAKCRDm/A8cN/La
 hadkEACsSQx6tBKrNKoNPl56rW05ntzcDV4ES4lN835wpmXCzKW5YfclSB1Hw3//6dDLcCm+Wzs
 SMFe4WKJsIrxRA4wEPiP4qPgbmG4Didsxhp2jc/A2i0Z0LeIDz++zLcvBNiqqYHDE53HyhqDANn
 QGkAootOt0gQXUrp6jB2BkVoNQFjjN6vGJd/5ciuZUmzFZ+YiK4KtBcCXQOB1ylzuI+/LzewAae
 xNpfs5uJ5OOLVeHDcpVRfVoN6t/uFLg15IKlRlCb4pqjl6X39UZXdpYhAyTRl59bdIzNcrI+3Ln
 sX2xVa69TcxRFX9PWs36m1XaWeVPT39/1gvadDYPop0UT4NBAC9hQ+gYFKx2Os5dCbNjofo0UXI
 ZuXD28tFriBHAtukty38MySAlJ/nYz23qImyc0obgyHDnzGBfH99+cZGX7LiD4ACLbHZ29OladY
 NfSavowucJuOI44ngpXIMBgtXq7TbBDoi3gXFz2ulpM4F4yNbESQfP31e2p7goeR1Szq07jr6jw
 LKk7CF/sTnqzJfJj5qYPpekMDgJoXlC+Ol+Ht4O0wvQ7CsrwXRAsUAjOoGJ5arFpaBVEvpt1saR
 fef9Tvm7vJDQVtnc3zVTtzN8QVYFtx21ZncuvU7vXTzQVI78dM1/2v5i5HPdz2bjtaLhy+2JRaA
 l9uFYaAreYhPgQw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_140216_549558_0CE0EF5D 
X-CRM114-Status: UNSURE (   9.83  )
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

The A733 has six SPI controllers with the same IP as the A523.
Like the A523, one of them (spi1) also supports DBI mode.

Add SoC specific compatible strings, falling back to the A523 ones.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Changes in v2:
- Combined allwinner,sun60i-a733-spi with allwinner,sun55i-a523-spi-dbi
- Link to v1: https://patch.msgid.link/20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com
---
 Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 6af4ff233158..14c2f318dd04 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -34,6 +34,12 @@ properties:
           - const: allwinner,sun50i-r329-spi-dbi
           - const: allwinner,sun50i-r329-spi
       - items:
+          - enum:
+              - allwinner,sun55i-a523-spi-dbi
+              - allwinner,sun60i-a733-spi
+          - const: allwinner,sun55i-a523-spi
+      - items:
+          - const: allwinner,sun60i-a733-spi-dbi
           - const: allwinner,sun55i-a523-spi-dbi
           - const: allwinner,sun55i-a523-spi
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3

Best regards,
--  
Jerome


