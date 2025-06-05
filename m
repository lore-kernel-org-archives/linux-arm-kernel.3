Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64820C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=; b=XizW6cAchrpYaq2KzhAzCmWvNf
	aDozSlT8QK2EN6o+fUjYd9FmnBrXupC5YjkXzaSv8t1EhOaKhZal252iju9dqme/gz/Ccgk8Fwyjw
	zXgPmSXKeZ+q0+2wqGHwwAYAme9ZhtyFvfgw9tDErJVhovieuqvNd9MPjYSOaajaUHcSOYYYNTx8D
	IIGrXrFr9dMyd9bXfapsSzJHY7u8Qv8IFof5HL1v23p4jRVGlMDlJ4XUaaGfAvXGn4GUXyA+hnEDQ
	FRPmw4E1pBifoyqZbHWlyKdJmCnCqokMWJmA9igphotqM3fOn2VXoeol023/SP6LDK1Biteq87EEj
	1yCYaPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8QG-0000000FKdi-3fxB;
	Thu, 05 Jun 2025 11:06:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Am-0000000FIHh-1hmE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:50:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so645427f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120611; x=1749725411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=JGZAHM+Ho+PTngunIbKaLARrWbDoZFs4DWdhZyEGqMDbjcNRsecTEqfDUplAnRIoVZ
         qg8FO3DxyXFnljvCbihFlt3gf7M+nMrQqUY6pLndfPKEBG2ORJYDzh13XbkxFndhvb+j
         NPC3+e4Ot9Pa248XBVFLpbMN72XCNmhcAT5XgdvmqHmYsi6vOoeo8HiWBGfCVfIWJGp6
         XmyJbOfg5f89Th5heQbgkIXwbwU/xy1nmAgLOd1Lslsr7yPOa4VZZKNZSI8vns2CWdh+
         QGFcksz36Lw0ei/M2tDWr6p8LFt3x+68NxbmCYHQgMx5hURC5uJOi4vcHe/km87Nijsg
         m6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120611; x=1749725411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=Qfsz8+xbwxFV8y9HYfPGZJZSaCtRAVlgSNq95/7obDMuBm/2aZTVVCo5rkZ+IVkypP
         25f0sqz7w+xP8eZk59q9bGAPhkOlwphErrHdZ7A68Iiw2F+rZAMa1dT16Lxm4iWgzFYz
         zBMednR6LklqlRSd65ZtQp4ELeevfW+1zYFrowwEfGgtRtVHMerVjGDxo87gXwaZKeNU
         YcWgu0Rza7GBMuaz8vh5fVHh1mnWWm+adsb1Gmlk430XZ1uukCxtx3ce5LrVLfwFyKhd
         j52lrBi2nE8D/bPVF/Z/v3GoUZlprMv7LQjsVWxn9umVhZ4fenn3UcIID6Ld84+Dmr8Z
         8xog==
X-Gm-Message-State: AOJu0YycAeGc0MIWRkzuCW3Q/r7xEjsnY/SlC2s5TXI/K6VoLmLcECle
	lCszA65qvv0ZUxTwBt6E3RaTeT11bMjaF/+I3DVWnCTScrx06Kwi5gFsouKtkQ0ViMM=
X-Gm-Gg: ASbGncuGVPeyekf4yVkOizNH/N1I5ZJl3l4e2t+HGG6Sgsd6+H33ZiDdCkp3U2lqSOU
	MaP6dJVojeo75j2Fn1Hlrp8edNhRSrfruk0G5ybtdTwAClbnVR+FIqov1150IKWN/qzSl9/1xTE
	UQjKE30OUYxvGuBQ4lWeQ/VMv6L6kwtlNMNkUbYUBCtXtWLRfbUsk7Gfs7EJy6ECCtW/b7iEyXg
	uooqailZ84o91yAXwNeDg8IXLthTZ7lf0+TshAaJLwk42EUWyJ/fkt0OTW5bwSdyi57lJf81JoD
	VXBQq9Z3ptF6AoMsJ0dKVMUfuiaR7UADWf1GqCPbttktniyOjlA7WIghoO0a
X-Google-Smtp-Source: AGHT+IGgu16RRFx+Y09hUhjKjxwfPfRayhA9cKQUsDuzGVsP3y8rnAFwlUH2ULqYWuFyxL3gPk8m4w==
X-Received: by 2002:a05:6000:2389:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3a51d91f899mr5503049f8f.17.1749120610702;
        Thu, 05 Jun 2025 03:50:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:04 +0100
Subject: [PATCH v3 06/10] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_035012_498794_E09CD17F 
X-CRM114-Status: GOOD (  13.30  )
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

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1


