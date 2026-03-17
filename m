Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48E1FD707D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=avvawqzpw98eGlOgQgfT3HyYcAovbaWbFswynfXll9E=; b=R8uZm4Lhk8lNjddXvGZQH9UwH0
	8VBBYquTKBPiTRgt4zy0Fl9P01nd7QZkJaT6WGwQtcxiIT3hFgRcS1vQt3echAQkYNtx2U4iRPM+h
	Pzl7i3G59FrDf1uY1hfFn07Z4Rp8cScA9dRMKjJVz1JFBEyt+SFPdnB5/atjhQQSnEaS/KCd3LOEJ
	T54vADT11z7AM7gBbXcPyD7gz/EqsagJq1+BmYqqcBaOR9OMEa9u7+yzOiQ0572nrWLzRbW9gSM5R
	xG+PHXHDWuhuTsLIGLe+W9aMkOdhznajmsr10XaMPRHjFp0uFULhVKka1LwyX/4yyVeEo1LLNwk2N
	GMmzztLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQP-000000066bf-3StA;
	Tue, 17 Mar 2026 11:17:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQP-000000066bG-1S16
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=avvawqzpw98eGlOgQgfT3HyYcAovbaWbFswynfXll9E=; b=LLatf7MyhXLt9M9TZlqDRUhW9w
	7qwRmVQi5E3/gQiIK77TwIAnlLQsWycUFvEicuQIxmaeicsV2q9CTU/biPhzR04c0DLoKkT3RSy63
	J67ojKg6E9Gr7eINAdiZtinCGWNllOz/nO2LZZwhgqmo1itXi2qRf/NrDpB9ThRnvvLNm02hmqLdn
	uj5BTXuUXHF8Nr5BmDupm0VG6N522I6pO+vMBle/9zg1M18Vp4a3Otuyygzfe3c8i+eZFqaUiONtN
	6RpQeUHocqgWOf19ji0lOcrjh6DvDsXxrVKdtkEMbGO0zWLPDyzx0Jo24iKk07oOLYIsiR4B1Fx7P
	0BspvO7g==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQL-00000008nwr-3VUJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=avvawqzpw98eGlOgQgfT3HyYcAovbaWbFswynfXll9E=; b=q1G5tA1HN7SUP59QF3c0RomN0+
	9UuDvzSVdYfhjzllYzitf+bi+v0ITmyDTlTFmtJJBVE6K9cMOwGGrUiJxkoTNgdC13gUB1cYp0aPj
	a1eVtPNK4EVFJInhhuG2BnFZOsKDKq+kd3l/zb26vpwjFv9cjfBtl36z3K3AdWYf0jar79SKCbDBk
	BQfGKxZ+Q1VjCn07wg6GsJa8tLMG6FMD0jHl9pOS8TdVPtYCV+LcYoTZbLU92mfB4Y5uwsr6ENfE2
	pFK1GjUzPILWylPnpu5VNydXcneEatDA7Vul1Sdmjzkh2OUoARbWWknr0M/9ylp2ulEGIS5iR4KWJ
	rDOmo5XA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2SQJ-000923-1i;
	Tue, 17 Mar 2026 12:17:19 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2SQI-000MCw-2H;
	Tue, 17 Mar 2026 12:17:19 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/3] TQMa93xx on MBa93xxLA-Mini support
Date: Tue, 17 Mar 2026 12:16:59 +0100
Message-ID: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_111722_050681_563B533C 
X-CRM114-Status: UNSURE (   9.64  )
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

Hi all,

this series adds support for TQMa93xxLA on MBa93xxLA-Mini [1],
a single board computer board in small form factor.
It has a reduced feature set compared to MBa93xxLA, with WiFi/Bluetooth and
WWAN applicaitons in mind.
An overlay for Ezurio WiFi module is added as well.

Best regards,
Alexander

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/mba93xxla-mini/

Martin Schmiedel (3):
  dt-bindings: arm: fsl: add MBa93xxLA-MINI
  arm64: dts: freescale: add initial device tree for
    TQMa93xx/MBa93xxLA-MINI
  arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT
    overlay

 .../devicetree/bindings/arm/fsl.yaml          |   3 +
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...3-tqma9352-mba93xxla-mini-ezurio-wlan.dtso |  35 +
 .../imx93-tqma9352-mba93xxla-mini.dts         | 637 ++++++++++++++++++
 4 files changed, 680 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts

-- 
2.43.0


