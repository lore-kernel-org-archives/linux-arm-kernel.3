Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A25C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f78YX8Jv2hkXlixOcjovzULMHQy54ZDO00RkiEOZMLg=; b=Ak0oJ2GsRCtaupElII6gVWDKPI
	39AWXqrP+EGz9Umhv/NSDuNtEP+FjU68UVrKcXsR5JTmiW7eda62lPUhcOqkxTwnLdzkxIUa/BSMF
	LG91X5ItMjSlUUT/isM9r3F3t+Q9+bjcepNU5QDTUV33fllxZHKqC5JFz5ijAhrgSoUvYLfBRV5eT
	YGeS3o8YtlkeRoep1Hk56EBfPAAHCT2VsWD6Yorp+ZhPFmNA9DwiHvCaBSq1ZtCqy5+sOBxhDA5uV
	cQIGCm9mJ69pTJ89IPcNdrgkcrs5DYU9B5E1SAJLi5a2TsaKwOc2Xm71814XartiWH9JO3nj1St/M
	2+4Zp/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToRG-00000003z3d-2KIJ;
	Mon, 23 Jun 2025 21:10:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjmj-00000003NGq-1HQI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:12:42 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-748feca4a61so2398544b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750695160; x=1751299960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f78YX8Jv2hkXlixOcjovzULMHQy54ZDO00RkiEOZMLg=;
        b=BA02P+bfCfzRYqhzKCfSvqv/BoPjAD/nrjAHKky6AcFD4NL4qtXlzrY5bqt8RezFev
         DfRi8JnCpC5CdtRPbumIZ8t9tnBVJbvWkTW2ulCnv6Io3ik/cYgpy/qtgFinGztEA5JZ
         6o8+hsE3PLwfXVCbyWnSU6eNEhE3isUqqaS/8LoQ95dFRlGegS5iXuYqjCHuP3m+QPGM
         xOR0iQiQL5+pal0h0d5gQte5FtRgupujqY68NawYlJKpQ9dbBn+B1u+o1wmfc9182f8J
         xDxgwbY+r48ORJdKbuvjwdWH2ylsYSb1Sb8DZBAzBhVSaaNT7lfH5IU0d1FMOYPUV5KV
         Cq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695160; x=1751299960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f78YX8Jv2hkXlixOcjovzULMHQy54ZDO00RkiEOZMLg=;
        b=I0vWJUXD74s9CX7qBFUj5FZyBAzg9+Ap7NQpySPNQIxHd5cqggmK6MyKXjyu/FabO4
         lJTduSAZA9/QbHn40jAmtBQr/AMkERfS//4Qxk3JKbXb/zGioCidyUZVMX97jEiwH2/f
         hNv5rBzgDEkxNjnZqtV2QGm0hC57HnTU5OTyTin6132xzq5XyteaVIWRr+PvZsN105aw
         EyDZHx+SEoKPPkzb+FWQxPlbD/4dX5HYMfn5rQSGC6LiARMGq2hKeypjO8wVUHrIRh/7
         lvb1ds62+TYl1c1tG1TCyks6JTIJnMT1t1dAq0S6QtCOrFlauI3fuBNwWhvdik+tkEy1
         aQ4Q==
X-Gm-Message-State: AOJu0Yy02ZJWUteFSJYuZ6+pJRPMFRs8GtwTIQllQi/tuaGZccki72JI
	0StW+/0/lJv2A7pWsg0z0EZLnx8iY3DN9tlvzjWqTUpTVy4cQknxrhNp
X-Gm-Gg: ASbGncuQN/RWhbhOjomdBYtO3z0Dbes5r5hZKJpRpLJj868AYdattk8JIH2FDv7Clrz
	geLnQLQsPx4I/tUPHxcoTKzQr3yA5nKhlZJHAZYsqcfteIsuaUz6iB0JrFQpSmae1mnZGeEUV97
	IhFdwTRnxIyqCFD+tDruj0LsyltpbqH8B3cy1Xm/3H0cUwNci7ASczpXyhYJdSSI8VEgt8/5Ka1
	Xt1AF82uuq1Rs17BL24CXLUHtnBMK0W+2AgSZz5uap2CH7Gf23V5JluN6Ys5iz7/muUI82UWPGb
	0Fg1oaOqswgdZyEJmAhWSK0yIpKhJF4OavQlURBS3yP1DB9L2FZTK2148nmLyr+X5he8N3eNdaF
	Xjlj7hweuCk8M4Rw=
X-Google-Smtp-Source: AGHT+IEQFD7ncJGbn/pBz/+p1d4K7L7mh1a5kN90gM3aF97um4Xo6JRQuOcwRlaKlzaUrBNsaYvNLw==
X-Received: by 2002:a05:6a00:2e18:b0:748:ffaf:9b53 with SMTP id d2e1a72fcca58-7490d723218mr17461031b3a.16.1750695160533;
        Mon, 23 Jun 2025 09:12:40 -0700 (PDT)
Received: from [10.22.1.180] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a467e6dsm9029608b3a.13.2025.06.23.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:12:40 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Mon, 23 Jun 2025 13:12:27 -0300
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62p-verdin: Adjust temperature
 trip points
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250623-b4-verdin-am62p-cooling-device-v1-2-cc185ba5843d@toradex.com>
References: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
In-Reply-To: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_091241_355959_A2B4480E 
X-CRM114-Status: UNSURE (   9.32  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

While the TI AM62P supports a junction temperature (Tj) of up to 125°C
for industrial and automotive parts, Toradex Verdin-AM62P hardware
lifetime guarantees consider a 105°C Tj. Change the passive trip points
to 95°C and the critical trip points to 105°C to be compliant with the
hardware specifications.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 226398c37fa9b348b8ea30e1e21f75e98bd3d60b..7676b24b13f67da81245c023e0fdc27294efec82 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -848,6 +848,30 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
 	};
 };
 
+&main0_alert {
+	temperature = <95000>;
+};
+
+&main0_crit {
+	temperature = <105000>;
+};
+
+&main1_alert {
+	temperature = <95000>;
+};
+
+&main1_crit {
+	temperature = <105000>;
+};
+
+&main2_alert {
+	temperature = <95000>;
+};
+
+&main2_crit {
+	temperature = <105000>;
+};
+
 &main_gpio0 {
 	gpio-line-names =
 		"SODIMM_52",

-- 
2.43.0


