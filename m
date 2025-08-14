Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=; b=ReIIDOkCorfeGa72OFXtFB62y3
	ADZS9Hs19imI/tddIvZpuEDUDi1izBN9ynJ32sQXb9420blVa0Us3JVDa1JwYSqPGYJqgv3RHuL7l
	UQ3jQofNq5GU0h2b4D8z4w68paGmU6vX1sfKF7fXG6RSKGSZm12Ww6hGlzLRsa2OlNGEleN8Q/qCq
	ABP5M/VaVKycbMEL2zvaRkwSObz/AEFBYZu13OTCSoECjCuJFYt5zrCvKqPu4dM8gTsT1VwNZ6RoS
	omzm1JdqoRuf46fdnkl0ruLSp7V5sIrxgKa1C+SC+nzH4+eoffIDk2I92i+Tx3wjjbzeUFnilsnJg
	FzKW8yWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0b-0000000HT7B-2ugg;
	Thu, 14 Aug 2025 15:36:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYI-0000000Gf72-2bHu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:51:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b9d41cd38dso496515f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168681; x=1755773481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=;
        b=cu9A0E0zvHbXOdBz82i9DN4evrpr3N+9dmiEVyttlW1kMQ7a6qtefCz19mpUxCcg89
         hu3i+ES4WwiuZRFRRBUdsynt6Lg/uFlY9898QlMZ9GMneDA15yWM+W/imUronr45jW0K
         dTiHmrYjca7HimXpjGXr5RkgbOgk7NDUmnBgx8Ry2V5P1mzYIG6OLE9Uji4hpaqnBRQI
         7zAV97r63XI956dZTAz9hgce7KCw/XOQm7vpOL9tFrT1L9Umf8KyKPUDqOQnt7hLbjqz
         qF2gLaVzmHmynaiK/Q3HjBYI+Y/AZMt8CA6nnJ1E33oTB6Xxn24n3n1vWltTCjGEK5JA
         C7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168681; x=1755773481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=;
        b=DUWtdJvrUagdARkJzamcpfiWwyiG94YvuYLBUYwnEZvJIDCUIA/cHinchrG6hrDR1r
         1siZwX23GzEWdDdnxEmKjzzK4CgY+mFQfi5D4GmnD9+idHS8NqVs+DXx6IomOcFvXV7a
         bJU2HzFp8U0PWUEwDEDhSWaeShmyyWk0RB7BAz8yYzdkbR6Gj56rvjdEBK9tF0mS27P3
         94HT3jpvSWNfA/KvwXRcOmEU7ICg/6E9d1oj/gEpZfjwjSyUSDhN4HWf9DDcP0ZBu8w/
         vj8o3I9fIO1gUAM+lCa86lOg0WZSsJ2GmAxf/ly9on8LiGj99VVvmCA52P7RX9pBH6+T
         lDkg==
X-Forwarded-Encrypted: i=1; AJvYcCXszVaIOAZ8rE5CCAZwP1k0KFExJd4y8GKCt24M7gZ712XUA+yI5LcL/E7bjY+n/xcatTubpwM3mvqBC4y3bcf0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw18IHzdxWvA96lL22TUzDFROiMAmD7Su17p8hjgw/c4T+BKk8R
	6wQmL9BK94pP/ZAVwojrlEdoaEieB6KwKlb+ZA2g6zYcB+C2uiCG/YqLq6zDiDNqBBw=
X-Gm-Gg: ASbGnct819L5lOOr8ogqqmM+CtQtk8yx/8+I0jp0ZiIFIjOGhUI8604JUTy+veOgsTq
	pfdfTW+czk74OZQ+IDIZgGZanhXGaoKY5INBEwAlxc+3GelGFPGW+SA5VbE2IcakZ7eZXWvisnR
	g4/R0ocgJno4aueEyGm8t140l+ZxJJJUpC7lCbJNNBkgBPgTCPP9pmonTEeyJJsuikTc3TlGrRf
	RvMVFk4FOqLFkyHBj0wJvZIMLVYpkvDUqAe6mJJuhJ+qJivKKdW3UbACrRM1MujbDMfQCDzrVvK
	Pm2L+4TjDoHQEL2g4SSO9Ny/oMWPyA46eA7kYS5JMXryT4+iG+piJdAEmAskJVKQrleA7helm9C
	X1pjdlWmlfL/oXqvFWcja4Z3rfAMTNY8=
X-Google-Smtp-Source: AGHT+IETr1S2IB5p0qvTLAX5im7MRWeRvzS+YGEJ7c0VQq1WWHunLmPo9zoxHd949lhLeds4azm7BQ==
X-Received: by 2002:a05:600c:4ece:b0:455:f187:6203 with SMTP id 5b1f17b1804b1-45a1b654a11mr20355505e9.27.1755168680945;
        Thu, 14 Aug 2025 03:51:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:20 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:52 +0100
Subject: [PATCH v2 1/6] coresight: Change syncfreq to be a u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-1-c76fcb87696d@linaro.org>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035122_661382_268ECDE7 
X-CRM114-Status: GOOD (  12.29  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index ac649515054d..746627476bd3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -824,7 +824,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -832,6 +831,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1


