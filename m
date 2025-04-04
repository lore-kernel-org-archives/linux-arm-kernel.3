Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E6BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uoFJ4ptUi5AV/TAN1DOX2Iv9rd7IiSOqJe1GTR29a9I=; b=uotEGb7w6nHnhqAntaVabDoyHi
	dsJjW/uWVISwhLObuY55iaLtEMW4f+oNhkZXOryvyH2vgoQvqO9qoWdta3CIGwFfsm/tZ2/esM93i
	/5tjPwXmirxcdSYwPFOAF2Eo/IiDXVLdc3Ojnm/W19ntt8pzHMUR5Z7gqO+6Bfu/u1uqzXT064Lk0
	y8eodfDy//EbeUP8YsalQQ+y9S7iJWKagWjsHoZLTT76vLTl7eGAwXyxGyQRHXkq0HRnPyAgZHg+k
	4AAadowMiSYurvOshq4ZnLHZ9chk3jX3b4b5DlduiSqcCMMgva1Cx3iqDREKQk4h2WDhmITr8Gc3D
	Pd2t6pvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fDo-0000000BY5o-11Wt;
	Fri, 04 Apr 2025 11:28:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0f9Z-0000000BXHo-43oY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:24:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so2034995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765844; x=1744370644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uoFJ4ptUi5AV/TAN1DOX2Iv9rd7IiSOqJe1GTR29a9I=;
        b=RH8J1S9H2vnKjgrpD0rT3Y3/t9WW+z3ie9b3UjGQ+w9oWWvlADNUPmQs/qW/9zPvg8
         mfaE68e/6h2wy8Gmy28bFkojVw4UBDtv2zTkPUogWHQ4yKSTNxagawsM8oAmc/8jham/
         msLT2W1fv+ueGoiFPIGQ4ounDy+NTTDbzG5sXsCNgNAj8jnQaKI2sWw9Yx5H242wqBsV
         6FOw2ebRFtZAhoLoafYw6CQsjWrgVmsAVFxFpE4kIzlsjmlzcSuh7BSON1WKK80D2z+M
         ZWr+WEmH0HrNgaZ3LuZtVWHHP5B/FWZlZPhSd1kBLQhjBxYTp9LpRZGaHkKdji720YA3
         P7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765844; x=1744370644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoFJ4ptUi5AV/TAN1DOX2Iv9rd7IiSOqJe1GTR29a9I=;
        b=dqBhqtefsZ+uLYEt1bn2NSEAP52raDXP/zdTyc9hP+bkK7ujdFM4hF5Fd4NoG2TKU/
         gbe7pf4lM3cWrV+IpHz1b4PygV8okvj6I8WxbKeL6jqORL4tsYKvuPQQHgSm0VoVRHL/
         m3wtBgCqIDewU+vkMxTBe+0R3tw9MsZcRbbBFM/ENmCss7EulfgPWb2IY0EtGYKYOuya
         Gn+nFBsNco1dcmGYAEwts5R0xt87gt6WIktZ/HeP5WonQ/baBPReqtHRgghbFhV9NtIu
         vQmdKzPumkIbk0X96Z2CQ1nXqZyzrcTETW9lrMH8Olg9NP2/OkrhXZyKOuflu0bpuQzO
         y2/A==
X-Forwarded-Encrypted: i=1; AJvYcCWeH/k5dyYdEo48KH2oFzSBBGs31b7+bHs+Glz3GQ1sadt7/Jj+OaGsO3DGtZw4LMGE9MI4eAOjaBFH4bC0uM5T@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8sOFEUJ/vOrYl/L7BfkhWjxzViEsFGqow7D6KYB1Ju/l8TwmR
	DNIll6Q6XRvs1qVoFN1i3NkzJXy/LoF8MjKzx1GF7pl+4lbo2BP9Elu4NiRGUO4=
X-Gm-Gg: ASbGncuBG3XHT5mxgHFCfn2NIeTLqWoNqYfvL2f6NUoM3wHu8ZZOMRqu6oyUIcyF4fv
	xUOA9ivCbzFFHUtt/92chTUlYHIHmhFo4xenBoG54lb5ACVjOB+dSxZ8V64XVunuPLQGxmyXEKG
	d8zfa5gg7ena/P5OFPhMKY1+2byKsXSU6+kZ/0z3Jw4LnNgeT1OfMQlT54iKnboz+H0j1ZJ6dQb
	MvwCS7hGFhaU/2g0i28DpYU8OPfZGwZWKkNl8RS5IgAYlGLjiQWRBIUfM6CzPmKiWeUjU3PGQS4
	RpSXNxp/1xmwn7iGQPUhm+Fh4QEo7Q1FFAXD+aG1Xks3G4yY9NpJtw==
X-Google-Smtp-Source: AGHT+IE3ZXg+NpgHFPkT9tkd3OeMOY/cHa7ymbfFF9D3KVwgwJD5IbYwCsgQ9PomEA437IeP0SFhSg==
X-Received: by 2002:a05:600c:4f0e:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-43ecf9c372cmr8116095e9.5.1743765843644;
        Fri, 04 Apr 2025 04:24:03 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342be6asm44913355e9.5.2025.04.04.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:24:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: mediatek: Do not enable MTK_SOCINFO by default during compile testing
Date: Fri,  4 Apr 2025 13:23:59 +0200
Message-ID: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_042406_012355_2EDC43CA 
X-CRM114-Status: GOOD (  11.10  )
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

Enabling the compile test should not cause automatic enabling of such
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..006214f8e5ee 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -81,7 +81,7 @@ config MTK_SVS
 
 config MTK_SOCINFO
 	tristate "MediaTek SoC Information"
-	default y
+	default ARCH_MEDIATEK
 	depends on NVMEM_MTK_EFUSE
 	select SOC_BUS
 	help
-- 
2.45.2


