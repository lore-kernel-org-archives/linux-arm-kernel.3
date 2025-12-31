Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F7EE644C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3VGjqJh3RyT0cJ/oz3tmoYde8EAQg76pmaj0byO6AQ8=; b=vSnw8KHXSeb8tt/OBO3AI+GCkb
	OwbvuHBw5lVYehUX+6Y30O5ClHN+YRT3ZH4pKG/OCo+jeHF8bTbBu42i2rUksZmCXxwfK6gsobFbz
	o9bhZJhchsg5eLWvbvPOJI90/r1zyfPESJTsBqr8h7FmhwuZrMMYh+teX2fWOpa+dMQg7d7m29mnW
	ZBBekizx+neFuC5a1XX3jCulvA6g3Me7InLNmPDeKh9zV2fv5n9CMaYjZqtI1CjA4ISPkxFOp8Iou
	aTD4aIkvoaga/IKbJEIMlEHDUMtKK0VXYMIZkc5/myOcbZnjQHZ2RajGwXthkmfCYUKUwvQ8wfNYc
	u4gF9ekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayxG-000000068Q9-1fNT;
	Wed, 31 Dec 2025 16:21:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayxB-000000068O2-0CI0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 16:21:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVCgUJZ2860987
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 16:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3VGjqJh3RyT0cJ/oz3tmoYde8EAQg76pmaj
	0byO6AQ8=; b=jIir1ym/0RzTiTmXO0k0/TBi2NXCRdP4WCrkyCMzSjhQhlLPHIk
	nF6kmXL9ze+5L6vgKh2sVMXwCoSs/Ph4sn/xWrBDCfAS15YLpxDJMAzhGU7D6GT+
	03LgsXjS7+AhvYxfE/dFISRhhPyqS6pPqUjVoMN54CipnU5C3t5hS0nqa7aYJswU
	KOxp79q8qUJ7eazrC8wGNK0NaJ12eI4MWBqtq7SBosGpJio8aRxQmXY3AEQ3nkTP
	eETnrMt0FBF2KDPi5iDYvY4VikioVVt3jkr8IBrd5rwEkx28QqQg5uB5iOEySSMm
	TGoJhttT7HgGuFpsIiLD+y+siLkRv7JjsHw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74912q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 16:21:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7aa148105a2so10359363b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 08:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767198099; x=1767802899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VGjqJh3RyT0cJ/oz3tmoYde8EAQg76pmaj0byO6AQ8=;
        b=W4UKCxq2wq9nuGs/AUAm+FjdEJASbPLkE++T60JTrNPf9m30NWa5Kp4ejFCHoC9Rv3
         uqwXrHN7NLiraS451KVXWmvbpuz6QvrKQOX6JSR7SP9uxJnRJLuKmdNipLD7OcCegzfS
         rPD2kruI+ubt/dpV1K0WTabgPD1Icu9KK9OL50a5TMdbYkuHwAdCwpfDUTQgJkEbEH9Y
         UyToH6hVvpkSe+RBNemMXfrPvSXbheYlBFJ+3MoONljeBCXQyWeOHQJKtqu+v81VbzVB
         pTD/Qo7Gg36He4e6H965un6hmppTMFyF3H/fVH96PoqOPJOqi6BZIehOnxZyulaiNv2V
         SYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198099; x=1767802899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VGjqJh3RyT0cJ/oz3tmoYde8EAQg76pmaj0byO6AQ8=;
        b=wssnk0IGvW0O2C+inF/g2HAtvSg4MhUFZQtm0xrztJBvx03EZOGO658plO+bILG5s5
         T/M5s2uH8/49uGgM2tWRonYj2awEND1RheUuoDtcpyJ6iCG4yUXJwfcr9bgZUYFFCKg8
         PN6tNxNK2HEbfOr3LhbFOSx+fQT2QtWQgMvVcVjKUR5kmhXzGyYcwd3kP2j0UcI2wj/R
         rQ+y8REATXhrDs7N9HCx+dpe2it60/Wm16yV+Tr06ETM9yBLe9iikIc+Yo320VD7cE/h
         SjEDZht44Cyd6kctLRDnCx9NF6BC375pV2QiSpknF8LAJHqcr/xnwuePXeoKpY1LJbCZ
         IG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVemKqh+Sx5UgD4otCbDSankKQo2zF7UgZMRtRDeE3gxjO9mLKJBmsONLwedCbJud5dVORfEkEUKN/FWmAKzpb9@lists.infradead.org
X-Gm-Message-State: AOJu0YxD0uGyxWEfn0bQ77dbmvJBBqmozFcoETNS9kH7HmLIyfOg1K1u
	YipRO11M4KdqvpYp5e5X1SqaKWfVQ9xjPVfIu828ET5YJvxT9TfDNPTyLZ1Gstm5odrDo6HHxwG
	awqVYEBMltarbYeLO0svlMksdw0LD5gKy7gdVTPJsvtucx5CtMhPwnn/tuZxgSHjfR+O4MNvy08
	UAoQ==
X-Gm-Gg: AY/fxX7Kk4HvgBB5QZbAk8M419ySsJ1cpO7AzyOztc8y1X0EjK7qUVg4VeIwXJXNUag
	E6W/va+QGwnMrJh2kSyp+mIaH2DJoxChZSEIIMHlD4aOpvzHennv+moCCB5dOWdplA6idxshODy
	B/mr/80ATL9HxQ/TEBS3mP0guGpuVOWb8x/KgMBd8W6OixKXENWiKMh0gOFUY49sd8FpnFWoOCG
	nr6ehnOkHd1xQ5AvmSOrMhNbv9TTApN8+fvIoxgS+iH7FjyoSrLJm6tNHx/E3eL5N7Mb5sPhnn0
	lEovBXizRcDanT1liXov1R7+Y6Bp2MJNMoJLy9J2TLPi9KiSz8e4uD6p8/E/CnqbkpaArUZqfKm
	0CqDvEgh5v7lvkGeA4nOx1Lks+Vw=
X-Received: by 2002:a05:6a20:9185:b0:366:14af:9bd2 with SMTP id adf61e73a8af0-376aa0f0667mr38630114637.72.1767198098862;
        Wed, 31 Dec 2025 08:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYvA64y+3S57tuUNoeBafTx8Axml2iOeqZq9m8url0fId7OZAR4MDkFvxJDSd4oSBYqR6G+g==
X-Received: by 2002:a05:6a20:9185:b0:366:14af:9bd2 with SMTP id adf61e73a8af0-376aa0f0667mr38630087637.72.1767198098271;
        Wed, 31 Dec 2025 08:21:38 -0800 (PST)
Received: from work.. ([120.60.48.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9224d9e5sm33394008a91.17.2025.12.31.08.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 08:21:37 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mark.rutland@arm.com, lpieralisi@kernel.org
Cc: bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware() for SYSTEM_SUSPEND
Date: Wed, 31 Dec 2025 21:51:26 +0530
Message-ID: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pR1aIApu6xM4iFXNL1Ddkh8YmE6rvO5W
X-Proofpoint-GUID: pR1aIApu6xM4iFXNL1Ddkh8YmE6rvO5W
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=69554d94 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=06avtC1bF50uQPtHxsqKqg==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8
 a=HVrQ54pZ-2Peqzm-NS4A:9 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE0MyBTYWx0ZWRfX8skAkvkITL9u
 DDZh/WRfsM5zCeJXHzFXHEZBNTzGQNHNFSg6ob4GKiGW6OVxk8Lgwfb8r1rvLzr13t982apNIz9
 EcGwC/uBAxLG2Y07+lh366MCTXb3/h+yCK5xu3OkR5V5Yua7Yxek3L0fCVuXJWx5zKbU/7feApm
 oP6GZWlvTed36ZCBbJxK2N6O087Wxw0GIBkPusiuWK6JMvfDcAa27NuLmJZiAk7RDEEbZ/v0a3c
 P9NryL+DTZYcpoJSgH5tH2whOh/G/dRoneNlDKxnDIKx/oKdCpya4/rTlVJvf8hexoZCsTjtso8
 MoTa/ieXrC3nwdiTEq8qV4RrZorywez0/zbmWD1iMpbSG0AmmIKOhJ6ytj6oBeeht8IEANYPL9f
 HLhnUGxQlZSGw5ECZz2bpngho5ffoMd1ea6GVIon1Hm/6fPy5p3+wXDpC5Zs7HNKC+wP7KhetPj
 PHuM4z8AZzx08B60Hpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_082142_291064_A8C88F04 
X-CRM114-Status: GOOD (  18.72  )
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

From: Konrad Dybcio <konradybcio@kernel.org>

PSCI specification defines the SYSTEM_SUSPEND feature which enables the
firmware to implement the suspend to RAM (S2RAM) functionality by
transitioning the system to a deeper low power state. When the system
enters such state, the power to the peripheral devices might be removed. So
the respective device drivers must prepare for the possible removal of the
power by performing actions such as shutting down or resetting the device
in their system suspend callbacks.

The Linux PM framework allows the platform drivers to convey this info to
device drivers by calling the pm_set_suspend_via_firmware() and
pm_set_resume_via_firmware() APIs.

Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
mentioned APIs in the psci_system_suspend_begin() and
psci_system_suspend_enter() callbacks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
[mani: reworded the description to be more elaborative]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

This patch was part of an old series that didn't make it to mainline due to
objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com/

But this patch on its own is useful for platforms implementing the S2RAM
feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
resending it.

 drivers/firmware/psci/psci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22..e73bae6cb23a 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long unused)
 
 static int psci_system_suspend_enter(suspend_state_t state)
 {
+	pm_set_resume_via_firmware();
+
 	return cpu_suspend(0, psci_system_suspend);
 }
 
+static int psci_system_suspend_begin(suspend_state_t state)
+{
+	pm_set_suspend_via_firmware();
+
+	return 0;
+}
+
 static const struct platform_suspend_ops psci_suspend_ops = {
 	.valid          = suspend_valid_only_mem,
 	.enter          = psci_system_suspend_enter,
+	.begin          = psci_system_suspend_begin,
 };
 
 static void __init psci_init_system_reset2(void)
-- 
2.48.1


