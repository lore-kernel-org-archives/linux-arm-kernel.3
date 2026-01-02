Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB52FA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FNQhzf6ahfq20fonXr+HWEwstA/LQylRFfyX8kznBM=; b=PHLpIrEL18iyC7v/GpJnMKg5rA
	1ewSssBpPSB10ZP8sLA0/jXI32z2sYAPW090eLvLXtXprKoLsZrlxjGuOiYl+gweQ4XyOxc4dsep5
	9HJIwRKYRGo4kWEsdMiLfmQNaDmgurLbMiE2ppc9/g5JPjH5vEl/iTuikcy4xrp63Fi3JVjuoo5o7
	HtE1Ns+7Mfv7xo81f6j12bhMIJFRS1ohj7geWI1QgxVbPGRuftxBSQrEYyHjm0GNW8Oc8hCB4T6/5
	dGewkM0gS/wwLF02ycAqujLe9rHojtDr06a33ghKr34Exl6JF2Vr1+Vum0r4otvDrmM9UED7C3ziw
	sfLrZQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZL-00000008D7s-2HSW;
	Fri, 02 Jan 2026 12:47:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZI-00000008D5g-2qGT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:47:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwBj784387
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2FNQhzf6ahf
	q20fonXr+HWEwstA/LQylRFfyX8kznBM=; b=hOCfMasnxBg0lmVufaPncagCllo
	0vynqP2KGHBEkaLOgnRbMvGt2ji+dLTUMx2gzb68f2L5mkqT3D46ypvndnkmWeBu
	RgExyXkEAzIqxh0dZj+Jdc3mu1onDcr2kpTJJqGdsB2UMJszEfBG6BaJJoLY5MVB
	gK08t17gNWERp+LYH88fmO/8gL57f+fUr9aH95rRcWrwlBR/kwPWpY+KZeyj48WL
	mZaotQRG+xwZ7Imew2PUDQu+dnku1Io7vy/92hbqUCKg7GNXNBBMZKgPlq9ZyKvl
	ZXRPmb7TDxYJNfhboSNegmZ41CygqKRNWbhna1CkrJYbKlzFTf8Y4ncwGrw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtkdtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:47:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a360b8096so323903076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358067; x=1767962867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FNQhzf6ahfq20fonXr+HWEwstA/LQylRFfyX8kznBM=;
        b=NQef7YRbYQ1N+BClqwuDe+AHpY2lJEo7im0Swb5NVaD/NzjS/GWdlTLDmYl6JYwe6w
         fXY1QAXzBFGoFj/hcugplgJq5CgGzN0UJU29qUj7fEkJftOp/+S7Z86DQeXArGBSIdS4
         TPj8zgqMU27zWDLVdaTThanyUvuCEllkFXUI7sAepwKREmsXy5yq8VL0W4qZluYBhUyI
         4xAg7KZ0LuWAgFUjeyG0o73/wODIBeovSmBshn1reEh6GMMztdluOZ+zVicF6CcNfLE5
         ofdOR3m01wMzPzVicOFuTli1sQVVxHD6DzwoR/zRRMcCaH4cOEX3MTGdfce5tirVqwST
         xWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358067; x=1767962867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2FNQhzf6ahfq20fonXr+HWEwstA/LQylRFfyX8kznBM=;
        b=iOqlrOg+BTs127RKv6wvpws/AbJboUkxBCGR9hyxxT8nsP+NK1kb0fZ49zUoW2vCZD
         MUb0cI68gzLAgiarUTEl8CAvhVXzOmCpvJoA5wr1/Gh/7bDfkvF3WixqF2GKN+cEB4Oq
         tzms3Bf68PWD7ye5qj2vWw1+5hM6t1SbgeuCtF54Ys9kFuPkRFos9prvNJ0afVPcUk1c
         eNlYqROOSRUHV99hB3w8rMpisWqAMvtRQ3hqwQmAgStpGjyKCKw98nB52bMcnQ/ODm+Z
         YBIDNibgLCkiOqo4x0ZpaxW90b0vcg6cxGaPZlvUfFhkfydYOYAnG06vuDibSzvm0B5n
         zCsA==
X-Forwarded-Encrypted: i=1; AJvYcCUVSD6Oiil3OVDb1kMNoOflE9nNg3wghta23HC1FgkStT2Q3YtwvY1mfzrkSmkk0DsNL3KERq1cUNwfM5MS6Vle@lists.infradead.org
X-Gm-Message-State: AOJu0YzwZBimZrrPys19p9qIYv5bC5vWg1h+W0xuG8+RmeFOk8ngTo9E
	b3iHw9wyHga+Gv0/Q5Hs0n7gyoLuj2hPhqKW9VDTpgZVPAj6vmZcCWIoWju4AqK5f3p+U08SwMK
	o86Xm1HrYA7wzS3a5eRYq3mbN89KKFjpqPzBP78DhfHo1GD1UZbJWz9nwZwPeFDqSq9y8lFVME9
	vVUQ==
X-Gm-Gg: AY/fxX5fqg0M1POq7iv/6D2flKLdZfHbvghh7pZh3LrrY+2iWcj6d2QOvcTeOsGiRep
	vgtyAuazB+rA8FagI/hVESr2718L1qWjc4gPmo5JRzkm7rNxEMCrK+UQyO5MfftM1q8EiwQWyPX
	+j5oPd10zbiOEfm7GZI4i7XyeYUrpcYR6IvNXO9/vsU9k1WGkg09KwEZVbCnekVlDd9BldXDBG+
	+GB5pddAfu3t+LWUJGBLybKdKmPQBnhui8NzB0siWBCt3+xdOOeyI3cSJFsjoLPg5l6kLKH3SvN
	jQfwjW5bhBMzH+gUM0zU75aA+wtbEVO3dO6+AOM2PSpKoMeDc4mXhIUqT1+4lqY4dH2YGJaNrTS
	KvsjAKLz7zSNn1dGcCLBUWfMRvw==
X-Received: by 2002:a05:622a:588e:b0:4ec:f6ae:d5d9 with SMTP id d75a77b69052e-4f4abd9768bmr607900931cf.39.1767358067076;
        Fri, 02 Jan 2026 04:47:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYpUBM2Hp4RZu4YPG0tsgKOAN4use3Y7H4NDLEwd9pB1QIJpcvpu5SULMlrtaDOPHhrtmtiA==
X-Received: by 2002:a05:622a:588e:b0:4ec:f6ae:d5d9 with SMTP id d75a77b69052e-4f4abd9768bmr607900741cf.39.1767358066694;
        Fri, 02 Jan 2026 04:47:46 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm80255991f8f.2.2026.01.02.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:47:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 4/5] soc: ti: knav: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:47:33 +0100
Message-ID: <20260102124729.63964-9-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2596; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6cwyl7mOF4l0og/oLUSrt/FKDQGGxj4ChRhtTG/qKbA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV75m789vZm2YSeIWIDZNY1kBqJSTdxLuJ1e/y
 xxlEDT6we6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+ZgAKCRDBN2bmhouD
 1wxKD/42NdwmBpsq9Cv2UznonYs9A+OVRZgsoAPRGbHglqgEmaKevjZYCOaDa4b4NC8BPj0Lsdf
 ecQf0kBuhKU8k0sEStAyhPZFbt8OG56DFO8J9j9j117c8WEYIGeDNUKI0OZWu+ZHFIWPPv9ObCy
 z8R+CscpWTQXe3suu0t1lVfWWaJTp0rIokOC2bFqt4H8sSkEs5GHkM6EI40KV5JMjj+sa05daA+
 WVIrJJWQQMAS1mlVeqKsl+oLB2TmJldYb4zTKaq0SVCZF9tqhu3m17htNz4hQjnIdgxiGt7/xqV
 yZ/Kt4rLlHwd+l3FxJUB4ObYo4wpikRgxeiDTGDWSwxlEcqgOmYMKYq/cKNRSwN4MTDi5YZ7f62
 vs18FZqzGvFAiJDWV8WJ1CZXmlmyHfQKqee/vGSMPU7SvnuOTQac0O1ScEwPeFEKKtulNLw92bg
 Q9q7hMvvXZ3ZKdfylnn9iDL0MBYbH1Jwp/ne18OjySIHm1UQTgT4w2+FS0V+XnMA6NOvvV3RvOX
 W5Uk2bP0jloQ7rwIwO9LiN2VqGVD2u6nIpXv4BqEpp20YZ3YWe29eJuYx7cJfQF+brmgNlrfCag
 TIUu3nNegfnyhvXbXDvTwWOa/hIdyiGBR3Nc7T+4y2z93gsl7eFdqFgyvMTl6sA47alZkqOoCMS 4Owy1Cty78Ku8MQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957be73 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FONaIXkb0SStj4dci8UA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Eo0VfYog86y0f3cOGbMBiRD9CJJ7ilCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX8FO6Oq3lVTJV
 Joca5uvHLU21Rc/BgkxhJsgeJX+HeDnVNIBsEmsr554k0+C1fxDMC/mYguaMzrZbtGoOA4VFY4b
 V/MIeaSGlc5vBcBsCSAMqmNhwzUNTEOAw2vXSB3qcSmKfgcQ/OFSsoEqyC9NBG/VJ/hefAt+AtH
 B4YlhrtwwiY6YVh6eK167DB1JuSItIQHcQi7sEkupeU89Q3ROxO5Xhc/63pCKzKXNwL1ZRRyn87
 hKlfKfOhZIzaRdIsbZHcQ3QvbtObIMw2iU2Q7Y/gxRr77V1LPUelk+ZK0wPtX0hJJUpNUWBvwON
 ZF9nvuzt9G8wWni+4qZSZGQ7i4CCMvej1Qt8npr/1xkD5b7gn/MoHVos4+fCyLmNe4WjWzLTXf8
 +im+8AEZ4XWqmz1OGFIP13dU76WVB76IxH6x4n2wcqGPWVc8DVL2LpvbWNTcGMg6JmKPybLZCF3
 +xYIXqk8K09O0cj4p3w==
X-Proofpoint-GUID: Eo0VfYog86y0f3cOGbMBiRD9CJJ7ilCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044748_832336_56F66093 
X-CRM114-Status: GOOD (  15.53  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index ff097a1531a9..86d7a9c9ae01 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1079,7 +1079,6 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
 	struct device_node *regions __free(device_node) =
 			of_get_child_by_name(node, "descriptor-regions");
 	struct knav_region *region;
-	struct device_node *child;
 	u32 temp[2];
 	int ret;
 
@@ -1087,12 +1086,10 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
 		return dev_err_probe(dev, -ENODEV,
 				     "descriptor-regions not specified\n");
 
-	for_each_child_of_node(regions, child) {
+	for_each_child_of_node_scoped(regions, child) {
 		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
-		if (!region) {
-			of_node_put(child);
+		if (!region)
 			return -ENOMEM;
-		}
 
 		region->name = knav_queue_find_name(child);
 		of_property_read_u32(child, "id", &region->id);
@@ -1396,7 +1393,6 @@ static int knav_queue_init_qmgrs(struct knav_device *kdev,
 	struct device_node *qmgrs __free(device_node) =
 			of_get_child_by_name(node, "qmgrs");
 	struct knav_qmgr_info *qmgr;
-	struct device_node *child;
 	u32 temp[2];
 	int ret;
 
@@ -1404,12 +1400,10 @@ static int knav_queue_init_qmgrs(struct knav_device *kdev,
 		return dev_err_probe(dev, -ENODEV,
 				     "queue manager info not specified\n");
 
-	for_each_child_of_node(qmgrs, child) {
+	for_each_child_of_node_scoped(qmgrs, child) {
 		qmgr = devm_kzalloc(dev, sizeof(*qmgr), GFP_KERNEL);
-		if (!qmgr) {
-			of_node_put(child);
+		if (!qmgr)
 			return -ENOMEM;
-		}
 
 		ret = of_property_read_u32_array(child, "managed-queues",
 						 temp, 2);
@@ -1501,14 +1495,12 @@ static int knav_queue_init_pdsps(struct knav_device *kdev,
 {
 	struct device *dev = kdev->dev;
 	struct knav_pdsp_info *pdsp;
-	struct device_node *child;
 
-	for_each_child_of_node(pdsps, child) {
+	for_each_child_of_node_scoped(pdsps, child) {
 		pdsp = devm_kzalloc(dev, sizeof(*pdsp), GFP_KERNEL);
-		if (!pdsp) {
-			of_node_put(child);
+		if (!pdsp)
 			return -ENOMEM;
-		}
+
 		pdsp->name = knav_queue_find_name(child);
 		pdsp->iram =
 			knav_queue_map_reg(kdev, child,
-- 
2.51.0


