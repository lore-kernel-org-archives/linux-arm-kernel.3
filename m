Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1770AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3oO7945/t9P7Yv5GgXToznrDjdBL9oYYRyLkZLH/Q9U=; b=z9bughuRAuL7tgbQ2CaKU7ZQn8
	7zOvrHfM16wEJN12TS37k9A/pOeH064uiSyW0v8RTg8g3/UDIhgHwXjZaMQzotQd/O3ChJ7H6UHGB
	MKibK40eR9hZ6yZixZ1C858HHS2dp8oAUK38lRayiha8HSbU6DrFDoiMyWmN9Ml0KEuOrzij3TaPM
	wC/r+y9WABk30gBLxGHK0GK1gxjqfyv6T8rw1rfLQr3XMQ5R/UAPluSzprpdNMIrdP01okDHFb4OL
	JUeBxUSUp4UhsqN+wM/9VUDwuJ8zYF0LI8/wbz3gtxIHbGjA7kgmLTsleYJE/cIAZ45QOt+OooIn+
	p0YfgVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMZa-00000002uQ4-3gr3;
	Mon, 14 Jul 2025 17:02:38 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKt8-00000002cSD-38pS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:14:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so6338548a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506081; x=1753110881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oO7945/t9P7Yv5GgXToznrDjdBL9oYYRyLkZLH/Q9U=;
        b=gDbU+IVhJwDGrfkgNy3uMnKftRINmoi8nUnNKCJbPDqPA83jcwipZBxgvc4WP4hN8i
         jKe2g+ZBCfE8ciubxhkJMBI4k+3rPwrZ6noulkbmVvJ6010xIaHwFF9avGkeP7y7fOcH
         VI76wNhTOI6T5Aj1BPOZ+AOm3xZYeZ4ACKR5Qo1KbKGoB28I7O+Wr1CHDj9z9fDthk3c
         w5Qn6dfxRcZdpdD7OQhAscXyGpxqyeytzGT5bc0PGHQta2YMUPRPB2yn5qkFmxLQSvQU
         ZZtHVzDhXBGTxzrMnynN5KmwLHm9Ev0IS2epzMH9zHu2rOobSpgxHk9ARHJ59qonkdoA
         D+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506081; x=1753110881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oO7945/t9P7Yv5GgXToznrDjdBL9oYYRyLkZLH/Q9U=;
        b=BZvScFs54ZrCusZ0IJeb/OvcRvyh8uaIBZYX90CeT8fYxKr+puofe8sjnOEcw5VrPb
         HVGZD/hdPWsHcXrEaLklEsbQ+lQR4cRs5REiCk3WE7whIkYznxWWdruqpk0yFD6GVT2/
         KhRC4F706jJHknWnSTzGovK+sMue+GTIwZtkFYPraeXZusJfMc00xzPj+q6sdjpWcz39
         2NO0ww349tWyZb8UZIPsW487b9vxyL0z/UGwqfes6iUGHsvjbo/aR0z4uDEpyD0pUTHp
         96377S7+hz+uxMBEZet9kH37NN5536+HEDmxgikC0XqR/Lpl+VrjDytE6du1OTQ2AgsP
         +a6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKxdMBYr/C8n0zvdW4hI5NzLdgG2AveYTRGkKbBUWSTKUPFUijs5Cb+TRKmAwvfeWbxI7F5dKViEPRCOj1tbJs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+qWPWWuNnXTsmIp3wi65mk9iAxpRckxdU2rshIkf3H7VqGGDr
	dumnf8SarUsMzCFs7VOQamEafDwY75pMG1fzctU3zh5pJ9/nlhsjMSFKuQcbNQ==
X-Gm-Gg: ASbGncuxjCNRpBoTzg5EK11jrTvUR69v4fzd/HoGYuJu6NEEQ9pwAKHoYzcSU1dwjaK
	0NIqicc0jc5zIsV9dytLsquLR/tCYE8RxhNF1ysCcv++ZkpV2XEx3ub/WbeQuNxl+z17OIChjVI
	URHpAt5C9BUoXl1u3/EEBpmDy0kftgc/euLfdzW6KY/Fd8USF7ssqrU53LwlEydpDmwjldgIf+h
	WoufvC7YzFG55AhRXNJIVLLhyXDjHahDlx5/5oE5yVQfpANgtgm2VtlKX9juH3J8H2k1kgERlBt
	eLxUPW2Jev1VglR7bmSHTvIU1Dp8FnBnUTA6Bzk40xaLGUB3ukpOlm4cyLHPCYKAtFbDm8HPEjv
	ZCdf8Il+5ASh4OHg/rZtUv8AY4dtGDTM+T1QmV9BxJMYEEPTRZnwgeqQo
X-Google-Smtp-Source: AGHT+IEMNMeFdovEOmEthHb3M9tQaXoDWJrcRpQpeLn2iZQAxWGug2pLJleD3OWWgryplxNKxQSfuQ==
X-Received: by 2002:a17:907:60d1:b0:ae3:6cc8:e431 with SMTP id a640c23a62f3a-ae6fc162659mr1523065966b.57.1752506080769;
        Mon, 14 Jul 2025 08:14:40 -0700 (PDT)
Received: from playground.localdomain ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eec2b1sm847701266b.68.2025.07.14.08.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:14:40 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Date: Mon, 14 Jul 2025 11:13:44 -0400
Message-Id: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081442_786088_35399B55 
X-CRM114-Status: GOOD (  11.53  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for the i.MX8ULP EVK9 board by introducing a new DTS and
a new compatible string.

---
Changes in v4:
* fix ordering in the Makefile
* highlighted a few differences between the EVK and EVK9 board in the
commit message as requested by Shawn
* link to v3: https://lore.kernel.org/lkml/20250701002239.972090-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* change order of the board DT compatible inside the binding.
"fsl,imx8ulp-9x9-evk" now comes before "fsl,imx8ulp-evk".
* link to v2: https://lore.kernel.org/lkml/20250627142645.134256-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* introduced a new compatible string for the board.
* aligned the pin configurations to the same column.
* link to v1: https://lore.kernel.org/lkml/20250623150146.1398044-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
  arm64: dts: imx: add dts for the imx8ulp evk9 board

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

-- 
2.34.1


