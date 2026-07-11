Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF670C44509
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tiROIViVkULix+8N5uu/OdfiKd0ir+RKoC0z/PkkN4=; b=amhaYjsmWnvksnHHVpKQ2FshZz
	998SAwdn4nGr9JNUA4muxLJ2iA9jeGUQEO82Ux+hB0O0gYCOL7N+Maq3TaWsSNfw1EhdWSHwpTXEU
	80B/msrArahzTldYMfhuEJpKEUJ/zy8iqqhDjRQEQ5Am3iCeWf3+85NQLVfJSmZ70/spQtsYKSo0+
	D29A9JAPi+Zy5YJ3v1dVNdctPUmzVtGL/qfOM+ipj8Odqo15AxdrZQDahwBhFYAzlApJgSJQiz+tJ
	goTcL/+4+5WB+9FBcXt5u+f8tYJcgpQjhnRWz1mEbRfXHcTbzozLR1L5SqyRA6MlLD0TYKy5PppgN
	Wq7yy0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnZ-00000006Eof-3fcJ;
	Sat, 11 Jul 2026 06:02:49 +0000
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnQ-00000006Eg7-3bqu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783749730; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BbY7B4vaCGiOVfo8vBc77M70XHz9IGfhm8sXY5E1C90pMni4bdample4iB0RflMbOQ
    6N5mxN+uU17fC264F9i5rUIcl4NxQitAhZ/nbGMGOUYYlO/f4KUkFmbMV6DhAT2ON+un
    fEbYvnn7wb/KmNm/zRJR1y2Vk1l6a60K8KEkNEBnOhvlT+alLanspRTXX5zm5ttGoTa+
    ndxjf15TA7kFt6+vqHryEI7QxrQDXpBf5JoKLylRuGQNXt6gq2xnVkv80MSJbAHgQZRL
    8wHOOInfVjy6asmkfEkuUfbyXlOg5VTr9vi3486XNN7eTcVNkodnXHg2NVOgcCJqUHwR
    mEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749730;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7tiROIViVkULix+8N5uu/OdfiKd0ir+RKoC0z/PkkN4=;
    b=EE+olW3dQrCKi/Uys+SgAPhw5TFHHdY3n86Ih1NClrouAeHXujJoM+ovhWvEY0ANUD
    /CoTuOsbxUMsDkUx3aIzBVzrdi80mpoSF+D+2/jRcUZU1lZRrZtYn0j1c51yve1AJ2iL
    wWANvZPe9psDVGA+Yll2M7GffGMOrgBpHcDWjTFqhgR0sgzxSu8tB3mgfv2cMOgS4xSx
    DKcNm4gRd17AyO7l8vrVnkdVoMoId0oPKPAtHIsqSGooL58dZHDABVKIT+rz2Cw5NCEX
    lpV0EUuWcg+qPzqlOswT6PjKpb4ntSuU+/x0sdALNFbqF5IVsQm6dVr9lcgQ0tkBGFKy
    0bAw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749730;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7tiROIViVkULix+8N5uu/OdfiKd0ir+RKoC0z/PkkN4=;
    b=W1Ae092nFtKFWlOFhN43fYdetRQnkPVHcs8uVXzvbgFa7i4ZlwpBsCIV/jIKOrrJ6i
    nlB6tApUSIka+/QVxypBmfIHoq6lYLULc+GUu8j0gvjkk+E/+kKlJIgJpelieLakNhod
    AkXrjs25JulRxPa2UXyDrXc9BXxvmSKYm3FTQEAQQwaMNxcC2S5yRPQ+v8KBsV/19uyM
    PiDsfzfzsLNVf5paWTSRMvv4anIzQNjRQlnd3ycJhD1bwCpu9t2MO/3bP4TOJH34pEeJ
    jxIAmCckXWiy/1tAGq4gyWE/zy3TnlfBLYAwn/IQQ4bQp543URQqIZPANZkP6k20ju/O
    2HFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749730;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7tiROIViVkULix+8N5uu/OdfiKd0ir+RKoC0z/PkkN4=;
    b=DtMnNYBNF/gsV5P1J0NnLK++ooZfquiYReodGVFhPEKpWaCNfZt1prtneK/uVV25m5
    wE/qOc48RXn1z4pziVDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B629Ghn
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:09 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Grond <grond66@riseup.net>,
	Stefan Leichter <sle85276@gmx.de>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andreas Kemnade <andreas@kemnade.info>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sen Wang <sen@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>
Cc: letux-kernel@openphoenux.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	kernel@pyra-handheld.com,
	mfd@lists.linux.dev
Subject: [PATCH 03/16] arm: dts: twl4030: add twl4030-regen child
Date: Sat, 11 Jul 2026 08:01:50 +0200
Message-ID: <ca467f11b708be8529de5e25b0863dce0d7edbb6.1783749722.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_230241_049937_84DE9BC1 
X-CRM114-Status: GOOD (  12.67  )
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

From: Grond <grond66@riseup.net>

This is needed on some boards (for example, the Pandora), where REGEN is
used to drive external regulators.

Signed-off-by: Grond <grond66@riseup.net>
---
 arch/arm/boot/dts/ti/omap/twl4030.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/twl4030.dtsi b/arch/arm/boot/dts/ti/omap/twl4030.dtsi
index 07b9ca942e78d..e6f80b8f0a731 100644
--- a/arch/arm/boot/dts/ti/omap/twl4030.dtsi
+++ b/arch/arm/boot/dts/ti/omap/twl4030.dtsi
@@ -112,6 +112,20 @@ vsim: regulator-vsim {
 		regulator-max-microvolt = <3000000>;
 	};
 
+	regen: regulator-regen {
+		compatible = "ti,twl4030-regen";
+		/*
+		 * Since REGEN is technically just a signal that actuates an
+		 * external regulator, we do not know what voltage it will
+		 * eventually have, or what it's on/off timing should be.
+		 * Therefore, disable it here; boards that use it can override
+		 * the status to "okay" once they have set the
+		 * regulator-{min,max}-microvolt and startup-delay-us
+		 * attributes.
+		 */
+		status = "disabled";
+	};
+
 	twl_gpio: gpio {
 		compatible = "ti,twl4030-gpio";
 		gpio-controller;
-- 
2.50.1 (Apple Git-155)


