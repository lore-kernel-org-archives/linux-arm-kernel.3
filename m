Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BB1C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZB8kiE+qcLLJcoLITaaDs20vORJvN1XQTZkEg+RWu78=; b=cC5RonLNi2jYbr
	keeaddGh3404bT536KDQNsrMoEMa1C0/r8B9wCYT/U9Y70vzhOL4J8Frwqi7jC4uP7d+qNWAfaOTE
	dHzW+E6bhwMc1FxvHfc/Ie9sYPtnxFh/YCcZjG1gichhW8E/Go9VjRSEyJhsvp69TyupneRGcNy70
	+GTXnxeeGC0NgEX4vxsyAdStyIoyHWlMV0Q89X0gX5CMIw10IhC8NH0ZSfx01oZ42nhcyS2MTFwSq
	+b+q5cpizy13vHGZXXbk1livsExLxjPRN5EzfQM6V3uypdPNMG8UndNi7v6b4zOh/ISdXrhwnLkwB
	CRlVFyG2a0qftAjGvutQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWpY-0000000E6Fz-3htJ;
	Fri, 21 Mar 2025 07:30:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWns-0000000E62f-0pjw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22438c356c8so31575575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542106; x=1743146906; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZB8kiE+qcLLJcoLITaaDs20vORJvN1XQTZkEg+RWu78=;
        b=ntYU1UVRsEMoUqg/O2Z/7/nXnkioz4FlPuyBUdC/cWG0ypR+X0OQI26eV40gs8wRJw
         vrSYCidlUPuFGHzzurZ+b069XeSk6DsGTfBnUNVw+okfuZjUjrrT4OPqRH8Vmhketc4r
         5a1Z+7m1LQpwQPWaIf9MP13M+62qHdFCJ1deNGfy62npz/wAATiMurJkDXbCtMn8KGc2
         QLtT+NcEHOION/Bxpn3qLcjta3zyxhkjT8s0CzwGXGV+Cr81fYLAvni4E/7e6tk2pYjL
         A0JmmSKwFfNGaUc3UBjFQWC59zLXBcICHhhPOXsgx+iEvDj9L6aFRDLDNmxYnhRbm1Ac
         kVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542106; x=1743146906;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZB8kiE+qcLLJcoLITaaDs20vORJvN1XQTZkEg+RWu78=;
        b=DAvSjbyJxP8JQ+kOwP0IVPftZHUYSyJuzfrCfgWAM7BWWLKcmK0uNFHHAVrkPD3gH9
         BrGlgxPBG/kkcSGApvqduxNQJ1Upgv2cpquk/yTw0c+esDYBu0VWofE8i1OPCxdVtVDk
         YIWj1QK/ausKEP7LEcgsSnyBlRktIb4zfc7ZNYDrUZZAWOykZOgZzmYyml6nASfCyEMo
         NKN2giyvxaVYWmYmCUAm3/yW3xMplwUsDSwSFKHSu4ICxYRTM8d8L0HiiqMjrypeTdyb
         o8CldD5aQq7cfmqhlcJ9H8kuxrzyT/rzs5iiE741PxZ75S+8pVsAoL4a1py6A5TzXNMw
         nxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb7vAmIXolzB5SEeaGslkwOvHrU2qR8dzJ+SLSgC843yOjRVgpdyxSZO3JUiaomG1esrV4UPMfgktS8L6KYPVl@lists.infradead.org
X-Gm-Message-State: AOJu0YyK/cXns0SU6yZXD8fXlSK0DICdEN6LhaVfvH9d4VUtI0t51tXc
	AjlonwCSEJrgoA8cQ0P4bj2nGgPH4tqUgX1faCj0Ur2pvQgLcQpIYC7vYw==
X-Gm-Gg: ASbGncvj0YqOsyb6PbLz3WAe/xtYYq511e6QqJ+zSPWhYS66fggaLK+gBu0qxgvSMtG
	+g6F8rMwS1j5ZZHBOUFFFPeA4NK250avmyquVAHgXlvZ9c5s8v1py1CxCzFbh6g9TzugvBnHLdy
	9iafLuZyEts1zPQc2WBK3wiOvDrrp3ktBTy8K7QvO1dPzdm6iesPVl/oCGvTZrIjUhylwDLKKcN
	6iGX2WZZ55PlCfPeVhjZtfk7S8ZTCdEgNqEPpx9B0MfWlZYvBWTKHOGSxBefkfLoxpJ/rUodbtF
	jleDyNL9PMQQnraHOK6XwH4JbGO9/YHM7/w8d5jpTbdGz7xB9V7USpwJ/h9xbRm6H9cVMhTZwQT
	+5vz4t+mhanPtWmtOMe4K0g==
X-Google-Smtp-Source: AGHT+IHlSEk8vePnKOkamFFIpfHyaA1m+UQS95Ubg2HRN1Dlu1q58w71hmeoIXSixkljxSV8yVTYSg==
X-Received: by 2002:a17:902:e884:b0:21f:8453:7484 with SMTP id d9443c01a7336-22780dae109mr29510195ad.30.1742542106449;
        Fri, 21 Mar 2025 00:28:26 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:26 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v6 00/10] ARM: dts: aspeed: catalina: Update DTS to support
 Catalina PVT hardware
Date: Fri, 21 Mar 2025 15:26:01 +0800
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkU3WcC/5XNTWrDMBCG4asEraui0a/VVe9RuhjJ40SQ2MZST
 Uvw3SsH2hqv3OU7DM93Z5mmRJm9nO5sojnlNPQ17NOJxQv2Z+Kprc2kkEaAkHwcSup5xILX1CN
 vS+YfY4uF+O+LBx2ERR3agKxC40Rd+nyMvL3XvqRchunrsTnDev3h1RF+Bg48iODQSBW9bV7PN
 0zX5zjc2MrPckPCMVJWEpw0AK4jh35Pqi2pD5FqJbVvwGkdZEd7Uv+RSopDpOaCu6h0aEB5AXp
 Pmv+TppIEFgJZ0yh0W3JZlm+PDpfaIAIAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=2266;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=Nj94npq6q1wguoTxPUR60r+bZgVts+q6TMPv2OWz25Q=;
 b=O/AOrrLZgeC/5rmjqrKCnMKUbnnQpINPRqSIVmrM7UpVxmhshmQJ+PP052IxOx5ip+tGzT9l9
 JvIg8Q2vxwbAnO6gEvkWg8UYp1hBTjnq8UV9sZBTkW7igHFNpyMmbOw
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002828_245959_D729902D 
X-CRM114-Status: UNSURE (   9.88  )
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

Update the DTS file for the Catalina platform based on the PVT hardware
changes.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v6:
- Rename the fan controller nodes with appropriate name
- Link to v5: https://lore.kernel.org/r/20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com

Changes in v5:
- Revise CBC FRU eeprom i2c bus and address
- Add MCTP support for backend NIC monitoring via PLDM over MCTP
- Link to v4: https://lore.kernel.org/r/20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com

Changes in v4:
- Split a single commit into multiple smaller commits to reduce complexity.
- Add `multi-master` into i2c12 & i2c13  
- Link to v3: https://lore.kernel.org/r/20250114-potin-catalina-dts-update-20250102-v3-1-14981744b2fe@gmail.com

Changes in v3:
- Remove delta_brick nodes due to compatible string not supported
- Link to v2: https://lore.kernel.org/r/20250113-potin-catalina-dts-update-20250102-v2-1-1725117fe7a9@gmail.com

Changes in v2:
- Add delta_brick nodes to support PDB brick board
- Link to v1: https://lore.kernel.org/r/20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com

---
Potin Lai (10):
      ARM: dts: aspeed: catalina: Add IO Mezz board thermal sensor nodes
      ARM: dts: aspeed: catalina: Add Front IO board remote thermal sensor
      ARM: dts: aspeed: catalina: Add MP5990 power sensor node
      ARM: dts: aspeed: catalina: Add fan controller support
      ARM: dts: aspeed: catalina: Add second source fan controller support
      ARM: dts: aspeed: catalina: Add second source HSC node support
      ARM: dts: aspeed: catalina: Remove INA238 and INA230 nodes
      ARM: dts: aspeed: catalina: Enable multi-master on additional I2C buses
      ARM: dts: aspeed: catalina: Update CBC FRU EEPROM I2C bus and address
      ARM: dts: aspeed: catalina: Enable MCTP support for NIC management

 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 197 +++++++++++++++------
 1 file changed, 144 insertions(+), 53 deletions(-)
---
base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
change-id: 20250102-potin-catalina-dts-update-20250102-914b06a4bdba

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


