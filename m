Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB6D1099B41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=; b=lquUG/9B0SsBB5lQMvMaG9lRxm
	F+NKQuv9Hc5893GejwLtDW105d/Urek4Yo4e4leUs6Gjgr6beeHs3XeKXPRgs8HESjh7yLrg5eRnB
	D9ZYSEFoxKWp6lKW7uVrhRr5QGNS0Jeiac2sUGh0FykZ1Ud2qsgV/Cq+GVQ6W5i/FX/U38S/X/rwk
	ElPLly0AUXxc59MpdgEUtfN2HjJG7R2JQunkYWuHNg6Qm3e0VNWVTsYgfPoVBZXwb+qxEBRDcQeHI
	6JwTMWwzEqscLqMKEjlaF59Zr2Dl7PXL7ng1TQOeA6hQBNtGzQ9UeHTxMtcf2lKrE7BoFnfZ4hhV2
	j0jVQv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBy-0000000Db4e-2YsO;
	Fri, 20 Mar 2026 21:15:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBu-0000000Db3B-2rND
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 21:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=; b=XIPrDj32TlLbGD492jAFyNN5fb
	ezXAEEENFOIVZ3HstgLuoT7ACMAZReI3em7ijro4kiqTBODbHZShOLLTOEt7aaOu2nU5dGWJ+xuCY
	M/7MtxjgwI8TxPNSz2eKQcezvtsES1rXQA+KrY8VJS8Y2rBD4hknWKDAVF/wCERNlWbZOVnVbBQvV
	rj8kkeM5QXg03qMC8ngur0LTHbdG/Rj1Pic041ZvMyaXqmfMiGzI7rgI94MpBehnbD1HH3N8o0GRF
	zvs1QiUNbGAKWbkcFeDJNxFKR7V0a5jQ31pSx1JsD970ttK+9r14CR04kE0pXG2VwOzzL08C1rHv1
	58DqusXA==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBm-0000000GUTj-2HnO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:15:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso815335f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041324; x=1774646124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=R63Tb/1NXeRHowJkvEEVplKuIxPqI3ban01IEpXVWoFP4E6CZIksMZFOv2Y70o5FIM
         MTSpEwgODE5RnprAhvBm9neTtZcjcCN5rSO1FAuDABc+ReMJVY7eqIKV4WJTyh/79JU0
         1qfnRfmAUGNsXuvKC8jnwS1ZqYPI7iSrUtb6wx2JxvQxxAN5Pq19EO+dL6MKc9f706oB
         CsqVpzk6XkqVGl44BC1jiT5kZoB1xjgvhVQrikBZqN5WX7K1lzKbLHI9CGDgNEKQDO22
         bqULNR+enbdNfWCrYD0D19r9TGnPLPDuyeyfPXWiQciN5eJe0w5+c1MuUoo0ph3yb3lF
         DHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041324; x=1774646124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=Rxp49lITav8N3rI9JUhs6BhQK2qiX9y/RJYO1vjw72N+76S5bEsci9qqfEbL6dSknf
         JdFYNJ2J16r2mKOCLKaqVzPgDdQ+dImU4hBOnYTSEUnK/8YMh+H9ITH3IOTnjsfYh2Xs
         r8ExU4ZhWF8EIKQ1P/t5RBfckNpay+x3sAI5emw2CB2m3/BH32S0aKLno5MyktRkTSyN
         QJK74EOX2K3g/rRIvegMat4yeMHuJbRTyMjVHX6VfQQcHlgigzqvDzQzXXx14MmEJfpj
         E5/Es9BdACaoG2mXqI9GaQqYwc2fcNA2Dt7wf2tPgCFl4G6VCr64CbUqVifqc9FL7wBZ
         usGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/zTBW5F6eJVf9i5qC6awBcmaSNqJjNba+E7WPRrtummusT/1QRVSjpfkGlnVi5dK8NKNkR+4wf0BQniOAD44Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw52OIRsHABfWmSPxqvCCx9BuvAFnZjGkNvMk/F8Nzi2+J5Lhwh
	iIu90gyGQjHcNBU1wp1jAo5uj6NUqsiX6h83iCciysMRpw1BY855SuxvxkdmOe+CCMQ=
X-Gm-Gg: ATEYQzyJw5atZVCO51NIndE+swrxSaubjFvDueDmYtWlNlCrLua95fXHUl48eV8/Xor
	8jn0/hbsZA+3BdwT/Z9emqdq5xFbn0IkMkTqxmtYjUIglUl65Tx0kYMBs4YTuEW4d0E/fCr0R/m
	bf62TGL8X3bDaS+By7USvkxBYCPJfiAIVlHCOe+Ij7v4rnXaXxIMmFYcSoyT0OZUNVf4OffcudO
	XOCWUHBZYumWjlfhbd+W66QZFxvwJ8oDp/m66egRBGkCHQwzamL178taI1YTe4F7gvmW6B+5EEW
	OM/iuWjRru9pGtrzjJEm3BqrKn17R0oVARjl8EWsp1iY/kKtuYJtXSumHrm4a31aVhh7NxWQWjT
	AMe0EMCZgucB1ZS9avjkH714xBQV8zRumYSBryo3WBAsKkct5kYRkGjbhbkXBEa5Q/amPk1tHcx
	Q1rdgwcmLGM4BE8jRN349fZMP62xXJafAggHoa6y1nF1uQjphwPdGLGO1TiTo7EcUk3ZYcAU9Ee
	23R9Pt8I9BQ50I=
X-Received: by 2002:a05:6000:2dc7:b0:439:b811:11de with SMTP id ffacd0b85a97d-43b6424312cmr7695087f8f.7.1774041323743;
        Fri, 20 Mar 2026 14:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:17 +0000
Subject: [PATCH 5/5] arm64: dts: exynos850: Add ap2apm mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-5-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211530_477295_2AF03EF2 
X-CRM114-Status: UNSURE (   9.74  )
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

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..fcb665ccc7ae 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

-- 
2.51.0


