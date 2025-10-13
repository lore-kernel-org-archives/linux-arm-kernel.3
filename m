Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63664CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLZVAB4akpL6sbRD9sjMqso66AN9VFCmtPd/UP8H+kQ=; b=CNdYxC2MI852veYhLpEQ1et5yi
	XOOxQM2oZa3brpSLAkXJMkxLcCP/XDcHtqvLEn14RDovXFFyB78D0SvSJWgBhU9A1ubZpUdIKpgV0
	zJWFCwk1GT0+tZFS5Dmx10x7LRQ4ScRXvPWQxQv85A5BctdnHY1ioLGLlxEsrv+UTGglDlELBnMRF
	IPG4H9YLAOvvo5DQXx7jVxodI0TQJ+tCnekEjeZK0yHSYI6SUCL2PmSXVs/Ea32p4geWLV9WjVala
	4VPfzCWWVx6YsBuKdbaocJVNyqGt9qf7VD3kTod2FKDOQ2mujC64OkbDJIk2rlcjdP9VYQFvMvLOY
	wl/yJi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWQ-0000000ETtY-46P3;
	Mon, 13 Oct 2025 20:51:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWN-0000000ETnP-1Iod
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:51:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so46943805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388713; x=1760993513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLZVAB4akpL6sbRD9sjMqso66AN9VFCmtPd/UP8H+kQ=;
        b=Cd9oYajoC9e25vG7KhmXo0dKQjqkS0p3l87yGd1I/Rp2/IsHZl7/Zd88rMr7auyu01
         GvSTqJfctGpGDxYx7sWtvagi4H+j7xkntNJFv0dFDwyfblsJ1duq09FfE8V8smLcb/Cp
         qCKyRkc1aDmPJCMZ8kNhBCoF3tdkYrw8MqiVsujUN6GxemGJ3AwT3FMQTQqxDJsLSE8h
         7krg19r6J8wDVOuUes9A5LzUCixnTS2PFW/k/XNeado8QAsXs4Q6SbG6AlZl/7iNE7Ri
         b68uRYcmx6qngZAHUS/+p5bRaBd1/BLZX2odG0XI8Vyx3xc5x+IgGZbnAJhJd2RXI5gt
         dbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388713; x=1760993513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLZVAB4akpL6sbRD9sjMqso66AN9VFCmtPd/UP8H+kQ=;
        b=xCwshEa3ZYY9mgMR9nm4DWd64Lo3OoB/lH+2gw5tDHHZGtsR4Cnea1nWzfl+gkLDre
         Pl3t1IqpNXEK+fqz40YufhczASQTDxSdQQfJVVT1vdG++G7yZcIIxv1BL+2cEPGo8BDT
         AHhXTy3vsHUZzQxEeDe3zKNW1CzlCf/VvOJ5KUYKGAS+otkuucAt+gQ3p1YJFuxL2UFc
         G12eBBoNHzf86zVv4H+x1kXkbkPp6Tvgky9pNzjO+VLEF9J8H67t0AhnxFfH1w6MJk/c
         68E8zYl4SiX7HgtcJl9XFJd7YyjLWR3sGpyAxbha6UrNsCYFbL2vW79o8CaKxEfwzlx4
         aVww==
X-Forwarded-Encrypted: i=1; AJvYcCX8A2QDPhIqF0A2plC/8ZCBAHSpW0Ih2kWocMq8bIVKE3R9WTxz3Twk4RVN7FNVITkRGjEalhBzr3fiI5bjm1rp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs0rpdhMdDVIhq4IvMTGBBeZygU3+k+dR4YphCJBPlH0jDAxVL
	0uPpMH68oMTCCM9Bpi1iM9W6y9j8lA7K0WMrKDdoc+y5sQPn9iXL/kZ7L6MFFoJRdPo=
X-Gm-Gg: ASbGncvWphaFLeqti4DqPECM5eTn1u6PDoJ2lxg9KCvJJPH8gh7HAim1KcB8B8KmOsL
	Ug7OGUs91qelECykD0dTHeVmnkBmUNM1jF40MQPwNUdcM+mk2FhZaSneKYAKc0596KGh1JZ2T56
	KzMZI6BQ3m271oZaAWxyRV8oQa7tT4wibmbe95wqLdgL+2K/a3vObplNOqJ4zHWHoPFVMEjJA+8
	q6rJ81P4wLawwbd27Hpc8fMsBH0bT4dzOxVgjnKMzXhDQr4WeuD60C2bm8auKORTgmJQrDE/OQb
	8lecmQdROsSilSBIcCiOCcNVdFSRWOo2JBLKurfJMLId/ihmY5F+QiqrCGe7ddmvWTgicw8O8C3
	/XZQNYvK/P8p2wLfPjMYSpvY7OogFr5TROBhKksCQ1hejyd51RYVANp8UJTysmhwtujdM9QWmGl
	I=
X-Google-Smtp-Source: AGHT+IGLquRNwbSBxeaKtRQn+InjdLBSfDT/oRT91BBW3oh43qrtNPuOuXBni/cQqnsMwhMF64WhSg==
X-Received: by 2002:a05:6000:18a9:b0:3e8:9e32:38f8 with SMTP id ffacd0b85a97d-4266726dceemr15446311f8f.14.1760388713482;
        Mon, 13 Oct 2025 13:51:53 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:53 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:34 +0100
Subject: [PATCH 5/9] arm64: dts: exynos: gs101: fix sysreg_apm reg property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=bAE97azgYQAhmWtKU8+8+yqGEn7f2/ot1bZbtYrS+Pk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZYYmJZ8YONtySkBG/HUNTVydzl5bgMRMGRr
 qWszbbZnViJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWAAKCRDO6LjWAjRy
 umR9EACMEsA8OD7G3hLHFLspQRD/IOXCZ5eytSYfOI2ddJChBcnhWKTACe/Vbpqvez6XcyYt81X
 GmrTlyWhQbunFVspRlSPeILc4GYLllyGdXrUBXVbN58apbf7W3NZ1EBB7gmonHVrjSypCIONXLd
 b27BLp2UkuvwHcx7aD+ODzdbNbgvIN9HmlbDMtrpcF9ubfIK3HZmBwxLxe5/o7mcfZbIAAqKpBa
 i1dq9gfOe9INP/BYlYNjkEj6CJPuLFNWDxwc0NufLc2NfeqmeOIx873p0kqTZcZBePWy0KV6CoN
 TdccbhoutOiJKVYdYdev4D9m/u7vijeb5dXnh9LbXslbF3g88wEgfYu9DdMU+5OpBFRni1RC+Ji
 sv0AfCYhg3mheB4+0K29PBo/MogbPdBtzu85fITfiGOkDg4Xn1bEy15JGXFchaxbl4BtGyDzb4w
 1Qt0VWA8BDBrbpm+lW+WUJNpo3dYNFA3yJFyY5X31mHIqnAWQmhGMJqLf1ERzWLG6nZU81iOibw
 nuxAgb66x1aVneQVYA/3kILxbTkd9AOUICwK+fazWWP3V8rBKJuNeyzJHwzl2cPSqY0dMQNKJfh
 WRlShcCYi+UvirrOt1URjnBvTRDctgCGnmKk6FwCNmEc7G9vcFgn954ZQ6/ySUSs0LrrV3fLfOz
 JEA739XWyEP617w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135155_424435_038D179B 
X-CRM114-Status: GOOD (  12.16  )
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

Both the start address and size are incorrect for the apm_sysreg DT
node. Update to match the TRM (rather than how it was defined downstream).

Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 1ae965e456665bf05aa1b08269b5dd66b46d200b..ab66c055e0ac157f89a0e034f15bbe84e20a7e82 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1414,9 +1414,9 @@ cmu_apm: clock-controller@17400000 {
 			clock-names = "oscclk";
 		};
 
-		sysreg_apm: syscon@174204e0 {
+		sysreg_apm: syscon@17420000 {
 			compatible = "google,gs101-apm-sysreg", "syscon";
-			reg = <0x174204e0 0x1000>;
+			reg = <0x17420000 0x10000>;
 		};
 
 		pmu_system_controller: system-controller@17460000 {

-- 
2.51.0.760.g7b8bcc2412-goog


