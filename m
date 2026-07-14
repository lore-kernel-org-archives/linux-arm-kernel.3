Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTge/ciZJdKDHlnmyMzI3+PdB3HvoR3fagJw2f8TPbs=; b=KxaVeGsrHhyliWXwlm7VJKAC7i
	aObsgj0tyTGRSjgmB2MnWrXp9XYtWq5amHjw4fDN2ps8ORN7iG5zej0tDsKHb49YZfambpo5Sm9Sd
	2NTL9IaV/Ws6nX6xRzqCgFHjavTlSUCeD6SPglpRmVWGTVJxlJFx42+46N/RFnxErkOXNoixuMgvb
	Q48+Uc5UhdXT5MLcTlLZ+RTWQ49ONsPD0Zfx7xPNTwr97kd7H2MyKSD0PPITlISnVMzdtfMPynqP6
	Tcqo9iHc72QJE3FCmemQjvep5FIshfrN3d7rd0CQQMEs1P42w7JqYnA0XQ1t/PPHp4Y98qGejnd3h
	wlEh3rDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjg5V-0000000Cerc-40Vl;
	Tue, 14 Jul 2026 16:34:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjg5U-0000000CerE-46fb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 16:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gTge/ciZJdKDHlnmyMzI3+PdB3HvoR3fagJw2f8TPbs=; b=aDhQfmSNL2XmveZnGcACdRG1Mb
	daKBXHzVgSeRxBg2pIj0XqbQ4a9PdK2wTFm8x90dWzUs+t/r297D3CLuoDKMtuTPVj8WX4KCZULTB
	k6xQaeu8q8nFhbgjzvMq9KhekWtraEL0Z9yiDEGfQHP5MQu265TbjOSHJHq/CkPG+FT+tZb8M7XiE
	tR7Y81C2ZKswu7yzgL6h9ZLoBonznqtfSgLuRyPkCrrPGg/w1+9QtrrACIq8QGOqI8RJtsPCzgppa
	nN+QqX3yFBPnNTwyUIihFc0muI3o9h9k1ZeH3GLm+weDM2nZqp8E5wiIiNuM3QsV09nX6nWfTDaHf
	rEsPAFAw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjg5R-0000000Cgxp-3vwW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:34:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47dec32798aso4629415f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784046864; x=1784651664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTge/ciZJdKDHlnmyMzI3+PdB3HvoR3fagJw2f8TPbs=;
        b=osUdZgamttzbUHSNSm153QDD3zfUSPwa76lothv5S2CgCVuFyhk6zxZl9vtA9V7Pgp
         vKw7uzvDGNT3/6Bs9lBKvsBE5+DpVGqps64yLlekp+95AGqXRdiv0mm/PqobuaiE5A3H
         KOJ1jjUfuS4Xh2Gp1nVP4HVNAAAG1x9OrzbCK1NdUSo0KU2wit2+mImgxnyU6N8ZeZdw
         cTDgihull09LPVzYQ6y8LvXI5ZsqQkdVuB1NGx42Gd7n6kYddK1iUyfZ7rwzURAHoyXb
         QQLVdlc84tjYj3KWDdVKJcu4uRZgCFtNMVGZoaYfo31oFSXAWjjVxcPNqo6mPOu8sqyY
         qW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046864; x=1784651664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTge/ciZJdKDHlnmyMzI3+PdB3HvoR3fagJw2f8TPbs=;
        b=fE8bXJLbNRP295HP0LGIfMnOwl5mJVXKBZnCvFOFKvUQAmAuiva3RP3VEUx4vGs0BQ
         CGD7LWMT4bddqXIHdF0pSZKuEp+7N22SC65w/Fl0z6AH1P9wxoJNvOInM6OO/knmStm9
         mZ/dWbdE+KjkoCwtj+7xGpdD4qGE/iLkH42TK5MNQ9oqSsJS9V/gOZVEPAyHQ2ZusytT
         HzO7r0jlCYXnNA6KZC2towANLRkVii2kdPuPtK5jKufBiuLD0la+Exq2t/4GW56sD63l
         /XVLPfJjXGzQN2Gwuam8u9n1SlG/R8s0O2gEa9MoTQOX7clvJ3Sr4BVReRygmfNKCcEY
         foVA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7dOPwbvlvew9L9i0r9/gkJ+wwa2wsYPPP9nt1eKBk3vghY0fQENnGCRdm2IqYxw6gYy4JdBa/yeSjCjiZt1CC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkezme8oL+q/LiqbtRe3jrs14y9+qZVYwGzTEcSs8R7GjAvhl9
	lwoZ70yUxTeE+OnYmrn9cV2hGWW3310cle6fwDOOxDEm2cn5j4cJDP65
X-Gm-Gg: AfdE7ckCJn4SNie8O+E1Mtfk390zPZFzPbqIapsiBTfsvp+tD5CYbvrnJpm4QlYzVyq
	nTNJHFEl7QEGhFzXFrgNPPZP5gvFfHuYuK/XS6O4REGfDBs43U2SVbzXuzEHUjHz5dCUh7MNFfe
	otFUYkxJrDNiPVFZcLTWhzY39218zqAg7w/75cIJ9563P9Pt/eghuf6VsP82zkcGQzO+eVbaStW
	01IX+8xFe49vn+V2HlByQSkBf3NOhwm2ljJwa4kB0xIkTcW2XLNWMkXC+g3XUQSX7gpOyULSGZK
	/tdEXbIjwYQGt/jCbJKWA/0BXzsVpkr+4uUdOcBdJAWfn1YveChW47Rk71IJIoluCw+1GU6QeK3
	bd2+CjUKF9lgfTrt4DtClfpZATjTyS6aUQeY8z4Zff8jMv2pNDqNS5ooGJpBZ6Z3pCQjEoLzD6L
	PFWGzX/qgLwc3ASuHnzz/uItLC/ncqApQK6MVLkCeEaW5trZ+wtecAqhcB0UIHLBkzsMHYZa6OM
	0PDq6Ugw7zns2eA3JtE9dh7NTqEg2AEfxy9
X-Received: by 2002:a05:6000:230c:b0:47d:fa32:c895 with SMTP id ffacd0b85a97d-47f488aca25mr3891903f8f.50.1784046863533;
        Tue, 14 Jul 2026 09:34:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm11213909f8f.18.2026.07.14.09.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:34:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Tue, 14 Jul 2026 18:33:50 +0200
Message-ID: <cover.1784046629.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_173426_039019_4BD6C171 
X-CRM114-Status: GOOD (  13.93  )
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

This patch series adds support for the Variscite DART-MX8M-MINI
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Fix CAN interrupt level
 - Remove unused ecspi pinctrl gpio

v1->v2:
 - Remove HDMI from commit message
 - Fixed eth regulator

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 516 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 558 ++++++++++++++++++
 4 files changed, 1081 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3


