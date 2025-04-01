Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AF4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 19:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bH5VLtP+seSAMs8ZXZEEtVjeNgw0O+SRzuS1o+Cett4=; b=PM21qUB744xub1WROA521/pb0p
	rAKBhi/xgI1PGlXVj8OeJ8GqYVAnX/xMOY+a0d4VRHlIeS6kBvHJPNaRQtQjw0ZoSAyVxaDJl3Rvg
	zdKCg27PHJrVMC/bzk5UPka2mhLduCO2YV3UMiRN3KaGJRTcHIpSdYiWmy/gGag7hqTs80uMB0buR
	ndXC4AVKe72MidtQr5ulX/Wph95m2zVi3vyfs7lV632q4dKyU2iEJYTeJ4jGvoSb5g+jB2W3qG6xv
	iMUCFpw1Xhq7IVtoesV5jlxvVv/GrRG+sc5LBFoSYJ0cZyyb4s7sxb0I2FWfFMnWsglwG3GvQqFqx
	v4g+R+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhGu-00000004Daq-29v2;
	Tue, 01 Apr 2025 19:27:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhDL-00000004D4T-2FmL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 19:24:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1193318f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 12:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535438; x=1744140238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bH5VLtP+seSAMs8ZXZEEtVjeNgw0O+SRzuS1o+Cett4=;
        b=dMJyUafzA8Y5aVivfRtvYQjotfRcqiix0gyM5KvQdbG28dzIm1Xrd60KJbVhiW7Aot
         047kuaXsujuzLxuwxdE7DalSBOPQi1lHqJc7rhPYx+rBOQOn+/GmBNik5tjq/TGM8X5t
         SA4/cslyBIMlTG8ClhC0mFqP4pELoDVujsinua6oLEBpmOT1GMZ3f+EbRWkJi1jp7uiz
         mjBOqSQM2Ld8NWd/5/+KknLxpdBAG66JvHHoAHBYenGhc693oZ3OHK3izXN4gcjEH7TA
         3RUWJvPAwhD6Vvgt6bQy7a4EU8/GyE5RuUrQpwNJgnNLpeKnsffteZrAUEy+mL+5nov8
         NRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535438; x=1744140238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bH5VLtP+seSAMs8ZXZEEtVjeNgw0O+SRzuS1o+Cett4=;
        b=dGAaR9ktztI6y90HasNCKKcJ/rPDSWctJJWIatI8plCE6qzV1b2vGwND2PG3mX1c87
         Pm/P0hEewlbHL2rps635qOkkb6eKpqwY586uc01+7v8wQnv8Sh0MEFvpEp2eDQCStYAO
         IOmVbcZY00D05WlViMXRwUJn9JmRCTYj191vUl9640QZiWqanwuGe86nYyRBE6BaejVr
         9DYDsQV+SoS9nT2Dd2HzznfVu2Bf7SrEXtiyddaK976xKeOaYilGm+JvYX00jUmmIz/C
         zzZ9fn74gju2bs9mF0F14J/E/MKjo0MItCDySasv/GzPiqRu+wMceT66RezT/6yGnBdB
         S29A==
X-Forwarded-Encrypted: i=1; AJvYcCXRLcdwLCvLG0qjEFyF9dvi38loMx8HNkq0jlEBwLQW9WIFogKTruaJPBOaBZhUhwm3zRrhkiGMLjlSwbVInvsq@lists.infradead.org
X-Gm-Message-State: AOJu0YzXph6pfzAksAdr6ltza5pTxVqCRxRIGSRAwKFn4/bN2zTgBzy2
	C+eBtT75oWQ6UqBowi/di8j6KirBIYSvZ7xOIN32F3bBHqoKDyq7
X-Gm-Gg: ASbGncu+RfWBFI5MXGlvEonKR5Oxh9UN82xUikCpOU2zTuoxZpw0C76VbQa72dU/1Wc
	EsgQL3JwNIPABO4zbSRD6I7nQ96LHqG8nf70/HSWAa/fpHrcegJ9tk9W6x+B6kZpJ635LsNroY9
	skP/HfI7A42Lg3lCNuq7nN+jRzRfkhP7ffIPMqlAAV2bV92okqJLcKFmZWmmnAtW6BXITz3OeK9
	14/0gBZcGn7KnP+1w9TFDyTnb9eAxulSidvIw4jmJN1glT3UEK6O/R048vPRPDGMjJyHlfYzV3k
	boQo5T4fs4MGWL9bZSqikxvtbmwEMG1YsD6RuoVeE7oLwV4/Poy/yUei1krtUJTfkrt8/LLbLWx
	6haA1Zns=
X-Google-Smtp-Source: AGHT+IEeNatuio+GXvnz6jtis2Ifu8CXZWb0U2xpbF/9zUj/YkR/FHukm5fxlTJZb1XZQEdPrISlBQ==
X-Received: by 2002:a05:6000:40cf:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-39c121188b9mr9767506f8f.39.1743535437739;
        Tue, 01 Apr 2025 12:23:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:23:57 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 2/6] crypto: sun8i-ce-hash - remove duplicated fallback checks
Date: Tue,  1 Apr 2025 22:23:17 +0300
Message-ID: <20250401192321.3370188-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_122359_575195_AEA168AC 
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

Remove duplicated fallback checks in sun8i_ce_hash_digest(). The same
checks are already done previously in sun8i_ce_hash_need_fallback().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 3f9d79ea01aa..2c2d285de154 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -244,21 +244,11 @@ int sun8i_ce_hash_digest(struct ahash_request *areq)
 	struct sun8i_ce_alg_template *algt;
 	struct sun8i_ce_dev *ce;
 	struct crypto_engine *engine;
-	struct scatterlist *sg;
-	int nr_sgs, e, i;
+	int e;
 
 	if (sun8i_ce_hash_need_fallback(areq))
 		return sun8i_ce_hash_digest_fb(areq);
 
-	nr_sgs = sg_nents_for_len(areq->src, areq->nbytes);
-	if (nr_sgs > MAX_SG - 1)
-		return sun8i_ce_hash_digest_fb(areq);
-
-	for_each_sg(areq->src, sg, nr_sgs, i) {
-		if (sg->length % 4 || !IS_ALIGNED(sg->offset, sizeof(u32)))
-			return sun8i_ce_hash_digest_fb(areq);
-	}
-
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 	ce = algt->ce;
 
-- 
2.48.1


