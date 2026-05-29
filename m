Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0550CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TLdBdo+a7d//how+11PkSCp7hrc+buyRfRIWTDHt0c=; b=H6eItoyiLzY5OhWsGqr+Zo8D7z
	qaL49lHcXzDOVGVYHJBMWYx7IDm+TavukjHFD4kNFxvU+vPoGemnZonzwUKUBsFyj39hPcsETNRfG
	WZNymKWfqvWS5Pf5a46aUr/Dgi9BbPFLSKTELSKbWdpv4aSfOqIVJ8lE12hKr/Hj/B4/NJSDvUf2O
	NzvckdDEke/6OIeOS8RtSPT3ChrqIJhxbjXP9NG6H/uLI3WButwq7wAq6Au3HOjOCoUTw5oNAOR1T
	Gu+ieT6ZSPA6NS1laDsJV1N1yg3tBVYubkA7th2Jp6dtQveSdLgVJEER13TgOxr8njec2P52ZKJrS
	O9IpTnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqw-00000007UI0-2htj;
	Fri, 29 May 2026 14:06:22 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqu-00000007UGG-07mb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:06:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso704124a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063579; x=1780668379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TLdBdo+a7d//how+11PkSCp7hrc+buyRfRIWTDHt0c=;
        b=Fz2T0iVrw8uozYt7IZJvsB8DAbp+G7lCEEEQUwdlYVVTxfA1v0OMcQkKkuvhSmrhMG
         +yMNyoay8UdF1nebfs/wf6LWm2w5iN9cGR9LrR6EY/Avk1TijBlGRjS5Pemk94bl4xPc
         F6LYs2eEGzatqsR7lIiS8EjA3ee54FAKcfhnPnq1BdWaNm9Hzygi+XAkwRxZTENNqaRd
         8kmU+CQX3qE0kDmG06CCfRB/n9e8H+gtSC4omT4RYkd1jVo+klhmmIp7aNbxML1DcDzL
         jeOgpRfinBZL5ha8lrDmqhUFIlINjfxUV792gDOtiSjnnxLZkHU2aqmi0cckGuUDg42O
         ezTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063579; x=1780668379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TLdBdo+a7d//how+11PkSCp7hrc+buyRfRIWTDHt0c=;
        b=p73IpuKRQBCwNsdHQI6PzafT57NTntXqNSNtfEnZ0MAw6+SYIYATWwpJHmaumgWnmY
         RxBo5+67SgfyKYztr2az8sTHVArNwZ2h2v9wU0r1Zr8JWB+81DlEXjdki5Rjdahv3QFi
         7x1XaS2MMkuEQdiziJ+/1LbGjOVvGnghJhIVuvrz75MSpEuIx/6TrbXbytHif3uWS/gr
         QHHZdYp0V4W4rkoI7I/EKV3bo6kjbzTYkrBkEs1Gaapf/dM7/dnRvUsjChj533IjABuU
         5rXlpLSf+oj8RTRmnrdnGmT7lG5Z9EXOtVoEyzeUl8KQ1Lt+ztJURZw3YyXQCtfR8VK5
         17vw==
X-Forwarded-Encrypted: i=1; AFNElJ9Oc804YN2mjCfg0kixsAPFcNKNkSzbJruZ/iV2BFKxl80TNHJkzKzbxzheVyx8/Ba55YoBuRZvnm8U45nSA1zF@lists.infradead.org
X-Gm-Message-State: AOJu0YztAFhyRFQF9pZTPxJRELeK+5fE6zy1Bbwbq0FRZakLkvKQhsqH
	z672DydZzJ+ENOGUS95QDdaPw4TM6CLegLh6avEfKwhPH+3g9Xv7BBM8
X-Gm-Gg: Acq92OFD8R375IRWFOuksys7elaHlPeDeUVspOvc+zvCMOd7a23St103V4NZz4hZ6fd
	Y7lY57//l0DDyoEwOgQ3s4iXVolNnFklEznkrN/alIGHmJSbZCRaiFthXcXqdG6OlTPS0q83+xZ
	94nI6NgJZUJtXek5R6H5cWYgHpXtS/b9Zo38t6T6AheYxbn6OzSF7VIl25GCMu7uMnjbaHpbKDS
	wqcgq4HClLmBBg1fmYthVpfgU/sKGpM8uOuuuPM8mzf9+j1rGcJ1Bj6f4W+RpKtLTr94pX8CCw7
	Sf5NIt53SxCPegmikXuT0D2IJV2dy4C0/B37xXuMDxeMwofCTlPt3QK7j8sDVFNqv5HEQgGFuMG
	Od6SzptWRwG7JF8sKqfuTsDnsclHheqA62kTxybkiX3eJAfkUmM75AOTtN8mVOxcxDSZJQmRFIk
	ni/gxcmvMULsZvyU5LKMhXNSQDZgkaG/qtX/ILVXHOOERX4a4ig/3pseo0NOTb
X-Received: by 2002:a17:903:2b0b:b0:2ba:ba5c:2524 with SMTP id d9443c01a7336-2bf205132ccmr42462425ad.11.1780063579099;
        Fri, 29 May 2026 07:06:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Fri, 29 May 2026 22:05:57 +0800
Message-ID: <20260529140605.1070764-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070620_103621_CEC2DCB8 
X-CRM114-Status: GOOD (  11.10  )
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

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f1f53fd98ae2..b7a7f4fae7dc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0


