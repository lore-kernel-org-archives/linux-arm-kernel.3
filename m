Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B48CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=; b=euYu++RUuj3OYRy/WLOwxD8cMZ
	UaePEeGfkUuB15/h9zWXH4o2a40ZBMF5CzRnUtBxXv5Zjb3hvvIYE6TNgPTqhE1FP/B93kDleeWyy
	C3Nx6+b+wcO2W/lQBS6FLfQsuxMKhccmv5nwO8XzMNGOwjRimfyJHKKKXBohh/BMGXW+30T+1rLDk
	mVj5IDyl1aA6w67mAHS0wBxY7zYhcGTU/cxRt6QaDbSYBesV7DrfS3cdVX5Q1UcpoYMGbwGMPH+5Y
	yeYVXHvXDqGmOShc/MZxsgwmjyDKxm9fi5O9VuYILh9YTImtGdqjtNiaApgWkk6y/IelIh53O4dNJ
	0HmOXKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0h-0000000HTFm-0EsC;
	Thu, 14 Aug 2025 15:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYQ-0000000Gf9R-057p
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 10:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=; b=V5Hb3znty4klC4uBYqreNDuhe4
	v0Q1hBu33gEEhs6e1nqkzidlLudOQVVZXIFI8futTyo5OyRltkxDJw6U0abB7fJuB7AZU2qerKNT4
	i8p3B2nvMwBkbh0YZ2f6VSJRzfr5AbBRirQUojuqNsAvwxdCg2kgXnCD9QLR3BaXCzFr+OjzRZyBj
	v/wbPi4llKMVf85YtXJLYZeAFvDW2/9cP/EwOoPs36tlfv89t1HsDnNpERl1IHnoTSoRogTxnTviC
	ze8efkRwHWm51xePgU2/d/M5M3gd6L63QozWJn3UqgcffpoqCQcSp76APdGiejBgquS+2MtfiYbet
	SP+TSFdQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYK-0000000GMl7-3lpH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:51:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so5005615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168682; x=1755773482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=;
        b=fnpSb2M9aqFEQWDg+Ea1px/pB2e5Sg/zeoYkgNd7OJjZ77pjk6doS5IBgRfRODXzAF
         KhhUigu8Z55ujiB6HoPcm62JWKscguX1YoJnTjZUGBNLjqwD10Cl5SfYnOQKooLO8DxP
         kFhz8DqBK1K9HHi3ue8Mk4I22HSfn1UnEJw7cUMBNRIPdPOYQhRlBeXeHDfpiHLvjceC
         Z5Vx7Mpv+tAPuLOymN/kN3fwMWL0Fw2L8gts6dFz4NJ+ce77tyituxwgl2BLIUbV9L1i
         /qEvYKeBSfWw8y4nRCpimYlNK7FfFpZkn0ebAyVNae0YV9pO6NyZih6auwHiadqIGhuR
         fQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168682; x=1755773482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=;
        b=iFkDQiRg2YFvORVDRApRfmjzjrYrpTjUl+gK7HvYhJUyVcbpc1wskprAzkqa1G05Hv
         WkyIbRbrdOAU2XUX33c69kgu+S4VGt/P/RgWCCB2NrKbO/D3zeM7XrRMIvxFJcjbdyWs
         68zdeQc8Q8f38rC7pEJzGyv16axJldzwKviPqGxcav+PtOvoCUfLgGk6/9UZQ8pMU6Il
         YdiYqTFka+FOpwuYs3vkht/9Py5/dxb6VOoomR/1CQ4kFA8w967Uz9nx4jnIAozTI7gv
         Yf7dl+sMJZ6eGqJHdNea6qvCTfglTc3UjFCK7QsKwVQk3IzK4vkV5FxGgQT+NnxMrbAB
         vEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0chiLeiQMe71oYIlbl6KV9lzFAzojjdUVOzHB8gtxGj/Dmgi6P1TnJabr0zKPHw3MZKzVB0vmRTLX9x3oWf8R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7+K548lOwSCl/FkJW7DwwH2N9IAlvLk7u22wONLplLz3+v9Os
	/LLZ3+wyj3f7vcsHVFM3VoowgUS2hnLqPJF6Ao8tU9+7GIWTL4BIb9VG7TEboPT/t4U=
X-Gm-Gg: ASbGncsQJLnBrqXjTDkXF8l4YMBIS6QXL5ujxmJP49x4DqwHXYrC8sQ2Fwblrw9Sl/F
	rti+36KMY/bKgYTz0KLCuniotpPWlWegvaW1yUonWdbH+gHSuS+qibBHhMUGCZvg1Ygfmce0dYm
	ar0htUFXi1EpwHiDGX8rJBj06nTA739mRIihUVMAGGllhCar01dwYmdQWvn+iaMXitjIgym+OEi
	lA2U7oD23DUI1yxFygckBnCGK513PzhJvXSXECETIrsnYZo6zFM8DdrbX8q3LDj0CMaPVVZkAD3
	g0bX2F5zY5Epzd0+k8V4+6Zcmc2trNS7vuczwrvsybL5Kd0nqfPBaJfTUdrf4HKZC2bMlChnMOL
	KUiKO10FHbQSLW9wu3wrAd7Q0IzNfhFQ=
X-Google-Smtp-Source: AGHT+IGiw9zB/I+LYQU9OZmJehztvJAaw6EEWckqoahlG6F9UH7uBsO+Dc2b7nrazKkmaZlJ83qC6Q==
X-Received: by 2002:a05:600c:8b05:b0:459:eeee:2759 with SMTP id 5b1f17b1804b1-45a1b6c7e20mr20628185e9.14.1755168681929;
        Thu, 14 Aug 2025 03:51:21 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:53 +0100
Subject: [PATCH v2 2/6] coresight: Fix holes in struct etmv4_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-2-c76fcb87696d@linaro.org>
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
X-CRM114-CacheID: sfid-20250814_115126_051259_5F1AB676 
X-CRM114-Status: UNSURE (   9.72  )
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

Lots of u8s are mixed with u64s and u32s so repack it to save a bit
of space because there's one of these for each ETM.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 746627476bd3..a355a1e9606d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -832,28 +832,33 @@ struct etmv4_config {
 	u32				vipcssctlr;
 	u8				seq_idx;
 	u8				syncfreq;
+	u8				cntr_idx;
+	u8				res_idx;
+	u8				ss_idx;
+	u8				addr_idx;
+	u8				addr_type[ETM_MAX_SINGLE_ADDR_CMP];
+	u8				ctxid_idx;
+	u8				vmid_idx;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;
-	u8				cntr_idx;
+
 	u32				cntrldvr[ETMv4_MAX_CNTR];
 	u32				cntr_ctrl[ETMv4_MAX_CNTR];
 	u32				cntr_val[ETMv4_MAX_CNTR];
-	u8				res_idx;
+
 	u32				res_ctrl[ETM_MAX_RES_SEL];
-	u8				ss_idx;
+
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
-	u8				addr_idx;
+
 	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
 	u64				addr_acc[ETM_MAX_SINGLE_ADDR_CMP];
-	u8				addr_type[ETM_MAX_SINGLE_ADDR_CMP];
-	u8				ctxid_idx;
+
 	u64				ctxid_pid[ETMv4_MAX_CTXID_CMP];
 	u32				ctxid_mask0;
 	u32				ctxid_mask1;
-	u8				vmid_idx;
 	u64				vmid_val[ETM_MAX_VMID_CMP];
 	u32				vmid_mask0;
 	u32				vmid_mask1;

-- 
2.34.1


