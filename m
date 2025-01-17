Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDF0C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bqzaDhkGzlC5ZZMw4iyycwBulnGVmbYgEfa4Bv6groQ=; b=Bn1vmBiwFed7PE2tKYh1nGKGYM
	/Sx4mdzrOCR3gNMOSmV1rc/xV/UoAyvrYQCr/FN4RRiMztFX6PwfV/d+ckfO5WtEM+JtrECRXtASu
	DAcCGkZ3Qppv7G34V3ALWFX0cXDD2MTKZIWIKdpTVDdsg1rMGLjgMlUWlwpaDze9EkjVbARul8Duj
	cwhxBW9u1HHeW4QLL1k3RaxGDoKPaNNa/1pia/XJOFnRKOko1oCGI1WLj98MhZXt/JMV3k16IiMev
	m4NomCC34K0bZGj3NssKi8CPgS3f0wLDih3BAtnhYp6A+ACM6L6uwikfE1pz0scQTC69M9RZjzphN
	rwNxMkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjGA-0000000HYol-3QU9;
	Fri, 17 Jan 2025 10:07:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjEp-0000000HYHv-1oeX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 10:06:07 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso2699718a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 02:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737108362; x=1737713162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bqzaDhkGzlC5ZZMw4iyycwBulnGVmbYgEfa4Bv6groQ=;
        b=KC2QtnfIOADW5YZfIWalp7r7tR27/DmxT1i3fuDzuZQhrMQnTEkzVz5jiac5nH8ZNr
         imdpb6+49NyY5hD6mWDLOhgdoHYVd9srmw0bIlvSKButa88bjiGqiwtdQ4AunXpBp1YP
         +Nh4NIBZbJxrUj00gC10/mtWdNTRfXqWs+zuF1WdC8UnsYvDH3nFHhYjGGThpURIfOYK
         BSI1p8xA7h0I72PSpE+ndDcjbMorg8AcwhUPNGiFSj5LOfUw72bdZ14qvcrUYVCiO2Nt
         q5iFpXgLaIxTgz2FgKGfE95o2pBTHkiGrtpIAruD4syuyomW/tZlAC4JC1bnzEiOza+E
         py2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737108362; x=1737713162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqzaDhkGzlC5ZZMw4iyycwBulnGVmbYgEfa4Bv6groQ=;
        b=f6dhAqMfS+3fJlaArRC1GrY4J2bzGY1ebWRuxoGy/kqig4DqTAE8KeheOZsN84r24X
         idz/hiodfWANnE7H3OQPxKTTsgdGYgyj0YtTz1GlKV/hEvSgRO8rVY5KKTz8KdfApm2Y
         aaGKNSyPET0XxY1aosi4jEDFB85HUGVcexbq6V9RMrAbo56nvCQsl/bTaWRBjfAPP7h8
         LBB4oL0fefXqB3lOdmBy8z682h5PBtQkWmRBUEGyNzDy4aeBLwlwyTWvhOUoHasR/avn
         sMeRharN1wEMdfVnTBrGq7jLXEJf3V8gFq5abdTOXh3Rp2weQc6zsLeGSqla9Bm2Ji5B
         XNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Xgezff0P/VbVaBm8aioubL8Pq3nZJlF1R2wcsVqiBPcs0BTKH7wR8AqjGs0a2/5lzieWTYMpk51TF2Y3mLaB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4e47UWrWxf4FbmZ+vWh/7jfOgSAAaLlS4bz624uroekuWQao0
	flThrv0zxJoKd+xT3raHWXz7nGUuwzfe70cl+gODeyfm/bTi4QjOaOhdyfx+svk=
X-Gm-Gg: ASbGncuL8UfvoWkgiNYRrOUYuYg8hKbem0vpvjUIfgRWg0MYgUwSNyCcCOJmIyl3YN6
	ixtmOr/1c4miH1kAAVpvFgld3WM08VM8NCHCzou7p2itF4LXEJVcy3A8q8UFw3j+cqJCdOFdof4
	MPoCcXVqzQeZ6lLu0s+wZmiWMY4j3rhs05FyGI6SoURsxR0EJZROUlwZOJe5cV1fOYywNe+v/2n
	LdojcUdaC6qvuW0gAv5UeZ4P4K/oP63MafqgRdW1BNzS8CiKgjLpXbewWE=
X-Google-Smtp-Source: AGHT+IFRjA9Le6DjMt1h0VM86rlX1I8qP5mBjATvq7PHxXLWmVDxnJfQ//XTAsAFRCcQCgRq7RHmOg==
X-Received: by 2002:a17:90b:5211:b0:2ee:4513:f1d1 with SMTP id 98e67ed59e1d1-2f782d4f34cmr2507153a91.23.1737108362033;
        Fri, 17 Jan 2025 02:06:02 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77616117bsm1606075a91.20.2025.01.17.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:06:01 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_ffa: Set dma_mask for ffa devices
Date: Fri, 17 Jan 2025 15:35:52 +0530
Message-Id: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_020603_544073_8EFB39CF 
X-CRM114-Status: UNSURE (   8.87  )
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

Set dma_mask for FFA devices, otherwise DMA allocation using the device pointer
lead to following warning:

WARNING: CPU: 1 PID: 1 at kernel/dma/mapping.c:597 dma_alloc_attrs+0xe0/0x124

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/firmware/arm_ffa/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 587118f5285b..9dd5f6f805aa 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -247,6 +247,7 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 	dev = &ffa_dev->dev;
 	dev->bus = &ffa_bus_type;
 	dev->release = ffa_release_device;
+	dev->dma_mask = &dev->coherent_dma_mask;
 	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
 
 	ffa_dev->id = id;
-- 
2.31.1.272.g89b43f80a514


