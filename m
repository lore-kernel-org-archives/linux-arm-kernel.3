Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43745FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rRdDX/+Ei5K81nWEVyfEKN/cB2TrHg+BZ3igx5GLKU=; b=nMUkhGHuVeie7XVGey4RMkvZMl
	WU7KHT3qnMy0mJ1AnCcCwXUMdOKC88M7rQYHfRevH3wKyZX63hV67U7xIywrjBCXt9sFGPAwfGxkW
	HmfIe43c5BvZ5A9DjMJYSLgFJRz/F95ogxMn/nUU9xHPlq0TvVp9zAVS9vyIX2OKuFcgNu6h6XYKD
	kEELIPAnK0UKmmqfyL6KEd6L12FjRIpaYi9PkMAbHGmnlfwCxt7/RsVE68Fs5XgQ7hD9444GmxQio
	wG+m4x3J798z3PcE9drPA0LrNKvI2cYwlaQHcbmEoY42ASGsLIamsHKXkEWavxZvk3YwEYMvOJLEl
	gVK1zFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPt6-0000000HUIq-0ihL;
	Mon, 27 Apr 2026 17:36:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPt4-0000000HUHL-0z8r
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 17:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1rRdDX/+Ei5K81nWEVyfEKN/cB2TrHg+BZ3igx5GLKU=; b=ImKFutFv8QipznGNKyFni3dl4S
	ObmIiRZVFDQV/ZTCukNGozDOyg8S/bJp4vvJ3CJTZFX2b4SYTKySIODtL33v9hxGl7chpCkSR6ms+
	KTaT7V7WSrHzYMRReq50ax1DNQaXGo1dDk9TkNZlcDVwcUSivab5jkldhdPuXjDz5UZE9yPvcAmtk
	C0RMAAbyXVV0sW5y5jbqj8yzBmFXVDkPyOHli1TfoZuyTGA32s8u8/xpdkoeQKwuMEKi4pp1Sl35u
	36vx4iTj0XiPXja6jNpZKInFlwuIA98S7i1mFWJ/6xoOfqVe1alV3wFJqkRRpYnAXp9pwVGdfBZOB
	1mHfIS2w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPt0-00000001GXR-40dq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:36:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYRD9429032
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rRdDX/+Ei5K81nWEVyfEKN/cB2TrHg+BZ3igx5GLKU=; b=ft0GGhE+1wbfjrdu
	3UjvbIr8PduzRljaiMay81Vl1zPBrBHl2MUbHVJybpCx+zzNnfuvrdosPj/umQBh
	KH70qUsgOv77c+6mLhBQNTtzEXsjusarX3To7O7lowp9puR/ZEoePpO8efJiCBk4
	YNTaR6gYakUMoU5fwEo6ydW/0oGKch5VcOvjSzHn/iFiCeuuzDjVeFgO9JFpXbmA
	RRoZSBeosb3UMRWi8F21MhbWc05fpP9h3pROU79uxevHNZeEPxMWF/IcEXKQ2rmV
	lfagU1dmn+nL1fOtmhoFLTdRx1RaFzohsi9cCk8elCs8aRHtFrA8mHOPRQdJDSl7
	lZOu1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x315aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso106652295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311404; x=1777916204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rRdDX/+Ei5K81nWEVyfEKN/cB2TrHg+BZ3igx5GLKU=;
        b=dxRTSauaumvngsjPuhMaABTPsXRvcmQNy/EZjmFpa3DQJ8WXZ9qn8tP2fTntzYQfuS
         e49gmaQ5HaGurcXixEEdw8Y5FloxaP1RLJ+shnqBgo+wuTh3NeF6pfiJiRRsbe/CT77S
         /n2+g26YTwTs42CFNaWea774u6KxaYy6RrsbNZon/JKbgshnSTsOMl+2LJNtABebVTCm
         W1KX0RuYzG10T5fdAMdmjEMxq0wiz5YU1/+pwlgk1n2es6q1W4wPy1zZ4eQqzCiO+Rux
         HmCdxZ/XLKP3Afd0EriuwR8ddwAsb2eDFakPfbGC9jBBFz6j1w1K5rgZDQTjuLr1BgK1
         UIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311404; x=1777916204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1rRdDX/+Ei5K81nWEVyfEKN/cB2TrHg+BZ3igx5GLKU=;
        b=gXqjEtugUEpvlVQjAJJSMTBxwxsE9hl+/zVVj9JJN+RA/bAeQiPIld6+N3Vq2Zh009
         CAsBIq9kbiTznxgMzRtDRcuiMzmONyrl4d7iLoOUOY3FVvcU/tUlSEnH2G6yuuG4bRje
         Rlzqnt6+tr5xNoJgjP5OGmCk/tJ62WBTXYIlQwXaeNxixpWh0iKHB0Pm/qFagwyv2uH5
         bYAeB9cwVlEZquY7IgBYgjJcaN40LGsfuSEYZtQZCyiZuzO0VeCY5Wa4isbFyM+8Do6m
         xR+l5Tr22Kho7VGax2ItSvhW9KwN+CZONilCsCeu+fn1NEUOsdI0UZI0Ozq6qmHrsh4Z
         kORw==
X-Forwarded-Encrypted: i=1; AFNElJ9rzdXsQshVgyIichtAzrCx0+gmghW3RM8ZHX15bWTq4IZJ57jTC+LLks9solR6XfaQw3k5CcAZEuZozHaeU6j4@lists.infradead.org
X-Gm-Message-State: AOJu0YzfzMXkOwdFgWV5YJMpuBt87xAmwaDAS2LRaC9PuE9KHsWcHTU2
	BJXxYN1QJJSeFoy3R9IxgESRLh5VpLaaYb6XLHft71DcJw4N6LcFUSAOseEiICIPFAlq7EJEain
	v6sHlCv9wHjumbYF5Nx6A8tLpS+jZddVC/4zf77WGLF0fOo8BdeBxsWlTBzIZMEgFkG6vBbP+jp
	DCKg==
X-Gm-Gg: AeBDieuQg0PP6ww/X/Gd9DQeqJynK0UIdWEroyqRlZNT39msljp89XG7AbHKquRSDXL
	bmANzj9xx1Ud2qSSSboHL0+gR3APQTQTTKkfb8cE5/vhh72PM6FOrBXqmRBWqVYQ/Lvp9Cl23wV
	osDYMV1d4LJV+9km2vLM0bj2SX8yODFBz2rnAp2bdnhHxqVkvJxZGCRKUdqZl8rZvt2p1oKmG+9
	DZFRr1KojLAmGEZFJ5U1NAIQ+bBd4jNZ+8jQn+1xRnG98CCW0o2ONIimCVoe2kDx4WrriV2Kw9S
	xhqJx6+rYEE69RVs+8qYAjPDQ8r1MK+dIIe1OM5qNXFPKrZ7Vm2mQWQ0+aenwvqeE/pGe8i9Hr5
	uYiAFXt5af1TIoR86K1Xo6U73fl2w/IWYLPzgXMJ+GNK6ksD7RncVRmdiWvtN+Kjph6CP
X-Received: by 2002:a17:902:c40a:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b97a951600mr1711395ad.35.1777311404423;
        Mon, 27 Apr 2026 10:36:44 -0700 (PDT)
X-Received: by 2002:a17:902:c40a:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b97a951600mr1711145ad.35.1777311403899;
        Mon, 27 Apr 2026 10:36:43 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:43 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:49 +0530
Subject: [PATCH v21 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-9-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2384;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5h0sjs2AZBoFyTJm/Doy48a/B0F/c/N7jdCV3GRQDUw=;
 b=Qqi4nd9Oe7ndBnF8ZRdQ3G26kUFOzIzSxH9DDzNSNYCgqcDhJbsJtVvuTk/fVa0pziIz8yF/2
 8/c9Fcztj1LBvM1CFWuC/OpeCF2cn5Yk6nAidAkkX+114fRCTDwy15I
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX/vcTJsHz/ChR
 uVpy0WOF0JwgDhKRhK9R4xaWR7fhGY+50hlJgazuSzi9g9pmgY/xM9pxqTANPvTOK1OI1D+oOtp
 qlOuj+UApqtY46DC2LWYOrovZF+spbwLsaO8Z7PPncWsVqAGt7aKNHTVZbOeIOLi7qIxONTM0Vs
 sABZUXi8Rd/AHU5WzvJmnAVnQfwoEQbgwZ4SfTnlh+MIJ4aQoOq/gjUN8L6FrS8pTjDTTT4Xftk
 nVTm0WkzsmEHSq+tREIMseLCaGBBl1WlITPFsUSN7TqPnrZGniZ1UV8ewiiruE7i1UHJdT9wsVN
 zTVGJV1r7gBwp4uCzG9CLFJ66K8RqWEdOE4gOcuQKIliloHMmvsAQDTNZ2no+Xt8xJ5kNyu+F3w
 PA+lev4dJaJaJBvxcEND78la3nBmR4/U51wX1u8DG9W02VCRoNBCisDD44FdE6YZeZLFGtQZMIB
 mNkbauACB7EXbeXUGqA==
X-Proofpoint-ORIG-GUID: KsJ6hSGZxv_bd9Arptlvnup-8aAVtUp9
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef9ead cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tQ_U0J7R6L3XYHxJwYQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: KsJ6hSGZxv_bd9Arptlvnup-8aAVtUp9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_183647_424074_FABCC37C 
X-CRM114-Status: GOOD (  20.32  )
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

The PSCI "reboot-mode" node does not define a compatible because it is a
configuration of boot-states provided by the underlying firmware. With
the new firmware-node based cells in mfd-core, this node can now be
exposed as a proper child cell.

Add the psci-reboot-mode child cell to the psci-mfd driver and associate
the reboot-mode node as its firmware-node.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 23 +++++++++++++++++++++--
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd83452664edeccb09290fe4f43186..dbb7c23b57d89765996ac887beda24fec76e8373 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -7,17 +7,36 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/string.h>
+
+#define PSCI_REBOOT_MODE_CELL_IDX 1
 
 static const struct mfd_cell psci_cells[] = {
 	{
 		.name = "psci-cpuidle-domain",
 	},
+	{
+		.name = "psci-reboot-mode",
+	},
 };
 
 static int psci_mfd_probe(struct platform_device *pdev)
 {
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
-				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+	struct mfd_cell cells[ARRAY_SIZE(psci_cells)];
+	struct device_node *np = NULL;
+	int ret;
+
+	memcpy(cells, psci_cells, sizeof(cells));
+
+	if (pdev->dev.of_node)
+		np = of_get_child_by_name(pdev->dev.of_node, "reboot-mode");
+	cells[PSCI_REBOOT_MODE_CELL_IDX].fwnode = of_fwnode_handle(np);
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, cells,
+				   ARRAY_SIZE(cells), NULL, 0, NULL);
+	of_node_put(np);
+
+	return ret;
 }
 
 static const struct of_device_id psci_mfd_of_match[] = {
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index d9d1f768b8691abc3b32f2675519f2ddbaf19b84..79559206d5852ae5eae4c8eb2c390901cea7531c 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on OF && ARM_PSCI_FW
+	depends on OF && ARM_PSCI_FW && MFD_PSCI
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1


