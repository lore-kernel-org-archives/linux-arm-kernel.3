Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E3DC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 21:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zg9L8LQRRNZLCjisnb/q9GCfoyH62wte+Jsk9lrCgGk=; b=A1Ewlm/TceO9PV9UbpDix/O1hv
	jw5LFH3WVAugeVt+JIzX+/7Yw0f+HjardjeV0LdQDqZXq3XLXK5AfUVpKBpEJlibCgNB9ye3ZFvOK
	1vJqm62GptInFvz4M62asvfcISKIdIuUsFNbwxr7GSirNTQqTr9lu53feUm9N+SzNtjEdmUZefHX6
	u5dLQfl7WJwkPbemva+y//zhl3h+32z+qXMnMsIbomzb3y7chPsP8B6j8Uhobwu3lm7QFc+Half4G
	YzKgDsRE0g9SUSN+aGWJOAJkziHoK9zB2wRXB3YnYAgj15ajtoTI0JtFPXgnNajjL6BVXl7vfpcSA
	Mq0D/TQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43qq-0000000ALve-2uxd;
	Tue, 08 Sep 2026 21:59:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43qp-0000000ALvI-0lNI;
	Tue, 08 Sep 2026 21:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 886E64402F;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38CB4C2BD01;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788904774;
	bh=eVriJrMeYp3XHPG8ed08fiWSUJ0t9VB3iX+On7WM94M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TwY+C3AdgCDls57rUa/PozYUtsrtfKnz5mZYzYMH8Hb3KpCoat0TROhM4+bRGi56A
	 tC+pLzvJDMiKHvaJYO3cy7LbAJ3caCL7rxDjiRHIlJsSCgs2vCdKsqgGEWkqZ42GgD
	 5TxUEf8PxsCa35dvqpmnwbilsdL2keKR+rghecGW4WF7bGg+o1XG1djCPE2/hAFSVd
	 WIXFh/xkFPwbzw2CMMk5eZ+B1gNOxIszqMCj7EYR21sSXtknea4Ox/tFtqSguqAk4t
	 07BmMYvK3t+joilbGtcfCnQaSmLEXoC7t9ekyj3cpoFLEnJ8JBuiGyUtx84sjVZsPh
	 VlqcD17f152hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251BAC79FAF;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Date: Tue, 08 Sep 2026 23:59:16 +0200
Subject: [PATCH v3 3/4] ARM: dts: mediatek: mt8127: Add watchdog support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mt8127-amazon-ford-basic-v3-3-fc46bf1b6cb2@mailbox.org>
References: <20260908-mt8127-amazon-ford-basic-v3-0-fc46bf1b6cb2@mailbox.org>
In-Reply-To: <20260908-mt8127-amazon-ford-basic-v3-0-fc46bf1b6cb2@mailbox.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, zkh1@proton.me, 
 Zakariya Hadrami <zkh@mailbox.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788904772; l=862;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=AX2u3pZcnaoS6OSYF7vpbl8cAzsMvrof+x8jgtKD7wE=;
 b=Opgq1eRNAB4cK7JQilkoPnwcoXZFYTGmYcBGlkjFC1OFvAMRP5q2EhPKrdxSrISHmf9msNqIX
 +e9tnhwKeAIBKXxb/aeZQFcTtOuzfWsroQR3pgkMPdnNC8tpBXyFjir
X-Developer-Key: i=zkh@mailbox.org; a=ed25519;
 pk=up24Xn4ScFKugfT4EJru/UQAS7JOIN+DSQqro+a05T4=
X-Endpoint-Received: by B4 Relay for zkh@mailbox.org/20260908 with
 auth_id=1015
X-Original-From: Zakariya Hadrami <zkh@mailbox.org>
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
Reply-To: zkh@mailbox.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh@mailbox.org>

Add watchdog node and disable it by default as it was not present
initially.

Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
---
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt8127.dtsi b/arch/arm/boot/dts/mediatek/mt8127.dtsi
index bd61ec7e70c0..3e23673e7a9e 100644
--- a/arch/arm/boot/dts/mediatek/mt8127.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8127.dtsi
@@ -99,6 +99,13 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8127-wdt","mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
+			status = "disabled";
+		};
+
 		timer: timer@10008000 {
 			compatible = "mediatek,mt8127-timer",
 					"mediatek,mt6577-timer";

-- 
2.54.0



