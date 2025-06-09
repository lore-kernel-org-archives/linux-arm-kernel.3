Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F035C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r5mHztYrkrGmqdzQD2l85P8GCoJYxyAbRSWs0LTryIY=; b=L8Fhtu7ZEEsRnQxXwV4q3DOM6x
	7ghltKKGOY98/ZzmM/EL7sDaHH//gdi+Kzf7y/iK1TZ5896UEJeiepSf+svyQF/d8taVq9ct3Nyaz
	2ILAMjxbnJ6oGlQlal8gUNZh99Jl04xF1Aqi/HZ/eTGfhizjhRfikLdTebI3yDv/GlW5UpaNm6vyi
	QIyVq2ZY9LcWBoJgGpcgR3oEqbLmygjO5IldCgPi36vK2mReZ+M6ZTFhlCT8H14SuelTdDwH6SzCQ
	hnnI/v2LOk8W7SBGONNxuYhWZB8OJ7ayLXLD0Dx5YNNcS5lSI6UBkInNIRk48A5yFioHE264wbKYu
	RdeZ2rDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZrv-00000003vJS-2Lrd;
	Mon, 09 Jun 2025 10:36:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZb1-00000003sz4-3USn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:19:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-451d54214adso34303205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749464354; x=1750069154; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5mHztYrkrGmqdzQD2l85P8GCoJYxyAbRSWs0LTryIY=;
        b=MSwAV4zruB8xdpWswYjXGQnKAnryIBdSU7K1tFkz6duexIDpuBjZm3knkmPoeCfrqa
         bqekHfzme5UoHo8JG4L+Pfw1G6x7WflHIxHCxpxXanvmRv1JFbWouK0X8CeV9NgKHgvW
         vgA2pfX0HHFkVRJbAYquxeJfM18zwaJ7tYgOebXmCnBCyZ9C94sPQ4s5ULB9gcWvtY6M
         JOuipJxq11VZPx1kCUY0gBR/CcCwzK9sl/YzpDCCGa+5cDQ0yZg/2Pu9B7ojKZgaGR4A
         QF6F/Ql06/r5LDDNpLAu1meXAEVpuGPvUvMKx66ONggFcb0NlqHFMpYsaZ2ZT712DCRF
         +yIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464354; x=1750069154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5mHztYrkrGmqdzQD2l85P8GCoJYxyAbRSWs0LTryIY=;
        b=Q2c+oCVUGHCXXkHO/vJRYRFWljOtjxFUCSe5GcPtL6QYyIkBHY0NUtYdkCDuQO/5Tl
         ZfbPXHMpdEm2HJg1Dqs/hlZGmlrarbS8K+EViJfWkiF8Rf2a4H5HDJwFSM3cxSS/OzWv
         VDYCHTyNrikrJLNCrTThigVtNRPri5qVMJGtt/Gq5sfV28YGjkwfl2lCMhRLpVOfcU25
         BBeRqRuelSlJY1hdjP3peQXE8pUZJ05JknTyaE/QkLrMfZK9JMuNJt8Eg1Qzg2wlD2nh
         fCsVfGsJ9UsLE0ODBSOJfY2vbPBU6jW0c4C5UC/Uo/R0L/Ed85aelqMkorsQhMMxXbjr
         YE8w==
X-Forwarded-Encrypted: i=1; AJvYcCUQoaAfA+0D0LUgo2w3sGiYsvKEAgECCsg7VmrdmXR6FtgBxp/QWGCTNZTrgcuR/aj3Ig4t2CQk2SP6N4DpfBFA@lists.infradead.org
X-Gm-Message-State: AOJu0YyJYCuh6YVILnkEpgQBcJJhHkQD/tP1nuKaNOK07ZAhnXOv0uWw
	yFmlMyHxuW8nWv8QU2S5Ym4Fv2gdEW4r/JzZtmO3ggm0/m0Y9a14LfDkjiebZh6PFt0=
X-Gm-Gg: ASbGnctf5imRmKSFbcBHuXqCWNdFh/0zPmoCmCAv2RQT1gN/d/8XCQwcd14g4lboS2K
	IXO4I9LZbngYgVUIGhMl+wVPtFvxFinZtmas/sMYLgW0kcSLh50cE+S19Pjc/YL8sNGkkVlIoBx
	6Wex3U/MCQrMKcesR9IPzRtteAlW7CHqYDsOAQbMGpk3/wa+yvMOuvd3qzQJjYSntRJi8/i1Ere
	z8xuKYpSoLBg6SK8lL8lFSjprqyUwTSjQuyP1YIT+AukSOcChO3zlwSjx1gs63ay6oxOW7gYrz8
	2gruhq5xebEKE1gEoHhhSNo3XoNxUeS/hTjNkEZAJQ/U5MtuOuCbO0p2Dn8W/ZrdzOEOrELYRO+
	YSQlGxg==
X-Google-Smtp-Source: AGHT+IEt0L7eowj9syhu7VRI/x9xDxOk4NVySIoO/3E1zTrZVuto/UX1U8TTcSHn+qx8a5cyBIqbyw==
X-Received: by 2002:a05:600c:6212:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-45201350ea1mr143952555e9.10.1749464353901;
        Mon, 09 Jun 2025 03:19:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709686sm107272345e9.23.2025.06.09.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:19:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 11:19:05 +0100
Subject: [PATCH] coresight: trbe: Add ISB after TRBLIMITR write
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
X-B4-Tracking: v=1; b=H4sIABi1RmgC/x3Myw5AQAxA0V+RrjUZ4+1XxAJTVLzSikjEv5tYn
 sW9DygJk0IVPCB0sfK+eURhAP3UbiMhO2+wxqYmMyXO7UqKveIp3cIrn4KsHaY2HqxxRZ64DHx
 8CA18/+O6ed8P4pYsUGgAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_031915_883990_DEA07F59 
X-CRM114-Status: UNSURE (   9.99  )
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

DEN0154 states that hardware will be allowed to ignore writes to TRB*
registers while the trace buffer is enabled. Add an ISB to ensure that
it's disabled before clearing the other registers.

This is purely defensive because it's expected that arm_trbe_disable()
would be called before teardown which has the required ISB.

Fixes: a2b579c41fe9 ("coresight: trbe: Remove redundant disable call")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8267dd1a2130..10f3fb401edf 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -257,6 +257,7 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
 static void trbe_reset_local(struct trbe_cpudata *cpudata)
 {
 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
+	isb();
 	trbe_drain_buffer();
 	write_sysreg_s(0, SYS_TRBPTR_EL1);
 	write_sysreg_s(0, SYS_TRBBASER_EL1);

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-james-cs-trblimitr-isb-523f20d874d6

Best regards,
-- 
James Clark <james.clark@linaro.org>


