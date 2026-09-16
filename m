Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9CEC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=; b=h0D1XILiTAr1b601W9Gq8sYSs2
	UdX5gBvOcSxy4gtokZUkZDYGpVNOV0wlGqkF9OWnLv2zEyhjIrY2u36jMHDB4TO431J9siYwelwd7
	PdrphfsEsQcY3EIjZ+qxQib49eWgEiF/g2nFLfwKalcoJJZEm9fehPMtSlecoB4auLOv1//pRFVmt
	hZfcYpRKIMdal9C4m88s7MF7RPV57FOPOId1YKhANQKSSZfyrgyflOdjLh2KM3fg/b0hdzsFkiOCZ
	7dqX8f9bZ9htMGAc1+QJUMNB6V84c6Atu5iaPMlS6qUU1kRhXUmEwUlvB74wfAiTauR/o6PABUXs5
	R1u4NplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYQ-00000009aBN-1v7i;
	Wed, 16 Sep 2026 15:28:10 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYL-00000009a8V-3ZUq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:28:07 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b2522so709137f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572484; x=1790177284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=Q5VbgPGg5QqjtBU0788vE9XOTX6I54roSmPl5moQFxon2R6iFp4XuHaXbgmF6C7lb1
         5wsJHAOlrD9WY9wOSfoUwpwtU6TTaT4RywHQXHI4rQDrIQcHQ+AFALbX3iOK8t5NsL25
         fLQza3E6c6sngm8h06bBich7I3KfvaHNrHfa+m+teouvCDXHoAWUedgkgzr71yN0g3f3
         G24sHF/vDup9MtPw920djY/U/einIBmby8MQhXts930xI5xlrChazcNGyTkhBU1V0zm6
         XWHJ3aMO8c+rivCuubqFaCKWw1EZv/xBDE3PdO+xuRO7gy+IDugQlh01DynocZofkUAL
         tv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572484; x=1790177284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=IArf7hxi+HFYYEBrSKhypoqEDnLOilsxUCfr7WOBLYyAf6TLTj/9vyXj3PRHnZxBMx
         9xGeU9Yruy0bi3chTS2DkGEiJhL3ElBipiDahMixZGxG8IonoT40JoJ1+eoHAQyUnnD/
         7DL+LfVUBHRhqbP4s2D2FEgHQjfMkZlt/DgxkuOXdKgmT2AtdrugVGzKlmDCr2QAtPku
         ZaXiaS1sRVh2ae2rBjempoGQAZ5rphF4wJB8iw58b+sk0LlIjdtLCKRb/dQMjlWxZbuB
         O1Kqo/DxHtXf8JiOXh4hi9YiIbDry3fTRh9Z62+sdwD0OPo4t0A8SuHHD3rLctsVjX1N
         QGoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4C+m4YHrKM/V4qSoPmYdUt/wLfFPWCeMya/Iv1g6nkkCn/MfFsiaGpv2lx0TA9SUvuVXIVbHpDgaZbWQ0mWCO@lists.infradead.org
X-Gm-Message-State: AFuF++kpfhT4ixxRcd1NXpu7/PISl+4wDGWezjn9A8v+N6+dyFg/19ET
	4f9r6LSVCuesSjjxLcHIq9C+Cvvq96OjluH4ALsQTP6gbnNRr1nzGBQvjlJlSgMUFqw9ejL9zX+
	sZ/tipKOoEA==
X-Gm-Gg: AYBFou2IM6hqu2XtREijb/kH/XvKNHlwg7u6fKqARYRHNggqEpu0DfTal9slnEtTirX
	U2w2fGTn5pf+jqtMj7+UrSCJcJOfDWAKeWIruvJ3/Fm7Wwj0Oj67NvPDEbpf/mbtA3EoPw3qOae
	TH3dtHHbhd0jt8u/uGhK0Y2dbZ6en0M37GF2dswSnrxZmsg2Waa7Ue7kgVkTn1shGB+vREqtllq
	bntm48spjLdMkr3IBVLetgGoQAMUxUVsDSyFB/lCBoZEXVxPySxsSgUk2U7g5jzq6fzzAN3YepN
	4n+WHckQg6yGivTwyDom+jnrJsBDOFDViIT7bpVYsYtrZnX/X0hOI7cxFAxUJjcafsX5xLY9TM8
	JPPGQdxSVpvUOOV1CM96f2SdHo/RyQFqMyqxznAhbMc3hKRJdCC8rfcaZyA10vbG29yD8DfKM47
	nzZif0tUnob884mEZdSyptqS/YOlOUZXeg0aObtYPU0I1f5h177p79mBrVeWSOOUTe6dhgw1Pt8
	0/xyT+Wuilumtw/r6yW0rWzEw==
X-Received: by 2002:a05:6000:4543:b0:487:62d:37d6 with SMTP id ffacd0b85a97d-4870d062278mr6043828f8f.23.1789572484275;
        Wed, 16 Sep 2026 08:28:04 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:03 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:57 +0100
Subject: [PATCH v3 4/4] dmaengine: xgene-dma: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-4-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1050;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
 b=AClNkxjacCjqu2lCKsZx+DsWrRbiQu6gec5tz+hmBFOqGuNzaQ14tthza4xwpktAZM7gOUuZa
 Yhu36sTa6osA945ATkMT1gSapeUJJUG5HK9qcNADI/uNELqdvAyplxP
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_082805_941686_4EA1D5D4 
X-CRM114-Status: GOOD (  13.30  )
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

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0


