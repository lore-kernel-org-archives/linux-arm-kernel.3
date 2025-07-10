Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DE0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBKj3/crUvYp4Ips85Vws+1r2KlgFDtGQkXcgWnVP/g=; b=zuedbGtzuwKWAFzY1aXS8oaV8s
	XH89JbuohRG3xSuleb8idyc5e+z5yQ+n+RsLtY+t/1R1mjmuPBJ8bk0h8BXUohFO/24Nv8wtJlAO4
	kitU93mpslZc9Ol4pDqkVdmHXGDNeoA8zjI2QP4xCjbL2iL+z9lxzvB+PCfl9fukPI3gvpAoU5l+0
	oU74ZiRfnDMXh/CpX+mO2U1A567lcAnIyxiEMjjLf9RKy+wjRz8vmFxMCKqQR/XDdsCgAqjKz6M/7
	0UAIrVrwSCF0a8SNjUc/UJCePQAgtPuHgaBJbrMWh3sa7hc3Srg2VDD5ERZ0CdEExYlVaeK9OtV4M
	0WCdT+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoh1-0000000BVfw-3CLL;
	Thu, 10 Jul 2025 10:39:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnPs-0000000BJq0-46qw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:18:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1NwAS011520
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBKj3/crUvYp4Ips85Vws+1r2KlgFDtGQkXcgWnVP/g=; b=BuFpUYcfun8Vz84J
	pQVzInUwJbie1KwsmBsVwgfqtoydkX3bU4J6CPTHbCijc/jrxpUUsklvC45H7zoo
	resLbWnzGbGbhwXIBUDRRSK3+E7fQ8ZzMGyj6riDtHsXvrdnIUQAYkAiR9Hg8+kH
	94jMFaC+g3gd8x18/Uo2tc+U+xEniso/2x70Ho6yErR2Tf/a9MGoxpcVPvdgrjqS
	N5tZUkkt/2drZR9/ffl6PkDZg61/lsxcbNpUjMeNXF5kd3695KT+eNqfHod9y0WL
	rBGymV1q4fqaccvOQe/1n2B8W2lQ+bDLZdgazSQYDsq+vsZ8H4ReDjMMfgn2lFJP
	a+TTfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafmaty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:18:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so8419575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139087; x=1752743887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBKj3/crUvYp4Ips85Vws+1r2KlgFDtGQkXcgWnVP/g=;
        b=iab40WFFq4h6+fnWfvAMqqWlTUohJmsFqmFbs2TEnpyhuKoekzTlEcz0DgGwoyWNK7
         Tehs/5HS811xby7SFJKBKWlftcF9cwBNE0/eIVbZUeo9R/ZxORuCqOeckFDGuA9DcTW4
         riSdkM92YNRmygEkPzx5uoaNt4HcziBHOzUo6XApKc4/5qw4gtCs/+cbJiTNtiwbR5fC
         OcPONHUlHrCmxM1wMS8jyyIhsbjm+P03tq85g9qLANZvyU93zH+EnCt/oSetxdq81jYr
         E1Jcj3GsUjewEriEgiVYCiTM8Z8saJjeCH/hPJJmRIHkQQmK9hoX3jjTt2LotG4vE7jp
         Pf0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXssDcTh5hy6QB0ekHxTOzDAaHaoUdL5Q00WKVBhobQzfXKlyFHn9ZSC6AIdrFiYdLnYPLHd4m2WKiebN+B164H@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq3Q7Bvfm+OMEXWRtNggsvnGLFzfa1XTlYrNbrJS5pJmwd1Pn5
	6YYlgA9aXXVSsqN/1gx14xmrTPJLHrAPLpQ2VliDC66iHzNUDuBLD6Z4EMXT7BynKd+RioVvEO6
	92IwaWZoScUOiYjJqzutaoFg/qx+hOdcvFe5qF0hflj805mvVkrvB5xNsOgMq7ehUaShWGrSwXf
	1sUA==
X-Gm-Gg: ASbGncsEu7rWn4q23ssfNTaGpJWDAz3oB55NUH7xG3NiH1VuCjXKgRxG6p5PaWaRaUN
	1KBJWSxlDwY1PXNK/xb1U8vRgfN+pQiT0tzu83jtvOgSK28tCaUc4tc3L3REbMq0gbe2Dc+aHz+
	glQlYTDqGjsh0+7b1C3VY43chGVIU2lyxrXI+EeurmQFwiX8Bjc4GcvABQGumB0YQChQz2to01M
	zY/6CEm2GHH/38HWnizfnpE8cYmiuGPc1Z9IJFJ49UGdl8xfankdtEPAmVO6STuXqiluDh/7WIU
	gn9a54Q2PZ8BCZy9UNExo12q1moWHJpoK3qDBtxHqFctrpsJf89UtYwHNMA=
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26726025ad.8.1752139086642;
        Thu, 10 Jul 2025 02:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3++zCHPG72HaamcNpmeO+Bll209rYHNgNyYOmL53l1Ne2aXD9CjDh3cQHGGPnX41YVpDvag==
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26725325ad.8.1752139086179;
        Thu, 10 Jul 2025 02:18:06 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:18:05 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:51 +0530
Subject: [PATCH v10 09/10] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-9-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=2284;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=sNPObCAn0hHlmeXuawxrFyQE6vuwG7PdJUJ999/BvyI=;
 b=2a7c4y1EVymbu2XIDK/bSBzOWXavwNhKH+7Kgou3PJREQpHdjfWF5P3WklEYYjhjkesTJleCj
 E7fEUYVuTpACaFQwTlNOMKw/oaee09IuFwlJ2c2sTZy2gFGks/QjdBN
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686f8550 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5CgfHzhl2afHKY-Ush4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: meHIr5KBWH4laMajxG0zZr_57J_xUNHj
X-Proofpoint-GUID: meHIr5KBWH4laMajxG0zZr_57J_xUNHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfXzDkURwNtLkZW
 TnZTwbWmk8yeV9X+5t6YY2AfBwhQD7INByDsqNkoL2/GxEC6cx8xqWvuRVCzHJGAhBc/DunOXKe
 OE3FoH1cedDtvpvLNH6Ki+0WMU4cqUsYXyt5ehovHJFJB/Ss5WvuV6mnxp5k1wyFPMQpIfRZoDv
 xBBoL9JR6f5KhicK1HbDjH91OY7TJYBUc69S/hjeXYEz9GX3VMhK+g+ZediD2OYXk+vIHNsrEwU
 f8JVBmu2kFT37UxjbYvuq5MgCTJqJwp9VfF/0xG+20WRbcszZ2lI8cYSydGcSxCHxUmRooKVeRs
 jpqbu/t5W16DYggVBn5wwZPtdPAF0tiT93ygnC/sr0BTCFSEB4sR3029K9JIEkNw0wV4UkkZ/F9
 2abLwJvzxGtybEdMPEO+5+GjaJRvrJ6IussosWjh63hgNeb++edtW7cUvtNAnjI7weti4l9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021809_129557_2DCC533E 
X-CRM114-Status: GOOD (  19.81  )
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

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes,
a read-only sysfs attribute exposing the list of supported
reboot-mode arguments. This file is created by reboot-mode
framework and provides a user-readable interface to query
available reboot-mode arguments.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..bf49e6c1dee6f48d791987a50c3d0b349e6714bc
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,39 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		July 2025
+KernelVersion:	6.16
+Contact:	linux-pm@vger.kernel.org
+		Description:
+		This interface exposes the reboot-mode arguments
+		registered with the reboot-mode framework. It is
+		a read-only interface and provides a comma
+		separated list of reboot-mode arguments supported
+		on the current platform.
+		Example:
+		 normal,recovery,fastboot,bootloader
+
+		The exact sysfs path may vary depending on the
+		driver that registers the arguments.
+		Example:
+		 /sys/class/reboot-mode/reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/pon/reboot_modes
+		 /sys/class/reboot-mode/reset-types/reboot_modes
+
+		The supported arguments can be used by userspace
+		to invoke device reset using the reboot() system
+		call, with the "argument" as string to "*arg"
+		parameter along with LINUX_REBOOT_CMD_RESTART2.
+		Example:
+		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
+		        LINUX_REBOOT_CMD_RESTART2, "bootloader");
+
+		A driver can expose the supported arguments by
+		registering them with the reboot-mode framework
+		using the property names that follow the
+		mode-<argument> format.
+		Example:
+		 mode-bootloader, mode-recovery.
+
+		This attribute is useful for scripts or initramfs
+		logic that need to programmatically determine
+		which reboot-mode arguments are valid before
+		triggering a reboot.

-- 
2.34.1


