Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E52EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Z1CSMjo4bwXac777IKPq+E/WNf0vRomoDLRk/F823M=; b=iwBhzgceDXS/OG+PZ6SvjIKxWU
	TV+3k3RPvxn4q3gIPreKKvpZUpt7/p2fj+/IJ/uZffEeyMiUhOchs7X70zVPRcbKS62HoETHXIb+w
	t2ugYRhUY0mMGRMOBBW6DYUjWugQ8RM6mD0YRbdqKYESnYByTraDKuPVI8Bx220QACua2zWGFlvaf
	F5TngGyCgWqqQ4zfyE+0QM+c/DtKhP2B9ecR/tU5SBnW/hQdE0DUCnFxHNNMDRaNfVWFcRlHRKR+w
	RdQ5FHT06BVhJNZCLQL4cUzwYcQDLczskg8Xz5Eo66kBqnUfQS2/PwPmHvrX+VC2HXSCAifWeZDJR
	ATlnLE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVZI-0000000G395-21Uu;
	Thu, 01 May 2025 15:11:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVQT-0000000G1iT-33cW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:02:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so1499785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111732; x=1746716532; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Z1CSMjo4bwXac777IKPq+E/WNf0vRomoDLRk/F823M=;
        b=cyCDu91vM3sjMrq+VY2jZlVdXYcga8emXXbJo9KeEp++K5u0AMgyhUtoo4+yc5x7Nh
         PvBpda07yfOld5iEpfxg01cEkP2xmfpOR+cnHzvEslToiPFGfKe79Z+tZYE6GtHOlPor
         uVXFfZPa4ak0F6hh6Cfb26mxDTpad8wQhv0d2O/vLNczCqlrQdB6XAp/riSZX/JgUvGz
         z10AZ0zeiBFddOSROAl+qix8qJn82Y1t88iCc7CaYoly+hX6qclJ0sr/dMVvkg7Gg+Vs
         N0h8PRvO8kMS4RpXeGeGo1WWSXFS71X6DJPetxScNujDKj1QvNAisiV49Bzkl7EBjfQF
         OhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111732; x=1746716532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z1CSMjo4bwXac777IKPq+E/WNf0vRomoDLRk/F823M=;
        b=plDjDEcHLNrodw+F/tdiz/g76FDhuouFlG82pPQrcGYcVRswyObx2B9SpS2+/yAzJj
         f9uVgU5kOZOmqSHrsz06/MjRCn62LVKXYEsvXD179hKrQXX7ygaQaC3YJ8a8yjZABGa6
         h/Y47N4NS7APISupo68D2pHg1mOvfc2g7YYJ5QiD2yjBoCmD30uTFFD+CS1V0ffZiTKb
         rnF0pcJst3p7bHwVvPvIzoItTen6bWx+4+i7cIDl2XYlan10AvQBYhzBN+65dT30EsH3
         +Z/kezI9qmHNXuhj88Ork22tDBYaHfOzCbCH32U5M7/qRT6FoL9Dl+T5VqlBUtMHINYq
         qkiA==
X-Forwarded-Encrypted: i=1; AJvYcCVW1GznIEk3nBzGdNuKks532A6FtIjtBQUOcYU6N5B7Z2WBTgXMJSp7kSabprCDT76pAzI38mZBedMor2l4f86Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyYyKeC04zow61IzOlYpcX2lY4eVWJvameEwY6kei439KsnDGM3
	xF7Wd+MB7V2KkvyCkY5r6eBfaJo9/JXr4ufNiU/Zm1kDbCmQwOk1MDEtNrijoE0Kc90wWrpvElE
	J
X-Gm-Gg: ASbGncthpW4Jh7S9msHvvrhawLXznxz/GVvMcMPBwGg4AzoQy+9IPbl8stqmsfhSF8X
	ec/1JEHThxi9uMJkQ0Vgj2XOc+/odKhvAc9tgvbUkWK5glHnFjGDuqyB6B9ZrBzoVUOhan6/+eP
	0nsImY+1TA/TzKZJfTPWPNFQToA4feuqibsWUpnGIxtq/jSMtvsbu5uSDMUNi82HDK9pZvNWrjo
	vb3YTOoL+hnsu78QZNW1BAWYO7PJsGJLwi2GpPCUf2rZVIE4SSE9qAxtnidIv4Dn9Q5xSSbJZw9
	ndwWBkzWqgz2cDcNUjLIwTUxS6pClrMyebwbFYLQ5LR43PTm9FS7gGMDaFg=
X-Google-Smtp-Source: AGHT+IE0ENZdHGkQvgGoH2mnDKlJJ809LkSCtAMhmB4rpgM9Z08EWOHgpBqjUop6OrvJ3Ac5c98Akg==
X-Received: by 2002:a05:6000:1846:b0:3a0:75ff:261f with SMTP id ffacd0b85a97d-3a094178fb0mr816964f8f.11.1746111731899;
        Thu, 01 May 2025 08:02:11 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4702csm1033190f8f.40.2025.05.01.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:02:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 17:02:01 +0200
Subject: [PATCH v2 3/3] spi: cadence-quadspi: Assume device could match via
 platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-n-smatch-fixes-v2-3-d2ad9c1f2e67@linaro.org>
References: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
In-Reply-To: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
To: Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=B3v13NXCER5k3tKhwX7vqb0mye7ltzvO1U+oUASNdgU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4zs9gNikiLaGr7Pqc78Xp2+VrLMMAjp88bwS
 hB6yBtxryWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOM7AAKCRDBN2bmhouD
 11VpD/wNiGdprHFBTqCt2CnLkmyOfWKabgzUmeNPQie00KzOgJVHUUjWU4fQaeI30mVt9rfpu10
 llp9+NafbiQoqC/9fHr8ckF1T8bTk0UxAAmqyeIoxupKtWuT8SpFRVhzfWUWaxuAzgzji3dPDHK
 ljhiroQ5K9bYLCIjJ3DMJe2ajG458Q2H7Hj2Pgm0oyGZP6zVIA7fnv4p26E2xOIBkGaZWo57pFe
 bjmmIUqrklHrbwgPT9JjxthHgNtY9wYmOEietCJq06B9o3ATCvBI8OsvrP2VaachROYBHaEKiM8
 9kifoZWrIGLKbeMbGnJwami0uAWC1TckkzhDv7mVsqLKfToy9rFkSof7/756aD555PbJ9WQ55WJ
 ctyJMPc/lNwv7/qwagVd5gAb0lMZ3MWpgS+ZwEW4JQADcjC/B2Qvl2z8S05COKdPgBV8VaX7Y8p
 UuPfvFDlcmfyuy9ehhlRV3iO/nErNWoZK3M5rfTS/3jBgM2xcLy3CkdJ6+r6Ec2DJBVGtKG65Tu
 Tg87N0s6R+JDC6j2EAjrHOK2giHvXT23YzVbekBecuiJUBmydauJwxTtDQmzpDRFbWz0cB9v+ti
 5xN+x7ArX5Zwm4w2++0vpqUKE32Jr1CVH3vNQcABVwPWPvo6bd0gkioWh9nKgr83W+A39JkCwYD
 09YLX6LPBaP50/g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_080213_770128_3BD59B96 
X-CRM114-Status: GOOD (  13.91  )
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

Driver has only of_device_id table, however it also has MODULE_ALIAS()
for platform name, thus assume there is a configuration where this can
be loaded outside of OF system.  In such case of_device_get_match_data()
will return NULL, which is already checked in one place of probe()
function but not in the other, leading to Smatch warning:

  drivers/spi/spi-cadence-quadspi.c:1942 cqspi_probe() error: we previously assumed 'ddata' could be null (see line 1885)

Driver should be consistent, so assume device can be matched via
platform bus and of_device_get_match_data() can indeed return NULL.
This is also possible with malformed DTS on OF-platform: no unit address
and device node name matching driver name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-cadence-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index c90462783b3f9f05e477d337ab4187224992c0a0..fe0f122f07b0206e80cf89bd031106bf8051c789 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1949,7 +1949,7 @@ static int cqspi_probe(struct platform_device *pdev)
 
 	host->num_chipselect = cqspi->num_chipselect;
 
-	if (ddata->quirks & CQSPI_SUPPORT_DEVICE_RESET)
+	if (ddata && (ddata->quirks & CQSPI_SUPPORT_DEVICE_RESET))
 		cqspi_device_reset(cqspi);
 
 	if (cqspi->use_direct_mode) {

-- 
2.45.2


