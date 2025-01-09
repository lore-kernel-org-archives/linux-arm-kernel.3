Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE6E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=; b=CM4l0doGC1SLGqPsIcpzkM+zst
	j6isfFwZ/Mlk9wFLeqh7YcciteKEeeGHG0noZuZ8SEtxyEKPZjTP2fkVk8QJ5xwnM5/1e9mA27lng
	+rQndjMlhgudVYU5NsRMbYkxkgzngJC1Da4sBYnbHvBpNMvIuV6SEE9tmiPz4dQnTfmd8qyxo87ua
	pu7IONi9uMznRujEXbIex2YU6fXjalHGXJfKbtcZwu/EpPaU2s9C7DDb+6rQtfIxXUR92YICdNlEw
	yU58T8RhKHJiXPYBFIiRHOG29w+FWVEidrFiC2EDAR1LWp/EJeDSMEi8zjb4ZNXWgQO+7soBgYArv
	Ky2SNmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpxm-0000000BZaj-3Dqq;
	Thu, 09 Jan 2025 10:40:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpvM-0000000BYu8-37OP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:38:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso8409645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 02:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419079; x=1737023879; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=;
        b=01KJyNxzGa6Kdf+vrKSiphBzyWOwdpupxwHM+FYCTCBqIW/K1goV7crFht3ZhwwoC2
         Pvey5aDG4SOsll8mEyS1wio2LgccHjrPX0NseMQaLPicUybEdU/1N3IogmZDL+nv077Y
         YZumTPVks/sqJAup09LfFUxreBmtR0KhVXviZJMqzd1K/obyZvze4asyMxIJncfk+CB0
         /xlEcbTGcZ2B59ueVCY/FGdxY9oq9VOHLhoxbv+3ze8xEdyfNSYKkd/bpMPi1OD58IxE
         Ob1is1MwH7CiA/qC1La957NZS293f1lywgkzg9QUgWw5H22mV5A8CUYVn9uPX0Cwpd7M
         RNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736419079; x=1737023879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=;
        b=D0HtQH3/NmarVTuKzlml1xXMrdDw1DxTicQ5FFUlwNUhQKdq/2lad1sMFTxytruhFu
         7iBZg1zTe6/Imn46SIS+u5nWVoSzsZJXEDI9SRjGktzexvvCyGpks/Qjt2sIBYJcJ17N
         bd/lgbdlPV0HXvRr0DntaM7GRzMLw92hZ3w2iIZBT7wKnY3DD1nuwUDaiWFkIoJ3PRM+
         HeHt3p22bRDGwNV/palRPCTMKQPji687mcbRC+ssC4Rtb+J4m0pugPRXu1e+tmwbYGHP
         n6XOIULwF/eO3deT4yhQPV/gc0zN7bmTsOgRaqcOizlOWI4s7WpVnS8XlW/jDVPlMlkv
         KU+w==
X-Forwarded-Encrypted: i=1; AJvYcCXHQsFl/InFdDVXDNfH8LN/UXrB+onzgGhKOw+g7x86KAgrqhatbGatS+da1A2BIQcr6wKdDzNgLheJFPqvas/o@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvcw5ueNPx6p5WNEzuf1gamrzSW3YGJcsLQ1mUyMNt4/76Npdu
	+33VuMauIlVV3Ji6ELRDvLxNkI02I//FW12HRsdZqCth6iMIlr5H6V+73idRIdA=
X-Gm-Gg: ASbGncszNOOzaYTvXZ+kMWo/I3rN94pojTA2JueZdOAAHHVK0bVDWMiHL1/ylzIBfZw
	lMWND24N5+C82ADQeMdbgE2YXBwouDfcBosVmYU5OkzioKjuV1ha2kw7pswcnX2ieV61wONQ0NU
	bGQ/vMkXNPoOw0SHso4g+Sa52BlGIU7Gie2IEDU2e1aDlnP5c0SHQEIYqeO/3eR2nLkL3qakqeT
	If2TL0n+o8RJ2O000WwP/uYHTDJi32+mJANsC1xuCwLkDsqwTs08eaVK4g=
X-Google-Smtp-Source: AGHT+IGoo6aCpQaw/38jzOJWljZd/4p+WYRQSK2etIlIn/JQoa+/t4gGr2EQYfHYcCjx9tdypO5CjA==
X-Received: by 2002:a7b:c315:0:b0:434:ffb2:f9df with SMTP id 5b1f17b1804b1-436e26adf94mr58117845e9.17.1736419078947;
        Thu, 09 Jan 2025 02:37:58 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:37:58 -0800 (PST)
From: amergnat@baylibre.com
Date: Thu, 09 Jan 2025 11:37:54 +0100
Subject: [PATCH v6 1/6] dt-bindings: display: mediatek: dpi: add
 power-domains example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-1-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=1JKrAs8ef9/G6ny5cfhuHd3DFIbQFHxMMv9wBH5/HqA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDgnHk/QDeV9U8e3dgtdQJKzCxpbiCFeCOLMRp
 NjwR1diJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURexpEA
 DDgha/jEhBzdZ+TAQIqu03dqxRexVtWPw6SdcPV2rKQHlOzz66Usv0RV3Pr9ttZLknkmm+awrWLAbA
 SaX1ge0cH65bzfh3xplaNqdw4+NzUx9WRx4n7HZshUNcQzg0LPgUpaIkRN20xNAH2orofDhJVAcZaR
 OWXyGKpMhnXZZ2nrhMgkIL9Uu5VkxCBpKeB2Ry4z94dYBsDOmPLz47/b8dAht3T/BguzZW9MV4RZfS
 3NGTzBKFRSpufWVEqfYoQV3fY4UUqIIXdM+dPzwEiaGOFUZn0RvQQW16u+G+E0yXEMOZHQ9ep+d+Cv
 xyV5gHyDam6TNvSQCz7EUKfS9g0P//OQp4a1TXpdS2mvATg79+PUeC4pZhSiGj4VCFivIn7yMgQANM
 W4IBUk3M1KtaomudMm1TQXVljqNoz9jYzfSzZMOiTxLh6kkKpJWbEcvhh0uNtjL4rbuyRnuliKnDq4
 bSEyZXo3fRqB+vwZFV0yrOHlNUdZX9W4Ov7jtmb8bhX5tXMS/kjHh3pruU/o3lFM6XC+u2c+u2oTX4
 8IxjXfFJ+/zdE9qZrtDyOJbRStETHs1Qd2+xNLgQD6eRx+OKNffrGEkIwHM8EmaAHVeRVrD2FuEZIA
 PObseZEW9O1yyJq3q+Ux7rcwcc+ps/50ZQDD1phVFrJp95xV/fgML4iJhFAw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_023800_812903_FF0CA0A8 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding example.

Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 0f1e556dc8ef..d5ee52ea479b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -116,11 +116,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1


