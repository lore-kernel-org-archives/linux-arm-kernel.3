Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AFDFA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAff9gnFS+dOPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=; b=jXyeLYnaA7F2VSIelFOwjm8wOF
	ReCJR41TgMgQ/+rU7tZwEnzqaaMWrIkQkw2vUPZ8yuZTBzqsPvyHfg1O7WUlBpyuc9+k5ceC6fJZm
	qlkxnli7embSMOBgLRJa53TzOnO0da2jKNbsTEFFPv2gqZXtArqUXpSwSUGnRacUp2nQvL18/6M2M
	fOyL4LVUEAA2dGOYbMwg9f3vw82W9d1qnUSc0pzEq3EJ2zauOoofWDk4mOztPnU2pjcgcKC6OXFQk
	NQPewtJPdLDvRvvSU+7Li3n+uY/yBykBbDDlQqaxeXD8HsRM4HbDlsb8wgDRfdWqTmGryFljBzx/C
	DgnFE+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbea6-00000008DX3-3Dzn;
	Fri, 02 Jan 2026 12:48:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbea3-00000008DUJ-3qno
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:48:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W1Nt1002029
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cAff9gnFS+d
	OPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=; b=arGyuKGmW9q4VINX3ZhQ/GjdfuE
	ZGLuvDa57qe9W1z0oYoe8mnHnIM6ucOLc/HqS74TODNt6TiBn10ciTBxeo4m4sKR
	Reo1FvhI1pzRiQGFnRs1aVmrUZCr+ZthcKthdAlf4fFl6xHMb4uH2BHL4dFCPlgd
	C54IHjopQhFpBvdX0gIM59AcRnsNDJ9iX31aTpkqr4R6VBQQlt0N7CS7rORCwvE2
	EIQzQg4b0eWkUYOaAY/Uj9QTXf979UGPCciqunc48HUkqrYxSHyYy1/E+aEMI+s+
	XIxi1Bl910ieMWus2NuDGHjnHcTTTu922Pi6l+swCOFFZLadx+dFgFXj2Pw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb3y97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:48:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890586c53e0so528296d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358114; x=1767962914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAff9gnFS+dOPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=;
        b=XdhoswUKONsjbo7musuKMz69tIvVDQLpxiMVQW6FQtcyPui207orHm0BpT7Q2h4PW3
         1gGiKgDOmB1z+NDPoXkL7fLuswiriMwt6H1IYdq9ZgzaXgD2UI9fcV/8lZF3D03h5iZ9
         Ck9eV3vDWs5qMWQ2rGaDl0iT29F8O+1/GQROe+Z+PsQhdwHYBBqkVcUQn32nCOpx8nFC
         fPyKKYL2AOZGJKk6XMTMg3u0W+URiahwi/Feq5sDleru0UuaABktnf7jbl9ULhPpbXEw
         wqlVxD+eX2ojslzESpDQ1dsvcF9Av9gBBFGzzEFPSkM/YwrxUMlDe5RvT6RztT+973Oy
         Tzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358114; x=1767962914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAff9gnFS+dOPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=;
        b=xDpoZUPk+mxEssnlWPwcI7PWYv4YROVuvJFxyWSllQWUENqv+RM28DKZMpf1WHMGJH
         iwErJcc8PXYh1c7UUOeYjo6MROOCsJJLZkghWRkfcWWqujKTf9Z7xCHvvStB3Nk7KNwr
         bjXR4kXlv4X7f0nK0VH6i+Bldoi7nSMfW0CQs2j7zcjPKTnVMEcFR3JDbGucx+7bK5T2
         TYwFBNojAevLHcc+9MOteFE4XiDMhpWIq0qrHRU9ZC7KeuR/aSYhmeu4fKRt19umDWDJ
         Rgl3rr5fo4EZUUhEHYw1X748cwkWUQdOJXXPLrH9EfF2rNf5WQdaoujCgT6Eux6sBegu
         ri9g==
X-Forwarded-Encrypted: i=1; AJvYcCURKz02JRaUK3jA1fp+Xvm0T0kwuuW72t7myyafLJHO5Zal9arTRu5b0ibYaZHpEZHUuU4tnzb6XvNcgjy4gQqg@lists.infradead.org
X-Gm-Message-State: AOJu0YyechmPff/bfjQgIVH5DGYdgaPEfniyfDFX1PhHwcbPgs4cwCQW
	9SQ3vBPAMgw2Ic7wjFIlZVfazEvMdXYZEW1YeoBBY5WzGT4cxKw8nVG1t34/UB7ReMwCYUKmcZp
	WdzNz06k2HqWrVGV5Kp1EXzUIjOvI77b+3qNMu2dZKpJ5JXFzCKIqGXJ4J9kP0+fMTiROrwZ4Gc
	fuixpu5sLYoA==
X-Gm-Gg: AY/fxX5BABzfc+uGk++okeDjjhC225CHih7x9bq1VdxpW3J5i6SAN1MlwRKdmeGzdMq
	0THqXeupeP+IVBJ4CA7JIRIDVwsMWfe/Er/NSNc/0po3oyoM4psDiI5ZnZPD89aI3BTvxG17BhT
	TnHRnzS4vgLzXZa8swTdfZRostZoyJzhrkyGItIq9HQ+uyFiEi5rkdXxWgkQxYg1DxMOHaFwAM7
	22O0xy0Gv4sJKN3mrY79AL3z9PzG1hAz0kjCDwejejxbb+ttC9JQEXv3zKul7cDivKBJ3Afmj/8
	5jzVzAVuhENZ8hEmCHbpdWUymNPh2G3tXnlSGeU0i0PWpfhmoos24jkvvFbjCLu+BP/KGcj/vro
	Y/WAfk7kQngz2pfq0Wz8/1K2Xeg==
X-Received: by 2002:a05:622a:2513:b0:4ee:7ee:df72 with SMTP id d75a77b69052e-4f4abd05fa6mr593342571cf.28.1767358113812;
        Fri, 02 Jan 2026 04:48:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK2STp8WLJC5Hle+lF4ZdajxaBdRXfQ51qO9YgGmzuFliirENLuJlLIuKhEehVcC03kPN+Jw==
X-Received: by 2002:a05:622a:2513:b0:4ee:7ee:df72 with SMTP id d75a77b69052e-4f4abd05fa6mr593342361cf.28.1767358113417;
        Fri, 02 Jan 2026 04:48:33 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm802892105e9.13.2026.01.02.04.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] remoteproc: xlnx_r5: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:29 +0100
Message-ID: <20260102124827.64355-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QahWHckkIWS/P48btoPy5/mXnEzZmMEtu+GtZ6JhcPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76ce0/L5LUrLoAxRfFA7ZnpbXrAEmNsseTBa
 iz5XUAWaBeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+nAAKCRDBN2bmhouD
 1yLHD/9mE24y+JYa3Q0sp01pz5zpq8USEciHpgx2fo03B2s4dO+aQPgc2VfsMZ6cxScJFcr8LXO
 ZoS1j1uiyihJBu0YPiwUnP06uS8/1FT9EjX08Kvjixbup6OM1k9P00yWR3caaltKsKL3b4t20h8
 I9akD5xr0sqDFtTMSYfDFHf4xfp0g88GNKdYPYjkIfVF7nOp8KiDPnI2s7CsTuZkd7EEY81tPSi
 g2t6283gz1dLRKjJxIu1ixz9Jv8rEU3uNoPytqETerJCg3Rit4Qq0SGQk6S6fbnczQ6IZhvcABA
 iyS3/mjJ0iG3LMXJnL47viO4/Yc/5dNRcSQaYwvjYjNMgcEPhdEZRr9sRxO565g6gkEfJ++HyI4
 JHhkCyGMCvbWyOwJ+qIO3kZMbj3XGY72OWLUb+zIePvZqVRRDaccrfAjHP9K2U6sujsLTL8NnUL
 zskfoSFb+vt3E/LmyEV/519GXcqpjeS7y4p6J5tu+WMDsTFkWktxNpP4S2NWNXp3EoTfFmQCgvq
 YV2xjBZRHA4PSKIN/cdA9pNO1kL7BiKbvJhEO6cI8J3+vDH/oyssuOaS/jW0Rux69D7ys8JIyvP
 d00iB8RDkBm7lA8UjUzK6Wz6qs8gQX0FfEJMqWjKwQnLw+x/8oVuscZGC8M9hxeo783A8wFYEyW AWIcIZckiZ6u6Fw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: f62iMDuUBL_A9Z3X4YkD-Xl-pzTGeNlh
X-Proofpoint-ORIG-GUID: f62iMDuUBL_A9Z3X4YkD-Xl-pzTGeNlh
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=6957bea2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=A_p-vGNwsLgjMV31XeQA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX3XMm+RdYrPwo
 HpCWNbQP/7v5PX14i6LkFo+6KIvGFx3ZIoGI+RMOby99UlKU00aR8/f1FIlAaO8rdYOAzVAOgjp
 gP3QfYl9b1KHagq2CHDwlZ1mjAgr+63w7FnfA1ym422S45ZjxwkiUdEvnoaY2q3PAQPDKjek5AN
 SObrdMMOK+XKWS/P+jd6K4edZqLMdFJZdrKoJ7eiHUauqMIG1eCw0CxLVvMB/4dtPFvgoJyQIpd
 hTN7bVvEMCWtB7REyh+WzV1/lCGJXYwQqf5tUIQt+h4XZhc8kSUuJ2qyp+rpt8gnUQ8Ajh6sM/D
 TF1Ledo8h2vCC9/zv1IBnhV2MgK8CGH9NcLaKgOWoYLXWVzwHNywk4IAdBTTpe5vTo/vf2ajo+h
 py0W/dlBS9A95w/qjv6S263dBL4TrgIGu7+w1YHRVrYJvZHsj5GJwq7F+XzTrMyT5rALhois/pc
 MXCC7o8351eauqU2/gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044836_072408_CE4428C2 
X-CRM114-Status: GOOD (  16.62  )
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
 drivers/remoteproc/xlnx_r5_remoteproc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index a7b75235f53e..bd619a6c42aa 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1271,7 +1271,6 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	struct zynqmp_r5_core **r5_cores;
 	enum rpu_oper_mode fw_reg_val;
 	struct device **child_devs;
-	struct device_node *child;
 	enum rpu_tcm_comb tcm_mode;
 	int core_count, ret, i;
 	struct mbox_info *ipi;
@@ -1350,10 +1349,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	}
 
 	i = 0;
-	for_each_available_child_of_node(dev_node, child) {
+	for_each_available_child_of_node_scoped(dev_node, child) {
 		child_pdev = of_find_device_by_node(child);
 		if (!child_pdev) {
-			of_node_put(child);
 			ret = -ENODEV;
 			goto release_r5_cores;
 		}
@@ -1363,7 +1361,6 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		/* create and add remoteproc instance of type struct rproc */
 		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
 		if (IS_ERR(r5_cores[i])) {
-			of_node_put(child);
 			ret = PTR_ERR(r5_cores[i]);
 			r5_cores[i] = NULL;
 			goto release_r5_cores;
@@ -1383,10 +1380,8 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		 * If two child nodes are available in dts in lockstep mode,
 		 * then ignore second child node.
 		 */
-		if (cluster_mode == LOCKSTEP_MODE) {
-			of_node_put(child);
+		if (cluster_mode == LOCKSTEP_MODE)
 			break;
-		}
 
 		i++;
 	}
-- 
2.51.0


