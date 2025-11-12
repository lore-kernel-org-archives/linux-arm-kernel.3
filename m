Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D98CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHWft60bOhabLyvWPLsf9Lg98jcEqwRduNX+1kYsZ4Q=; b=1MqVkn2pEpDmHlUfTJwB9IPJL5
	pHMOfPGrTyyKTzRxACECHfkVnl5YPIp6M77fRYYn9a7dRwl8I5om/4/KeCdkmaxxvG54uujM4in6A
	bEdwp3+XiLj33mDL8rVpsrxbOZ0+WHBEAeWIj+HTSmBcKuiEG0LUv70LFEYOxxIoMU9s9S1cTCNmF
	GONq8uNNsn2VkgeCfUnhviaJ6shuRS5LX+KopSP8Tk5DWPlbmYruZRD2iuzgbFbhs/t7iGRKQiUs5
	mutcYXVo1mit/JNpLDyibWlNZ/DswkH58AbMcJUX8G+HFR96oT5MkLgj3QLS+9jK7ce+hye3L/sPF
	JpWh5fQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg8-000000092IC-1cNS;
	Wed, 12 Nov 2025 15:22:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg3-000000092Fe-3zPY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso681419f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960950; x=1763565750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHWft60bOhabLyvWPLsf9Lg98jcEqwRduNX+1kYsZ4Q=;
        b=jAGKul6/D+bgJtsI1MXA2pcvC3m8rRbhD7B3uwn3+MzI5P44xHEUpfMcfW0bexVPr9
         u+XVNLZuhpt9D0vNIVcmkCa+F5CXP3TNnrLxSBauJgLKtTNmE02WL4FiJFp4qWU6FRax
         kikGVGP4YJng77DGM1fToBLjQxFjQJVQz2kAvy/L4JJGExDOuL7aBhXDJoWriLvx4tEX
         XSPCzS7SSDrvHBWOaRG28fy/LLUnUqd2TbV/GcSx8O4qyc+ol8gmMnpR/Ib81dNV2vbH
         S9m56dqxL5prpbWL+LoX2sh5Cdm+M8K+omrySXilpxIWBRa6b/ExgfjmYp8U1jsZj44v
         YmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960950; x=1763565750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHWft60bOhabLyvWPLsf9Lg98jcEqwRduNX+1kYsZ4Q=;
        b=Cekww5GmujWbTzXKwFlvjdHYWNnnXqRURWuOIlw1ebljHElhNRtA07Wz9Le7T/o2m+
         bs43Qv4eCfEgzBHSsJTJD4zqF1BsqPswKR2y5Ca695QdBXBDS6LXpprNkuameDpR226o
         kEPKTeZBka409HueG0sMq3PqswpBzjtnRP2XTjQXB0sDO8+LRb4fscOIrBMgZ2xu8Ywe
         9FSgMvspr0Z+YHEAW8HKWXI9Tya1DMOLxqQpY9UVLSSv6aiOTqJJPubHzSH7utBCFFl3
         QWV46A/+/nP7ZBp6FaX26lmUSKxtF8bRYgsEuEe6+4HBqDddR9GFYRAUwgZY/3xTOGKG
         gyRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7RJat7iO9JHxOG2E9y9/I4ItIFwCQZPCdFI/1zv4gAwFp0pROiaC4PayHjIzBEJaUOAa69sd4qtBWwSyk35f3@lists.infradead.org
X-Gm-Message-State: AOJu0YyWDv/ByLSzR+eA71jz6PlVjALEd4crC97tbcb8QjDx+x/bbCVa
	3vQzxtAAv8uARmwTksYXYWy9vkHVfBB+uJxhcMXHnLmwHQgzaqiWODilq81JQsXMytQ=
X-Gm-Gg: ASbGncsT8Njat6ljOikNotw9GXX+ISk+pLILHDBtdWfcT+t67MlcjNBNq2J8dJAv9We
	WBJ+NrP6dQLRaAR5OxO6aLNdxTIiYxSAPptPOcFuRw69MIEVL8fk9t2AR7WhYHNrgK/EzCskB56
	N2+Fi4vqs8Esa1Z5aWWKAitvWEgMEJ+zU0wqMiY3Df5lbySSni/2OksAl6q0Id3Iq8pI4xNbZed
	HWEQPZ8gPF3txMc4EQxdh6lPm3RWWI3rXbyVeQ1ier2+2Vyv4tSYP2QX76JAMo0gEolU4OFvIhD
	A8mVO7770UO0MJCavg8vFXShn+4y7Oy8dtXCmEA+zoW2ICNoS9x7s4G9xlPrJeGbzONkh1fZqx0
	lYDGO89i13XhzfEAUZQhO8KMgZspZfb81twUWRnCb1RIVwtPIK0vT3+FUUASGsJe+QHmdf8N+PU
	r4pMy72Iu3iw==
X-Google-Smtp-Source: AGHT+IH52DNTLBb7al5zttlsVEiexafiX+OCjlQQr0fildUN7BN1eWHybUmsF+e2JGT9znBkdM3Dzw==
X-Received: by 2002:a05:6000:3106:b0:42b:3ab7:b8a8 with SMTP id ffacd0b85a97d-42b4bb91763mr3253408f8f.17.1762960950054;
        Wed, 12 Nov 2025 07:22:30 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:29 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:07 +0000
Subject: [PATCH v4 01/13] coresight: Change syncfreq to be a u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-1-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072232_005853_73053D85 
X-CRM114-Status: GOOD (  12.15  )
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 8d4a1f0f1e52..56a359184c6f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -826,7 +826,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -834,6 +833,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1


