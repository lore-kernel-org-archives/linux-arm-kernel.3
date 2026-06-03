Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91178CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CHFXJWllu4uJF68Bw9JG2hgsYU4/gKpRVjeTCbVOFs=; b=u1eUlkozXkC1Qk2E6DFkE5VJ5X
	BWlpjDzFxl9HyJWF0KQWNDo1kYA1BVtOdfPKXg6W0er8tdvJUUknn1GVQup7WiW6hgNlDx2B+J2I+
	r49kT38icZdgjLv1CYNwmPi0jQedisJ130/0zLh3UJl0WN8emWjsgFqmTmpDQStzNi6+zMRpSRLEM
	rwxnboWWiJVEUWQUU0ewV3ls9zgtQW9GoSnMVubAzjRZUU8HGCSdupkmbFHjDyikk2ia1xq25METc
	X2onuj1dNBV5mfF+NGxn7gtyhve4GfWHjpCapohS2JoDJZRg/J9nj/NopkmK/PtRCZzAHIdkIvD9a
	l82GnXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGd-0000000F0Ts-1H3k;
	Wed, 03 Jun 2026 12:00:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGZ-0000000F0N2-1hRL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2766342f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488010; x=1781092810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CHFXJWllu4uJF68Bw9JG2hgsYU4/gKpRVjeTCbVOFs=;
        b=a5VTHgtQhQYaa+Qbph1nDWE3EO/s8mEc3y0CaFBvnKcIlf2OTLbBCqtHCIXAVoqfHe
         kMiASzDOEBDNUu43UbmihW0AKN0UmzJh+VXr0W5WZdMYX+jaE1dNNvQgGaOuHYfprccc
         lhJvwxIZ1qH6Mr2gCPRRVd1FFb35sriklgEH6Sk3VIlZLrXwT89/SuLYitIzcWyndDI5
         +8OkCkbqlD0mUlp+OtAs7SZL9JHs6LqSxuTFbpjQQ+OKmOUoIr3ogr15UJ/pLBcCTau6
         E8+gsUwUSMKP8MIq/AV7BbnEiaGTCdI/QuRGTATJFZ7lfJGxlb5MpqVP1M6plv++vV88
         KwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488010; x=1781092810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5CHFXJWllu4uJF68Bw9JG2hgsYU4/gKpRVjeTCbVOFs=;
        b=SbNLrC5sKpjOxDdVemrMjTMNbQSUP4a1Kr9PwotdMflgulbi0dYFLeQw1l3Jo0plLP
         9GPNtqih2uvsB7VhCapHJgdhOQem95G5+Ayw8N2FJrRZVD8hSS+OjA3IGMQ502GxjBvu
         9q0jsVFJJPb8GjUiwRVSDV1kfhE7aow+nGbR0sN7CQV3477qiAVvurxw6zKhEbb+wgnm
         tFzITP4R0Ls2GTFfMoeOUQFLshgD15iGr5xiS3kmxHs7oKyBERg43xU9CnXy4f+gELM8
         /eenMtpuzPZCvjKlFmeNZtPmbWqc1QlIqBoTL+ZzDDt7rfoiEzsnNlEjGYZgf4uV/9ES
         bUxg==
X-Forwarded-Encrypted: i=1; AFNElJ91SuVd8/g09BGa5LO52WdI2uqWOURESM7GcXJIftsThaMGGDUHKz0+nEF00osxNh8uij1PfKtRelmlmfobuxIW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxne+110acECTF4/fjVhZS0vIX0EKlXT06evoT3l6X9OdcEFNZl
	bRV7Eco4EX1oRlUc+pQwhNwBrfFI84RTG1o9WluD3lZFJLbgglqzSQGVlMPQ1A==
X-Gm-Gg: Acq92OHiRB0c0ZcUQWMJzKdefzPH2SnaXepK+GfzmZclBEqSZGFPXPqNjRiBkvKjppf
	QfCW5oQSksSJ/Xfykko0I7xcmcWetE9o5EpNblTobKNJk5eWRNAhMOT1zXWQxFlH12cDvgSoHwM
	flDDmT35TtBlYgcCFWLXMEnd88Si/ncW4Y+6os8vSkoPb63v7MbooEpZfrQDP7GyZYuzKZ8QFF0
	PDzL8FCN42kEMZYLndfSNzw/LVZTzCMKrtyDldBaco+bX272USP83cu8TtTjigC5xzI+ECNBEfz
	eKW6RjTL3kl6dwpgVBo8TXn3EBhSBdnCItXnZMvCnpL31K7DV6jyQT93j5WoPOw4oVJ+0l1+Pcg
	agDUt7qMRZx8a9Sl9e/5eWB8ywea9MjRDuh9B6Btx2ZXWieLKMGjvWWD7bkUO0v5X7XT90TqBs9
	p2+t0MrLklTClp8P2DqzzLZK7a1yzG4hDOIg0x1jQ/skKaQ2QG9ejeEtAZva78Vx9fciY7rgmF+
	TiTaTh6fEEUJ/cj0OClImTiTRoKyqCzM9FUnHXBD8fzKFr/93qIrVPC+zA=
X-Received: by 2002:a05:6000:707:b0:45e:945b:276 with SMTP id ffacd0b85a97d-4602181e987mr4347469f8f.20.1780488009730;
        Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 09/12] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Wed,  3 Jun 2026 13:55:47 +0200
Message-ID: <3801266c8e0fe7a7913dd2e376d1d58001548f84.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050011_469244_3E7F37BD 
X-CRM114-Status: GOOD (  10.75  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9622f77f8f13..df4409af26a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -321,6 +328,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3


