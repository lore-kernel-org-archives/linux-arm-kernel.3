Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48CCCEE339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=; b=NjBNdT9KcZfV3zhop9NgjsObjY
	5U/rAooHj9c5g05PhE9sipraxZW+H/49EwzU5HDSWQcULdxzsd8GhySPYwo6axIcV5YEaE2bECEpD
	GSaZVOLXEB70jAX56klUqo3G5/CzJZYrT7aDbW++o1jqbBPypgIPXAwbnmeQRfsN5BKzsDUJqSwzg
	LshkH0+ffJVDbXoGcjce4AyrfJRLuyYLMc0hL7p/Y2d50Ld9J+q7yzIDzoc10VHSukaMqVpa08arc
	6/p2WCROSkE2vV/UZ2xf5hZFAjE9vVYKEUT7hHs53FZlHnGUJW/ywC5JDwPMmHyHkw44YYgY4vN1x
	eejwNlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ6-00000000jSo-1t1P;
	Tue, 18 Nov 2025 16:28:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOYx-00000000jMI-1Ed1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so34606615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483294; x=1764088094; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=XJEk/qXf2TnH8hA0l9xdz2fZV7QsUgsnTl8It1NXME+t5vM7YxUrrZAAkgCoaiiVIf
         nYFF+wNe1H3w+YwfR4HhBnip0dPkXeovIVByi76oz+qLP4F7bHGtR2Z57McU+5pHTMGo
         4Ond8Qp6FzsmVvCi9cgN1IFNRXaszanZ1bk8HZAIfL4FtPYVXyXkBPVJbsYBbH56MJAz
         WJTiBNIEI0lVAhMk8UYaY7yu/7rbP9tpCj0HVwWuxI4GFduNVGIiB+8r1KQp10MwMpZk
         +0cCuM+omyBWf9CR2bF9Cn+GfunCpFW3gNtHHfAkc7iZQm/+s+CIOljHAA+1+GJSVm2z
         W4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483294; x=1764088094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=IoEXiaP48TJtoacinadoD1uY3eMRrdW7egbQ0DB8UNWUaYlZPRMxeSDN2n48ttakvw
         kL//9HPWNGnlNDoOMwdPqAa5b4Be8newWLvA800LIQ13wBgvb7qXffNuHyu4hpQU4MkR
         uZ1LgFOtDeBdU/HdT0/sIZBEJYf3Ngf4MlEMUUIUDNrYaX6B4UrCcLjyuptI1T4BKob2
         g0c8z3sEb8EUQtU5oYxYaU2CsVY1RR/PlppzXekDDS8pbBeqnkGo0iqnGE1FSksqKLrG
         8bQ/hBk9Alz7Gf+FzQkpjiruwzC97uSCDlH0oWTcz9PeXQ5aC/+vfiBLVMDgO18Ckalw
         pd7w==
X-Forwarded-Encrypted: i=1; AJvYcCWGqqQ/p/ufiPH7x3dFWVef41+UqKOIwmJ8OnRyPqQBJAwwB6igrKrWMKorgzshUWaXJorKsW9bZJ4jmKTTC7Ct@lists.infradead.org
X-Gm-Message-State: AOJu0YzyDiYfitF93d9haB/ckMVlhzXRZHZCKxhIO/tAXtpHCbcuVzpZ
	Hza/wubeNpv+TmapwT1bOoTW0hn6fQSaBaaoTVICWaOXkoRKP3vbZ0hdYbJUjcQgQP5KrrP+NJ7
	+B/5J+0U=
X-Gm-Gg: ASbGncu4/FcBhK6u7uxBLO36pajnOg/u6KcFOFJATMeSiGXkg3RgxKTWipNGX+kvD3S
	wsx0IgLoDVPcGMm/Bd8+Sb7ywxFf8I+FR6yZeuyGBGp31LGft+trzXOghUDIZaPILnJtJWoibk4
	t8MzSzeip2tLomHOGj+Ws8eXd2VMz5GwMpnk6DIcdb62MeO3H2LRpBeVByBzS96r53MppvspLgl
	wWm8B9C78q0nxLmPqpHdsjWUPQrSc6r4ZXPpL05i+oiFgMXtYEC8q7snQ3+5HheTZvo8sLstH9J
	3nuOcmJinX6y6fdpl12Y1UPwR02kwzfApdaBP4LFQC5E4rLzfgkWuWEiryOo/9AsfreGvwadWdN
	CkTl4I5yIl1syqZIWZkrcdXqvM5hRY2ueB0en0yU7fKvRhIS8WWeXtnRrEqo7Y7zj6avaPkznNn
	n1DM1XRGV3YB/Y7R9FK5zFAPJ6EX1P0vo=
X-Google-Smtp-Source: AGHT+IFC51NmASmxCttbHA51J4ftuaZisW7lGzCpDDloTLqiHxK+S+7Yx2njgihk2700vNnRrGielA==
X-Received: by 2002:a05:600c:604f:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-4779b3542e2mr78799175e9.3.1763483293681;
        Tue, 18 Nov 2025 08:28:13 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:13 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:52 +0000
Subject: [PATCH v5 02/13] coresight: Repack struct etmv4_drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-2-82efd7b1a751@linaro.org>
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
X-CRM114-CacheID: sfid-20251118_082815_351518_D82355DD 
X-CRM114-Status: UNSURE (   9.78  )
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


