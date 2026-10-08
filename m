Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7101CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=; b=nUT0uXxdCYET8TDvazM1OFfP/n
	C7PrD6jPH5qeQX/zqxNXPpmVGUHFWxHmKA1GgXRUxzdAPOENo1B5bxufPY6FykbxwvFMvR476Ty4d
	g3XdTsVe59EFo3f5k6uX4HS2x+mQ4iOkysJuJ/llzZH2Phe9js/ijK0VSiZiom6Zb64XDTGGYZVqY
	OZOcWhdRgrkS3XF4Z1t8I9X3BzVwa5gURbPrJf4eTm6azhjN6+7X1uP/dIYoDYwsdd2kqdZma/USO
	oajHrul8BfqoMtp5bHLvOjbo7sv4OHtjFKSZOnVhQbvepBjID6mXfWymVofGaz5y1V6p8U03V+9uR
	VGRhpz1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhvG-00000003fE4-2dVt;
	Thu, 08 Oct 2026 06:48:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhvC-00000003fBA-2Er2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:48:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUr52895417
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 06:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=; b=loTaOGp4bx+GSRMA
	SUqbvQaP20bIMXVOvndQH1hMXClnypRT5w6UPdhSaWGRCS1QT9P2h7gQMI7jbLwD
	5ULwANBh7apTGOSc9bLOB5gyJIf5lIc+AVK0rdhHh0qiF4034yDdf7wIuUauwpRa
	S5FAufFnwy4XjKV8w3jzc0dro+wkW+NcPRGCI/ifz2ldfjW/Dy00aa9JQC6Y8SR0
	rE6yLUvvBSFCElpr0WDz/gJu9XqdQ+0pqtlyTctNGBmAtZDCdiN0jYhC3hAT+3gv
	Ug/vR72vXyGca6RnJk119s7f9nKoYHIlJ3d36QoehOsXmpy0vQuqnTCy3PcuoZrf
	2yFwWQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg93qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:48:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a470ead068so4577717a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442085; x=1792046885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=;
        b=I5Y67Kdmks0wLpBTZWxpYhteI+Qr0KSXkyhMY+Um23FCsGL6dB8Ks8NJWGxXze7WS5
         eKhK0D7a++1OxrAL6bcIKPYVAb5tBC/RVEEB7jnMmP8rBXHiqQw2271jOisXRe4cFqfZ
         1VkTX8RHXKS8KAIMRiJm4vtQcewPueOHz1fHUUtu50Cxeg8N3bZLL1uve0rv0cVqdZM8
         yiwMNQQt/pSlGELOBc9g9bA+EPvyHIlp1pYO42f5zB6K5ba0Si3gYXcsiToygniNPmo1
         4GCsKltw0mVMBXcxmoncx2zL+vZBTXPmw90lXe9qa0/XcS1d8A4np7KO1qFa/4A10029
         jUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442085; x=1792046885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=;
        b=vxSHwq+iC3Nb2qcofye+BkC0Slp3WjrDrb49ZgXaLihP5bP1a6kt0y16VUUjhE9qpL
         7jUbgBOW8207f8Zzlehejpns9x5vo3Xj4tSa/n942GwsYrmcovPvCsm0yZl5vGeeos+Q
         x2X8Lzs06/EN02VMsRMjgZCvhHnb2WsAeZ/C+UcvlmdX5Q1wUkE6pO1NF4Pg+wQhOGex
         rlM4svjvVaUAE1dhHGHy3Zsaxk+6rHnVYfF2d8DkzqB9YLY32QE0klwrrvzq1d8Ihyff
         TwNOLI1Xtn53z+H08YdADus+U/LXO6B2iiosTPRJQ7p5PbxOb1Q/NceUe6tD3uDFLU9r
         YL3w==
X-Forwarded-Encrypted: i=1; AKwUvBxZov4P3CvvPnLzVShDYLZl5swE5eSAlYnllG8uvLxfAnBBxY6uvjaN/YJvCCf0oP3b+8kiPgsXDzF/zkGggD5n@lists.infradead.org
X-Gm-Message-State: AFq9FYI1/PGsDzoY4Z+HC4pk3pa50lh8D/j+kupn+607mClpPdJqyZ5E
	z4fyqNysCbLLbCZUlzO0h5luVWM2bVZi81Ms5tET8qT6qOLtzVlEdwS2fCsPWTqw+pAyBWfYY98
	kVVDcQLtPIZNa1KnmC/bI8RNmZu08T6gRsdA5b2CY0yYyztFpnMJv+vnUIHYw1LxeqtYGc2qIvj
	9ydQ==
X-Gm-Gg: AYBFou27OlI6n/xDkZAves662hh+IHUEKuty+QjYVwGmJ1gZy8sCyZHoCzgyLSmqoxH
	7BSE01gxFCLvZW44thD6ThXhgnFsf5DoxxyFGst2TMAO+LR/+kORqKYYQGdwDpae09b2MvfL/t/
	t0qmRfHWatHQRld1DzYeemE1xQmNmPVXxZTHSrLzenb5FCxm9QVV6IyLliMmQuVELsgNYOW0dbT
	JNJ3IlhikxmhWkLUbvNtcJ/jGd+OZ1deVbRCYGbE/QCoIWwS6av9Gaf0wcT4HkiyyAfNzB6Rf/p
	iyveR+UsLZ/K9kaJnYQWJ6Po8z9DUtZPErWmETFlVqtz9iIHpKvmLM3Azy2Sa7JJNes0lh4dMpo
	5+XwX0io9XJypCQmojtceZB7jBgWe+kB6ws0sYKiLgm9eJcbgpPWu+OM=
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3337635a91.43.1791442085038;
        Wed, 07 Oct 2026 23:48:05 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3337594a91.43.1791442084504;
        Wed, 07 Oct 2026 23:48:04 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:04 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:15 +0800
Subject: [PATCH v3 6/8] arm_mpam: Add support for memory controller MSC on
 DT platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442025; l=4057;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=IyjCt9e2HWnLpXHhmvzVNYem5pb2CZCxUbGNx8XbqAM=;
 b=AbRTdccivHdzG1PG5LEspniMT8sWNpqFZ3ke2ws2IwfWLlLEzGZ0uItRckFXz01pJZNhCd96T
 Qyy1ZPJVHLJAafN0YoLbiByqNGfBfH+Ema7zrFZkTpDEK/kZNEeguTc
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: 7D1hZZrSj_UdcTPZXpepSmmivXgOB_9h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX2gSE7F8ld9dX
 V2+ndwF6O7OHSq+e4pjvg1y1ku4vB077UM5TPp/7Q/fbAFbnTddNdE8L2QVmrQ1hBEKOx0ql7p9
 SiM0V85erxfd/+LkbxuiSeoR6Ufa9vk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX6RgAaJO9AzH4
 UffonQ6PIEYC2gw6EAZvW+rkoUfxzgS5Z4yvvi29hqZGV0qIui6vW4swnQ83FvM8PpAGWsm92Xx
 UwYHhl79WWdjpFR99xCFgdtYJvxq28Z+VJU+qxU/yBhRR1wccLVjKf3w3Ov3ZJCU44GBJSuFM4+
 oNeLMewRjRblbWkcZuMwrHjSssB7+8pFj/rp6WY8S0ufwCM359V3U29IIJtI0tZDAf5RLZHhM0o
 e7UVXG/yuKKpAaRE4lVTn0KkMiDKze4eNpb3OVqxRPmrHwhGqfE+YHM9K4LwgNjMZZv3MYq/6AW
 +TMXfYf3WChFd3021c4osCmvz8MBBAfutcAo8WgT25MImKWc6AXzoHJL2/+ooTUD/hANomZ2bbD
 qb+Umjpp6j7TF7rQIPYzvAXGlUL8wWdtySH0do03zRxDOAtaO2V6Gt0+PD2kJ3MM9DmVOicn8NY
 gET3W0xbwOif0yR37oQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac73ca6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 7D1hZZrSj_UdcTPZXpepSmmivXgOB_9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234806_626776_79E34EE4 
X-CRM114-Status: GOOD (  21.17  )
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

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts; use of_node_get() for the memory
  parent to avoid a refcount underflow; use u32 instead of unsigned long
  for component_id and compare against ~0U ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 55 ++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 0640690eae2c..048d32e69f55 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u8 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	u32 cache_id;
+	u32 class_id = 0;
+	u32 component_id = 0;
 	struct device *dev = &msc->pdev->dev;
+	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *memory __free(device_node) = NULL;
 	struct device_node *parent __free(device_node) = of_get_parent(np);
 
 	if (of_device_is_compatible(np, "arm,mpam-cache")) {
@@ -275,27 +277,48 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 			dev_err_once(dev, "Failed to read phandle\n");
 			return -EINVAL;
 		}
+		type = MPAM_CLASS_CACHE;
+
 	} else if (of_device_is_compatible(parent, "cache")) {
 		cache = of_node_get(parent);
+		type = MPAM_CLASS_CACHE;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+		memory = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!memory) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+		type = MPAM_CLASS_MEMORY;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+		memory = of_node_get(parent);
+		type = MPAM_CLASS_MEMORY;
 	} else {
-		/* For now, only caches are supported */
-		cache = NULL;
-		return err;
-	}
-
-	err = of_property_read_u32(cache, "cache-level", &level);
-	if (err) {
-		dev_err_once(dev, "Failed to read cache-level\n");
+		/*
+		 * For now, only caches and memory controllers are
+		 * supported.
+		 */
 		return err;
 	}
 
-	cache_id = cache_of_calculate_id(cache);
-	if (cache_id == ~0U) {
-		dev_err_once(dev, "Failed to calculate cache-id\n");
-		return -ENOENT;
+	/* Determine the class and component ids, based on type. */
+	if (type == MPAM_CLASS_CACHE) {
+		err = of_property_read_u32(cache, "cache-level", &class_id);
+		if (err) {
+			dev_err_once(dev, "Failed to read cache-level\n");
+			return err;
+		}
+		component_id = cache_of_calculate_id(cache);
+		if (component_id == ~0U) {
+			dev_err_once(dev, "Failed to calculate cache-id\n");
+			return -ENOENT;
+		}
+	} else if (type == MPAM_CLASS_MEMORY) {
+		err = of_node_to_nid(np);
+		component_id = (err == NUMA_NO_NODE) ? 0 : err;
+		class_id = MPAM_CLASS_ID_DEFAULT;
 	}
 
-	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
 }
 
 static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
@@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 	} else {
 		if (of_device_is_compatible(parent, "cache"))
 			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
 		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
 	}

-- 
2.34.1


