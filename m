Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AEFFEFB5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=466ZNlGBRiWCngVU9gts5XHrclzbPJSe7d3Wzr8dFzU=; b=cTuJ9Xlhy7jNjk
	PX7ga3EPwPTbCRdjRphM1RWooCHDs/YyHviNXWcVDVT8uQUe462jayAACWkmke6zNLcFhUIysJ4G4
	ar7U7t2Nx2OJ+2Z1g7acKJv1nPNmzLYKOiiRHKD/WQou0eAnuIwklk6cPIpXz/533mifpg9Ru+24Z
	r4kRoETYcALh16IYXtOPxJIkiyTGGtJ5CacU+Dd8XYnKsV/WhPdPjByLutm0G4P+aFMTDrne+v9es
	cqqCv+SkY9KiMzyACRGav7n0SiOi8blxL2spPdXOAjAtl3FUiwuZmAowi5obyaTjvEkkNzJEim4Ea
	DciMenvd0hvo/eASWK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYD-00000008YyF-0iU1;
	Fri, 27 Feb 2026 15:14:45 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYA-00000008Yxp-2xCg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:14:44 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3591cc98871so930773a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205282; x=1772810082; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=466ZNlGBRiWCngVU9gts5XHrclzbPJSe7d3Wzr8dFzU=;
        b=XaSi2GTjWK76v6wv3joIeuHUBgKyU+FA1egGrVcV5BAt6soL/kUfNd1vZHXwBY/3eA
         NBU2daBFYlvuwsVhMksj9SmJlGT3pRBcHdT+I+zUPRZWRmX7T6ChnBPOY4VhI5FqHUG7
         gLNJkln4jvTPt3r6lTHQlRMHUM0mwwteqG2h0Hlvxt1qODryaAmiNDIbyYTmVVTgqNlx
         yvtX3iAJmZVXetARe+MYI2Nx3ITLDJHJ/VkA5qESBXfpn7pLeV3PCIYKJwOQ7gh4ouk9
         O3rmAkvFizANE3MLdjnDwp3iGOz6FPJouNhcqhhFWsK+FA0osrJNM1xBp7GteNi1TVCu
         KZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205282; x=1772810082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=466ZNlGBRiWCngVU9gts5XHrclzbPJSe7d3Wzr8dFzU=;
        b=Z/dL/OqaR0dlVOiLkqS1P71PW2sIeOL2XSuKambLwCqun7Kce4pQ5jJkrDqLJTsCm3
         hrvK6RdaKnLbYsaZZ09Gqp3VBaMTjEah4oBYQa20x/ejj40XsqMtfPqeRSGbtrq77PKp
         /7ggsVRnA+k2nDcU4rVufKvbxQYG4ycwlcmstlis3eVzwTEFAFwR6oQdiYdyFxVu9/kg
         dcNafdAPyuxcrYhmDoxjS2DbY7U4SKYz6kPtZ2QAmNUQo5qnXwXXutv5oc7Hy6qBBQvG
         F0wghDp9RBrluVLEzmZI0mIyoRFKEx9RKhps6CID6D6eFZHzNr5baYjfyV8zThDIKruO
         lsTg==
X-Forwarded-Encrypted: i=1; AJvYcCXQADIMmAgiyySGbCEe5cjLgZukkYGxmkq3vrLP6tPRJpXKK42hbR+CUH6DIHV27lKIdHeXwOYYoGP7nEmjhxt1@lists.infradead.org
X-Gm-Message-State: AOJu0YxRmOFyj6Qb3EVQw7ZD7hqyxokt6nbdZpOMMpSkQX1iVy2Mh6O7
	nDD8TEdQVRm5HOnLwRGRivDoMpailxxmFVs4OsxipGc1MO+hy/uLYgAa
X-Gm-Gg: ATEYQzz2JnpoOCecTNHZ1YGTMuMu4VarAA8wRhSERRb1DHc5SXTTeNSLApux60UNn5o
	ub5irEqRMTaH9Qn2vmb0nuih1V7LqJKzNhANfNBv7Da4+377iZOjzjysnrnaWYggil5zCYkwIk7
	0cQEPWkoMc73N9yV7CUs5PiQXVmkv8gjtfTSPmbE4B2z88eIwrOhqwYiMcquwhkGIgYQK0EETgp
	xJk7T9gjJjCEnF7OQp2idQy0KIfi5OOLhP7RpfFSU1jRRAgCg7qkBnyhTM3IN30cg4apgtB9i+H
	HPhNp6JM9YSQUpiGKxDDrdngwjT/wecfjPzVd+8x/kIgTOot5riHbSM/I5YNMrAlC7/lAuhqFr+
	ga1IhqiSxfp4ijTjj/j4VndtFQZ4B38a9PmDc0MghyFbuNnqZNttrfkY94D+xru9s+rrL6/sLDV
	eErdgqNCJdu94GRJxHmlIXScE9HItqEHgxPK6dXGiV2ZSfJiOu
X-Received: by 2002:a17:90b:4e8d:b0:359:1063:6af2 with SMTP id 98e67ed59e1d1-35965cad8c3mr2626322a91.20.1772205281414;
        Fri, 27 Feb 2026 07:14:41 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.69.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5485848a91.8.2026.02.27.07.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:14:40 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Subject: [PATCH v4 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
Date: Fri, 27 Feb 2026 15:14:30 +0000
Message-Id: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANa0oWkC/13Myw6CMBCF4VcxXVszHe6ufA/jokxHmEQoKYZoC
 O9uwQ1heU7y/bMaOQiP6nqaVeBJRvF9HOn5pKi1fcNaXNwKAXMwWGobOt0JBU+tDJqAIDMZYMq
 5imYI/JTP1rs/4m5lfPvw3fKTWd9/CU1xKE1Gg7acuQoKNsDJremsvC7kO7WWJtxpTI8aoy5rd
 pYckqP6qJO9zo86iRpqZ01ma1ch7vWyLD8ZoIJcJgEAAA==
X-Change-ID: 20260128-arm-microchip-c0c0515024e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071442_764128_BCB88CDE 
X-CRM114-Status: UNSURE (   8.21  )
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
Changes in v4:
- atmel,at91rm9200-sdramc: remove "- items enum:" and replace it with "- enum:" for compatible property.
- Link to v3: https://lore.kernel.org/r/20260226-arm-microchip-v3-0-0bda15abd922@gmail.com

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

 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 66 +++++++++++++++++++++
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 69 ++++++++++++++++++++++
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 +++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 +++++++++++++++++++++
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
 6 files changed, 293 insertions(+), 48 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260128-arm-microchip-c0c0515024e6

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


