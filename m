Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D11C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P0Q86oVQ46NQHKuW2S4ZLX3AYJvbuMfsPslyKj8yJSA=; b=i8zvxQWZ38XVPeAV6krYsLEL7S
	dFiFs1swA0XLFPKEdN0MhHhYYKRpxgqe5FhlmfUNSSZx6YL3InRhUG4S4UmXWzzu0DZRBqHzRxlVS
	AkpLJpJSX4rjJOXpozZWvP11DvC8OYk+QdqpEvtYCZCvno6/v9qTRr6J+lPipuncfKOCDmOxYqEOj
	z4eMTHoPX2tWvsHISQCMqfJ+fNocMDKOb2ac6g9ciFnaCqYWJReH9bneg4loZnzAdlEgqGQkF6R9c
	icSZMTlcRRjpCKYgaRmoHVjXr/++OuYo66H7IY2sKu0Bwi71+yZ0flVci/Tsx2kFoauNzfu/xafeX
	ISTH0pAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kIQ-00000006bmX-34z3;
	Tue, 15 Apr 2025 17:42:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jy2-00000006Xn2-1FqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:21:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-391342fc1f6so5022115f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737660; x=1745342460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0Q86oVQ46NQHKuW2S4ZLX3AYJvbuMfsPslyKj8yJSA=;
        b=ag9CEcSwAL3BBGa7AmTmgzYcVD4m1PNzXWcxQ3oNqfZ6jWTEbe67jz7e2RpkPP1pKO
         +r9fLzIvHw7LCkPSJtx1z7Q6YqdzU+eJPju3/97LBQT8E5zmU9fM27lu3gotUeJCELu8
         GEQGgmTK72oaPxZQ3zA0o4+Wd0nJGSXUJBDJRyt75AwrXugvCzPb1qEkNoS1hCMxNuJ/
         maXD2ft6H3EFnWGQzXYOOeZspAtdRYuxOcuRblnMatIHqTOgmX1vw5+6V1/d0+1dltci
         7H8hZBv6vpRio4Fm6ycLpFmDSH/KO9Mci2LnaHIAiydsnxbd37qvmJEj7hCrsddkd3ha
         6Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737660; x=1745342460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0Q86oVQ46NQHKuW2S4ZLX3AYJvbuMfsPslyKj8yJSA=;
        b=kYICYnQJ7D9KMLSJCQECN9sPxSSK5mN3QrGQ2O0c+X0HonoFlYQnqKduJGm5er+fhj
         DsdWJ/T6NRMhvJ/4/cjF2fQB4a2agDjAwEAHVZbSf8K1GJ1SgjflQiQjo39E3jzD3ZqR
         2+rpmqiq/dupM+IYJoxxgg2bV2X6JvcpIG/OVW8Qrv1D0UVPHoViXc1MtQZD9zdgvJa8
         b6/YwlqctHB7dzDw7B0Six2SKjVLSrplzXR3vX5EotKjL0/usaDgCOId0qONr1WZYvco
         Zlol5xR4J/SCobZgssASgp7Tsqoph7ZBxXw1JBBdXRrAGnjs9WLGu+KBF2QGl1aZNM1I
         2nGg==
X-Forwarded-Encrypted: i=1; AJvYcCUq1sJzA0YXo4rWISwvP5OSy/ruqYlaGMgO9WsPItSkkLEDh+0ZgW47nR3UXezReRf/9PCbM4SeGxyCA1RTuMXc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy947+oRyV9AYv3t4EVfYoWw38XRd61Y5Gy3SKp+dYP5hOu/LEO
	CMv8DbkpAYfm3PwvVaJDqlJdMUGbeD1SqMfc8HEUOiPuFrYvxeqr
X-Gm-Gg: ASbGncva35b/hjm36uS7wzhttZht1Qvs610r4jKdaVK9pIHyjuaSQANdfr8NCy0TN5Z
	TGEF7VTq6cfSP46uaGWUPe0KjQOy2NMrm9W5l77FxxKGbMbXvv/asTWpWmRBCL5MBuVSh50DcfO
	wwV34+V2rEQgTJcSoPtG93b/xKNP8imlbmeE0OrFfVsC2S2L5dGqrIbkcwrXi9+m6QucLGJJ/2z
	9wVaqtB3TejuZs4nIZR5Y+B4XjRyUVloYlKMrIPGxJv+gHOPrl6W4WN5pMqgW5JVCFZprHtR5ZO
	8yLnijE007aR51e4BcNMQFQMf2GbrXnNcsrKQo29x2aahfGLMgjcAX2b9xcA95IBBr3rC7k8C86
	V2k8=
X-Google-Smtp-Source: AGHT+IFveTd1X/FP8Y+9djpXDnJifllwkbUHPK6roLTIdhPqtEzLH3suojD3NXCb7qJOyhKvVVigCg==
X-Received: by 2002:a5d:5985:0:b0:39e:cbd2:986b with SMTP id ffacd0b85a97d-39ee2729edcmr254216f8f.7.1744737659862;
        Tue, 15 Apr 2025 10:20:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:20:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue, 15 Apr 2025 13:19:13 -0400
Message-Id: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102102_337352_2DA9748B 
X-CRM114-Status: GOOD (  24.87  )
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

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v6:
* drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
help with making the DTS more readable but if it makes it look worse
then there's no point in keeping it.
* use consumer ID as first AC cell and consumer type as the second cell.
Better to go with a format that more people are used to as long as it
still makes sense.
* pick up Rob's R-b
* link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurentiumihalcea111@gmail.com/

Changes in v5:
* merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
currently only used in the DTS so it can't be added as a binding.
* place 'ranges' property just after 'reg' in the binding DT example
as Frank suggested.
* use the  (1 << x) notation for the configuration bits. Previously,
hex values were used which didn't make it very clear that the
configuration options are bits.
* shorten the description of the bridge's AC cells.
* shorten the message of the commit introducing the bridge's binding.
* pick up some more R-b's on patches that remained untouched since V4.
* link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurentiumihalcea111@gmail.com/

Changes in v4:
* AIPS5 node now only contains a single memory region: that of the AC
(just like in V2). 'reg-names' property is dropped.
* AIPS5 node now uses 'ranges' property to restrict the size of the bus
(1:1 mapping)
* change the number of AC cells from 0 to 3
* add binding headers
* link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  dt-bindings: bus: document the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 7 files changed, 251 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1


