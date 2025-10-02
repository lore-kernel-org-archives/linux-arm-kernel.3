Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C10CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=; b=U6zyrJ44XKPRGOAg5OgoAJlbOb
	8QzF97pZBBue1BJOiafdXHKLhCahb8DgUws589ptGgyHLOZHVll7kjeUMJZuRlikGWiGrQsdE1bQ8
	TOXNNA+x+kTo8nphifIhn5T8K3w0zzNLzlt2vq5DvviZ7JtZsgq79LwSgRx2Ku+3IU7OVG0ShvSsh
	H0Z/v8wp8KTDVnFTpfR+U7XcOB9C3xxeLTSWfSNp0SqoaeAQiQlsmQ2zoCpea9XTzZTIYCDa+FVYe
	eEuuMTOlIul1HH0KMwpCpwdomCBtZ5Hrm+MmIJitY236bLGTmoO5IfbEmlF/zbWzRdm8fpKM7iV0v
	9XYjb8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GGC-0000000ACu2-2nfm;
	Thu, 02 Oct 2025 10:10:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GGA-0000000ACpj-0EeS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:10:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso490594f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399800; x=1760004600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=hdsNOse+a2DowMOFfzkVOu1CT4riD9UI14lJnh1zuntfAekw65QUzP/2N9H5Y6zhAG
         v8rU38vPcPDhH9g4fepjze02sYD07ZAfnkY7q3Em7JCu2hHaB3FXwgO+on5RhRLvvt+S
         Ll8PkH1QYSjIXrVkxkzTEwNuYjfupn2jkxbvaenDTjcYnVu7ylmY9+aCAQBfOKfzVKL7
         XrkHRmKgM9qU5V69jGgIrbBO5PXUA5SliDFhH7v2vnnpk4IxpbcjC/3iSN9L5OZtX5ia
         bjqHUx70Ne7pTQ7+Bnxl6ZhzGAGCWVcVU0Vs9TAyfYS+J2EBox0uG8s9++20O6ir9plY
         9low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399800; x=1760004600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=MmWxsxiP0OiVD4+P98xsMNLzSi7pUILlV3qtTcnO5BY3Q31VpWBna1zexGVhAmYXJa
         u1xfqX/arbOQSGv3qgNYSmreAHnGi9nC06p5i5ecdGR3cmgu+K8eIE8e7nFxI/o8yK2K
         H9+nfTX1TUqm2q0CcvGKJrDUPn7l0hlAYCwX3wKMUHrNH2DvzvNsq1z1S9bqRLse8ys5
         wrxslZ/x/bYGYmr402m01Mfsd6+xPPwlzXL/Hn966hXXdllwb4tAz6Ds4iiZU68/L8K0
         10D+9ApxHi2+u8R2BzGQ5UB+SSZ2eDsDdK9KnWwWRtUUEikOeU1b9JZLTL0JQmG2eRBc
         3vKw==
X-Forwarded-Encrypted: i=1; AJvYcCWJPvp8M1pPFfozTmtiR0FO5PZPQAmb/EiXtnCU3Tx2gx+EZbfl6BVVoPwvjnqzcPii1DDQ9+HpU3yR6Q13RYAF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo7mAoNlN1Jb3u4OS4Jsp+5NRy5VhpYtIlh8T11QMHfaDZyYbt
	W/xYrzTpiBJuoR4vF9+sNT7kBhr/mzl4mlp5JWR5jU8JC3WB6Y7pPCxYQD6XW88pPSw=
X-Gm-Gg: ASbGncthySVBqh0fXLh3wbVsvuCXau7e85DeIw5WZJTLzqgHhtDV3FJucARFZUqZrbw
	fYC0idwvbk7IHu/aATp1lMiWfLwreEgm7WGBpn5FIjEE7nPoabWKMPrI+nXfbjvNjhMIWE08Ve+
	a+y0JOGkc4LqOOoB7w6BRVbYW5F9Q+Y3/DxVuVwVym+y4lBtwo883Xi7voeOggfLGSYvcCSVBiH
	TAbiKTgbxboC76F/zVBbC5Hvv2tL1kR5NVeS2DE9vW+j2Z7C4VIjW7ObWziGX2LnOIUDo4IdB2b
	b2WpEejwPS5hWgtonKBEvhyrxcehD24D+HaJdk8kXQacb/pZX8xyMAW1+O492meDqjqCShEEb8c
	0UbmfH9YHKsHRAKmgQrwfmEC5Mfws1FTtN9alnmO6fHmEl/Hg7cBMFEolb1m3
X-Google-Smtp-Source: AGHT+IG6HKInp+uRx4lrhBICFNa45XLSFjaTQzHhAm4u0XucfQOV7OmI9NNGmwwxaM0SBXY84aYtrw==
X-Received: by 2002:a05:6000:40cb:b0:3ec:df2b:14c8 with SMTP id ffacd0b85a97d-425577ea4bcmr5328296f8f.20.1759399800449;
        Thu, 02 Oct 2025 03:10:00 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:10:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:33 +0100
Subject: [PATCH v3 5/5] coresight: docs: Document etm4x ts_interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-5-fe5df2bf91d1@linaro.org>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031002_136198_91FA1550 
X-CRM114-Status: GOOD (  14.08  )
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


