Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC3EE7544B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB51X9ls6I=; b=aHseskahT4pbxTeK/zQmJbgEs/
	2bLjORY+0NhPXJ/oA5oiLCrK8LGA+a/bqij6437ohz5utC8EYyh0Bl3bTyBb8FRI0o6WnnN84TCGt
	S5Mj/8VG1QtMeKMV4C1+MKMbuwO/yhz9tnLRElk2aoi35/YKoGKlakRtaG/KqYJnfZhV1nGUF94lw
	L6VdGn4gxx+gCi1BbvHmekA3kT1sQnmcpFsOEWNYZozXRt6LqVJB8OsrCZ81WtPNacvobvO+7inXq
	X/GwEgXbQ5Q3vNsn3pxNW2mJOeHRf3DKRYzbEOHJZ/SOc3VBZqaUbZo/I/z6DXnvqw94LZVzNn4n5
	Ca0o6wGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOEM-0000000Gnsk-3wnW;
	Wed, 24 Dec 2025 12:44:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOEL-0000000Gnr2-1DlH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:44:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8Rfdn722345
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB
	51X9ls6I=; b=fldrpCj+zA9Q7h/0byn4xtx/X+g2HVNthktaN8KT3CGaPx18Eeu
	ZhgJsqk+U2LEM5K848P1u9lcbDdFs/Khx/O6Svo+Whi74m1Mpo2HVFq1ZyRbaFm7
	FR+LI/bJ210Qj95lb2XVxhhV4IiAM/dhKI29cjmc5z9G0QcpqRsMDKqMEnnk9vdW
	USDUGebEx5Bm3wxnkkWgHGHUJTWuTq1VVLSx/i9AvMFY5ir8V7JBPvubHtnWW3Hr
	QcBZauX+sDL4uoJQt4t2tHim/XbTLT8JdR4dZ/GjRpYAwhDkmTQ3+B/IBpt2U0Xb
	kcDr/k7K10BXVAahHytAxbDKQ+4kgg96tnQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mta7vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so164048021cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580279; x=1767185079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB51X9ls6I=;
        b=QGDUUMXef7tTMkZkhDP8FBxMExQ/poD9gDO5WrbicCwYeH+YyuMmkWPx4VLcMakOAl
         8t/hvn9gBXrQtulNurtlTe8s27nYusHmBsJ3hnGrvqavOlDF2aGVNYyEi1Ikj2wod/Cc
         uCHkX9agQQWUd01RVxxsZHwXEtzKwkdBt3IBldfQMa39aHsvz2beY9UO4YAI/2b9Aky0
         o1+PImfasgDNL1sMW1ofyPGHeQExXAXK+N5gnqPze8YT91ojLH9tS7Mw/vKnY8XJSfwy
         UhEK+HaM0609vhQiJsRgpsgZ5mEEjy6wlmJl93pNkGmNNzQ5iEmDAz+TLvtejoE/furY
         PjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580279; x=1767185079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB51X9ls6I=;
        b=YuGPqaccojyImyYMtQ6Plfotx+IgcJROfemW/QTHBesPCP7nKxBDjX8JSZO2WY8WPa
         CRN7o1CbVTBlR0xwsXFxXzEbOeDlJ2sr9N48zSYLcrSOjdT3vF+7pZCbximjBc/57fRj
         NJqAK2JM0Ra/uziluXuRIdAqfB/Q1JU00foxSjE0a0JdYaV4t9gmxrW5Zcbg5QJFcUFu
         jGZsucyOrxhk3r+oq8aNGfzrU3Sgg4kBHUwzDPfDFplyk2v0n8p7VAdAkoxk/S2p8a6W
         6/Rn30gc+EQr7VjPqlEgYYIJNdj6u6e+71NnDWEZtPJbQAUAZu05T8w56jDx5YpcxK3o
         4LPA==
X-Forwarded-Encrypted: i=1; AJvYcCV/uxaE39SZ0kjYkpX8P+VdcxThAFfqNJuofZv8W6+nC6Mm2RT4tjfFZKYSMjh1I3SKiDhd1Sx4Fr+s9PGNWtcK@lists.infradead.org
X-Gm-Message-State: AOJu0YxddfKPkal0Lsb1dHvkRmaziTDm7Q0TFgqTkoER+lk0Xbmhn/Nn
	HAayOyKwkPy1rKpQLgyKl5s6XK+Tk0+BFouDfrqEqePKB3nJCrxgpc0G+U0OLOGU8gW4r43zjCP
	/Lw+uuCxJobqdoUXtd6vH4b57Y7H3oHoy+9WTDS1W806zqj9ORaB2V5owgsNlbTp/Zaot/Wcsd+
	Uthg==
X-Gm-Gg: AY/fxX5sAtfSPSUP9pDgdhvfwJPlJf6vlsYb1JRJTPAaEOv8UZoGUaezXeVEIjSDfiD
	tRQfICkNaVrO1q1OfF2EdU4x4s1+kWmufGdar2VlIYPl+WMrerksmV9qRNcZyS8wfG1c4XgPmdj
	XnAlZGLArlC690R7mh8CVP/QoCKr24qlOgUn4geFfYXYgWcqUcpZvTrtczrdavmoz3xQG4CujAi
	tCVogEgqYHBAA7u9R/AYFMFKFw/eP3E3G3cRSSyEnZt8uk1CloV47veo0A/NCxCBhiMdzPBt5rV
	YKGD551crfzFJM9PFSMT8+U1SLEYOMUKLOvxsz0iY3LdGS5VbmdHgyarFXsWvW6xohoKGCxqj7Z
	m77yyGXK6kShYk2m0aOAQWXikgHGeXSiOFWeTHWrI13pYaDtA+xxf/jy57rZ+bxm49YEgyg==
X-Received: by 2002:a05:622a:1c0b:b0:4e7:2dac:95b7 with SMTP id d75a77b69052e-4f4abd2b668mr288448921cf.37.1766580279320;
        Wed, 24 Dec 2025 04:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+NA1y+53V5FjdDZScyPo8qs3w+gs5u6C1SMipwvVq0kLIBUeyMoHc8CouFvb8Es/3VC8oWA==
X-Received: by 2002:a05:622a:1c0b:b0:4e7:2dac:95b7 with SMTP id d75a77b69052e-4f4abd2b668mr288448641cf.37.1766580278931;
        Wed, 24 Dec 2025 04:44:38 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/4] mmc: atmel-mci: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:32 +0100
Message-ID: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yM7PsCJOfo1O8B7Z+MHBYKtQYFgSA+XM28CKwgjSXg0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AvGomzzRiYXzxCRUVc56q7ljsbdKRtMaPH+
 BmIj4M47laJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgLwAKCRDBN2bmhouD
 1wBbD/91aQO1mFxSqslLTeFr4Dl5APuLTTk/ILf/WeP5bXwicwB+MKjkIBB/JMvW4h/70qH6Z0x
 l09ct2wktyCrkWbBXtou6V1Y7rQsfK5mBLfeoxl2z/dp0pdlPJ+qsTGLXvYBdllFC+pDR+g2a0z
 CfRUHflxj7UxVculnSnhluQuS2OrR3hG3fGC4hSE0ZHz3Cz91jZDiaif43yekqT14EMViCjISYR
 H6kMCEtvfb0MIxvAWqKiV5Q1h8khWIqVX12yPrf4VBGyBBXHt7B3QZfYeHKZCJsaDfOsJkUV6AM
 AVVwK/wByZHE6ifGhM6wfijBfJ14+RW5pP0GKmymxenVLVK5UfT5BzLb4k3GG33U50rZduZkfnw
 eb4Bs1IFB38KkbXmaqGOKFwpSesJzlAy+im5tpxruX59GaZgLflrwRxkG/bi3jqwRV0yBpjGzuF
 e+/PdMNsicVjYO+w6R3MtfXc57BiM4CTKFuJNIf370wI4+L+0KQiLwvsmMV2BaSLDHHNL0JKSsj
 vjYF2o3X8hNSkyG45ET2MNOjWnEdUMSgjSbImKE/Z7lsX1lkdTiF0tjBDqlqNie+zMUsjPkQVH9
 qVzme2ry1K2D/fe6OqB4TZTznqd3WBI5cl4kmaZ5rzs+cDgLAacpGV20A9n3wfVZMEiM9MBVLDA KYGhqVe3L36+D5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694be037 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8ZTf1ciMPyF_Hyv9z0sA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: p949W05TwO_qCwGLzc7ONeKRrvHObaoc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXx3UuCSZg97+e
 0zCqRRGCTFgwJyI/dcMEX/WCi7QYVWa1SHma5D6sasaQY/iQHHWE+BtTmXKXoJePIpdu69FMikw
 VLUmPbuC1y+OcWlT2illqQ1fIsaWRJ5XTiOzLff49buwYH0FFucf4tIjD3o2gY4zzVfgJj76s/A
 0Gx1mFBBqWOrwcwj5JLVMP0l7ZX6ClnA3cdpMqKqtD0VanHvpPR246as82258UUdQcLRxsBBIFf
 AU9gYx1TLfVSC7O4ssccLXQSMt7GT9fpqK+jLgJxUCNi2v14l5Q92dcUF3dqgr3rDRTOXY2ZAYS
 htlvUNNytHndrWzkNwO9Hs9OazykfDSVJhY2G7FOL0LSrwOr1Qc+jgHtvH8dY3ajM2WPr6F3hqi
 fNDq6azJ3Eo1WFddo6gPHX5Pni9euMt7QuFN8/fmwhK13eEES+zsn84IytMBI44kvoGsa6w5rOC
 GTTcxXU6Ims8BDEz+ig==
X-Proofpoint-ORIG-GUID: p949W05TwO_qCwGLzc7ONeKRrvHObaoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044441_470295_B346D1FF 
X-CRM114-Status: GOOD (  16.45  )
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
 drivers/mmc/host/atmel-mci.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index fdf6926ea468..3b4928f5b9b2 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -629,14 +629,13 @@ static int atmci_of_init(struct atmel_mci *host)
 {
 	struct device *dev = host->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *cnp;
 	u32 slot_id;
 	int err;
 
 	if (!np)
 		return dev_err_probe(dev, -EINVAL, "device node not found\n");
 
-	for_each_child_of_node(np, cnp) {
+	for_each_child_of_node_scoped(np, cnp) {
 		if (of_property_read_u32(cnp, "reg", &slot_id)) {
 			dev_warn(dev, "reg property is missing for %pOF\n", cnp);
 			continue;
@@ -645,7 +644,6 @@ static int atmci_of_init(struct atmel_mci *host)
 		if (slot_id >= ATMCI_MAX_NR_SLOTS) {
 			dev_warn(dev, "can't have more than %d slots\n",
 			         ATMCI_MAX_NR_SLOTS);
-			of_node_put(cnp);
 			break;
 		}
 
@@ -658,10 +656,8 @@ static int atmci_of_init(struct atmel_mci *host)
 					      "cd", GPIOD_IN, "cd-gpios");
 		err = PTR_ERR_OR_ZERO(host->pdata[slot_id].detect_pin);
 		if (err) {
-			if (err != -ENOENT) {
-				of_node_put(cnp);
+			if (err != -ENOENT)
 				return err;
-			}
 			host->pdata[slot_id].detect_pin = NULL;
 		}
 
@@ -673,10 +669,8 @@ static int atmci_of_init(struct atmel_mci *host)
 					      "wp", GPIOD_IN, "wp-gpios");
 		err = PTR_ERR_OR_ZERO(host->pdata[slot_id].wp_pin);
 		if (err) {
-			if (err != -ENOENT) {
-				of_node_put(cnp);
+			if (err != -ENOENT)
 				return err;
-			}
 			host->pdata[slot_id].wp_pin = NULL;
 		}
 	}
-- 
2.51.0


