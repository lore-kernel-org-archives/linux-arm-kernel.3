Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E99E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8if9HSep4KFqyYKmAQvZ/xX5Za1r2V2L3CJHGopBwU=; b=QQ7mf1thUxpxcP+IDv605kHIDQ
	/zpREIQn4uaRiC1qgUA0FZOILcyJB+OLQMPm9oMAKCK+I/mvDarQBRe2m4UOvnwd60/9GH/V8GUf+
	EodYr1bi98xPDIm6CGhqf3PkiMyPgsX+kTkgEL/LY3kKdNCjPmdJYipdKJBdfEL9MD32R5Itt1wdh
	shq/uBvg7VSdXH0Z606nyX3rQpsCXfGTLTKjrfBCiIDpn/7xSk1W30YOuHXGn/9sOTCqFud5vc7nu
	XkdV5han9xQkt+HR+S1ydn4Vok9dDXiIk6+WEAk1hMJ55+eRAWO6besMtYgc7qJr76xafKeAE1j1B
	fUtjWzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuRq-00000002uDe-12at;
	Sun, 28 Dec 2025 17:20:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuRn-00000002uCq-23qk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:20:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS4pQwO1940873
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8if9HSep4KFqyYKmAQvZ/xX5Za1r2V2L3CJHGopBwU=; b=VHssBGb1E3g2CJtR
	VKWjAQ/HKTlJytKJugpSLEJDbE6ZYKlW1gSd6rNy8X0T1boW8Taiy4yPmILTmSgM
	NgOYdfMkjdP3FYDPay0uCkUFG4uYrxuyBe7DvL0Or8fIK7vV/UVF85vBEjoBmS+7
	Vm9aWbF/xsoQ26hSbi/KHhqD8ZOnl+uTSAyT54ROpFYPXLbJ4zG2mfqcp+z6l8uZ
	hyXXtpdUCuJMLCHXQhVhf9DhTBHQMZOqYnh6TaiYawYYf28YxUzCcN0xAB78Xt9u
	P4OA4QuZo2D3AQQj/IDvMc2QJbgwvQMmCeig7MY1vUOf9bWUa6qWG7clQ4frGuac
	V2yt+w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87btfrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:20:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e952f153so283626625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942450; x=1767547250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8if9HSep4KFqyYKmAQvZ/xX5Za1r2V2L3CJHGopBwU=;
        b=AcMCMnwdMlOB+DT36Ub2h9xUzB/Yigy6QHsqEUwTLDZjGPzgmLBO/4PeZ4pSkD5xHi
         XJKjTdPW9W3OKA0lYbji5O+IRQxxTBIIriRQEsqNbgZhV6igKKOZq/MsLAWSK14weRIA
         L6rZv+beRL/pGiYixqsJTDfS80qf7vCwhLq8eZI7Ht+O1nNjxVsKjmMgPiu1WaLaAMBK
         VBu+7LvClvNSZsVbYWZy4iCJrpxsar4N1uTj3uB+2UuJyFSGpw7j+MPiKZWUT2vyEH8a
         u+SQjqaGrN/dOvB6JvNjTpKissO2iB3xyBUXTFpqkxF4lW77v2UFRwdWXevzoyM9sXZ5
         uZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942450; x=1767547250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8if9HSep4KFqyYKmAQvZ/xX5Za1r2V2L3CJHGopBwU=;
        b=EB2vuva0ku8qiIxljz20qFLhwJdGJY24MZ9RYkfeXWbKbvYIJe9OLVMXx9jjINjiBf
         GsdmzgQS7ltFmyPW4A5Ve4ySeMHlddPG5TKRJ1eiBMjPNyiVFWHKl6lwGDxxpRZPHgE3
         HgoSjagNMRnaJogQDoXfZkn29Ggzls+iksSRkdhPrDhX1XPveXv8CuNCUTXNFTXxk64K
         JkuZoVzG+1PG8V81a82ODcDTX4FzpHvl4EzZZHn6epAQGfTeyZAMj0okukFeGlXjo1yM
         z8u+5EMs/RkBtWcti37Trzi1/73rbWvFKZbr64wnBZsbuSeaetRD7OC+d5M6XXMR6pOx
         RTvg==
X-Forwarded-Encrypted: i=1; AJvYcCUWGpcgJOMjVQmLHeXJ7AOfkeKd2BGWHdQ0zDCYqoyKQOO8fXaFiu2vxUJu3QS5ns7GGZxXLJ//KKDdfUZgpcmj@lists.infradead.org
X-Gm-Message-State: AOJu0YzmkDZyCVaEi4j2iR3L57XJ12OEjFX1Bcyrcy0dF5pSde7dw9Sy
	/X3I6ueSVqEVQnYTdD48y7fKxbdJmiAvxiwQM7o80Xiu36YnonyHQDv1ak6GDmHvbkwfmEyDTZi
	yN9ZQKTQYm15LPUOOsai927xElTo7RNaF0h9HOpQfT8eO95ANetkq+yCm/M1LLUCxBz0WtnW7XI
	uRfw==
X-Gm-Gg: AY/fxX4mh5E31oPSxpDB6OVgP0NC2KBCPnQe7Vhjou5vt0qvWstsCmEWqZNqXxyAtAW
	A3hnVfMQsD+JZHFeF5FGubSb6zdcLequ9zUmHzqhiKM1DJllmLcvm5T1JPvHWLU3K9WcXAHWme5
	fvtjDw3wbSSn2aZ6gm3c9DuPv73hdMzf6mlo/eg/kY4ApQ/58iKR6gP4VctEo44T61qsgRLwEK/
	4YcR2qkYySwfgHGPEX4Q/hLdXkeCZpnO0+gY+DD13jzA3IV+PH6yVYxourQ/HjAbC6GZ0sInUSd
	ACKoYRV3cGAzqJu/bOn4L5HQXtU9vlvTBG+NOLXeVKIjLxjM08+1FpcxqpMYbQdESkCilfvzkpv
	uS+BAi6Wun9rjbUe+zLPSX2HYhbV/NB0B49sTEWIGhYOmXw==
X-Received: by 2002:a17:903:2f87:b0:2a1:14dd:573 with SMTP id d9443c01a7336-2a2f242471dmr294343335ad.23.1766942450132;
        Sun, 28 Dec 2025 09:20:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJXFNFNYVLwahVB8UmaoOAB8AE1cmlCTpNwikITap2yKL+62wegyFa+P6fLnKG6DDfJL4ZKA==
X-Received: by 2002:a17:903:2f87:b0:2a1:14dd:573 with SMTP id d9443c01a7336-2a2f242471dmr294342905ad.23.1766942449625;
        Sun, 28 Dec 2025 09:20:49 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:20:49 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:20 +0530
Subject: [PATCH v19 02/10] power: reset: reboot-mode: Add support for 64
 bit magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-2-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=7589;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3N1xIwX4Pcou1S+ajrSYS2TntnAa8/z9ATVQDsWsWF8=;
 b=WsHha20QS58E0wb0DuYK5RfYQtOFIQELlg2wzUhCvDyN+63iF9wTy5QRAUqxj3EVoLWYWfWEh
 AAw0K9OuYZ5AX86hRO4Li4cY0vdKBRpQi7H1IcEPlppAB0zA1+iO9Ga
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: ugID0bLGcXEG338P1haCv87CdnTzb4qx
X-Proofpoint-GUID: ugID0bLGcXEG338P1haCv87CdnTzb4qx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX68BtdxBO8ZPR
 pfgczItDRUA7Y7/kdGufxv1l6ozqkZQ/pqypXoeeesdMUqAF8KBYFi9Mz7jbljeEzU/3G+gpyGG
 cWSE/+H9yCjHnUMvNEJuxFZN6pCx/TjlrxtPWxWAJd7LQYPyWLD3aL+D9Aj5qmyfqmZGl8/wvgN
 7MYKvoIfGPswXKC091ruFQW6VKKl5pgFVzhReAXmPRgBsE3KUFuDddruSVjgER1QWhr7uFqiEMU
 LOFbz570AMm9c3KY7yfMylCqoAvvh9fH6vzqAqbsRvdGs8Vl/b+tcR1xt/mvHQ9yYqmz2jmfJam
 yJmX+0ETLtByOpa5ugfpAuoK8pV7eO90pqebSXrHmdKwWDFHdw+kQnfY0cEIymPEyBHxMkUuUpZ
 W0/wulLiHW1VBfpUPtKvnYj9F1PkmgiKslDauxQagyDXMtYT/hMeDP3OF58WFXKP6snJV3DPWqE
 KiMgIfl5TozJDTxEaqg==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=695166f2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MO_J9Aa4ypbE8kPWTcIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092051_542222_0F4CE096 
X-CRM114-Status: GOOD (  22.36  )
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
accommodate up-to two 32-bit arguments.
u64 magic
--------------------------------------------
|    Higher 32 bit  |   Lower 32 bit       |
|	 arg2	    | 	    arg1	   |
--------------------------------------------

Update current reboot-mode drivers for 64-bit magic.

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++++----
 drivers/power/reset/qcom-pon.c           |  8 +++++---
 drivers/power/reset/reboot-mode.c        | 24 ++++++++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c |  8 +++++---
 include/linux/reboot-mode.h              |  6 +++++-
 5 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..b3d21d39b0f732254c40103db1b51fb7045ce344 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -16,15 +16,17 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
-	int ret;
 	struct nvmem_reboot_mode *nvmem_rbm;
+	u32 magic_arg1;
+	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_arg1, sizeof(magic_arg1));
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..ccce1673b2ec47d02524edd44811d4f528c243e8 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,19 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
+	u32 magic_arg1;
 	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic_arg1 << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 3af6bc16a76daee686e8110b74e71b0e62b13ef8..1e85f2c052c916e153c7c9ac0b184c91d7153402 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -18,12 +18,11 @@
 
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
@@ -55,7 +54,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -78,7 +77,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic_arg1;
+	u32 magic_arg2;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -87,10 +87,13 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (of_property_read_u32(np, prop->name, &magic)) {
+		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
 			pr_err("reboot mode %s without magic number\n", prop->name);
 			continue;
 		}
+		/* Default magic_arg2 to zero */
+		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
+			magic_arg2 = 0;
 
 		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
@@ -98,6 +101,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
+		/**
+		 * Format of u64 magic
+		 *-------------------------------------------
+		 *|    Higher 32 bit  |   Lower 32 bit      |
+		 *|        arg2       |       arg1          |
+		 *-------------------------------------------
+		 */
+		info->magic = FIELD_PREP(GENMASK_ULL(63, 32), magic_arg2) |
+			      FIELD_PREP(GENMASK_ULL(31, 0), magic_arg1);
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..eb7fc5b7d6a7ed8a833d4920991c4c40b5b13ca7 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,18 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
+	u32 magic_arg1;
 	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic_arg1);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..a359dc0c6dede0ac5ce67190a00d46a7e7856707 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,14 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


