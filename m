Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F28C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XQniEnlPqREiFOfpNWpo606nSBL+SggHNXBd+i0UwbA=; b=ETs3PkgLZz/22x
	XbxIOEXVXrzr4qATOYNQNhhuSenc8E45jMU8SAqaYwkcmu29Q+GqgrX8OAGbcFNyXYYzY5TreRJui
	zpI+f8Pi6o1rNWX0jD/n1cJsM2qxUY29DAkfxxaqBqbSy+LrEX4kqWdwe8TfYh8Q9Ecc2e83CZNZV
	W9gVRAu2qqloOG2IoZJD52O4b2wO9aHAmHHmecHtD4HgGZHPrbBQty1bfQ/p/fxdna4BYyq4k6pJ3
	Wo6JQBugpNzmVZN2vYjtnN3nrQeM+/c33V1W/oC/njxULtwYKTjnNMdn25CYUbwAQv3W+kZO0s7Gt
	I+A3soGOwtzp4RvvG5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1testh-0000000F0xr-2E2h;
	Mon, 03 Feb 2025 09:37:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesr3-0000000F0Yr-3dSi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:35:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436a03197b2so27848165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 01:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738575296; x=1739180096; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQniEnlPqREiFOfpNWpo606nSBL+SggHNXBd+i0UwbA=;
        b=GhFp5dcZbvzwO68xAz1gHUvvIjV22aR+1QiG8W59j/C7p+M/fsbysMh5gxmtZv8jup
         WhzfZfVFarhVoOi3yPZmqlKPcZRRoBiDytlxBd84UJwHuQ5fEhIzbqPfRG4zMmJn1fYK
         RKttWVkURwx/lZPn2q0JsdCRPk9I1X4EfwV2amQ/Nc0bWTBnKkHvw/bHLnxQv49TQxUA
         GJux5v126xPfLBrBKllUqJBIwfQuhWrA6MYSyk0vBdY4reN214J7N4e/hjFhc7ONV7aR
         Zi+P1JshiJA6F5L561gavaxZxaxUPVgSWfZLNjyssp7MBrjozBM8L1G9EpPKxOKSxijL
         LcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575296; x=1739180096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQniEnlPqREiFOfpNWpo606nSBL+SggHNXBd+i0UwbA=;
        b=oIdpllffWUZZnr8Awjx87LHMXTW4J8GMnHGujAEJWRFpPenJDGcaF25LexcS32CZ+J
         nT5kyj/ZwTQwNMl2VK5b6JobY3YMeLDwrl12OLuwlp1cVYvMk+QVK1HZF6i+GHdFHryl
         Vt8ePk+nCBgW9R2TLy6EdWb3jxaWOnV0azktfraqg8IEYR7mkp46zPn3/GVQvOqeseKT
         cJLSR+kTSD4pqKKNlgbqyl4LFhaWfKlyr9OmTTlW4wkZmVtMowq2+XNHQPJvMDqGwYlU
         TRAW49pOYmLPmEV9dJLjNkE85xsQKDeubM22aF2M7U6XLk0iY8ctPFXaJhlVXAxAJbuy
         1+ww==
X-Forwarded-Encrypted: i=1; AJvYcCXA9xn51CK49PvInbQxURzHTADMrbpVXMxh5Q741oiz14HZ0Q724vOLn0Hili5Eb2JfuYSWlEdXvjRuRrBWa5Ey@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo9tQZjvjWza3CSc2wRgo7+Bkz3Ya9WDQFqICfp159JnBZVjGZ
	bW4VxvX1noIxDVnRNy8jvtvPx0K32yLCNNeNlblzZdNq5qoPPnOqKrL09kPJbzk=
X-Gm-Gg: ASbGncthmrxI9IZeXg7f2DQZEyvhGVuleBkmZOv16p4BMtFaC3jOlyKOjoOwJYxGa1C
	GGV+Lt4NdFCSvfAVedsqQlCsDeUtE4XYcCA7TtX8EsiBHdcFgS8B/eOla9gShx9Kt/U2VLqosth
	Dwzp+BncHCAuPvePWzFDyLtR35uFq9HS9DediHEN8pz3pdfSaagEKcAr0hvbQUASEayE9P6m9pl
	o0rhcQ+sfCWVTB9EGSVAKTYqcGrF4HvzOrhmSOXzFNDf4UnVQFyFMLgtFVH1G1wdsgWos6dS24p
	1yq9XIK3lGmG
X-Google-Smtp-Source: AGHT+IGAS4aZe1uEvA/6IkSMVPyhPq7FXIW82d+vI0jBSD7HAnozIOs8zd6eghdccvxRb8J90wOJQQ==
X-Received: by 2002:a05:6000:4011:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38c520a35dcmr20209543f8f.35.1738575295835;
        Mon, 03 Feb 2025 01:34:55 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c0ec7aasm12136166f8f.5.2025.02.03.01.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:34:55 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: ti: k3-am62*-sk: Add wkup/mcu_uart0
 aliases
Date: Mon, 03 Feb 2025 10:34:09 +0100
Message-Id: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJGNoGcC/x2NSQqEQAwAvyI5G2jjBvOVwUO00xpwoyMiiH+fH
 o91qKobTKKKwSe7IcqpptuaoMgzGCZeR0H1iYEc1Y5cice264C8NIR/lWfkWdnE8GywqLCtyNd
 lCL53LaTKHiXo9R6+3fP8AJM+k2txAAAA
X-Change-ID: 20250203-topic-am62-serial-aliases-v6-14-742d53ffdb07
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=816; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4iSXCSQD+iqnPgY9Sq7mg/18cYhXxnnkILGNsHGeDb0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNIX9M7e8vPOM4FNq18/+x1yXmo6w/K/WnxyykWT3ls06
 zE+a1vp31HKwiDGwSArpshy98PCd3Vy1xdErHvkCDOHlQlkCAMXpwBMJGM9I8OiGdnTonxCHZbx
 V3bZfbkaXHmFq/XyO/sTXTW392zmX/OG4Q/HpAm6x0y9nxt1M4j+Mfgcq8Wi4i9TXyJv8lA6aOG
 PPFYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_013458_172315_4C2B90AE 
X-CRM114-Status: UNSURE (   8.38  )
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

Hi,

add serial aliases for wkup and mcu uart0. Add them to have the same
order on all boards as well.

Best
Markus

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

---
Markus Schneider-Pargmann (2):
      arm64: dts: ti: k3-am62x-sk-common: Add serial aliases
      arm64: dts: ti: k3-am62a7-sk: Add serial alias

Vibhore Vardhan (1):
      arm64: dts: ti: k3-am62p5-sk: Add serial alias

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts        | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 1 +
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 ++
 3 files changed, 4 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-topic-am62-serial-aliases-v6-14-742d53ffdb07

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


