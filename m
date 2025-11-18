Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E74CEE33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=; b=OsCd4gdejsTpCrGHI6aU6hqjDt
	ZbALZzKYVcbHFXXNlGJ691WK8K3ucLmlGwmGG8ijG2OQonJ6POWDTRvvbkmkmBgb9tMogszNDF3b0
	GsNSj3YeJQPrGt9kJEEuz1MUH60bfqMyXZP8/4kenQi+QnN97DXGXB099fOie8ffSvAXXSSKQvsgS
	In8zWT31cDzdhPbt4IA8xJSKIlSqKBV6XAgKuKQUicko3Vv9VslC4nnEcuM6lEHJdW0Yet32Zi6g5
	cOhPxMK26K1WIo/DCVpmOzGce9LdhQQfUxkHlIrVZ0allbxpRgvf4QFmZ/mZoayxFk64zww015RRQ
	Qmw7M7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZS-00000000jqd-3v7n;
	Tue, 18 Nov 2025 16:28:46 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZC-00000000jZF-0GOr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:31 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477aa218f20so6549905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483307; x=1764088107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=qc1YfAcAOaZZKdwSzxQctIiksmiDpL3aSaRBntSmLgoJTJs+2U2VWF/Gx4+0v6yqz2
         9YdNvsA8R/a6gpyF4Vck6IiZPVNJTeOvcDorlUnOoGdlCX/QeIRvjh2kFf92eUmsU8xK
         1PAUQtiL8InjcHmlh0stf0eNzqBkqaxAqZ3ovBgRCet90+sfHy4nn4lYV23tZM5PGPq+
         e14j6YtHNLcNrimk9RNNpvoiT35LvyMooK49s1KnxwbsfEDgOn/1kqVA27Nkf6XRBQxk
         hR35DsqQ4bMNXFJ42pIrgBkvpkZV2kImDbvXPStRvtPrPzOrSc1NqiZSkJ7bY5WZKiYW
         McfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483307; x=1764088107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=mlRQFAe8NqnLBhfqIeMAE6L23C+Efe7joKlkPvsSpVF0sazjFOEu+qo/YUKxJsp8fV
         Li5NTnhtb4qLx+PXRg/FIKOBoPFYIz2In6hGYGXwUZelX6imOJM0LRfehDHDTAfxUnjw
         WSOjAKfZSKxefyV6LoAmFYJAASo3Z1DFi3EH4trDD2KgMvbsUbfWMO1iNwqn596bo25S
         bO8ZkIAEXnDZReMHvm/DOO+sSp+ZAJS6+WqtDtysCbZoh5MZyAfzA0q3wTPqD5uvYDOx
         RkBCW9295apIQ3uLmpQSxuHFVrbFMzeBT+dL6HiGoCy/WYxf5FVa0woaK1PjhkKGgaH0
         xoYw==
X-Forwarded-Encrypted: i=1; AJvYcCUiGP9pvLd6ev/LOk+8fZWycu/M6puX8wTmeQgR+OcCBB29KId3bGaSZZDuegSmYzQWR093/QspThk3kj41kpen@lists.infradead.org
X-Gm-Message-State: AOJu0Yz97+bJ/q5tmW6+gqZ4uf9U2jjVX4pTY7pcKSf9OP9bTCFWbCK8
	VR59sB9z/ZWcR/xMiHp6NKqDrVK4Xg2NM3UF/3ZUm02adZJGfHRn3lQvJwDphf1GWcmko5WjOGi
	keLyEw60=
X-Gm-Gg: ASbGncuUeyaxQ0npk89VA0O282b+NZ69H1uY5jjfo6ZzXmhJPfkz5kLPrD4IVNFl6FC
	GV1O4kxIy1GTKoDP8v+dqDRp2KjgUtUsmiSg//oeWhX6k8O3H9Rb2meWEn+7lZutlNE7O9ezTy/
	SWT5lktOFc5Hjmad+E3k9LAemaBGBfnSFxqRfd/2zSh6sYIv3cUKIcd7EgXRul1OadJdFSNl2yP
	DW9VsChuW5H4m5tU+qOWJcGQCblu/p/WTppLegYoqHcBg72o5cgQsUYlPPUM+UdtJNle1lUM+Vr
	uuxPk+lzR64HJQeoGKaNNcyT7TliVjzOpWo6iyUkLVxk1HFGRBPGp+tr/eDVoGpO0K41+d3gUHV
	/+0yQF1scA2H3HPb9a5I97Q8vUMo0ctT7RdqM2TfcCcP8RLwxet5jXuzZgJp7RVzGPaCwQVRrfH
	BAp0EL5FK/cDwio+A9dJwP5Ixbb6X4T9U=
X-Google-Smtp-Source: AGHT+IHN5ZZ7TsSfy3KB6ZJXobAnrt1PfBhAPwW1cYqyewtyOySvk+eWd5Ld3sR20w2QmFj0p3m0Xw==
X-Received: by 2002:a05:600c:1c9b:b0:477:9fa0:74ed with SMTP id 5b1f17b1804b1-4779fa07915mr98104425e9.26.1763483307312;
        Tue, 18 Nov 2025 08:28:27 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:28:03 +0000
Subject: [PATCH v5 13/13] coresight: docs: Document etm4x timestamp
 interval option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-13-82efd7b1a751@linaro.org>
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
X-CRM114-CacheID: sfid-20251118_082830_331341_88AC4E17 
X-CRM114-Status: GOOD (  13.97  )
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


