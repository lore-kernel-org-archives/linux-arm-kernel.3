Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE457C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=; b=vP+bainKEjMucEWn8HYn3sZVpD
	0UhLHYShN/knjO63rVRM+I7kha6uSIF34DOeEozvheofMvYb9Df6ZzZ9Z8ZaPjZZ0970ouYY0Bj95
	SZVT94Wd0FtIICBuiPqb4wvV1YrW3cIul9YDpjvVMuUOlEdAv4JktVskbIsrZDpeb4vd50CKVGAtP
	BASu45bMrg0D7IOC+AdYwTQPYls1HIKTIPaGLmdYnfefbk9X6zkH/K0x+Pv5LIwZKe1tiwpufV1Aq
	IE+6I2RE7FHu233YA0Yj2KlhH9MQrR+ZRz48LpKsyZ9eKJmmCGw+Nu+ydyvh9c70Pfr41v8Xj2rhN
	GiCcyn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXtX-00000004Har-3t54;
	Tue, 28 Jul 2026 02:50:15 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXsl-00000004HWq-1qUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:50:14 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-81ec29f1d07so40828157b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 19:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206966; x=1785811766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=;
        b=p4w0EBvhy/778jmOLXak/Ig92AuCYXnxpjp9Uj2HMQ9M0NNqNCkoazDEYi3I0I0+mj
         0emhAMfGXWXm2DDHO9oj2C+IUPv77ZoDa78Xzo0lkTGZcpwntnf3WhBXHryFWeZwoQFl
         2upzYjuK6Gwh/C4uXdxmo/UvEpySlm934O2a9ofg/tt8jPgVRYBhL5GDP/jXm0SNtWJt
         XeVDS+SrU/Ffe+NRzlRdajltv0g8bGXrYLE1C7MWU++pN/FxxAQJUHn9j+ndVBdvLVwh
         x1Rb4tRM1aGfYcD+CDum67+FXs9AiQEYiaT131vaEZIhO3Hvzbt16ssT4nGwVM33qTNd
         XsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206966; x=1785811766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=;
        b=fbNtMMUreRq5HkQUEXJ3ulA4bVWvDlIdHd9hCp2lqpTbyxGQ8ks8WFgiLPGRaamewQ
         0RwGHaXM8SQPRrRbW9L+fBNqDqQrgEk8P9yRGJZ+1TxE9dP70UOwLLfrje24ZbIM5617
         WrA/aypk8edGjfb/e8ZAlo33hVclkOwkVifbNxR1WnD5fWc5ncE+MS8xfb/wGkGi0MSr
         7hYndsKIbFppK9KHlqAPVQHY61/zy/f8d41RiXX7jCe/i54Gs046geftZrTHbhledqRK
         rE10+6pc9ncj56DNdlejxG4CglLgNjaskpCP04hFmjNAfSG4rna+Kaet6U68U1ILVoaM
         uhWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+FMNiTArepLY9H8E8Sjx/GHdeBZLuTYj77D13d9znDm3k+fyB0lua+rdkUfpbkv7iYfOVS6WkV8kwqzqthptS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9xZFBX+HVi2rXEABP5OCGQGz5WgxwWGaiO/1MkRVNCx1kLvNY
	s1+JXJ4wbLR51WSpPKOjbkvXJnHuJqCMf6uR277CXpaquYLRcuO1yLf2
X-Gm-Gg: AR+sD10EJ8zujRqPSsItAeYAg08PDtPJiSJsJ52yGkRoA4a0jIXkC+OTyc7t0SZexbP
	gZVQ2ZhzhxsWoz8Qm6HMyb/deLokWx6k/D293klRGLdCjqQO7Lfjka0NpKeoZu3msxQt7fBGeGr
	k0D1cPwSA71UK4ICywpOFDyoG5H3R1OrKxL8suaT8bTwEsUI2EBBnMaT4Wx68q6hR5TzRf8/04d
	joqtiLHZrgdN5fbEQOkj8iFJwo2TaqE2LBgt0bvK1h3IqaTQvSsc3tXxNWN5+++htgSJ2v5iu9z
	RhmcVOcUmDmtVF15RkB76dEZEnWYN7XwrkO3Mkd+HEpF+vODRaui7AhhnI9eLlQ06tHAHGa2MXF
	JYohnVr2kk981POK1VBIXcFY+nljeKULbN8XS475YPWcCDMIcEtB0kx6vjSvO23l6OzRuO1xIav
	T7emoqrWNwj7+FR3WTV36U03pcRA1ge2GaFVMh
X-Received: by 2002:a05:690c:9b0c:b0:81e:695b:585c with SMTP id 00721157ae682-81f990e2287mr1923257b3.4.1785206966382;
        Mon, 27 Jul 2026 19:49:26 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:25 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Mon, 27 Jul 2026 22:49:16 -0400
Message-ID: <20260728024916.993224-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_194927_483604_D5D9C059 
X-CRM114-Status: GOOD (  11.64  )
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

From: Andre Przywara <andre.przywara@arm.com>

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Enable the CIR receiver in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
[justin: move the PI8 pinmux node into the dtsi patch]
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:

v4:
    - move the PI8 pinmux node into the dtsi patch (Chen-Yu)
    - add my Signed-off-by (Chen-Yu, Andre)

 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..994f1e4f0ce7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;
-- 
2.54.0


