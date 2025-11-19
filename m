Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AABDCF3951
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=; b=JsMDbDwncTVsdA6Bd7fkXkZ3Rc
	kBEquzzhJN1iNSNdTxzfx8jDj/Y6+ZBcOIAK25tyzauDFKi2vKy382sJXiKNzUUiom5lDrT0sGc2P
	QEcXmVT2RCU3fajLz1oW+vPLKGuVYQjfg3BwBzacxSlWDk6GNW5A6reQUnyl1V9PisGHmg0s9+Ysg
	H1RqpKEGfhWhAF6gSGhOaW2LR9YtzlYmplUiz6jTdAiFly0+xSIQ44KnGComLFBcCbxQYII62JoSH
	wRwO5Eu81wWhQ+FRf0tXcpXNjy3s1MEzLnbW75n9p4L6ZkmwQeizT4d8Sfyao9iO0YLvA93BsrU1r
	EhMRuFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt2-00000003eyH-44Nl;
	Wed, 19 Nov 2025 16:18:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLksx-00000003esv-09tj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779a637712so31511745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569101; x=1764173901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=HH5IbGy0Kz6VGM2g3LWbRBaqMMjzR3wO37rVoyf4h9aPAAamdK8vbECT2HX+vyCOIA
         3fBMWqOvrVJbRg8C77NWAjY4ST01T7gUrFyhkxwuGtIYEqf0kTSeg/kMhHqT6SkZJgCV
         CLjzRMAmp30dnEEyPyCoKzQQcy/lyLrxNy4r2w9cIdfnnvScvg/+TV3SNj/wYTUc+w0+
         ywjl8dSXULL4NZu/kgvPmOE41MXsbFKnJpQWwGQlH6+SUfqvef+sesC/jZfWzuQjoSaz
         8EIugeqL/yNhdrR9ZII8+w3IntXe1o4CfG2SA1lfQy13YhtHytcwA+mrS1FTFxWRdeMk
         NrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569101; x=1764173901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=uOL31SZdQ4Z8MKhi7+xob4d5ZtteqyEz5HBADqRTesMrLTJsnXrmesfIW6FBVQjvsq
         RShinpJI6m1jKF+6qohxdwWrtuk594JdLIlRxKKhgz9/IP3GqpJr4C9iqTL73U0rSkPp
         vpHl/nwchSGE93M9blpmiVRn4/Yy9LnnH+RRftstpjLYpccd3m6xY4xSLV3eKqIq1y9o
         WgdbjJEuqAOTXA3xZNs9J9yYe9aGVuZckhlodfO3O+ymsRoeuEMcW2qkx0L4+Mnl2bdP
         Fkm/vUV26EeVVFNFdg3lm8BSdUPzdFck8+GUbgjZR2VghGZc947rZrSUOKcEJaHlI7Dy
         /d3A==
X-Forwarded-Encrypted: i=1; AJvYcCWwPJBG0TLhgE3uEbOd0kvVu6nn2vk+IVPZqzo2h3olWFDKF/wtO7f2xkqV3LkSVxIsqeSuv7tc8+hRldJNE8kn@lists.infradead.org
X-Gm-Message-State: AOJu0YxJF6/oZFejuL/UiUj6r+k7rjpB56YOBystXcEdnldW71enmqrK
	MNdIAPTLQQJdEo9QqpfUhdB6FmrVZzCG3T9RZPAW6Pu35I9x/XcaHK3UODAhEIbeD/VTChw5OHv
	duXPYED4=
X-Gm-Gg: ASbGncuN1AoLXQ4PXttdKl8iWqF7vncKlqhp0iYYYR5Caqj9F3VgYx++8SqHcHD2VWO
	OglLpnahk9meNygYaisGW/PH3x43+5Jw6deDfwtNw9zU1VKcpblXSNRIwZQMWU46PqyjOxtV9Ll
	RB2diRzKhFqPFAdbqNLXROzEBlwjLeNBInPNZqwwU15hQtw+fDhECt1ef5RUO+yxdmC4c69EPF9
	YpzUTmwvc2iG/HLfSR1bque43FfZo2Uak+xFfLjLxJTlIxWTlmiXKJmqJhUX2VfT3ZmIB+WcWw0
	GO94nebwC9Qm8XAexo/LyQaJHypoNE/9mCtKUqPuwyexn/NAEYjWNFEfpYMHyW0k+pCv65AzcA5
	VaZOCVz+85shu2OCpa4Iwc6WA7wzke2QHC1yCQ3l5nLgINJuld/4vaTVxh1MZAlH4piSf2j0U9z
	Q53kvYfNSDDIgkVvf6XCY8tXVHqyv130U=
X-Google-Smtp-Source: AGHT+IGPmIR6fhHuU+9ub6YJI4vO1xz6v6JjUj7F2wFmtYwIjyDK53AsfCqofC6tMxhfeD9BaOKxYQ==
X-Received: by 2002:a05:600c:3b8c:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-477afc5fbd5mr46500005e9.21.1763569100936;
        Wed, 19 Nov 2025 08:18:20 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:17:58 +0000
Subject: [PATCH v6 02/13] coresight: Repack struct etmv4_drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-2-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081823_100558_E473E919 
X-CRM114-Status: GOOD (  10.37  )
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

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 0287d19ce12e..d178d79d9827 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1016,27 +1016,27 @@ struct etmv4_drvdata {
 	u8				ns_ex_level;
 	u8				q_support;
 	u8				os_lock_model;
-	bool				sticky_enable;
-	bool				boot_enable;
-	bool				os_unlock;
-	bool				instrp0;
-	bool				q_filt;
-	bool				trcbb;
-	bool				trccond;
-	bool				retstack;
-	bool				trccci;
-	bool				trc_error;
-	bool				syncpr;
-	bool				stallctl;
-	bool				sysstall;
-	bool				nooverflow;
-	bool				atbtrig;
-	bool				lpoverride;
+	bool				sticky_enable : 1;
+	bool				boot_enable : 1;
+	bool				os_unlock : 1;
+	bool				instrp0 : 1;
+	bool				q_filt : 1;
+	bool				trcbb : 1;
+	bool				trccond : 1;
+	bool				retstack : 1;
+	bool				trccci : 1;
+	bool				trc_error : 1;
+	bool				syncpr : 1;
+	bool				stallctl : 1;
+	bool				sysstall : 1;
+	bool				nooverflow : 1;
+	bool				atbtrig : 1;
+	bool				lpoverride : 1;
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
-	bool				skip_power_up;
-	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1


