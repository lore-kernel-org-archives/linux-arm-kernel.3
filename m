Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6DED116F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMHK8eau4h9JU7tjhkGUHgs7VKxsV93yd4KGWWLggZo=; b=uFcv1ZdLTf6nrhC91OyNxGy5iH
	M0BSn0o0QrALruStUmd8LN/kSIVPZPjTXq+ka5fTJ0Kurkio5ddttvgw+WIUHT1kkiHkQW7Af1Tu5
	DrxLP4dQmjXXFMkIKUqhER0FEbeBNeQ1D5HAF2R3ivTJ97BVeG3z04mhIKrnyY1BLbIQIfJHTEKQc
	zBj+uYKfUtJkFh/zOoapAfXLmrDrk2+qjUf448SKSgIe0+w+XPnEsJJcsSF92/3PNVhqJdJcr720t
	QIObWONqYKHIrTA1tzBf8zRUcAtS1pL8HQ9c2nZcKZFdhHQ+8Flz/u1jDU5RcnTZg1+0/Lk/mIRNK
	/zJYFTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx5A-00000000NrV-2Zsz;
	Fri, 28 Nov 2025 11:56:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4v-00000000Nif-3XbH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:55:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477632d9326so10427285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330956; x=1764935756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMHK8eau4h9JU7tjhkGUHgs7VKxsV93yd4KGWWLggZo=;
        b=JKCHi1ZJItDYFHJ+wm2wYPlETYepjxwGrtBeNmt1wOi/ISrCb/c6Wv3rL5QNhr/ajB
         sx8q5jDsxzrOWQDWN1HqqKf2SIDJ4c+SLIaiw34Fr1HnqxFT+EvgfYRfeGtyqbbYWAcy
         pvAgAZO1EKt/BPeuoIZvF6uCG5Nw/lHPAmtffx9r8RVyirJIJuz3JHiHpKB53F64b4a7
         xPddIAVbdue+BIqaF/l+qef8F2vxwqsWzlKJLhY44T/y++GK++hwdQiAGVZKknjweJHD
         FZe5cySP9wBDQ1a6HJL5rbcGcuD9Ngh6RCtljXtP7BN6PPruhnwUTeYqflFl/mGQpK5Q
         Xecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330956; x=1764935756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CMHK8eau4h9JU7tjhkGUHgs7VKxsV93yd4KGWWLggZo=;
        b=M1+3qj33XdYizXfEWB73WKjq8lAEJ5he0hXOD0pA+flssE92ekWBR6mK9g5+NbE7hk
         yQwSTjj8/o6TRqNBnETV7HsjZplkQlV0ndwYgWs6k2ks7atb49CcuSi1t83JBm3OjeXg
         st+Lf5zEtj7nEgjcBLE3qiua5JWcAcm+OjxJh+DsJ2HgXouSIXbLiy0zvb5JnNPItCOz
         ttiX18tIrkNSLMcJ+u3PPxN5WVeYTYsfKFN7vf6AB1g/hZ5xEmMg0q2LXVMTXWHpwyhq
         qgw0Hac4pYt3EtPJg3xXN3AvvVceH0ZzbmQCzXX5YCW4t4MnIfi2kWyHaqYk+LQA85QI
         z1uw==
X-Forwarded-Encrypted: i=1; AJvYcCURHYhPeWvO6u+ywzRUinFasVzGjE5EobvyPLb79TO+ybRMVAtMs8ycYOJIykoXn19fdLcyrQ5irxD328GlYERa@lists.infradead.org
X-Gm-Message-State: AOJu0YwN5gm0cLgcolOJNy+pbn5N/+gAHf3/ZsY5Ct9LioDlzCdZnGGS
	3aOJq9WhCK+e1jauhZhOgoRo6vm0TB6C4A/CZW+oIhBOjL5VYxoxA1nyu1dUaKfaqx4=
X-Gm-Gg: ASbGncvEktaVYrfMRNZWEuHCzYnKu5aB4E+7bWkqQvwQWNi1z/dh2ZHiCDLfUvTb/1A
	Ln0QE3iSFui7YkFfp0aFf0Cw3YgCfbPFonCN98wDPN/aSabijNzgf85tNSCVRdkPwM2pWr11Lzp
	+b7Eifw0zn9ilnrysLnC+1YUY9ndGCHY2ddGLwcG/Kx1oc8ZXmleS1VXJRzeeNxDLCWdVxWPDom
	H3CdYs0ppcVeC5TOxGws3eGLJWZJ5HHYXbsWC6cV6r7BUlc1HrOoN9M1e61SaHrOlv+NDx5nAdS
	sWh478/BIhm+k6a9aDHKWuJ71oJGafQ7/tiUbesFVB7o2b1AK8GPt4T0R+8/djeewT+TPXUL/kN
	9/42de22PZ2WCi2SJNQiwBAqbuZhvU1MI0HDm7I6jPn9EFfupAx8haAl9t5ouSf9a6fVl9d0c3F
	6W5hICju3sUOWrgq7NT9l+
X-Google-Smtp-Source: AGHT+IGeMULI7kQJcckUl8PhFqbeqzvrMMwqX3WFQrSju3KHYudqhjgjNPWItcVO3ZzItgHnZsRjuw==
X-Received: by 2002:a05:600c:4e88:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-477c01d4af2mr277966615e9.18.1764330956063;
        Fri, 28 Nov 2025 03:55:56 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:19 +0000
Subject: [PATCH v8 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-7-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035557_918564_392D33A7 
X-CRM114-Status: GOOD (  11.67  )
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

config isn't the only field, there are also config1, config2, etc.
Rejecting unrecognized attributes is therefore inconsistent as it wasn't
done for all fields. It was only necessary when we were directly
programming attr->config into ETMCR and didn't hide the unsupported
fields, but now it's not needed so remove it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 4511fc2f8d72..584d653eda81 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (config->mode)
 		etm_config_trace_mode(config);
 
-	/*
-	 * At this time only cycle accurate, return stack  and timestamp
-	 * options are available.
-	 */
-	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
-		return -EINVAL;
-
 	config->ctrl = 0;
 
 	if (ATTR_CFG_GET_FLD(attr, cycacc))

-- 
2.34.1


