Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DBCCCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=; b=tIBtBtATZiELLryxlVltYN7Psb
	A9BmoFl8Vteh5SA1bBEcKxCMj9WqCeOmZ8l0ku15TKhgeSZf2N1wZAkvSDdN2rFaUI/RbHvd6l9NI
	g3KlbmVTnnbipGroNKvTiYsQfHsAjq0bd7eRkhlEPnjNY6oHt8R/GUtdrMnrA7T5TgGKCUaFG8TWE
	3VjkZrsIl9GpSwciOLBFtLYWGo+zfwjhGwFHbONNmPbbhrosGOyF9XByagv8+ndIHv8ZBxrCEE8Pz
	JTW3HPMoJXHyq+2QHblEwtADV1wedpEUnXV7J47grIGcfxhggsPZDWEWCY3dEIEUSHVGo3zz8xxq4
	3Ytp/AcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoP-00000003pzs-3bf6;
	Thu, 30 Oct 2025 09:19:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoF-00000003pwP-3ZsM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:19:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42557c5cedcso473015f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761815946; x=1762420746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=;
        b=wvF+T52ZkWHucgfJZAo1xHVU2JoHetyEmTkbJh7BBHxedH5s21PDT4luLGPazMRZ/4
         UwgnQYF5lXvZpUoB1xkGh2C8DL35aRqR44vx/xNIOeKSxR6Vd6Axad/LkzkgiAjlUc9p
         E9oaMyADuM8rFX5dPxAjNKCCJdlBgSdDsP76/15BHETRHE66mxpKhq4JwZyxFaG44JBd
         gnlGm/VqiIJjz4P50uMgXCZ+TwCqbCClLbVBUx8WkSGVCgoeeaggEbMQeU7Uxq1bMp3j
         p6UOWW4ilYRO7y3+xu7CQNv4cqsxooeo3iyXIaH919Kzf8ZbLrKVyiAue6vTZgShUgaW
         ZcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815946; x=1762420746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=;
        b=B42lKITxciDWGRl4pap1RQWLZ8YADUlC6XfsYxKHGVDs3nBdo4ipLBes7kqHHbWVeB
         SfZfShFOCzD461GkvoXYiOIPW0NeSvIRGyM8BmyBNm8kjQkj+eg2Fc3rbjvxRd6DMkLF
         rtluueDqJJBL4wDqQG/Ze2sz+PaRxbf+444LbSYwD3EWzh9QVziqJUNm6+2ArpJiZM1z
         Hj4bo00A9N9PfMULECkVycdxs4TSghmEhIYhOs4/AnWvL5ybTgMgbIHWyFta/MynfFBu
         XooYgRo7NRtL7wZ7h1Poq6Tj1G7pNm052DNeSKhF17BGNKXUKSO//ONPQK8ZfCX2COXN
         piNg==
X-Gm-Message-State: AOJu0YyTXoVYwVuV90l/m8hiTsg/tDlCkAZYJKXMvgGF4e+E3Z/SnS6b
	vvRuiQ1EgNrg+s3fR5BBQGclFJh+sxLkLj0R3PmX0GFigA1TOJ8jDnNItFehaIQnRZ4=
X-Gm-Gg: ASbGnctmB01NGvXOKTOAmE1rTm2zJBu3QLU8GheE5RNNCFF8/DrFpYk+H+5sQTf9kfK
	f5rFXw4PrNfbL2/Qg81t2AmCKi0zxofRzFBCVtewBKkX0NSj3sPRgS81sxBalZ9xaDHdlqfyuz8
	28fKve4aDtHPC3WBtb1Dq8M3LcjlO2RsUPNnJWjtPfJAgJXkf07+RO337cA2ZxB0hw6xAPKox1s
	eo6hasB4hqWltyyh80UIJMUAIz+tutj2vYco3mVuMQcAzQnG9OeJFdNtLRTlK4gaO4kiE4L0UZy
	eNMrhdiTeoYpWjO4uNbsDX73GYg020LsAFjcEF5KpuFhF6qxodwL2RI21a/ERb9lWR3+ja9yfD9
	y8TngS+VH3ODJ+dWf8gPn7xNdzL4gAKXhpyOaQN32bPEK9v9vl7nD9/E+hERZwxtc9oIUUNyjNW
	7FQhv20Pfs
X-Google-Smtp-Source: AGHT+IH1PgB1uMdxkq4IGP5D3051kFV2D7hdhJU7IzYW8jXnJKiozXoXWL4JvU6/d2O0ucUtSXr8nQ==
X-Received: by 2002:a05:6000:2204:b0:429:9501:c9c1 with SMTP id ffacd0b85a97d-429aefca849mr5070963f8f.46.1761815945792;
        Thu, 30 Oct 2025 02:19:05 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477289e7ceasm28861635e9.13.2025.10.30.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:19:05 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:17:25 +0100
Subject: [PATCH v4 3/6] arm64: dts: ti: k3-am62p: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-dt-partialio-v6-15-v4-3-6b520dfa8591@baylibre.com>
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
 h=from:subject:message-id; bh=6hGcnBOkrSMQIKieC/McV84XZyXymXT7FDaWvZWNWbs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxm3fS+LRssj0xiOlaZVtNT+GH7qynvDA/MvX3pcO+Mn
 VEWJ74/7ChlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJFNUw/LPYq2zlwPRVhP3z
 Ea1PkXfdXtp4VvftW2efsE+F2XTKKVuG/wmaiVMqxDZM1fqs9NFkh5TOh8CWt7F3hKSvOOovWX+
 rhQMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021907_914550_16029508 
X-CRM114-Status: UNSURE (   9.28  )
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

Add the system states that are available on TI AM62P SoCs.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 75a15c368c11b068430362fe0b8d2d9ecc052588..c69e16f16c835489f2bc5cba158235ab955347e3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -44,6 +44,33 @@ pmu: pmu {
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


