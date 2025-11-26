Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A393ED10F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=; b=UDVMcKunfilT4TO5O3suZtMnod
	PD3Fr4/vaiR42ur44EvRYf92w8uiGaa9yolu2sYA9FT0xh+JQYao01qtY1YW6f2hm4KE1SedbGfI/
	3gqLOcuGxmRVGwoUXQbCc8YGk7FrlnnYCXzl0lQZ0+F90xRrRoLWxhQs8Olq7NLgSDDdxScScv1E2
	f6nW4pF0VdGgec4xcfeRrR5N2AvyGYBC9YkCzM+/8iEX9o+2lg+XmK2jbKYAB+B3SFxgVeBA8HYrE
	Zt6zGXn1Oo7q0v3w5CB2KAYoPzSeqbR9UQ84ZHfh2aJZmBCjQAg1nT6tQ0uwa4ejXWD5nIU+jhAcq
	fXcUuHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDb-0000000Eqtv-3qum;
	Wed, 26 Nov 2025 10:57:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDU-0000000Eqnr-28b3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47789cd2083so38851665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154663; x=1764759463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=aGUnlO+MJnlLG6/5PCjrIdxoTy8/USNNydd8gNrYTHGt2zCQy59AFp9Wa5bv9DeA9H
         zzN8OSOQO1Y/Qg2ts6OmnhxZxU5/vIUZNKiSSqi9hPqwSqlVZqQKFsmArzyDrcp47vRp
         n1oXpp+VDfJC5eGe29GzkU76ugHm3oCqC39D11hTnA9GcF1n9ZfXS0WtM1pjpGM5QSQs
         Vaslx8eYdp95WtcE8nOnoh/X9O/5l/a2+KHXn4RHMVpDrb+WZS6gB5+oDvgZZu4eg4G1
         gb7YbM98ujgxBM7MJlfb1Be+JQ/zS1SL0ZtmvFzUV8d4WnQaWMNa9k0Y7js9Usr87LF9
         xePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154663; x=1764759463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=C12IzSlfNXqyx3wELul7KMcYVAW90TlMJdkhAu3RdUUuM/v+ZyHBv4T8UJEDc5f9fJ
         nMRVCkjFfE5l2Gdry/H/85vA4L8F/qRL2vwUmEDrmQj4F2+o9cslElBJZpbiO96UGZkg
         6aB/33wqOEwGgj0tQuTsTQdIkzeS1JwgF24tQ9OwQT9+AFzoJ6pFCrX4RIlo4xiHhDPC
         QCnyaE0hmD2RBsOZWHC4m7sI2FqaHDk8QsueYC1BmJnQHRz0jYaP/5xIenlCBYdMsGQB
         qYRWzGQLMb5BzZBuqgiM7snDR6Q7H16YkIoj2NpfMnQixb8uZLizLS76QAEVdfzkF4XO
         8LsA==
X-Forwarded-Encrypted: i=1; AJvYcCU7LfUUfCCSkxRhDzjgOVKK6+Q/tkmbNZ/fpzldJTz7/ddqablvf21lur3ChAM9cxj20oLdveceO2uTYBtsMdCU@lists.infradead.org
X-Gm-Message-State: AOJu0YyBNoeYodyQu9OywaNyTot/6S0HrTqzX4Td05ziQYQdppWuxGBQ
	6D5hRBjWwavfsm26Uwu8CF5OPeoIDh2ZZUEtd+p775/vWmlNXdaznCu/1lHWLKBZnqI=
X-Gm-Gg: ASbGncsnXGP7M11rLwnuguU6yB5xFLI89HiStPcuqqevvmLm4UHTAC1Wl7oezGKrksI
	DwzHHBUQoPBo7JO2QwqKNPsdAmGmUtGGBGx+vuDEauzsDHiDXRgNGRaKz2axJ3xuy0qKr2LGgXg
	38fIyzyDfQzEMqs4xpuZFUUOhtDwn9nIqQ3/mRuZZb5c1fSnD8fQWPp0hCRD9gNNq1derdnhu5t
	Emq4lTumveZItoQbAuYyNPdKpvonnHwFKglZOO7Hw6Dz6yqG1O/hGst5gRzOx4YShf8E+pk5HRF
	RJlWnhKG+2Bzg1Q/nDPbCFXvsJHz7MGFTK8zZ2WvrEyKSWazBj74FrnfThHLr5sabE1NSxcy+gn
	pdn1qltJmw5SCQnRRyGwlqNZ2mpGvHkobo3bVqWplEkIiPlhNVo+xpDNrsCMJbhEQTQUdULIT5r
	Vri+ji+qpO/BKICmnPjEnx
X-Google-Smtp-Source: AGHT+IEq2h53SMoGIyD2yFtjfs7hfB7ruA13p+JgzFnAxaZ65GfS0NxroszsNqkmBHF8jKJbq34fpQ==
X-Received: by 2002:a05:600c:4ece:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-477c115db0cmr208004055e9.31.1764154662715;
        Wed, 26 Nov 2025 02:57:42 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:42 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:30 +0000
Subject: [PATCH v7 01/13] coresight: Change syncfreq to be a u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-1-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_025744_565652_65263816 
X-CRM114-Status: GOOD (  12.22  )
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


