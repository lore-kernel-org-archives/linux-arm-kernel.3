Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9569E75448
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKB0ZHnkwf6Y2wczw/UUFqJ7E2A7G7owFdcy+1c9S4Q=; b=aDwvKn4NQtP2QmqZDp5kZgsjpw
	22VmZxKw56QTjNqtGQ99zLbmNdwxnYANr5Fr6k+4wRvDS/VAP6BvgFm65VRc3g5qb80avMop3TPXI
	MqDl1XkD+8r6HMExO4zuNU5dWdMJ6L+RZzb4GeWYojG8DunEJTCGcCv74Iws+3hWDFhYwojf81HKX
	490ANasYwcmX6Rpgsr8J1Hopecm7a+Vp85wQCDDfT96ASvWhLjIuYkMOc9KMZk18aZdYGudqWh3CD
	Jq060MnlZ4m7hN1yJpy/zU/sQjwEI+R665v4uWfHere/2LMM9s+40M9RTovcW/V5Hvl+jGIJhDyvr
	9/8GdRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNId-0000000GlF4-1CFg;
	Wed, 24 Dec 2025 11:45:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNIa-0000000GlCz-11pX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:45:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wmit3797283
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rKB0ZHnkwf6Y2wczw/UUFqJ7E2A7G7owFdc
	y+1c9S4Q=; b=E8CA4D1UuhOuoHQ+cNdwvXszaBEN68lTundhrOddPFLnopjfYB0
	7Gp0pGmqHIWZMoUV4Ok3iqcDYXrisNQqQof1d9CrHXL/MUfnRUQuClNRUa2QYEid
	M2UvgQLLZkWyCeOvePBoOSZ6A7blE7eREVvKwrwHdUhznWHglYAKsDKpJdd/MxjB
	4giNt/aF/s9p9A9MCiANRsLq+OXXk2m5Yk2qZvt4dk/hTBkJmjOopS77XBLVVNG0
	Wcc7gYuu19fzBvptyH/RyN7rpgJhCaZc1Ze3xaTMaIQoVcux6jfEDDTJwwYjZlxk
	uH7Zfze6fKaVXBfA6iWqvqrYh8VAzjobNzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r6933x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:44:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so60903051cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576698; x=1767181498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKB0ZHnkwf6Y2wczw/UUFqJ7E2A7G7owFdcy+1c9S4Q=;
        b=eElAwYrLiRY59vTpXuI19fey8wg+6+ofrRqKfC0A2YoZcD6V2TEjB3obHHK8kv/l0A
         PzCqQqNrzoUJIr1sEulJRusILH66z4PXi5dzzCM7CH3AOTlsA3CoDSjwpRa25dNCrto0
         TwOgGTQbe49a/6D3Tv1n9KzbLE7SFfOh8PgB+L2qGWD2V2hO45zmVA0R4hX+e46jAteO
         KAGijSZ9zT2RuFep1fIWmTXp9AarqoWmQr7O9j4qJ9BDzZ5RMV7SYzTCJpL6OJCkq95m
         8KWOLb2zQqd8jMfDIN9Pu9iRla8QKpU0m5zo3/UObE0AVGgq8pwPFNRUE6qlPNQXEeVd
         Uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576698; x=1767181498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKB0ZHnkwf6Y2wczw/UUFqJ7E2A7G7owFdcy+1c9S4Q=;
        b=PCWtmq3hMIwZBVMfOmU56bKHFPXxi0RSvB/TbKfkw/6wGcv3nFLpyLs0UcsTsHKCDr
         49ndY09QkKF5Qi9TstPGZB9LvZIftbZ6DRL1QrLpINK8yWRk3MKhVx65re0YeaGZML1u
         RMkRBET6cAXX4/5PHrZJ8mR7Dl3mWiPvdQb0fR7GPigkkO9hFQ/n68th+ST+mx9P9j7h
         oPcWVVXYqNrEAL0jgL7+Ekzo71qXHkXc9gIT0fXckqn5gmDyS8Xq042bhv3jZzJE9mto
         vH0IljndsZYNGix1eTCYlOa11tAImah8R9hVqgkC/amawd+Hm/WZQ+t9gTExGR9lfgTC
         WWtw==
X-Forwarded-Encrypted: i=1; AJvYcCUjWLx1R6FiZSAe9znLvkFdND2bCd/F0mBMkVeUxXYCH542QDBndLZp9dvvQorLZz4GRR4WgmnrGbrpxN2FBXlw@lists.infradead.org
X-Gm-Message-State: AOJu0Yws/LRZviD2qeaa7AwFHHk5HV206qVUFHsqTEGY/RaaP79NGAu/
	81hBz/PyHkRUvZsCPHDqAe2TcGisfX1IDVnlra+pahz6tf3P1XPZYxtOLqONKv9PEXGkRvjrxXL
	/IIwa7qV9j9IHBoPIwR8YehPbMBWf2vYyPKChuo9cUJcsRE+ZZWVrHdFyf7GGnGn6gxh1DF75qy
	LiuQ==
X-Gm-Gg: AY/fxX412zkD7ThBAdWAVpbqEFzBYdR3O9oQ6+ewMmHGoc7qI1z1gH6s32MvcJtPhY0
	53qrKS5Sai1haCbN0HVL5zBPteThagIt4hWEro4NFSOEE48bk8z2DMvh2XuEHRO5L/Jy+WBgiF6
	7qxrR+kt/TFo6WEjwlAwqqPzl2RUxsmL+DYp+kROQ3Q+YQugFpYM6RzckB0aJXZnYYmsyqO0S8M
	+dJDsIq4RPZt4p5u7HkclmhMy3479InJJnp5TvsBOu8b4Na++fmLKI1NPhcrvMzgnx7WhBsquNi
	ai3QT25K+EGad4fqSCxNe1U1/Vo9K0nWY/QveGR38J2JvwvgNg+zSgf6Qb9ZZIZGreGeCP1+v25
	00GYv9nzh3sg/wkNVa6ywBiEqJltisdAns/04sAAIniWm3mo1hDicoPYS1wZaMDVacAAHNA==
X-Received: by 2002:a05:622a:1a8d:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4f4abdc5da8mr238513201cf.76.1766576698413;
        Wed, 24 Dec 2025 03:44:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhTkGm55A/nE6si6wdCjN6fCoRIzPuA/cZwt/40Pm/zBYW0k1P28/mQ+1m7WUxVlIoVPKyJA==
X-Received: by 2002:a05:622a:1a8d:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4f4abdc5da8mr238513011cf.76.1766576697995;
        Wed, 24 Dec 2025 03:44:57 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm1799758266b.25.2025.12.24.03.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:44:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] mailbox: mtk-cmdq: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:44:53 +0100
Message-ID: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AdDQ0+wWEZ3WCutSHsj0Ow/SsvG34dRLviYC7A3U/ws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9I0MTNMq7Mg5nwcRKlf6XuMuaViMmE2fnsuD
 ppG8htTZ8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvSNAAKCRDBN2bmhouD
 1/MAD/sF1zenvMrBTSPRNFkzXZu2JFUQR9YslQUYwpTP2dX+U37MoUPtrHgxvycnmXIrHl62l0/
 l8AvVUNPWoSdNHCS/mjI1xGwhB2vX7Ntianb25b4x6mFyFccGEz1o8nc1ox9St4vrkatnDGS8pb
 Yyz5RGDiAZeW8b311XlmeyDXFY1ZwFPH5C+tHHLwqNLktIUxwWdY0gE8svcsk1VnuhiO4isdes4
 xbcgigXLmf5CDP149G2lG0xrKLRwq+nhsr5xADl9KK5oy5PP2l+0oeBlW0A6mtmTNAXrscP/BKg
 WUHhtwlb7SAY5tzq2JOMREel012Dfcpi+nGX8kaQuHzJL0EKDqx2Lyc+XfP8aKHorr6bmjqSowf
 kDfyGsd4GVKMas/s2UJq7Y0LUmiFughyslWgU3uw18wlDavbq9LgPgtx7+YLPzuwbJjMjkxiz1a
 cQPIm5aVAYlQG1jIFrNy1XphNHyV5gXKJTxpL8MSlYjBuOzAAdbIn6aUyzB+f2/dUj5olFS0huH
 S48X1TBn/LaScsQIAQz3GaaMbd6gKmA6fPUDt7HTIcVMfU2fEGvUGO92E2C1x1yx07aV++6FYRg
 WxO2nT4+78TMLNaz6f4SeD1fCdRH9ZrlMhyPEkjoVFHvubT7RIJxCOhnaRb52nVsPbBHws+ziuz AzMNV221ATopF9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dc8xwRLdMFxX_V5pmxbwprSdL-UnqtFh
X-Proofpoint-ORIG-GUID: dc8xwRLdMFxX_V5pmxbwprSdL-UnqtFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX+E5OupEA2z0f
 hpguE7sdVzI9wZIwHTq91FbWAOGEHxybAbgp9yNGlHWulv0svQ0RDeDD3Wy3I8Gkmjtgvl9mgyQ
 +Fza3JdkRqfeSkm/vlIkbRwvxpMysh1djpxtIZbLPu6kRtu9I1sSXq4e8+Q5/2ch6uCfxn37A38
 COe/5zq1BBOQJ/kc6vB39+X3SsslJFIpRGwGLQiKEMVfzWkQFehU/raRXCVErFbJDKNybJNSbw3
 kvkSIXreGRk/UF1WU8UGX/VhqgtKWo8MEaU543M8bxTOfP3h5Bhopc/msLyG2Ag8TK086GfbrFu
 4uu2eIvGXxIIdYuDYwDRx0PohfsKTl9h+Z9wpMuu97s5LHSxWLmpFwTSIyC2ci9wVc1NWzFdvWg
 VjMutkBDy6ebC4WtN/ujBFzIRwpe5hKFdqvn1h5lCluZsMzhHHHLc9Fw2Cy53JqxKC5NAe49E55
 UDhMYqTCbP8G06mpX9w==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694bd23b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AcbTN0EqnTs5jyReABEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_034500_284463_7C63D608 
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 1bf6984948ef..9da16b30eb41 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -636,7 +636,7 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 {
 	static const char * const gce_name = "gce";
-	struct device_node *node, *parent = dev->of_node->parent;
+	struct device_node *parent = dev->of_node->parent;
 	struct clk_bulk_data *clks;
 
 	cmdq->clocks = devm_kcalloc(dev, cmdq->pdata->gce_num,
@@ -661,7 +661,7 @@ static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 	 * as the clock of the main GCE must be enabled for additional IPs
 	 * to be reachable.
 	 */
-	for_each_child_of_node(parent, node) {
+	for_each_child_of_node_scoped(parent, node) {
 		int alias_id = of_alias_get_id(node, gce_name);
 
 		if (alias_id < 0 || alias_id >= cmdq->pdata->gce_num)
@@ -670,17 +670,13 @@ static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 		clks = &cmdq->clocks[alias_id];
 
 		clks->id = devm_kasprintf(dev, GFP_KERNEL, "gce%d", alias_id);
-		if (!clks->id) {
-			of_node_put(node);
+		if (!clks->id)
 			return -ENOMEM;
-		}
 
 		clks->clk = of_clk_get(node, 0);
-		if (IS_ERR(clks->clk)) {
-			of_node_put(node);
+		if (IS_ERR(clks->clk))
 			return dev_err_probe(dev, PTR_ERR(clks->clk),
 					     "failed to get gce%d clock\n", alias_id);
-		}
 	}
 
 	return 0;
-- 
2.51.0


