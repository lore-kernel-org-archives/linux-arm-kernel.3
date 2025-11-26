Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F24D10F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=; b=5F7ZMXKgbpPGc7iPqceseMaA/X
	B4T5OXK1hzF4X5qeZRMTWTJuoYIfbi4H7ht3nSrn+dd9gGZCqFse49uOMZ4jYI60zaMHOcMGPAqX5
	uagCH+6C/3KPh/8R0Zv6OyFqUssDl0bzO5CKklBUwayl4cDjNH1PdkJDlPCXgHn1Wadd8zemZhRP3
	EPq6hEw1Dqe1Xx6I4BQAjo0nAvsTE1YZDGSf8AlDFp88OZDLBKS4uYdA/dLmqlHtw3pmg0bJBulrF
	rbCs225T6azSwgSm5PUyQDn+yTWoFMdhG2eioALKzr1VsycF/thN1R+jlYPsESNocfsVI7wm+Kx38
	AGL3ZU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODE2-0000000ErJu-37K2;
	Wed, 26 Nov 2025 10:58:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDm-0000000Er67-0kjC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 10:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=; b=tWYn3/rCAzWvY0x4ignGQRTqeR
	M8HCnl2hPf68jU9S7Y8QWgMcUrIMR/nNEfxzSa4amB31w8hBmFC199UNpY2wb5UXvaMyzRVV1SvcA
	Ljr4YjXo7e5YJePkpqRZGCzF6+QZcMibQ6niCd6cy4MshpnUxluWQOtkqXoTJzG96VCfS2uAGKjhW
	3fMT2O5LqagaO7b9pNIMmPSXrZ/ZW2zmu3mFY8edEZt0Zn0GF8mN2Zve7vCRNpDdw9DrQO91CwOxh
	6FLmH5anmr2DSszymF2WzZRdjV1hZtRjJbTxjtvBoOl97gRigkrhMZJygyXjUf2LtOqC0CVp67FBi
	Unnx2Qxg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDi-00000009ywD-2DX5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:58:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477632d9326so39305795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154676; x=1764759476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=KLwgtanu/JYhmexv9mXC80Ln2hy2qwyiTLCc59jIjsEUgJqQxu15pl9w9oK8w+O+xh
         gD9ffYGDB7pbbDP0tcvn3hGndnBa4WvgQHXAGjKf1hwUhjv/bHtWZr13Nt+SyW+jPOR1
         2FFKmlptaR1VDDcoSeKn1DuFU7klJ9Ezdc1fY7RA92nSNApHM/d9hMgm1XG+j/3OYG+H
         EaF4+EivQWkNRLiwF8ydcxUN4CUUeJkYnxzOmk+9RrSYqTNrPgz8qK5t4pC4XxhTZVVe
         8b1wfTK4xiNqNs/nfVmiTnh5KZIvxpclaT2i5tlUq33retANQAgNokYh3/75CCYqbKp4
         A5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154676; x=1764759476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=jSPxzFAQo5roLT+xxQJ1zh8CRqSrtJhhVWgVdUKvtVa2vdkgWvKB+wpP8QlxylLy7r
         dLmmUKE4O6wgDpbqpuJa7BON36HVo7ysvP4BSZ48tdFRujZLFWAzZlXJYjmJEA7gXnmD
         l2l5Gh4SwnkLgT1d/AXy0FPgpe0+XYYhaaEOlzj0u/RkkmuP0u4piOOAsdv6arXIELNn
         Oav6W5IS+8AAGjNdNkKfj+Z27CU/Xf2fYAwBXWjJNNz1RMYnEbpkf2JfwVF6U5fm91sk
         3R7l5joG10kmoEWLYGvusQYyLcvdJb+i+BOakkB7b/jbnQDNYIddXuTxjt5x0V+cSDEs
         EVig==
X-Forwarded-Encrypted: i=1; AJvYcCVWSxRsU2q5YTsbflsgpKnRpE/ViLco+M7xXlQNLU/2xLfU8ZYm5n9gPDkrM7QPHR2JkelUiGEVpyU9LFNB1ta/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy004h7nhrjd9wBeXTzwtNVFYb6PQ/UoQo+bAPbdlDwcjtdTic3
	jyCd/QbdDM8qu3ffVxtqzCFS8HjuWb2Eafe1/B8QWN5BMyv3det9+PH7AzKvPz3ZgDs=
X-Gm-Gg: ASbGncuhtqquiI8CFt2RwLRNh3BAHFgSNOPz3LEaYXqeQNU/JZmp5byks3BimvfSfmL
	gtbQeW2Pps9MdV1OO+TisJ0L6CYfFeR87hive1YKVE/avB6iUvBO16K3vu+LR99ojKzBZK6G2kq
	a3tErHbJ5XG25BYqyQk67ro/CrQUZid3/KLaAyJnWyzAzYruP7jSm53oZ8sA1equQSHELigDy76
	+tbmYad+CzxmgCEXUzBeS5nub7Atrua7a7kQ8ZrGjXefTEISKlw4vg8CcOibO82XwiseObCg8AB
	KvGa0OUk58KHgPaF280uy+mxsUJ9cHO9l9RbpapEZXgpFM2yq3a8JLMMbvCGNKqSehjetVSsfmg
	aP25O9LkSfndFysSqh/X4zD1m4Sw8YOkSjAJ0ntigLd6ZgWdNsWi6IZFh1PfD+CYEf0Qnw04JSu
	KKLt1hPD9uCPu1BXRKjNFKkB7zAkNh430=
X-Google-Smtp-Source: AGHT+IGI5q1kexToJTcX1Yl/7hYBxLHl5Npy8jahQMf8CLbNWSX46wWWQuRfFFyKaMWwDJ+DY4kHYg==
X-Received: by 2002:a7b:c011:0:b0:477:7cac:508d with SMTP id 5b1f17b1804b1-477c01d4ac6mr163405625e9.16.1764154675634;
        Wed, 26 Nov 2025 02:57:55 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:42 +0000
Subject: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_105758_582946_CE529F60 
X-CRM114-Status: GOOD (  13.86  )
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


