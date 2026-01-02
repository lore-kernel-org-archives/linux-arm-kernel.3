Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC6BFA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rQrbwl6SmdVqWhNW1JcN758niEOl9CpKuKBqxGA0kOA=; b=B3YO7yu7jRNCIHq6+iBmZBDr93
	QN/2Xz/O8aQ3zcI6hIUv817Nxm/nogmC1+y85uQCdsgAYYFwQwwG6SB4lRyy4isTa0q6GL/Iyp8Y+
	b9E2rwIqGD/cTPjvXNnutmPb/9qLJRc8Hzvg+JfR1QJt+b6151+X3/LV9kowUs1spsPsOq4vE//QC
	dQ//ayL9kBa/rWJiW9W5oWRv3wmhN0PSiRP42XPdDccD8NMs003dDX30TUUL4cH4+0UWChSjUrTs2
	r0pbAqe1Mv03K5MMzHwysVqVxa70a1ikrOPBT0LRlW3+JW+L10OS8EKzMtXxYRHa8ACqlOYfoa7k6
	dpi0/0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZW-00000008DCI-0qd8;
	Fri, 02 Jan 2026 12:48:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZU-00000008DB9-2bm6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:48:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W1Ku1002016
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rQrbwl6SmdVqWhNW1JcN758niEOl9CpKuKB
	qxGA0kOA=; b=RE3plvr8h6rM1ecLb9HQA4myYXVKSWq0f8+rHt1kkFZcCd/PUN0
	KUJu+Jn+T7L/0+E/K4R8wjnOTa20Z7ZBd42JSC1C73EAUbAz7E4gkTz3VPzPGQOh
	c5nkTc+fgN7YqrQSnj4QfM3Tc5KmUE/rRx0Cyc9bUXlbyPY35CTZY1mSgkus0Lng
	yqrgl7d8FdSMwqevIKigXfzqJfMhwyO2vtwVShpmVoWZBOz/ViEXmh4QXcN+qmIK
	ukg3v7rkKAV4V21qK3UvIXfNw9j0n959HJzKS0rQIVw/ov5KQQfzmdgHIS6lX8F6
	TkLjzGv8m1KuLfBHfww/5gzCAFmrhnTuFbA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb3y82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:47:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890586c53e0so519706d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358078; x=1767962878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQrbwl6SmdVqWhNW1JcN758niEOl9CpKuKBqxGA0kOA=;
        b=CZUlksbtixGUCmLLc4Rc2xEBDEgJworW2mkQ4ZcXbviM5kHgK+/GDuUMV+k78+LmpO
         Us0Snnrger1cY4aOeHJquZ5YLTMNLQThJ0n9qmMeZ8XRr0xm4v4uJSZzrEIEPCK/2Oc+
         ByN0NN7+bSZv8BP+26UCzNvVuMZsEw9nvIIeeziTXyHcZYJ926j8KPe7BfEjOmT2N2Uk
         kKNVLPaV1an+pWVawrpP7YHh1dJZBzqjh/ZcLrgeqTGZ1MxNMjrz02UyBKWMFjjlYdNG
         3m/GAwgtJGdpgMQvJxInregdNVyZkzrGpAKeUHRG7XhHP3lRO1JvAnSCOob/QL+8Fj4I
         Sm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358078; x=1767962878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQrbwl6SmdVqWhNW1JcN758niEOl9CpKuKBqxGA0kOA=;
        b=aiSmp8hoM7e21XbFKt5FWlrXQacWPHeMZ8dVGkCPxJUrwR3CvWW6Hmg8dKIHY1cHgf
         OOdZlQOoQv6cY9yifNmXz3mM/m6uWduffnlek5USa/ehxINIyBdI5Gh5i9xZK7oaeszO
         syJgJuZMEmZiLqK3++lhR53Vg9IqScZC6Apj/W+JN8H2tOnZJE1Lset2wJunVe615640
         /nfNf/bEQXioE3eqgvVVdPf6iXCAjWcgrUyiaO1r+BxkOLNlhdR3IRMWly2Y7KWh3/8K
         84JfnRT5Yauw/aiMyIjMG0J8C61U6uKfQddbtScPcI2QHib7qTqfoz0gPkstE+YREUFR
         RdsA==
X-Forwarded-Encrypted: i=1; AJvYcCVEoQuRiOAW9IQkY6JZ9JZzxVWiTkqxAcLtaoQIUHu6uPM0gU+L2C1uWY4YlSWwpoCMdRlznsZwp5vBLhUNlSX+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+7jZWe44Z4a/0hjYFGgYQQex+/jbcjCLKDKyo/ySCTRahkEL5
	FR1yO0gDjynrGJtyk8F3flr2gXFzE1vw0TWory08JwYxhVrOVXS7dYJ5ivxlDz7L3q89tEMgETP
	4GEivaV7H2BBQxwPSNDt+hf626GvnerCMhlqiyUn+BK31VNPXekpBzqmBAOQD5P5pq2ynvy8iNh
	r+q70qtHAY3w==
X-Gm-Gg: AY/fxX6vN//xctOj1waq1DyEPtK6ibqhbTPP8rd1/ox7ldoLYXamBWVFsMWtpI0Gmai
	pCDViywiMB5Jc6NqVwRDU2kZ0egYYVTJEUwYLqdH0Dvpu0zmAg1GE1HJwOUAFcYxmsXpPHGRLmg
	dIkh8IlTPLopY2NhTGRrsqlEJKiZJXyFMmygMn8EeuLm6flA3deorLT+88ALFK1Bm119ogn5Nlz
	YYIcRMXoaxbA/R7YgL7/dwqrvKhRcZna+RdBcYlavwjLW7Rx9V7Wva2ekPnjBlDlXHRTulV6JRu
	Of0KWO0yMctn5T/5jgso6KlFIPe7opXnjHTErruBVuS3VZm3e3cEKIB4TLo8FKt1RbSIk860DPR
	MkbYx/BLcbGaYanmKoixqQFFnlQ==
X-Received: by 2002:ac8:7dc6:0:b0:4ee:b4b:a4db with SMTP id d75a77b69052e-4f4abdf1570mr562010301cf.82.1767358078489;
        Fri, 02 Jan 2026 04:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt5R2wR9jhv6LNUtPbAFm5e41MAtMTk2OQVaV00K4MpUB0p78vFUF5TlqbcNz+3hdxbBi+cg==
X-Received: by 2002:ac8:7dc6:0:b0:4ee:b4b:a4db with SMTP id d75a77b69052e-4f4abdf1570mr562010141cf.82.1767358078087;
        Fri, 02 Jan 2026 04:47:58 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm84197536f8f.31.2026.01.02.04.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:47:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] soc: fsl: qe: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:47:55 +0100
Message-ID: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BwMUVIqgHsSLXsWLr/yHkduFe3TEnk8MGFxiheJTEoQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV756G8AhvfrUbvLgeAdmB00yW+jqEhRSn5I3U
 MvBeDKFz22JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+egAKCRDBN2bmhouD
 1163D/9yjVKt1NJDhqAFymdk+oeVkcbK/AvZYdXTCE9keCAp5fzJlxteLIkJFXXRwSHiVoVgBJu
 iLzmVZTllS2CdQYt8HoXw6afnlJds3WT/bU4xf8SnnufL3XiV6dI6sEatblrTkZgVIWQd+FE7Ho
 xVdq71lHc3Xkn8O55KDWUiQad0rUdxvRWKNzxkfIArwchQt7Eac6QXrq5Rxyng8c9fXPXhAAGkg
 xpmy6NZd5tjSPPw+LKS6WY5AKMRoWsIbhDJACnwhHqDBwVFrjYSQvtpCZSk+pp4NFnv9N0/Mu90
 Uyaj3xZAf/CkYYGQTdz0s7bLO8vk5HplDfEMUXxq6b2jUM5qUyPR43E+4XXMJYDVjC3MNqdC/k0
 2AxH64OiTaoq2y/Fnpff5Mti6ezV6keRQNgM6sR0zzNf4pYHogY7QvcPzXoN3ddxs/yvEi+6aGh
 9OQJcFCXho7mYWWlNo/ED9EJ5go/zffcC16e6pjInkzSRxOwfj6vIlHmVrYz1JejD71AIMuuopM
 5rrjcNKBcNoXvJhlZrZo8oDPP+m2QV1KIlY8xWSIoMbdL0kCePRO33UP/l+u/L8ya+jrPfOdkea
 r/fzuaq84mIZvSZBA7ZIDDNWCvwc+obMDHI5Svx7A4N9wL4UJTjPdZApZkJC5XABAgRxE90qCDo WpmAC7x5E9svkRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TXWuNHzVUxtb8KkpwE-YjAhFf_UiB9xo
X-Proofpoint-ORIG-GUID: TXWuNHzVUxtb8KkpwE-YjAhFf_UiB9xo
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=6957be7f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1gcOjtyiWqLwmlW-95EA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXxq9AuLarGUGC
 xjY/G2eKL9wi3PQpUV8uQDwyS1/1Z8UfVoNrU0eb1Uz3QQgfQBHuwHJ0zZyafiLSPhyYFvE6dbu
 8KUqM33rsyp+rTaUr31i7P0z9KGQZ/HYtXkMp2SlSzRPpetBlKMvXOHFqZ2Ntf9vJ6PwatRRaky
 6orSBNoZ+bnSDZTTsqmTfIWU5qhLBxurMO1P5ePqpavIA+nni72UkaydBxDJ5A/+joBmDO++NZf
 fYi9fAv3dSTVgLRITRzZmKiCqOZ0B/KT4jAkxio/pdX3rNdSYwkp74cDE9ljTMraAWgLvOBM0G7
 tWjF0zVT94lAGTXlZaDuR8+qJaU9B7B8sV8Eh+9f6Hwng77UAksd06YxnbxfZaBccdy6JIWoJBy
 WZmEhMGebk1YGlFD64xzJS+P9OzYEtl+R0qzhViofj1Y/0FJNhBjckv/+yIlkbZk76kT5BGgvX0
 CCMjwCydVY8iRpPK8tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044800_782856_D48DA812 
X-CRM114-Status: GOOD (  16.18  )
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
 drivers/soc/fsl/qe/qmc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index da5ea6d35618..c4587b32a59b 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1284,31 +1284,26 @@ static unsigned int qmc_nb_chans(struct qmc *qmc)
 
 static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 {
-	struct device_node *chan_np;
 	struct qmc_chan *chan;
 	const char *mode;
 	u32 chan_id;
 	u64 ts_mask;
 	int ret;
 
-	for_each_available_child_of_node(np, chan_np) {
+	for_each_available_child_of_node_scoped(np, chan_np) {
 		ret = of_property_read_u32(chan_np, "reg", &chan_id);
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read reg\n", chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		if (chan_id > 63) {
 			dev_err(qmc->dev, "%pOF: Invalid chan_id\n", chan_np);
-			of_node_put(chan_np);
 			return -EINVAL;
 		}
 
 		chan = devm_kzalloc(qmc->dev, sizeof(*chan), GFP_KERNEL);
-		if (!chan) {
-			of_node_put(chan_np);
+		if (!chan)
 			return -ENOMEM;
-		}
 
 		chan->id = chan_id;
 		spin_lock_init(&chan->ts_lock);
@@ -1319,7 +1314,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,tx-ts-mask\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		chan->tx_ts_mask_avail = ts_mask;
@@ -1329,7 +1323,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,rx-ts-mask\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		chan->rx_ts_mask_avail = ts_mask;
@@ -1340,7 +1333,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret && ret != -EINVAL) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,operational-mode\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		if (!strcmp(mode, "transparent")) {
@@ -1350,7 +1342,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		} else {
 			dev_err(qmc->dev, "%pOF: Invalid fsl,operational-mode (%s)\n",
 				chan_np, mode);
-			of_node_put(chan_np);
 			return -EINVAL;
 		}
 
-- 
2.51.0


