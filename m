Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuY0GYLoz4Pl54AHbNMD46lqQfrjHQuItDMfVO0XptY=; b=J7mk6EtAYYMLSo9udMGGsGt9SF
	a/KESobuOtvrRxLKF6M9Zczh8WHQwduNkf/P+wkyoMpNNcnOeiSFB4nZDzydd2MWTxUt3+o3OQiR+
	lA+aV8UZl5B5YaqIeBP2m2PP73CC66qjJViFIxEr0BcWZMHo8VCTEYJLUZxpw0R73BCKn2/uwWbx6
	kwZHLEnqAZydnTy0CQyJb7ASgphm5hPIiBm7O15Wa0qCVX1zhFeQW5p+zHVOc2i6CuEyLp3bEq5el
	6wnCXHOSJIyOY05qYLIo/yHsErYTVI5snFgAoL8ZH+PBc08s32LWUZAQHKkZgRfKC3J3N3oi0Tnzn
	LGChbesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJu-0000000EahY-3Cyf;
	Mon, 29 Jun 2026 12:42:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJo-0000000Eaf3-2XTi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:42:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493b0fe95feso5173845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736951; x=1783341751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuY0GYLoz4Pl54AHbNMD46lqQfrjHQuItDMfVO0XptY=;
        b=nemaR1UDV+K0utdjggV7XoBI0nT2yiwYUpPdMTHrz0Q7AIEQZdb6YtWBAILq3rP9LR
         AoAto9WH5eXyGrUdXWpOWzcTsrzEy12UK7Cjbk3Hcj3llNEU3ePTmYsnBfdD6q54W86p
         hiaHy31pYcZEoGlbw10ErAIkCISRsfP4QcUr2NkY9PH4MToaNWjOjJsxjApjAXOiJgxC
         A7MR1xDoyzfsn05u1Rxwhz0qsAwQP8R0YNaffsaWY7/ly4+zlYueJVWpQ24vpYPhl5Lf
         NFonj3hwzBDv7D0ed/rW7FNRbx2V5rA4wzwyFFgusInhG0Nevo+7PgszO4RzP3h18x00
         8Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736951; x=1783341751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RuY0GYLoz4Pl54AHbNMD46lqQfrjHQuItDMfVO0XptY=;
        b=bn3vdGznrbjTZnFosENpOmflzNzhyw/57QlP6O13nPGm/lPluhItD/UECyU/5QVpj8
         UOoP41qjz8AjotUJyOG3bWI2F03mY7zEvgoDPGD2IJQiXsXLFuROt/1EK0PBqNnCW9lL
         ZJuQwKajrRkG13VnV9v/tMnwCy5XJVEAXfF8K+wtMFzLokRn4x8uHrmu8N3Mj9gz3lel
         MQjHBlAIKRwv6GAvMb3lvqNI5vspc2hC1mIPmRZSanztDPsFmhAhbNZ3Qx1I2kish2io
         BSQimHvSaye+kVu4NVyAARM0CRgfsZ5gGNglYrtVehaffpZRIJJwBZVsjv0WmjFGGrkH
         XJww==
X-Forwarded-Encrypted: i=1; AFNElJ9sAsscV1SjSIQ54HDpLCTPyFW9+hnHMlBO3N/DG7OrkE8T2loTGpNTGKq5TtIR97iabQ3hSJ9qk/bFJl8wYb/D@lists.infradead.org
X-Gm-Message-State: AOJu0YxEvVSGLAt3r33ussj7fhS71y3BX7n8rokk6OwHiXZ1mnT+gJPk
	JbrMuVsdvpeXDSb5yaAgkTlCI+QFuQ/o7uAu3XmgxGll/QO3ELX/pUOtHW+Bx9rR8GA=
X-Gm-Gg: AfdE7clI7eUPBxrM465xX35WDukTDRZG7l6ttz/hn9ralFDqu1kgPdZL2AF9aTlctMY
	8/rKmka6dwVkz4usSX3TjSiTlklXiV2mBTVjQDGzMR1lrR+x0vC7QTtqF/AyfjeyYz9OROdFRvq
	zTCLqZ7XuE07CeDjiJSJeI2r/3PiWVqgigdp97lCjQAY/4uc/ug1sRtMwCUrBfgKofOEmMAMG8l
	Eh94gyRAD5pKlWJTYS1B/KvWfolcLpaLCkaDYfZ5s4GwwGjNQFNziLHLj8FBL4mV8XvYFBICpez
	QTo72M7e8dpOdJVQ8jV4YiPzBhaihgUujJBbFT/IU+Dh/SpA9zcOCFRbqdn9L3zR4l+9lgUEvss
	IwKKTG/0QUs5mqVdOAD9GrkSdQjpbRx6BwY49sCxoRHCdLmXNPvELT+KoQLfTBMMYV6hgwXDP
X-Received: by 2002:a05:600c:1d86:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-49266885dc4mr249806255e9.27.1782736950484;
        Mon, 29 Jun 2026 05:42:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493adf3d98fsm80822085e9.8.2026.06.29.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:05 +0200
Subject: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VJAHuue9pm1FiRZUd8IJhSgHvJF2qQrN+3NPC5/4llk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgtW52pl9ymFcc6wjZ4sTtM/p/LNN9ZtDgRc
 WKlUartlpaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLQAKCRDm/A8cN/La
 hbtuD/9w9j2Osb71WII1hjlD5NY7YjH4OtroF8D36BpXiVm1yn4a+2So1WGl3c1Ng6kXeswAdqi
 Voc7emUXjLwvfHsTqWpaWdw7nYDMRwFYL0z8vQEVAPFqOWNOnqe2q84vAcN7lXe3H/0MR6Dipw4
 g0g0wS+fNOAkq47suPO8WtnqTcDxTCb1xQB5oXHSoioI2Wuy9HdnQDzKFd6UrvrHxq9CQAOtQJ7
 MMcdfmPkKBjxgCm7o0VOlJQfv4b1A66MTB+YyvJwwfzNM66Wl2iNYAK0UhaDFOakyIAMN4C1d2A
 /P1q/fSXLrE3bnpqILA0uwSphLEnN5RHT2zXBej3qW0ksFQDe+9aCDLB2Lw0Ylnu/nD+NGqZtIh
 XcMVHEJrtK/nEL+wBQwzZZ2ge+MajYiUNiki01R4uTA0degnUSWthT0cZX+Uf72BplztqN+YrzK
 ntskS7l4EhTj0lQ52MUTSv7tOptAZwGgpvuggGeUj1rSkh2OKdVAMNlCsOAC/ow6qrfq5sba6qY
 /70T8N708Ii+ljhUX8CDE49RJPF1KvZn1l1F3yMdmpEM5IZEVMcDEISSUcUNDBMz20QbEp49Ejq
 9xcudU3c6XaQn42dv4yVj9Ff1l3plINHqKVyShMj0fg+2j55Ft7u9mPtoRK3RLkDLruVp8Cl8Vx
 sJZ80FAnPrdMTiQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054232_663518_B84C680A 
X-CRM114-Status: GOOD (  11.47  )
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

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..197a6f67b180 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3


