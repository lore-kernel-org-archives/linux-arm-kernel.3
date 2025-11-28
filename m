Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139BACFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cth2HfadlNIwjuNkYXpg5yJwdRtCIZo2ukA+LLh7V4I=; b=B6IEofmfJ0h6qFw4hEf3rUFaCG
	qJYEprNXmWVODEHsqFj816RgFZ8vi5M9aw23dmgFvLEaHaUfEZBlXzZdTG9TUcKG8HdKbifeuOOQz
	KA4DIP+pi6wUsoSNov60/knsufUL1ybKv4N5iG65GD4Uo/CqTUoQkizqM9WCv/y6DvaY+P8jFk0rJ
	pOQA3G25SMhPEOz2A4bGpuZmJaJ6i0nmBv6wus6/SIMrB2iVvUJXxH74pGR2oKh3qqhtub/VvK628
	5+ZRnRUWSql6OTZKUNCsWS9i6184lL+VPd4MnfdPa+23Lt0aJDb5KE7VcCEF9Totd6xcRxKKhZAQW
	UT/VpWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx5K-00000000O4k-0Caq;
	Fri, 28 Nov 2025 11:56:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx52-00000000Nmi-0l6c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:56:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so19799935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330962; x=1764935762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cth2HfadlNIwjuNkYXpg5yJwdRtCIZo2ukA+LLh7V4I=;
        b=NsQMgXaqUGSBEB/CNkwRg2MIZN3qgLNgtXqmq813zVGrl1xmKGGA9f60JAr3WPdj11
         BhnaJ+AujiKqy5sT9+B6hgrXfgSR2l+HMQinMR7aQMIhaE+CzXOXpxRhPPaIPM6YXcTr
         wXiSdJBwzwQgyMUTapfWaqBwkTVr+JAHohJ7Dln+PF6TPJtimvMjLJlCWLbNHtQLe5iX
         xARbbiEs4VqTH2niftby1pLOtTnL6+96ExkOVItq9G5Q6Wnq/p0HywBIg7PYJxSo7+g5
         pDHViDrj16jkFIi3p00VC+tZlEOV+O0oOhVLz42DbgTXsRnLsN+PBx/kGxVwMEIkNwPq
         fG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330962; x=1764935762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cth2HfadlNIwjuNkYXpg5yJwdRtCIZo2ukA+LLh7V4I=;
        b=gfsYUU84n31uZ7owkfZQwsyP4RQNCdGEnEoQxAs9z2uzcgeVKK2H/v6OE32dQpeCvZ
         GlQiBDNCu9kgHnGmc+CWoYhCOPqa31iypphKRbpD8oQ4QXMRUPDr9v1cIUREF9lb+c+N
         wLdOk/f4L8LyQf9X3TLvk00fS0gOxA3/gttXeC3BMk5qP4VC4B4avn1h59k/6XAehJoq
         Jxx6wXvv2QYDdpV4WO3961zt4uSqMsQcS+edaF9lpmYkgpvQCjTSsy0sTkJTncxK1YzE
         Edqc50zxgaoAoJq1jYegoEztLocw71jD3WL0eBgvnh6FecBHDJiu3RhotT+aeQkKhjgk
         pyKw==
X-Forwarded-Encrypted: i=1; AJvYcCUtL1QuNYM6w4KPMxWdfVKgVFLZYyLaO941pYCWVZZFmZB2b8rSaFGHz+msPaqNkRTMx0Qho10b63wYfFZGORqA@lists.infradead.org
X-Gm-Message-State: AOJu0YzmJf9Oksb+Q1bAJXQy4uwzWgB42Ze5UgC85ybRFe2Iishy4zX/
	89tHaDV4PzUQ0O4xRbCLJgZyG0N1xSWaF6LbLGfgTlYC44tYWoWzp5w8iI3Ieq45wKk=
X-Gm-Gg: ASbGncsQUOMLmQu17gpxFMJQeDfgfjeAbAqv+pvEfLz4uD1pG2nm/tSBikNs1YnlwmX
	oWJ/++b+Ddy73XdrKomQ5ptHqw6sKVI8l4gZ8gaOZ5dzWPQnMS9dQIqeGxVC7q85sxj+kpuerxl
	qVxwaGdvmMMhSagW9h7KG3KJvE7GE3fFh+1qe2SjsDuuoAPxe2FVMtFSjGWZDic70bWrsHLHgOR
	UZv9RBaRXSMGZH/fBoHhe6YPUgo++xtNvcQpBshs3Rjpb5CLyvvwqNpSCyyfni9JERWSqVY5+O/
	sQI2fhDK5R+eQ8HFqYwsxqR6GX8E7qmwYyyhLuFt+LQyXTwgn8MBZWLl98d27k316tC2hmNJQw7
	k3FIXlzGnyqcojpjvK3ykHdGOSmov9fC6MzyE8iJigSfQt/mZ1MAl3bz0jJ4hqhY7yQWIHhi/BI
	h3W7Rxbf44doPfkmRnVaba
X-Google-Smtp-Source: AGHT+IHPyD1xyffyVNm3+d/4wd26K/XgcD7YW3gltFP0yISG5I/GpHGJjvh7e5mHCRlPRu4u6YXiag==
X-Received: by 2002:a05:600c:1c92:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47904b2c2c5mr166562705e9.33.1764330962372;
        Fri, 28 Nov 2025 03:56:02 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:56:02 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:25 +0000
Subject: [PATCH v8 13/13] coresight: docs: Document etm4x timestamp
 interval option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-13-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035604_281668_24C56E9D 
X-CRM114-Status: GOOD (  13.73  )
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

Document how the new field is used, maximum value and the interaction
with SYNC timestamps.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..d461de4e067e 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -613,8 +613,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
        <coresight-return-stack>`
    * - timestamp
-     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
-       <coresight-timestamp>`
+     - Controls generation and interval of timestamps.
+
+       0 = off, 1 = minimum interval .. 15 = maximum interval.
+
+       Values 1 - 14 use a counter that decrements every cycle to generate a
+       timestamp on underflow. The reload value for the counter is 2 ^ (interval
+       - 1). If the value is 1 then the reload value is 1, if the value is 11
+       then the reload value is 1024 etc.
+
+       Setting the maximum interval (15) will disable the counter generated
+       timestamps, freeing the counter resource, leaving only ones emitted when
+       a SYNC packet is generated. The sync interval is controlled with
+       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
+
    * - cc_threshold
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold

-- 
2.34.1


