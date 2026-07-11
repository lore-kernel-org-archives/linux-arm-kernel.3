Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF32FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZB4drwZeCzFntaUbA8UcFyakx9+hGBaPBgbS+EjwmC4=; b=Sxfnduh4dCxtijCSFOcJm5E9Ci
	zvFaq1ApZDJ4Q4C6bbHmxEA5LROhrOBVI7WijfNfQXtJpC06BCGSE5VmMwIBMvDf6/5PA3Rq1h4pj
	4gK0na6CkQ1t48MzT0KOOEq09BFvmnEq599fUmwel/oXFPq39WkIeXgPZ+G1I12tI7URVupdAKxfX
	MmBADNQ1aFNbRfHyQikY1bUTR9F+hLv2d0U8HQ+02XquNuyQ5gTqzMBSFEdGqwji1jiTsPzbdvxXH
	8EPzZljuq2yAoEDDkqWfK3JlFIHamZNkTt7Yp+hMM1Fb+sN70BfP4HLSTI+Egqlcy5apJXypMyCmT
	oOQyfysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnS-00000006EjF-32xI;
	Sat, 11 Jul 2026 06:02:42 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnP-00000006Eg6-2FEH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:02:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783749732; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AxOWz8SVP1S6FOK1V10S8ZhkMMYVS2OCMbs43ygVVAZ8CKNTz01G+E3cIfvQLEayR6
    jqyYAvoq2G+wAzR3Y9G2O6B3vpvqzN7aWO5PeobQF/x4Qg/4UqngcKGHDZz1iAUWQSZK
    2FKFXSduwAjPkkH3efcWc3DC7W4DUiCw4vDoHTrplsQJQQ0s9hBhwZj5kD70BtXIx4yX
    8LI631cCp4Y9We/AlbQATRmQJBg2lgpwj/v/ZfPUjiuKZzSJSZWkW+B7GHZXDD5jw2Od
    IsV5QOIecP+lMoIdQQkgriOw7q9E/5T9Gn+VJnSwrq0RuTfzc4di9SiGICN0dz32q2z4
    f55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749732;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZB4drwZeCzFntaUbA8UcFyakx9+hGBaPBgbS+EjwmC4=;
    b=l4WFSASvq/2zX/sPgvqRYr3ZmbRO0tbYaWlwn3hAPdh5QAMzl5Bip0rZ6L/TFNBp0l
    TaUCmVp7x5ZGPbWZ0rYDrNP15p8CE8CplFPplOb6GZ3UzvCAGit4ib3smILsxNtRdH6c
    3vT/P2UFJqj3MjHisc/o3b1qmT+GjhTzHONnYELCNQrTh3Jh0d3UBM0wKFy7ZSYn5cdi
    eY4b+2WFoYQDlV8ug/6EagyXBB5GbUET+T0lsB/3PluXtEYIfhu8ES1f7a5uRFq8JiW/
    R+o2At4b65nilUOCHtC+NyPD5b3GmnbMtLPXMuGTyVIRU4xwb70gpa0i7Bc0Pjlyt4OI
    ybzQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749732;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZB4drwZeCzFntaUbA8UcFyakx9+hGBaPBgbS+EjwmC4=;
    b=ODAdJdCE+yCfnSBSmGovKKmGSNhHP8ROyYNBa7qHxAeLe4Ooqbr6zwQ7rK7ATdSRks
    MWFBNA53+Jmcv190NNht1gEYaUcx1W95J3OKKfagSGVyu8bNwkgJLLLjNGEZxZWFB70g
    Uo+GUi1We4MHyZB4s143zxxkm2bd7gtoMEdiqtVSpfRx8LIhKNrs3RUqdPJ4X5eUzRrR
    65BeDX1BHjfgpPU3LXI8va8kFDUcSEMbKK3gp2PnhXTBvnDO34J8zDKqMSVu3WSrm66K
    FNQRj9XTqM2cKPvZ/hNLKbCGTB16GfwLT8Vin6pbrGXxXRFy+jf3OjuLpKWsKkY1Czdy
    JJ2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749732;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZB4drwZeCzFntaUbA8UcFyakx9+hGBaPBgbS+EjwmC4=;
    b=WlvwVONf4WYr92wgA8G3MKGSSueqLjRrbW6fKtwcUtkCLnHy0dflC3i5XWSwwIh9MT
    onJo+t8VZVmM0oApg7Bw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B62AGhp
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:10 +0200 (CEST)
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
Subject: [PATCH 04/16] arm: dts: omap3pandora: Populate DT data for the TWL4030's REGEN regulator
Date: Sat, 11 Jul 2026 08:01:51 +0200
Message-ID: <d0b2a73c7c208f33784eae4219ff3981800ae6f9.1783749722.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_230239_837294_F537B98E 
X-CRM114-Status: GOOD (  13.66  )
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

On the Pandora, REGEN is used to enable TPS61029DRC external regulator
which runs a 5V power rail. The 5ms startup delay is taken from Pandora's
3.2 kernel, where it is labeled as a "guess". So it may be possible to
activate the regulator faster.

On Pandora CC units, this regulator is used as the input to the LCD power
supply. Therefore, problems are likely to arise if the regulator is ever
disabled, so we add the regulator-always-on property to compensate.

Signed-off-by: Grond <grond66@riseup.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index 06c5b23589991..a0116823ffdef 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -486,6 +486,14 @@ &vsim {
 	regulator-always-on;
 };
 
+&regen {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+	startup-delay-us = <5000>;
+	regulator-always-on;
+	status = "okay";
+};
+
 &i2c2 {
 	clock-frequency = <100000>;
 	/* no clients so we should disable clock */
-- 
2.50.1 (Apple Git-155)


