Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA186C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiWS5xibm4AuM2M11jS2y7wQ/FmG+Wf2gKfhaKMAwvk=; b=g39Ga/dqNS5uO7BEYDasj4NDdq
	U0Yvmx+fJKM7N5DOg5Ti8gshYC64hlmy1V4jRoWpiVRBcUyNY93CfT3Kbu6uJ53jhhVoP3znDcH0I
	8f4Jrudy7G2p3QVTJDRelmkxD/Wn4o2+LQUCxM27tSvy/lyITmreJ5/HwJpsUYYf9T/yAxO0i1PCL
	pmEaTpm9fvjqLwqPygP4hFInH3iugTOGFoJAhHjyQ9+STl8NFYcCSxGEwjue4TgnKGec0PA0xJ3pv
	TZOQXVbov1Jg45CDqxEfLxheC6jDid6tS1wId3S2KNSJaE3OtX2mpAMXfH9cDUA3gYcAODYrl82h3
	Di0j8rhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLu1-0000000CyDF-1YcL;
	Fri, 21 Aug 2026 09:51:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtj-0000000Cy0l-26wO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Aug 2026 09:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PiWS5xibm4AuM2M11jS2y7wQ/FmG+Wf2gKfhaKMAwvk=; b=X7IZco7Z3kxKKVmuya/yTbJtLU
	fBoersSKs1qWzPEUlsXAwCcqUhrXme8tk8BZF3jstDO/dpH6I/uyas3i3XoOKmzG5WkzYpiU2AnGz
	Exlo5qnd0U3FARx2MGiKOSIzb4X0HS5jAAxqbnwnLuN0750nKWYz8t8Cz2Id1RHvwzk/2iGbW2eZg
	Mtf9QdGxHEJfCPBSExFaQXZ81zWEfoQRfwkMr7DQRY8fU3dLH8yPm7Gt/NMR8J5aI/XN5a3Gno5Qh
	5Kys6zB0ZipDo32u7OWt+JWbZnjGq+X2BFet2Sxrqez6UcOxPZB3hyG+ldowhVq6o7jzm/EAX9YAs
	9yaBbOsA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxLtg-00000003eWv-39n7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:50:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47fecbb7000so361234f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305847; x=1787910647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiWS5xibm4AuM2M11jS2y7wQ/FmG+Wf2gKfhaKMAwvk=;
        b=WAN37GJVJbsITPucLNXrQLYcJOfjMHQBaT8fp0iURSDBcB/M4QBO7FRkPwIldWl3f8
         KqYPD/tPWXryBB/reGgmnJ4hp9Qo7Fhl7hi51VN9nhaoqx+FSrIbnmqc7a5sdmmWJtsT
         a1/bzdPTjFJbA8q9bChbr5yFNmX/azjpeB4Dr82jsp5G8CKCTl80TL4mgc8HrfKZiVSX
         kzfDxZFH66DZPHB7aYSx7fRAhQtJ6UaP+XggeWo56U4MJ3zJwl7gDENGRMLJtNBQ5hBw
         WsuD56dLPfshvODt1x/VqqhKMZogiXBPYvRdd+Cz1EpDn0F0zannbaU831C4oKESDHsq
         aN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305847; x=1787910647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiWS5xibm4AuM2M11jS2y7wQ/FmG+Wf2gKfhaKMAwvk=;
        b=mzXP7fmWr2tQszRg9wDZN3Gv5tWwi0xLtZwHhbl0W032tbAPG4LTX9ogK/GBu0OphI
         Avd4KSktXhDu9gXcAZABRb6mysnN/DOaSY7HL3LQlyPwmJQkihainBF7deBOP3sNHa9J
         7uc/cMGCd3WlylGIxxfG4e36kPvYNqZ1MxpQu2TXYrhAh2o/HSUIBswX1c35I7BNAVfc
         tbsg0dsJV0O3KJusuvboXCe/28p0Asd7wfe7gM+BM6Ucu/18jk+gvrpKXsOygDld+Y6l
         pSjodO35gRnNH+2NNA9bGyJIOy8kmxciIwLvd2Ufqw/jGE+HJW0iFaqxP0yI768Xucn2
         eDTw==
X-Forwarded-Encrypted: i=1; AHgh+RpCohIGGwNV0Bo0eAgxLyLb4FxYrsYg9tr76bMXS2LOUqWqgJVosliQNziLoWzG6CPLxXRytgLFrncorF8jrRj+@lists.infradead.org
X-Gm-Message-State: AFuF++kMjkT2xMgvSO7AYSc+JfIdk0MxuVTfVgP5NYTa2sBSunSRRUWp
	0ClbMUPcrbR71bu8xmcXmESJp+zQu6vmQ+nyX4gfdFf6CijGcbXaQMm05FZ42GWEgTU=
X-Gm-Gg: AR+sD12p2If7n0nqcrRu9epYKx89GcEITkeMkcgi/KjfLxb5biB2FtBy3BC/smUf7LM
	/M8N5A19gikp3SQbrVrgwhLn5cxUYG617CYYOlzWBvll13e7M0wgbGewSTB4YAb8UU0vxv6kucT
	QIio+cVDhjxhC7e/eXRv7eNu2JwC0fKxumirD79ofR70iBs+DwlqGS2bocJi9OXjNXpjztZBGEk
	rtcuzaTBngT4yfG9cB0A+G889DwhEDvwNAtrHRfpTMMwTQ6pOuQINtq4HKOJiPL4t1Fi8VqwRv8
	O9rH7WLkfL5HhOJCbizwuH0TExHRMmjA6wKHbHzCZVBO4znOAUnr7UxtjDw1Hip++luCuf1kZ1O
	ZiFxKdXIxdhNLpauWyniLI4imdy2WwyMOtvRMSSZHJYPyfNoM+MgrTnc1Arhe1SVQoNV2Uyofj9
	VCOq5jrnDWngC04u4VQY01qM2A4gX7l2pbrKt0yukbQrgkUt/KTbxTg04g+bz8vfNv
X-Received: by 2002:a05:6000:2907:b0:481:5167:abda with SMTP id ffacd0b85a97d-482c0b4c908mr6700276f8f.9.1787305847538;
        Fri, 21 Aug 2026 02:50:47 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm14474284f8f.26.2026.08.21.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:50:47 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:50:33 +0100
Subject: [PATCH 5/6] perf/core: Return errors from
 perf_report_aux_output_id()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-hw_id-output-failure-v1-5-9d532ddabcc3@linaro.org>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_105048_913600_BBED7248 
X-CRM114-Status: GOOD (  13.35  )
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

It's useful to know if this failed or not so a retry can be attempted
later. Return the error code or success.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/linux/perf_event.h | 2 +-
 kernel/events/core.c       | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea..01d318a4de50 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1896,7 +1896,7 @@ static inline struct fasync_struct **perf_event_fasync(struct perf_event *event)
 }
 
 extern void perf_event_addr_filters_sync(struct perf_event *event);
-extern void perf_report_aux_output_id(struct perf_event *event, u64 hw_id);
+extern int perf_report_aux_output_id(struct perf_event *event, u64 hw_id);
 
 extern int perf_output_begin(struct perf_output_handle *handle,
 			     struct perf_sample_data *data,
diff --git a/kernel/events/core.c b/kernel/events/core.c
index ba5bd6a78fe7..bcdc9e7d2637 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10565,7 +10565,7 @@ static void perf_log_itrace_start(struct perf_event *event)
 	perf_output_end(&handle);
 }
 
-void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
+int perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
 {
 	struct perf_output_handle handle;
 	struct perf_sample_data sample;
@@ -10587,12 +10587,14 @@ void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
 	ret = perf_output_begin(&handle, &sample, event, rec.header.size);
 
 	if (ret)
-		return;
+		return ret;
 
 	perf_output_put(&handle, rec);
 	perf_event__output_id_sample(event, &handle, &sample);
 
 	perf_output_end(&handle);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_report_aux_output_id);
 

-- 
2.43.0


