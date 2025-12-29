Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A342DE92725
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxHop4R1vebN5o3R54WdbAjnNPlb5TuWMLmhTQJH8Ls=; b=yty9vlUnGHw+D+hrVOp5/nVx7d
	bfeP4PPkx2KZ+3xvVMBkolgBL5JCa8sm2IEquE6sP+UMP2dx/QZ20XaZkShtE7fgQARzdedI5zrsr
	LBILRQyzMMN/X328Y+e9lmBspu3jXBLRUqUVbfUk7kkVxOx1Uj6XtlJdzmVeWHKKgKdMOCUdXrw6J
	TWHlkx7Dqk8pU9qiXSZ7FGELuKV1PECD3105bKlWKKq0MkFwRnuJrOti+xh6rEIu20XMfaoxOWWBl
	beUugAA6OYIjDHZUCQ4ZMpVX1qfDyIh84QbEBzTkPZJNVRlcfMTE71eLb/VN5NNi1kypbslVc5eHv
	+dwp4jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEy-00000003Y0u-0N9Y;
	Mon, 29 Dec 2025 10:12:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEs-00000003Xv1-1pVp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:12:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so20021665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767003153; x=1767607953; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxHop4R1vebN5o3R54WdbAjnNPlb5TuWMLmhTQJH8Ls=;
        b=VVEdAol87R6IJTDLQ9YHXWY914oc5Yy21zNrJ00TSJKJuwsTND5hQsKEJtF77XBse6
         SUG73Q80jnw6rgqkSYhEFojox+CdYK3vC44Q2OCtKQA86+PJsa6Q4GdETNHpGLUSZlyO
         rz07fmHZ0DqcYwtYqa/xZivSkERkkpDDBl6nTRVtH37CzF6MGIlFhVkdTlH26YoxZvdP
         V/NYgHtITylwDn80L6MuHTvIICX+TjFE+sQLnKNGgOTN6z9rjIbsiTVWK16biHPf44xW
         4hv/xn+QAFa+QuUuKEvLbwutkHwHu5jnYUQOX6r8/SMN6HBJ0mkJrHT5Y+X12M2M9c2V
         pnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003153; x=1767607953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zxHop4R1vebN5o3R54WdbAjnNPlb5TuWMLmhTQJH8Ls=;
        b=u4FBrfhODZwOcIjSv0FwLcjE6A0PIQBvdI07T0rLxk+L8IEK54lcW9EX6+Dwgap/OT
         oLvgR1phyO30+ybMoBiFDfUpCTyLKHlsPpRFq0iWG3ZHudx4+6V/LaHSFmiuf3YxGDyQ
         d/DD14Dgk6HQnA/OfyR9KvT753VONiRPr8pncEu7ExrwcItcJtJMeb13FvObzXbfu4o4
         /jHxzF8TOf6CQ/2O7NLeBZK4qpQsleZs78uHIOAjatgcQVa1Js1/7x6xNEBIiTRhZg6u
         Z9ECDy+jtUN8bkmmu+I2sNtd263+qkWuinmt0xppdKIXcH765wMIq/Rlb7oD7m4wlLpt
         0DTA==
X-Forwarded-Encrypted: i=1; AJvYcCXg7JroYHw8+0AMHQA6yWvPCZXlghTJJJ3DjjVNAJcC7qnq3JGgewogYXUqllaNUnzPOMmeO85gfZjw0VRiZf0u@lists.infradead.org
X-Gm-Message-State: AOJu0YzY4402rANcRfNM+sP+/DlLPuuZjccbMnvp2C3mbB74PU7Apl4Z
	6dJc5rWw/Yi1sX4Xv6tcabF8qALeXNA3eknQz/3fiIloebiJr9S6rDZ7
X-Gm-Gg: AY/fxX4FGvKzWl52fGVyRhmuyOX8FVkRjZ4PKTfjZDK5XCzXniko2o8Spg2OtrGbaUS
	rmGvmBVzLic0d1okAz/cuKga76Nu37E3jTEBAPLzn+mfvDkoIBEDGTyqFTZDTpmKMdNP6+h4YRB
	rpAja+09b4jvzAv7p/lokLpJBKqMCOcw2+FKZ9ta8ed4ZAt8AYqcntfsKs8tXrkOcebqPRWAMrn
	wJA6qhbdCgE8/iqB3SbgtpAv61Fb7gLzxOg2+CsJkX9HfONpAEa7BI7kCriD2DnzDJaULb/910+
	A/1BZsnQr6aoQfvJ5O9fBbOPzoClMdeH87B5TFUtGRZIN+uD3a6XCU2HMG5soO31c7nZQTgXX9L
	NrOn++kqZbD4gFjGQdOuVa1AUBqiMgfvCvu0gWCkzIn5K1lmQ4qQBUVJXW0yVV0+NYfa5rUt5CW
	Z2O+4W7RNz9mmPkSikj1a26K1hLNjDxXL2jxUuvXoBtHvYloPVtGovtyGbrLCW
X-Google-Smtp-Source: AGHT+IFD9iy4PNySFr30nnCY8GO78DkRuBAO3uLhkHB4QfWW2O3r0sy+eyav6trMf24e38aJe/SHGw==
X-Received: by 2002:a05:600c:8107:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47d19594ce3mr335314215e9.22.1767003152529;
        Mon, 29 Dec 2025 02:12:32 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d583f42dasm19840735e9.6.2025.12.29.02.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:12:32 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 29 Dec 2025 14:12:02 +0400
Subject: [PATCH 5/7] arm64: dts: rockchip: Enable HDMI sound on Luckfox
 Core3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rk3576-sound-v1-5-2f59ef0d19b1@gmail.com>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
In-Reply-To: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=alchark@gmail.com;
 h=from:subject:message-id; bh=lEQTmzdRwAX++jXf/eD/FxjZqYX/Y19qCP3LEYW2Tk0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGhTAxH/ubXugjdmgt7yPZiIq62d//fbqW4+bynEVFN
 nTb0sOiHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEx19kFGhhNrRd/ONm/Lavvm2rpy1fGk03e/zZ+izHNdv+o5a1q2WQMjw9OaaMb
 JExeqsj1geWs/x/fu1ufKp264yixW1VsrojvFhBsA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021234_512107_AE93551E 
X-CRM114-Status: GOOD (  10.80  )
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

All RK3576 boards get their HDMI sound from SAI6, which is internally
connected to the HDMI codec. Enable this for Luckfox Core3576

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
index 9187012d6fa4..749f0a54b478 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
@@ -246,6 +246,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &hdptxphy {
 	status = "okay";
 };
@@ -691,6 +695,10 @@ &rng {
 	status = "okay";
 };
 
+&sai6 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8_s0>;
 	status = "okay";

-- 
2.51.2


