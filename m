Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D2FCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNCXlVNyxqLTWGPAd727pHruXWdWdx1GVnhxX/js/0A=; b=V4K/wTDJZIfiY77+GNXOlOXcm8
	fVMme5k2WZUlHyidKPNBfnIWJxIpRHgJO76IVePdNQq3syQA1W8fTf3isbPXWolpRdN46LumpaIHU
	kJ4iC/eHIs3pAKovJe8k3bng9eFzhbUu4e2yV+6qt2vVPFBbsDT2xeiHYI0G0vCgTFbDco9ppIrYq
	ZxGKVenOLA/bJW4ipwMptAe7jRUoLcP9369C1btfxzMkKmMRc2zfESlWfPCZ3FDrHSk7Zc928PZ+j
	V3JaWxqI7fEobz+eJeYjHYH2qZGb9l1qzXI14xQP5rbNdNQ0j8u4w3hinMlCnlZNY2MxHarzPuPVT
	9Dv9lRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GG8-0000000ACol-0vS5;
	Thu, 02 Oct 2025 10:10:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GG5-0000000ACmo-3F1k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:09:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso562062f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399796; x=1760004596; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNCXlVNyxqLTWGPAd727pHruXWdWdx1GVnhxX/js/0A=;
        b=Rbb46/rGy8Xv+sc45OyzcU50MwnYu1OSBAPudO2y7DCVCWXqr91/VS0jgHfIuBVfrs
         O2d8WrLegtgbFmOQ5J0BBvufVFsiC8f///137jDXC2AX//NlcwYnqHx9R6mxo5FNUhKY
         E16dXwFVFL03vZchglliR+L+LFWxR/oU3DPFraPXrL7NbUuC4LSISem1sxf+oh6Pr15a
         vCZFfz45Xl5QnbXwx2SzWtTqjUFzLYuzeMAipx5RPiQ+7cEZwGeDDNK/+dn9U2SuBhYl
         VD9uIW1plOIWyg3T097CXFUnM3sc3js5jDLV58PzBMY6ML5ulYjCucwFwB3i2ETGt3JI
         QCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399796; x=1760004596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNCXlVNyxqLTWGPAd727pHruXWdWdx1GVnhxX/js/0A=;
        b=HX4pyzjpo/UDXGtWIrGhYsM4NZeQE2/dKp+m+ZYX0ls73GE6XRcXQlB0dZN1KKaR0E
         VApYwPwnzpAFVkwtOkMhgxgRPdcwlIRsyteH6i/7K1POVXbdluY9fRmvYr8ghYcCSFc7
         VzIBU/wTT5oXIH0bIfe600by+C1+N1sbz4BTnY1EAqdWrLHhveboNvLQYhnxgStbKpjn
         Z1dTf/eqnw/0ja3OuG35u9u6sNJas41pJEf5BIIUN322M+yb/8pKVKh4z5bvq1orXT8j
         3dLVQc2KdDMimUbVi8/3Fao5FxPvtzXlnCRTVTHQvixl4sSeJradCKbmf+ruFKbeFDnN
         VjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdp8BBa2QAppo5acvXwiMRFtuDA/NrVcRoWRwKFmXmOWjhQtYwoSCTRfMuYo7VwVqpEXOtTA+YHkeDAGwBG70W@lists.infradead.org
X-Gm-Message-State: AOJu0YyisuZQ3edY80C0iJahIoHtTV8+9jLRcXL77ou+HndajLEXqGyE
	XdurJih/eDEqW8aiAVjwo0T84wM+1g+DwggV5otTnOc74a74SjQTSmKNuBQNuxEzrnU=
X-Gm-Gg: ASbGncsgtWhWbmlwLRafgU19ht8QVbp3m3Fuv8vY0XAFwu8Ff1vqf5Zlt1UsSpxMBrD
	9Dj4UueR4iO2gzgoRyX6o5goZxcUcdTnnjGjhidbm2TRiTjme9qNk3OeA/Xw/IEXp72C+t29J2J
	lCKJlHotlcF+7CrBtm7k6acyhKnLfFZbpexNt3HKXINH6pr12SY91t8+N7Kcwc6kvObapYNw/3w
	rTZiLNlvfV9a7DLs/JUn0ze/GYNdDPH93QSGT31yWi+biOVSEGpHr1UJhyuLVWZiIODee+K9kQ6
	eVEnWw0dHYj4eyWrtGoYU5FafAU64ITRkHcxfUSlRulgwmsVwRlb48uELmO49slGhd5XKdqXf3f
	ZnvTt0chPSrxuNu+v+DBBeYyOKDIAaRd66MtHEmHbFCJU7Kv27zGhk8HC/UqO
X-Google-Smtp-Source: AGHT+IH3VmgaujpFJUxnfsTdoqXNgTblqfU76kgYqYrSDq7oNx0Tfc38ceRWlaEZ0lvNiD8i/BA2zQ==
X-Received: by 2002:a5d:5d13:0:b0:3f3:c137:680e with SMTP id ffacd0b85a97d-42557a15a5bmr4399609f8f.43.1759399795840;
        Thu, 02 Oct 2025 03:09:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:55 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:29 +0100
Subject: [PATCH v3 1/5] coresight: Change syncfreq to be a u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-1-fe5df2bf91d1@linaro.org>
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
X-CRM114-CacheID: sfid-20251002_030957_819942_28D8D6D4 
X-CRM114-Status: GOOD (  12.26  )
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

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 13ec9ecef46f..eda3a6d2e8e2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -825,7 +825,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -833,6 +832,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1


