Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E389C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9GO00zbxnFbKyoYKR1MGg1EYQGaCXyOc2lNqTvdH6I=; b=09Wgx+6z7RGmrN2Ic1omfhoTzM
	4EV2N5yRYDUwi1ujxZYPNhgVjOSfj85J3vCIaS5JNlEn/5BV5OyvrFELXTwHnrg4lRFjWraoR3F9D
	d66coK/T8iCqYq44wXtaVdbILynxPtfv7Z9gx7irTcmJ/HbrlqCJdbJOTsKRdx1wfTPLE1efNHPyy
	4l36wjLk2PnafG6/aQRJpoIoPD1HypLVny99SzzRcC9sVdb8nMu068nHt7f/X9fQbY3BZ+3dAuiix
	d63o7//IQlQD2DdGUvtCvNZD8UnB/P8ceTGn++uM7JH/vTvzauLZlFfdKuCvsaQxhQhvmjJOLRTkL
	yGg7YFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFf01-00000001m1t-2tp5;
	Thu, 15 May 2025 20:16:13 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFek6-00000001k90-1Rug
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:59:47 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7caeeef9629so18075185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339185; x=1747943985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9GO00zbxnFbKyoYKR1MGg1EYQGaCXyOc2lNqTvdH6I=;
        b=YWDH88tbLP+gr5yhelALJhlCbSVZX3WWqZP+xu9Mr0G45KyMc/56n223swMXp7Ei4f
         MTaOPtCLoeKisjgJRxeWOprIai6THHHEuN7ZPT97D+xh8t+KqN3h7I5vMDrjXgWZJR1M
         /JpMUyAefDaqZa1eDXZaO7gj0EpXcTKILLuakIPf0gy9WHPjMNjW2wXamltfLrH0EjCz
         tW1D10y4NINMco2s8fn7+LljMiSkOZkt/CdkovnYXpr0OLp341rN/x6pwQ4mlk6FTq3u
         P4FchmpT1LEucFL6qO37skkcLwXcmOcaefwxDzsuWcTN8/n7NI19j/a0t/ImJmEeP580
         hlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339185; x=1747943985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9GO00zbxnFbKyoYKR1MGg1EYQGaCXyOc2lNqTvdH6I=;
        b=bxgu+bszd3+VPtrLEv6Z3Wk9BOpEpQAXD2IYWFCa3458TKf7W2gLUdkyNt2loSDozz
         A2hDOHWS7LRwyB6iUmkKXUeH9fs9i/hNqnreu1cc7QoopJevGQsLKihdx9UAQfjp19UW
         tjtpRXwd86TjraIOuyQY0hdPl7g5CXZQM/dtATN55f/AXItEhuAhMJGc/qA2XAi/Bm8e
         6k4d9hWIaWH6rh0k5XUEA9umvj+a7ZbMNCK2wmkxZK+Y8YxwHb+Qp32nCF0LGM2rpC0C
         KcQy7ZNPu/1E9YIdDVX4qrCxlQvPDq9g65ZqY9IBcoZGr6PlBDRE7px5ayWO3UZ96yc7
         uIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKA63s4h+pk5NAhuh6wyDx4wEvEzJKRQGt89Atffo/UwHlTF1q5Cz/ghu3GdzxaeP0nVnmljRscHn/OOfzCV9E@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ6dWFXBosiCYGDjzEZpULOcRhiGiFUcmnt/alQ42Jtqb65b4o
	qzzsuB2Fr4Hknp3RAKCsMiyELCTudYgbB1V/D1C7TNO9mMFNftLasA2y
X-Gm-Gg: ASbGncsXyYkggJGeNrRw7fh3LwfoPSVKX15q8Whwil9FC7eXBJOuGY+anf/4yxXyvC8
	l6MYtSpaJd/jUNvtEQtesyhp5PSWcoouC2CGwvEXv8Wu34J438fiBFRbG6SSrdTtjoCdhw7cyQU
	NBCQjozKCZw6GaTCAHrtjQduKAPQkqzKJiToxskLA5QJqX2ScSEQbQf89qlzM2vHNUHeLKPA+qA
	rKyUAi+tBcI5ksd0R3XZ1y0q+Zza91CynjlkuO5tWlr3xWtbQVn2togMobG/9Aki7PIu8+GN2Rw
	xW5h5+TYyEjxOpWzjQ12/n3rL+mhov9snmuO+mbyZ9N/Xb5P0/+E1x1i275S72EJJ5oejMkLvqJ
	VJmw7KgxSMOfiPq+0/qI=
X-Google-Smtp-Source: AGHT+IG6CqnqToKilBZg3d95WbqLz8tctrzr994PFqGigAXmx649QoHO+YFYQoHsNTC0rhdZ3luaSQ==
X-Received: by 2002:a05:620a:2803:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7cd4671faaemr58332985a.5.1747339185205;
        Thu, 15 May 2025 12:59:45 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:44 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:49 -0400
Subject: [PATCH v6 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-7-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=1531;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=aRsZmjoGo/cSFHXwutiwXX9pdz9qjGh+q+3C5UDfQvg=;
 b=+pdVVw82/z0eIgzgC6o+AzTuVq7FlJ1dneFaBpTdAtknFxz/eSWyUdXaQGcHd4MoAd4oA8kti
 e6nMCOZKmtuBM8tRS1ISKqELZJCTLF3R76A1EnTAP8F/VIbPZJpnnUk
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125946_385544_E20F7D8C 
X-CRM114-Status: GOOD (  11.18  )
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

Unused since "drm/msm: Delete resume_translation()".

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 include/linux/adreno-smmu-priv.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index 8ed94fb39e6ec6a3d8e6fabe61ff142682f1764c..80bb36e09f07901fd73c522ec077b0b3211adc50 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -46,9 +46,8 @@ struct adreno_smmu_fault_info {
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
  * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
- *                 stalling on fault is enabled, the GPU driver must call
- *                 resume_translation()
- * @resume_translation: Resume translation after a fault
+ *                 stalling on fault is enabled, the GPU driver should return
+ *                 -EAGAIN from the fault handler if retrying is required.
  *
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
@@ -66,7 +65,6 @@ struct adreno_smmu_priv {
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
-    void (*resume_translation)(const void *cookie, bool terminate);
 };
 
 #endif /* __ADRENO_SMMU_PRIV_H */

-- 
2.47.1


