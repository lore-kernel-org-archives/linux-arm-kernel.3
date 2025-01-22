Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA42EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkXU/mbXgXy1UAlTcrbRMbMvk4S34h1r27crXRO7sVE=; b=LxOfprswNE7Yh5tD/j3TFGYGvL
	pwPiQBZjevRR3U8NH5V6qwOExCnck//iydONknyKlMrnJpFjAgjAh9ZOhVfxgKEaHmNB5A9AOZMj+
	p+OEz5iehoqX191pesTRVQU1tiRp36Ac1HtwXQ7Gyo73rYKCiCI1db72zTZN93v7iwFZvdZPs+7+U
	Rg/dsljYxTBPM3BqPZjXbhOd7VyM9l0RFd5Vaumk2AmFfFStUhvlBuf8P0S+5RWigz9B4MsaRZLaq
	No3ROAXAAt6hOJYekbnK7j+wEiM5zp9AmvDzYrse5y9JpD8hL1jU2hU8df0Za8XfwSK1BFQPOmwlN
	qI2/67KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXXK-00000009s1o-1cwC;
	Wed, 22 Jan 2025 10:00:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXSJ-00000009r8m-0hId
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 09:55:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3248378f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 01:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737539725; x=1738144525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkXU/mbXgXy1UAlTcrbRMbMvk4S34h1r27crXRO7sVE=;
        b=pBiw01NgWEzOcCyapanSGHxq28U9tyQLfrofOX6/vizjcEKuKhKpnyTT6UDYnPbLgT
         1hFkMR3TH7oYAOGcpUM38KN4gmjnege/1/c39aUMlFXXYEoKIRyjTtl79OMlB5DmiOEx
         D4cJjP82U2S8HrZCReUJPoqtplKMydynxd1P6V7GuQp5NqMNCUSm54oAV6y3iU0fHVZz
         spsLQkdoZ6NLRKUN9OK4OoqQ9Cu2JLlRpdxiESDpYvpoe/eHI4ci7YfI7Q8d0v5uJmxH
         JI2TNwOHtxxTo8UR5QkYClYYV+R1//mH/5IVCAdnIcYpn8rU8O5NNl/nfTaFkgXOvpsb
         yyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539725; x=1738144525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkXU/mbXgXy1UAlTcrbRMbMvk4S34h1r27crXRO7sVE=;
        b=K2KLsiC/4jleEUsScG0I9OExSaC68hllo6dqxE+UnYYwBcFznDQHb3tPeRG4DC5bIa
         TYK2/ciZCvie8nL/lEDnGMA78Cyep0dy6yguogSlNXu3c2N8ZGhkZPjb+VxsAk9glEcW
         1H4C9nd8iPCaT4VrI6VrhlHifHO6Hal+OvggKfPzoR0O2D2Sc+uScUJJAl2szy7dt2ml
         za4Tow399sbAlxrop4U9HmjlfxEzmGBuGT9AtYHe8BO/W9tlwLjLxnfEc2PWbNFrJZ2r
         TBtX+xt5znaTYWCPqq2082ovgI7/y0Ban9a1fG0GnwcihJgpLRdxc9gCUnRYhaAnHNP6
         WKaw==
X-Gm-Message-State: AOJu0YwWOqFWs/LvSdfUfoJCNHOf5sAa6MdcuS1KPUavJ3D70JSkce/i
	DDPlGSnuT7Sbj7TQVSo7XezdxneTRnOoAW2co5AieLxhF3tuRnskyNaKEbsS+hc=
X-Gm-Gg: ASbGncvycrAn/ojEG5v+aDmgarbfscpGQC9QIbOpQYLHgkhm3NXvYMWVPhGvB77SH4r
	2wkqNcRCZX9+D3JaW/By+F7wmE6GlbCKAB0eGXT8KyxP30QfQm9Xfp4OgfjlkxA/Beldco1zFsN
	+kebhDQCO6pnd/gSJ4KO7gEKWZpd0FtbXrFYuH8cAQz83BISVZ0cOfmXYhFRqvzHqXxJdhz7aia
	amKhbt9VVV+jfkAb59+cLF4mdFixDs7HfcPu4CUKUAyq7IQgbD4NVSHui/yeC5ROdM=
X-Google-Smtp-Source: AGHT+IHi8wKxfGNlGgCMFVgEtLd+Q2y6RmCAks4ExEZmtnW1E5RNCntEk7piIjBdAlsaTXqPWamYWA==
X-Received: by 2002:adf:a113:0:b0:38a:8d4c:aad3 with SMTP id ffacd0b85a97d-38bf5664d6bmr14540191f8f.18.1737539725527;
        Wed, 22 Jan 2025 01:55:25 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1cc8151sm16554205e9.1.2025.01.22.01.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:55:25 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Wed, 22 Jan 2025 10:54:51 +0100
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62p5-sk: Add r5fss memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-3-f74835b91da9@baylibre.com>
References: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
In-Reply-To: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215; i=msp@baylibre.com;
 h=from:subject:message-id; bh=foP128Q0vaml+DKn9OpvbU52LDZNwWhrXWTRZEdqdvY=;
 b=kA0DAAgWJIy04tQVrj8ByyZiAGeQwIOg92yavyDfmN5jBj9NeidWAh9N6a221QeWlhy66MbzW
 4h1BAAWCAAdFiEE3fCh7n4e16BYruJBJIy04tQVrj8FAmeQwIMACgkQJIy04tQVrj9VYQEA8SoU
 V8IaIsZt1Mmz6nO9GOWRwd8gFaSembrqKQYowmgA/2jOBz8u7ih/J2T1iVQqe7465hlN8aZTD56
 KZnia46MK
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_015527_209101_A314EF9B 
X-CRM114-Status: GOOD (  10.18  )
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

Add the dma memory region for r5fss and list it in the wkup_r5fss0_core0
as memory-region together with the other already present memory region.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 7f3dc39e12bc9ca4a746ff092f946b84a36404b3..cc695c9d662e6f2c41b73ddf4afe0e95888676e4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -58,6 +58,12 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c800000 0x00 0x100000>;
+			no-map;
+		};
+
 		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0x01e00000>;
@@ -677,3 +683,8 @@ &mcu_gpio0 {
 &mcu_gpio_intr {
 	status = "reserved";
 };
+
+&wkup_r5fss0_core0 {
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};

-- 
2.47.1


