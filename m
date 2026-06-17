Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21815CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDAOdwtxrmt1yvz0cAbxnb4xCO26mPsS8gCJRaVl/Ak=; b=Q2uCeqUhFFANLpiZIjNP/uj/y2
	RBX2aZWxjfV/a0tzzc+9UZpGCMpQRmfqxb9JZOaDW8teCRtYpuTBv5Cvo1WNAu4xUjRZcsSqNluRX
	WrICWhSRjgY/zpaHAkTjT4nr3NL45t5L+1SNP1p5/KsW7aRUjUDb9DCr5t8Njf3O/kztwqdvkIY75
	LXuA+DwWPsuNNq4SiD4Na28y97KD2iuWOd56kwfw/wnQbLVU7vb2NKPF1aTXxN3mYkk2+zXOyVgOM
	pDIx7slCvWVEp0KtI1RtasyFk3El75y9AXgVMhCddCedlfRLDIkKoBzk5+EWPn79ygP67P8vhs0Cp
	4KVKKPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcH-0000000HVB4-3Mfi;
	Wed, 17 Jun 2026 14:51:45 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcD-0000000HV8r-2giN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:51:42 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45efa2f7009so4067036f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707899; x=1782312699; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iDAOdwtxrmt1yvz0cAbxnb4xCO26mPsS8gCJRaVl/Ak=;
        b=llt/gKbLtdqXc8XD2Dhv53zrSsspqyvR+jUH3Y9XxvkAWC7YfYZobwDZkySArL8l+S
         wuvl+VA6YDJPBffFu2X6DCp3FT+yrmTycYRmqFJ74KrRMrbnrZjeKyXolTx6m6VWAayI
         YhFMHoUj2La5nFpHCyXTuBRo2EkYfC9lyQ35GGKw8gqeJ1boOBQ3/gAw/XooSszPvm3O
         eE3cBRghhsJs0zTmAiLVPKjqpZ+7rLXdKleoSQAyx7/Gyw3PS4iOZlh6Ty8KkzDTRzPb
         EQm4M7o0JCJh8DtXFUtnha47/n4+BGXMvLUyAnP8+Tm5XLPVNZuMypoR5VSZtyB7Rfo2
         pQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707899; x=1782312699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDAOdwtxrmt1yvz0cAbxnb4xCO26mPsS8gCJRaVl/Ak=;
        b=KFNELl52wAQ7j/d1bsC/CmKLdy6nauQU0pLdKPlLYLW8c6SWr9o7du0q6yApkkaYKL
         u4Mv8ef8F/d2vo2/4L5y33cIgMYM231FvlJURER6OaJuNGsWSQX4b9QC1wXArbp90p2a
         wpIuFMkxx93RcUmKdiNc0YhH3s6OLlCpHfQfOquzp2j5Uvvz715KZlMQ30ckbudQFqE0
         wwu3gcCr4vT46RAWXDWaUotyiKJCk5lvek7pP2ymBYdWRQij4Yx+K9umIjwEUhj7L9SG
         5BjVNoEydNFtyZWuMjNGi5+DzRtxCphnwI19MKoNEYj6GyIDIqV945cpf6xBCKVATY/I
         aKFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IAbWfPCSYKr+MuR4PyXRzLWFStubvPndvzDAdPiJEaMN11TGGxvYvvLvr1NBGmY47dCfp/xmOTmjXn2ZvrOIl@lists.infradead.org
X-Gm-Message-State: AOJu0YyCZ+nhtLDlVFNG8DXaojIhUlQcuqVMILsGUB4U1mOAFb5SSgPv
	uyy1SwjlJKYMdRphPxBv0etOQS8urnrJO/U17hBTQctGddmYqqi/Cq3Ao36qGSTcN4DNciB/iI5
	5bIp7McL+jdmVxQAnaYMYSMStLWzHpw==
X-Received: from wraz22.prod.google.com ([2002:a05:6000:4696:b0:45e:e4d6:bba4])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:f206:0:b0:441:1e1e:a050 with SMTP id ffacd0b85a97d-462374b8285mr5538800f8f.16.1781707898956;
 Wed, 17 Jun 2026 07:51:38 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:51:24 +0000
In-Reply-To: <20260617145130.3729015-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260617145130.3729015-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617145130.3729015-2-sebastianene@google.com>
Subject: [PATCH v7 1/7] optee: ffa: Add NULL check in optee_ffa_lend_protmem
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_075141_691169_56B2DD35 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Mostafa Saleh <smostafa@google.com>

From: Mostafa Saleh <smostafa@google.com>

Sashiko (locally) reports a possible null dereference under memory
pressure due to the lack of validation of the allocated pointer.

Fix that by adding the missing check.

Fixes: 2b78d79cdf96 ("optee: FF-A: dynamic protected memory allocation")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/optee/ffa_abi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index b4372fa268d0..633715b98625 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -698,6 +698,9 @@ static int optee_ffa_lend_protmem(struct optee *optee, struct tee_shm *protmem,
 	int rc;
 
 	mem_attr = kzalloc_objs(*mem_attr, ma_count);
+	if (!mem_attr)
+		return -ENOMEM;
+
 	for (n = 0; n < ma_count; n++) {
 		mem_attr[n].receiver = mem_attrs[n] & U16_MAX;
 		mem_attr[n].attrs = mem_attrs[n] >> 16;
-- 
2.54.0.1136.gdb2ca164c4-goog


