Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EE9D49780
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3DWv5cRaHU4Io1NaeAcsTV4k9nDv9YZHhdkDqWmPyg=; b=A9MV8iMHdJ41A2qtBNSFiEln61
	3HKjItHciOOctOhtNNChYkXvp98/NJzwc+90Y5Ke9kLBExAUq5UY7X154TYt67FxQniyC+dujl2c4
	Ix12DlnOx1fFgpd7NRV2osSoOnuUOXHpEOlabat7cPWxvcWM508H9b+nE44c6oQyZGxN84cewU2TZ
	ikSy74HHNEKZEhKyHbFITEKYxz/E9SSnWvFBZpB3UKVy3xUeV3AYQFveSHmes4HaGsarUtfQEisnF
	8KnsIGX4bIx9xb9j51NtEls7BQW/xytElOMXzyZL0giAWIa68Vel4SqQOaOIsaYiuStXtU9m15A0J
	5aLX7svA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoA9-000000049yu-1mX7;
	Sun, 01 Dec 2024 17:55:17 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2d-000000048Tm-3HS1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:32 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9e8522445dso499944566b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075250; x=1733680050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3DWv5cRaHU4Io1NaeAcsTV4k9nDv9YZHhdkDqWmPyg=;
        b=coy7eRT0sKSK0fitQJRAlJzMF9yIK5wsHO3u3u2FM00R5SxD/haK9brk3l3yzxOqeE
         XXxU0Sp7txHMpvQcx9CGFYwQAovslr+T69FUQcMhF8Fg4RJs9TRqHhjqhIWenEhOVdQa
         AmL0GIFOM4A6H0VXLCoP2EI4xKPzxA154oqdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075250; x=1733680050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3DWv5cRaHU4Io1NaeAcsTV4k9nDv9YZHhdkDqWmPyg=;
        b=VlXIRl7a8do41wGhho6AEFUDjlPcsKjlB24bjHDOQnde+qD1ZZBG47sQVvJJkaf9oe
         xdA+JHVc0MnNMJK7ImxgW6UTilTs4T1hoU1WxKbkIyNNerqbpQXY87KQz2sVrKaynSpR
         sYynqhRQcSppdPTkySa3owQLuIEIujgS7YXCDqNIhM1YE+zHMwNG+VK6VbA7RVmY88sG
         Dt6pGXY1D3ZZzsXjY6eH+xrqYw6GFbFZhkomBpvfRkMzerDOr6H0svY0kuFVC3v1keLE
         kkmhdVdEPTNAVQ0ppE6vH5aym2yi2ll1lGO4wc7DI9MbNW7lo06lz1mg2zu9j7TrynKg
         HFAg==
X-Forwarded-Encrypted: i=1; AJvYcCUZc9dnkDEwlDQddNMz+ROquLnDgA/IvwrjisuINdVbQVxUaYbF/xbIM6bCYEQrythxV7prGvAvCFkqSJZhlxFU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Cg7d6B4RRekf9cQlafc4/iEEHS2c72R+djRsY4Gm3IH8qLTh
	2xeZq/hqfKSziXAEjZMNmKTQC77a7S9tEKqu8YFkIvxGaRbGQSaMIhZMRdxa9/Q=
X-Gm-Gg: ASbGncu94wTFO5JnjTaQ1KjADxzLAU2dt1ae62HWR5wetargxh4qjbTTNKYrTfQvtbU
	GsEEZ/URzxbQgxwI8YKJBIvS/dadlfNQkcW4K8Uvb5y3YAj/Ei3HQ8kIYN1IpQGNNk84KfPT93q
	CeCGfte9m+df0ZruVNTPJXBnJmaAxhmiKwiyrMvCGe/c9xgYM0X7aXsmsNSpZVtYCEUrgfEQ69f
	CtbDHq4+XJhqzPSm5m6s7PJ8/hnfcMrx0Bpa6Hvytc7fV/huaWswPz8bh+6h7nQ6074WBW1tbNz
	rWYLU3O/tI+yjekWeTHU2D/9iNXcQAlxsxBgwiyaZo2Q6kkidaYOmQkVWpD9RHrrALR1cfINzrN
	TV32/S23zWe36TUyw
X-Google-Smtp-Source: AGHT+IGjTr544po85HL/yFGlp7Fz9SND5Mszl3n0nyOzsFi4lUmL2IW6mDDVfOELB47d4l21pa4qgw==
X-Received: by 2002:a17:907:3f9f:b0:a9e:c267:78c5 with SMTP id a640c23a62f3a-aa58108aa97mr1582174766b.55.1733075250065;
        Sun, 01 Dec 2024 09:47:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v4 07/18] arm64: dts: imx8mq: add anatop clocks
Date: Sun,  1 Dec 2024 18:46:07 +0100
Message-ID: <20241201174639.742000-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094731_817617_7BC23B3D 
X-CRM114-Status: UNSURE (   8.82  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


