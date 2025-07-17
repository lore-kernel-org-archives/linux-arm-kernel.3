Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5442DC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndnZbAUz6f28J4I6Xb/FkBP9eQc/v/Yc+2hDDgd7eLk=; b=UtTC7rxoFnDSataoHJZldDbaH3
	i6SC+YY015CO1KZEfbg1UhkG555crn1FYAUhJGyl7BbQ7lt/Cf0eAaT8pLjlHAF9qNVYjyFzJnKXw
	5T4rIj00ykh1NK1W6PecvNLBCO/iSIPSQZZ8A83Nu117G/d+WyEtOY8Nqn6hz6S/kDqT2BrRpFWNI
	L5ZhHCFRRgm7eNL41xez6kGDRLaezeiAdfb7/+ujrsm3VtY+57v8q4lTGZrQkjn2HkBnnAh/HR6pF
	eoO+IY+6+R1NcDqgVKDnKAtaVp1WoajM9btUq6KxIzgveYNWqzHcDJ8ypDQV7JxRzcoprLlIBPsKi
	CUaceDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPxt-0000000AQS1-1QKN;
	Thu, 17 Jul 2025 14:52:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO1p-0000000A9tY-3cNy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:48:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HC7OLX028078
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndnZbAUz6f28J4I6Xb/FkBP9eQc/v/Yc+2hDDgd7eLk=; b=UdTlnJxzXyItwjsM
	HeZi32sOlahKgZBb9tJZVIRjfiOFIz1VNZ8ttWBW9VcGKE/XmzVVana5CTMWGWaG
	p7P0rVczeTUEUU8exs+I6bDUfHRrOcYek8Zey188XSZAFN6zmvbQm+iRyB4/2A5r
	qaACCc0FR84ZeG4oBLp6wWeYX6kfeqEXFrNEdAGP7T5Xav8JENrJqXakRA+xBB9n
	ZCkosJUtJhQ+ps8fKvu12Kbnc1eh1rGWAkkDpIwBXtGpx4ZEdW+R24FUJJPRKfE8
	fvVdeA2Iwu+XWzLBscgW2j5SM+YkV6HkvH/RFvtPk5Uq7jMWIXzL4EhTun+saBgl
	zG4LXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5ywf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313f8835f29so1399864a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756480; x=1753361280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndnZbAUz6f28J4I6Xb/FkBP9eQc/v/Yc+2hDDgd7eLk=;
        b=fHh3WsFRf8GkAS1xzCkU6OSCRsICW+fXFqSVF+7T5c2qmyXSLkbNRwAgapMCXKzsX7
         JTz+vZ/kytuAM6uXYYufIHQang4NOL6a58uPJrTO4Z8yvTzukvpN5F1vsWDY8gGUJGUN
         eu0Z7Pjpzc6oKDohNIERi0B39PJCtKcShqMfwIM8/ZVqupwEe3m/+nNwjxOzDiJ0104N
         vGePyyfzgu79aAOrsdlPumh5HulZGOS8y4D7Bt+QzxI1Kk0EYx+inecl2H3Bx4S2BIgn
         0b/MoMXoOLX8bRerdgAkZkIWvXgf0bLR8vf0TQLr1m6vqFiXLPxeQ5oMjKzJSl0YGhij
         Zdyw==
X-Forwarded-Encrypted: i=1; AJvYcCUCv+pejX+99zp6pS+I+LI3JWA1nEOly8+YwnGfyzzMtphtyyAIinj1l9reStDb4w4Dyy8+1Hj5m9+5K2Ix963p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzoy7njXD2cjO0PP+gIVpnqRmPfu1AWXYomwfzghHzRyJNR8Sif
	Vsq+GOPRM5k+d+3OxSVOLXg7X5roX+nV/E4fh9kwGp+i49Xkp4HCMdSvbaZ/JEuOd9LQEGm5wnA
	8/Px01nl3O3fAkhPZ2Q2U9hJ/0RRwWte223rTKPCmz3GvrYu/3ICKHsZce/VpgnHVcFEj54x2vn
	tCYQ==
X-Gm-Gg: ASbGncv5EJOs9U3i6iITCPNvOngRBGzNNtDUDr4OFhTiGVnusIqXOTg8pZ4D55DZgHs
	YkaOCPiKNUpEJhYmqbbnQ8FuvkgBoZHaGThkOmVvKN8yaQDJzD8mUh+ZuuAKjCFgB0bjLawBJfW
	kctaDjYd6Wnp5aesL9X4hSvObmNnCjGtp8hjix/mgzXKbYfE9UBqxgBmqTqFouq3hGbEo2rBygG
	Vux6C2oYhB1A+ZBOz0QpxtSRpYgTyvysIRYFj2au6xQm7hdGwbXkSmBlJkCefixXeui3hyh4x8m
	C/ni2GDlLrDj3yd7OFvq1X46iN7yMnZt7mFLk060RMo1J5sEKVMpiowNQew/HLzPbrJyqgyyDD6
	l
X-Received: by 2002:a17:90b:270b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-31c9f47ce74mr8791555a91.29.1752756480035;
        Thu, 17 Jul 2025 05:48:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSOTf6eWDU0ft+hKrp8ihh0WiXr7hyJaFtJBeCdXFKJ8P8KRZZCoFlpcTtg4Y4L60jS9UJvA==
X-Received: by 2002:a17:90b:270b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-31c9f47ce74mr8791502a91.29.1752756479474;
        Thu, 17 Jul 2025 05:47:59 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:47:59 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:48 +0530
Subject: [PATCH v11 2/8] power: reset: reboot-mode: Add support for 64 bit
 magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=7499;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=UKHC8eZAoHyXEZlPPTpz/4QLM3qhn581r0uuXJUoOgc=;
 b=AKgwqjmRPiLizBw9dD4+7Y/kPL4CJSLKmsWjhy1mzs9Xe4lxaMckMUb3MamNinpFqxyhA/y3+
 /gypLngaYBoBQOUdTlCFiAc+4hmG6d4L6/OuR9heG2gYM2El9tjAKKU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6878f101 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=MO_J9Aa4ypbE8kPWTcIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: cvD91TbEVr8HjObrRChGkzcf2nBrrplf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfXw+qhBJHvii/E
 OQnqKmusEm8waiPbIPkUEu5mox98gebOKSdy2Eq4RDx7PaH9FKrGAtkYvxivaXcWFpBcZtzltFD
 rhX1o4kaYJbtvCo2YUQFzi+yHvkWq/Jwv0mAeb4sy2bWYgIeZaC2cxD7lFiDWk6N1hiefMbksxK
 QWa9RI0lsQVv70NbsPeJjiAV05CyWqdIzBcGT+76x+JaqXFEOQz5GFSLnYCyjipat6su1I6YFm/
 vanZ+YZPcy+TYekSOFzZOBock6ODffDONyHh20sk9uaxcWt64lt3/ELqSGFv6DrrwQ+3dZKGDBh
 iejxXm0zDCCRroU+vnwGOFW9SRdLh2lcchqbK5+trWMV4qtZ6ugHQq8Jd9XqEuAxllgRIxAqZc+
 5d/gl7VioiaF64j9BHOPt/d+P1CYx7eXGa5RF6lboPAKnABmt12V9wEgXDOWK9vjXc54sB5O
X-Proofpoint-ORIG-GUID: cvD91TbEVr8HjObrRChGkzcf2nBrrplf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054801_907262_81F2DB13 
X-CRM114-Status: GOOD (  22.85  )
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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  5 ++---
 drivers/power/reset/qcom-pon.c           |  5 ++---
 drivers/power/reset/reboot-mode.c        | 27 +++++++++++++++------------
 drivers/power/reset/syscon-reboot-mode.c |  5 ++---
 include/linux/reboot-mode.h              |  4 +++-
 5 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..e3eed943fdefa271b22e1f1891abef5c9095b9a5 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -16,15 +16,14 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	int ret;
 	struct nvmem_reboot_mode *nvmem_rbm;
 
 	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
+	ret = nvmem_cell_write(nvmem_rbm->cell, (u32 *)&magic, sizeof(u32));
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..93daf93c097f970afbaf43d36b1e4f725ca7a81f 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,8 +27,7 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
@@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 ((u32)magic) << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 0269ec55106472cf2f2b12bd65704dd0114bf4a3..1196627fbf98d87eec57a3d4ee544e403e6eb946 100644
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
+static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -35,11 +34,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd))
-			return info->magic;
+			return info;
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
-		return 0;
+		return NULL;
 
 	strreplace(cmd_, ' ', '-');
 	strreplace(cmd_, ',', '-');
@@ -47,21 +46,21 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+			return info;
 
-	return 0;
+	return NULL;
 }
 
 static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	struct mode_info *info;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
-	magic = get_reboot_mode_magic(reboot, cmd);
-	if (magic)
-		reboot->write(reboot, magic);
+	info = get_reboot_mode_info(reboot, cmd);
+	if (info)
+		reboot->write(reboot, info->magic);
 
 	return NOTIFY_DONE;
 }
@@ -78,6 +77,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 	struct mode_info *info;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
+	u32 magic_64;
 	int ret;
 
 	if (!np)
@@ -95,12 +95,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
+		if (of_property_read_u32(np, prop->name, (u32 *)&info->magic)) {
 			pr_err("reboot mode %s without magic number\n", info->mode);
 			kfree(info);
 			continue;
 		}
 
+		if (!of_property_read_u32_index(np, prop->name, 1, &magic_64))
+			info->magic |= (u64)magic_64 << 32;
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..6783d05e80fbc2c812b45ffe69755478af90d30a 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,8 +20,7 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
 	int ret;
@@ -29,7 +28,7 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, (u32)magic);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 36f071f4b82e1fc255d8dd679a18e537655c3179..d9d9165a8635e5d55d92197a69c7fae179ac2045 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,12 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
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


