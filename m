Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2E0C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nM1iEKnX8goZJjbBqk+vEAeC/fnWWVRUcl0seopOhvI=; b=HKaJly4YhtkWrGVkdLJdyRVtPz
	/LgWBfkE3jG7YbWfTwyxBdn/ySv1zzpAgoj8qidHviE5fX8zr+Ic606C1B4I0TK7/YY1BUMqn57FO
	R56WrlxpaLdjPfJe50zLTMvJboUdC/OtcGxDd8uyWShin1UN89hS1lnOFxEzLCzbkzajsI27YITyk
	kCjgOlugz7ak9kApRmGqRKKA3kjKRDNni2d2L6o+NYRT7tyVKBbVYLFCuaS9Qo1TyUkpBQsW2xKkf
	WWZ73WtdJiQwLkfw9tFpTHpkpZJdjA9pUs7EY0DvNIctC3rzUe77QuEcwCow6wBsfJpDG+IxmiLII
	36rQJLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybao-0000000FRWO-2ehw;
	Sat, 29 Mar 2025 19:11:42 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybP2-0000000FQ27-26b8;
	Sat, 29 Mar 2025 18:59:33 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac345bd8e13so537467066b.0;
        Sat, 29 Mar 2025 11:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274770; x=1743879570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nM1iEKnX8goZJjbBqk+vEAeC/fnWWVRUcl0seopOhvI=;
        b=cJYzMc9i4Ha583/Y5gLtppwCNwtCA8id69N20hf1SFWiUSloC4dgknZwezkSCVlw2s
         uUpBpXWvc4t6PxzBqUcs/xI3ayVE+vM4b1dcBfmMxPMS2YGKJjiGMPrEr4e9AoIjyP36
         ++k6wYygtss77+V9dJT1eidrrHPw/9txGmn+/qkZlKXD7c+YXbqBB5p86GkICfBqp/iI
         fqnSX0qzUU6QH+PaG3Np+RXTpCUndQSrBI+a5+ukBXNAbJ5n4CxgulbrHTa9UE40MxQN
         zfGyq/tKjN2Y0UxdXUpNeQaBgxIgifQ4rFRYKbOprccAeLI58qtOSnWoPmTNttrxlUMm
         vOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274770; x=1743879570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nM1iEKnX8goZJjbBqk+vEAeC/fnWWVRUcl0seopOhvI=;
        b=ZtXcoCP4jYwabiwWXW+IVgmqiVgJSjuQGR2YlMFr3cLOxORF5LgXSsAk+87ySLl6xD
         8e3+3jCv8eh7Jap3aG1SlPMLWw1jKbNY5JUUv+BuNMkNzH7hQJbezvttttKK3ia/ODXZ
         8OlQzn80tkDt3LgWfH3kFPDLF+ZnbK26Mu66Z5YFG0Iiz81yXJhK9p7Bm6i1R6IhZaX4
         bMGo1OgA3YXUZwN40CqUoCWH08KptYwGuLHoNiVb7RIcQ0EGk29n8FOc2xyRy57Ac3TN
         4dxFO2VArXR1byQ5SPQrOsYqORxWAGKDls6UVpxlb8sReo9hlj0H66erqzDPWTceZOb6
         pqqQ==
X-Gm-Message-State: AOJu0YzODxNlboDFHJszx05Q/hzuuG0MBkZ0OgslF/60EiI+jznT2U+4
	mloj6GSgc+aThY89Bgltne1jAM3hbN3M3on9D/3p3356UcdxQke9i17bOQ==
X-Gm-Gg: ASbGnctEoNEHVUpXGnHX18dTiHOa1gwzQ0XVLTQjJ1+WBEYxDOc2XpiKZdpMvbRZPG0
	QrhG6B+6W2coab9+LYttMmSIDlmGlNP03nDXQb2MokyNqsR/L2/NL4ruQaU4uBO9ZyQ42lA+T5V
	ZNwR88OeaP+3ZeM13Rdp+AoBGEeNNijOkk7evzYtCFBAY5To9gdCh6/YuiI47pRlCkfbham78wd
	DlD7H08Ep1bWgVid2BmE7jF+dDE4bwMN/04KYKxhZXCXOrnHpL1SjMIxvUEoDpap93UP1IzP/DK
	+MOX5ocPmk9kTD0ST39aeXs94vbQ0y08ZsjyIxnrylBM01WJQ6FEdKrnpS3DDblwvEj/1HOw8/x
	fDYxnD3yArRR/fGa16IUJuJuQPk39TUzY1egIAcqNFj4olkAwx0+qQlM6jJERcftctN754o3Eyl
	o68wpU
X-Google-Smtp-Source: AGHT+IEz7v5Ljt9ZJRFv32Hw0OIPcmVi+flrUYAm3zPFqUuBjHYjrY6pgvKN0F18tzS38DfxADncyg==
X-Received: by 2002:a17:907:869e:b0:ac1:ea6e:ad64 with SMTP id a640c23a62f3a-ac738a3f376mr380847966b.28.1743274770291;
        Sat, 29 Mar 2025 11:59:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:28 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 6/7] arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:54 +0100
Message-ID: <20250329185855.854186-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_115932_538360_2BAB45C3 
X-CRM114-Status: GOOD (  12.67  )
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

Some boards have noise on the UART RX line when the UART pins are not
connected to another device (such as an USB UART adapter). This can
be addressed by using a pull up resistor. Not all boards may provide
such a pull up resistor on the PCB so enable the SoC's pull-up on the
UART RX and TX pads by default. This matches the default (from u-boot
or SoC hardware) state for the pinmux configuration on these pads.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index a6924d246bb1..2df143aa77ce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1164,7 +1164,7 @@ mux {
 						groups = "uart_tx_a",
 							 "uart_rx_a";
 						function = "uart_a";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1182,7 +1182,7 @@ mux {
 						groups = "uart_tx_b_x",
 							 "uart_rx_b_x";
 						function = "uart_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1200,7 +1200,7 @@ mux {
 						groups = "uart_tx_b_z",
 							 "uart_rx_b_z";
 						function = "uart_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1218,7 +1218,7 @@ mux {
 						groups = "uart_ao_tx_b_z",
 							 "uart_ao_rx_b_z";
 						function = "uart_ao_b_z";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1654,7 +1654,7 @@ mux {
 						groups = "uart_ao_tx_a",
 							 "uart_ao_rx_a";
 						function = "uart_ao_a";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1672,7 +1672,7 @@ mux {
 						groups = "uart_ao_tx_b",
 							 "uart_ao_rx_b";
 						function = "uart_ao_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
-- 
2.49.0


