Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A609ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DDgLAiuTXzY8R6BOnFwxchMXmp9+zPBlIoePYb2/ig=; b=gdc7/jj3tin305pTVpxlXZw/Tg
	dUfeS2wOZBH4YTpBHGNxP5otek0+3WTdfKRQELsMm8KmIhI337ONtnnXLIel2WNXR2L5mX9/ZTLGb
	7oj4tMHsJ7QEvGX/YJHox3lyZYqNf/cEW+qztsTpI3IfWFs9e6z6TGp6w5iQMzoi6k6BuVeKa8xF3
	hfBB9eCAYqko//PjDqHg2ChWGfbL5Gfh0QEnmJfQwK1X0o8wcWUQPf1QzQoUNzu1LU8hiaJWKhJuY
	j55uz/rloQ/rLK0b7H0U26bC5SQ8ds+9bEpbfCUY6wuSxpdiUvshkIhIzzPK3P6ks/dkBtPUJAkut
	bwWuY/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWK-0000000ETgM-0tE5;
	Mon, 13 Oct 2025 20:51:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWH-0000000ETeD-332i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:51:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46fc5e54cceso9869675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388708; x=1760993508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DDgLAiuTXzY8R6BOnFwxchMXmp9+zPBlIoePYb2/ig=;
        b=fMq/pC4As4D7VrBOoXJ9zLnk16zTkh/V4JbC1/X4r8tRmUy1+WuhtYFpR37Dk/nkZX
         if6gjE/qiGn+FgL9wvod8+SKMWodD+94wcTlztCG1/4r/377ZltK0CVTa0bXGWORE/ho
         mijr4IwyWvh1ymkMzqPI9qJbwmOtkB6GpRHPqBA4d4KwGBLG/PkvjWVMrU3/HF2Z9G5C
         TAAxmOKbZXuDbvYtBAtb5Su7TFP+JIhsOvL9l1tQpVobVgsAmpxwxISOwN7gC9nZa5kK
         GdIeF0T7fFWUF7O1zF1WDx8LmFST3I93IaV6uoBYWVq9MZTM94wi5GVx6d2JCLFjW/Ba
         gdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388708; x=1760993508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DDgLAiuTXzY8R6BOnFwxchMXmp9+zPBlIoePYb2/ig=;
        b=wiKbz9zYDWdP6BjEpfEsFv0eN8jmWvfWfGWhDORKyBp6A2KXKMJX4pDemgma/UjjEb
         QCocC88+46GsDJ+6zBKZQ9ok5XOqD5PcyxC/b0H/aNnDsomn6ctqRu1xjCbyVKZh3S06
         9hSnG4+48ZY2vt/d4LqcxvoCgh61HCmoKoh/ia/Ntv3HtzSrbV9tSJszKZ+eMh+iq/yR
         ZGi8eeHPeTq3tiSl4BIEq1RtW4JMFxeXEcasuKYh04vVZkN+93duoDqSrvOdv6ubrsD9
         Ydcor0zNO5QMWO3Vub9kwJNQ1gkDbiQIInmQEC9mFbGmjzMw/XRhmqU8wZKXZ/dL2GAD
         rl0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtDFQ39YX4OZ/6XREXDP7MC4HkTzM3pGt0fQjsUSXj+Kisgw8GxPM3gP4Qat47zYPyBUnxXqCoIIpXB8K9S8Gb@lists.infradead.org
X-Gm-Message-State: AOJu0YyRtBU5F4PczRp4Isp75r4saOtvQ92n+9V0a90lkSQJ3vf/FEw6
	FzNT9Qdh3SWgxSYkQDQmGkmorVEFdV4ZA6nmyxr6sFplDuoYh5WI6nLDgn97x0hXxaI=
X-Gm-Gg: ASbGnculH5a9ZwAFL4ClwclnV5oa0J+XB7zxYYvtTndaIo44iJrKWZao3W3R060lz/K
	49SeuSY/wPzrPLXP6lyoWbcooC3gtPMhz22bIiNl21X4rF9pzWbVnsqHsFiJdPh2/m/kbn9oaM4
	7+dloVHWM9WihhSRwY3SKygDAOYRMvzGduigZr6xS0benexZCGxvVcmFGSBzpvrt2zNB11V3wOj
	LlCbtIQl7qcBuow6fRZ4qJZhzsNN16S5rummENsZ8EF/uOMD4UwyP0ScPrPnpXzcs/gjcAHekk/
	rPmFqJlIxt4kXxBQSAR0xUKpR6HG9N4x2GwaL9NlN0090J54xyPnvl9f+bWcbRUP6v/jr7dSYvF
	t3QxLtLffd61lWlepvB8hu0sqgDp0CMuMlrIUhQegrGrLTQ/fWFupfj/ScZVfJ2av805tt1od3V
	mQ2wOLsafI5A==
X-Google-Smtp-Source: AGHT+IELN9yhf47V0yQ/Ag6le4K4Ap2z1yQxwUo/woxIruFIJKIX9OJVJMb+D4gfvG/a7yKD5FReRA==
X-Received: by 2002:a05:600c:540d:b0:46e:32f5:2d4b with SMTP id 5b1f17b1804b1-46fa9b19f3emr157010075e9.37.1760388708141;
        Mon, 13 Oct 2025 13:51:48 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:47 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:32 +0100
Subject: [PATCH 3/9] arm64: dts: exynos: gs101: add sysreg_misc and
 sysreg_hsi0 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=HHhcCaMHTmvzw7CLfISLI4i5MO1lY0C65c6w0STPYPU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZYm77RM/chRNqrctG1CL2KsrX4TP79II7qR
 R3dx+knfF6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWAAKCRDO6LjWAjRy
 utatEACGzMI7+hTvOKj04raOT4wlY2U+PRycjfuwd+1VMl0oIAbw3TC/BR0ikypgLW9GWBz524R
 fqNhVFX0FvtX9bZYy/DT1/jWQgFweq1++m4ei9OGJUvw0F2svuRkzavreEkhwJTHPI8Mh6Bvq7a
 +scuI9cEB93BBxm3d2NwGUYjKiw6ORSFWd01j53P+H38XTql0mL0Gfy/wbTQv3hrlFU0KdFUmxl
 g1f/e64ZDx+yle2K/p8cpPUpLMjjSetpeMsrVGOaCW38m3VnMADs2fux6kkClx8JJAaEORkocki
 ECM++yXPexJ8pNSa8PemcY1TD4VHEnEkudMjMBRChWc4sjduGoW5Lkq7ZzRT3Q3yFNp59J3MXBu
 MaWJGJDvC1X5qhcr2BTwUGWCB3TAs6+LY2YDibxlQqHyLofpeMibhSER0Gmc48n3jyTZBdY9TpZ
 25wvMBJKP2kCKSg6KhS1YqLRfiHSnLoroU8chpZKolUjsFHyOcFsxM01eu46ybegt0EWuQeJ5vO
 NjlmWPuuxTroAFCqnNbaxaZqbSjvGoDm7pmxCBaFViSDrL0h/4h2pb1N8pbLIoBBUoiu7lydBqk
 A0ZgWq5uP88ZVFSXZzjqlb1/i/tk78rYlVf/dZS9rzz2mcKxavpOFtS2+PgzNJplMYRp78pF3hd
 mUu54unij+I1hjw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135149_788997_0B4E86FC 
X-CRM114-Status: UNSURE (   9.93  )
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

Add syscon DT node for the hsi0 and misc sysreg controllers. These will be
referenced by their respective CMU nodes in future patchs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 31c99526470d0bb946d498f7546e70c84ed4845b..d1e3226da6472bb9db766926100a6b9855d7a30c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -295,6 +295,12 @@ cmu_misc: clock-controller@10010000 {
 			clock-names = "bus", "sss";
 		};
 
+		sysreg_misc: syscon@10030000 {
+			compatible = "google,gs101-misc-sysreg", "syscon";
+			reg = <0x10030000 0x10000>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_SYSREG_MISC_PCLK>;
+		};
+
 		timer@10050000 {
 			compatible = "google,gs101-mct",
 				     "samsung,exynos4210-mct";
@@ -1277,6 +1283,12 @@ cmu_hsi0: clock-controller@11000000 {
 				      "usbdpdbg";
 		};
 
+		sysreg_hsi0: syscon@11020000 {
+			compatible = "google,gs101-hsi0-sysreg", "syscon";
+			reg = <0x11020000 0x10000>;
+			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_SYSREG_HSI0_PCLK>;
+		};
+
 		usbdrd31_phy: phy@11100000 {
 			compatible = "google,gs101-usb31drd-phy";
 			reg = <0x11100000 0x0200>,

-- 
2.51.0.760.g7b8bcc2412-goog


