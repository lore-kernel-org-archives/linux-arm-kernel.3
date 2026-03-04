Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B9EFCE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnqEHP+yGGninOeiIPQlRgRIHub8vI+/1VIN6MsbMTM=; b=J+BeFUP3t5vtYALEyqu4PFgs9D
	dmywV6yi31GpfA3bVoI1SY//AvY1X1MuGtOjiqX6ZHshKSRx7Hj0gbFnuKni0lLNz46q4fgPYysvq
	Zkn7Go3vVhZXH3QzCc+rV2TVwRmaVK+SNzrA++4dGkg7DwMBp9wBuA+RDVOioG1lWFTtdKYnD7vk6
	mWeLhjOvsGLPIfa5U/qwCn55nqvzQOkc7SJbRVbjCOTw7frZWkj+uUyq7LPq7UGH76V9roY9+lIpG
	ez1xqQ29fOetLyAZ5c8OzIdmaoeBIsEitZwGkNVX9A/QbrmgLbmEuY2RQU4Kg/taXcmA/WnbItHxJ
	QaOtcKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZn-00000000HyD-0InD;
	Wed, 04 Mar 2026 18:04:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZl-00000000Hx4-0grB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 18:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OnqEHP+yGGninOeiIPQlRgRIHub8vI+/1VIN6MsbMTM=; b=qQpHZpQz7aUL1xX+YOe/MmHh8h
	Nw4Jz28IZ5v//m/bds3fVVzZEIqsD9M9R4a+Nrpl+2QykKikvn7EMJoljbfyoAg723RcurJCaDMfA
	Ie7YCzRTRFatOBGQ5fCUjHszur6YJGFLf8+BgXndQF0zjoAQIQdeZiQDU816ojnYJIZQlgxDHNeKI
	Kl6pM9KHUFdQFN4Hh1ZvieM2n+6srjiw4yJeEipdJuku345Jv1hMcsoPqhSf54X3M+fqRG8T9P5gl
	kI2jjYe61ksm9m8x/xkn0NWYHmIpXECySZxINvk3eN0RzIp/2n+AfGZ/P/lpmW7xHHTKJJ+wlRgPf
	Q5OQULyQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZh-00000005I1r-3WvN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:03:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHBlS3837928
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OnqEHP+yGGninOeiIPQlRgRIHub8vI+/1VIN6MsbMTM=; b=XflvQ8OpLxjrfHDE
	e3DZYCDnHBv1EdOWxwvBzR79D3PvjiyLm0eEfvPpV7B/t0Eli7QXzIw4s5cA9RBF
	IQz2lZKJRbMqkORMJz3f1xftDJ2E4Ki2MJrYUcbbDydMe4ipKkwKpai4orqXOlpe
	4PVLUdwjtBNfDcgJxFUxJ6gpGdKsccp2RH9ajiMyk3rNzyCfkPFiEUGiM287xJWi
	HbcBYx5CKfxcwdSrHk90Ov6a1m29Blfm+DZr78dULH5AbYnbgKFSjQQI9bmP6KqS
	zsYbuCoQQdp8//lWMT7HyFlTlTuTpY257TAxjE/7wMInhBcOPZWxjAIqyRnaeQX5
	+AuLKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m04q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:03:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-359918118ebso8786206a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647433; x=1773252233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnqEHP+yGGninOeiIPQlRgRIHub8vI+/1VIN6MsbMTM=;
        b=YHF85tR49KykMR2eRZ4qs3DteJ6E4WM+QoTyL/4yRpvssoJPzr7mfFQmb5GxMhyna+
         Xlilanonz5runGiMpqOWH7JujZLpYQc5j7fvm47sfLu+Ty/q6W45zHOoKtrDf3DjIrdk
         TmyOiUAazL+jcnJzmZiART+mmLLYnygy68UtE9aKsbUaOUQiK3cKMOiLtMGTnZaxE1M8
         RQWYAXSAVOkkFweuARpIudS8FsxGAxZweuBlVSYLPTLSEO11Cm0ZwhH2PRD7uYErwnbN
         y6kiQRNqBxdcGp/anoSe0+YNd6b5gsOdXY9m2p/ZfdPtF6wOjtD+uRsZYDCS9CNPLe38
         5lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647433; x=1773252233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OnqEHP+yGGninOeiIPQlRgRIHub8vI+/1VIN6MsbMTM=;
        b=JS+P7wZHNUYlwmFS4CkqNfguB+5eZBzAQlP7iPnZAti3H97a+FNcNQh3xWTczyIRhG
         sPS9VmHJ2kSinVfuLXLKuo9rJjOqsS/xXwr380rJA3uUXqZdadOzF+1abxHBbJcNkmRc
         ENPaxob9NAYs1zeJuzQ16wcmtBfCMveohHUcJClwPTPJPCkcwKm8Ru5oSiDvBMEpkYdC
         mDbfZE8GYAspIaeE/VnUdhZrotysydMChIDmBvDrvbCgeZHmQwq0YpYB91YilnmXMsfm
         rnR5gIfRrvEeWWAIepEq8hQpgHNk6DJ2Sx+ww/RF2u/ZUxelIWvBVVPF5P/bzR+xyaxj
         noCw==
X-Forwarded-Encrypted: i=1; AJvYcCUzwkGvyvktPjVStf7rUmSI4jJUoFtblqSr27PsRtKPEI5lipq3yj+4ojgUgIt7wBLf5hsBfyyAu1BnjIdNfYDE@lists.infradead.org
X-Gm-Message-State: AOJu0YxVSOQI7mOK5/BuWC4shFcAf/BsfyjmtNbn7Io46ADybAG3LRg3
	S/cRynNEUfkfuK29mZaTKoE+Stim5C56+EAiRMTSWBzcVy7Xql1A+65ZHlWcFfWvelI6edx7ZMK
	dJRcLDdXsSm4UITLSC7uF0M8i8L03/ByLjNybUVD0XqSFEUI2Z1LI3zfYa+RJtaMBapy2Q08PVB
	qnyQ==
X-Gm-Gg: ATEYQzycbEaKIhmQ2hvtui/CPNV/HLl3B/uNdx6vCN/7fsw3WvVSf6JdK7bTbtHGL8N
	CfBK6AZ/yvPx8lzvQDjwli2y7TEJmV57Stz+o5dbp2FBT6ztR9ZtA4nwVrKLHF9yf6wrhNBke10
	GHwiRPNr0jIGob4m5ZiiL7rLjpJe9d+5Wb0Ea1hBjkPzcnTpf9bACH2TMQr6GWwa/cDvTWvoD9H
	SlaSJcmySoSW4iSs0Rnn5sQ1cpCIX33KCVAh6capDzzzZ3zwVqIYUmoWlWTMw9zIMUKKmhaOCF6
	b1zuDlGs3BRSv8RqaVRcvGHxjaQ7pJlj3Kh8FwpuldFDAVydfnOGJkpDKX476XvFrHEQKDp3Owq
	odxFoOmK72AP20djcJYytpA63g60pspJrjKPx7ga/6zqiJt1a/MPBAO+A1g==
X-Received: by 2002:a17:90b:3fcc:b0:359:8d95:4a4f with SMTP id 98e67ed59e1d1-359a6a92272mr2248858a91.32.1772647432957;
        Wed, 04 Mar 2026 10:03:52 -0800 (PST)
X-Received: by 2002:a17:90b:3fcc:b0:359:8d95:4a4f with SMTP id 98e67ed59e1d1-359a6a92272mr2248813a91.32.1772647432343;
        Wed, 04 Mar 2026 10:03:52 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:03:51 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:03 +0530
Subject: [PATCH v20 03/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-3-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=5777;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ppOwiZTyFwlfDH5FcjIV48AYYNX/eY4c7Ah69UnX22I=;
 b=UK+o0a464RE0NcYd20AKEXW3fuiIRJKZKzPHnn3vsW/wNnqvFROEKIGq4O1lR9YFR5Ypvgsv8
 bbnR0T/8gqSBANw+nV1dGkeCQ5BlLIiILnarbjQNO+rbyIscetXhEiG
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a87409 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iyrUps-_NMxi75ASTaIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Wyox65gw4hbJp-tk7HAbZ1rIxsNiY77-
X-Proofpoint-GUID: Wyox65gw4hbJp-tk7HAbZ1rIxsNiY77-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX6MkcJ4/3jXQj
 Z2pIFBAI2ETc9uW3cbasETDnbh50412dwBxTIZInknhoWmEHgrRfVNGJnAC4cjXL6aPwX71Y+s3
 GiZZ1+fxR0eoQSGDXIw4/1GIwEkScDNMLSZrR1We/FgBeIOGAcpYmXEMeemh45cmnUDUbslcilr
 GB1Y+rECxpJ0aIMme66b/ldUHXF0Mj13DSnRife50k0EHUr8biwrsmORBNi5/ROP0bQtsbgE36I
 sqND1qJAYkoYSeF2ip9FJ1OmewfcVdyx3nERLKbjS9Wbmbo137XcpVp6ZdljTFqsinIh3Tz+4Yy
 VEkajP2w2jWbR9n2VOporb7euDj0mmfTMTBDxFvWYC/eLGEsXuHT2nVHRInz72KFGZ2a3YM6+u1
 Df443OcIQ2dj9LlqVYyIlm/fOb3uYUf3IqT1h3YjbiLN5H7mK1T0Hx3nEY+NBxXQ/tBnnjx576t
 40+BjwbhQj5b3XnTsnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180358_308740_99F9A415 
X-CRM114-Status: GOOD (  25.58  )
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

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Introduce a list for predefined modes in the reboot-mode framework and
process the predefined reboot-modes along with the device-tree defined
reboot-modes. Modify existing reboot-mode based drivers to initialize
the predefined list-head as empty.

This patch enables a reboot mode driver to define reboot-modes through a
predefined static list, in addition to the device-tree based reboot-modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  1 +
 drivers/power/reset/qcom-pon.c           |  1 +
 drivers/power/reset/reboot-mode.c        | 28 ++++++++++++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c |  1 +
 include/linux/reboot-mode.h              |  9 +++++++++
 5 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index bd05d660490c686b43134f82f1eadd7665403d20..83a8d80fd7d1ccb1b736aee5f2d675246a63b8f8 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -53,6 +53,7 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 
 	nvmem_rbm->reboot.dev = &pdev->dev;
 	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	INIT_LIST_HEAD(&nvmem_rbm->reboot.predefined_modes);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 57b36e6186f80aff947fd7f5aae5ce280c65dc6b..9d0e3fc621a6173438c6da4cce38394199451881 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -73,6 +73,7 @@ static int qcom_pon_probe(struct platform_device *pdev)
 		pon->reboot_mode.dev = &pdev->dev;
 		pon->reason_shift = reason_shift;
 		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
+		INIT_LIST_HEAD(&pon->reboot_mode.predefined_modes);
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index f5ab6eab210bcd9670441a4d2a301d9efdf2f322..a0cd463cad42cc08c55a9d1cc11174b513995104 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -17,12 +17,6 @@
 
 #define PREFIX "mode-"
 
-struct mode_info {
-	const char *mode;
-	u64 magic;
-	struct list_head list;
-};
-
 static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -73,6 +67,7 @@ static int reboot_mode_notify(struct notifier_block *this,
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
+	struct mode_info *info_predef;
 	struct mode_info *info;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
@@ -82,6 +77,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
@@ -115,6 +113,24 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		list_add_tail(&info->list, &reboot->head);
 	}
 
+predefined_modes:
+	list_for_each_entry(info_predef, &reboot->predefined_modes, list) {
+		info = kzalloc_obj(*info, GFP_KERNEL);
+		if (!info) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		info->mode = kstrdup_const(info_predef->mode, GFP_KERNEL);
+		if (!info->mode) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		info->magic = info_predef->magic;
+		list_add_tail(&info->list, &reboot->head);
+	}
+
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index 9f4b18c5e46f6a8bf197773ceceb80b250f57541..0218b71541a0cefe1534e306f956ae51ea9ee870 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -48,6 +48,7 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	syscon_rbm->reboot.dev = &pdev->dev;
 	syscon_rbm->reboot.write = syscon_reboot_mode_write;
 	syscon_rbm->mask = 0xffffffff;
+	INIT_LIST_HEAD(&syscon_rbm->reboot.predefined_modes);
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(syscon_rbm->map))
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 2ce189fdfff4b396d7cc6f175b30016781ae4fe9..f07696f9439063a04fc180e953114ea09475805c 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,6 +4,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 
 /* Construct 64-bit reboot magic: arg2 in upper 32 bits, arg1 in lower 32 */
@@ -15,9 +16,17 @@
 /* Get 32 bit arg2 from 64 bit magic */
 #define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
 
+struct mode_info {
+	const char *mode;
+	u64 magic;
+	struct list_head list;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, a reboot-mode-driver may populate. */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1


