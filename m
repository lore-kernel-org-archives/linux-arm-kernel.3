Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D50FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LG+5EV20Kf7YfOrg/iQ66xV6Iu+58ojLCvQhQXDAPpE=; b=iDZKpSuosqTfehHqTflLDwe3x3
	Sg3mFa+ROr7szlwWas5MXn87l+1nLfek55nOsQXPZOYsL54LpiA1qWTD34/pH46VRLaWR5KwGeg5E
	C4PH0iHdDivweCHX+sSzgfXbbmQ8vs5n4SKYMy7E3XmC1Dsi2+9LcXrpTLSMlkcxVQKj7cGpkatd5
	PH9zF+FCuoUwjwfRmS9MpjNdvtJPTbAGVHCtcU2GbKh9hzSQ4inHsB79llSxv+iFJAKuycYCXKXxo
	eBqa8hG9KXpbka9FqEG3A3kiq/aMmft0i9cGie2yTMAzqL3ah0X1dRW7CvLcBSnbRGKvwd8zawdan
	BkLg/wEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZe-00000008DHA-03NU;
	Fri, 02 Jan 2026 12:48:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZb-00000008DFG-1VHd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:48:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vw9S784382
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LG+5EV20Kf7YfOrg/iQ66xV6Iu+58ojLCvQ
	hQXDAPpE=; b=gN5WxvvTeUYGDMQ/85VUv18uqRaFKcMBko9yn91K61fJfLi357U
	eTD23qBJGxYxZ0yKMkYXMCd9+lbrvTIUxIBiXd8b1qtxIuN3nyGpFw46JvvvRb4R
	QnCzr6Ro3mziK/vxpA2Nib9rxd8ejhCNbeFayzfLNkVhQPyl/icGw6q4MY/coGCL
	VsDS/8IF8O8OqzANTPrDZcB3lakSfvjxQZ8v8/VqTPugunCYxKAcjqzrVfnSiAwx
	t8vtNOQwmJU+3EjfFiiLnLf5NORfCpCRm5cpzFz7yf8litjdN6AQpodX7suXNoz4
	ICC+pzlUIjxSo0NhEM/pJruati3Vsj3tBQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtkdup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:48:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fb2f0cb59bso67816131cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358086; x=1767962886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LG+5EV20Kf7YfOrg/iQ66xV6Iu+58ojLCvQhQXDAPpE=;
        b=N7anmhc74Wi/OWW9TJvDJiscQcp3n19iF79mGeCG4ue9vxS8AzW9GRIMFAeKBUkFi0
         H1rTJGiviRXO/YKtE/3c+DHfERs2vs1QeIfvSuPM+fgqshUR8UJZdl+6M1EWZDr3hmPI
         OsVXTEQhWGiQc8nqgzZkfuI85TyQvyBHiXFcaMer8F8FdWqdbp6iL/RTJjtNG0f8qjzW
         sIo5vSlPvnHbIHCK1H9ZKYWvdhw/o2XkgWeNIyD+dn5qjI0Uda/SAOkD23yEuw5yyMBC
         rUsjk0C96s9wykXAp9Qzbu/ycMQ+1K21NeDMzOJTIiJbfKwV8IXk2Zwnx4lyNEQ1HNGf
         7hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358086; x=1767962886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG+5EV20Kf7YfOrg/iQ66xV6Iu+58ojLCvQhQXDAPpE=;
        b=q8mjx2HUi0IiGsriooE523odkR6K/5zDllHmhBKR4K6KLrmOtWyZtss4gZOFVNgqQr
         p1dzRqafMFYzahOyTXTWymde3xpdxr1cPfeGXvxI+Rc85NtR89yCwEK5Qv9URi3qdMHs
         l/We7nEvrBLgZN8KF61wUrUg1a5HcAj1j5QMP5lrz6VRIZ9AkrGmW7OqApmOXKGXx3jQ
         EShSLdcC2hwLfdMQtjaFWEXqPGLAec/yf7smabOb6ROGQtuSJ/O+wHsYmOJ++ZBynWMf
         hQb13UIMwb/3LBafnufg/O7b+yUR++PoZw5XIeQpEj0+TABukR/WvUfbMHCHWNDuDKvg
         bEVw==
X-Forwarded-Encrypted: i=1; AJvYcCXWxApS9Qd3dGJa6O8HKyWrJv4Re3/GmXWO+chMtem797u4FRnTMhdYVG25I87SXlOmT41ZbGkz7k0XsoovL8M0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz89jQAoYey+9a4m5hrQwaOLTH2/AYaWTIdcw+50C5sYhKatJg1
	kFSno8Q4bb4epTxOSNSm4XQuU9shGbr00ZYkLX/MPMw7JIUNgYdM1FM5/weUcSy1X2XY7lFZQSe
	pzBr5DtiM1LnUme+7Dqb8DAQ5mTFpyBTOApD/X22tOVL0Nhx3JUS7vGa0vfQKtN8yC6ETOQS/dt
	jRXw==
X-Gm-Gg: AY/fxX4O8hKFV+wl5MZwzs9+2RZqkElDF0sj8phPSd5Lfd0VPBBNHl18gVwPW3RPZhj
	buq71PadfsOiid/Henwugl6HMK6FSxMLBhjIhchahjQo+ZdY7aGb/ntC6g5udf7oS2J7EZEZf7g
	TK5uo+SJ685LIzMzRNE/Nr0XhnoCm0f/DVNPa6mekdNltwnqeu/XdZP0YrXE3ezLvIWgjL+MLa1
	+2tuc53GYNQjB6gt5zpdNET0c8VokOChpsUWAm0dGvzfjwzcjXz+YpMECUqMbIo9DLXN9NYCRn8
	ECPITbf82IDUtBismDvip9dEyVB6eKQsOwFbB5RSqZDLekg9b2htaScm9iDEs5nMr5bG2ogN17g
	PvLvAcYxE4mWS4QV9JGbJbZ8GBA==
X-Received: by 2002:a05:622a:48c:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-4f4abcf6f52mr622101481cf.3.1767358085857;
        Fri, 02 Jan 2026 04:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEl1gDkXmJETUI6pNjUBq7DM31/SHDA6A7E9qH1klKOyEC4JY+85uFEukIq2OL/ySQThcYHw==
X-Received: by 2002:a05:622a:48c:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-4f4abcf6f52mr622101371cf.3.1767358085500;
        Fri, 02 Jan 2026 04:48:05 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa2bdfsm85469932f8f.32.2026.01.02.04.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] soc: dove: pmu: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:02 +0100
Message-ID: <20260102124801.64172-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7tL8R3XBOV3TJrdOu/yge/Nf15Rfn4kacsfksffNMjA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76BSE9ltqzt0ZZCGh/J+2QooX5MZgD5MeE8X
 Qw6WnyPsM+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+gQAKCRDBN2bmhouD
 1+TqD/9E4HP7SMhBm6AV2xJrva5BTitTHxe7ALgWfHM9fdgxybakHMd+cc9dTh0GW6/6d1ThBie
 9yN/uRzWZv5MJ0W1XtkWdT4UDLYCJSww1SyoRk94TAi8Xcf8QMZ2vfMZ9DPP/dERB67Zrar7Zex
 45wsLazObKG9KeRih6vY5cxD1y0p/hDWwucLm6EaQ7u+pR08V7KwbF1faQQgPeroGOLxXuF/kqm
 iElKaxEzoYLdZBFc3jSUJVdDlGzLt+5biRgnnXsoWqwTsCeNGZ1KSdSztodmpvG1fL2CW6zgGxC
 7O5WscLI+qV/DmMal1hKNKnlGUe4Y4jRO9nAofHn++D8mrPBfrBQ61Z2jJefrcDa863dlNtkepk
 x73OkgpJj4/HlJvFhXEK0wCz8/e0QFeyZh5dYDpf80UIS5vgeGqRj+2Hi14mBean4uLv3D1TU2x
 t7n0Adpop+Qz25Y9O4You7sVUXZIYgE4uO51oY4HlBgXbrdt83zPVwJLRS3QciPdKHizYfTT+hW
 wC5sWWCDdFxJ6bngtUxWd31oOclQSXHIFyF/Frz+UgGy7jyc6cHhCfFoQRxls63XOEQglIuC0v5
 o3hAtIUK0YuOYCxrvsKB7Q/DmApPgQ+8zdSrOdFSNnJqi1V49LV2DV+Swaa3bGwTITqd1wQiV6Z Aw1iSY92cKaWtpw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957be86 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FSK7MHsD3VO0KL9OqHAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Esuz_z_RDGim-tvHAgrhRNv9XKHkqvLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX0wYerTkP/eR7
 diYE9SdBY2ucVv0UkpB/GV0eL5382RHYcM2vyR0SP9ZmrZeAoBPiFvzRRa/t9EhTqRgaFFwIsj/
 mQr9noXLJ1W23gN37hYxWSQla2YKOW7T4bDA/o+2mAbVs5cT5DY9+P5Eg/h2JoEwvsGchjN1Q6o
 4qpFzNBmxSVueLTgepZFnC8U86ECu8vr8OewSZBkbPVDZlAn7jBJAcSLk3rsOr8SoCUZkfjCxnK
 V5Oy/0YLdP0cVBSENcKsqufWPPx9U+YUUiGfm8eARsdANua8cO1xkJWscf1BeFjoqGZPybM3xVl
 aWy69Gl4tSeZP9lKII8ewEGWn2sbuqxW+TglpqCH5AJ+eGunOmvgQC6G9pB7y/dTNgcZ6e+cBXG
 x8ZzWzVg8mhCCGuMax+BMVEzlsLlIZVtvwIiM5lh/aJTvOgu2kTgKhQCo4Xlc0aMtlYzTuEpQWu
 zDWX+4BnDEiG7EU0/vQ==
X-Proofpoint-GUID: Esuz_z_RDGim-tvHAgrhRNv9XKHkqvLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044807_520274_F08FA86E 
X-CRM114-Status: GOOD (  15.06  )
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
 drivers/soc/dove/pmu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/dove/pmu.c b/drivers/soc/dove/pmu.c
index 7bbd3f940e4d..dd8ade8e9ee8 100644
--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -371,7 +371,7 @@ int __init dove_init_pmu_legacy(const struct dove_pmu_initdata *initdata)
  */
 int __init dove_init_pmu(void)
 {
-	struct device_node *np_pmu, *domains_node, *np;
+	struct device_node *np_pmu, *domains_node;
 	struct pmu_data *pmu;
 	int ret, parent_irq;
 
@@ -404,21 +404,18 @@ int __init dove_init_pmu(void)
 
 	pmu_reset_init(pmu);
 
-	for_each_available_child_of_node(domains_node, np) {
+	for_each_available_child_of_node_scoped(domains_node, np) {
 		struct of_phandle_args args;
 		struct pmu_domain *domain;
 
 		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
-		if (!domain) {
-			of_node_put(np);
+		if (!domain)
 			break;
-		}
 
 		domain->pmu = pmu;
 		domain->base.name = kasprintf(GFP_KERNEL, "%pOFn", np);
 		if (!domain->base.name) {
 			kfree(domain);
-			of_node_put(np);
 			break;
 		}
 
-- 
2.51.0


