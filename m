Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9A6CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzxatPwaT12t+oimIyPlP1cYh9Rjm5+9wuJjQjgausI=; b=H6Ex6ujIX/FZzSr1DetzWq6RXi
	EFH+TE5CQ3rUETfFA5ncwg2phzunI6/8Uui3f+mPS9sRsecE4DPFrpfsxNx8fvziRbvULlcvrjoOE
	pwni9N2IEIi5vEjUj9WQJ3QtzXISklV2SdiD/T7sE8BOyEDwxK5tjhA9xNtAYdIKpGTOiiFPNaAa4
	9utOQU/gdMSe58ds8yyruHRm9f9234EZvseA6fm+pJ+pOrkugrJWzsTUQ5pytieOjOybU/U/R9KiJ
	59eIUZCHD4exDDr5TtFXpaRMIrfQqi7SoO469UvrM1ke6cU5ztgLDGsImk6TPbPI1MdRevYkW04eC
	SdesjJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg8-000000092Im-3Cpl;
	Wed, 12 Nov 2025 15:22:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg4-000000092Fj-2yVJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso794983f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960951; x=1763565751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzxatPwaT12t+oimIyPlP1cYh9Rjm5+9wuJjQjgausI=;
        b=Weqr57DvOfQSzvx5qknPOp5lH4TvqL0IBdChf1YAOVoXRlQeP8RFkVqjmgJM/SMtfG
         ue2ac29SlcypuIZKGRwtd7/w+mVxrbfNQJd+BcQNOW+WR/iqc47S0NK6JFaS2VHcaWbB
         pJ6bi9w51QZ+5DB3m7e+LQH/v8AatztY8I0vhOHT3OEq4QTQN9+U8xBFFjxVnLRssIKJ
         myOKYbJRl1dLJNqpB0Hx3+Wqw6hzsYMrpLtAgXDc3BNPLynhPLm6DSr9pFFxdbfXcT2x
         e8SRjEzfSco5uV4/k0rOAXTUlQ3/Lub+H6crds4P5z5IINInVVqqaLIsrDIglVjL2JWN
         gBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960951; x=1763565751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bzxatPwaT12t+oimIyPlP1cYh9Rjm5+9wuJjQjgausI=;
        b=gloPJr1w9W6rXoMJRWYQZUkyELqQN6I9OMV5Wf2d2onWQ547Nb6ZtcmSvSwMT3b+Lp
         hqZPb+oWlAg5EHdYSyxsBnRCLdztnCAE6HLHB2AvJB52tS0STrNIuz/Qz/p4Pn4A4G2o
         rqSFFiH6kJp0Axo3ZsbnRjTxmO1W2lwiPsfRSArzPua7pl+3FTSYU2DtBsn2Wsvtp4Nu
         agdwS7IuGBvuHVDjAHCotHA6QsgwjJW2ewdrU5yyg8HyBLDJ7mUyBVKLLpjUCJ1WSXhw
         mFanZ2qvtubp9+Z+kgIUtSDt5hxl03o9y6lAvkgZVODzwPw71wgGWqZmKS/RnusaOAxJ
         uh0g==
X-Forwarded-Encrypted: i=1; AJvYcCX0pww5FPq2MCU3hcNwT16w6TX/70P4PYJT1XU9Q/Zk1WdBRk0FoB77XyHcvcMbc7KOhWTMsvbLMVtS+mOvku5u@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+B8k2dhYOhuVcCkwsvZ1keGirQ1oKiXhomACSRHo7YDyH2aDa
	8qlr/X9+BMJO+0XMwpCpPrp8ahT/uUmpckQiNBQyxVc6lqc8O7jAKY/CMc19U+UrWAE=
X-Gm-Gg: ASbGnctoDVIFfgXMpjX/zm3Qr+52deoBxnhSvcQZ5IrAfYKMESyDMdeQBEwYMs2rfjT
	DQt/5EVQidbG3Ql2wSIdNSBqKs9ixLydssy7h5FVefNU30KQagex7Lagaxl3nBZcmM+iHhqwQct
	m883EgcCYB7PssCkAhOddTw7YV0PSwKKB3pD7j5Pd1M2vgECBA3s+EddEOer30sWEswPhQ3PsMW
	Ynk+7Pc/h7TD2vTBGTn78wJw2JV8YaAIXrWnWX8BAxeiSAE3UcnHmV9EC5eG4f+WxdwqZXx89t/
	Ep6k1aslMvu6aCh+9Gmfsxo1+8XFAFs+hrESK+L8M+v1zeb+sa52D19VEPiJAwSljlBzck8c/9o
	V8xYTJL2h1/Gubhf+KQmeJ8oV0OqMCfJfo2zipKDW9DmatwaW3o79p2GmrcHSeb9+lKx8RSnZwf
	Cy3vQ5SkIP+w==
X-Google-Smtp-Source: AGHT+IGB7ysGckgxYCnh4ScRny7zYE81+b6VpNLPB820Ao4qDE7C2hKXOhk1d2vMPEvdwcsZY1zqmQ==
X-Received: by 2002:a05:6000:184e:b0:429:c4ce:eeaa with SMTP id ffacd0b85a97d-42b4bdd625bmr3030116f8f.60.1762960950859;
        Wed, 12 Nov 2025 07:22:30 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:08 +0000
Subject: [PATCH v4 02/13] coresight: Repack struct etmv4_drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-2-165ba21401dc@linaro.org>
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
X-CRM114-CacheID: sfid-20251112_072232_777045_3AB832AF 
X-CRM114-Status: UNSURE (   9.57  )
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
 drivers/hwtracing/coresight/coresight-etm4x.h | 37 ++++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 56a359184c6f..8f546764908c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -962,26 +962,27 @@ struct etmv4_drvdata {
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
-	bool				skip_power_up;
-	bool				paused;
+
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1


