Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459E4C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Omsp8mXp75/hXn7qkFWCOKSdc9pZVj0sVSquHLqjEXQ=; b=fbwCdDbCJ5jTNU/eZXJ3KdYSwL
	TA9QoCaor8OLwHuP/4de+Z1uExYLK+c4iGma02iXD4R63pPIsXrmXDnPPkj1XtORRVZtv+/SfVbbC
	kaQqT8opeuvIaMamkecCv5G5wHz/Xcd/KFl/NYg8zd9HNABow69gekaLnfClS0puMaN5TQFohuzwL
	/J3IdBCog6KMlu74fW731ISjDm3JXane0kNl5J+Zauv+4KTbnDGf3vNK0MuwHhektSBbDAPnTJQng
	kZs4HeGfcc5sQ6r9Lj0jZY+FFZK8O6ySTlFkW1MVSFtiHb17RagTVdT2Fl1EHKc14qICwtOQgcgtT
	LqYRDUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoOX-0000000BSx1-224V;
	Thu, 10 Jul 2025 10:20:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnOY-0000000BJWO-12Zp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:16:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A97Clt012565
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Omsp8mXp75/hXn7qkFWCOKSdc9pZVj0sVSquHLqjEXQ=; b=hlnz/YnwwphwltN1
	B59JKt/4Cda3W++kZCcYOo9CUN2kq5szLGlvUjEnJN+hHg6XkqySGAIX9kQIIt7L
	yrSufKUVrc/KR4S2bSfNKA380RSozNd9AgKSBBzx4eS3yMxCVAZm8j8y7yOClmvp
	LLDXTzNmRH0uL2jaQlSmOisOnSjCMULev+gXx2boFoy0eodr5fHT2uH0Bp+9Q6LT
	iSjO6AjrB8xVeHDwSwL9cFkRia7oTfDG9y/2LnYkem+xoIYk11EbPDgd3Kax1Do4
	1+8qtWyq/c2hdkNwC+lwYBwx017JrvAnatQCzfezEv89DTTcdRAjWFeIrIAypGR+
	T1I8Bw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn7vep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:16:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so1379365a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139004; x=1752743804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omsp8mXp75/hXn7qkFWCOKSdc9pZVj0sVSquHLqjEXQ=;
        b=pwA1ZbaYqBETCJQIGqUXgeR+XcWhNNfGx+KBV6SLK7yymTJaZW4Uhw/GZJ7bew3+B3
         DOPTQ467PrY4M8xnjL2ZgsqHn3dCYkj7x/gv+UfRepqvSiuUjK1xy0cdJ0ika7dl3npc
         w4ErLfUPlEIsdjswz8Hwyu4u+ByEh++x+dKepynkvNZKjUdKLRARqDMHGalt+h7gDYbD
         7heXPYb3gV2jr4IEauDKCzxgqQ9RSzPM2oy0wE/nwS/eu0qxh3WXkIS/B6G0Y5/fNHos
         /sFXmMt4YSbkJScM0RxhK6mZI7EKgzS1mRzjcMpgiaLCKT+l3WE50mlmMFvXKvdBlsIG
         i5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXuWYQIy2TFN0vEy++rA6fxbUzKi4aoAaZH115+ANt6b/20i/wckmJe9UudhCNIZkFvBfft1c1EWwSw1DYw8EAH@lists.infradead.org
X-Gm-Message-State: AOJu0YwEMfkBwZb0Ah04UuuGtBEvMSx74tJpBj03cXKDU8wyB+5rewUK
	+90zMZu4QKANBwKI5YNYhlybv5Es5c4Hl980+lG7+QmpMz6nqnwaYPq/k8vadLv9mdZTlgDht2a
	rvZqczTKVS7B+/4I4mKq5y7KYqPEpr1+mYm4B3zJtPVvXie3EjK004alv0DsEW/5swhqAIO9GeD
	hVNw==
X-Gm-Gg: ASbGnctajwXLKOW9zZH4E70qSV/LbrwvvW3BpqOvGmmFcTO8vSEKBhSSxRDn3JNRvGW
	R4LBdInHJYaDMBk9H0/EfLKytHmmEMc0uYWVJsr12TlfY5ekL6xX0fNCBFnVjtx03eKHO7Lnxyp
	46EHRWG7QCvGssn4w18VrxKyTwQFVIphQ5zriJA/JsGO/X9th2vb9I4LSLuvdyUEjwL6/OebZxE
	zZSO5kVv99ztP+cx2IxRDFVF2oGWijz1wfT/6hU5uj/KL9ykVYHLuQdqc2r74tl5Hr2d4snQY/L
	qzEculiQOSDSsBbKFAjI19TuOiPc6ollnGgvgFg3EWGvR3/YJgab363FA0k=
X-Received: by 2002:a17:90b:4b83:b0:311:cc4e:516f with SMTP id 98e67ed59e1d1-31c3f0524b3mr3115629a91.31.1752139003786;
        Thu, 10 Jul 2025 02:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRkahqT6M3goz801R4gyUSxZaZcpl0nbaLVmNgBBfdCc7fPM+qe8CygBRAKPCeG1ssUoQs5w==
X-Received: by 2002:a17:90b:4b83:b0:311:cc4e:516f with SMTP id 98e67ed59e1d1-31c3f0524b3mr3115552a91.31.1752139003251;
        Thu, 10 Jul 2025 02:16:43 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:16:42 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:43 +0530
Subject: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=4006;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ALwJqxoH5zAinvmbBAPI1a8edV2GbWb9vLZOWS7SaNs=;
 b=zmpgmDmSEZpp9iMryNZpCeFDIhc8RonTeW5+eqo2M22DtBxd4MaQSjx8XESzBCnjrPGhO181y
 zLKXkvptGoEAg7h41Z8ubtMkQzWYl+N4cZV+M+0O/SV3DXVGoygQFwA
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686f84fd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=i5N5rYY7EEs6P5za-RUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: AQwn56Q5oQ1ryfRkzezqu0gcH4cspFgM
X-Proofpoint-ORIG-GUID: AQwn56Q5oQ1ryfRkzezqu0gcH4cspFgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX6Yxmobr8ZyC8
 VWEG+ZJkFoKGSKTRw19xZA3fvPjJet7SZ9e58FrgMpyM/U6eZTIJUot1XIDbMpzo+dt5eeIlsRz
 gGrGefZVpRRj0qPDRIrd6k2L7h8QrQj/vu/C7YRGT33s7yN1iw06MGi9Wwg9l3AKciodl3B7K9Q
 LMFDmaT4MfMszd1kw474fiH8PSAZ9vV37n8ellMtxORRYGdXaXFr6T0jpWcmQZhetluHFNIJvnX
 u0W9xaMMEGdc7NHpA71jV+dZnr7f9sTmdUZFSHlaFFhw3GPhI11KEyqVwzECsO6MEefeSTMsAks
 0EvTsA41FM7dJ+VbcTl1MKSqgeFG6h0mnq2D+YrXx0ZPBtpq+3DD6pKWFOvK9bgwRVOIIyjaMhk
 N/oyCMaa9b+tPjTkzb4svpmts5nkfT1/9vItvAfFbFAbyGxOnnu7qcQC7hlQtyhITsxvul5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021646_397486_D0BAA9ED 
X-CRM114-Status: GOOD (  22.57  )
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
to read mode-<cmd> properties and the device pointer for logging.

Remove the dependency on struct device and introduce support for
Device Tree (DT) node-based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 23 +++++++++++++----------
 include/linux/reboot-mode.h       |  2 +-
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..61f647b23959789a313f3af0bd967abcad45fa43 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -12,6 +12,7 @@
 #include <linux/reboot-mode.h>
 
 #define PREFIX "mode-"
+#define pr_fmt(fmt)	"reboot-mode: " fmt
 
 struct mode_info {
 	const char *mode;
@@ -65,14 +66,14 @@ static int reboot_mode_notify(struct notifier_block *this,
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
+ * @np: Pointer to device tree node
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
 {
 	struct mode_info *info;
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
@@ -82,16 +83,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
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
 
@@ -102,8 +102,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -130,11 +129,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
 		kfree_const(info->mode);
+		list_del(&info->list);
+		kfree(info);
+	}
 
 	return 0;
 }
@@ -162,7 +165,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -9,7 +9,7 @@ struct reboot_mode_driver {
 	struct notifier_block reboot_notifier;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


