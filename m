Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE83E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 19:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KOnKLDsqb4xiEOhltwQDh4HgtA1cKvX5nht3wAdDSxY=; b=sJ5Og7w05u3L+NzctJYZ72eVsY
	3Z1ZCNA54HmyNDCVEJdZRdN5vBa+9Jyu8YTwU8vMzJqQqa10nknxjl7YV5/ju2m7PrGKK6VYTxEMN
	zSPGn54tk8xqwp6H95k1gAiFrLfSkvDDxwPIC1deGa0ES7HlfqlBi3Mzs3a0KPqqhfnZCWC6YkLOa
	IGVOCmQoKl3dDe2agcmfExdj4uOpFoPyZ5t2o1sCobpN+ydch6gllD5K5pEdMun9qc73OsCLQyPyq
	WTgnbimlb2J24rWQpGk2uyw8DuWryla1OLlOKq+1dX+5DrlErR6pmk2xIvGDeX+rrEKOnqXAmnqQI
	oU0na+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQX3k-0000000EEhZ-1qjV;
	Wed, 25 Dec 2024 19:28:44 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQX2V-0000000EETL-16jC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 19:27:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735154842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KOnKLDsqb4xiEOhltwQDh4HgtA1cKvX5nht3wAdDSxY=;
	b=AR95h++w7RE76dw9MHkXuquH0j3GJ05notgIN80CpNosyE+oNzkdRcQXGgjz2tg9gzr09x
	Nc3dZdr21batB9XBUJyRXolEpJCpNu5396rdiy9ZITHe5GAWlAmjV582r4kJlix0EVJsYR
	lBAAn7btvwu10n9+jW71Hq/WxOl7eL9+JpLtXQ3FaCkx3aEIo7viF4vOS0B2Byy53Mg4oT
	XCWTE1pnHAvMwQ6tnbnR+b2IQbhWhcTRR4dvQVeuvVr/6h1PKR0VlP4qqGkyJRp00lYjKR
	sPcgoKuQRYlSBMCpYXJ2Hue/aXd8EUGNNhtUGQeSYcM2D2VI58n9R6Ti6t2W2g==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
Date: Wed, 25 Dec 2024 16:26:18 -0300
Message-ID: <20241225192631.25017-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_112727_584800_6C17A0B0 
X-CRM114-Status: UNSURE (   9.02  )
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

The mt8516 patch was previously sent in another series but rejected due
to not using an mt8516 specific compatible - which the other usages
of this driver (mt8183 and mt8365) weren't doing either.

It's only fair to add the SoC-specific compatibles to all of them then :)

Val Packett (3):
  dt-bindings: mediatek,mt6779-keypad: add more compatibles
  arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
  arm64: dts: mediatek: mt8516: add keypad node

 .../bindings/input/mediatek,mt6779-keypad.yaml        |  3 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  3 ++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi              |  3 ++-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi              | 11 +++++++++++
 4 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.47.1


