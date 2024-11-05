Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C254D1CA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 03:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVNKfz2t6zEgtE6p7hSHFZ+86J0/BrsT2sCmnVgjQCw=; b=EJnf9C1NDdPKRJQpr4qaLX+5XD
	jSa+qQkNh7LbvUtwFd8zoGIXpBZRjW7BXeNT6DPNi0aIlG9oeTADDDQJiVfjec2/sW1uRACxOxmqH
	gNT55Z+VqvL3qjqCVdoe9sfg1aZcLhU/xqBBzvnOa2gl6O3BTBzOVliRCNW+Z0leywm1typIESJHl
	Q+a4eSlYDjaeR3UCq8maFl9bKyeCyJ8M27bUiZb2y79t+M4DW49VVdn2/qMiEDc1/6Y+guq5ycnoI
	UFJEYZpU+Z1MFoCK389cGwAZMdGzyi0FnanGqCLPah8ZyxaX3Gn1dl8DVWQcGf51D/TSxW2qpq0Gv
	Bme6oexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8A2K-0000000Fk33-19UJ;
	Tue, 05 Nov 2024 03:15:20 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89vd-0000000Fir4-2DAn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 03:08:27 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7f3e30a43f1so729748a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 19:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730776105; x=1731380905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVNKfz2t6zEgtE6p7hSHFZ+86J0/BrsT2sCmnVgjQCw=;
        b=G2eMT/quRjyu7vWZMfkxWY8iKXYng3WKMkfGmQxXhjWCBaYzdlK3pYkXEeEdq0sRQS
         hxbCmnKqfN6yBRh2oNEwKt/K44PRRmodV1ZxTxehkx5kB8vpB8wKYyLHfs+qIpwXARMU
         p7TY8H4PmDOHQv9F8keQYWprkJI+4Wg0Xa7gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730776105; x=1731380905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVNKfz2t6zEgtE6p7hSHFZ+86J0/BrsT2sCmnVgjQCw=;
        b=rzO+G+hlLsxI3VPXg+1iVS74LhTXViB4ftJkGXxk4yvZUWpdiftL4n1lfOzs/CNYWX
         9ff/84eANDB2fXPeN4OA0ZBAaPX5nB8GdBYPk7VnyiuOe+LIqaWZBD0CK4YdTOKZ1X0H
         dno2AdIdTJ+7dzVN5zToZcFWU1iaYaO8tYgUq9nPGOUW+27MIl26jsvw4vwjyXqTKnUt
         jSQ3nAFcXNb16IWCosnqvX446KOvDv07hlOPBccq02QEaKbNPZx9zjjoEHRNnYRXtYg+
         YvRakTtiSxsuHqI2W/qsYS4m6H6zI3SlNil/sLPx0x61WFqhG+XCR3lsC4WNWe3b21uT
         ZzGg==
X-Forwarded-Encrypted: i=1; AJvYcCU9jxuEZuuBF2pv/E9ZNwFXFBmkoSb0HIL6bmPKims1c40HMqs5SKSd4XhWEoGZwcxLqUsmJAK7Q8+Vi5znEQnN@lists.infradead.org
X-Gm-Message-State: AOJu0YyLUph1PhBkVfaf5ZF3l5NGq3Kmftvo09pWwul4wJLkXb8Xs/+t
	Ue8zkworvI4D9fk79BZ169+UAypS46y6/4xdp7yV4mCTIsouCC4Ue/kRdRRR2ekm/Y8Vbq1pkk8
	=
X-Google-Smtp-Source: AGHT+IHIrNO0VoT73VkYM3UKR4zs5Ym7OnU1LxK7zSs0kR7UH9l8Gsq3xPWPJiw3R+H/jGdnosVuAQ==
X-Received: by 2002:a17:90b:3901:b0:2e2:af52:a7b7 with SMTP id 98e67ed59e1d1-2e94c52f395mr19754083a91.34.1730776104667;
        Mon, 04 Nov 2024 19:08:24 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8d4dsm67497885ad.270.2024.11.04.19.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 19:08:24 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 05 Nov 2024 03:08:13 +0000
Subject: [PATCH RESEND v2 3/4] arm64: dts: mediatek: mt8183: kenzo: Support
 second source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-post-reset-v2-3-c1dc94b65017@chromium.org>
References: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
In-Reply-To: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_190825_617920_A8BDE53D 
X-CRM114-Status: GOOD (  10.13  )
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

Some kenzo devices use second source touchscreen.

Fixes: 0a9cefe21aec ("arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index e8241587949b2bc238ffa85f8fa6b6ca78b1d6f5..813e6bf65b62ee6742e52133f9adf7e83a6078c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -12,3 +12,15 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
+
+&i2c0 {
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <70>;
+		hid-descr-addr = <0x0001>;
+	};
+};

-- 
2.47.0.199.ga7371fff76-goog


