Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328E6CCF2D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MhEi7wyHnyPXObmogB/mGJrCmlxVONKsyXqEGSo+Aug=; b=C5Y2HBgOGZEL52
	2cfg2sRhqHVunHAOeOB0C+a5zkScsaJMIhLcqHI2F58Q6Ju5nduSDbCdpS19Se0qbpGeihPCI1/cG
	tk4GeM/1zIOh1LW4yjA8Uz2D/+6YiuFFCabkDjuVApsL8SG5xP8xdzfH3IYYPuxLhVgeyRMo+iUEP
	LLgcZV9jDl4rv7Qg6d7RkKZiXzCNt5q9eSy2RmqfeyMRUMFsXbt/9ThW5y9wkkTU0xHaUF4nZaOOI
	0xFIydyRgp/zPj/OLKk0qZCkHwIi7d5+fzaMnXAt1G+NA78gMQ5V1fygNLbnWlAcOWVO5kHdyYgF4
	3LnwI3OfcOYkhYL2CSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmLW-00000001k8M-1woa;
	Mon, 19 Jan 2026 10:18:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmLU-00000001k7b-1o5H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:18:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43246af170aso2331600f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768817930; x=1769422730; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MhEi7wyHnyPXObmogB/mGJrCmlxVONKsyXqEGSo+Aug=;
        b=HTPT9ZTwVDd/ldENE5m2Wn7cdipo5LtBXGxDnHaF6Os2FkTMozJJoZD0EINeDwT7U+
         WjIIS0wwdaLSGRpXK6NxqtkItCmfNumQl1+EOnOwKIcyGrQLV2Kb4igeRHI+WOlKn2/X
         w5B4G7f3CtT5WGU8gWH3lSws2XKFBBV6hQ68ae3VTtV7A7WD8GrGwOmyUtMzxe5PVhod
         e0l2K6q8DLGOjo1c9u3bdbuGXHoeBw61mqzZXyfIHM9GDoRXc2AHtoK31mBcbxRsVGU+
         Wx27xZXih7g1imx7CmmKe/yDU55onyHaKcXrVHi+maCpdAbHyFIsg4XnZPyWiMAn3oTy
         ZyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817930; x=1769422730;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhEi7wyHnyPXObmogB/mGJrCmlxVONKsyXqEGSo+Aug=;
        b=FSgboMltielW+SuPi8tJxnT+jq3YZbystvQl2JAuq4eAKyJAdikbKnPtxkMa8BHHy1
         wzXRvgEo+tnLBGmwjG8o8e6+V6j+2fjk3RQX1FoGLEuwtx6lXdm+iObtW5F02VJ3A8Y4
         r7ABPtdl3aTehSnCJ5pLsnokXDfBW9+jhpMiReejQfGOpYCHn1eUi3YoVCQe112ueCmQ
         DitAzE4h4DVkccu3EqcNyT729BOQBDWDEsZ8Q7OhrPJXgJISMCHyVIp2hfihSWVRY1Zd
         8TRN/50u5mhKFkvdYYlY2Ajz0U4bYKbQMvk0KFVmk+QZ8b9eFFxZaVAVCrevqryg50bI
         W6ig==
X-Forwarded-Encrypted: i=1; AJvYcCWvsINs6NUrlVax9vvlHtmw6ECHdzbLwgYdh7Auv4CIexGtUPeTwZcO/ksJ8mm/7P6pMYJ7cRgBA5zA26sMMacF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Tq+yEthbgtDeXmsEc2/IxAczt93PQu0w86RH68qdAtUdpSLW
	S5wnHbf/WiMehLNHCHpT4oPEd0t6IcrKRa7dxfyYT4PP41UB2q8V3m7Q5wqDOriFfCQ=
X-Gm-Gg: AY/fxX6Dj8yi0ZbY8zaCOVBajwalscGSCrOWyY0ITS4I6KOAiaSUcp0EUuHyKS/IfVp
	8Dok/PnGJOStbFAmznE3O/cpf92cbXcLe34KKVy4/nBCAZqxNvB+T8LPk/2+akAJ4vChZN6jYMc
	JDa/df0TvRN8PRsaUuXHriHF03DZ7fKCWhWQi3R6rzT8PsunaaoR/hO58dCPauBODAKFyE/5UGx
	QkDa2BVXDCBYogewPI+Sa7v+rXsxqowWvHjABiI5j07jUdJtQTwfymDicMkDdaDEjPTsSaMuxol
	dTthyG1CSF6qfT7IXc4frtC3Bd897aVn7ANVpaZdMU6lGFheVncqTtjTJ5CXd4kBt3xv6yFd0ar
	Ga/ZhG3ewNCRvYxpDTeVeIolEbW8VdE6J9JZ/DUFQ4N/Wb8bjC5+oUWakZ0UiB7WpK/+XLyc9EM
	1n18bOzat0fivB4nioJ8sN
X-Received: by 2002:a05:6000:2c01:b0:42f:b6ea:5e4 with SMTP id ffacd0b85a97d-434df1164damr19213925f8f.28.1768817930307;
        Mon, 19 Jan 2026 02:18:50 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm23286150f8f.31.2026.01.19.02.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:18:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/2] perf cs-etm: Fix decoding for sparse CPU maps
Date: Mon, 19 Jan 2026 10:18:34 +0000
Message-Id: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPoEbmkC/43NQQ6CMBCF4auQrh1TagriynsYFpMyLWOANi0QD
 eHuVhL3Lv+3eN8mEkWmJG7FJiKtnNhPOdSpEKbHyRFwl1soqSpZlhqeOFKCQNGC8ZESu34GExY
 YMUAiZ3EZZiClJVqNWNdXkb9CJMuvw3m0uXtOs4/vg13L7/oTmj+FtQQJ2BjbVXWlL0j3gSeM/
 uyjE+2+7x9z7o902wAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Thomas Falcon <thomas.falcon@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021852_532484_0209B6B5 
X-CRM114-Status: GOOD (  10.13  )
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

Fix a regression caused by an incorrect assumption about auxtrace
indices. Then add a test that would have caught it.

---
Changes in v2:
- Fix cover letter and subject
- Link to v1: https://lore.kernel.org/r/20260119-james-perf-coresight-cpu-map-segfault-v1-0-a9cfd67653ae@linaro.org

---
James Clark (2):
      perf cs-etm: Fix decoding for sparse CPU maps
      perf cs-etm: Test sparse CPU maps

 tools/perf/tests/shell/test_arm_coresight.sh | 54 ++++++++++++++++++++++++++++
 tools/perf/util/cs-etm.c                     |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
---
base-commit: 571d29baa07e83e637075239f379f91353c24ec9
change-id: 20260115-james-perf-coresight-cpu-map-segfault-e250af5aa778

Best regards,
-- 
James Clark <james.clark@linaro.org>


