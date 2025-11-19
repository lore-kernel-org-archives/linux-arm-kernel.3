Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366D4CF3955
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=; b=eGJmn4zXOV09s8FgCwUE5n9Iox
	s7i04Z0Zt44lGdUy1QzromXJ0gYXoYD2/0ilKNh6/oBfOjIYVzVHEKiEgnVs7T9N811+jb+DfK7/8
	x14o60abf6pIDTpLx5AvCBqP1+8xbeURKzewIqeZf/S1JM+pRViFWcBeOtUB2zKJ2YsO/atgDMJSx
	D67unerU7lXJrLCNiNaEknO62P0byvU/pbBOCS59XIw5pYJGy8XtUmLtyXRrgIfHI7iRGDaG9gObJ
	EQdpKXSfydUpKtv6u6du0aWHPnHwyA/RXaWD2i26U8RuG0jK4/BJRt+vBQU5Bf03Dm1jlwUaYee8g
	QW1FSS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktG-00000003fBA-305v;
	Wed, 19 Nov 2025 16:18:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt1-00000003evV-3GAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso38902795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569106; x=1764173906; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=;
        b=aEPCkjsMXKSY40ytclIhv/LqwKn+U4mpDxfTKyK46IWgLBqs/3BC9EBRhDsUJWWofZ
         ekJ+2TkattiSjuL4qkp/OSm6rZAvVgYZUj4lIS4xt7V2luA7sRfeuIaDPjCkeZFUZKYn
         bn83ys61AAdraxtta3oYOVsaohPFxplvAEMEbWfZrX9uba/SXax0DjGO2YhkRmDsPHqT
         dXgXm3Splesi+NlpMlstNkIGy9NEnH/Pp1VbEvnbTCcyeai8edpJu/mLzU855I5MXqa0
         fJO0/K/GChNNTISADe7j0X3ygKcnxIhsOvf2fTsCyYKN8drEAe1nhRFew7ilh1lYaQKO
         J1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569106; x=1764173906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=;
        b=UdHE2Vkhako1FUlyAYL+Yy7lP+M5A/GMWp11f6u/INi40QdvKT230Va7t6jQvcc78n
         1GCDEmY1QSv8ZjoHTCfOnR6ndYbz8p59emEuWlyVdCQfrNEhlM92Br18MjIVUcW3JYoB
         yqUSbz/ZO4h9qY9ZflX3RQT85yFZyJiZyElBGuMTlETMInp8sE8ozHY4t/oy3mRrNlSL
         noH1sd5XqqCfA7FryzdBeHx2KNkGlCwbAY5iVsu6C6dnXKQTteZicfnBM8u716Q/tWii
         NuQz5j4LSOLF9A/S4ca20Kr2JAZrzhL1QUJilv3AXRBwv6CmzXEFdL3rj6HptHae4Cqj
         M27Q==
X-Forwarded-Encrypted: i=1; AJvYcCUA29wCOX//i2Z8tH2JwOIEwJCkLkukJ31CMBdtLAbJqnZn89pEv6eWpBgDk4UwYE8ZqlH/5pPBHi77XB+xB3sW@lists.infradead.org
X-Gm-Message-State: AOJu0YxkbfNVOqdVEjRkNvy5+5LLhMH4NSyt53/jOszsh46K63x43Hav
	5EJe5l2pd+CGeEY0lwNN4HTZMs2zjVW+nRufSDypWfNiKd+qOUCjygsXMgj+UIM2snI=
X-Gm-Gg: ASbGncsevWRmkBATPACZfAurXepNrOPo1iRV+GjdXXVGBFbi18v2KuDsnWDIdkP4Pjz
	HPbkQvPQggIV91sq1VA38V4np1ThUkYmxVhVzimm1yBYPkBb0Q4YP0IcC/cEkZc4PSbWorqI9v/
	zosS1wU3/npDQiIGedzbthOjaQczLT4PiQCSxFUOwjaDK5ugnXcxq4RaKQYmB0bBz7uCzzSUBQO
	yXdvYXQsg5lmXhqKYP9n4r0Inp9UF3KDsVTteGID3/H5J5NKnfEaaotQBnj1jAN7wpuzv2cK5Ix
	FRfJ+LHPbaTxjupTw6Q+Vyx7CCdyxhBYk86yAf1XEQ8JcH2ACPiRwbwvL1R6f1BD5mu5BvG0FMi
	PChMMN1NUYMNC1Kh6dz+odKohxVjUCVUTLZ6aVkuT0faABEeg6+sPO95KkfFG04J/XSEALyunpO
	vP5+XuRbPx/Xnh+PrKtexm
X-Google-Smtp-Source: AGHT+IFq5cBVYvvZ+7oVK13tQ0GTA3nshqd52t9/fz8kEaZfjoRl+N1fTrpRLi6jbMCiDb9ubVJALg==
X-Received: by 2002:a05:600c:35d6:b0:477:ae31:1311 with SMTP id 5b1f17b1804b1-477ae3116a6mr51188885e9.13.1763569105548;
        Wed, 19 Nov 2025 08:18:25 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:25 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:03 +0000
Subject: [PATCH v6 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-7-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081827_831533_F1FC0AA2 
X-CRM114-Status: GOOD (  12.50  )
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


