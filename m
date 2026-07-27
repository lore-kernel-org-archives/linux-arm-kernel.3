Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56ADC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qGWRiSQ7MtvjqqkrwlBWfRgghASFQFhWthLwwwGGRZg=; b=zIuYDDMb7EM0Rz
	vZklBwQ+w1L7qSxnZD06NTFJ4xYbdNeyxecC/oh/dg1cBZ65y/St+SkGf1frQcdiAG8euAz95OiSE
	i2s+18K4dOxLoFNdYl5RPNHGJUiubg2lKBAHlJlmNvi1CBTCtafn1MCPGv9Yc+Ym+A5tYUdGNQsZg
	O6urfxzx52geJUG+IfHc4ZIemky/1TMwH6wCjiHbzK2fuBbvqBmiGQ6l16uCFS7rb6nul9BYXYwDz
	WIdoXTLgTApH0oYBfjJFZZjAUnxvQGEMypm0ZcSguz/VOM16UQ3Zt+xjfyos7zJ/Cb8PyYaoTlDYc
	JfT0KAaEPqZC4clPsXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLJ5-00000002qQD-47oG;
	Mon, 27 Jul 2026 13:23:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLJ3-00000002qOn-1Ian
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:23:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4955158f26aso17436005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785158623; x=1785763423; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qGWRiSQ7MtvjqqkrwlBWfRgghASFQFhWthLwwwGGRZg=;
        b=NsDEKrYdulBIjZXKQnX8fBFUeXQSZIA1OeIclVAJ/DQRMOVaUXHohKb0rjPShBaV+6
         k5kjrtCwh/z8vdrw9P3d/QWtzeCqjtaie/D6Gj6hZdKJyAS6/6ZaaOVvJQRYpUT7ghWQ
         y/nBUXWtr3+IkQHznBL9r9N+/GdzEUUndE35Tn8zolLxrzgru20hL95iGZ/c8a2155x4
         Kq54cLBYLpWs9vGrx2EMDUqiP8Y2lyfUWXtBl1NFdRI1HmgcbuspsOO1zimz9uJbYYpD
         24yXav0GzDzAGx9fTgQEJSfS6Oe0obzbpZwyHrTTc+CWlOvEUgze6IFFlFyqVk0X+EVj
         Xkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785158623; x=1785763423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qGWRiSQ7MtvjqqkrwlBWfRgghASFQFhWthLwwwGGRZg=;
        b=RjGthd9H4AZ1F1VAdkd9SvNPZuBOcyIGDSXu1vw1Q6ZtZeoS4RynuCiBnGnyvV9vxz
         RGzwK76wK9B0wl+JGZZB1yQm0OTTlso882pnZPeMjFIrhFQ2XMKIlNY7BmZG7E0zH8vX
         lcq2+eDUXOk99Ffm1DniR+RSSjrtrCcmZ1Nuq/F1azbjk8c68K1KnWBquqJNsdUgiiqk
         i2uDK1llFpQE77+qgupGSNFBVo2vaS2VznYBgKld4xp9jUO07h+moQ7slWmfw0bUHnAr
         cI+kammhjazUpCP4Lv4aEoU1Hx/D9iUqh21T/miKVhWshLoI7KrSLpmVVz+GOSFgnPqw
         m6ZA==
X-Forwarded-Encrypted: i=1; AHgh+RoQAYzdnW0SQYyCmjTfPNPdkX4Sqh1vnrx+mnvhzSdM8ilu9ggKuh6oKvHrPEAPZjqwkAXLv0YzpBQqoJLGnv9N@lists.infradead.org
X-Gm-Message-State: AOJu0YwSsUPwB9CYOt67Wn+16/FNUPYOr+6BDhCABaI3u/AM6Jtmwo8p
	lTuGFADFUvjoC2vHzqwPDxrwRS+yWORMASnOQACUA4zf2TX+Wpr55bWqUzlwgJ0Nz1s=
X-Gm-Gg: AR+sD111jkNIlS6hkWL0nyy4+naROPjWwk6W/EO6g2J9qGIU65ler2FqAyYD8wWAmku
	tJYM0bfC74KCRq4LRhcymPqFA7RPFtF97SSpiiRWU1VHz7kW1T/fif1xBKlDf/xN+KKg9BwyTxn
	F4Lyr9WgyuoVHMu58A5goMIYEw93hT5HNaexOQg5YZ8BHGLwpDNgL3D5uATAmc6/a6ypSeBQ6YF
	W0YCKlJGYCo647oz4gTfH4jZ8G/DE5F7w8mt2CBT7U0PlKdo1r4fnoLXYFEaKXnAC2XHXkjiscp
	xI5XeMnUdDoS7UFlBRt/Q91QxsH+Ai5cMUTT+CFNFSvsVh5rCzG+t0U83stX2qBo4K9Me8lagdX
	k4Qu09SV3mLfcoQ0PTb7eUuVrcn8gINSZYLCaZ6STJEhee/DPifX0KUQzV6UXCaLK0x9AslHjIH
	AH2BbZ2XSGnGetJBwRvmuXSrWs2EOBLmJLwL4qDKptoYvAWSXQ+VjPp6qsdCvCjDzqDuxQtNgsk
	ToJ6njQ2IF6NO4=
X-Received: by 2002:a05:600c:4444:b0:495:7757:f467 with SMTP id 5b1f17b1804b1-496b56fe1a6mr99305345e9.24.1785158623435;
        Mon, 27 Jul 2026 06:23:43 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm224730055e9.6.2026.07.27.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:23:42 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/2] Exynos850 ACPM SRAM devicetree node
Date: Mon, 27 Jul 2026 14:23:25 +0100
Message-Id: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM1bZ2oC/3WM0QqDIBRAfyV8nkNvlrmn/ccYw+pawqZDhxTRv
 896GWPs8Rw4ZyERg8VITsVCAiYbrXcZykNBulG7AantMxNgUDPBS4rT7HxsKnaLQT9opzkw1iq
 FDZAcPQMaO+3DyzXzaOPLh3n/J77Zv6vEKafS9LpqpWllL85363TwRx8Gsr0SfHoJvz1QRjslV
 N1gBUbAV7+u6xvJq0Cp7QAAAA==
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_062345_458880_29B45085 
X-CRM114-Status: GOOD (  11.00  )
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

Hi all,

this is a small series that adds sram node required for ACPM communication.
Bindings update adds new compatible "samsung,exynos850-acpm-sram" there and
excludes it from having child nodes and not required properties.
The node becomes a simple one:

apm_sram: sram@2039000 {
	compatible = "samsung,exynos850-acpm-sram";
	reg = <0x2039000 0x40000>;
}

The ACPM driver will just continue to parse shmem phandle, so
as far as I can see no updates there are required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
- sram node moved to the beginning of SoC section in DT change,
  reg property updated to match section requirement address-cells=1;
- updated trailers;
- Link to v2: https://lore.kernel.org/r/20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org

Changes in v2:
- small update of the initial commit message
  "Add SRAM node" -> "Add acpm SRAM node"
- new commit, updates dt bindings to exclude sram node to have child nodes
  and related properties, this adds new compatible
  samsung,exynos850-acpm-sram
- Link to v1: https://lore.kernel.org/r/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org

---
Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      arm64: dts: exynos850: Add acpm SRAM node

 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
 2 files changed, 7 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


