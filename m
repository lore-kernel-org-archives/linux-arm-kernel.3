Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123B1CEE339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=; b=tLxBAwUBMH0nbwAnYpa+m5ICGC
	FIGDaIEO69vHEP4jfz8U1H3xqEShLkWbQ2xAnETSzwXlOuYh8iML9iI1djrFfs5s6OeNsS+KGjyCI
	xDB9mVQPoYP9Wz5InEytsK28LXlUZe2s6MCAhPZ6k9JXoWUHs8dg1VFI3PWtl06eMMDZMv2HARB/E
	q/CS0FRAXW6wTj0xLwIHJN8YlpZXu4Mz6wotxS7yHC9arrNkcoXz+s+o1LHbl6EUgY/v6YkzQ5Apk
	kiaZ8RkyRaCDXzi1ogZg/xSYdGG2AKy93Q1o0bOQKdwhRRJq56lRog0VCBzGiL7sC4hmRVvlOuTTe
	NIKM1eQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOYy-00000000jNE-1Pat;
	Tue, 18 Nov 2025 16:28:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOYw-00000000jMG-30GA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779a637712so23192535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483293; x=1764088093; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=Hce8QnqU7dHbUeHepiaQxsrPzD+UIzm5QUMK4Cv/dkZRPDVWIL8lpbl4hGcqd9IV5Z
         idYjZvnreGQ2fR4lrTBJ3gjwd8QhSlirs1FOsNVCBSjDCGkInfILSpcm+fmBW3sh2BoW
         4tbE7dUkqk/427IOaVYnGUtHTVzcEvA1P7mO1WxAx+Sgj1T+UmN068mkqULMPNrWQVir
         vhND9Aaf2sYFR4hvA7eQY4UXzylyijRifDxJ0c8EjcbKb4wbHu5uk6U+boJsWJcyP1vv
         ni+0VU/oN7ZLrkyq1R0n/YN/JNYz7YWqkMSb6yR5LmuIUpSWX2M5H6yIJfsKxH3wrbUC
         MoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483293; x=1764088093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=HWrt+lxvJATcuZCxRP5go9E6gdnNg4/vQR8PJwwmOhEle/Cfj/NvoOmM1fqQZ7ovMA
         bn/6JS6PTaJadtB5uhBzR+OboAg1DrebZps1UUxc2bnbzIvQSzYvvvWY/DGeJzalvZMj
         11lAQl3eqiRp1RwAffi97hKrzLN3BdVQfNtCuOD7EZK6CH9orGnjbbsCNE0YsZmKA1Yb
         RNPedd9TKnZmcFBpZNNhvYncszBMXYQg2yN3eIdSpZbCIRL47vAcIdlw5VR/W0hnBYea
         cncWCcIY8pIX6qvJwcBIy8JWcx5jSnThYsDDB2JAtBAOM8NX45SjnqZdvbybgTaJxYhE
         exFg==
X-Forwarded-Encrypted: i=1; AJvYcCUoXvIU4YkQ8S+mjOhkraaC3F9j+QkACIwCrRsW1uWoHIfrdO2Bn/8RvoDc8bH2jPslaZRLEB2Nf/Fbw8isxbcx@lists.infradead.org
X-Gm-Message-State: AOJu0YwqRzLMgGs4TQMXGMpIQnLTal4Wau3gYYyt+ecuSf8nmY+fWyaX
	hnuqHpKZF05TGyUsYdS0jUY3meuBPjMxRExBBTFXnDX3EbeL5/y0TtMzGoz3AAhazUhQOezV0t7
	tOBX5+ac=
X-Gm-Gg: ASbGncuDFAK2TteUQNaxWHzfsX8T9eap1yOItKI4CoE9RJWKU0MgPZTN5CKgS/w4CNu
	gR2LMGeoHLwiINyZXyLNT/+WOO692IEKKBw25oTU7nuWsRHiI2T+ivUOyYCuRA6Xprc3XeYCXBX
	VZsxHqHpTt29kIV4vtSA+xuddhWEKbSsEYbh0tH/bcexgujWQDietDzUqRQC4k3slwOcpn0nBMQ
	9uggfnp6uRUdwXtk2sNlqEwJyBd0NMk4AtvA6j0s2hzasxZNFFtxx8vBDAYjGkeGYLcJa0FEdBL
	WNBVy2Co4VtPbkU/RNCSISWYNXUMzgZLS08dA3itoiNBhOZChAI8IKvYedBnuXqd+lvzuG5QYE3
	S6UfWj377MYL9nkYWygWnG84SN9fVamsvoAhEjfMYRIsQAFoiJ80wv/J2L52PZs9q9NfcWwRKOJ
	nLYxRavmtfFI1fuaDKxhYW
X-Google-Smtp-Source: AGHT+IGlqA0IJF4lpQfSJdnwbFaKhD4WAxo7jW3OY9aqCkvaIzPhjEfi9eC0wI0y+2UoYEhe+EsPvQ==
X-Received: by 2002:a05:600c:4f4e:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-4778fe95399mr169481215e9.23.1763483292720;
        Tue, 18 Nov 2025 08:28:12 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:12 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:51 +0000
Subject: [PATCH v5 01/13] coresight: Change syncfreq to be a u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-1-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_082814_779656_D4818C4A 
X-CRM114-Status: GOOD (  12.33  )
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

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 012c52fd1933..0287d19ce12e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -825,7 +825,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -833,6 +832,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1


