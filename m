Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6463CCD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GwWcZxhrlPOqLk/0oPEsslU4SfaTGWracxN7WagixJM=; b=ENBkT8XskohNrn
	Eu//CQ/YohYncgYxw/UOA7HVZz5892UjskZuNtRcv+fiCUvGVKoSZzUL6Wo8exHkm7dT0RceT0doh
	10M1h3ti+prZdugVbwvZeg3LQmN6i3NSIW78rjDfN9x7xxRq3p3KkTwl/a5zFsJCDWbQnKkZX8XXI
	epnhtqGtB5DKklnoT8NgrgicV0zPb5M+9yMK8PDVyMFQhQGASH10ymGfMmNZfCICrsYvbz5kSAR3W
	fg4nayNugV+QPr1QoI7Eql50n+lU7Ev9K+tbsIsQYHe26z6/SiIpcQc3BKwxaNU4a7WSRy3i4TYT6
	tBWGoOtDsESGPSoxQBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2KU-00000007hbB-0Qva;
	Thu, 21 May 2026 12:16:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2KR-00000007hac-1QYD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:16:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99ksQ3527682
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GwWcZxhrlPOqLk/0oPEssl
	U4SfaTGWracxN7WagixJM=; b=eLCzdS//wjzsLD389PmlStAfjC06KbQYZdsMSY
	tl8qnVdkg5AcZbK/E0UYa7B74p4AIxdbXB3oCZYG39sJGQWVY/om6F8xvqeJTlRa
	JPnNVQzB5hNsxLqaq4SIQJ6JptU4GRM3otw1VUfdcudro9Fu8A8Q20VSFrSS60u5
	WzCSh7yrFADgXp0ccrKWmwQS084ccnaaDLZepwAEFoSTsBXiAYFgurFuUf4h67gM
	XcmVkisuVz/DPHJGaPajoxIbszHBA7NnC+sAHpdZBjH6F9xdG7Gkj0WEWZ/BmZjW
	eDe6rkFzbFyhSawqEbkVOaGLzx4xLKf705dP8x5EfpYv4hMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhgtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2be9e0905a9so11169725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365801; x=1779970601; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GwWcZxhrlPOqLk/0oPEsslU4SfaTGWracxN7WagixJM=;
        b=JEPepX9qfpI4Mj+nuIyVW7Gk0cd3dL2t3G/lFHQ4CXF7TqWZ0q8f9p4R8DPzrh2kdW
         kNhrPVTVxZ44txf+HvTDqpEYLZP66xUwMfRfTQ6m75Rbbd2AgnXQcCxrZ2DQld3GfUaj
         6wnDzKOT9w8fGed495J5mhdTMhHjDLP4Dt63x+A9bQAljrX2OrRCCyCh/SgZ94txjcVq
         qc1kNfCPq/vxMnUx6HgEbSivVhdsajXXx/r7tigfUZB6EGeIBvgWW2stHbLxsoy8fYsn
         jsP164UwkiANbKcvcF/wokS6ufAzPgalbphqDwiW8v7GZmAzikUvZ/6rBLqnJVUDdOt0
         vOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365801; x=1779970601;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwWcZxhrlPOqLk/0oPEsslU4SfaTGWracxN7WagixJM=;
        b=VW17rFZ5/wJijJ7GhnrJiQ8KoXM2EorLfbpK8OrYeVP7tGxP43vHNL8RSJB+OgG8Qm
         j+Dn/RpE/YpIHKFM8Ry/icEn2otsg6ab80VCznUHTBMz8ohbAjI7bS0/V7z+BPpx4qoN
         6Vm8RG+JT0l2tTKnXgRBU391/yDQ3pZaYo/rjrj4KcGpJrnye1/N132OoKXS3OiOyRcC
         OfV1xUXzXSJAcSj/eF3vxslgFVoOKphRJgdBS480SiZLxkAMrLNoD58tviW/LVPdTRvu
         N/mAZbVt3rRM1wAasEq1rCXwZz+7cTg8rrnptf5VV/0wg1s9kQk1XufLqFZsXpqa5JJX
         SeQA==
X-Forwarded-Encrypted: i=1; AFNElJ+v9WoY5iaZusHe0uCR5StAUBKrpKaTWXt+8fqFU7Ksw999V7IeWLHhJug2ph97xCQHZdNYYEQtU3tcpqMB8RF8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/1IuDYIwGjLbCWFhh+ekE4hUe5bXVLObEWNI3ivOWVRaS8gIl
	nBduQmuDg9fdrRrb7CSnvmOWyuQQO2FQbvkI0BGIgN1cEI1LjuN8sYKDm0TlDEDi6KRst9mJNN3
	cLynorBLm7JJyp6Pc/IfGb/pYz557H276Vv6M8uAZHP7L4HlxhAZnQakQV4e6TLv6hxAL1prwhh
	XJG5tqe/NSiQ==
X-Gm-Gg: Acq92OHASuGhlzmomJlTGYBacHJv5E2NeFIH/u95wXU6bZVzrOSoQuPJYeoANUI34Tk
	JqScWv7sZVlbZth3hRt0th6tIy5GMBkIUizZIptX4r1MK8AD6e04E5qjdtejSD/kyNB9Fqo+mCp
	5DPn9IP0QsfIjcaTz6RBpEO5r/g+HV2affqRlG8aav3g99tWLVIqsblYSdE351m0m6xmAozmsMA
	AQ6th/oLzh+cSBvAqMg258uRhLhG9Y+65ZUIn6aJ5+fVyPZfMfx0KwxKYXXjk1JVDw3tE1V4Wdm
	t9GholKOAGXrrhoNRl3oFAopJkBCoe/T4ybHvy3TEkdMvuNrLdnEagOfBhOx4KzY1pp4wb77t12
	eAeZ83ESiFMQW5z+PglnHq6UYabapNsPp9OB+WFcZislJ+iEZnP4BPGDrj40RHVyMdy/D8vhT0e
	uebCtEvJ4UXs33Iw==
X-Received: by 2002:a17:903:244c:b0:2ba:881f:6192 with SMTP id d9443c01a7336-2bea3346857mr29887075ad.22.1779365800653;
        Thu, 21 May 2026 05:16:40 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2ba:881f:6192 with SMTP id d9443c01a7336-2bea3346857mr29886455ad.22.1779365800081;
        Thu, 21 May 2026 05:16:40 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:39 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v9 0/4] Add Qualcomm extended CTI support
Date: Thu, 21 May 2026 20:16:26 +0800
Message-Id: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJv3DmoC/x3MQQqAIBBG4avErBMmzaiuEhGRvzUbC40IorsnL
 b/Few8lREGivngo4pIke8joyoKWbQ4rlLhs0qwbtpoV7hPBwU3LKcqwhau0Z1O3lJMjwsv974b
 xfT8Puy24XgAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=5452;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=aSagP+Ntd8ExqIv/bmaQy6rZMayOFWItjxgrrEoG8Mg=;
 b=cV9FjF0Xo53AU67TtHOGcvo2RDNaE1U49xBnIOkD69p4q7X01HoiDSaL0kNjJMlrribCKbyT3
 7EJ6VCljjgEBLBPxnUyZLdJcdqibpp/LkSjcYeQlKgjIQwJ0CXZAGz7
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfX5Wthc6W2YpVp
 sm6p6q1do/hJQlGX/KNyv6m3xcXBocFk379grg6dfdzhmiUMRAhw/dFVbBM2Bv2jGiCRXQZpRKL
 lmk4Rde3DmbjV3t0l15KbPIjW1Z445/YMCo0Sai86SiZ2ax8oAZc5+5rcc08YRQ1i5JFsYwsCcV
 YPp5PP/Ku7JNzlnDu2iHlL6EQpP8sA0m65gA2oU+OVYTWw8XuHnBWUL5RxG7k8bwIrhuTAZlFNn
 Eqk+L3LiI+uBAlI2k+gtMmOm8EFHM/0+NXCeYFVP3fz7HbPRMqQ7XPXBKKIvckQO6wSjF+lTbau
 1oIdi7foJOJHxu4FWKX055JYP7cIW+tPbq1e+8XHQ6sz/QS9lRdC3pz+D3C7lqJa4/rfrajO4wU
 3PIAnTD3lVrGx6KctSiVOdHVPV5ppzvYEDbehgI7Bna86hF/IDNlAIp5fm0xXqyHybWNraXQJcA
 s2LGc3JXREdjAGtyRNg==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ef7a9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=xEwI6Y9Ks9AXzKRB910A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rqu8Lno0CZntDP5fYximOCQhYXTsv0rB
X-Proofpoint-ORIG-GUID: rqu8Lno0CZntDP5fYximOCQhYXTsv0rB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_051643_500809_2F5B638D 
X-CRM114-Status: GOOD (  19.28  )
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

Changes in v9:
1. rebase on top of linux-next-20260518.
2. patch 2: Replace the "encode index into offset high bits" scheme with a cleaner
   __reg_addr(drvdata, off, index) helper; update cti_read/write_single_reg() to
   take separate off and index arguments; add u32 index field to cs_off_attribute
   (moved to coresight-priv.h); drop CTI_REG_SET/GET/CLR_NR macros and
   <linux/bitfield.h>; update commit subject accordingly.
3. patch 4: Add three index-aware sysfs macros (coresight_cti_reg_index,
   _rw_index, _wo_index); replace string-matching visibility logic with
   cs_off_attribute.index field check;
Link to v8 - https://lore.kernel.org/all/20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com/

Changes in v8:
1. Rebased on top of linux-next-20260424.
2. patch 1: Use devm_bitmap_zalloc() with nr_trig_max instead of per-connection
   signal counts; add bitmap_zalloc() for filter trigger group.
3. patch 2: Add #include <linux/bitfield.h>; move CTIINOUTEN_MAX expansion
   to patch3.
4. patch 3: wrap CLAIMSET clear with CS_UNLOCK/CS_LOCK; move CTIINOUTEN_MAX
   to 128 here with comment; fix macro alignment in qcom-cti.h.
5. patch 4: Make qcom_suffix_registers[] static.
Link to v7 - https://lore.kernel.org/all/20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com/

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
      coresight: cti: Convert trigger usage fields to dynamic
      coresight: cti: use __reg_addr() helper for register access
      coresight: cti: add Qualcomm extended CTI identification and quirks
      coresight: cti: expose banked sysfs registers for Qualcomm extended CTI

 drivers/hwtracing/coresight/coresight-cti-core.c   | 131 ++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   |  26 ++--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  97 ++++++++++++---
 drivers/hwtracing/coresight/coresight-cti.h        |  28 +++--
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +-
 drivers/hwtracing/coresight/qcom-cti.h             |  65 ++++++++++
 6 files changed, 281 insertions(+), 70 deletions(-)
---
base-commit: f0d051a4a0ad6d37c1a88fee7f6a611f2e3dfa77
change-id: 20260520-extended_cti-305ed12f0348

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


