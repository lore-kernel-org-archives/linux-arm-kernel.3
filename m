Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9314CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HMxhWC+6DIUyTBowpY7tH1U7/VAQSY6aI1DyTbhk/6w=; b=VtWMXDpti1za2Kxoxcv80KSaSL
	9jFU1hx6BZma8hl4FgVPPPG2xJCKTIRMcZ9Vp82/0pHQ7EktqXjrm3KMW19s4QAN4f9xJ4+FBnjV2
	mvysClw2P3oxvVTiaWDU32FWXKjsWCrKPIniHmdgVBH37qQwUVpECEib2dV9oTejP4/hJpsH1A8wr
	Gote753TZCPMNWTu3+pF3Rw/VMR68juKl7dv0zb6xs/sWIQDYp91fX3uq2aSiK4U0EITZsu4Dhnw0
	HJpAVgogdmRldaHALaDXiBIInMcKW4z7i+xijRcQN2IMEsYI5hkkTN4NV5i1OcMSH7xPkvbQIti5K
	Ez1qhAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uborb-00000006Nrj-1Dgq;
	Tue, 15 Jul 2025 23:15:07 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboe9-00000006Ml5-4Beh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 23:01:15 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2d09d495c6cso2203452fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620473; x=1753225273; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HMxhWC+6DIUyTBowpY7tH1U7/VAQSY6aI1DyTbhk/6w=;
        b=v/jDFV2LoFj2jg/PQKlxX6HeQj8ohImyWXFIhF7F12Ha2hWznseeKC5DpNF3zPc+Zs
         Odo6S2c+xRcXIyGaVHjw5+tdVCwzd7Ol02b95hAmFkqW3V27fUFDdVPWiil6V+xr2KwZ
         fAV9Ir/qzFvju/iLnNF0MXXYsbiSQyNqT7EGUnr8t5zSjtyBH3zNnf3SiZxJ8gz1Bam5
         0Eunpj9fIzMlVUePM6fWWbsBZO0av8w+u97uMydBe/M4uGCSlm4PyreMNZqiOv5KMvwM
         1hWOc+Dn6GBbgpb2louHJ8zQy0S3dQAYEXNiGs/ojdRTpRnmvV3f4Xi/WJm4SKGV3+OJ
         seIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620473; x=1753225273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMxhWC+6DIUyTBowpY7tH1U7/VAQSY6aI1DyTbhk/6w=;
        b=fh4ToTWhmdLdUCsjS/aK4gcFzeda6mjN7Hx24lgy7TzmI5tpfGLzyZed9Jkfu1r6GP
         mOwjv3UeOp5GjgOG9fvQq2DzZKppbw/OaCQSwUKWfItkq5SGIvOmL7y8Awv5c6f5gbbG
         KL8Kh/WdhNhFru05aF9vgHc66DDgmRon7GoNmsxOgo468JEnqaDoZP2mQJQdvNsGz5HC
         SYzYlp2vvT5/U+hc9OPKD9allVFBpULjfBb4isAZzzc49ARTM7gg28/ul1zDjyQdLh/a
         w5OL72m83YIk+obxs7QnxhXEHPMwrNL9JCGsYbQ8HeUErYQjTBL4b6MT8lFz8hCiKcpR
         P9MQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1H2CEa2Z6AsmY1Rk/S1x0aJYDjdJlkjvplrrNV5ScLUy16Jw9tQtdTb13mpNAKumEthRJWajlEhP1g7Fq+7f2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/kR1ST5IFLIykYCK8lWdg2kHSmGd++W9bU+fA3DQftol8dSEU
	HrQ5V373PreC8Q2xcob0b8wI7CQ1wE4fml44gV2/esbKdbU4CezGSyn+xmdf5Dc5T2U=
X-Gm-Gg: ASbGncvEM3fnCDq/CvOnoS1F7/tlBq0l5xgh8A514asZgum022bkLC6oR0EUh9Lcrod
	lFppjYc8773m/Ccg0tRcLngpu2oK02OL6vi3Powfa2S9f98WSbr6PhPDQruHUl4RGcFOim5bv1j
	4hGraRdmZyhnwYeg3dnrpmog/AywmNsNJ8hLktZSXYzZssfOtv9q6lIJ/PcsHrPAtOOEOVEdcfv
	BsCkXrlqhF+rIFry3OYzh4m85KbKT0uMoO9ZRqBEg9RFD8ZwpqJlxH/k434mHMOIU5C3kX3XNE3
	3GC4K0SU5ogqR9Ww+YjGlr+2WRtHJ8jEbt3fEek/QJF2oBpeUvePNFn4uY9M77iPg+6nmH2dMyZ
	hKAVk6GSLWD3LyI/zgh8xCGGejnCV
X-Google-Smtp-Source: AGHT+IEls5whNRzvN01o90WxbCX3ovBdPRxqs7+TUz1Rw8UbE0E1ggiOCz+d99TGSZRB8SxM8NuTEg==
X-Received: by 2002:a05:6870:d0c2:b0:2e8:eccb:fe1c with SMTP id 586e51a60fabf-2ffb24ae8c1mr586050fac.31.1752620472817;
        Tue, 15 Jul 2025 16:01:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11686cc3sm2964968fac.27.2025.07.15.16.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:11 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: airoha: Fix a NULL vs IS_ERR() bug in
 airoha_npu_run_firmware()
Message-ID: <fc6d194e-6bf5-49ca-bc77-3fdfda62c434@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_160114_038263_57CF8949 
X-CRM114-Status: GOOD (  13.83  )
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

The devm_ioremap_resource() function returns error pointers.  It never
returns NULL.  Update the check to match.

Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4e8deb87f751..5b0f66e9cdae 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -179,8 +179,8 @@ static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
 	}
 
 	addr = devm_ioremap_resource(dev, res);
-	if (!addr) {
-		ret = -ENOMEM;
+	if (IS_ERR(addr)) {
+		ret = PTR_ERR(addr);
 		goto out;
 	}
 
-- 
2.47.2


