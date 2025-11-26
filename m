Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A94D1037B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=; b=vsCWBnrEMNwEIPXUjhuLPBkqMq
	yIdTDrf4EYQVEFAfYD5XVntMEDrnHXdCHuav9qrYF5/0n0mmVuhDlUtSOqEmjxW5qxi/ZZZhmfQ1R
	ZiFRAPa4w6b9TsUU2WmfrCyWnfkFHukE+s9o38XEBlOwQyZCpaljNT2b/qfIpFPH8HMSfxyrr4+ZA
	ZyCY6NmNgt+d/gZ091Qi8oW6E/TkGp25k7I4zZomtQKK73+BFNr3+rVEt40bk+LpwxnU40VapHvS7
	CC+bamjSH2eFwXILvRLjffWBNgwjYFddoRiJrVVGl7GVKQoXun50Tqp954j8ez/KQEzDz58QREqoX
	qmDa/+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDz-0000000ErG6-20ir;
	Wed, 26 Nov 2025 10:58:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDc-0000000Equa-4BqQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 10:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=; b=YaUW6XAYSuk4qs7dbxqVo4pGnK
	YCcSp4x7AOSrf2UphwwzYRowQxt0COAfT4qf503l1DrKpK1eVsnyjVQYztkJdypNhas4qNv6glDiu
	0O/n+8SxxW7cN/pw/pfCBtX0JRfSxBp9cISG/SzbR9bqHdc3Prjjry7V8CumJ0Y08fjZk6NCLbVE3
	ilqkQcY2Uz43fglGxs0RIAg7t3Ir1JZczFcPVATk8wW4975LKlYTVQ2yxqBLB9XeaAVtt4pQLTvoR
	UW0ZCGAKMGPJ36o8AtkXyPg26lMrw0/OMwPrhobpBHxbaQWoU8vuC4b4iQAMduJneFhEArHddhJto
	ZyzlIksg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCLu-00000007lsH-3hxv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:02:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so62713445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154664; x=1764759464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=oxoAcdhIQn8uXW9b2jMnLGvHvCtpfLc8/YS7qL42HoP34nO/mB/LS83aTFIagdoNkL
         ynvkrNAT5SgKQMtDHqtDaQILt8ODXuxXQtFEcnhkk5YJXnnmq0IqmvrSrfa9mHEitPuE
         vJ8hDPrNdftZ5nCgWzPfdaSmzln0QPZu9FHF+qUOARlUBtabakzsbmd9YLE3t6Y30LPf
         3jV2NDyiVoTuyW536v9ZQWwJG5S65vsNNMkRe2+YD7nLSOr9LyTPMy/pmgKf+x6abuod
         iPyR9eFXsBs5JUYZ9VqzN6+KUI8Lp9/RMAg/AECrnsNlNKlUEGZxfJJnx0G7BO7h/IKE
         HEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154664; x=1764759464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=ryTsk1HywDI5OyN6EdNo+upKg9eO9YvDEhSoHaEeUQAiVy4+aKypNDM3jAi1mMmy0m
         aLWse3wj7jhbo9XOzOHqZIUXIB6qUFD++nIDKaSnjwyVejktsMO6clNpmzdnsbEK2lPu
         hsQE1CA+JZhvTFd4vAwMBjJS8ZTxG358lrrbyY1mrVNTRWUwmSlR1Bx7rZHxIjOEwOT7
         peAW5tkQ6rPYvhoypucSBbbLCD01db/GQEqivMCM3V/3lKVclY2vnt7NUWVN4Pu/H43A
         gO5uoqf8bmGwM7ARagazb5olO5G252hgoCIBDk1KZZ7BU5vf66rVH0WIZVq4b2h8xaHp
         RySg==
X-Forwarded-Encrypted: i=1; AJvYcCVVHl38nunE+YPJRrjdGPiaBV3FgMKLTy5Y0KAEcUvUTTLDfqfzkKkYm3QtncWej3MiX/2gnz3r5A6LmL+QCaQd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd32TXfZ+NiPUWTuZkHFIhbx0lux7QhnK1wjQS5H32M0fL3GQv
	PlBYkhhcoET0rfeptOO8/u63SVeoDJk0uOjqniXIlnI9389e+7I/vaR3qdXHtAWha38=
X-Gm-Gg: ASbGnctGO7MP65WasGOlEbpt3UCU82omg8L9pGPb7Xv6uDOMnNEKrHluvUOWecgQdth
	qyR/Gkul8CR+z60YErjfPXoAxL8WyhubyI7ABH7oZmB7VREfJBaZRg53PISgr/m7AYVledGIZCN
	yDdzvrrFEb51FIP6D5FrTquk12lbqW0A26QbbSSwIx/lg3E5DSihD0v/5YxGXFWnMQZMlAOUBSt
	F972+RbQJp8fzkZh6ylz12x16eWyXrh8LEestdkMx7Uw+KZOUGjl2oPGo7K2ZGUEcH8uTuYn8ta
	Z2+24hcYLG0xkox8AawOeVJ69z+hvYn6jxqdyXahgw0bJswUd026TSpXF7rKAXyKfcnNk+SQrbc
	y9tokg1rQ9l4LDqq6xehFf89qGBxFCUIGm0r7dRcOZgxve+m4y6JZ0vEzisaNLhtMxuf4lebew7
	fFOBy9pli04eLNJBU6rVjJ
X-Google-Smtp-Source: AGHT+IH2Dz4/STj3d7ezVk3tlaHON/FWp+B+Izg1b3VZb+Q3ynleHjsb/oSUVp5AOHtWtqMGcn67OQ==
X-Received: by 2002:a05:600c:4451:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-477c111bab4mr190578555e9.13.1764154663638;
        Wed, 26 Nov 2025 02:57:43 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:43 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:31 +0000
Subject: [PATCH v7 02/13] coresight: Repack struct etmv4_drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-2-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_100223_461345_16BD4B04 
X-CRM114-Status: UNSURE (   9.63  )
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


