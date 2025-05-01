Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE64FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ttrcVZYlqM0kZXU17grb522rcBK1Mj9yyOBAh163GPk=; b=lWMdbCxmr+W/du
	HsjkVDh2zFXiM2PlGyYA2hp9+MiAen40dR+if/uFMnZPwnhx2qiGRtVJW+rlTwvKs76gdqcJaky2j
	/z/aolVCVetswO+InUgs6BRlR5ojAgnW6oyF/b477BhkgDbRa/IFg+0Y375nhwS2v3erIF7caRXsF
	I4ZwPDioGhH5JeXQVOLi7s1gzPdw6S0jSoarM/tOYw8+chyP9hmoYcsxqK1spqjXShbUTuxXJxhA3
	b3eJkEohcAL5h3s5dHh4XQmOJeOIUbEzD1HHUN/iYLWbMJ2o89moGKhDhWf8/pAl+kqm3AI3joA4U
	SJmrj8XqZNhrhlFUzdQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVTe-0000000G2GU-1eeW;
	Thu, 01 May 2025 15:05:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVQP-0000000G1h9-1kWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:02:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39d94327297so20150f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111728; x=1746716528; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttrcVZYlqM0kZXU17grb522rcBK1Mj9yyOBAh163GPk=;
        b=J/QRdBf6TBJWsggQR3OwPNAkTWa+5OkfwYqWDbfcEA0cv6sSrFhsK8ThOirYJOQt4f
         36lEyEDgs3Nq56sxQ0NXrAaXL9KuMRlBoxsjk7KRHHOUB08DiL8FCdI96iiKmMFjbgFu
         OfE3V5lc9BUHChjhS/jKWo2PLT6Q/kTWt9htRJBRivmtQP4O+VABv32Ec7+81EeTz1gx
         KmRiMGA5RAlg8OLzvdzcUz6QZM03ZmHRz5kiKXO667nyWNmaAzkFecVoqLp25AZmn7tc
         zTpIvb3CjZsS/fjMbQTAGEJs7+n21+ib2bWP7VjEE4Hvc/u3wlKdzT6ddOFzp0W8BhVV
         SBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111728; x=1746716528;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttrcVZYlqM0kZXU17grb522rcBK1Mj9yyOBAh163GPk=;
        b=EGCz2SpY0+kbhaU7MzxDNW8gyHTGYDiRQgfZibAIUk83q/KqSoTx9hqKMeOs94TFZl
         1zppx5Ud8CZHMEWeKzVZGjdjGi1Sr1SMBQ3iKx5l7uMUejSz+2tOjwf4mfE/KOVjnpYU
         r33Vq4HJZL4psz4MZz847pb98SUHL1q3Q6Acj2EfICOvzVwAEFL3mcQZdVWiblhSa0vj
         0BR0+Ib2+dYxvjp94Hnm/K2cD6PDVEG0pHb7749RiwRu2xSvFZkK2qCTU2R1+JOJqhme
         95J4tQqNTY8QLa/E0dbVq4FL1zWALrqcuJmnDEN53Miu0KoyvjhAS8WNltxrj2JhmjcQ
         fqhA==
X-Forwarded-Encrypted: i=1; AJvYcCWAD7uIOHB+j8k2m6tAKoh/HuZVsfT47pm7a0JEopblUFOWDbT89WNnlhyP9zbLl9F4/9/2G/I3lXe3RCtUfiKX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4qY2pQGI40LP7VfA5uCSr8aUQVBs4/2Aut6KYYNvKLUD1pGQV
	i8UbrLIgGehkCpMTgpYL+CIHtdyQlKS2vUOxhjwKOaYCGR6unWSlcQpy427Y4IE=
X-Gm-Gg: ASbGncvx39VE+blJ223Ig8L0UwOzYU92FFMRxlKEcufr65h52vAtW2Km5oMgHHWp44j
	TPMO7b52ganPHQSMPTQKGT0NFLIQ2xPiBL+RLw4xCLHioGbgaO4uYrZbH/Xf0ZbEelqWDrdwOiA
	Mxj+vg2NPlmiXuVB/1nF8z04m/VY1dP7DL4uIS9sEV5qkAMnjKVaZitrf7oVlxrIrUc95ew7IZ9
	Y61R3AXo1pBE5qYrVWKhCtJ/Dhj9DBtPeunu+TYcLP5epLnmJ5Wi+zXwLb8US/ALGAvLgvqFV+2
	2rN5geoZV+NSqbx8owxQYhz/xG4SU5uYKtr2XCRL+QBefRJZQ2tOwDWXV40=
X-Google-Smtp-Source: AGHT+IGZ0ehud/ximXE2CMIJErpM4SI/FhJUBgX6fJOCUs66uW5nSEtDJMw+MUC0zHgypjkuk3SDZQ==
X-Received: by 2002:a05:6000:1866:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a09007e244mr2089279f8f.12.1746111727129;
        Thu, 01 May 2025 08:02:07 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4702csm1033190f8f.40.2025.05.01.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:02:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] spi: Minor smatch fixes
Date: Thu, 01 May 2025 17:01:58 +0200
Message-Id: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaME2gC/x3LwQpAQBRG4VfRXbs1RoRXkcVk/uEuDM2VlLy7y
 fLrdB5SJIHSUDyUcInKHjNsWdC8uriAxWeTNbYxjak4sm7unFcOckPZokfru+Br1JSnI+EP+Rm
 n9/0AxdzydWAAAAA=
X-Change-ID: 20250501-n-smatch-fixes-2e9e6d8fd3e3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1VWijjOveKM78Pbg6yVVTbPVhW2rlfQmcQFnP8XIqZ0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4zple8GyUEoL6IZq4zjpqAic8P29xT7tLZY/
 oehltltRHeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOM6QAKCRDBN2bmhouD
 10owD/9FVZ+pJ3mQzWF33wBIVcZ98/gdePGTPJk3U6ZXnM4XdSM93A8EysytmRSKp7mhypSC09S
 FG1Wog7SPakZpceFVwWPPrGY2hKwztfjXSqNvvBc+8dZrFaSEWCfcDXQbj/U8stZYVvLnWn2n+M
 ePWBE9BgqY4tVnCYizR8Ly6Uz4vq8Hd/oonDUaOetnq0k31z+QKYnGXL5MYWNJmVaqadmvjOHie
 hYusnzCyascIXdMkQmABsoD7Iy9WYp3xqi2jEk2Z7FrsHT26YGL7QlJei96DEMbhQDn+D8g3oJD
 MI+V1U5WUI/iy+w+1Y/10hyKKJocJDHxkobU93xbfHaHcJkB8r9of/gU698FNKF+Lh/b7WY96NZ
 zI7PcXajVysujp5u87R79aAfMiB8YZGZ0+gHy7vU5Q+ySZO2e9jGenhmcyYk1+zg+iL9mjK5fe7
 J9UUK1JDjVstLr133cuD1nGE6Sw7v0IgMS4aNWFpqvRaVMcnNE5/cB/TilOQGRX+TLUJX9QzSpC
 OpyD2tAVGgC1kI3A6okSAkKk4B7c6ZtK7Nbvd8lpdDjN8GZzoSJV07M4Ym4+7PK8ZwK+KFXnA4X
 si/kVQaqYfcvNnfJTrn7Lb0S+Q9BAXayQixDMKbVa8YjDsHsPbI2vn87cfFbihe7Be5gkOtN1q0
 4Oy9BANH0Pd/Djw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_080209_461364_FC8BE9E5 
X-CRM114-Status: UNSURE (   8.96  )
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

Just few fixes.

Changes in v2:
1. IS_ERR_OR_NULL->IS_ERR in cs42l43
2. Drop patch which was already fixed in the meantime by other person

v1: https://lore.kernel.org/all/20250104205437.184782-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      spi: atmel-quadspi: Fix printed error code during DMA setup
      spi: cs42l43: Make handling missing spk-id GPIOs explicit
      spi: cadence-quadspi: Assume device could match via platform

 drivers/spi/atmel-quadspi.c       | 9 +++++----
 drivers/spi/spi-cadence-quadspi.c | 2 +-
 drivers/spi/spi-cs42l43.c         | 4 +++-
 3 files changed, 9 insertions(+), 6 deletions(-)
---
base-commit: 6b7e080d43429e85b40355986026eb69ef775df9
change-id: 20250501-n-smatch-fixes-2e9e6d8fd3e3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


