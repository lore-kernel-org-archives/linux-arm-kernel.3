Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7EBE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 22:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dSqRXruRnW9537CEY2p6ANhMtJ7+0iEGxzk8oTHsYqU=; b=lCfZFIG4ghCol6Hhs4+LGs7p+h
	imBatPBAmUjFMcTdo5o9+hRW2RHDK1H90DcJdml5cTiMTb9AAcMcy7Vc1k63aZ5e9vf5mTet+0q9q
	VizNhH+Pzczg4N1uVMIdlb3VrfShcM8veXVRpOzvGHdp1203cbwCUgh/JgnbM+v63aIpvYWbQ9bqa
	BXff6wX13KJkdljVR4KixPxGpCztuB8OdXdOgs0FUbn6EyCkVnN3waZEMIVb5DyDyBLOVb7dT2bQC
	+hlC4ULIrGcdCWukrmlUu4sSdnFrsre8cjveX8aMvxM9kFdbIeXRUifkKbrOEPlKuE/cPiO0gEiwL
	XfrwmCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzZa-000000034uA-2XI9;
	Sun, 28 Dec 2025 22:49:14 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzZX-000000034tQ-2IjD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 22:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766962149; bh=AcoMQxufLzHPhOigRW/yZ7QR7x45qDKHskRtiKDydsY=;
	h=From:To:Cc:Subject:Date:From;
	b=bJhgtpgCmZcC9e7B7Jf7yIAf8t0hQ3MpJF9ltviaa6mIyr5qRAhc6OuTCidMN18bi
	 s1gc0/huaHzqWeUsxRr0itF6MPsfeYXlPma0rfsf2HHGYU++OEWDnzG5T43c1oTbkh
	 Dz22M4h2/SZKkoNBPmGbmwriPzaTQyntWS9lNaBzxrLH0vzeJ+rGt/U9B72oKubLQH
	 5HKKEX7KPlmOETdmbjDK2bVq8GsNnWML6iJL2u63MngA/OGfaD60nRA+GJG3nJ3j1/
	 lU0BuUraxeERLbY9CqkWgxbuf6Jx6XqQGu6X6lV2Ag8cXSIn/2Ix9eyO2R5309A+1D
	 N2DnZ0dEFiPIg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9D1AD3E90D7;
	Sun, 28 Dec 2025 22:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766962149; bh=AcoMQxufLzHPhOigRW/yZ7QR7x45qDKHskRtiKDydsY=;
	h=From:To:Cc:Subject:Date:From;
	b=bJhgtpgCmZcC9e7B7Jf7yIAf8t0hQ3MpJF9ltviaa6mIyr5qRAhc6OuTCidMN18bi
	 s1gc0/huaHzqWeUsxRr0itF6MPsfeYXlPma0rfsf2HHGYU++OEWDnzG5T43c1oTbkh
	 Dz22M4h2/SZKkoNBPmGbmwriPzaTQyntWS9lNaBzxrLH0vzeJ+rGt/U9B72oKubLQH
	 5HKKEX7KPlmOETdmbjDK2bVq8GsNnWML6iJL2u63MngA/OGfaD60nRA+GJG3nJ3j1/
	 lU0BuUraxeERLbY9CqkWgxbuf6Jx6XqQGu6X6lV2Ag8cXSIn/2Ix9eyO2R5309A+1D
	 N2DnZ0dEFiPIg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id EA4213DAF7E;
	Sun, 28 Dec 2025 22:49:08 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm: dts: lpc32xx: Set motor control PWM clock as required one
Date: Mon, 29 Dec 2025 00:49:05 +0200
Message-ID: <20251228224907.1729627-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251228_224909_663653_D4A1B68B 
X-CRM114-Status: UNSURE (   6.07  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_224909_663653_D4A1B68B 
X-CRM114-Status: UNSURE (   7.99  )
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

Motor Control PWM depends on its own supply clock, the clock gate control
is present in TIMCLK_CTRL1 register.

Vladimir Zapolskiy (2):
  dt-bindings: pwm: nxp,lpc32xx-pwm: Specify clocks property as mandatory
  arm: dts: lpc32xx: add clocks property to Motor Control PWM device tree node

 Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml | 4 ++++
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi                     | 1 +
 2 files changed, 5 insertions(+)

-- 
2.43.0


