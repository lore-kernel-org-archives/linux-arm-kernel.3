Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDAACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=; b=S96nLtAP/ysXnO1mX1GYlfyX+X
	RPXlYOB4Lbj1yk9OwGQOhq9OaJKpnpyAePT/URO6Eo/dq2C7CLEGHqJbeMPcclX+9JajV9Spcw7bT
	McZ0hMWWmhwwueJU/+ffVwmgjToriSiN8SNIo+HWf7+Bzo/l8dvRuXVxbvci3v+D9cQ2di8axdOBY
	f9EJXKjxrYTwqFBnB23BH2f+w/EtikBLO6zT1Ss8evXbPogLW2B/vRvZakJj3t97TN72PeAj6akTV
	xClUVLJDajO5qnT6UyEbtcmfQ9uEYc4sCjgm6D4GJc5XjMsWK5DvBySmX7rGdb1COUh7ATQB0kmSS
	xfwhHoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0e-0000000HTCn-3HqY;
	Thu, 14 Aug 2025 15:36:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYN-0000000Gf8T-2IAw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:51:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so3808245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168686; x=1755773486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=yspbHtSFj4GCABt7BaUDeAzN6GTdS+mNN7UGVPX0fXsXJRhZFvgT4f+AOJAO1s2LIo
         sfLPNtcRTLhz5ISf/CZr4NDAdPaCe8cGRNr/Z5pr8xt0J0LlcF/y0yh8NZKiWggGTas4
         FhnPlPekt5EgRBcP54xwOhB/OR8T8JYooVXtav6nxs+NWdjfnuW+kXZOxpir2iANR7tQ
         fOYg8ca6uogxzqq/K9ww+KKHdYtriMbkTGheV68sSiQ/Ad1zTfsgB36pto6MInBwo15R
         UsedI3XQAPkPCl+cuTxuTDGMEWDJHJzusjuoTnQV0JPQy8NBAFppCuAGJEI6F57ZAH09
         6hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168686; x=1755773486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=lj68dicl/Ck6/Q5pyTYV2iAeZtoPotIRR4YOvR+5IZwtzwlFG4LWm5NuEKzwrP765v
         dcH23CR1ZxRc6GedShrFltH+kt21AEmJ3yARnLoA21z6o9rvgKmUjn4sjdym77hYLVlD
         f7jwLWemoUonIVUn1AFnHgGXM4Y5bkerEqXVlKhrvqv9ja5mCrMiU/h/1bMrYVLz3hC+
         +SxQxBoj5GcV/DtA10s9dbQP+GbsHHfS3qHBzh3fco3MYxP5AFjjp+WkLUxC7PslNFh4
         0TZ60IkoDpWL9Rru9uWCdfXSzctnqUYfFRN9FsTZSpy7yqPhLkGmPKnfJ58f2bqE+OaK
         9DEw==
X-Forwarded-Encrypted: i=1; AJvYcCXgqvh8nA6WXLeNzwnDiE9mrY3KcBsYB1UYelG2hQ3iU+ewRjWoTAKmBA8YXoSbAVBHqQsNKBF4mAAsYCN3NoGS@lists.infradead.org
X-Gm-Message-State: AOJu0YyaQt499aA1t5P0OxsVOrjxLsHAkvonx83JGmfqXS3uB53rQps8
	U6fsHc6QkZaEnOTwavNDFyf38a8hZz5YEQks8pH+ChRS0ZLXG6Av3iHwC3zxC76QVYE=
X-Gm-Gg: ASbGncuZMYwuxF4NeQmYKz2KtwYlLSWdbhQNU3B/oe8xREr673yCRa6IuBkANT4+90T
	uVNNvY4uD13KHosqkc4XqaIKZbB0A4RjI9nypX48ryNHf5ddWpPfOxS0NXMVMpfzVM2ePnRq8Ta
	R6B8Hmcz1Ifa5CqEpdmDQXAvq46ly/HZ1JRhI3UcsvAlHmANU2ObOdJJYPOgHCcdVyakTstCcI8
	JaDTBy/9NxQ+OwESSna6GxCh4OOousS4D1YRRxZ+POy+9WnYHofYC9hn5l/FMg7JW7BGoqIIpzk
	lOYeUh6OwnkE5iPo84iCKU9FPsiOSV41J+uGgOxMBa40QDbsWDDCCv5i5g7rKwsp6YnzB8FiHEm
	XFos1lhyBL0wxD+jqBVAGb8M2vN414o0=
X-Google-Smtp-Source: AGHT+IF68KOqRUAOMHDKBpVY9t7uVgR8MmpK7ImpWi3/zcrlNC+5/ptZ2W1zXkHPP+sNnqPRzwGUWw==
X-Received: by 2002:a05:600c:4708:b0:459:e025:8c5b with SMTP id 5b1f17b1804b1-45a1b674677mr23813915e9.30.1755168685858;
        Thu, 14 Aug 2025 03:51:25 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:57 +0100
Subject: [PATCH v2 6/6] coresight: docs: Document etm4x ts_interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-6-c76fcb87696d@linaro.org>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035127_583692_8806BA78 
X-CRM114-Status: GOOD (  14.12  )
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
 Documentation/trace/coresight/coresight.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..0cd83119b83f 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -619,6 +619,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
        value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
+   * - ts_level
+     - Controls frequency of timestamps. The reload value of the
+       timestamp counter is 2 raised to the power of this value. If the value is
+       0 then the reload value is 1, if the value is 10 then the reload value is
+       1024. Maximum allowed value is 15, and setting the maximum disables
+       generation of timestamps via the counter, freeing the counter resources.
+       Timestamps will be generated after 2 ^ ts_level cycles.
+
+       Separately to this value, timestamps will also be emitted when a SYNC
+       packet is generated, although this is only for every 4096 bytes of trace.
+       Therefore it's not possible to generate timestamps less frequently than
+       that and ts_level timestamps are always in addition to SYNC timestamps.
+       Timestamps must be enabled for this to have effect.
+
 
 How to use the STM module
 -------------------------

-- 
2.34.1


