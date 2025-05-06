Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44906C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NZVMe0POaYy6U35iIgm7DP89EqIz3yo46LCC0chDBE=; b=uQHa9woNUDPPdXXEp1ia0jM9bD
	8nHJTqCpqnZJwyQpjrD2UPFvPcTlhGLyQ2WC/8S8xoAv5TLNoxuJIB21Y6M6W4P/sdYnQZ42qHjs3
	jhaqsfHoC6YJF2FSZi1gDh7COgbsZ2laHcBNKer0qpFrN1zLa3ZwLOYW4nssOW58SzC4fVompqxgY
	34IMXz8uJk+ZCTb2eT/QcAbEnKIp3sw9ehv8R+lQZeBjp287mLhS1k/6R73WtPYDfZD4BjAilrbk0
	8hGzTJDxJ+sZNgU+R6niGqc6CRrko+bH2Yx2IxglzdHL3jqCytspvIcmq2svYHJ5engIBL7gFow6E
	CfQcLBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUb2-0000000DvKR-1ntB;
	Wed, 07 May 2025 02:33:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPMG-0000000DOQX-3OUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:57:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39efc1365e4so2978307f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565063; x=1747169863; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NZVMe0POaYy6U35iIgm7DP89EqIz3yo46LCC0chDBE=;
        b=M7TeSeYwyQMzptuh633DpWMR3uCI+DhaEno9HgBQ9/KF0CzEasdopTXsSi/maKhdM9
         AR7oea5EfhX1LqoGaxn2KK2FifdQaONNv1KMjDw19fecaMb7M3wwOmSjO3ns/gKbplED
         Bho3hIgTS5EF8fngQVwvWGyoDMigzHZXqaK+33ojsE/b0gCpzkqFIgtn0GcUbj9SY51i
         xpCe6u2RVO9rPTwcWeodeVIqb28l1PgJCcOHpUoE8CPfecNnZOHBWk7zeiX+AG7gY0me
         kNXlq5P2/Dp4dCIcz4T5fPIiuJVRiLCov1Tvd76LlGNgUs70sX1jSL+IpJFvgrnkUX7a
         Mi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565063; x=1747169863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NZVMe0POaYy6U35iIgm7DP89EqIz3yo46LCC0chDBE=;
        b=rM+Vs0BCBM24VqQ5P+HE+Ng4I2DatGi3dLAIbLqCnW99ByDBgXVrpsBxWhgnXdPPlg
         IvN9RlxDHrDTIvpSjYd6ZOKVvORWVxbBvzd5PL0zxKIlkNt+WF5Nw+kS2OhHg5TQw2wl
         UXMMjNQMikrWfkof6SqxrYPefL5T2yO2qgQKrS5bcGbi+Z6oieAXscu1redSYQl3o/s+
         44I8eeVlhlyGrbid4E1i8hqfubrvhBEzr31yQFBR2Ol+3wu73eFxofXJFwH3oj3gmNKr
         D0yLI1JbjjD/qDmCr/vtYCFKLlkows5Ng7ijZB3PdlnmGoJMALufxbIClIfy2VKd3JQ5
         DSVw==
X-Forwarded-Encrypted: i=1; AJvYcCWPBbTnSS56u/LIgdFI3n1wLfvZOdCZp42x8aScfqQkTZYjEuuBYNvUYXxvtQEfYodNsWcFrOSSyT7Xg3/nFeHY@lists.infradead.org
X-Gm-Message-State: AOJu0YzFJ7C8Gg2SrugYPKuApBmEyf6JQD08IKkFCDJGEbzwMSqs9Ftl
	kSl+/EVMBQfZ1m7uLSu1nqR5Rd1+7eXozSbqWBQCJneNrBfk3/yfZXwVCh8lJFo=
X-Gm-Gg: ASbGncvm4Uugo7LUf/lsUdq05bR3wXHf4Cwuajzt+/tadeiUnCO4qta+0E5iGix/FlL
	PMSl1WwuHZlM/51Jt4RxEU0srzFzzvgs+Nh9YKALw2CHfB6sbHWId6wUpOeKVX3t8GNM+ErnK2U
	nzsXttlFiBrDG5JASHXtzoJjqXsA0cq4y/w7gVon/UmxmhDP3A4QDD9xZPvPlNdGDU9aZDuIVP0
	RN4vIR23dckvJ2V/0OC0LWCOyPA1FEJinwk7HbL3F2/8b6JseQyK69up46PKn1BMDg6WRHsxiEs
	iC+LYVW+RSVyRg0KzlgWWJZQDkf7qI7HP8wZjOYx0hOS9chHDKs3P9CdpMCkqF+YcaOfoP0=
X-Google-Smtp-Source: AGHT+IE2LgXfchPINe7qYmZMcscjZaeuhqsUBxUUbkHDGnmYsw1mvqK78ndM7S/Odra7ZlA/qDu8LA==
X-Received: by 2002:a05:6000:200d:b0:3a0:7fe4:df6a with SMTP id ffacd0b85a97d-3a0b4a4a407mr683409f8f.56.1746565063049;
        Tue, 06 May 2025 13:57:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:29 +0100
Subject: [PATCH v4 3/5] MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml
 binding file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-3-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=2jU8lWsHMh83BJDd6uFLy3YOaP/2xztJxNAHsH0fugM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne+uDVpWbiPtqvC8l54wAMhmu86vnsHamOKF
 xynba4y/G+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vgAKCRDO6LjWAjRy
 ui6AD/9p2LRq/9GlyZv5epsvsb1bVZNUP2tffJOJkP08VSkQ13IgvNpnnUatcND5PjHvOGQWbSs
 Ou/lL8vNTUemmdKiMlL173V6ATSTlzR1RhM1rwITk13e0bBF+MvkiT+AQhnN9/Wgm9XTOBiXzQz
 EY42gyYKH90td6EKzphaP4x5uDSxE5Zm60BX3W0CtzIphaupOR9f7xGXvm6e7e+Fs7FcxUHHAkX
 pmiFJmtaA6LHAjlBNmdtcNuoOjENA7i2zPgfSUh2nmqrkIv4XXHphtrDvXYo7+1N09cx0YS3HHj
 39aorwUyHokekqFog/Cl5UATOvqcoW3ATJGnXONwb3jCxlcAiKW5dGchzKc2v8AUkz0mg57bOdY
 F4vUzCNYyOj247R9NCKtHBnKSIy0z0pvqPLDxuoCDc+17jN/HfwXYmSNz4YxsqslRj5t2zmzdXz
 ZsN59gWSON0vdXmgzwEAk549m2UVDIiqjRGtawXD67lZz0SNfzk8KIB5Xu/1+zn9La4TC0dfBS6
 0sXlJjk//R4pPIBocwWh8BcWXztXuFEPjiMlNdL0AhvMrYSVAah0kRBIkbFXPZe+BQZiwV84urf
 409Qg39G8bFzVQPE+wkNYS3oe2U88n0wZ9NumG6CX0LuJB4RDdnNn1Ppa5quUrjr2HD0EGfnPvS
 Yo9ZfoOUWQrhA+A==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_135744_853158_11FE8980 
X-CRM114-Status: GOOD (  10.70  )
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

Add the newly added google,gs101-pmu-intr-gen.yaml file to the
Tensor section.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..5b2ec4c2023f39a3dd532ac61f0075a0a1555411 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10118,6 +10118,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.49.0.967.g6a0df3ecc3-goog


