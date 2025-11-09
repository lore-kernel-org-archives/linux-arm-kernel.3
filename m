Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89D2CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo7LT6euvRJruZtdgnGKAy39fSD8X4XwSTTfUk+1bv0=; b=u/gg8WqneXSWmZ396rURrHuYTz
	apSo0ZCiMSHlOvFBjlp6MgKLHJU6pxwyr1gpdV8ipjNAW5EUxvC/NqyWBeOibpzW09x1uu2WYuMnn
	uCTOM505zLyhJcqf2fKaoRDRMCpI0LG5UTIgs0a5tdC6PQ2QAAFa4m7nPRcaE8tWJqF1fBJ4Dh94N
	Hcaqk5uE3fGJDJE+clfLorC2h0uFgODK8K31gWFBENPewcL1W9vZmxOJwkn4PVt2/Nv/Tw7/87D0K
	xkDt/sERNivs6CnWA1I/sHxLsb8YZPkwoRQ2ZJ1L5Fjlh9FtsEyLTgXPrbXfMBMENKTiNEOL9MJcJ
	zSsmykjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Yj-000000044rL-3dor;
	Sun, 09 Nov 2025 14:38:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Yh-000000044qL-2hd0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:38:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9APrn6370563
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uo7LT6euvRJruZtdgnGKAy39fSD8X4XwSTTfUk+1bv0=; b=hK7Y9mgwVQzAX85U
	htBJKQO4Xl+Ik2DPsS/62bLQLCpinBmOMA0olTpoJHBT98/mpzhRX7iXO+bP+be5
	RLi7KiUyf06rka11Oc5a1H7xn4mrHdocQgbCtZ0RML03reAV2bSQI7GFhwFrcLat
	7mwZK83txokPi+WOCLM2nFP2N3EtyUBzCKKul0BKbpCMWWdmxMKcIkqTyzU8KHZr
	L8TucMeJEVCz0NyH7g5XSGnMo1ejR1hs1pQwglrhNYXs99Ghay7isbinaZmK6ZPr
	XQaWZr4uiv0XGUoBTuRhxmUS7nKraVgNuEtfg3gsQ0fStAI8kFe88v71CBoaEWlQ
	ZpV3hA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xuej7u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:38:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340d3b1baafso4033760a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699101; x=1763303901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uo7LT6euvRJruZtdgnGKAy39fSD8X4XwSTTfUk+1bv0=;
        b=drZMQP84sVnPR4IgLtbtEJIwIECvLlsqTsbu9F1C2Vfp7h0KWivQYvDKNirIUHetLJ
         kDOcjyonmVf2lofmDVAjaL9FvMt14qw34n8D5NzM9gZw51ZoyTFmhr7KuOElDQ0tgylX
         Y2i09hViBcbEYWmyy+u0jte7TUhkraa5CobppeRKb1iXIYvUbWL8v96UFoie/jV1J5xb
         VXWn6UlKQMtKDTgCnbJvshKdU0BpnHpcMb+Md7LWzSi7s0YU50ie14grFVB+KdSDVKPR
         6cOuf35c7yCmXyrSggJh0nKAz+qXW4kfBnqO5IT+e/d85lkbS6Kx5KzPbf7NKekCRYax
         Z5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699101; x=1763303901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uo7LT6euvRJruZtdgnGKAy39fSD8X4XwSTTfUk+1bv0=;
        b=eiOecUctXLLnuX7xdHj2lsbLv5TengQRliX1F4Wx2F8fWOHf12gBcTPVy84BqF0pym
         XHRwTMLR2ZCMA8EVUGRm8JPr07gTt+Xw2zW3Gz7DOFHJcs7jqK8zMrhfL6Sg2rawvk0m
         vAWPekqyJ9p2ZZHXW3oYZjStrgkFIKZGlv2Mh3iN7AJn66nLIr5K1Vu5NTqM9he6bZLt
         gEFf2Fme0K0YmPqLO0aqh/34xbkJgApsTSOLU37qJVm992w5252l4pvdzkWzBELA/Ata
         cxgIs3YFGQEfOywG/XPd29nYj99vFhacXU5gFKcsK4Duu02w6xaEdrDdCKaACRgGuTNy
         yj0A==
X-Forwarded-Encrypted: i=1; AJvYcCXp/TAeENYEf9n02Gx8ddS+Y18bH4cffYqx+EWSYKRb3BEmf6TtDic+W3cjBswBMcETRy721vdBIkNVbOZWiBUP@lists.infradead.org
X-Gm-Message-State: AOJu0YwOL7x8hZafeHEBjmwHNJlaUxWvFqOgE9yQUljEuHsmuJ7xeLKz
	s8keo42CWzUPLSuQ6USUgN6nt8vavuIIDWB45fs1Xezq/rT+37gOyE7nZp2ea4YzhMi9cew9Nys
	mevZPJAc+W3sJ7E6grlChNkgY0nWn5JrY9Lt5wf4lJCScXFQTTT8NIgwll3irHpdLirbiY8N6KF
	Jg1g==
X-Gm-Gg: ASbGncs5lONxhEJbJxNtbyCX17VamVF8SF7pj1hcKtnEatpW/OGmA2qZHnEBJkH7zpH
	i4lTNZTzV/dBFIeDhQDB5MqcTNsQnyPxkEUe7jNjFTiDm4betwNqqoIYgA4cbmPEFBIAwXGimM3
	V8as1D23op71ZQBGQZAoIRPYZUHdtCs8uAIl/1PsTNGAbmX/kyTK/8KdD1NZRbeqwQXGRsFUTQQ
	lb7Lz8nWta9QgHPNrJBgJTzq/LHMN11fRcroaaqUoX1ZnsYsLIOf6u40MGursDRwpdZy360qTab
	ePNc1stGvAQyGwJ6GVANtVus2bs2a/29Mbyhu7D1PIrvjcroClH8wpHxZsI0KXJPFaytETVF1M2
	rTZWR5wkJwcJUnYS1bOtKtfYoBJ8Mq8+tEdQ=
X-Received: by 2002:a17:90b:3811:b0:340:29ce:f7fa with SMTP id 98e67ed59e1d1-3436cb7ae1emr7571917a91.7.1762699101144;
        Sun, 09 Nov 2025 06:38:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGnivRRM8Xz3flnELsFAmipMGOzqr6JvqifyyUie4y1Y4jWQDfWv+NfIOTqq8B3YWWPWAf5Q==
X-Received: by 2002:a17:90b:3811:b0:340:29ce:f7fa with SMTP id 98e67ed59e1d1-3436cb7ae1emr7571881a91.7.1762699100638;
        Sun, 09 Nov 2025 06:38:20 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:20 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:15 +0530
Subject: [PATCH v17 02/12] power: reset: reboot-mode: Add firmware node
 based registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-2-46e085bca4cc@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=3351;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=4y05tl5JnFA8b6YlLDdx12ZxapyYnXQ2xFk7Mn0seVs=;
 b=vs3wqeUOLeic+1W7I0EI8aB6oJC74eGyyuuemjAP54LQwPmCWoLH5jWQiO+mDhZeRaIXg4SCi
 FrddfqAJhKSDh6WdKIQCfUpid1SYartnJ4tBNv3Sl8dK0paFII8Fg1Z
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX8xbJBsGXKyaW
 lVuGWaUmyNOo0m2fvqg/aRHSTW3N51V5/9OnMLRhjfQ3w8EAVdtv0LvGY0znR68E715q6ddDIVR
 JTDS4tSMulcYS/RAYlBd56L3CRuw0mMWKX1PYPAIKWuHkeJSB30JLy8IHpZqqlYFjVpH9x909G5
 NMAqVyjgRP+oGLxNK6HXodkG2UK3T+H6g+ZvRaQxqP5qTpWPdxKCrePdfxVe1pc0u7nmQId33Fg
 YMQxD1Xsn4UDOfLOXvzhfTJJJurhHJMYtDAhwWyNrJx/MO4amSO2FPwEwNrKEMioPA0IZPZMtt2
 l9WlhDypwMd47/UZqeRSGywmzW6PtvSxlV2B4Uk4XnOu0y3EiAhKSFH4xmcTWIYg+P/iKUDtKNy
 nJAJCjaPKSBwkvuEVObrXWbDDwKgdA==
X-Proofpoint-GUID: HE-Ny1wMvSCj6lTbw1D5jt3A3tNl8miu
X-Proofpoint-ORIG-GUID: HE-Ny1wMvSCj6lTbw1D5jt3A3tNl8miu
X-Authority-Analysis: v=2.4 cv=BOK+bVQG c=1 sm=1 tr=0 ts=6910a75e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yMQn7kocbCrLHgxSFm0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063823_925493_FEF4032E 
X-CRM114-Status: GOOD (  20.59  )
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

The reboot-mode driver does not have a strict requirement for
device-based registration. It primarily uses the device's of_node
to read mode-<cmd> properties.

Remove the dependency on struct device and introduce support for
firmware node (fwnode) based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 19 ++++++++++++++++---
 include/linux/reboot-mode.h       |  4 +++-
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index ac4223794083f36960b2bd37a601b7e1f1872de5..eff60d6e04df2cb84ba59d38512654336f272f8a 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -8,10 +8,12 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
+#include <linux/slab.h>
 
 #define PREFIX "mode-"
 
@@ -67,18 +69,26 @@ static int reboot_mode_notify(struct notifier_block *this,
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
+ * @fwnode: Firmware node with reboot-mode configuration
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
 {
 	struct mode_info *info;
 	struct mode_info *next;
+	struct device_node *np;
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	if (!fwnode)
+		return -EINVAL;
+
+	np = to_of_node(fwnode);
+	if (!np)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
@@ -168,11 +178,14 @@ int devm_reboot_mode_register(struct device *dev,
 	struct reboot_mode_driver **dr;
 	int rc;
 
+	if (!reboot->dev || !reboot->dev->of_node)
+		return -EINVAL;
+
 	dr = devres_alloc(devm_reboot_mode_release, sizeof(*dr), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..22f707ade4ba93592823ea8718d467dbfc5ffd7c 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,6 +2,8 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/fwnode.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
@@ -9,7 +11,7 @@ struct reboot_mode_driver {
 	struct notifier_block reboot_notifier;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


