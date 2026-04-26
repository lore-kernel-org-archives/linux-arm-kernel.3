Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911A9FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G7b/uBqzuEMI+mgDq4jUHqr7P2xYSFrOTGRJ9hQrPFg=; b=hqULLII8ci0Ey/
	RG6cbqHu1gVCpaU7bRg6m+I5W14KKf7/aVq0Eoy2yE9fDCqBKZ4160ty87cIDFjBjckmNU//O+2Lm
	37El3vJC6jrarXZ36FZKc7BHZZIKPXspSu+4ZqmZsyuDYiFTev1X2WMXzzZV6IkcUfla6ZVmd5p3m
	iEij/6pDA1K3OWan4QMiWrAeuAdVIJyj0N+PQCuka2cNtGzbYcolibEiaVrUx7pAtm9n084XwUYCs
	+kzj5sAjzodZNfyRKXduG6q4W+xG/T+k/AKpIiB1H7EBZcAukRu+iEPD53AydWBensT7d1eN7Jrz6
	SnIEJ4h5A68QdA++G4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw30-0000000FPMy-04Ji;
	Sun, 26 Apr 2026 09:45:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw2x-0000000FPLz-3XxE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 09:45:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q893U4886426
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G7b/uBqzuEMI+mgDq4jUHq
	r7P2xYSFrOTGRJ9hQrPFg=; b=lRMESk1f7Ww0HSI50a3aCLGVSAzJxl7SQPVAiQ
	te6QhHuoyGJ4xJsFWyAaX72MizRC+TVOw5Tm5NaF9T8Z4ypGFzKaLQy2rLED0MkG
	f1uDUei2o9UtC7QkNQjqYe8eeSXawLc/tnseXVU/lGchG2wt+b58DARzxB8WZQiY
	PCSkCOF8i2hCOFFiFnLDpTj1Kj3ENCejn/rJPNzxfua6SgAr/0rjV6C/B98u93LH
	VjZLaCff8OPTjsnsLWR04tvBP+QM661ZqZ47Q5xCrFPr1WHsmNkOmshw8sgy1AYu
	rPJMFSpoE03sMFL/x/r2ks+hmPrXtWkl6xLSpolsgzkUraxA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtamkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:45:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2eba42b8dso80557605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196700; x=1777801500; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G7b/uBqzuEMI+mgDq4jUHqr7P2xYSFrOTGRJ9hQrPFg=;
        b=Hh2xIb0cO8fSErIdzm2CKLxIRWwGet2dHqJhj+LcsvAQtA7TLcW33koJpXKR1Lz2wv
         sH9jQOhjMMzCnT0IkTHlzXzTUS7CkFnwoHeMAVeixRtA26OTfY/LGOapOui/9s30mkMP
         1ExJjcuahK7qjT6Ek6wUsPtGcnDZpOIh8t9VPZuZ3BkFYi65aL5L5WqC87CJiB342t1l
         ZOxr5flJ5IZtVM4972yqIxG1chCNY/job7bicQdTq7PE9xJ0U/rHFhgJ0sCBTg9x3JRs
         jPtLk4gZNwWFl9NcqFoGjdTCQkR06+CMva3fwimDiNETIOpRAB1s2M8GoXgqQz05Q2ND
         KyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196700; x=1777801500;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7b/uBqzuEMI+mgDq4jUHqr7P2xYSFrOTGRJ9hQrPFg=;
        b=Yx3Q0Opr4bYlB2jonPcfXFpM7AsBxVkml/XCcvo8MWF28+gaCaZozNiUUTOXMJQQT0
         Jt672JT6grGhm0LQAl7mFj8/k0gmJ3FpSoWeQw0mrntb0S6YXifaqCMrDGNrQFo85TtQ
         3RMQgVRCeRc4k/AnW0Akuy4VOK8MIG2LC4EgRmD8SZC7Z4VbtUi2HcR6jIvJqM2L1/YI
         mM3qOwFEHpf9gX8fWdckCvjrvBcBwcTcn1XIUc8QTuCrWdq0TDufjyCpqve8+0HtL1xE
         EL5+0RncMT5fTa+S88dw0+KTfpeCDe27aRjoQZBmyT1DdWNt7ArGPtv0qmaIEMD1adfd
         Sihw==
X-Forwarded-Encrypted: i=1; AFNElJ/i/7JAa0ANtpRVRaFPrvkgZEEUtW7xkZ8UlTljAM5ToqUl8b78ZJYEX+8ieiHU+32wSnQC5pbGf9B/vb7sUYwM@lists.infradead.org
X-Gm-Message-State: AOJu0YyVlUFhra+I9xaozDavmH08Ezpi9qOmBC7IhJV5lcyyDT9LZhay
	XtdrgZu5x+a0HtKw/DO1hypOBb4xe4fOirtap+WgZhVIfM2YbWs7zYBFpzzPV1dbt9V+3L077Bx
	LholJ4ufV6q1Ce9aBE3ABgrV+7VyObTHXWpEl73XneKtimCqfOLr21i68lIC0RCFdLorO9AB5vi
	5oVQ==
X-Gm-Gg: AeBDietFF9u7QTnfatCfMlgtzCSUGY+OQ43sx7cHMPbQtLBK83WOE+vnPTI/fpCH5Vo
	IiQzYiVVIYrX1nLwJg9hs+cxZO4wTQu1kGJKy9uW9UMvYAyp2ppWcmOFwTBTGp6y7wX31q0ohqf
	5d3tCXI3fTaKFBbfipmEGdf87HTuq7IuM+CkmusE6c48JOT2L/8+RuPeMaTdMYDQB19R1Z/Cdqp
	LZ6I3Ptx4/SjHNki1Y4wzFq6yiL4mxRI8p+VLSSdX4SEYrSWiEa9ygR07uZ6OEkYaOvWUuD3PLW
	jsVPdKO9EwTdSfcKTjYCMxhSHuW3UIah7BM/KXXXmHUyL3aJiMMx7ahEMSrYOCES2ooVT7RMzGo
	KA3qNzfEjnfVdNs2VSVQPDc4heCG74Qivuk3nou5Xz0SiOlQugbx3UOmpjM/YBgp9t9kRs2o09k
	CipwPkZhwFPPq9e8hCD8Yo4HIy
X-Received: by 2002:a17:902:ce0a:b0:2b0:af2f:b27a with SMTP id d9443c01a7336-2b5f9ec3590mr377638545ad.11.1777196699628;
        Sun, 26 Apr 2026 02:44:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2b0:af2f:b27a with SMTP id d9443c01a7336-2b5f9ec3590mr377638395ad.11.1777196699121;
        Sun, 26 Apr 2026 02:44:59 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:44:58 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v8 0/4] Add Qualcomm extended CTI support
Date: Sun, 26 Apr 2026 17:44:37 +0800
Message-Id: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIXe7WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMz3dSKktS8lNQU3eSSTF1jozRzI4s0S+PkpEQloJaCotS0zAqwcdG
 xtbUAjYp5RF4AAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=4590;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=LN6QvXIfvlOgF3WeZb3Zw7L625TymMXRS8Ovh3/G4F4=;
 b=U/EqHGBz5VvyOajPDJxSXuOSybQ5pe4QqkMyjVAKzteU1fjyXJHIcOZNVEe4TWj0oOBWKIGIZ
 YAQhD4VLlDUCqKtlzEchAPPnwMAF8SGAzQqh0AGKsP48BPyRIsEE88m
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69edde9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=ivfPcWm90DfOTC_Zvf4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zAJKP6eygG9Twl55WJJg7MWLpNTikRaQ
X-Proofpoint-GUID: zAJKP6eygG9Twl55WJJg7MWLpNTikRaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMyBTYWx0ZWRfX6xlIc4MweXBB
 uCAVDqFdp2+wuogsnJbJIAPQQo/0zXHhr77Z3bKgrrg60mRGooV50U/PR8Cg1mdqaDiWso3Unng
 e+8SI71mhPPsP0UdBwtE6mRlxHd2bmE5t9rXpf1n/Eto2erXXj7nTn2oitEnbk0AjI5sL0RopWu
 cQzKaovCI35mZfBBnp07TNCBkrukRPpu6+/ZLz1g2rdU4jtYnnSoGfTJmzoMc5emywgYV+XgnBw
 4iBb/MKYWAdJUN+wkgiDET4EVXgna3labN+mNIamfNhAhjG4wAKwVXfMilBjM/EulGQrSUD7tGc
 MB34QYvLmY+amI5Qs/0U+V6lDJpSOlzZpMuFHnffM5iGf/SegkHnPGYqJzkh8GfccbFULrcMu8r
 eSs+fTLNoMqh6Go+7FZuCmbpAD/iwSr953CNNwvnkVK5wiRwqUCH+M+FvpViRbZW28NrLhOQJle
 oDvdZANlnl1XOWlj4/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_024503_914406_C6CB4094 
X-CRM114-Status: GOOD (  17.18  )
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

The Qualcomm extended CTI is a heavily parameterized version of ARM’s
CSCTI. It allows a debugger to send to trigger events to a processor or to
send a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs.

Qualcomm extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Prerequisites:
   This series depends on the following CoreSight fix:
   [PATCH v2 1/1] coresight: fix issue where coresight component has no claimtags
Link: https://lore.kernel.org/all/20251027223545.2801-2-mike.leach@linaro.org/

Changes in v8:
1. Rebased on top of linux-next-20260424.
2. patch 1: Use devm_bitmap_zalloc() with nr_trig_max instead of per-connection
   signal counts; add bitmap_zalloc() for filter trigger group.
3. patch 2: Add #include <linux/bitfield.h>; move CTIINOUTEN_MAX expansion
   to patch3.
4. patch 3: wrap CLAIMSET clear with CS_UNLOCK/CS_LOCK; move CTIINOUTEN_MAX
   to 128 here with comment; fix macro alignment in qcom-cti.h.
5. patch 4: Make qcom_suffix_registers[] static.

Changes in v7:
1. Split the extended CTI support into smaller, logically independent
   patches to improve reviewability.
2. Removed the dual offset-array based register access used in v6 for
   standard and Qualcomm CTIs. Register addressing is now unified through
   a single code path by encoding the register index together with the base
   offset and applying variant-specific translation at the final MMIO
   access point. 
3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked 
   register instances on Qualcomm CTIs only. Numbered sysfs nodes are
   hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
   derived from nr_trig_max (32 triggers per bank), ensuring that only
   registers backed by hardware are exposed.
Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/

Changes in v6:
1. Rename regs_idx to ext_reg_sel and add information in documentation
   file.
2. Reset CLAIMSET to zero for qcom-cti during probe.
3. Retrieve idx value under spinlock.
4. Use yearless copyright for qcom-cti.h.
Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/

Changes in v5:
1. Move common part in qcom-cti.h to coresight-cti.h.
2. Convert trigger usage fields to dynamic bitmaps and arrays.
3. Fix holes in struct cti_config to save some space.
4. Revert the previous changes related to the claim tag in
   cti_enable/disable_hw.
Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (4):
      coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
      coresight: cti: encode trigger register index in register offsets
      coresight: cti: add Qualcomm extended CTI identification and quirks
      coresight: cti: expose banked sysfs registers for Qualcomm extended CTI

 drivers/hwtracing/coresight/coresight-cti-core.c   | 118 ++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   |  26 +++--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  76 +++++++++++--
 drivers/hwtracing/coresight/coresight-cti.h        |  32 ++++--
 drivers/hwtracing/coresight/qcom-cti.h             |  65 ++++++++++++
 5 files changed, 265 insertions(+), 52 deletions(-)
---
base-commit: 8594d92c94a3624acf07acf634a5e73a8c8f63e2
change-id: 20260426-extended-cti-32f728f93cba

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


