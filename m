Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA0CF013DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DLH9OkgzIRACCI0JUBEX92CcsSzaMraDpTjyv0j8cTA=; b=kDG9fgMOh73wXk68SZdouas3es
	qy6HcPBZcblN61jJdBep9kHSJduzgakJYU5mJsSLMr8D9XBE4EG6hzBwr4Z3MTob/1WUYq0PtOasv
	NAp7Fh59bL+yN7I1Znql2rYHn7n+7OfEQ1a2VqNJgvYoJ/X84ZZ6MoTVs1ezjviriUHCRF3QENXkL
	awZVXzoeBYxSRqarZbgXLEL+VX61aitJpOoZNsLv8v+q48s94D1QM8Xr0Zynzxow4FQq0e3K52twq
	zcVdbSRjvSJyvNFI2cz+Z6asd1pGgofhvN5dIPfNUJuB3RQKWyBWHSIUfNlYSJl5FenzXsUrT6akv
	Pvdxhfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23ck-00000003Zk3-0fqN;
	Mon, 16 Mar 2026 08:48:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23ch-00000003Zji-28ay
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:48:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64jDq538903
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DLH9OkgzIRACCI0JUBEX92
	CcsSzaMraDpTjyv0j8cTA=; b=lqlJ02rJ0kf2DEs10UrY2yOlrc4PYZ4jmlUkNd
	tPIp8NLtLCjDfhF/M7jcMUEhV63v+rCBufR2yr5ssqxw1yOlImnzKsa3MSzkcQLI
	jJsHvDoD5nBSFhZVWBePGxfHW/6rR1BSu8HVtPTLTafmAxrm+bL460JL4omVoA2b
	j2USTHCfF3Uw7n4U+t+MI5izMVTfSfJdxWeOY6TY0qmQkE7LprbbpIxLk8fZKmMx
	pygE5znsJyAQQoCJgRQBMxWod1fb7FrefI0reWx8DcE8L/Sc5Mdmx5bK+6AUXku4
	Y79L6PQ337kFLE349xtyje3jWmCJyBdDEptSfai0DeOMwgOQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5mv31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:48:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0554888cfso12730885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773650905; x=1774255705; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DLH9OkgzIRACCI0JUBEX92CcsSzaMraDpTjyv0j8cTA=;
        b=NZo/BZ/dthZTWsME+W9NggN+lnDaTyQDgZom3Cy2S0inOLKH6qP1l+8ZYnz7hNzXA9
         ApGbb3Kx7tmuv1OxcRjYe368W/pPVAzDLAbc4gZG/9d3WnLfKucIG2p5SqE0xfT+NVN8
         SGeydEYPQZk2iFWT7GS6l8L11g1DvJU4CLHSs6i1k7+JgJbiYjqHf6yoI83KFLY3Xvls
         IbGPmoG0b8EW50N2vPBxYY72rfFB1uhvh4SHWBCV3Vl7B1OS9r0N/8HYgfMXyUwswHJV
         s7Rh+sxEAE5XFYOfIHRb4yq9vBlXt3Jy/1ZNcqFUL+jyIYqttum6P4+PJluQMkxzdJFW
         TdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650905; x=1774255705;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLH9OkgzIRACCI0JUBEX92CcsSzaMraDpTjyv0j8cTA=;
        b=ASVynjt0KzPaG9ycVsn5QwrcQrZpNa9b5AG4/OeEATzzYpHAfMKrpVld5F/bkSquHX
         5o0UFhoVkN1gluzxxw9AoirYyfW+At2F3AkEewNID1A86DBdgIxsAqJqAtEbePouSBVu
         7CPJ/nFSLNJ6+PV4MyzJBAi3DH7wytA+QQdC79YBw9Qo+cXPDgZlQ1DmU/CC/QzW76Zj
         9vU7sGHJ1IEZ8lJlrcm2tiKaIyHKCiTX+oqEcRokF4ZQ6zOrzW3pY2X8qGq+ZO8Etyz0
         vrxkuIXvMiVxJcY7ZI9mdJXU+93hyAMMjBmEb+WR1a7MMo68nkTrNHlhYp8QHtF+RBtw
         LSaA==
X-Gm-Message-State: AOJu0Yw7onMrMdrB9sYWAgstaRiMn3EPCOsAorkKo68oxIFsgz7rkOIw
	l+OAL4BQlwEstpUilpYxu9GrvpnLxBsLINLDKgjgZWyk8MBtnDp4N1LROqRRk3FjquHs7K8r8VS
	HH0WKvzN99QZ5Gnt7Dc0slYfC0d7L/s8zK+BF9gUD3hiqx1scR+UkeoI8SjEvSr1aIuPLNivJV9
	+83A==
X-Gm-Gg: ATEYQzwMozkV44ehbU2o2XEFE8PYHoWQG6h7dG0RHrQgOkLuSMKwwWPbgUTtT+WaoQ+
	mYofvivApMDm1jcUhTmK1j2epp6Y0c3Rbn5ZZ13MLIgbd7xNbzoyCj0njjWoNBcq2L6+cCMF59n
	3zl87dff+FtGEXUuBVlvBm4JZvnbl5DoChyKDBw3AfgTd6Yo+20/niY2aMUCYz3yGTAMfGJf+8d
	qEA5BcBdWuRQCAMUPMft7msCc7hdH59+3J6grOKyLb98F9TFQjEXk/tECClTQkyELcNtPqrdjwd
	GqZ0cDKSMYPfVMyVXq3hpszhiE9eIfoQbiK3OCvfo262YJF9lwDbz568B5139yt4vHWCbwRHgfo
	Hc6Z2lbUr+wuyyabZ/aXtIvx5pwk1/O2R6avobUlgALO8IsvwTA==
X-Received: by 2002:a17:903:2ec7:b0:2ae:7f84:79e3 with SMTP id d9443c01a7336-2aeca9c64eamr115688475ad.16.1773650905100;
        Mon, 16 Mar 2026 01:48:25 -0700 (PDT)
X-Received: by 2002:a17:903:2ec7:b0:2ae:7f84:79e3 with SMTP id d9443c01a7336-2aeca9c64eamr115688295ad.16.1773650904555;
        Mon, 16 Mar 2026 01:48:24 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c4f9sm104154685ad.38.2026.03.16.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:48:24 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:18:18 +0530
Subject: [PATCH] arm64: suspend: Remove forcing error from suspend finisher
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANHDt2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3eLS4oLUvJT4otQS3RTTVKB4irFJcrKlElBHQVFqWmYF2LTo2Np
 aAKHaxsRdAAAA
X-Change-ID: 20260316-suspend_ret-d5e202d34cc9
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773650902; l=3429;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=C0RLfjOvxxqcBW+InCYlOuH6ZnHlMl5mOlNXy4qD4Rw=;
 b=AUJaZ1RZqElA354OMsaaGns516zMnd90syz1b3tgLGl8xo12UZecZgdv01fhugXZJd3VMRPpi
 OJ6JIIYKOV1As8iaw+vBlHbl3jXVFh9gq4WVbBVzU5W+fIA81vera7O
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: QzfKlePJlVfAuUWF1spnJ3YJtjyteBmQ
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7c3d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8 a=860BThSAxwKqi7__TBsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-ORIG-GUID: QzfKlePJlVfAuUWF1spnJ3YJtjyteBmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX50IZqj7nAdM9
 LnuZvcnUHJN4pwfdP93xjakIbl/p6tX9ZsqYStp33PqehocFYDF+tu/AMQ6gDHOJ0+Y3AIb/5JM
 SsZardMUJarUXrSAnSBptZX0jA/+RmTnDEo4GQrcLAyjDeFYI6yjhWqCyq9RK3USaeZz3vONvJS
 Le3upE+hJwdMVBUuffsQPF/dCDN6eUR/VFeEWBfOD51gTFonpDMAthXLapFMsJrMIzDFrscNgz5
 98sqJYM916n4QEv0OIGgHMIY9jfIPkZL7eBhw4ibAmvReYcyHVkHy1+YHXBk3yk2ORFdw8mAol9
 +fMbbCm1qpnXgaewtBQ3s9zXY5/PeGaClj6bMyfRVktDNAgcU+GFB2nXhmSxeIOtVjUjya4cFFC
 NLJMPLyYmY6NuAgo+2HVoqzgGh1zimsnAV/Jmo+us9dFJT2lL/Q9NyWTf7qGMKD0/vgcsi88msc
 dbkID+tlft4kAzVJXYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_014827_577374_7FA6FCB5 
X-CRM114-Status: GOOD (  20.69  )
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

Successful cpu_suspend() may not always want to return to cpu_resume() to
save the work and latency involved.

consider a scenario,

when single physical CPU (pCPU) is used on different virtual machines (VMs)
as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
requesting a shallower than powerdown state. The hypervisor aggregates to a
non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
resume the execution at the same place instead of jumping to cpu_resume()
as the HW never reached till powerdown state which would have lost the
context.

While the vCPU of VM-x had latency impact of saving the context in suspend
entry path but having the return to same place saves the latency to restore
the context in resume path.

consider another scenario,

Newer CPUs include a feature called “powerdown abandon”. The feature is
based on the observation that events like GIC wakeups have a high
likelihood of happening while the CPU is in the middle of its powerdown
sequence (at wfi). Older CPUs will powerdown and immediately power back
up when this happens. The newer CPUs will “give up” mid way through if
no context has been lost yet. This is possible as the powerdown operation
is lengthy and a large part of it does not lose context [1].

As the wakeup arrived after SW powerdown is done but before HW is fully
powered down. From SW view this is still a successful entry to suspend
and since the HW did not loose the context there is no reason to return at
entry address cpu_resume() to restore the context.

Remove forcing the failure at kernel if the execution does not resume at
cpu_resume() as kernel has no reason to treat such returns as failures
when the firmware has already filled in return as success.

[1] https://trustedfirmware-a.readthedocs.io/en/v2.14.0/design/firmware-design.html#cpu-specific-operations-framework

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/kernel/suspend.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index eaaff94329cddb8d1fb8d1523395453f3501c9a5..b54e578f0f8b03c1dba38157c6012bb064adaa12 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -144,15 +144,14 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 		ret = fn(arg);
 
 		/*
-		 * Never gets here, unless the suspend finisher fails.
-		 * Successful cpu_suspend() should return from cpu_resume(),
-		 * returning through this code path is considered an error
-		 * If the return value is set to 0 force ret = -EOPNOTSUPP
-		 * to make sure a proper error condition is propagated
+		 * Successful HW power down should return at cpu_resume()
+		 * however successful SW power down may still want to
+		 * return here to save the work and latency involved in
+		 * restoring the context when the HW never lost it.
+		 *
+		 * If the return value is set to 0 do not force failure
+		 * from here.
 		 */
-		if (!ret)
-			ret = -EOPNOTSUPP;
-
 		ct_cpuidle_exit();
 	} else {
 		ct_cpuidle_exit();

---
base-commit: 343f51842f4ed7143872f3aa116a214a5619a4b9
change-id: 20260316-suspend_ret-d5e202d34cc9

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


