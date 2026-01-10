Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C08D277CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 01:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kwMSIGBB2bo7DuLLHA8/CRRtfRWSGasutT10cdx43lI=; b=J7FOlgz2IffTGfAGnmuVlPJ89I
	3Lxird2xsO+iH65XckVLHKO+nFy0qt/JjkC6MCFhtRoURXkkK2RMebHBqU4t75YHPb91BFuVD9Ai+
	H6agIwlUYS6iug/220S/dDA/qaE1ZCnx2x1OkYZCR7lFf0YFGYMEwKIr+EsR2I9R/HFoFPXqNffmC
	nLR8GAChCWlDyUk+TiXUQC9pwral1tl4fevfizRdUs1w/Xx0lEm0ijDsmKY37jdIqC7TL6ULojBXg
	4PIu85kmRiUxhFc/cDUmnD87z7Y7ImjySt2r3+8JZHbJjoFHYdcpBndPPPsnpOQAd2MBm+AdanlUK
	eQSyyiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veO32-00000003ARY-41SU;
	Sat, 10 Jan 2026 01:45:48 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veO2y-00000003AQS-2HmS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 01:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768009542; bh=XZ43TJVHj52vY2ZJ+jW/6bC5/GHKfvJv0Ek6S8x41Hs=;
	h=From:To:Cc:Subject:Date:From;
	b=KG+5i8DvOQFUBYK2ZSu5mxhzn8EBbRrXFrL8RbxIDvzu6QJP+AM4SJSW8msGw2Fi8
	 vGJ9kAbdW73Po+QImqrLmtK4HNFDXfGkv98co7ejLollLz+okjDXecEy32UVcWZ6bW
	 DGwYXG130pkUSa1Y0sQMz1V5x4lkEfoyG66DUNcI2OJKkY34uWpTb2mnfFM339DyRI
	 tHEX1Ga9gmmAHBPaXg/kwb1Of8ra9bJSyUXWXGXxh/t7xOEmESOap7X8s9b4S7F2rf
	 4GFB2e7amFmRsRQ1ZHRLWMu8cJD9dvBn/Bmy/afspe14GA71Kol+mluaeEcNoNf/l7
	 XzC5OhHJX8azA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 93BCF3EB7E6;
	Sat, 10 Jan 2026 01:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768009542; bh=XZ43TJVHj52vY2ZJ+jW/6bC5/GHKfvJv0Ek6S8x41Hs=;
	h=From:To:Cc:Subject:Date:From;
	b=KG+5i8DvOQFUBYK2ZSu5mxhzn8EBbRrXFrL8RbxIDvzu6QJP+AM4SJSW8msGw2Fi8
	 vGJ9kAbdW73Po+QImqrLmtK4HNFDXfGkv98co7ejLollLz+okjDXecEy32UVcWZ6bW
	 DGwYXG130pkUSa1Y0sQMz1V5x4lkEfoyG66DUNcI2OJKkY34uWpTb2mnfFM339DyRI
	 tHEX1Ga9gmmAHBPaXg/kwb1Of8ra9bJSyUXWXGXxh/t7xOEmESOap7X8s9b4S7F2rf
	 4GFB2e7amFmRsRQ1ZHRLWMu8cJD9dvBn/Bmy/afspe14GA71Kol+mluaeEcNoNf/l7
	 XzC5OhHJX8azA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id E53A23EB2D5;
	Sat, 10 Jan 2026 01:45:41 +0000 (UTC)
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
Subject: [PATCH 0/2] arm: dts: lpc32xx: Add Motor Control PWM interrupt
Date: Sat, 10 Jan 2026 03:45:22 +0200
Message-ID: <20260110014524.3379187-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260110_014542_630072_86AC6243 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_014542_630072_86AC6243 
X-CRM114-Status: UNSURE (   9.52  )
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

NXP LPC32xx Motor Control PWM has an interrupt line, which may be used to
report events from programmable counters e.g. timer counter limit (period),
match counter (pulse-width), or from counters on input lines of PWM channels.

The platform dtsi change is based on top of the next one:
* https://lore.kernel.org/linux-pwm/20251228224907.1729627-1-vz@mleia.com/

Vladimir Zapolskiy (2):
  dt-bindings: pwm: nxp,lpc32xx-pwm: Add optional Motor Control PWM interrupt
  arm: dts: lpc32xx: add interrupts property to Motor Control PWM

 .../devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml       | 10 ++++++++++
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi                 |  1 +
 2 files changed, 11 insertions(+)

-- 
2.43.0

