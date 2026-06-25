Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED8BCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s2eedrxPa6/UBVtYY6z9bW5Mt1Eb0uQ/gB/loeBb0Po=; b=CoOnP5cJA9g7Ck
	qPppOvTBRlMCOwlcJHLJ/H0OSGNIKMH1z98/y0fMPSXuCxipvIsYBtqAn6sftj1FJq8ZDrlvGIRS2
	fEjG5DSpD2i3ClKsH08VTlNlMO5VqmoSY6TMJ3zHbGy+MvGWigA5vK8Spo0BUMFx7AoyDAKNOo3+x
	Z2moKDPzt2B/e1Xu+CiTCREOgrBkjd+JhuPQw1S9lUuUDnbBRc6ySDLMmDXwiPUcSFTv40e5DzR9y
	k4FAOIux0GpK7mO5ZykSCahywL4u6ZPcspwsyQJ8wbGkcy1ct5lgciaaIEWF2NGAUtV8eXu+2PjXa
	L0yY3a7FcKtz3rHf4o+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbG-000000090yR-0ujv;
	Thu, 25 Jun 2026 10:46:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbD-000000090xx-2Ao8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:46:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jtsQ1919432
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s2eedrxPa6/UBVtYY6z9bW
	5Mt1Eb0uQ/gB/loeBb0Po=; b=gYt70t6xUiJAm2E5pkyjY3a4bgeZ2XUNw80d/H
	gdLRSYjW2PhiBkEjbjb7FJgPrpveWskOizQ6TPsVckq/7ogayRhX77Xx1bcF1Uub
	R6kqnMWexMtkJ9lHRl57VYJjdFJ101UBI/Cpi5+n4ZDlzUN9E0ZyrzjOYU9epMIM
	nNj9E9cxya/3zk/a8gFAWfC9r5dKMTU5ahrmQHx0AfUctP/wIetW60q4TJVJsBGn
	vqtH2ckGWLZIRHVj+oZuNA4fDpA5YW8XYv5eR+zRx5yy55SJv55Z+8nquUGBmuNt
	TyTMK5Mm8FAUaOmcKe86pGQnzxAIaKNSQEhUBS30b46on8Zw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9t5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7403e80b0so23178425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384380; x=1782989180; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s2eedrxPa6/UBVtYY6z9bW5Mt1Eb0uQ/gB/loeBb0Po=;
        b=GC3dpRZ9fJmhsUzs/vXFMogWQ3vnOK3+fTVye3my1aQSjBgmYsxQppfuvyP5QR6Ex+
         IP8akys6Almed5fh6NcBceU21SpV/Hqb9hjQ9uYXMT2cQMEP/+/RZSqB6IxW9unio9ko
         X380g+nFrRKM6YM7DQaHcBcDZ4/+sGhptaGhvSk9koV23UcmilXprFkRzGyhcgSkKnZT
         e+2srJ8rUWP1Nwub2b5uKIeiaZsHMgYyt+pP8WXAFSgttwUEE3JMrM+tP+6YmQ7BhnXL
         NAnl9U+1TFxl+pt/bc8UF3Rw1h8g8ww/2aOBUkSPAPLAjo0t2Wh0jYmXZhUplsShbcnP
         yB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384380; x=1782989180;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2eedrxPa6/UBVtYY6z9bW5Mt1Eb0uQ/gB/loeBb0Po=;
        b=jdnECWH1SSPNV8Qzn2yi7dR3EHuRf1vyisnFHp0TzGA+02DfRgkYbbMQSqESzYsLbw
         sqCAsovq25l3YZyWKdDKgxNX23l+rFR2xY2pJwECocxs9clP8QwlBVM2JZ7X7ckPZYrc
         UfQPgmsqFEnIeyR1w8VluB31V5m+hgwhRnAvutvf4C3leLmPmtRW1+Unyk5Ah8+hCAnI
         0L39+vUKJ+Z8ZwpZp1nUvn5Uh9lVbnvnP/QWzUypelwSvgK965N6RgdCvf+D6ZL/j8VH
         KwknCBsO54GqXt64T2gfBDEz990Xb5+4I8ErVmKWE4box9VfbUL+XpTlJIAomE7F1DmV
         PTZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpnom8RzalnFU9r+UuLxRJ/aMT89REWFGTcRgN2uDoyy8h2hh+7qBB5FLVpM/E1B2gLuFIQaeALD6kyBSTR9tfv@lists.infradead.org
X-Gm-Message-State: AOJu0YwRtoOSjqvM9253BFn7TSJwylyt9/fnPlgu6zRX/lrB3b0138hx
	pGtlIg9PuOjfxNccq+VZk72c7Fr5BMszXKLwsv6yGKkV/NrDl9wrPzb1RHNZEb+R2i8wsfMEnnM
	kzAeM/FXO4tzAv3ywJpzW5QEm/uJV9eGp3hwYuM3Wqyu6lBQphr5VkLL611PBKYJdV0MOzFjdnb
	0FJA==
X-Gm-Gg: AfdE7cmWh43yZuCVTR39JWI+Ab7BhL6EQLmsnuspM+wACWsKIk9cFqOKJj8WOwUupUK
	n5d7ASHISsbOLuU3JzGgxFrav8SGRKhy0VQnJVNv3SDM74m6Yz7LRxJaflgkzAPKU4FzFJ2QqDb
	aAnyOEnSAo1a5c22kjbji6frYZxPUHqlQMjmD9F1G0dmJKNmymo8L8WTZAZ919LC6jNZvk26z/f
	Z1ZwDHngnqDyIjGDaqRTQrZdGgkqLVOnQs2JPrcL9YiG8xbo1mx1hVieTCIP+dlnug4nHaYdmXT
	na6yDbJgqAqen9SKUZBl5Bzai4jYes7RaiqYmpatVsDDTr0xGIha2fCSBMYpr9m/E1UEKm8xH80
	Iux1pQonyZpoPacAa33J0gwQ7erURKi5pOy4Q632Y8LV7WTJf/D+9qSbsMSV2+fWWzLY78N7UlQ
	==
X-Received: by 2002:a17:902:fc84:b0:2c6:afd8:5704 with SMTP id d9443c01a7336-2c7fc632ba3mr22397375ad.4.1782384380194;
        Thu, 25 Jun 2026 03:46:20 -0700 (PDT)
X-Received: by 2002:a17:902:fc84:b0:2c6:afd8:5704 with SMTP id d9443c01a7336-2c7fc632ba3mr22396955ad.4.1782384379649;
        Thu, 25 Jun 2026 03:46:19 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v19 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Thu, 25 Jun 2026 18:45:50 +0800
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN8GPWoC/43NTW7DIBAF4KtErEvE8E9XvUfVBeChQUpMC47VK
 PLdS7JJFrXVzUjvaeabK2lYMzbyuruSinNuuYw9gHvZkXjw4yfSPPSCcMY1E8xRHH04Ig2XCWk
 cp0pTqTRO8UxTsho1OBtMIv3+q2LKP3f8/aPnQ25TqZf7rxnkrf4P21cpo5FZywUqb1G/ldb23
 2d/jOV02vdBbvwM6okEsUmqToIxJoHEQYBbI/UTybdJ3UnjJYiBAwQ7rJHmQUoOm6TppItJ6JS
 USpGtkfZBKmY2SdtJHvigHJNaePEHuSzLLwcrTsEYAgAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384371; l=11105;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1y3m/1aA8pqce6oySsr1ykpMgEsta7KtopOf5RBOeB4=;
 b=d8VH8S1nw42KTSLSSnY42XXLp31Xj5Cmlp3hlxmP4aEBdQ1WC8d6b4Jlt5vxeRHpfDTsjIpuB
 sKzsrL72pHPB3RoWXd/qvHxSbH4zJuZxzlhJUy2aDHBPvbR8bJ3prm1
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: orr1mtp52sr5yGej6piWP7uQS1nrkSn7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX7tdAOjjnAb+v
 sWKBlSEiio+wROfDRgVEZD2oxOd/ULgax8t2Oe1du8R+HYTlrLf2re3C7FXn1/WodpXOyzbAOSg
 p8YvZuQI3iYmr+ukI9QHFs4c6frkuGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX+vyIoZV0cB6I
 r7d/ckP+W98qArwi2ySAK2lahNe/qQeg0MrafBjgMbKu0NF+GXWXXrCHtUsskWFdBXuv9FTCNPl
 jb3noxBMJBwlOB7tmF7iINCBhHkdr7iiw3C75kAIkUYfj1qfVPcOBdF2dhhzNY7Pxm7zWh24ScX
 hO4OYBkYLlq3eIlpbqxzMycGms9njENP4Qvo4MKEYPlSXfXCbw6zT3roe/QzQEmPmjBV1/j2566
 YX0EGDmRLuooR8iLWcDIMV+Nm2En+OLG9stPYbAskQzE+tM3NTojNhLs54Y0NBU4mU1eDndZwYC
 9PiKLQHF3OW9H7kxDnrorJqQBzkvhYcrYnSrzpgYicROEla/or6Eidfjv8OvBVCiw5ElpOo3dxr
 VPBIV+Jzb8WtwqO6w1OKEbKCdOfUaKreqL32/pQI7zQ7MA3+e/aUNP58rErAUwhMkAX3LjcyywH
 wGoN2t1doZetQgPpsGw==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d06fd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ydBVYVaL_MXDkjDL6XMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: orr1mtp52sr5yGej6piWP7uQS1nrkSn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034623_697197_630D7D05 
X-CRM114-Status: GOOD (  27.13  )
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

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0

---
Changes in v19:
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Simplified the kernel-doc "Locking:" note on tmc_create_etr_buf_list()
     and tmc_clean_etr_buf_list() to state only the required contract
     (caller must guarantee exclusive access to drvdata->etr_buf_list),
     dropping the over-specific call-path details.
   - Lock the required code block in create/clean functions.
2. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed a stale reading-state / double-free when irq_enabled was
     cleared between prepare and unprepare: the byte-cntr read_unprepare
     would return an error and tmc_read_unprepare_etr() would fall back
     to the normal unprepare path, freeing drvdata->sysfs_buf while it
     was still owned by the byte-cntr buffer list. irq_enabled_store()
     now returns -EBUSY while byte_cntr_data->reading is set, so the flag
     can no longer change mid-session, and tmc_read_unprepare_byte_cntr()
     additionally guards on byte_cntr_data->reading.
   - Moved enable_irq_wake()/disable_irq_wake() out of the
     byte_cntr_data->spin_lock critical section in
     tmc_read_prepare_byte_cntr()/tmc_read_unprepare_byte_cntr().
     irq_set_irq_wake() may sleep on slow-bus irqchips, so it must not
     be called under a raw spinlock. The threshold IRQ is already
     disabled by the in-lock register write before disable_irq_wake() on
     the unprepare path, so no wake event can race in the gap.
   - Added a comment on the byte_cntr_sysfs_ops pointer documenting the
     single-CTCU-instance-per-system assumption.
- Link to v18: https://lore.kernel.org/r/20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com

Changes in v18:
1. add a NULL check for the in_conns instance in patch 1.
2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
   previous check for the return value is incorrect.
3. add more kernel_doc description for tmc_clean_etr_buf_list function
   in patch 2
- Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com

Changes in v17:
1. fix race issue during allocat buffer.
2. fix user after free issue observed when remove module.
- Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com

Changes in v16:
1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
   functions for etr_buf_list" because we are allocating/freeing memory.
- Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com

Changes in v15:
1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
   functions for etr_buf_list"
2. optimize tmc_clean_etr_buf_list function
3. optimize the patch "enable byte-cntr for TMC ETR devices" according
   to Suzuki's comments
   - call byte_cntr_sysfs_ops from etr_sysfs_ops
   - optimize the lock usage in all functions
   - remove the buf_node parameter in etr_drvdata, move it to
     byte_cntr_data
   - move the tmc_reset_sysfs_buf function to tmc-etr.c
   - add a read flag to struct etr_buf_node to allow updating pos while
     traversing etr_buf_list during data reads.
Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com

Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (7):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  27 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 327 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 146 +++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  81 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 265 ++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
 12 files changed, 896 insertions(+), 73 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


