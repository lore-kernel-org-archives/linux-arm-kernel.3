Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBABE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E6sD4irUn6sza7KpMORXxjiIv2gb1G9wQAnmFA2ALjk=; b=4zNQ9jefo7EezMLOfq5UQ87VWU
	gkKY/wUdPn+8HPRfCuMoczLf9rtjZHinxkhuoBrFizuD7U6yjTko2gWW1IqcyuJjPe9wK6UOfH2V0
	gak1bHrmpA5EMGzY74DA+5DU/aCiJ+Ui+76FedbKss447HrFpyJ4sBW4bKqrF97aOGGtWz9N1w+s0
	sj1Bg/Mly0DGiIipIIJ9TIjlQN4S97kL5IbnBHSs7uzn82i5HqyMTG75tQtKF2JxgLoj8KwDLV6P6
	z7KBG//gB8dMqm7ALvJyQeDJXbDMKD1Tnj2uPo3o1z5SPP5CmMpBE/J/GTVLjLI4n7mxUNuqgXVVF
	WBftr7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUocS-00000001hX7-349g;
	Mon, 06 Jan 2025 15:02:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoYW-00000001gi0-365Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:58:13 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so2418300366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736175490; x=1736780290; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6sD4irUn6sza7KpMORXxjiIv2gb1G9wQAnmFA2ALjk=;
        b=GzNPptOCfM2Mon67mJp3Ievxju7k0c0uatMRhlDxrUDGiv04l89XWsqW/YPYxYmmqS
         29JXud7i4+RKw/MtyxcTOdfv4RlWGmPpgOXWdkTJ2dgkqGpSdLa38YfKMkeVFXWrazEo
         vmp3qxlNP658agm6YbhtkuMNISrkriBcbyVPUjERttqthB6Kl6+Y2NA1EiOGb7iy1d6W
         PVAzSXjJN7FXX6JKw91cmf2avv5ceJDWOuD758XwKqbpYkKWB2y0MKoVeyCqV+xIldSZ
         yyuK9kkZJZAdft1+3X7K0EWU5PdI+cwjYBcybopRoTVinwRfH+fLHw1rjQQdOTlaIL/U
         nhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736175490; x=1736780290;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6sD4irUn6sza7KpMORXxjiIv2gb1G9wQAnmFA2ALjk=;
        b=IBy69ngikIt7Hg93ZbZIejQy6PrDli4su/HLzRuZJ5LpxZKuD8Ff3SY/9LemfM2o0p
         Dlsv7CZzgFmo9dQbWtaLkdIZ9zuZhIkVUPPEOuC+TDiap1GeGevDiGnIT3rQtZ9/ACXS
         aFYaGpgs4GsxLUDyzXSCnrPRd97FfkYHfgC2wGIDNR7rjX5UFZOXwop7a3tXoaC4vsk4
         gNOQSQnwnoXYsbyQsqRaaI2n7mlBfogdeJT5igN7ILNrYeVE5tMcDAJ9drbQJ1MSlPfw
         t6eUfvNHjoh31I1KNW9I4OXX9lGbgtMBIMm8SsElaLBGz2lt0gOp6TgirmYH9I2/ul6X
         7ung==
X-Gm-Message-State: AOJu0YxXPJMmTiTIM78iu4qp/PvyIhgBliP1htZwsvJLr7DVp3u2sn7c
	BM03qghWnjXhFFAdPaVIxBA+YoDmDLwCKl/67NXtLwuErqb1DHn8OuNM/7mhSE/q8mKH4dG4Sji
	D
X-Gm-Gg: ASbGncsJK5LscssFQORlYHVMYUmVBHB8ymiWSE4jynMN8JxIFzTvV8PLhOnSWvGLnaA
	NFdPx/4aTDnq9wv/fHnMfMq9BzdSRX1GtNshAtuWObZ/LSU0VJx2c0uxWNdvw2wXgYvU6kkWTiY
	zBdUUbP3mOBOm2OyBwj8F3FErNAmNeUX2w5ZHSecL0bnHB0xU+he4qMQXRAubmj0omxk8kH3YO1
	h9WdiJTBJlfGakhQz2I44uqLIQOMaumgOT1q/uXTJ7h/7zw76OMNLMC19ty7TwmAT1h17O8KqLO
	Yc7AccPy2qA=
X-Google-Smtp-Source: AGHT+IFRjFd1+Nt8YGyLxt1NzKlQHb+mqjSKJiXkaCf2qGD/U15D7dEyH+i1RGInpgWlzwlThJF29Q==
X-Received: by 2002:a17:907:3f1f:b0:aa6:6885:e2fa with SMTP id a640c23a62f3a-aac2adc43demr5147987666b.14.1736175490453;
        Mon, 06 Jan 2025 06:58:10 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06542fsm2244307766b.176.2025.01.06.06.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:58:10 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 06 Jan 2025 14:57:46 +0000
Subject: [PATCH] arm64: dts: exynos: gs101: disable pinctrl_gsacore node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-contrib-pg-pinctrl_gsacore_disable-v1-1-d3fc88a48aed@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGnve2cC/x3N0QrCMAxA0V8ZeTawdhXRXxEZbZbVwGhLMkQY+
 3eLj+fl3gOMVdjgMRyg/BGTWjrcZQB6x5IZZekGP/rgvJuQatlVEraMTQrtus3ZIlXleRGLaWO
 cwvVG9+DTuDL0UFNe5fufPF/n+QNep9VudAAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=iTH+glL8K3yAvVrgROMwFpjc482sAa3ddUjNd79KEUY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBne++Ayfv+DgCfSMMhGTSVWQwjtT9Z5GStmctK2
 QFOzFqRLUGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ3vvgAAKCRDO6LjWAjRy
 umC6D/9x2/8qLa7E6Cz5xYryQFkBzBayGVFkwIiFZSMO1+c94kaw0HYoXUTGlZ1RDNCgYeoP1g5
 eHbZG6eP8MUDJwFo79Q6Tq3yAnhjCbGaJO0jYleXBd8+pmASLeG+hgegtGkpRcF0SYPvDvQLykN
 IRBmAN0i2Ym13U68AcvRPXXcm/DOJxrnBhe14xC7qCztd+34dsVhcBvtsaNcVY/CEFAJo/fD7/P
 PNL92kmpmJ/g4LXwiCCLBrOq7HfDA4cfAtF1SG7ltI5X0mwRniCThqYh4Emeq44TBZtQSahxc6Z
 wOP2k3P+r1y9tCMjsIt5y81bPmm+yd6ZmFqAucraNRLLuA42tIzOKiHKu06FQ8TSmkxKr1ZkhE9
 Y16fGKXFep/gAnccy1j+u7dgXkARiIZavBNEqMhKNdMlkDiSwGjpZK1Ygx9DTEPY9GUnI19OuGZ
 /XxqndN0geGf6dqUKQeHIw4keC/MX/LjXu2SIEIn7PZDq/RjAdBgGXXQR1DrUx4e2VLCOPK0MV1
 r+Wi+GarJFRFAevKM0ydYpgQdaypuRBMxbQKhQi4+KVo4CJXHhJSIj8/p9kizqMO42R1TpvnHb6
 nvu5vxbT9fGGM0jI6P7msEN+PgW8TxupxkmTUiL/mTxvUMBy35cqybgVziwhmja41u10geT+fJY
 tPCcQxdhgVc4MhQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_065812_788706_090C07E9 
X-CRM114-Status: GOOD (  11.47  )
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

gsacore registers are not accessible from normal world.

Disable this node, so that the suspend/resume callbacks
in the pinctrl driver don't cause a Serror attempting to
access the registers.

Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: tudor.ambarus@linaro.org
Cc: andre.draszik@linaro.org
Cc: kernel-team@android.com
Cc: willmcvicker@google.com
Cc: stable@vger.kernel.org
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..b8f8255f840b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1451,6 +1451,7 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			/* TODO: update once support for this CMU exists */
 			clocks = <0>;
 			clock-names = "pclk";
+			status = "disabled";
 		};
 
 		cmu_top: clock-controller@1e080000 {

---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241213-contrib-pg-pinctrl_gsacore_disable-3457c942b0fe

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


