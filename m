Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACACCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmM37TIebFwc91NhuXnorA0dNpqLiDvcznMp+hRuFu8=; b=CDr/GduCNI9EsM5UsKWdoI7dVG
	kzvXQzFqybH1ahb7v3KWMST3+vMMOXjJBP+LV8dFkvWoRhFPFJItKCBFqMsTMKIWvGzgQsdP1BgEG
	OIakH+l8agpt/UQmj/mTpotqWz71R0f0TfNonXsfMqmL7ZpM6Rwn+rgXCj8FNC79u5hEX1DqKH4fe
	8BjY7T7rnP10b4tJzt6KsMfNDSLVDBzYMtjfExougCoghdMNW98nkmAcInerSlYE8CCYIX4qE95hP
	3f8M0YQcr7hIiDrdNZvtfQ2MpuqTMmNJnPHg1Mk8zbuhTg7/LGmlxypFZqovwlTTATxscmqIoBIdN
	pW2ocOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYYq-00000002pGY-3j8E;
	Fri, 05 Sep 2025 15:41:12 +0000
Received: from haruka.juszkiewicz.com.pl ([185.243.53.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUDJ-00000001F3M-48w6;
	Fri, 05 Sep 2025 11:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=juszkiewicz.com.pl;
	s=mail; t=1757070160;
	bh=GDquDPQwE7myiK7wYOqpSjbnjrunWfiKQHBxJv7TDEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0ZU9oZw3bMvBmqIKXiHYHrJUEO+54FZXp8N1uujkk9hqW2PIKwEhsPxTLRMER/kz6
	 0Gmo0PZh3cSD4LccimY75W1FiYrGdjSt33z1MRtSLqgob9geTJLNHHNFjMAL/a+q/V
	 PdZCLH29Jl6o4jfTZjn/lFJtz1TQJ+CLImwZQIxMh9D0r0MY8liyYwX0LM+4rdWqaP
	 kaLTcsnuftOKqFhp0mzzrNO3+8E3nzIy6BnoadufFEx7lOfoSBVqA7i5itFzzC9BwH
	 sxb4SCGg8KnJMsEa6g137JbYNM7FqkqYWCIgxnwDOzaIc3T+d69om+T0l6U7bNaLPy
	 l+hzPxiBbRDFw==
Received: from utena.juszkiewicz.com.pl (utena.juszkiewicz.com.pl [158.101.208.177])
	by haruka.juszkiewicz.com.pl (Postfix) with ESMTPSA id 99A771FB80;
	Fri, 05 Sep 2025 13:02:40 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D3B845400;
	Fri,  5 Sep 2025 13:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juszkiewicz.com.pl;
	s=mail; t=1757070159; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bmM37TIebFwc91NhuXnorA0dNpqLiDvcznMp+hRuFu8=;
	b=jdd8BC/n1OesgTO6l/Axdof0r/fcOuuXchbuYEJZ6G8gLdq5lOl5JNxn4VFsSsKkxgkDLU
	6QWT/KGNCa4Zjf4jCmVzUX+J3zSwWL9bpar9VjRVhWifpHDfhIAMHJLLZdehDHhRrcvn9k
	hkMNeMKOarkADE8AXi23V8AcykB1YQsKWOgpwtOxpKrDxTyCmATsGpmsuRa+3PJY74Jt2V
	EgElnb1q152ttxn5nKHsQqwDAwlv/Eh8XzzyiICvAOPY+2LyQN0VYUdq/2kRuAGh79H4VH
	CgIeJ+lHoMCx9LFGVynJSePY++PykprfmM0GrHgK2sYrDweqYtzxFxWrctXbUg==
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Subject: [PATCH 1/1] arm64: dts: rockchip: enable HDMI Receiver on NanoPC T6
Date: Fri,  5 Sep 2025 13:02:30 +0200
Message-ID: <579370818ef3b70b57bc5b8846f3b330d091d9a4.1757068166.git.marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1757068166.git.marcin@juszkiewicz.com.pl>
References: <cover.1757068166.git.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_040242_179679_0E6DBD47 
X-CRM114-Status: UNSURE (   8.73  )
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

Let enable HDMI input port.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index e359d74f20885..6fe151d2cdb45 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -391,6 +391,17 @@ &hdmi1_sound {
 	status = "okay";
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -629,6 +640,12 @@ usr_led_pin: usr-led-pin {
 		};
 	};
 
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	headphone {
 		hp_det: hp-det {
 			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.51.0


