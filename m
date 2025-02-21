Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CF8C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W/2Y+JVQ+n3qognQWqPMWeNlR2lyIlTcpQrbV4OKmFc=; b=tJ/M2+udpw5sb20QJ/aIs2LMik
	c+Tbgt22Bs2V7eNArnPagnqBZv2pY1G4COzhcDTzjR2n/vOgzaAiPWogoBbNZe4t9xRkjcnOzQU3e
	G62tiqdh9t7ryh86qhmZnqYh33rPbqpizf3VWoVXNY0TIhlXWayhSgYWDAR+tKuI2EScZJsapsVVa
	zju/0PA8W/u4VXqQ5BT0zQwwnBI4qYMZRqa46qLTRMA99F7LpXo+asKCdqQtc3DWS2F8KFBWAuBJk
	AzOXvvG6Rtlp9uvHggMgOBFnG5U3SyasRc4giArNSSN+unnmZ7vDTnsLblc5lFNKl7cmuk+YljTF5
	i0Ygb4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYaQ-00000006dRy-0Z71;
	Fri, 21 Feb 2025 19:21:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYYv-00000006d7g-1HnR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:19:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abb9709b5b5so467547966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165587; x=1740770387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/2Y+JVQ+n3qognQWqPMWeNlR2lyIlTcpQrbV4OKmFc=;
        b=Gb9hO8c6kxALMR4Q+TFNNOjB8Kmr70Q+23m5OgpkG846wPvEJPzEvl9SVbq26/Orz2
         E+7CYzJ4c7xE27+AFyJzoBzNtZXWRpTWBQsJnM6jpscl0qjDQuy/4PDsLa0h/KgFC2CH
         O0K2Mev2FQ5NIJHqRW01R4fq+8TbvOCg7+xfRsueamN66HLLK8sXbUvXeZLm/IZN3aRQ
         DXFj+RXsgEhbZVRHqHepYT/I0416nd/7gRRDJZ29dzmwrbfidZ+75+jtZJDGvZRwneFl
         a05g+GQRsjYM69Y/Ki9FvCzZrH3H9JPps3TfROZIPkLpUoyhGAwuPaYV5L0sr4ckrZJ9
         dPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165587; x=1740770387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/2Y+JVQ+n3qognQWqPMWeNlR2lyIlTcpQrbV4OKmFc=;
        b=ekDKgGcUlHRAq6QdASO4NxRaUD5EgEFtbtB8mhFPrDXhF5hWFCr6UGhKRfHGNG+5DS
         V9CLawqdYJcG31BOOnFAwS4KsE15JZBOV8THJUvwjCPzyIjOutaP/h3dKFb1gec54fdB
         8nxM13Lz7tzbe/ngwM2hsyM3mmGriro8/iahHOhrG9FMgjNkE90lkeMYl9XNZHT8fNsX
         T7fIWTnA9VInFyIFWEF71g6/ULuY3wlP67vAryCSgosXDy/Fw+oSzUMiDLC3OdSVHcP9
         2quyDUBTwkghXd1f6WwcOYYFZO4s4tIp04A/Hk4o5yG/A6FUn54Llpuc43SextbVNLe7
         YkxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDxgOR7WYjjtAU5JgA83E1JrLJl5NpgjusGWBJ8a3z1EO+qKNkDW1j3+EE6Qf1jEhQVTjNLeTN4gLuQAjpJeoI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7QqfUULVBHH6NzSRQ/HzdAtPNIiRmJjY7M/qwpUQokBxldC16
	Z8ziDq0PC+XP1LkS3J/cytjBk5U53vXWM40x6Nv08QAe02Bqj/4f
X-Gm-Gg: ASbGncsr66xLN4P643eWe8STqK6KFAAoA59I2LliJ77XAIkVz36l393ohmeJkHLft+H
	sZK/mpI+AZM57WE3Ke0WHzFg+k2GRHPFDzAWbQ/17rZmdlzhF/R1meIVriHrZ8XCDKJGblTRMvu
	zqZfnfFZCo35rTqWVc8SI8dc50L9m0IBZWmv1VT0iWl0ierpiI93YW7dK8mehiLgpcnotR0UqVU
	W7vQyt7N7Wafq2ytRnzCtIMJHoovGfBrhMurv18dmOC8smN8lMaaYrWt+E/fNTi9KaUWRLcZeCE
	x9Pjg0Lw/Jjqyr1YH6fL7NzGa9a2f/Co+C6e7SynIr4jYRkiZ/y7VfopSPE=
X-Google-Smtp-Source: AGHT+IF9tApOtHa/eVZuK45pBA9WYfu0ZGkbzV+G11JP6nOVObxv/pxkKji13DPey3g2T7mpP51GsA==
X-Received: by 2002:a17:906:c113:b0:ab7:8930:5669 with SMTP id a640c23a62f3a-abc09a43488mr529740466b.18.1740165587254;
        Fri, 21 Feb 2025 11:19:47 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:46 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Date: Fri, 21 Feb 2025 14:19:04 -0500
Message-Id: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111949_345497_3DD20A24 
X-CRM114-Status: GOOD (  16.87  )
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

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

At the moment, we only want to apply a default, more relaxed
configuration, which is why the number of access controller cells
is 0.

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/


Laurentiu Mihalcea (5):
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 62 +++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |  3 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  9 +-
 drivers/bus/Kconfig                           |  6 ++
 drivers/bus/Makefile                          |  1 +
 drivers/bus/imx-aipstz.c                      | 92 +++++++++++++++++++
 6 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1


