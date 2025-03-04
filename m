Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A018C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6BDfPh0O1Xw4+eoI5OG+FYUEnRuz8BZ8BPs7Zf9ilk=; b=3490KGfhkiGT2G0AAzO8PNc/tJ
	FmP9pBzgEjiECdTxCc5Ncrqyzj+OBonZRCZHUot4ueIdnIHg84W1SiqZtlwcm+Ra2/Seols30uQ87
	qFqfZmIuOsgQz+kb6VsYbO4+rxFKhGP7+nHdQE4PKdN0JwSp3Bc1p4q6UAksALBtlkMIv8QDb3s0j
	RbGkSs9fNKYjQPTlQYncRn9ymFfQmJiLbzkFN8uLEmQGInBzdCUkqhz0dar/Bnn8dD/6BwyOQ4Gwv
	6zFKy5QPoH9X54n2oT5iERX6RxuzQ1WqE5fJ1AUm0NR0PWK7FkF8TRh/zQtziWtMymQiC6Xlm7AmC
	OTsvwbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYil-00000006AmA-0dxi;
	Tue, 04 Mar 2025 20:18:31 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYhA-00000006AWD-2SWB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 20:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1741119409;
 bh=x6BDfPh0O1Xw4+eoI5OG+FYUEnRuz8BZ8BPs7Zf9ilk=;
 b=AxBwrcVt6/Go17UIOq9TMQDukY8ScLhMR6KqlqnTZnBC7j2XlD9QJCK2Nv99wXMDLETD7NN+T
 TnFsUatgya+acoGcyvWrLafe0nC4lcUSizq12x4KIqdz5lLMDLo5XntKNkgxBroIl7lnV0MdiyG
 TH8MI3q3RU67wuic4vxaqbADTx/VJEevGfE1izbmp6tXRopNVwJHbTR0PGduBjeHzNr04QfLGHi
 N806a7lji2X8npCmoAUpYWoiNmbwmWJRovq1Oa62TAcjYlMvGPOjZDMRUhA3sGv4epOC9khlfMj
 aslX3KOzBe4htNCdronzoNMUY2GMQC42duYpWTV1iKrA==
X-Forward-Email-ID: 67c75faf66a4509299dbdf39
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/4] rockchip: Add support for leds and buttons on Radxa E20C
Date: Tue,  4 Mar 2025 20:16:33 +0000
Message-ID: <20250304201642.831218-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_121652_714859_F7E6BFB0 
X-CRM114-Status: UNSURE (   8.95  )
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

The Radxa E20C has three GPIO leds, one SARADC maskrom button and one
GPIO user button.

This series add leds, gpio-keys and adc-keys nodes to board DT to
describe the leds and buttons found on Radxa E20C.

Changes in v2:
- Change gpio-leds node name to leds
- Drop patches already applied
- Merge saradc and gpio button series
- Reorder patches

Board schematics for Radxa E20C can be found at [1].

[1] https://dl.radxa.com/e/e20c/v1.10/radxa_e20c_v1100_schematic.pdf

Jonas Karlman (4):
  arm64: dts: rockchip: Add leds node to Radxa E20C
  arm64: dts: rockchip: Add user button to Radxa E20C
  arm64: dts: rockchip: Add SARADC node for RK3528
  arm64: dts: rockchip: Add maskrom button to Radxa E20C

 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 116 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |  13 ++
 2 files changed, 129 insertions(+)

-- 
2.48.1


