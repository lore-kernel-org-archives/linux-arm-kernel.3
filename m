Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D847CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiNDMgJ1PRczoI1657/zd47IielAoH6hCTaVhiNKpyE=; b=AZ92pS4ba9kPAqiewQJf+Rc2G3
	eynSBZHW/rxHMhGHWLnAaeOhr982Ucbi2vxo3dV7wrv3c6CzgygSoL7MyIVhNFsqWhP9DW2etZRw7
	usrlnG+2euvGwVCp3V4YuKf7cqP0WpJyGpZk7uLm4yAp0o1orS8D9J43NAYsWCJ+ISugvUPQJtjFS
	XVM7P9kxbM3LPFhQt0ov0CRKSoRzQ2XJS5fpopE3MOCmgod06k2+Mb8sUq2nNulFdc9bYXKMtMeKy
	Tdgs+PnB0+F+1FxkSFvXJ5JYIJ95x5IzvnrvvgV1lH6J6WsATf8fY/qPfdkRyygIGUbFnJ2Cyrxf+
	SmuplWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Ya-000000044p0-43Dm;
	Sun, 09 Nov 2025 14:38:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6YY-000000044oW-1WF6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:38:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A96cQSc3929902
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiNDMgJ1PRczoI1657/zd47IielAoH6hCTaVhiNKpyE=; b=HIoQb7UjY9q077NI
	kVl2CpnPnEJvwugYDSyD0BYY7Ki1Ddbt4V2S12+fnDUy7cDXHr5lEwCKvV8sfzI4
	UGzOvjxgkrxhEUwljXiwKmposcK1U9CsT3eDZA48WD9edb5d24OEq03Qy3iKMW/l
	gm0pZPVbVktoSzG9zqMu1MEuAM/FnB5PduxO6LdBsEO/sSKBZO6gkjsIglsAlUl7
	ucvhr1MhO+1vPJlKDrGpgkph5Id5Xk3qpn0TgRkyaMaOmdXOHOuBCrhDfDG8nNrR
	bDGsRSZXq0NYbxd/hjscqlwJHKiOraj4NgN6QLnWQ9jauzBQkncuaBsVC+vb00o/
	irn1fg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw5a73a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:38:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340299cc2ecso2896728a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699093; x=1763303893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiNDMgJ1PRczoI1657/zd47IielAoH6hCTaVhiNKpyE=;
        b=AjBI5pqb5gG3liul3wCJvF/sG5hN+yRqx60HG7oZ+1oybn8r+wvkERTar0i2DMZAfy
         H+5ZQHhgUzBr2D2tATf7ln8Qf36mYBK8qGkzHGvGfWn1evou1c+OEcDww64PPBJbI+gn
         352R7tA6GrBB7C/MFK/T6rxYZBdT+X2oloHUZdA5z2Xn9TmhNmma/+NbTKl/KLT8O0AS
         MvqihJHzCeahLjPpRkHR22AtT8bAJI6ATBpjy8agZ2xAhMy9ogF8I6spRz2VXh8s7oO0
         V9LcqfwyL2oj0pQ0H6E9bHunmBGW/DMXj3CcQfbCF0u2VVAa4BqUI4/UqicfbuIPQZqa
         vy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699093; x=1763303893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jiNDMgJ1PRczoI1657/zd47IielAoH6hCTaVhiNKpyE=;
        b=sZGCfbXFld8d9aG3hxZ7v6FiEW7ujqwWOR52s9ZkDE5kXIb/m1pY6z159RXf5ROiY+
         3OEOUZUJapHx4Gi6xwi4L8P+cjKSZtH2YSw3mEhhxrLseWRwqDHrA66budeYiTkflQg6
         AYzACGPE3C4dIWxVpYBScTL6nankhTK+LPsENTPJmFdnD42crychFgFbaqPm0Qe/HehF
         56jH45lpyQ5Ab8RaTQDAXNwYmpQ1KXMinEMADmbxlg367avU/F6bRq9aZfs0TujeK/hE
         o01WmGc3SiRpu6eqba/NT6DKKIjEdw5w7shByTiCwR/zMO1x1iLTkXBGT1A/j6cFEjdr
         1yaA==
X-Forwarded-Encrypted: i=1; AJvYcCUTKwbVPjUxLwyczRmrQ1eF6XFi7Qp6C4FCjo021GIl/iwLR+7KNoNyobNnW1VLxDcP9wIwby+z+G/d13lTx1QE@lists.infradead.org
X-Gm-Message-State: AOJu0YyDPfpYbEuqzzRJPEx23TfM3jB6wooPUv/uXLs+mH9DxEmsbgf3
	BAevjg9IUGndi6Q2/6ssFvGdPFBrwDf3XGPgtX0k6lgIHQQLK7i1BGRDjJEJLWOF5Qqk7SYxUNd
	i61sEExLAb2Q2UCQhcHB4JWNxiW/W3pFbfxxRTQan/34XLq1kPlkep5OzI+1g6MuxhkqRmTax/O
	nqcQ==
X-Gm-Gg: ASbGncso5n4/Li7oQZtjMJs2TNF8L2arrsSH38NpM5GEQlwv8O0BytjHsHTKuA3A4nm
	zXDt0tKY5H2IWYPXDBthn2Nm3kI8YQM8cGWKB9LtURMU6ZU/qUDLTq3vnQVmK5i+WJHV0VGY6bG
	Y1wtU5JqaQCPcJECDUkTVE9sMFn5NEJiQOSkZg5cUPdyeftyB59BbzN7mFvNQ+VwTcq+bHymcfP
	2DsKU4cjiKnOJu1dr4n53AlA3b1jJlnzO3JpgNRq3KDRsz+GxWY+Q46gB8cyWVEFv0otmzkr7iD
	V6YWf7HW2d6CSgyY5mEOGZfGbXbRuSEmW4tPJHSLUS3amkA0flHbBPpB9iIcVG7PNuhRZRIudRK
	Um+7eBJAc4cx6cNu3pmsTTgVzDcIO2V897jA=
X-Received: by 2002:a17:90b:2e50:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-3436acc10b1mr6325887a91.15.1762699092548;
        Sun, 09 Nov 2025 06:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsz33mCu2I9XufPajBf7LFsiT4u4peJwvXKj1MW+NqngdPeP21HWE8OBRYf1Aie7N1TK+YOA==
X-Received: by 2002:a17:90b:2e50:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-3436acc10b1mr6325873a91.15.1762699092004;
        Sun, 09 Nov 2025 06:38:12 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:11 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:14 +0530
Subject: [PATCH v17 01/12] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=3273;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tSD2yNZaJDc5m1jdDRoQ2dA6oSVGR8ZTHjS4GRBmNcg=;
 b=bUjyq9xpjS9KUiS6+Nw78zrsSxHqaWYFJL0jGHwwWaOkVhD0IIgjEAY5Z0HoEPo/CcR3Xz4oA
 IulwmmBv4T4A9e0Vrji+SnFgsZO+5ByFEtY5OaqNKYLzIpwTq8pESLl
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 6BqlCJY5J5LHnXrdXfFKjGx8m4IfAu2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfXyhTxqoMquNXX
 yrZR+XGvRa+z6ckEzPTxhd46YpjrHpW4x+QnG74Rd997aSzyO8NXnmB0tHb0XhEA16pUFn/FGlt
 6BgiGSKwlypimXbQycS3AeXr+p0T5lJeWbL+k+AlO1p6yHFP6JOZmYxskTxpEW7bia1JKFEoYzb
 1qG0LbrhOewsfnzXFCAbk9T4old7Ic9pyOUjjfFOX0WBwJruPTO1BEx/xCKdehU8ISwoSjnfLoJ
 /WLK0hAAHoiUbTcJ/168+7gN7r0JFKMLOcYAyaTRD7/n9FFywfsguxWeVjJmuUK2eagwCQINZd3
 azgnLiHciQr4QE5Sjv7w3vhupVuAzu1BH6NoJq44kkjFy2fsiLSfXWcHfsO31JWq8/biF2SnFaN
 cHeNbO3exLCIphxmZE4sT9ZDRYO93g==
X-Proofpoint-GUID: 6BqlCJY5J5LHnXrdXfFKjGx8m4IfAu2F
X-Authority-Analysis: v=2.4 cv=FoQIPmrq c=1 sm=1 tr=0 ts=6910a755 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wx_w4_m59dWKJ5at3RkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063814_416339_7173608C 
X-CRM114-Status: GOOD (  18.08  )
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

Devres APIs are intended for use in drivers, and they should be
avoided in shared subsystem code which is being used by multiple
drivers. Avoid using devres based allocations in the reboot-mode
subsystem and manually free the resources.

Replace devm_kzalloc with kzalloc and handle memory cleanup
explicitly.

Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..ac4223794083f36960b2bd37a601b7e1f1872de5 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -71,6 +73,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
@@ -82,29 +85,27 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
 		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
+			pr_err("reboot mode %s without magic number\n", info->mode);
+			kfree(info);
 			continue;
 		}
 
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
-			goto error;
+			goto err_info;
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
-			goto error;
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
+			goto err_info;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
@@ -115,9 +116,14 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	return 0;
 
+err_info:
+	kfree(info);
 error:
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return ret;
 }
@@ -130,11 +136,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

-- 
2.34.1


