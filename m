Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6908ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=; b=pw0WqJ9qUINFB4gf/WkqPI4BLP
	gfx9O/TdDinVNlorI1RRFdW8BmLqgWGdWzo+xBxv378PSobQxl9unQsEoPkSVyFQMAao1xXM9CNUF
	TpEZkov13EjZACigJ80IiOuSrZq/ExRcl53KdFBKvzG9mnCtnkExRVia9SFgQIagylI7ceKPNFS3c
	yF+nbAwo5KqLt8kGCVCn5RP2ks+K4CDbyoJUiw7KKMVIoweYpVdspg4uiuyTW98pwRJTkDXSrTnx8
	iONn/Y3jgI4YtA+9VLlgvmWdKTipKXFFCjL4pPy5sQBb+jfCbBDE0dNc7d7OJW4WadCnF2fqhW4pC
	RD+39EqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoP-00000003pzZ-2M35;
	Thu, 30 Oct 2025 09:19:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoE-00000003pvy-00eb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:19:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47114a40161so8910045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761815944; x=1762420744; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=;
        b=am/5bZXFwIgb50ajLCLw5QQS4RbpCvkPtO6WB6B6eLVJ43OPAYfoTJfuOWcc23SZYu
         VHcSQKA6GIBtdC0yXM6IFbrR5Rg3FV4xwU+CgcmOvbIcKjqnV54ZZk4AwOInQ9C+Vhuy
         lkLxTtZyuN8XNnhGMDHsypWW/ENM1eOpQo/8BmLom1FfFIAgVUai/6QxHACa5bQSz7oE
         oCFvd/sxCRIwj7lH06q7UiqnZ7728ju+bSWRiBXAfvH3cLUsj1S4mF/EFpdnzcAYeucI
         A0yyEOwcTd1QCxsTOZpIBoEykMtsLPd7w0Aqi62ut/NfH3M5RHjXkPM/jof9ObWzw8Ch
         bi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815944; x=1762420744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=;
        b=kebHRWdfuXWP5dPvvfD7NYYvJrLEJewwu8U4E0MLseStQ83UoEJCHQSLma5O/ry7g/
         FRfl+5wZ4u+3Z5WhJmLQBvMxeU0G3KUTh78xLcEk4QcmXEpe/srty5DLR8UZ0Y/nkGDN
         5c+5sJ9QuseVbtX5pukMp4wJKvnf9zLZHGuQWDN1wb/ij91tZQMWuOzVTLqtgOgpH08n
         Wy9Mes+qs3QsASCVwmDpm0R8fql6b7tdNpku50XdlaQWVo6X7zoQ+x1Lib2OwGZu1k9G
         LQiukqAGbDMr5fEd5qa14x2XEffWdId+KxqMJhsPNKSUawlWwaHUcSqNbrAPcrR4UTq/
         7WPg==
X-Gm-Message-State: AOJu0Yw74mPWT1PrKmiRWu7uMSS4DqSNeheZ6hiZfVdTHluvQ7fgMOP6
	KwkEad/G3qplfB2fqs/6Bq5VH9NEdS+YwmOxjRt1eHPVoI4/TtrIoV1GBqo35kqRKHs=
X-Gm-Gg: ASbGncuS1RintWhER24Fza0KSv5cLadIl6+EkPIB6ZdbVpI/XTkkaQmkld+qSPRSTwO
	zvFZHVUiOLXTbAHxGoJXM/q3z2VfvtxxjiFTHyn0GkgOYcrX/0r5/dgMseKAsMywcllq7t/8s/W
	PTMvxU2GWVFP7hl4KySZPkIrZKYQj8FXDfqz/3C4uR4FMmDbySjUlVMYQwk4nadenXnGL6gyaYJ
	Ms3oBqVjMhkbl7X2i+j5j7OM4u4bxBa/WtGyRtdX8IbzxLegDuxZTrMnIlEFkm4K1G9enqTPV4G
	KOcd3qFAWdZm0tfmjb4HG5bauHkXyt1JDKesx5ACbktGdYX2yjV1SKSVCGH90oCu60c39VEHOVe
	pkpYgDMjcRjOL+HddCP8IR6w/MbWoXFZOF8/PoFERY1nW2aw1PQ1KRo6SZzvt7RFZ58hjHjFPB+
	FtDcODNsj0
X-Google-Smtp-Source: AGHT+IFhGrgcbFfOulX+iDaGdlSnxfTr1i99B+BANP4h++UJmhUQbypXcv48n75+Y9SSCx3IGH+2gw==
X-Received: by 2002:a05:600c:190d:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-4771e3a88c0mr46479125e9.20.1761815944052;
        Thu, 30 Oct 2025 02:19:04 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47718ffa42bsm63685265e9.4.2025.10.30.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:19:03 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:17:24 +0100
Subject: [PATCH v4 2/6] arm64: dts: ti: k3-am62a: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-dt-partialio-v6-15-v4-2-6b520dfa8591@baylibre.com>
References: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com>
In-Reply-To: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ewnVTjrK+RQoWcZSJk3a3VufQN4Z70DOdAXgMXn6M70=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxm3fjTuhfSU+bwXd13/oSqtOSUEHnf3AAOreJFvwSZ/
 rj1nVraUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPZ+YiR4dZmWQmXJb7fUkw5
 Al26XJlijr9assB+1ffed52VO+Se8zAydD4s+r7BMfuOj7FvimzBsae7ZPevyX/Ye2Xt+Ye75sc
 v4QAA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021906_063687_2885FE7D 
X-CRM114-Status: UNSURE (   9.17  )
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

Add the system states that are available on TI AM62A SoCs.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a.dtsi b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
index 4d79b3e9486af18b8813a8980a57937669ff6095..31b2de035f0f748e34b8919f90251aa0551d9b32 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
@@ -46,6 +46,33 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "off-wake";
+		};
+
+		system_io_ddr: system-io-ddr {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-deep";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-mcu-active";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.51.0


