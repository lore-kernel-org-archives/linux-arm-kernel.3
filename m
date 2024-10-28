Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC6FD339AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81ZVnQPK5cdOXNd0U587x7C4r0h4m8ObdC4H2ODABA8=; b=BaBNN5kzr4kStkcsuXs8vGd3O6
	Hr/xyCIVDT21UTKmIg5hCOo3x9zMhFhQDalzti8ZGqoMOPbG7qFHPhySXGMCa9IT0SYcuLetCfVWB
	3aaiEeRadklvluO+2CAIH+Jm32L6vL9ICO2Aa3z4sEuOlNbk9AccyXban8tD9MIY8vdmKM1P7W+Sf
	IaFHPdbM0MEGCTernXAjeeA0ixGml4i/qe1wbwPM+ayHhVNovw/UPd4DSGELUxawdMGSTCkZOoFGy
	Y5Az2V5ksUzZFjRzLWMYdtSDhmh0h3rshMvNB73jwREWgbb/6Nbya7rmWYU59zvGfffCq35Vttq/D
	6LSB1oYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tvi-0000000BiUO-0sfO;
	Mon, 28 Oct 2024 17:53:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TjB-0000000Bg7J-1fN7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso47379555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137228; x=1730742028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81ZVnQPK5cdOXNd0U587x7C4r0h4m8ObdC4H2ODABA8=;
        b=ADzHfQQmPAM2Ci0IsFv4LjaNrB5jR6EpQuD2AtnseKVOyW6m2qus0oBjUl0HkRRrd/
         wbYqEK0OlXsBk26WHzwAVhegE96Q4OPTEk7avJwSdHZT3jWBJp2Yh9y+gSYft2lsUY2Q
         qfi+73bLExXf1+m1T6dU2zxqFdttQG46VKaodlXQ0a5uAAb0qRmDx0Z449rlQ1OrACl9
         3dfITPefSyzw51jOFz6eqkLSEdJ9VJZKLbZHo+10/zh5GjgvctV2RkJsLb48h6a1CSCW
         SFhf9C+yhkD6B72Pg6OiPzQUU47Zm0hSW/Q+PKFz7AralIzT4MGu8YT/VZ1iYS2lYE4m
         YuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137228; x=1730742028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81ZVnQPK5cdOXNd0U587x7C4r0h4m8ObdC4H2ODABA8=;
        b=vuT7cN257kmOZ7FqG0bWYjpql5PI8bllYMKY/4ZQk9w0EqdleaUDaBvcOjtIgWcwHm
         DFO2Pg0C1MDqqR2puJnTk4O+6OTx5DYKXMXYIWHiEkyajOCi5cKt1Mn10BBGnWoMBsCY
         dhmnc+WAAWVyVSwJAJIxTN70RyYdwMpoAL/Zv821ui+5r2+q95fKS0jq8FHjR9uJgrKm
         dgXT9ch04WtM+nlOhp5MwPKYpwbWV2AC8XiwyM8Nei4ZqlpnCD52AxM0YU9UMujJt8zm
         WAmesDZ5JrAnS+Hoaj93igRiEmX6xRiH3raryZCBIYsMbr4ibqBurfKdW3BTnFgDLUVB
         g6aw==
X-Forwarded-Encrypted: i=1; AJvYcCU6EY6jeumhN3aba4QvdWgHVmF7d8MLizK2MlwhEgwC3W9DDSWAQoCU+Km4hOk8wMK+uNdR+D2Wq4k2rYxkJOxO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp4aVrFbmbofZbI8IfbIkkuVNM1dBy6IsqLtCvBBZsmUt7Dgo+
	P3eGYq+RPAEgf060evLJX15yeFFC/hCjeEpJFm1tahvU3dziLoztiA5nJtr9PJY=
X-Google-Smtp-Source: AGHT+IHSnXc+29Qbn383aWq7m+TPYika3FVB6W69uEQ0CryPJ25FNSrebl0db2HQt51eU8vLxtQ8Zw==
X-Received: by 2002:adf:ce89:0:b0:37d:476d:2d58 with SMTP id ffacd0b85a97d-380611e56aemr6462733f8f.45.1730137228088;
        Mon, 28 Oct 2024 10:40:28 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70c52sm10085494f8f.74.2024.10.28.10.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:27 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:13 +0100
Subject: [PATCH v5 7/9] arm64: dts: ti: k3-am62: Mark mcu_mcan0/1 as
 wakeup-source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-7-33edc0aba629@baylibre.com>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=msp@baylibre.com;
 h=from:subject:message-id; bh=L5jePk++a0uY91JQrASnpEj/bjSiMyJjUq1CjjPGGl0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlz+SLHqiNv37RLvXbupOvLYK+/3DuON5sdD/DL1Vh1
 vb4xC8TO0pZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJbD3FyHCMe5oZ84qtnQ+r
 dXPFHq39YJIVG6+Zb/Cty1yo54eH3yGGv3KhbEsVkiI42XYl72T7E9Uruj7v7yud7IUxv1zCe24
 FMAIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104029_470634_9B904388 
X-CRM114-Status: GOOD (  10.27  )
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

mcu_mcan0 and mcu_mcan1 can be wakeup sources for the SoC. Mark them
accordingly in the devicetree.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
index bb43a411f59b281df476afcb1a71b988ca27f002..e22177b9dfecb541e99b0807f8b79e7b878b6514 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
@@ -160,6 +160,7 @@ mcu_mcan0: can@4e08000 {
 		clocks = <&k3_clks 188 6>, <&k3_clks 188 1>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		wakeup-source;
 		status = "disabled";
 	};
 
@@ -172,6 +173,7 @@ mcu_mcan1: can@4e18000 {
 		clocks = <&k3_clks 189 6>, <&k3_clks 189 1>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		wakeup-source;
 		status = "disabled";
 	};
 };

-- 
2.45.2


