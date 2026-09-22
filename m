Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D703BC98306
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sSFIDyEBXWq4SCc8zo/QNh6HqGLSDKyG+17t+RiabUE=; b=IddAdrYm492iXZsEJ+CR9suUaJ
	S5JfeooaKDBgozUkaZakdFl8ch7scV4sBOEA56xSgG+ZGb3R1ukNA5EUVRlfG5CiDq8XAnd9y3xbj
	X+EQxVVocZrofutUEeNPYQANIjd96PRpDu3df80sEcfgwPrAjo8ySOQ0wos17s92y3H/3pVrwJFUT
	XmJgKXkhM05QJ7js/t6CpO9pHX8RAbUzywlQ9pxljM0HzRo5z6zathlz8a7NqjDlssJ+3C1BGliX8
	Zkbs00XYjXWJzaOk0TBUspof8o+eEP/XDFoX1DsJ/N9LnDJggrEI2gcGI5mWzF7QKE973OSJXvlY2
	8/d9rziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zkR-00000005K8E-1oad;
	Tue, 22 Sep 2026 12:37:23 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zkO-00000005K7X-4Blr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:37:22 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so762444a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080639; x=1790685439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSFIDyEBXWq4SCc8zo/QNh6HqGLSDKyG+17t+RiabUE=;
        b=pwx1hex8jbPzGBGHfDhDPOO1KYuAt1J6Q2aqDdb4npKUBE2/nCx8ZkqGSrMczWJAlM
         BwpWCfd2z8kIToNcWE/8cMLQbAUccYA3zzA4D1pR6Wb6uikrrvAa7Mgv5kFFhehNwd0I
         bJeWyh/gGca8ROELe+VmGCiXBWBlu2EOVQEJQImar4jTIhcUjv1lFR/JjKCWfXroHmg+
         nFzP4ft6Zv6A89q9tk/aXWW0mNeAQkCcgUebYpNn4V7Vj25idb1ziUrqX5RU5E29sIEj
         rvaoiZYYBOScFCT86ktukEDimF29ft9h07dCMCzMPCBzj6Vho79Oe8kzuJfQ82sCXP1n
         xK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080639; x=1790685439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSFIDyEBXWq4SCc8zo/QNh6HqGLSDKyG+17t+RiabUE=;
        b=m8Oxk9ZPRqmD4pb2EZCkF6LfO/sHHYKFRe2QHFCiN/YyVkZQXuGRcXGUsmUrvR+VN9
         Osjb0iVZVpcvBocnf1nt5FDGFW2zJnRe6XT+8frhlVIickJ2GNmXONeMiWZJuJRJxlM/
         ErkrnczvzfXEn6D0hVDTTaWv91q7osB/okYcI/vZU3xf2GkbsO7sxqnG+6QxMCoMiYvh
         Y6YeUvnRX0fzRITfxjZdCKWmhOuP5cmHypWwHTXDNkXKv4s9LxDWaLhIry7t0DPB6tlB
         qmftzU1hvkXLTXK38yySCDkl7IPw9JzaGGHwsN0LDKQlNj3OoND5MyG+FUadLa0oOK2V
         T7QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu1hzOu1dtfZTEDrYnzBUmJJlioORaGGxBGFTttxAGu+qHqAqfoWtBKNB6PdaNciNhZfbLpoiaXGrynovwIcT3@lists.infradead.org
X-Gm-Message-State: AFuF++kPV71WGnzp7OS6TR7Go74BwPcrzgGLKm+VR7XSfABWTmYrSa7p
	stGLqsTXzgoLZxKuS3h3T60RExb1hmnWq9jyrL3F9eJL1vNAlbmLeXKg
X-Gm-Gg: AYBFou06TihOUwd8rOygT9cnlySd2TY6cpsqGs3r+iRABrOQyLTXGXOic3IMf+3Ys5R
	JzzinniMOWSq/cZzJNwoj2jhDbMUwy0H7uoXceR2j330O8W8et2uCicScVGkcUg9BJUuNfk/CSu
	WcsfAQtkuzh9wU40abif8clfX07np+JRnNc5quZiCL4BHQFui/sPjCPJz4ur82JtsOx6SVo6mh5
	HTn1wJckGYNBFpBhjjvAXewY4QW9mzI6sl73nm37J6dwuXL5GGrHn/5STjU1ss0K58WkyeTkt67
	1endr8kR5WGZwQbmInppE3R+5L74G9g4jWpo26IV+wohLqVC+p7oZHh5U3tlJlZslDgQrz9ukWY
	6J2yu8mJ1/IQfkjLCx7WS3I/SYoJcCfHZ6rV29wakriZhOYa1njROkne8X+zi6eZu4VlHv0x+JT
	hduqGxNLtYmPRJUOFbgt1ctq+F4uwWjUhvUj+xbJoxuCegi9+g2OJjyHqkI89vqIw5XbsOUfSTB
	U9teYLBHtSbMv37Q7IStnZSw34=
X-Received: by 2002:a05:6a21:7e01:b0:3db:280:b0f with SMTP id adf61e73a8af0-3ddec65f674mr701021637.14.1790080639455;
        Tue, 22 Sep 2026 05:37:19 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:18 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
Date: Tue, 22 Sep 2026 18:04:58 +0530
Message-ID: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_053721_040827_9774E6CD 
X-CRM114-Status: GOOD (  10.67  )
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

Add support for the ASRock Rack B650D4U BMC, based on the ASPEED AST2600 SoC.

The series adds the board compatible string and describes the BMC memory, SPI NOR flash layout, UART console, GPIO line names, graphics reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F Ethernet PHY.

MAC0 obtains its MAC address from the EEPROM on I2C7 and uses RGMII-ID mode.

Changes in v7:

* Correct the GPIOP bank line names for the reset, power and NMI button/control signals according to the confirmed board mapping.
* Remove the obsolete GPIOF5 reset-button line name.
* Leave the binding patch unchanged.

The B650D4U DTB builds successfully using aspeed_g5_defconfig.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3


