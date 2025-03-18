Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B5AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5xbk2RW4olAIIgppxlquoOWUJxss7kh40dJtVRvC3o=; b=G5D6iiq+pW6kybSzpBCFm9FS0k
	oGFjg5LEZH897Tzk/9nUqDA1BZr3Oby4uqbUgo7EcAaT0kdH98CTEzUUQcDwvLr7IfdkcHSe+3637
	iywP1O6BcuhiCmyQTRQTx3CRu4jwlXHIEDambG8xtQCaK4926Nap4n9/sjKAmdPSp2UIUJabcnb7I
	/o+6u5+ZGWkHrrD4B0ln9TpOoK+OiaXiqLn6d09+LNiBuAwGXIFZH4wdQeQCMXpXp1vTkB3RPH6b+
	/uCDLzjAGM2xbtsFecoCAQqwMBA0pXMAsNN+QQBjwVKjp0d58mm8rX8VIwcVVYe9jXqyRK2D1pRvF
	Ps5o407w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYiq-00000006KR5-1XU7;
	Tue, 18 Mar 2025 15:19:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYh0-00000006KA2-0Xp6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 15:17:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223594b3c6dso123149435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311041; x=1742915841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5xbk2RW4olAIIgppxlquoOWUJxss7kh40dJtVRvC3o=;
        b=WgP0vQWOQ49Vz9te5ONE3Rdwp5GCBRJPulOTzLx1u3/FkC9YO2r+hIK+spEQP4hsn3
         rSpvCW+MbbyjS2bpxtu62z1S93UX/IQisXOQtn0uGlf09ogjJveiLjXMEHpldOnX6NLJ
         516Tp37snnXNpYfvgikF4isnjV53akIJrbhwkXV9JJbJkN85EE4J6OtCOW07Fo+qHq9q
         Jd5Fs3CoAtecwBObN7BZN2OoEopvY//xSqNXClQLarDMev3+2P+EmZBgLlvqEU+hWiAI
         cJ1wVs3IX/A80jD8WhaDrxd6Yd+PCNe+quC5P/QzV9ZtHX+Cpl7DU3slfKYrN2k3D4Bw
         1QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311041; x=1742915841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5xbk2RW4olAIIgppxlquoOWUJxss7kh40dJtVRvC3o=;
        b=fJB9mcZGprpNmpzf5FbmGKiAW2rHJ8kQZWZJO3Fea0ybsV+ovqKjHBlbTiMtTCvlh3
         w4aHRKHBtf68VNf2a5S75HM/Ezq0ysEkAwavB89ItDKozaJ0qW/ATAFeI1ur57Zv14yv
         clL4nRyEpy5M5krGo+Dfgut9wiko5ie6mp9q+4ZWGrO0g06hW1CRtlYuFG3XmQKsv5vA
         BFpAL8+LOotRIQb5SobHyOC+Y6Cr2n/z18vLoAUU37oqJArKCSJNodRLXS6SMxYJoTro
         rqhuJkCpNhZWmftOPoNKCZK1E4UFaZghpzgZ/wHQ2PvAmOlbQswmJ9cMrDh3/D+mGiaB
         Wc/A==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZXAdKSvrqivKm3fBSUe38X8YfsLofWJU4mXcu5nrK6D550q66AzF5MlYCES3RZPSM+InXoE/QVV2eKxW7OJC@lists.infradead.org
X-Gm-Message-State: AOJu0YzU4OH73/sea7JWsDvUVFqQNygYdmujyWovgvxZ6g/1CJ0ZCVzo
	wHbEzjtE2sVVI0+hbvN5StMkBzV7jPZHZXJddQLju2sJoujyogKG
X-Gm-Gg: ASbGnctm9mT0F1BVFYiTUwLc8PBG2OmOkN4IK5aBkAp8J6r6bwmCrBSGrixOG5Agt53
	GYJaY5FmkwCs3P/griX/NhlNRL81Paaa8eecxX2CCSgi0GL/lar/6iEPc6IiXqGOlA/o4zKFksO
	3kPudGg/4YhmojRo3zHKyv2tJkPnbfxf44NFZ77wRGqG5Xp/dheAFgqsWeeT+pVixthYnf1Jd24
	2QLMAIDJDogArT2yBidtjKfsJd1PthP7zFAKI87AUkPRwcoSRXBgjw4qrQKhW7PVXR8bsqkOL9S
	QrgzMwFNx9tI/uKc9VZV9doJWyuN75mZRnkBQWG2zhloDHGFos3s6ODHTgggI6oLMz4Z
X-Google-Smtp-Source: AGHT+IHuoxBUztaTeqHFIy/VGlIjdHOHmiLn3CiwQpMF9dTHHGz6y07JQa9M941BIToVz2CH09aJFw==
X-Received: by 2002:a05:6a20:d806:b0:1f5:55b7:1bb2 with SMTP id adf61e73a8af0-1f5c11277a4mr27050144637.6.1742311041187;
        Tue, 18 Mar 2025 08:17:21 -0700 (PDT)
Received: from localhost.localdomain ([183.242.254.176])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-af56e9e3a29sm9095899a12.30.2025.03.18.08.17.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Mar 2025 08:17:20 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] firmware: psci: Fix refcount leak in psci_dt_init
Date: Tue, 18 Mar 2025 23:17:12 +0800
Message-Id: <20250318151712.28763-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_081722_164220_420A6A51 
X-CRM114-Status: GOOD (  11.68  )
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

Fix a reference counter leak in psci_dt_init() where of_node_put(np) was
missing after of_find_matching_node_and_match() when np is unavailable.

Fixes: bff60792f994 ("arm64: psci: factor invocation code to drivers")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/firmware/psci/psci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index a1ebbe9b73b1..38ca190d4a22 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -804,8 +804,10 @@ int __init psci_dt_init(void)
 
 	np = of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
 
-	if (!np || !of_device_is_available(np))
+	if (!np || !of_device_is_available(np)) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 
 	init_fn = (psci_initcall_t)matched_np->data;
 	ret = init_fn(np);
-- 
2.39.5 (Apple Git-154)


