Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B8CC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1jWVery/jvPjaF54+b9Mmqq0RRFOnxJSGo1ftYeFQR4=; b=dnzKeEGLWX76g5okmaH3HJUAY2
	6kHyaDKzuBTQvM/jS0bg4FgyCqGjlPvJtm0QtzzKtcNzoE1Su6DA44uhzHS8ggsS9mTBubOmOzJU/
	thWTGrow/NSWfbNE9Zn0FrCZKvxXOSNmYZt4Z9QkYB5ul8l9ZYsb9wFVID46uYF/WuUVpRx5OoO5i
	ogJhT1g0cSTGOvnZsrH2uQij4eHf30AJ63KgEKEss1JUKH5+8nNQg6Gd7o/cCzVux56Me0NsuJMCw
	9rXW5lNcTkyVo9wbTg/r4VBycJqA56C3O9AxphDAaHSLB/g3OdFijbOBfDLC377CuaIJjP9G0dRJK
	SCYcXdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lC5-00000008jbD-2Ims;
	Wed, 16 Sep 2026 08:40:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lC3-00000008jaA-1xMu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 08:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1jWVery/jvPjaF54+b9Mmqq0RRFOnxJSGo1ftYeFQR4=; b=RlZIUs/mBiNcfX++nCjN5TL/Kb
	rodp9Eb5iStGOM7TeDsUDb+qU+PBwzN3udy1mo4UDoKTaHxskdrHobmRSSj0IEta9hFOo+n0Y0F7S
	W5kEUHZBSiA6lHCwZs5YewA/CzPOcbrJFI76bo/i1FQnLpseIDMrGSI4WDnFfkmBcY8yOsUNy3y7c
	BqKXCd7Qss9YbeuMqcDdqQ/wAKJhFdmrMRTUndyGljongjz05b2oBMmfaVptWX2gDW5L/Fx5+6zDv
	Kg94U0SUPXmO8bd4MkpS2MGT7JvfD4Ach2XdQ6LTYPnEbyHH3bESUjDWsRxee/HgOReFPYMJrdXT3
	WhSWQAZw==;
Received: from mail11.truemail.it ([217.194.8.81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6lBz-00000007dnx-1jjC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:40:38 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2DB851FEC6;
	Wed, 16 Sep 2026 10:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789548032;
	bh=1jWVery/jvPjaF54+b9Mmqq0RRFOnxJSGo1ftYeFQR4=; h=From:To:Subject;
	b=ZtgpSXN4Cd3Q0yxWwkqm/ZJ2E7QsWHxYCQYVaD0o4cf3wl8ddlH6trj7l/LYrIR92
	 OPtoZRFRaL0hV+su+2Bdgodn1ZwnkuhxdCsq1QYea4W+fYNxR+hbyYgo6nnqM+E+bR
	 OtHg8TNdruIqrNOR5Orit2IF4oMhaVuqPYyAYQBJyAhzSMSSut8x1h0usEvRlhGr8S
	 3txOvmepE2W4L/QwIJf6K9dCp9CCrFXCMA6JbQWfdV1EDYVp22N2CdrI3WhWCprChG
	 9MNaaUmmaNWNvcceYaxFAc8OJ2FrZISozgm44n04sSbcXsCZwwsjqcX4F+m1Av0IS/
	 8dbMyGYYuLfuA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
Date: Wed, 16 Sep 2026 10:40:21 +0200
Message-ID: <20260916084025.274229-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_094036_138823_F72BF8A9 
X-CRM114-Status: UNSURE (   6.88  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

gpio-line-names names the two Ivy digital inputs "DIG_1" and
"DIG_2", while the official Ivy Carrier Board datasheet (Section 2.10,
Table 12) names them DIGI_1 and DIGI_2, matching the
k3-am62-verdin-ivy.dtsi variant for the same carrier board pins.

GPIO line names are meant to be stable across the whole Verdin family
and its carrier boards, so userspace GPIO tooling that looks up a line
by name works the same regardless of which Verdin SoM is fitted on
Ivy.

Link: https://docs.toradex.com/116799-ivy_carrier_board_datasheet.pdf

Francesco Dolcini (2):
  arm64: dts: freescale: imx8mm-verdin-ivy: fix DIGI_1/DIGI_2
    gpio-line-names
  arm64: dts: freescale: imx8mp-verdin-ivy: fix DIGI_1/DIGI_2
    gpio-line-names

 arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.3


