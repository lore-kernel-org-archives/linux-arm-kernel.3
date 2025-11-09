Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95B8CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XW2y5qioC+SPBlfV5RMk7FiC5oEKR479wtD8KF5rP1Q=; b=4mxRX61ZZlwYqmzjZNpi6SQmZL
	/ZvOx5h+fm823/IPVZW6f5uYIehrdQSnk2X0r+SsIV42K5MBUpR7CxBKlRS6DXDsnuq719AZjKA8w
	NAGy/+LqmeqT9o9mD/1Pm9o8PIFU8sw/0H4tibcxyoQFbIKUjwqfjwrrVWnPuvUjOEyBR6DD96FlT
	ChuvoNPowa1ycbxJ1sbVVnoNY88PXJA1rEjztAG74PB3fbxvuwqKz2dj192wVXvtpZ6yoQd65hPN7
	hQ51nc/lvpefOI+ZXYb7GaeTjOCn+8tdDR9RBCAvetwdtfujAtetrpRM7LoJC3PIz7LGxZtHF9C5r
	vjqrmpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Yu-000000044vI-0xyj;
	Sun, 09 Nov 2025 14:38:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Yq-000000044tb-1iyg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:38:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9AXjL9284099
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XW2y5qioC+SPBlfV5RMk7FiC5oEKR479wtD8KF5rP1Q=; b=N16ebbxPOt3GpNtx
	jpG0IO/0FkAxRRg6/c8MjDBZhXu6j8FM3svRePT4ztmHzX5UghwK/wfX/t4pfDrp
	jlXybmneV2MDf6uLMfiIDcG5jCz+eYUfYDdvnHDilpMsAr27rhAF3BH2cEb41Ad4
	uqZGGN8Qjmu3R8CPaZhndVM5vLiVcjSBgEWDemrhvUdYWNfL7PKpcK1NxaCc71jy
	ZQhwpK8ZK+mXEewjnkHVb6i4/69OJf1VYlbJIkC03dRboxrSEMB65t7blIa3+pY7
	csTGuWjK5HRAT6Yxr/G96N/ZT8DbU2imiSEEvtpqrMxxTLtbCie2xbQDT6Jr3Zyr
	YjUA+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aad2a12tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:38:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso2482400a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699110; x=1763303910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XW2y5qioC+SPBlfV5RMk7FiC5oEKR479wtD8KF5rP1Q=;
        b=BnF8HG14BIjo2GWIb5VHwZvzK4ta6inRB1FislhzKXjMExZeBI2pCKMkkqbg99cUm+
         ufCCUCd+zcwmKSxqQAKxpd4r1wBL5ETyuJqrbryUrcOGENBbWR6DHdqhCdFa9tkST7IO
         G4wMP4CtUOI6hHokApBjnG5OTM2XCrS5dQgEzSkkyvCjc1wbsbmw47w7zB6hjtGdJXJM
         X+jWUecnf0tViJiwoCwQXxKeMOiERY1ZtDvaDkWbygW4skQKzKhJ2tGN2/IcgH4TA9SR
         bLxMbOD+AX/o4wBFqem98/EwebcihKh6zf0GI0kt0+IWS1i47XuaYLbx4aN7ZZK5WGVO
         JUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699110; x=1763303910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XW2y5qioC+SPBlfV5RMk7FiC5oEKR479wtD8KF5rP1Q=;
        b=Dw+NtuuQQlopyT1VMt0VgNXkTnwCiTnjWO0Xawvk87OJ8j3Skqaw6JTg3eWXSFlg5E
         QhGL8I8ekiPAEFG1xLMuve5CwoCnuguZNWmLaI0aWRjfrGGLcuakpeCas5YBl+QFo/ZJ
         +B3vmtV7ftTPs7TSrTQwUzSMG1lzRTNjcGJIA5Ea80J+GbwASxb9TQ1EtPxl86d/wA1T
         q6ZSa7VzthXCB0HDglJBDckaZnoljut/u+FoVl555rDEeqonJ/4atqL8ykLgHxBw2u9R
         LndQLqn//IpslmnhxH+cZJT2sCJtGxQ5GUPwkL6q3iqcbWYSljiOKA/fHSYyx5iFITjw
         P7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVqJ5KitMNwmQb7RYGaezCUzOG22MC95qq28l9JMdkuRR0tAuuD/pmB6WnYTUU8tSyPRGJSnYCA/uxs3ln4rcqs@lists.infradead.org
X-Gm-Message-State: AOJu0YwQGLHw89YoSo4mYWjAHwMex6pjcHhsM7Lmtjbuxa17D+ymBKBa
	eQI9XFsVIeKbhPvCtP0rWEsP5Vn/cwKAelRDtwauzYk7F8MPGsYt4XdXVPVXvd6TWtW5XngiSUS
	RCMhZF+4Xy0Gig913lhC1teAYTCo6Pioz9m+VYofjOI3VS18SisQL2RncGuUb2ZCF5e/zC4ZHRI
	bBHA==
X-Gm-Gg: ASbGncuQEFXNVMsRP4oqZtBkKLBUcV6HseLvaRil/1mq6AZg92HrUy82aQfdKJxkrf3
	Tyu7hbxoORewwqnkwnllgy750PKoeM/pcNAS2ezFo2YZs1P3/69KfckgNB4bPYQ0mBCTQoRKarD
	rOYfjrzeQkLHLvGSoiFE4gpT/yFn1P4wCi+4Sb+l0dg50k7kn/wcgu0m+qnFwc/jCBWgT8o5USi
	MyHm/xI1l3kLjpeJHSYKS3zCQCTbjjeURHyUCC6C9xPogPy0tLXbo0RZyLA0Xn2oKbdAAAa2pq+
	QkkxAOcx51hBiA03d28rdKXXOv6Opf4qKu0UX/ANrbVL1LDkfO9dlhnxsMEE9InJakME5nliIl3
	sd2fVyZReIgIq6Q7DjYzsj/gL6z/CjtYVnSE=
X-Received: by 2002:a17:90b:3811:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-3436cb73e66mr8015014a91.6.1762699110246;
        Sun, 09 Nov 2025 06:38:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI4EIvuNbEFq4KLN5FHWa444x808BHx17XtNyZvkZvzfUrXB1Z2wx/ZIkwrpEWFTg952zrqQ==
X-Received: by 2002:a17:90b:3811:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-3436cb73e66mr8014978a91.6.1762699109678;
        Sun, 09 Nov 2025 06:38:29 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:29 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:16 +0530
Subject: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=7027;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EQ90lYVfyz+tdTJF0OEbz8TSgTdlKU5QUPgYOVB1ofo=;
 b=Kfod+JF3iywzY91KfPB+jr89CkaOtAE9QTJIxP8g1QAeDEUgfTCQDbAeZK29nw7pALYzMYwOb
 j+WD81Ci+AoACXN9Mr18MfiNM7RGg0kMomlao55X5svxU3hYIhQHjh9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=aedsXBot c=1 sm=1 tr=0 ts=6910a767 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bqVjg2-MoX4cBg1ZSeQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX8JAiQZDcULQ4
 FMUW/h04771KFCryp5KS/I9n7cCRU7gjh8JFvIU281kyZfbd3IKsxuEDe67DFETyJKoX7+vXV/c
 8zU4qbLdJ1ul7LCvSJc3szvHlQC7F2B5vpwaDJgEmQZKVNHA6wXuNg2AdbeIbpx2DRy8EmEM7Qq
 i6lvC2wrKRF0tb4KdTaE8kZ/M37GO5aPVHtSZU4b2nY/Mv6SZfnPnWo6H0CzMiV6n2FK+E7wsTm
 t8kp5tWAy9BkV1d0bDte3dqUl3bAKZfLG3Kqxxnn7jXmtLy8t52Lz81d+nxtcKyxpVGHsi3OBSN
 GOccIceMgORteJX5PZOo8/sC5EyDEOtgcelKykiamNWvXsfC4KWE+O9fpRUUmQqo7dKeQgsq2xF
 UsLv5h2Ebsf6tTF/QSNTdbF8Li4E+A==
X-Proofpoint-ORIG-GUID: 1xfdBI-IG_LEWwKV_AsqPr9rcwlrJQYu
X-Proofpoint-GUID: 1xfdBI-IG_LEWwKV_AsqPr9rcwlrJQYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063833_169468_6B9A9855 
X-CRM114-Status: GOOD (  22.91  )
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

Current reboot-mode supports a single 32-bit argument for any
supported mode. Some reboot-mode based drivers may require
passing two independent 32-bit arguments during a reboot
sequence, for uses-cases, where a mode requires an additional
argument. Such drivers may not be able to use the reboot-mode
driver. For example, ARM PSCI vendor-specific resets, need two
arguments for its operation – reset_type and cookie, to complete
the reset operation. If a driver wants to implement this
firmware-based reset, it cannot use reboot-mode framework.

Introduce 64-bit magic values in reboot-mode driver to
accommodate dual 32-bit arguments when specified via device tree.
In cases, where no second argument is passed from device tree,
keep the upper 32-bit of magic un-changed(0) to maintain backward
compatibility.

Update the current drivers using reboot-mode for a 64-bit magic
value.

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  | 13 +++++++++----
 drivers/power/reset/qcom-pon.c           | 11 ++++++++---
 drivers/power/reset/reboot-mode.c        | 19 +++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c | 11 ++++++++---
 include/linux/reboot-mode.h              |  3 ++-
 5 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..5d73dde585b1fd438b1847f884feb37cd9e4dd5c 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -16,15 +16,20 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
-	int ret;
 	struct nvmem_reboot_mode *nvmem_rbm;
+	u32 magic_32;
+	int ret;
+
+	if (magic > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic;
 
 	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_32, sizeof(magic_32));
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..d0ed9431a02313a7bbaa93743c16fa1ae713ddfe 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,22 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
+	u32 magic_32;
 	int ret;
 
+	if (magic > U32_MAX || (magic << pon->reason_shift) > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic << pon->reason_shift;
+
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic_32);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index eff60d6e04df2cb84ba59d38512654336f272f8a..873ac45cd7659b214b7c21958f580ca381e0a63d 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -19,12 +19,11 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u64 magic;
 	struct list_head list;
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -56,7 +55,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -80,6 +79,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 	struct device_node *np;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
+	u32 magic_arg1;
+	u32 magic_arg2;
 	int ret;
 
 	if (!fwnode)
@@ -101,12 +102,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			pr_err("reboot mode %s without magic number\n", info->mode);
+		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
+			pr_err("reboot mode without magic number\n");
 			kfree(info);
 			continue;
 		}
 
+		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
+			magic_arg2 = 0;
+
+		info->magic = magic_arg2;
+		info->magic = (info->magic << 32) | magic_arg1;
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..3cbd000c512239b12ec51987e900d260540a9dea 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,21 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
+	u32 magic_32;
 	int ret;
 
+	if (magic > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic;
+
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic_32);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 22f707ade4ba93592823ea8718d467dbfc5ffd7c..e0d3e8a54050a76f26846f456120b4c7e371d284 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -3,11 +3,12 @@
 #define __REBOOT_MODE_H__
 
 #include <linux/fwnode.h>
+#include <linux/types.h>
 
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


