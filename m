Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59A7CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 03:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iwk85JlTUEBI3yJjsshayntPryiTY23zzfTEHf0Um/k=; b=lekJ5DiD9nomTm6grJP7qJUSNm
	Du6rpa/KuDaIiEeYRr96B6HfDyFwUWXmJ8TnFbKmH5pPhxEmY2fUNY+JncjRme5Lrxc+UuRs0AK01
	TqeWdhz4+7kUheUBGuFLCU6adZRTbW8pgfobH1aZATHfK9r+p39gLdj7leKu7HqctNvA8fE0ZzrpV
	UpTcQCFEokouhyTqW+AdlTcNwX9e0/KUVhDu3a55hHR4iRybZfYWJv0io0dzugAuC+dzfIm6HqiLK
	CO9PoV2qFgCJB+poz2tcA794cuEoj88Y9vXoBfLS+3vmmjyp0GQ4a8LsCyPNFAWFtSRIHk8O099p9
	vFi3xglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaBZ-0000000F9fN-0GHa;
	Tue, 28 Oct 2025 03:15:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaBX-0000000F9f2-1Yy6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 03:15:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7a2738daea2so4626623b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 20:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761621346; x=1762226146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwk85JlTUEBI3yJjsshayntPryiTY23zzfTEHf0Um/k=;
        b=J0aPvhJpJSFroR+Oka94pWKZvyQSRRjNzXIqkmhrgjRWyojZN+uz3S/wa0md00FXF8
         bLXci7LJ0HeERzOoRC3dOVohTD8Ypm6HzytRe6C+7ql3ltRQQcnteHYxIWzI7aaTKJIb
         aCRqUcMGQXsgvf1K/cH+SVCLlB0fzqcn3p4u8zs9NTa9j8aZPHu08bG21dx7N0vo2dYk
         b8d/XzmORdaExknhXht7AVsvjHeJfiRdB/ZIqTxJIC/+cSoYX+ui1QbKGr8pNOW22dJP
         /5djDP9E2cmz7zkbbGlQvlfo7BSDkAsJW1s0qLlkRsD5K80v+pznysR001LaUZtyrRDj
         GvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761621346; x=1762226146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwk85JlTUEBI3yJjsshayntPryiTY23zzfTEHf0Um/k=;
        b=VILqOefvjfDDCwVIaFt/6VLMpG8OV4eMk0w5laKHo0RR9u00j/YmDguzYg5vMQkSen
         9Lg2NX9kgehcS6PbUmen1wLGBCfmGjytDJ5xDwYCCmEnrqfi8opaOkFaGUSRumswhegh
         yQSSMjr0ovG1CacVLYt8Bdh6F+AEVMrm0BekruefIXD9iVkizQ0hVe7E2PS5o+IwfkDh
         qOM4Mwi7tataVMflALrz8sAnjPv8NWbUcBoMqkUFn1JRxfthu2LzFSwbbf296ggAQXCk
         F+wqYPGp8iTVTtEPTZ1W88TGjBUb5LL7OewJSthD1UIWgzeflGXHwZrB83u6AW0V8eZm
         UEWg==
X-Forwarded-Encrypted: i=1; AJvYcCWwh4phZ8BvlKvmE7K8uxMHlcg6eylKUeGJLH6Cmyl7Qn9u3lpta3PADr03MOezmG12K2H3DKjvFyVFD1IAo2pk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz38L0/3MlF98ehyr6r0gXM1B8o5KqDTDKjcCG+rIy5ZEYqaaz
	9qjWDK1B/F8cHzUykgZGXz9KbACH91lElrcWR4ti1jY5WF7AhFGVKtuE
X-Gm-Gg: ASbGncsdHAMylpu0RKsyJ7S7bGbU/FXOGu6jIMmfhUUo1W3dJIUkDj2i8UPQFJXdxd4
	DX3fysYDwTuY20vsMaqCGLAciTPtiCFFesjyj+NYpSiK+XB4pa66gXtg7xzb6ENz1Jf9zCWV/4p
	HUYrbrxOdce0eH0sbnE27g5CaRJ2FtXIhDamwVWTyGnpR4ijYibel2/CgcaswxYO61yjQZMVLAa
	wcCyiOoaruE4cXU/zwAi/34ElsF/ZDWct/QuNc33/3p3GvHjYcN+LF+X9yxea8u8GEYBWfDoX01
	SxmkjptvICNQCFzm9Re63bYC2UsoGqt9Uc0mRAimC/+r9DiqtYSlfxML18WI2DqAkIZi7DNgJLM
	91TXwYmESvwv6sBgm2m4M/r1tPecxODEuOAaRs6JVslksa7qlMXIhS/NLRSc2xcuSnu48xG2XYd
	WC+iRzJ8vZKO/ppFYrW43J+w==
X-Google-Smtp-Source: AGHT+IGuxaZzDv7SIXihLd34aYSMzDHA1ChbWY+uD7KdVdbaExQIFl+ZQhnMyiYov0T8YhmH+laVjQ==
X-Received: by 2002:a05:6a20:734c:b0:342:c891:a9c6 with SMTP id adf61e73a8af0-344d1baa8a7mr2317412637.1.1761621345900;
        Mon, 27 Oct 2025 20:15:45 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b71268bdd50sm9123455a12.0.2025.10.27.20.15.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 20:15:45 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] soc: samsung: exynos-pmu: fix reference count leak in exynos_get_pmu_regmap_by_phandle
Date: Tue, 28 Oct 2025 11:15:27 +0800
Message-Id: <20251028031527.43003-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_201547_414234_5FCF7282 
X-CRM114-Status: GOOD (  10.42  )
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

The driver_find_device_by_of_node() function calls driver_find_device
and returns a device with its reference count incremented.
Add the missing put_device() call to
release this reference after the device is used.

Found via static analysis.

Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/soc/samsung/exynos-pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 22c50ca2aa79..a53c1f882e1a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -346,6 +346,7 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 	if (!dev)
 		return ERR_PTR(-EPROBE_DEFER);
 
+	put_device(dev);
 	return syscon_node_to_regmap(pmu_np);
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
-- 
2.39.5 (Apple Git-154)


