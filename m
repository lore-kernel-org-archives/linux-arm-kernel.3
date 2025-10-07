Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CD6CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 15:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wwn4iJ0kBXeAlbYIX5lfnaPGY5x3TCgAKgWBsfGbbTA=; b=y9fiBkNK/HKLaFM+WSPc2xVOr7
	USJr/GxJO1B7BzrPRT63ZxuhpF6vO7l8lsO/tN/0eApEMy3RTxpzOib/l6+n4eo5B08YOdfFVhE8b
	J8CIM9sl/mwbdITGgfICRywSBWfw1uvKNo60F7G30KC3P7jcMatNSm9HoBdydhGnJHg72zhG379S8
	Oq6qETvJsBbCsVnfBviGU47r91IlY+Pgc6EgbKMs52Rfb2yR9C8nWlc7Tv/pWTG8LtJf+PqX1TRma
	1Z2k1HAf/il4mX96OjUyGLyZTNDtbrhYviWI0xLO/kDYQW1UJaPl/L28bZTzY3q7yBTIO6vJTLZWu
	QMYy7K2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6A1w-00000002Klo-3HjP;
	Tue, 07 Oct 2025 15:55:12 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6A1t-00000002KlN-1Yl7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 15:55:10 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3c2db014easo898179266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759852507; x=1760457307; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwn4iJ0kBXeAlbYIX5lfnaPGY5x3TCgAKgWBsfGbbTA=;
        b=l8UWmsnY8x5d0Hgx65ogNQkj6bbtOjHA3yUAxK9wv/ZciQ17jC2ltOYMAFRnRu7nso
         KjkFW2u8ITeAfzfxav6U5nmUrx4bvUKE/S3vMAF93+iPgcxQXl/i1nFBYGRsEIu/hMsc
         DYXFk5/EF3mtxBwNLOP1F+onc3EocNUyNvsKe8RbJMoJPp/iGAS8oVK3SLv4AQpaHqtZ
         NylT9QCwCeIW0M/sCVy7BtswqwHhi1mOqmM0haH/YmtgLMdYB4Loemy4pRGKaJslhg74
         hr5TpI2bJbT4dN1KKTpelrXMdWgOALUfM+KfD36fzG7r4qSEsXtg5DA3MmsxJCT9Ioly
         OgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852507; x=1760457307;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwn4iJ0kBXeAlbYIX5lfnaPGY5x3TCgAKgWBsfGbbTA=;
        b=m1YLDoV/mVHdK1uX2L11tovDyWfS9VA+AXazIZuBeTS+F1y4KMrQMchgozXXJoQ8lK
         rWH6ssK6X/k2eZ1/Qi2Ly8PIRDc/+bVZRi4CRvusPWqyuI34TMA1ZXB5N5HjqByCfejA
         e4wOnPFeun6+yETG5bDR/Yd2QyDGdq5tbtWMXLcccyTGE/Ttyba6Z6Gu2hCpxGQGJ3o2
         EVDov/Z07Pe+F2UsYTvmqFdLu3uOZiutfiAFhdbxTVzQ05dOjr84wUlqngYkIcezH+Ar
         aEB54VIvbuI5ES8QnTCVFwSc7mUoaSH+9kDhWd9er6+HfcbAGXOfmvUX4NivPls2heHK
         KioA==
X-Forwarded-Encrypted: i=1; AJvYcCWfVUYuwV/6zAicJP+yA+KsUXqis6Y3UdkpxXd9DLPzpnDlUiDjpVq01l+zU7Pe0BiyE/wIBVWCZ+GIqKHRWvvh@lists.infradead.org
X-Gm-Message-State: AOJu0YzO5A0P5OV7p879o2fW8ucY3RDTEnqrFGnccugeB6+FPG0K8ItQ
	SNaNy79s1LweSIuB/hBh+Dkysn2WM4nwVxEnRmOwW2RWdmA2g1kRjS/BFvEc0BeqxUc=
X-Gm-Gg: ASbGncvMTY6kHV7eRlvwTybDNR0JqJ5+o195ylgLAEOwEIvkiPx/wzYzkXcPiirHcz9
	ZEusL5lxkdAdP0R3WaiyCTNdTF99svJVedeGpe5PBqGtAODBjMg9hR/QjPEWDSNaKVFon4ake+A
	Y0iJdYc5Ps/OTOW+PFTGCvTIOSAzKwHg8SpePjfVo7+c6JCOSDTPXCW4FWUXbpNgZP6y/o9nL2R
	sehYYi17Pa+8tfBJUII27IyrelGl68pxMQDAK74QXhjbkTbIePXLxoxlIg4jI81qb+g1udcIrq1
	re8tdHBQ0HuC/pWQhDaE1aTxGx45Geu7P8oN0V/Hh4hTpBMVjBeZugoq3f5v0bpZ+PodM6zNBk8
	XrZaJyUZ4uDyR4TuSzbTQpVkqBCtIv03DT9h6HPHIb0LjE6QVm/XWc1uA81nGHiisgOkATc+Jfh
	D4jzhBT5Rv88llCmbgAYWuFOoAdOrEH8Q4YRN9vBCQLc3IocN6N84=
X-Google-Smtp-Source: AGHT+IFMkqhgkZjYTFJJlsb6ohBZEtxooSZT5I4ro08N0+thklTNSC1wFRUbLDiJOSsfJFdfZDi8ng==
X-Received: by 2002:a17:906:7312:b0:b48:44bc:44e7 with SMTP id a640c23a62f3a-b50abfd68b2mr14143566b.48.1759852506937;
        Tue, 07 Oct 2025 08:55:06 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f7eacdfe6sm225312766b.27.2025.10.07.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:55:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 Oct 2025 16:55:04 +0100
Subject: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: add power-domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
X-B4-Tracking: v=1; b=H4sIANg35WgC/x2NywqDMBAAf0X23IVoDSn9ldJDHtt0D24kW6tF/
 PcGj8PAzA5KlUnh3u1Q6cvKRRr0lw7i20sm5NQYBjPY3hiHc1mpYiqTZ1FMHwwsiSUrLhpQ/aS
 LZKTtJ6XpNV7RmjGYaJ13twCtO1d68XY+H8/j+APzX4i2gwAAAA==
X-Change-ID: 20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-504b0c57a78b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_085509_584082_E4394216 
X-CRM114-Status: UNSURE (   9.79  )
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

The DWC3 can be part of a power domain, so we need to allow the
relevant property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 6d39e50669447917a2cd94dacee5822467eeb36e..3098845a90f342dc29f4343fc0ff5cec009d9629 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -36,6 +36,9 @@ properties:
     minItems: 1
     maxItems: 4
 
+  power-domains:
+    maxItems: 1
+
   ranges: true
 
   '#size-cells':

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-504b0c57a78b

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


