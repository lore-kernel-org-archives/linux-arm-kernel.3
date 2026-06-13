Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C7DCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A8ETabvgyXaefxG7MMag31gPiFKWJAnshBNUt1PyL3o=; b=b8JhzYPj8c9a2H
	PntM6vuJ8QufRp5TdRpMJBBLL+bpD75rXybjUD8sLV6uQAqMUlg9l7eOsfwXplXuL/3OU1mgzNJ/8
	pPDnI5Dy7UvT09ge5Xt3hzPjk29RaIzg4DtubkO/zqYJPcRoO1rNNcLnGlxPuQMBj/y2MlHa0MYv6
	oqfcZHRXvp5re/9hhnpCxfCHX/kq91+xAybfuCiWKypE7auXIfrlpiXoG9ciddtWUFDiQ4DGLfOu5
	ovaZnRnDRhLOsEMFJTTkLwkMOtrUlxMXd6gy0FacajKjHPVD7Us07fX2gr67JGapmez5MHNhZQ6eL
	DWaAI3yMmkCDlNSBfzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKqE-0000000C80M-05BD;
	Sat, 13 Jun 2026 09:39:50 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKqB-0000000C7zv-2dS5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 09:39:49 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c86214eead7so789884a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 02:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343587; x=1781948387; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8ETabvgyXaefxG7MMag31gPiFKWJAnshBNUt1PyL3o=;
        b=QRCSvZbk/5yvFsTk8WdP12LMEudMetwb46dGVoGjg0DJJ+wP5DTSnSK9o32U39U9Xr
         BHHFqZHnMT9vbYDJwv+B+Twj0cziZ7gNWKJqKdhWICfaODAd+2U64pa9wxI7B2v7d0Oe
         VArlHISUzIErdEp4n8hloBvMk21IMYklwyKJa2XnmgOefhAEvzZV3pN8VN353cffsZ1f
         MRcbnDIDArHtcS7Zr/VGBhi5hGJ2K6OXkcxcP6woLyWkNzaAWZ35p5XupMukNTAiPYGH
         JNGzgZocLNcIFcW/WjuRrWjCFxdNkJBDW35ZCP9kFMBQHmMLwg7JcqsJO7av/PXM8+xf
         0mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343587; x=1781948387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8ETabvgyXaefxG7MMag31gPiFKWJAnshBNUt1PyL3o=;
        b=b7OgeJz0fkXNeRIp1z+jlnA5yEXLRaSA0UMdvKyKxKbKdHB1CY4TO3Ca65Hx6pv5dv
         9mina9J76slTmqjbdoRilXhJyI74jg+7mY7ZYUCMoJwtpUCnXX+Amx2d6y5eeHNy/bNu
         aCL+/d3DsZ8noZU235FGhx5ugx+da8QrYszeVulNnX03MChm/N3vhdTiOre6V3RNZb9N
         iwCfEJv4GpoSBd396b5Lk6lmJ5PB1iDt+RlLDvxt+m8Linvf4VQ0hr6s7lXnzVBmWq4S
         JADiWs356pVdgUFrBgrVczl9m/GNdjzrSs6Me4tG6aZ0r9bL9wskGuFA9dnYVIEEEUhB
         zGag==
X-Forwarded-Encrypted: i=1; AFNElJ93Lo70sboGJpphngTqRF5FdE8bAUD+KiDgqeIj2wQW73OHaJaKU/2WruDV2VcBdzG3s+nXXKR/Ugy8YUBRLHTc@lists.infradead.org
X-Gm-Message-State: AOJu0YyxDQTF4Acq7tmE/69OKpHBttGEPEbr6Ty+ZmOTnpnXHy0rkhIy
	UE1G2ocluZBcdRV43Lw3k6jFFKJaQsZUCX/ZUVISGXjv/hwcth0CLUYY4N63ew==
X-Gm-Gg: Acq92OEdrZqebOX7zl1bPFtFjX126yQ336S8V2kX2wkp5fKbvnX23Hw7uGBMBKDFCJZ
	DWXDgZDehcwuwNFBNYz2ZqTBFL8VqfwQoOqDK8BglGJIYFSzYMliVpKeAythrEgKdPP3Fr5Vp2y
	pU4uhVQu4e4fttRSbcgX6WWWpsKUh9SixZg6ugLBDo7HdHjpWpI060xR+6gGG7hFwwX/Q4qdG5v
	2S7klir9YP0gBQXcYX3VlMGoy4pzU2P8zC4bqkV2AUUPZ4p1DUym7UxMI4obveCnQBsfTIYRDFd
	AweewJsBg/hw3LWdX6OZ79HntJNHlXtm20tvKexJV19kHdFVXYrNhuJCd3zmY3LqcRpgtTi/act
	CZhyUhgHaQgfb60qxUnlto6A0xDMoFGPPiV6C+9d3XHoAb+rPZ0ZR41GibDwFYXXVyYwvOQbldD
	/SZ9wIJKBAKgMGP15KjqWxNZMR6OW7gm+kTO3zMVKIkA6u
X-Received: by 2002:a05:6300:6690:b0:3b4:640e:f6c7 with SMTP id adf61e73a8af0-3b7857debcdmr5756051637.14.1781343586541;
        Sat, 13 Jun 2026 02:39:46 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.61.84])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm4155826a12.0.2026.06.13.02.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:39:45 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v4 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
Date: Sat, 13 Jun 2026 09:39:38 +0000
Message-Id: <20260613-st-mmc-v4-0-b3c385617c16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFolLWoC/13N0Q6CIBTG8VdxXHcaHMSgq96jdeHwqGyhDZyrO
 d89tGWuy++M35+JRQqOIjtnEws0uuj6Lo38kDHbll1D4Kq0GXIsuMQTxAG8t2ANL8rKqLrWkqX
 Hj0C1e66h6y3t1sWhD6+1O4rl+knk3HwTowABuVW5RGGlkurS+NLdj7b3bEmM+GOKy40hcBCip
 MSKCi39M7lnemMyMZ0+QkMVatJ7Ns/zG5md3FcKAQAA
X-Change-ID: 20260327-st-mmc-c906ad95ff83
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_023947_676594_1418B1AB 
X-CRM114-Status: GOOD (  12.32  )
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

This patch series converts the legacy text-based Device Tree binding for
STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.

Note:
The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
depends on the patch "arm: dts: st: align node patterns with established
convention". If the DT schema patch is applied before the DTS
cleanup patch, `dtbs_check` will fail due to the presence of the removed
properties in the existing DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v4:
- st,sdhci: Add minItems: 1 to clock-names and reg-names to allow single-entry
  configurations, fixing dtbs_check failures on nodes that omit the
  optional 'icn' clock or 'top-mmc-delay' register region.
- st,sdhci: Modify the commit message to explain the changes.
- Link to v3: https://patch.msgid.link/20260508-st-mmc-v3-0-81c329ed28e8@gmail.com

Changes in v3:
- st,sdhci: Edit description of reg property. Modify reg-names. Add
  "minItems" for clocks and clock-names properties.
- Modify the commit message to match with the updated changes.
- Link to v2: https://patch.msgid.link/20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com

Changes in v2:
- Fix node name in DTS for the MMC to match with the estableshed convention.
- st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
  "clock-names" properties, include an allOf with $ref to mmc-controller.
- Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@gmail.com

---
Charan Pedumuru (2):
      arm: dts: st: align node patterns with established convention
      dt-bindings: mmc: st,sdhci: Convert to DT schema

 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  92 +++++++++++++++++
 arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
 3 files changed, 94 insertions(+), 112 deletions(-)
---
base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
change-id: 20260327-st-mmc-c906ad95ff83

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>


