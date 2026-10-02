Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A44BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=; b=nkSsgxJA7z6Xx568j8/TQADAK1
	uywFxw6e3p+wAdE3zbxXBzP3YTWYMzBD3uWh7CsO5TjqRDi880GdZGYZt0+/dB/3WpuYtLFAK9v+l
	m6y5vgRsvfPFKqfY3BOuLsjkY0P+giQpF4RXjxWJtRdR5dgEh3TCwsGd/KymktK1BMTfUDG6nSfrH
	MdmQkLNxXDTui+7RFuQeY1PGb8N5cLX9Fm0VOA0/dNKzvYNVzmI8yVO8e0TK+5Gu7/9ItVjJuCf6K
	sb599+DqYbhT8EX/cy0oJwgyZ9G7fSAPiS5G5BByQiApNUqbDqS2e8G0/sI2us0+XoQ1J4kPd8Yit
	1s9W8pRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY8R-0000000Av7f-0WKE;
	Fri, 02 Oct 2026 07:56:51 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY8O-0000000Av4p-1P1R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:56:49 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so16997525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927807; x=1791532607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=oCvWt+NiqDQN7yIaLDSHUauu5a7vhgUFTF7H81nt40GLP1Gr+G0lHbrON6v9r++nKI
         HruwZKi0Xn9UT5IziYz+P2rrk4HMMZFmq884id4Zs5s7x8EL40EW1VzK/AfBdio0KgrI
         lU1m7IWx95dYZ+Y4LAU+ZuRAq3iFnGkXOZz2blU0g9aoDarIdZ8shPPsng6svY0EzTkc
         yNYbexx8lhyaPBCrh2oXeU9tIq4xIKPAGAcmWywvFV14UFEb3H8gS5vyLwx0TsFJXlok
         q5ZFDJwy6Z9nifRF/2f0fBKjA/OADcHerNnpRZsBx99CiqlD8Fg9y6D7Yfp77wE9iDRV
         snDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927807; x=1791532607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=pcB0DJthzp2YgkazIBUZVjDy5eDFXvitK1yyJBuLzqwiak+nktoOLaNbMsxtrgAdQ0
         cwVeRFJdbdP5e8sHTuMuKiKWkkd2b6pBWWJ1WbZtiq7Hw4aG0b3wcnF+Dg9ObBVZulBE
         xgzboMrzaIIgJ89qgt6iatihaJ52XXmjBRjRfyK0vi8x/INoWx2bl3TWkzW/hns53eT6
         EsWtWzfdn9WZHtnJAfZGuooPOSkPmx2pdDXXs64cdfLVPQ/tkEJ5/A/FBDgRtI3fNFhZ
         2vo0wKe4D+igXfbbZ66qLw217vOTP0Bcsi2+FYb9MQluBcfUrtQYteZfdt2m8Rj5Bq2b
         JyfA==
X-Forwarded-Encrypted: i=1; AKwUvBztXuboMRWDgKWR2LWD36FYkbORkikkbdgthsfnQ/jn0Cd2htWju4PZcP0Ud6t86CX4J1zE9aRNUCzHaCXCRJr6@lists.infradead.org
X-Gm-Message-State: AFuF++nUAInTCBKpyvlwZeLtMoD8RMtX2w242mQNribdsCBGq8jookdF
	MEc8IrwGInLxFlszerQw+BmPQTDE1bffKMKv29/nKAAlbURDLpZ9yFU6
X-Gm-Gg: AYBFou0sS4uZJ/8VKopiSgIbAInNFljCZS/YLZVXItVpmZgwLnxp/MtO6CmzuaAL28U
	Y9CJU4S23Dks+7v/vUeWGQbHlh2K+t/PYNTHavSPsDsWdS5UkZCi4yKxxyoDngVcZ9EmqAm8gto
	WnnKWLBRQQnXNBg3/R91a2U/dZFXzV/ecu4cC9MGqCSpLJlOly7s+JcD23/rSE0K2zMAya4DDLk
	oBCrO58IJhonCnodoPqvk53uTIPevnhWEVBQP2TALKs9KL72hYDH/dB7zXOo7ZBViTFMhYAmvDA
	lF3f+qzRD+Y5IMeqWMzs2EAnx+J/mRRHf50PpqDKTR9I3k0Vc8+UK7jyV61ubuWcHMtDtLxRPuw
	qg+W5evNi6BAaZ4MldbbTeuEqYAQqjE0W5U4FVITT19ikxJ780+QsFa7MtLWcKXjAKZBTsT/KlE
	RkJG0YEwrbEV9mAF9kBDRHt9fLsdwC+zEQKjbJsy/tGxo9YVCZ/gFMb5QVWRLSNsq5pYUwCZIXG
	nPqYQJXHGKb0Ir7rgftCPyzlK9zx0hgiBkOEXMNI2YDSDgJN1ByC8ygfx//rjSaMMBEncmDwA==
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a027534bd7mr31406145e9.5.1790927806666;
        Fri, 02 Oct 2026 00:56:46 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:46 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:39 +0200
Subject: [PATCH 3/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-3-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_005648_578016_8F96E5A5 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c..c28d63293149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0


