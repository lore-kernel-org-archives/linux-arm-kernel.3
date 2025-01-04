Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E4EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJEWejicaBz6dmUxoJQXl7EdOTueBwQvHraBKvH38is=; b=mjLgNufGo5gEBmxZhJVr7Y8omd
	FXBbKkKC6uL7gTkeYsTX2ZDSIhsFqyv8U4ngZ2l+Rn/WOHcDcw/X6h2C49b4KEC1Agr7xzIgmpakH
	KYVN3jY/mnJU2s3kkbnsJTuDEKaDZqoR8WIfM5hxwuyuQcai+Lh0R2j0GZ5pwpkRBotaehUgK9Jxc
	yLbaQZPuz2vn6ENZ116ZUI4q2SwQtRlZOLPdfD6qBC3BUgkW0kXIkQexhAqwu6SoLOQvfImr6XC9m
	30GcQ7LtNkn31ClvISxlutI9GTOsxvRz6ybN4LjOKqQAjYSs9q8Y9s03WTPPq+FQR6+B7nstyTjTo
	fB4KvYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU4ea-0000000F4aF-2ol0;
	Sat, 04 Jan 2025 13:57:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU4dQ-0000000F4VG-0Nu6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 13:56:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so20366945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735998970; x=1736603770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJEWejicaBz6dmUxoJQXl7EdOTueBwQvHraBKvH38is=;
        b=Vsr6e8TxjqAlY2P16cuG3Pkpnl2dI8Wcl65wt7cIeiuUUUYF8MynCKRv5ylDn2zWw7
         kv4HPUOtEdDoZCLYl7bioGeA35gjujJ8qFOO2bf9U2MfGVVWwV59E1sy5d7XVcaaKIQZ
         JTmUHpV7HFdW4+pm9AVKwGto2Qtb1B2m3/QOEsXw6qR3yFA5NJm6VkIXIowLnDPopGDy
         4jAh/s+2oJAehFaD++lKR7kdGlYfLFJTsp4IDYMHeIlxiyokHGkyzikP13Sbmciv/vkx
         X5wp1PG1ap31e1Rxv7+UhGVFlfmntsY7yQ3PoD5NYyWw98SlXd+8rPadcZWQpRPGSa8d
         9UBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998970; x=1736603770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJEWejicaBz6dmUxoJQXl7EdOTueBwQvHraBKvH38is=;
        b=Ddh6mTlSPjMsho+TExzgJvpXlRGIy5DHC83czSEiJsVoUp/w6Dd1HCoxEWxy9eOFSa
         Ifyk2qf68a8peZK8ZJr/CWyB/KpfCwuahWSA4vVcFFaDaHS9m1Pfefam8enWlAee5r5K
         QJVtHACy+NWXJh044IuFWU/uHXrUzaOC/0unot8XkZJs2xVPMOmAp2pJHUw5OxMNKLXs
         ogxskDBtkkVg9diGB1OLSKiIkdwACHPESszWCXDgtTIQuoiBhRJZhn2v9RZQdoxtw52i
         oolcmdpI19LDuSGxEVpBfSroCGH9CHshQg7H9/ycIuhqcUuWC4KSWF9A1EomQsUKvimP
         vq2g==
X-Forwarded-Encrypted: i=1; AJvYcCV6vJazsu87/qBKIziPKjRpmEyk02ygNGWpgc8wbImQHdJajMPzkUczEclsTuksKd4AUFFiAFqdsnVRpupzcRal@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6mRQoIUX5Y1e0AMCDp0W+k6q1dneQHfGfoxLWhXMC8ogdXKOC
	1XqIEXnMYcl3Ss0Sllf/HDQ9pbJcHYGAdY617VtIdMZp+i/vIOx2SS80dZkLaqY=
X-Gm-Gg: ASbGncvsKdjI6Hq9zjb1vVjaruGKJ122yhqAzPFvtvY6VD041pd8c9jJBxM/n1tSZTW
	uJu2SjSZbpltkaSATSu/vdbSKLntCVpn7rooPwCjdRY8JrKp02pGNsru2DhHn1n5KD+EqF1f08U
	b35Ppi1mA4Sxh3NT2qKSxssJ6+ocEqg+M7EXwtDulrveQgUHtJISO07QkK+C7BNPa+tAP4aMhZb
	CihLtesetWoV4EKMFFW50faH0jfIrQr724U+jEgUc0+5WH3CxaCAd+K4Zg6s20hv3stYs4=
X-Google-Smtp-Source: AGHT+IEO/3u4qvFe5Vb1vURPH9ZBPG+ma9tc2SOelaqiPnyPkQaHdPOjLVZUFkyq61FMNDtN3/bC2w==
X-Received: by 2002:adf:b601:0:b0:385:f7a3:fec1 with SMTP id ffacd0b85a97d-38a221e24demr13083083f8f.3.1735998970188;
        Sat, 04 Jan 2025 05:56:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e375sm43946322f8f.73.2025.01.04.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:56:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()
Date: Sat,  4 Jan 2025 14:56:05 +0100
Message-ID: <20250104135605.109209-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_055612_177760_BDCD54BA 
X-CRM114-Status: GOOD (  13.33  )
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

If tensor_set_bits_atomic() is called with a mask of 0 the function will
just iterate over its bit, not perform any updates and return stack
value of 'ret'.

Also reported by smatch:

  drivers/soc/samsung/exynos-pmu.c:129 tensor_set_bits_atomic() error: uninitialized symbol 'ret'.

Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d8c53cec7f37..dd5256e5aae1 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -126,7 +126,7 @@ static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
 		if (ret)
 			return ret;
 	}
-	return ret;
+	return 0;
 }
 
 static bool tensor_is_atomic(unsigned int reg)
-- 
2.43.0


