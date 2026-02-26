Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA03FD8FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gHrNVpcs/hEO06/Gn4MOS4dYkB1LY3OsaJK5+hgF/9c=; b=Cf7YVwXtxl2F5b
	BnvtswKQmiMXItMdgkRsMDckRYHoYgecmiD/qzP3VNYFjWtkVB+CeYbhvJjNZ4EXkZhYOHnZQRb5l
	6C2bSBTDnvA5gOZUTT4dvyvkK2X/SgmGD4o9kzbDyzoJR8S3KB3WIiSxY3p9uwG7qItKgQgWdttXT
	PUwt78vvlgUVdGZjCT9EyblFIjQa/J54vI3D4SWZmsJ+AzO/dleJBnoI1jxX0weknU2Yp+YXYM8lE
	ciDt3GwIZ5m+bYlduv1RA/b1Mu7rIhfFGfby+19W9zfpClTAzkmpBadg7bX/d7YNoXEkK7XZ5+fba
	Pe3rCpAOOQEF3K/Q5Mkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdzm-00000006hbB-0pTP;
	Thu, 26 Feb 2026 16:13:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdzj-00000006ham-2aYU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:13:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso5062045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772122422; x=1772727222; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHrNVpcs/hEO06/Gn4MOS4dYkB1LY3OsaJK5+hgF/9c=;
        b=NrQuJSsStFtoVmx6rC/Yz0lWpOJ6ixqcjsgVqZNmCrFONDIfVHv23BqIox3Cl8BDtv
         mm/GxbhE7qFO5CVglCqXjiHDq/qp3+T2A61xlEdHuuXMc3JGmK0TGluKAaOS9NUiyHpr
         JzhQTFy0ix/64weEkp0Vb/H6JGQF+TN5NOesg+JTDM06ZykWiG2q2M7b5OHWEoC8NPQV
         SrSVPm9DakNzoBWPUGGYhfORbjNnPQfTIowGEgA78XJ+lgrKyRrZh1rnHugX/4fg2JyM
         +GtQq3g/xWR3ke+uq267TbD4QP6V9cNhgvw+LKwRWwS1by3yoTYySymHAUVv0v5eLVla
         3zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772122422; x=1772727222;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHrNVpcs/hEO06/Gn4MOS4dYkB1LY3OsaJK5+hgF/9c=;
        b=GdVOfVkzdWyrz6c52CwJQWgV1Yit/ruDaUDnQJQt/628r3DSHim/LytCU0rRpV6hhV
         ACuukb+O8HX7CQ0iJupbOy1LW6SvZBOsL0Ij+oCuZYYF5uBwHqQrnMjizakpfT8HRklr
         HbjoD5kwEuyLud3VxIhSOg49TZ9J1pIA637DHD5PNgUT7gLwcqX1SL6J6TmIQTDOpaVR
         IsWzqzaBvi6yWyFMZDToNB0dbapblQW1th+x/7tMzoPprZUzw/z9XDaNyB8mLbgKuRU6
         9tMf7QDd23M1AfQ1jM8Kj6IyUpj5E/lbbs8ZXl89MYNAUlmaEa9VTzqrSSoX6h4LR5P7
         OIuA==
X-Forwarded-Encrypted: i=1; AJvYcCW8QgGgSIIS/qaT6NZIPc4RmzQGF0NXSmYWOw5W8Hw9GPLN16rMZssCT1m0Knr6oXaUutIcW0Ai/gfsaQH6r6RJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxOA2yvdI6JOUFHq9IKsY1MxW7sNY/6XRwwiHyhPVYBGkjaW3st
	qHNBZczywFSGu7/dLo90dEaeqtVip/x3XRR/PsKVSkpVj1IrZb28/0KO
X-Gm-Gg: ATEYQzw4is2Hs86Y3PS80LTgIX5kIFcIS9Q3o+gyQ0n0nS1adkklvsZqyo3JFl3y86p
	VkZyN2pXLuJ5MKy4Mh5hhBJrtkLwnf5Y2k+Zs96KzgkFGoIw38W4atvjpUO9ZEvDzOUJizyZJ2N
	UySJwqQb0lTQAhZb9iIeyrugHoO9r/rUh9ut54UWEy/USBcrrsZHEkZm/ommy6l2ihbq5g9PaaR
	uT+WeCkP8zqQsT9j4A2dFCJflns8ou6mumfD6QNtVLdqcbmOajdiYIGCyl5H0AWTRHrncycinvf
	UR42YhNoEO35PoZxW0WqL1Lfmk3dLcmOV7i/NbSPYkdjjhrB+a9RBRjUnwP7eaSITmVFGSjnbLo
	hAMfX5AEXcB2jP2KJoN7npWZ0cS6RXE6RVB0XMGOg/1Z9X/vzeLNzc5n6M8UMbsIqXckMoNd6UD
	rZaiKeVbaXL05tHy7MHRx1Z+ksmVSYh7QA4VqAXgQQCsQRsAB86RbuAqfg
X-Received: by 2002:a17:902:e54d:b0:2ad:ad0f:bbc4 with SMTP id d9443c01a7336-2ae03487058mr35953045ad.31.1772122421968;
        Thu, 26 Feb 2026 08:13:41 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.183.54.8])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb6a0432sm44384595ad.52.2026.02.26.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:13:41 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Subject: [PATCH v3 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
Date: Thu, 26 Feb 2026 16:13:32 +0000
Message-Id: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACxxoGkC/13Myw6CMBCF4VchXVvTDldd+R7GRZmOMIlQ0ppGQ
 3h3C24Iy3OS/5tFIM8UxDWbhafIgd2YRn7KBPZm7EiyTVuAgkppaKTxgxwYvcOeJ4kKValLBQV
 VIjWTpyd/Nu/+SLvn8Hb+u/FRr+9fAl0fpKilkoZKe1E1aUX5rRsMv87oBrFKEXY1FMcaUt20Z
 A1aQIvtvl6W5QehN0F66AAAAA==
X-Change-ID: 20260128-arm-microchip-c0c0515024e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_081343_665614_3E2A4E8B 
X-CRM114-Status: UNSURE (   7.93  )
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

Convert various legacy .txt bindings for Microchip (formerly Atmel) AT91/SAMA
family system peripherals to proper YAML schemas. This includes:

- CHIPID (SoC ID register block)
- PIT (Period Interval Timer, old style)
- PIT64B (64-bit Period Interval Timer, newer parts)
- ST (System Timer, including watchdog subnode)
- RAMC/SDRAMC/DDRAMC/UDDRC (SDRAM/DDR memory controller

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
Changes in v3:
- Change email for maintainers.
- atmel,at91rm9200-st: redefine watchdog node as a pattern property.
- Remove corresponding binding node from txt document for every yaml patch. 
- Link to v2: https://lore.kernel.org/r/20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com

Changes in v2:
- Change email for maintainers.
- microchip,sam9x60-pit64b: modify compatible and clock-names in properties.  
- Link to v1: https://lore.kernel.org/r/20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com

---
Akhila YS (5):
      dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
      dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
      dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema

 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 +++++++++++++++++++++
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 69 ++++++++++++++++++++++
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 +++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 +++++++++++++++++++++
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
 6 files changed, 294 insertions(+), 48 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260128-arm-microchip-c0c0515024e6

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


