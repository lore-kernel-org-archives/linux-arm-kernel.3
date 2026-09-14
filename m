Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7258C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=; b=hgQdP2envlxOOOdPMs/4SgCX9B
	YCuaPnYYohN6CCnMCQ20Q845lJfnz6neGNepLkjVOm94djOv3aw+SikuBfYsT/jgDU5gwKPWl5rKB
	aBm/kPgezk/v8g8BqZRc6Y9lR+feVdjdPbNnksOUwhqtY2+xZ9sPpHnqEqHbKj/SjzZiZLrQWEaxM
	0bJ0zXaHk9M502Qd3oVPyfPlBgFU0460zvIkoVb6kofD7LDAUkuSNVsN0LsC5JYNrDdLlPPpOGBao
	yMwX1Uad3gpA3JBRxzJOy7xg89q2DMgN3Vvy9eJjDmrYGZENH2S7UotsQyZy/+4ipvkjJbJ39BmRJ
	/KrYNITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6A1F-00000004Laq-1BuN;
	Mon, 14 Sep 2026 16:59:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6A13-00000004LX8-218L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:58:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48702adb1c9so767322f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405127; x=1790009927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=;
        b=n736RnRAKH7YNhx0jz4r8e0coFyD8qw1Ws+1VzJ2j/C5OnIlandgmFy+vqyQhIMCn8
         raKJ30sg89UQ0zAG9ryg73l5m4UBNjr6bEC90swnjcNrhHz6kJ2gf13q1vWQkjZ4QIAM
         ZMtIZyIKckvRm2g48daIttOsL0vvv1RRJUnuwD6a8THFBV3fwhDrPFsO1RmNUxGip74T
         k+j2s1kb8bQqtqzf9VPzDA7HGuB8/v2HtX2Ace5ZBp9U+duJC8CHwi9zyCMV3k+7FPJG
         sCIQus29uUlrKNdG7JgVIhuSGkPPHq6ecQXZzrLknCPx6RzdCVa87t+invQuhxuTXgdz
         uXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405127; x=1790009927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=;
        b=c8FAkDkBhzl1yg6FRlEvzCYHBZgtPd81NM5LyOYi/IDnAgWPYRtLWhqrIr9irJdtS5
         O0puXryp2eA17MU6yOZG1HpN/ekjHPt1AVgz94ybgZK0AkI0Eu8Xk15YyqP6/RAb00vz
         t3dettbWguNezCR42xHKLCyI+U2zQqIduRXPCdqmDOOipTH8MZ9Na2Hw3HE0EV5J+JfN
         08fUS52zUwO3n+XN87hbdemjkAYdt60fW9jwGWCzj4r7MFdJWCrCqVFiPvsBHA6Cs74e
         hrWy41MrbCk0k6/3UEBieU/YDCRFk5tZXK1tYIpe/sA1XE6ekVRM625vDK8yKSNyuspO
         2ySw==
X-Forwarded-Encrypted: i=1; AKwUvBxQMxkOiN2yBFqDiujxuoKyObgxmrwc7P4hwRDYqnkxh9YbL/8ZMyLhrTNO6Kj0Kf5aer42TDz2vquFhoup3pRm@lists.infradead.org
X-Gm-Message-State: AFuF++kla7rO+p+oTb+AqzYBqO95niEtAIS0bkdn30yRBLlV7/PEvzuw
	zrSagVuh9zoqEgAQp+asGZ8ZG7UJ9e4CmTvdLVhKnW+NaP88c+w6KzuhQz+/lik9mbg=
X-Gm-Gg: AYBFou281VoquDjTnxdbJrPtvY2dTuOhPU+tKX7BoV9FfKLSsXtfx1E9WjkoeuNiQVG
	NcMhHxllIgjPclGqJlFSkvisU1ujALTUnyGw6kvkeJoqGQVhZHzxoH5dqZFqjucBPTsO0QvyZJ6
	cfp/+Jw1zyGjDkpSZbLkCWLD9iTqJ6XXJvMNrjaYI2shT1F64/kotSb+1KO9U+AzIbL6lEVsgzR
	gZRayXhoHJeEchMPhpNKJ+tS043VOh624HxBPmnJpk2Em2nw7DP8HTh3KeXg0fvO8yJ1MX32crW
	NkOxcZJ8Tz7jwjTajjXlTmmyDA+S8jjRYjIqRIDoU8dv68ACPxElYY6O1U6mwomwqGTJEaYJurF
	HAc0keu7h5aZyfBH/PZBJLXVwinh+VG85uqTjQs80riSrOszhu0RLs+M1hr3Xyvq2PV5jDnGIuH
	6nvX2hanAXEY2VDXysa0Xb9dpNrF/udwbPxHTPBzaPhvJ7eoDzdeVvyyumJNUqZHc00mQEiPY1+
	2H1mlSXf17uxG/+HNlouaPAj5apUk8jerdYq2gmN8df9Rqdk2Hmi6lyuJ5xG9s=
X-Received: by 2002:a05:6000:471a:b0:486:f506:2fa8 with SMTP id ffacd0b85a97d-48702ac2429mr4455498f8f.18.1789405127590;
        Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:58:45 +0100
Subject: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_095850_242582_E8A9B9F1 
X-CRM114-Status: GOOD (  10.19  )
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

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..2128749d7647 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -176,6 +176,11 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		apm_sram: sram@2039000 {
+			compatible = "samsung,exynos850-acpm-sram";
+			reg = <0x2039000 0x30000>;
+		};
+
 		chipid@10000000 {
 			compatible = "samsung,exynos850-chipid";
 			reg = <0x10000000 0x100>;

-- 
2.51.0


