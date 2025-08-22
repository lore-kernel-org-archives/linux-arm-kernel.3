Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD94ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6N5Z6+PPrN+8tmcPK9l7I/hMUuaNCiAWjah4ZlXQ5Y=; b=0OB6pYr+NqjkX+fMryn+N0II/B
	gyCZgpN974TsVqwUOfIG+STHvo1HARHewAAeeiDXou0F8wRpPjCt3bNBC0I/zLq8sXgykutYHJsqD
	L5zXaLMG/5ppyL0k4F/h6H9umTqQDrAAglUkAsTrsa59n6jb2PyPlsOlNhDB0okGlEa4WA5mgxmxw
	vxZlKEYEUZ7hfYqA6m2golSi52ZTxLJSB+Nq86Qe+6+V9le94AhYIspshjDBmvKiUnlYgMl9Ppj6b
	hfdUzTZVhV41Lcw6GMo3CL+i5l+XZXrs/SzPFw/pao8EdDhaFLrGI1mv3XyUZuq/LHqvIEqo/1Qis
	aZ8eVQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphk1-00000003wKf-3yXo;
	Sat, 23 Aug 2025 06:28:41 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQfC-00000002RpH-0WJ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 12:14:35 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61a54560cd1so229563a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864872; x=1756469672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6N5Z6+PPrN+8tmcPK9l7I/hMUuaNCiAWjah4ZlXQ5Y=;
        b=UnuEPc00h2mUnplX0PXkOnEEpNstGAHAuy4yaaygwymL5VqAXEfMl6TykWyBAC5psq
         JtoaemCsOwzqLYLZ2+g+oYEtcx/LJuJzCD5ncJperFPQkITPgA86dZ07oJEXLAo1XKR+
         YOCc6j0XzlhXs2u3Sz/0eyQ3+DegeYTfZrhalxg4k4Eoe5m6LfWLSV7dOmE1iyVXZARG
         +7p24GIkLeeAQFb3Bu4xhwaLQVnYKLcAkFWbD77owKYukpPgiIdw/aQgXoLs5Q0gkAb7
         tq2VgKvwnzeskSlBgCFNNVe7+D1V/Amsq1frdv5SLP8JWq/a2jT1cX9aFzybHRmlPU47
         uQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864872; x=1756469672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6N5Z6+PPrN+8tmcPK9l7I/hMUuaNCiAWjah4ZlXQ5Y=;
        b=enkVbybnQnLlaDOBG9t+tQHywNMXmcxcIUeBsUh3vJlsPNpR51xFgjwOKT+fCyyMBe
         zO2srR/aKyVUb92UMMbX31A+RuNlk+WAKuKAjeV0DPPZycA7RS6UcsQqmZXcqHQBbRfg
         Jk3ZBR222LoIUMLt+/iC3lWxTisWZ69ZmuZrBXqry4YpE6m2Gu74sS2b3HYr4vMETLK6
         uD5ErA05cTqA+B1ZKt4Yma/J4iKFuBjS8uWAS/viyee2yNghBYzpi4KY4IkZSF5LO+yG
         EY3K0qStafXZ8mXfg8wLNWK39laYf7y2+j+V1o6WztBm4JxfCLPlmkYvshLCcZlzrOHi
         acvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzD9Uk57g8p8RfXxPk/ltjkBNwyJ9l1eQTkMaU611a+GxjgcPaIpVKz2Hn/r0iqBl4tTA6RTnMH5ybrVClZ6f9@lists.infradead.org
X-Gm-Message-State: AOJu0YxUEOKuNbBYoMtJ3I7lPZrgCehgyeLcIy1JAcrSF+6KSM5c3yNF
	T4OPAixKKAmnlRmgLHeDqfDhcsvkFbwBO2D6Nf6kURasB3MXiX5Vlk49Isf6LxfHTrA=
X-Gm-Gg: ASbGncuTMUZCsuA4UWQd3iA+xd6LqbI/mxxFkYum//XJQFCV8XGRZDIhz/mKiJd3SE7
	Fs9pifWI5oaOP0uL3aCa5NbHC/VvS+zBwAS4sM3WrnR8kZtczbJf8d8PgIeY9V7v+C7LuB4aLHM
	m/SiKCkylNNt2UNXTTotg+SISn4zbT8r3fUi1NH1rM5X/GVaTZuiAl1FE9MKhY1YO/NJsm4xvot
	42KHpXQdUm5sY8sRDW0m+GOG46B+T31kZW257YYnxQH8qgQUHppTglhJJDzEiEFU5M7n+JNSxRW
	xTt3Fu5GcHFcpkBAhNvXUfqRKcgvF6hf0Pejt5PzkSSuhfPNtXNkcBG9xZVA2euwv2aiEWKNv7d
	No1uwiRliToghXhNFMV/cahdJVMfj8eRm8Q==
X-Google-Smtp-Source: AGHT+IGIZr3bIv6eaIbf1dIX960O0mePoQhjaIFsVAHQscZR6OAVAyxebm4Tv8WtSLatPWQGfRyMPQ==
X-Received: by 2002:a05:6402:5112:b0:61a:8b68:c01c with SMTP id 4fb4d7f45d1cf-61c1b4ccd85mr1211548a12.4.1755864872537;
        Fri, 22 Aug 2025 05:14:32 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778c5dsm6842065a12.31.2025.08.22.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:14:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] arm64: dts: google: gs101: Add default GIC address cells
Date: Fri, 22 Aug 2025 14:14:25 +0200
Message-ID: <20250822121423.228500-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=o6g4sH8xwOZxvS6dJ9XIqGAPSYO6MiZyEWLPUzyiJHs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqF8gR1nb5IgNLVHHNEvXLhk3sUV6XknUzyyYq
 M+ZiJ8wRp6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhfIAAKCRDBN2bmhouD
 1/q3D/9o91Na5DN7pJ8BWw5OySzlA3p+PZZCA0SrZfmVb/+kEk3YlOsfZM0s0U/Qs1HgujTv94W
 X/e1SoQ5634ngY9XzVi5L4paRCJJK2NY5hPnYtr+HbdnfQPi/aDVHkbYupYtwB98OmqXZFsoiLO
 PL0Jzuju3EPhY37SnY3nSvnY2gbSywewrj0bxUiIw8hKlrAZ9wwxdue3XkszAFvCj+KsUWr4uER
 lD085qYnarxWchBt3QeZfE9OVIyKdHe75Pnzkoi+9VS5LoiSAVCcG+K6AxYQihZcwvRJml6ytI+
 Z9upgrNHt4CWOLYW/zKzvFB0HpEXO6zUh5Unu5Vx602PF/XbUYqzqsBK7xQLlbj2CcQUREdF7ll
 4RnnGs0TpdUC1+1SX4TTIG47toGnNFQ6kq018BbWrNERIDKGPQehNFJ8Vzraq8qO9vBYfl/X44X
 kQdGdJ93jKHKGzcL4raJZo30tYwy/rHKbOVCkQWZ8fqF5NLR3n5I/y1DP4WxdnVbqKsWUBDSRM9
 YR5iJFOFbPkiIzDx6KSOUCb7tzUJY6hjCuZBAejjdzJ5xrFwATUhoQpeZ1sZaZmk182qyq6KDDY
 E4A0cJSgsqP9+rq7W1UE2Mfdl7JbGR9z0r/aKjoA2STmCXX9RqvOXH7IFhF3FJM46BghM7Fc8Ha HiBogtOwSFCZBYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_051434_163905_F5CF84E9 
X-CRM114-Status: GOOD (  10.16  )
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

Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
because GIC interrupt controller does not have children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c0f8c25861a9..31c99526470d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -341,6 +341,7 @@ watchdog_cl1: watchdog@10070000 {
 
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
+			#address-cells = <0>;
 			#interrupt-cells = <4>;
 			interrupt-controller;
 			reg = <0x10400000 0x10000>, /* GICD */
-- 
2.48.1


