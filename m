Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45151CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQULYkqXtjivJne37GxmOPps34TMKbzDHgmdioeMwjo=; b=an4ptpmnaZsEIs9CQxwBkyxU8W
	aUcCPpfUwKBqa3c4RBsq/NIKAwc9dxqsE8gKqQ8FVbdiRok5Y36VipU9VkA/cu2o0ezMtVTdepzC5
	HQRTOhK5JJ1s4Ye0tywyliDUvaab1tT6uSHsHE+86RiSXu0b6cbmTUt5+NGtXz68wO6sLLSygj8ZC
	0QmniYV/VBBwUIx3fGYD9XTxNKJvq91wXIY1P7N6ypkMgYMElMlIoxstwV70d/hGgV8gnCttISsCP
	q8tUHi3e3spOtwUOTv3msApKGWmHMCuYSeEkSoxiE5tEseGZl2tOd2Vg4528gJZsYc+hk9iaHpYna
	nv68caLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUn-00000007YUN-302i;
	Fri, 29 May 2026 14:47:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUb-00000007YNo-0n58
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d77f6092eso7923191f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066039; x=1780670839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQULYkqXtjivJne37GxmOPps34TMKbzDHgmdioeMwjo=;
        b=OiNN4bk4O4Dei54a8RA1QnugF1uK93ZfNc+8hK6wMQgNvqYSzKhkZZhf9/RtqG2c1f
         pIXaHhobyp5qh9cs/o1ea/mhGlg0NbQUMV8Gch+LVNP8QTtOmuJt/Z33C6N73ABNyFaV
         5nJPtJPHkH1Bs9uZo4rtf9/Ou1p1zTy2j5UfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066039; x=1780670839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQULYkqXtjivJne37GxmOPps34TMKbzDHgmdioeMwjo=;
        b=r2vKp/tAkhZ5IbvdrM0aZD8/vN/jcYzuykCfs/dbtnjnMbB1di6Vn3ayrrqll5vNUS
         8WAGbifZfcbxpcm0KpQHQvql7mn+VU2rxWzbRpsDedBWJ4ZhpfUcdcnHyRmHR1Yy4jKl
         vWLfMFK5JFaKO7lHZzM06vg459nBhZlM92wdJibFNYIfD+59HUXkgb9IbCRwA1L/P9pb
         /Ld/URGLc1ueiA1znJppy/FSPzIoIHl/Y7cUcFOCrFnQ5q/uKtecA9+sMbaBgIgeab0L
         aYWYnTbH4FZNdE5/0Z6j64+K1E3ucsiqY1Z+vXHWSXNpYPrwCmxSCLzlbXqoZaENb4qj
         cSjw==
X-Forwarded-Encrypted: i=1; AFNElJ8Dpyl/2nj19VE8pz8PAcaBmucdRfMxi3H7FQIehjmdLMDTGJApdOsTVu5CWhyQ7MbnNfs9ZJ7jENPq1dtQP0CX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ItLIQdtcX9T84PEf/dQYl3po084DlNhajS5nPQ1CRtpJKnXp
	TS4j/ZYtFYtwfz+IS0CaBQJmZN0U9klAUaM+21NI47EwVQ1EkUcu+pTHRqGj+0xsVeI=
X-Gm-Gg: Acq92OHaa7X1x8/hLel4bY4tHVjQMr3x/W6LR3cKAh47pJ5lw+qyByTXoz5YuLdhsN3
	wbuNPyfOVIGDUEeb9i0Cj/kNlen9jeDu6/nd4NTvxy2SHOBgnOXP91zW16JxrecFQ5Rf4IHLIeH
	Xz3CO/zcpSZEy29XyRIVBRUA4YhAY59tG/PSKbxgI0Xh5ubxdQ5zDb2WXkWJx3twfyT92xe6N2D
	qFke33a7N82u1weDAgwvKteOQHPUVUVeMKsbu2fe36hIWuLlbJbjDF071RF75egTa6aukQMvawb
	jKZGCZfsuJFZ/tCo98qPOcWVuj0e7p4MY7fGXrp+ltVMMNi8QYl1fQ1BGj1MGlRS8CG2Kga4gyq
	3908HI9rENEIMaMLKgmV5ffItew7IWe8ATfk+QgThfc2wknrp0YaA8VO99uA63U76GilNTWj+AD
	pqF+Y69Y83v8fytfFwFtn4O0dP8rdxQemvqKechaHTxfNgRywdPkLxaV6sEH6Q4feiZznL+WyHQ
	5mAOZx/sRgLiVUhwt64nWTbI5sEMqGjpA0dwfHgFBLvwXqrlCyXILdYI0M=
X-Received: by 2002:a05:600c:458e:b0:490:5466:8576 with SMTP id 5b1f17b1804b1-4909c072597mr59852445e9.1.1780066039269;
        Fri, 29 May 2026 07:47:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 02/15] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Fri, 29 May 2026 16:46:16 +0200
Message-ID: <20260529144707.3931919-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074721_241526_09BD25CB 
X-CRM114-Status: UNSURE (   9.45  )
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

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..5e46024d2215 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,21 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0


