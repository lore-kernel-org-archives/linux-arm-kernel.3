Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661B9CCFA1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a/cWESJHLQuQfZBepHMhOg3dPVBwhTpABUd40+CP0cQ=; b=znrMbST00Alp0z
	sELIqrGufNOgyh3knj2y5MDCgL42Zj0ZkEjON1B+Zn7rsC49at5/KU0dK+3OlHlTdo4ClIeNU1geQ
	Vcr9ZNxq6nr995drImeuoovB4gyE0v02OlwwxPiZ/YosCM2vFWQzD+KlcVMAVbmB4Wf7m8XFtB564
	1PMNoK33haUxhPo58b05SBRMK9wXwhbHQqk7Pfwb8hcNkZVlezPb3+nskPruRtDexFmckhU5rbpmw
	zUjXMEyF5VgR9nv+1ZgeMJmhEpVSg8BqaFBhP300dZWVQYNl67BAOh1Np9xuwQzSh+W/8kQwLe4Ph
	f0E6Y0AM1MKkVdKYKikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2f9-0000000FtvT-3WIR;
	Thu, 06 Nov 2025 16:16:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2f8-0000000Ftuy-0c7y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:16:39 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-640fb1e568bso183113a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445796; x=1763050596; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/cWESJHLQuQfZBepHMhOg3dPVBwhTpABUd40+CP0cQ=;
        b=zmrrP4hb5Tn2PgxSXjz3aiZfb+qEVHe/J/0elGvMjsNElyE0/YQWDkNQMcsaOOlCrs
         5hWL0f0zqgBRNwbynYjCnaIzjfShzl8bTzBIKuV+DAu/4JfW1oxdxQuvxe3BegCzrPzM
         sul1Vh5MSC3kPfSg4Eg8Bx+HPEz6HZZ0xT1dMObafJDBpeK/HmSLxOEn/rCauE1fjfZQ
         8bI5jVvFSn38nrKX5jYLCDPAiqCS8OLl1+gDC7m1n8hqb2TCY+mTxqNJ83uMH7Z7tNhS
         Jthfa5j1K2payogDG8vp2oBn2dIm8ZOyFOkA/jrDDvEiRLBmIvyFmBCzfiSdgWn8XzBc
         kaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445796; x=1763050596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/cWESJHLQuQfZBepHMhOg3dPVBwhTpABUd40+CP0cQ=;
        b=w5rAtXKfzqKJDxRwj0SSa9dLWBZqfkfHsrTFvxXvkZ3u1sKT2RcJVe7iH0X8MYpKr9
         gpZJsWyW7zBBRPnkhOBMteC/EG2KaV1DJD+J7p0Sx61cF2vP/OFrzRjkV/IHVz02wqj+
         ZB+VGbXeMGMTSVowV4o3cxcNW+G6K80qdMMppJtefuCioP3tai76mOAAkqpodlAHzbkv
         9OLOPMtIQxNX6iGoH3S8v6WTifcsrXVUXk79TQcrrFiIi1Jv2LwMhHQx0iRFdHc+BwlL
         Luf1MhPlcpR2exZtqu5EMpU+sDqn82nlXyFJuSOhlZcOvY2q8e6HoxyuJ3l7q1SaE9Mg
         L/xA==
X-Forwarded-Encrypted: i=1; AJvYcCWbphlgudaY7TvQZUXljXigtzzeAUE+0+XbACu3K6xS644AYIQPAfSi1Nd/zXwauu4egO8ITQVKaHgkFm2N4t3I@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0I+haCK3WkPhVkwlZpPJ7TWdC6ve+yBRTFjVGhL8x4w4H43fE
	qsEtRdQWDUYPg+xbAKbCLb4m7w9HIe4sjlFKH7tV6FrKp9RV5reEbf0Y89fE19UXsKQ=
X-Gm-Gg: ASbGnctWbFgC+CLigEgaAlr8aVdjHVraP67rdb3WbzO1SjO0GiP+0SMW3OlDMWZ5Usi
	i3Tjj1GEaBb6xSoqa5x869Ql1q/5OprwItgHdQ4/la82fHDvX6Eo6kD5MqHCoB1JG9aKM6APv81
	lN2od3XbvVnTM4qCbXCgtGPw7spTMpqwQDQL61eaKopqdC7Y4hkXWcL2Zl9ZPJoLxR33Qxw1ztu
	nx96HDkLPMb9U1sixPpaDqownVrBNMdUFR7WHfOo3dRoo+3L5xrpiu+9b/sBOvcMIZjf8dSndKN
	s1wkUc5GzO0YKrpVEVEfxgDcjSZFys30YTtCsfy/kPdAsCepEDP0CsdkmWp6bC6t4xluO7ssB+l
	aACBQc6wD/X1T6shY0Tgb21WonNsyby9y03QTY6s9uQ/wMbxHUuYQuMj1VcmRK3LEMbshUIIrMJ
	YY0+qIfg+JqOuKs5XX2i0oueX9wNw=
X-Google-Smtp-Source: AGHT+IGZyiotRhhgwXYn5kLA9144yJt3CqLXWRIlBplyMOGLmU5g6JzMcGZwLmbbAR1KDnNe/CJBWA==
X-Received: by 2002:a05:6402:40d5:b0:63b:f26d:2eab with SMTP id 4fb4d7f45d1cf-6410588c64bmr4342221a12.2.1762445796238;
        Thu, 06 Nov 2025 08:16:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] gpio: Simplify with of_device_get_match_data()
Date: Thu, 06 Nov 2025 17:16:24 +0100
Message-Id: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjJDGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwMz3fSCzHzd/DTd3MSS5AxdI+MkI5PklJQ0AzNjJaCegqLUtMwKsHn
 RsbW1AKFqXdpfAAAA
X-Change-ID: 20251106-gpio-of-match-23b24cddf063
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=m+62ZdK0Lq7jNUHc6LhXJD8r2Oz0NXj2Wf/sdNqZaZ4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDMnawcy7CZrgSJdmsX8aGdzbZJXfoTmd5wcte
 EXUkZPJykiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzJ2gAKCRDBN2bmhouD
 1/GKD/sGaVw4KqMnqsuf/Iq4t8i+hgL/3lnY0jK+9SSHdXboQ7EJfgk3Sm6wY52RTR+tUedRqHb
 KgFgHA/5ybPQRwhsYIiMvznFthIaKAJQOyqKUk0EoICVUmcd41lh1MD19gMi8bXpb3tdhoMD0k7
 c/ssi6l4uvZwgGAsZlS5xpcM45nHBvnKd52CJW6DphNkNEcv6mznj9RoO4xwAw2YNkPUXcVyTOG
 /Iz/TKqD3SC4b4ckdDh/LHlBACvBtj9Ouh4a5kchOc7TvE5K8NOCIstjaGA+VYGTt1gRiqOI/+l
 GQhTiL2jKs68Rxvm8cnU/28TKbJq/Bw9/SAaE3R2zYyzd/A1OyqrCHb7kIjtg1T3G4jVK/nX0vG
 UI037XTHkPBuQj9xet8T8YsCEgsT8xyeyDe8LnAmiXykzytmOzkEhUszveFit4ZBFp/JOdCMSpR
 4ar2NyVFBRiYVufNe3lzr2S4DZPoinPKdKdRJfZ7twvu1E5rN3Ptry9kUlKmFnc6rDTTJA0zGwJ
 wcvX7YTxJiaMdZgmLN0y8Wh9a8s37KEQWrJAWQqcPFFA3o9MwAsGR5QDYRHuagOmkCjj2MmP4QG
 9giy7q8+4GvJ7VWK3iCZ1y37exP4A7BdriM9cp5obCaixlPiHoWi32+FRChQSaI4HfZ0l4XcZga
 V+lfSKqaELeCsBw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081638_221002_3EE836A0 
X-CRM114-Status: UNSURE (   8.00  )
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

Few simple cleanups, not tested on the hardware.

Care has to be taken when converting of_match_data() into
of_device_get_match_data(), because first can check arbitrary
device_node and the latter checks device's node.  Cases here should be
safe because of_match_data() uses 'pdev->dev.of_node'.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      gpio: tb10x: Drop unused tb10x_set_bits() function
      gpio: aspeed: Simplify with of_device_get_match_data()
      gpio: creg-snps: Simplify with of_device_get_match_data()
      gpio: zynq: Simplify with of_device_get_match_data()

 drivers/gpio/gpio-aspeed.c    |  7 ++-----
 drivers/gpio/gpio-creg-snps.c |  4 +---
 drivers/gpio/gpio-tb10x.c     | 19 -------------------
 drivers/gpio/gpio-zynq.c      |  8 +++-----
 4 files changed, 6 insertions(+), 32 deletions(-)
---
base-commit: 5892a3d1e4764f041ce756d8f8b321d2c92f653a
change-id: 20251106-gpio-of-match-23b24cddf063

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


