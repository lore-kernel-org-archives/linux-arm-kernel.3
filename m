Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDB9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UZ/rmGzncsFVOVpELvTtqMQDv8MILpBfFA/LpGTbzeo=; b=0i4B5v+F2d9RvmphES48fNVdmu
	5ID5QOHx/LZ4dzllPgW9thnrH1XBfpA3op9BYwFc0EKHMht31mU8zIiLnGMUUX33ktzKq7/6VgCYd
	0hmHZ9T90txc9IaCnvkcomnVgV+44Q8VhDlHeI4YXg3spufprr5XRIZthYBms0cRggxTgzGE3XZzW
	t1mMw1tNTvEY2Jb53QrzgbnBD0EGOCphReTRvXwZbYF6P8HywZ2Uj2SKuUgto3f4N9xDllynYoGLn
	cjxYPLgMT4yShwi/IRUDY1DdAgWhU4MSCs34q/BG4a3U+cEN6TN0fmWywQYE/8EthojNOlt8dLqFk
	G89fjVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJa0-00000008oHQ-0mEN;
	Wed, 12 Feb 2025 20:43:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJYY-00000008o1z-3Fx0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:42:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4393f97e9ebso208485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739392921; x=1739997721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ/rmGzncsFVOVpELvTtqMQDv8MILpBfFA/LpGTbzeo=;
        b=se049xMBZRQzRUFzHId2kE/no2byi4h/b8PDrmtNFYIKjjFdrbhSmMswtqCpoC+WiH
         yeWpYqS+DB2nu+c11o8BpcAe08UgTfn8xuWzBQnjBKkLbJK31xBleXsXpnMgCmp35XHH
         ItIlfgDiB9UCyb+ymkyighVQcuE6D+QsV++Jk19jE2sK2CMVVM7ypyn5JA0WSaClQAI0
         GFPAVLZS1j+POnDmI+TNhC/d8kOMyPV3+gsAyKJcmGVkjNg5j+YMsTknLfVleoCWig1R
         OAzMcggIUmx33ITcPl65DirXFmRJx1fFSm0U3PVL3O3gKSdU7IUN5LZLoYjnYPyvBueF
         OGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739392921; x=1739997721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ/rmGzncsFVOVpELvTtqMQDv8MILpBfFA/LpGTbzeo=;
        b=mKixByOcNjRSjIN/eCwES9sRll7oXU6NMz5uCcfu/iOWjoTeSL5xMLBGgTK3dUk/a3
         04VEkrNj3Efl3jRy+CRWEGZ1gV5XM9iFVY7UYlMoPQpVODOoZ3US9gdRVBIzPO64/26u
         wQI8eCh4oUbsC18Vu1iDdokhDKEB3+c9MCs6F4hH2PrgE2dd1bzpMvb+OoeG1odabvZt
         o8qzk7kcLzHphzxJW3zECdMNQACHSK8CO+XUwOSpBqj9hzgfUf6Bfvh0psnQqJPTtr1/
         yP1DRSLdo80pBxwEmS3QuDgjK2N90EeRN8tQQOB8wRScAL+sUBECx3vmx1UaLyapuJLF
         64UA==
X-Forwarded-Encrypted: i=1; AJvYcCVNM2ldKgbGIYx9ii6XeI35LngoepRoTyIJp1hGAbIi0PONmqopbjGtrd1+9J4c/Gu0mZu3bvyTjHMn+sj8bOjL@lists.infradead.org
X-Gm-Message-State: AOJu0YyAdxTZkirT6txRhxZhkNteQP3Od9GSaGNNvJaCJqVvsNXqHYKz
	af1D9f2ki6mxVau+JQHd6ifESvZMu/Z8rMO8kV4xCfAILhHnqOJCKMo5ReJ3goo=
X-Gm-Gg: ASbGncuBrEksMG/z+FzXA8ZigPTXZdw7y12kXEJZ9zmvOawtSBF1y9oK5XAK6qTWcMM
	sPnwnk6ASildP1jA7JZCb3YCvyzwCoAkXECsUhXFdX70QBeU5BQEQ4yC0uex8BcDWDCpejiTaH+
	7AY4NMgqWvvKo3eGYejfqzlJq7SpvyMMF70eb3SUwnw9FsbbBtuHRxrADCb2R+OLgX78aJV9jDf
	7gp8xCPzMItHDaUD6UCZEWp5bENxSQWCaXf0SzR0m7CxLkGraRV8lb8WrJqhS26uRpvGJ6hIaAN
	qWwFapkZciDm/qqFAPDyfIfACCH1hg==
X-Google-Smtp-Source: AGHT+IGoPR2Drpc4wRwddj+6Un33qP+pZ07paA98x1dyqW0bfxx+Hf1EVCbq5JjVdt7OJuqOXUx5Nw==
X-Received: by 2002:a5d:6d0b:0:b0:38d:c2f8:d945 with SMTP id ffacd0b85a97d-38dea2fa9b7mr1563975f8f.13.1739392919603;
        Wed, 12 Feb 2025 12:41:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a070ea7sm29818865e9.25.2025.02.12.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:41:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND] ARM: dts: marvell: armada: Align GPIO hog name with bindings
Date: Wed, 12 Feb 2025 21:41:56 +0100
Message-ID: <20250212204156.57261-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_124202_820560_058CB367 
X-CRM114-Status: GOOD (  12.56  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warnings like:

  armada-385-clearfog-gtr-s4.dtb: wifi-disable: $nodename:0: 'wifi-disable' does not match '^.+-hog(-[0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi | 8 ++++----
 arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index 8208c6a9627a..7aa71a9aa1bb 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -453,7 +453,7 @@ &gpio0 {
 	pinctrl-0 = <&cf_gtr_fan_pwm &cf_gtr_wifi_disable_pins>;
 	pinctrl-names = "default";
 
-	wifi-disable {
+	wifi-disable-hog {
 		gpio-hog;
 		gpios = <30 GPIO_ACTIVE_LOW>, <31 GPIO_ACTIVE_LOW>;
 		output-low;
@@ -465,7 +465,7 @@ &gpio1 {
 	pinctrl-0 = <&cf_gtr_isolation_pins &cf_gtr_poe_reset_pins &cf_gtr_lte_disable_pins>;
 	pinctrl-names = "default";
 
-	lte-disable {
+	lte-disable-hog {
 		gpio-hog;
 		gpios = <2 GPIO_ACTIVE_LOW>;
 		output-low;
@@ -476,14 +476,14 @@ lte-disable {
 	 * This signal, when asserted, isolates Armada 38x sample at reset pins
 	 * from control of external devices. Should be de-asserted after reset.
 	 */
-	sar-isolation {
+	sar-isolation-hog {
 		gpio-hog;
 		gpios = <15 GPIO_ACTIVE_LOW>;
 		output-low;
 		line-name = "sar-isolation";
 	};
 
-	poe-reset {
+	poe-reset-hog {
 		gpio-hog;
 		gpios = <16 GPIO_ACTIVE_LOW>;
 		output-low;
diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts b/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
index f7daa3bc707e..cf32ba9b4e8e 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog-base.dts
@@ -34,7 +34,7 @@ &eth1 {
 };
 
 &gpio0 {
-	phy1_reset {
+	phy1-reset-hog {
 		gpio-hog;
 		gpios = <19 GPIO_ACTIVE_LOW>;
 		output-low;
-- 
2.43.0


