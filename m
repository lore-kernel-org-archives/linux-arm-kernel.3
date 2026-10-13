Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F2CC6B10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=; b=kDC9ej+jEYngurB+yoNb+s/KtM
	YlwgsOZmt+FuTu46KOr1ENSiO2L5NS4nC33yrR/vo4hc3bxwIbFl+kfIS3fsJhEqyVGBnaMNZ2Wmr
	q+4gqQ5bOaCpu3iU4lt6dv7/Fyh+KI98D8lV4zXSFJA4MWEanl4Idaz/mCedeERQtxwkXnHeV0MxP
	OHjgDYFwJuIQ7awpwHgLRpDrN0NT2awuuan++T/b5A+Kas6CpHjE8hdMXFGybguG5QL2X/EqSe6g9
	ZIjYibHhwDCC/u48YEe8rYZdvvA9HGC0nM8dwqpvQHWpQwmExo/9J1ZXBJBHuJ7Y34pDocxu8WV+g
	qSrYCrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc5C-0000000CstT-1qpr;
	Tue, 13 Oct 2026 12:58:18 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc4u-0000000Csng-0Mdj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:58:09 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so491032466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896278; x=1792501078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=;
        b=Buo4Q/npKHuCa8h0//K/RMt/Jp2vDLj0Ti7W3KZL5bJbqaacFHlpCncE8yD3aNFWAc
         kKXtR6xZUrW0PmTb4Ld2by6NeIE477yq47PQGWivbvFrf73f81dRWQItj7DlMsYjC0Vc
         wPKOmWbd2/58hvMeqNiK29SyYwoBtFLprW7r5CrlgiBiCeC0kQC4V9hE86cHNLNMD8Mo
         pnr9o3wAsjXQlbQoL2WPZbcliOVGG66nooLiuBAHcWctaSlrc+ss6zv/na86qFbOZQXa
         amJHHB52FYz5dkUUymG4Rw0L5TopaiFNCqciTKkeLIlC/QEXKXyWOxP6sYfJCm/A9vsO
         p8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896278; x=1792501078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=;
        b=F4EG7/zUUzJ0wAZ9qh58xmPbrGkHso9sPDdiCvbbIdTsyTxUuMrKoi7UxVFV87VEUI
         X9fRGeZE2BvQXIDe6qwffp1AtrQKn9xcWXXi5jnCvIpZ0PpE14h0MXX0GQ5jqryAV8/B
         m3Dz7kE6necCa6YRvmpWEoYYaj9QmIEXzqrvONtdUEL+nTUTBsgr5KfItCz8TbFu3UG7
         xdtL585fFEHBroZHBKX3PoPW+ZR5bVV9zQiJ9szuNbNPtXHEvY3OhX2cCwORX57pRozX
         Yj+fUiYOEr/bpNevAz7JFEXZN/1tgsSn0nZMpYBpOn12C643tUhR9ykYzFwqYqmBwiDB
         1uww==
X-Forwarded-Encrypted: i=1; AKwUvBzCQYx7x5YWAvsjw8+tmqi7CD8fiXUcF/L6of8J01TwS7VhspxNSQgmNUM83epqw6fa/gvunJOibFqm/iieeSTU@lists.infradead.org
X-Gm-Message-State: AFq9FYKxI8bTuoVQmhlvBKwRPjInWMyAon97egAbMG8pfPG0I20i+3zt
	MlHc/RWipE5+03HCY+KrqezHpag1AIDU6gdTPLMnlqqWLUKbrtc8yp1pPyYSnzxZF+0=
X-Gm-Gg: AYBFou15aO3poJkiR1E1Ivb9TOOU4KATICwv7+LAzaPKNMJI0dJAIkgh2g5TiZdGyt6
	1SRDrKOL7fzxMBjf0weIpKWEvugdcfR8PneVTO+2aLbz7Xy6pJzHUazCuAnq8KHabBL0DBVi6AP
	BIIgGc1JqDhoPBh/8IYu0OJ4YoKe60qZ31FU/yEpFVLv8+u68DTuEVOlJD0S8OTRX4BCElv0hS1
	ScVDnb5T+j90DD3OHi9oAlTDNp3fEY/TAyRn/i3XlF35WnmsX1/HeWLtDJvx8mMr7/2Av9dbo1Y
	Klot+bgDAkwbN6YCKyN2HDsHQBYwTWK4E05DF49G/JSSwgTSf0fc5RTQ9vVssp+Jt6/EQy+SFl4
	5tF5YIVsJff/Ek8+1WGF4t0nVq7QNKZF3Ik3wG4wvKRhB6uDgTxJQAyT8eBNI+154Iv7aUwodaF
	ZmjPKDmcfH8qFGLAYdfeAzhWbjkIEaj2yP5cp1qypMKqC9NStpyPmXKQPoRBfgBdfgNGi7RW48R
	Ow23vV08C3X4AAEvX8Oa9XdSmqhJBslgjsVgvL68Nnef1Ry3IP3fFDITXHeHPj8lBd734e+fyjC
	vMQx4N4ggM1ehfwIBwPbfMtRlNh4JTo=
X-Received: by 2002:a17:907:8692:b0:c2e:2720:8f68 with SMTP id a640c23a62f3a-c31aa01b41fmr1097966566b.46.1791896278346;
        Tue, 13 Oct 2026 05:57:58 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:57 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 6/6] arm64: dts: microchip: lan969x: add fan controller
Date: Tue, 13 Oct 2026 14:56:30 +0200
Message-ID: <20261013125735.1542349-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_055808_270517_C6634F50 
X-CRM114-Status: GOOD (  10.46  )
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

LAN969x provides a PWM fan output and tachometer input in the DEVCPU_GCB
target. Add the fan controller register region to the hardware-monitor
node and use the combined LAN969x hwmon compatible. Declare two PWM cells
for the period and standard polarity flags.

Board-specific fan configuration and pin routing remain in the individual
board device trees.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..cf98b35912245 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -523,9 +523,11 @@ sgpio_out: gpio@1 {
 		};
 
 		tmon: hwmon@e2020100 {
-			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
-			reg = <0xe2020100 0xc>;
+			compatible = "microchip,lan9691-hwmon", "microchip,sparx5-temp";
+			reg = <0xe2020100 0xc>, <0xe2010348 0xc>;
+			reg-names = "temp", "fan";
 			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
 			#thermal-sensor-cells = <0>;
 		};
 
-- 
2.56.0


