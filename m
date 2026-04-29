Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A429CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJisnvoilHvM1tcsiW91zKp6fAV95Xpg1TUbZ8titHM=; b=uH0OS0rObViWpzEKbsl6w+tR36
	rU9kFT15fb2iVnJxgoE0oXB/Gm4ibg5eMSsceNRO/Q9bx0vr88EUwNpz7F3oatg4Sb3OLT16Vvcn1
	6i+FR7fQtXsCeUP9SnY+P8+tOa8otgPvFmFhyTkoRmOwh9MlQiDvZLW4YM7+QVXYGzczeA3rcEKu5
	bX3lH29sXn/FTi0GEdrKDG/FmuoT+llZ0ylbDpX1rWIPuP823YW+X7DvoJhMWe0vi6bC39fKfjOSD
	WR3NrsG/hRHsG2U58YRwJnMz8dK5sC5yTd/PRfW3fkWuyXtN6YK8Q4hXcyDJyrcTpMWGi+fXHd3FK
	dtaRgG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sg-00000003fCt-0bBu;
	Wed, 29 Apr 2026 13:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sW-00000003f8q-35FW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rJisnvoilHvM1tcsiW91zKp6fAV95Xpg1TUbZ8titHM=; b=bLDXZfOHBN/nxXziMvoQGwUTTn
	MQG0A9vdcHCw6qnlPdIlTHWrkyNp5YdRkRqdHiMsKFRMe9tACx7yyRJ9IPfhl/4QRwn1OVAL0VSFw
	zIrc1BQ/DfQ0tjHA29umtj5xZ4qGHG6zA5ZFcW/Xdtc8nY+TUs4zCxe7xBENmci9V/vHaCl1hSiLG
	2jU3ypgSPpRF8JUjA4WHqVNk/3bHl4Ul0nXbTVXOwpxw/xaelrFGUlJf3ilkuA+WiJHFWC8k575aJ
	77MJRUp+5BJaa4LFwQUrd3AJtdW++nHgK9R4PTrgcrCssdmORaSCEn4vGQXfxD/0H7Jd8MwKKbAIk
	S8PEIgeA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sU-00000005Nww-07oE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:22:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-483487335c2so123702575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468977; x=1778073777; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJisnvoilHvM1tcsiW91zKp6fAV95Xpg1TUbZ8titHM=;
        b=Ivte8gg+bMh2ZTs0bd8WuQoiF8+qh4RucyeTxorndj8BtlduHnJzVcbRC9sTesHqEi
         KZBumntX+ARfMGM1NUxBswT146YkqdXC5uS8HXaIbl5Sz7KF/6lMU5cSv2fshrgypYUA
         BYEld2rHWvyVe+DX9WGNmfJDRmLEY1ofIbamHqfMrAkPk6NHhrzPorjYUt7iwNCMSrhm
         jkbsj6ELskBjDKPT9ccgjToHp64SrQLUMqCU8c9AyzCiG4BKtR5KCg07AlQgrSMtk1Wu
         GDATB76piQvg0WWi/8M9iFN2vwFn0Rkev+yDI29q9Wm/8Qpz8/u/houLuiLTWrX91oIw
         UTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468977; x=1778073777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJisnvoilHvM1tcsiW91zKp6fAV95Xpg1TUbZ8titHM=;
        b=TnlNsBKutMUNpgE12ZOz1pAEYykA1prwIJOvDNuqbYaQ5UjrlHAKMkxcJOi5n+S+4V
         GEZlGMbZ8zt64myIhMFPQ0IzOIxsRbeK4236lRlwlnrzjzWTNkBnBUCusAePNsy6cwzi
         nktW0gjR/VuKngJ4w55K1dWDB1tzITn+RGUCcChNT9zVA5JQLAiyfBDqFzE5jpM865uD
         nLQSgfDRP4LWMLxNShq50aIHp1ejbHo0XLauN2mpuGmuC+uNLo+QCTCKKtzSDKc1EZ2g
         LvTIx8+D2hmfYGa9anJJpm3P0U+L0oGi4OCasNqWO351ZsoPX3TWo+ZHuOfIj0rKew9D
         p1bg==
X-Forwarded-Encrypted: i=1; AFNElJ9rxmyJ9svqBEf2Uv8+HL6oUity6snVJutky4ZBtG10N2LznAILfORyvg5rjiMQ1BWrBnTeq99i8XbJ/GQN7SK7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrr/N3Ut+61f2z3SVB56m8aL4FxEJuWpCKh4nBZ7Hynax+JI4Y
	XcnrDUjKHZVw6hl+4xx4tbNMUc+ntDF1UKssAOnoti5LMTAobW+rV7tX1vmfGJjYgs4=
X-Gm-Gg: AeBDietaxm0yzx3BOfKN0WFQPRkqODQPBMShXJy56UyoqJc7NEwE8PKdCovFYNSMauZ
	W41dLguGoSAapuywxlwghkq3V6bXryxoJPo/MyzjZZH+UIN6MOj6qzF8KJU7stW/aswb3GiIe5Y
	SIqB9pa5/obT7Vy5uyaMB6kyJC7cynnaK4RbGJ2n7Q0frjDYlqlOfIo97xdCBQSPNlW9eB8HiDl
	xT6I61If76zzw8pl9+4WLDC2e7jBs5ezC0sR8J952r0bK6VkO5HRV1kolmZeK/LKFY8LTWz4W67
	DRgPAsccPxXVpfg+8YeV+w4c0ReBsCbpVdI7FzN1fWTpPDhUb+YIlGSD7i4ARmpPjz7t2z7XuOh
	isB6hXv0ZAfGuH3ZeZ44cbVBfTjjU592m2RdMsT91RL2z+2DCwfUx8IDH4r+1eF8OZA2oYDyrcS
	GaVB3G1M0QK5YBwvzRq+lu3VeUHF6xENaKbnb1YIqo2w==
X-Received: by 2002:a05:600c:3541:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48a77b1bb4cmr126176615e9.21.1777468976657;
        Wed, 29 Apr 2026 06:22:56 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d4843bsm5752703f8f.7.2026.04.29.06.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:11 +0200
Subject: [PATCH v4 4/4] arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to
 pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-4-fc27d6ac753c@baylibre.com>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
In-Reply-To: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=VsaP4LCm9vj+GPBKWc9GbqkMJjZILMOds/rJOobS64k=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbIo2lfKnvyd5e3KfnbSlfZnmWTaubknzS18bTirrP
 G3daDS7o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbCs5/hr+C8JRf/f9h62W/S
 5pfTLq3Xdxbrk7F3a97vFxwtUWr1SYrhv+8pgftnGGb9OrxftfTKlucSV5xcjrV61ucsFq/0rHQ
 4xQkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_142258_183229_3A2C9FBA 
X-CRM114-Status: GOOD (  10.65  )
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

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index e67489a178f2a2caedf1306e1c1c9dd6a95745e6..b4a4e427637bb4d5ca408d29234b95fe7e69d006 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -71,6 +71,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -879,4 +880,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0


