Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA10FCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=; b=RSb5mj6BFbWNgAvi2BDYoRFPb6
	iWvh8EdBO0K90UpB6EEZ5LaRFaHwUNhDf8PNCiSIxEyataesGvKJ4vVoWCm7QEgFcVUsgZSC8Q0Ni
	z24etJ3p8pT11bNQ0OrqoXYECkJqff6Mt0106mNmWULBgNwXyOV7OUXKgbIBwnq9QfBDZPtLOcWis
	8wo9Y7b+/UCnXGTfHg/GamETHQAWO0gdaCLKxVv+8i/6phb1rE3jFUs5Ma+eaeCinl52AdeY+0HWj
	JVYTHTJi5vkRolz+68jy39eA5CR1zqioIEDXFE0MIEvKwjOZGLZfGHJWKc43jsLbeaYrtvyyJPjoS
	f6UIhgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFH3-00000005Y7W-3Jkl;
	Mon, 15 Sep 2025 19:54:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFGy-00000005Y2Z-0HD2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:54:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45decc9e83eso50526335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 12:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966038; x=1758570838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=AnqmHh/P38qynmeADZsT40PMfT398RQ8gTpjfqMuFhshJhbXf2RKrifDAiNgHqSCbf
         3rkGYmvbeN6CZl+HICne3me46DgW2EU4KhrS+k6IL4q9MtjQDUmuRFAyFo+2lbjxhpS7
         MFRPOEAkjN4HwslDew27vwCa4QkkoMUUA6X8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966038; x=1758570838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=Ircax0YnV+YZj5COgaKPqgGiNnp5I5EnUm88vlOu/5bMZxSp6Y+Q6b6MNSVKY0vS0D
         usG/zMV4zX+Vj+8sY1oMc61JTnKmc/kZs/zxQvpXMAcL81tyvfUELhUxOyETJ1IO1V0P
         6dSMCft7tkF2xpyK3cIBrx/lHd+NBtVWNxxCMsylpt388hGOg0LApI9xr4gZZUj7jmii
         8d66Q6DjakEpjm6h3q96C/RJrNquAPJIRF7GTmlKYbw1eG2JIcIgZ38ROC4YZiwXeKDj
         aUswPjYW5OB0IFMl+ggCdhCxBhIn8FqS6ATCUiXBYXYomrJX4IUqehz4GOdrWI8Pqb1I
         jU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsOoXE2ODzhhq+jrpTCderTZvKtTs+3SzYEBRKBK26Bxj9NxtHW/vbhq5ufoFZOp7P3iXA2w1lq2ykd8V+zFM9@lists.infradead.org
X-Gm-Message-State: AOJu0Yymd3rHXiPPQOAiWwWQ24dl5KbqkD/9v+Y2A2R4LAloxlsgEKub
	C8gFjDMr+JJbNgQrHJ8KdPFTuLNZ1/4UCziHTxFLt+0jYRgHHJJFb8CI5TmUgPuuF9s=
X-Gm-Gg: ASbGncumfQyUDsIcQdOzFa9VJnIft/gc1iDxiEXNlRMmyItthWymglac6BO5Klig7Xk
	kNam6Zd21VZjV0MWujhKN3WD6uxZICW2iqbF/cQ9CJfkFqfFMaW425qEVFZEUPRP2FCiHQj6Hsh
	X0nrhmY2yjtz1sK6B9Td9e1qsRnL1+9V/hD8LvreGl6qX2FvabWoYtlEkC9hANK6PG3yhS53W0T
	sRozlvNP0830UM0IclMmJQYV0mMnnBTeJkIM1AxpAyv3o9ttmGLBa6V+2PW4GI4sSzp1Nwj/o3f
	+IW1fvl5QYiu14TeENy+EtQUDGcMwhkDVFX2aze1jThzVLXM6IF9nB5swgpAWYTimxi9iXnD0+I
	5fozFYiSr+NSia7bO1rth7Ey5gzhUqkrKH/DiuhXKKyhjopre6hJ8ngTf+H96nehJt0dT3dUw8Q
	==
X-Google-Smtp-Source: AGHT+IFndz1AmdXVeKfJS9fz0y2h9S+/Rc1JyiVoAbeqVDR+ayQsA7o4g+R8GMH0hF64MGhaZdupYg==
X-Received: by 2002:a05:600c:6a06:b0:45b:8f5e:529a with SMTP id 5b1f17b1804b1-45f211d660bmr96982405e9.14.1757966038162;
        Mon, 15 Sep 2025 12:53:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Mon, 15 Sep 2025 21:53:07 +0200
Message-ID: <20250915195335.1710780-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125400_104039_7FF94571 
X-CRM114-Status: GOOD (  10.32  )
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

This way the detected signal is valid only if it lasts longer than
62 µs, otherwise it is not sampled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f12084d8f2a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	touchscreen-glitch-threshold-ns = <62000>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0


