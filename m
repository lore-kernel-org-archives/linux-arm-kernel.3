Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0A5FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BUpoZ+T7vDuEG/zi9mTKqt429b9xs4793ENUoDPiZsQ=; b=bnKsUzOCy24b2NuUyrA85xN2cV
	y2sjSj9+SCGWlhoFeOGtq7DMRBOfBq/zszbj+bk5HsOpaO8xTBESyp8nkDZ1ea+uZj5S72ERSGlxD
	9mID02pNUN8SjUS9AjvCW6ghMuLiHEYQ4icr6jZ8/cRhCKX4AP/kZ7p31ATOaLD7D0mrYhq5cMuma
	pdD8xXP1mpMhIlNNAHDB3vGEBO2Dotc9ZG5Y3iTQm0MaOdmBSRdGDwd6OvX8VtG2XlYMZ7BVJSLvL
	qbcb2T2Up9iwpHXd6BPaSMuiUQ+9SWlBWAefG8hptaAORi1SeMWfY7htmaVy7bq8u/mwu1z2jL4Da
	ddsMlRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeaH-00000008DiU-4BaP;
	Fri, 02 Jan 2026 12:48:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeaD-00000008DeH-3NOt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:48:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vvi7504457
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BUpoZ+T7vDuEG/zi9mTKqt429b9xs4793EN
	UoDPiZsQ=; b=Gbq2/yGxcJnzNtOCF+g/chY2PsBMvMQE6iLdlI1gxLGkfXxwmhZ
	tBGk0QHkfM9gsZ5/4cxUIeAhcLbeiSBS43V898bUs3qFg/5NvE2U3yUZeAyb7ZN7
	MHwbLsZThpLeiW//QnaSmoQQ+gLjkQ7cfMkc6oHCpMQpL966gv2OS5ETtGYatpSP
	FfEQS0NxzoShA9QtSdjeNLd8SvluGU+F1lqxiHzJSvV/pAKWzdnSKLcL+eXvmMeq
	e0rXx19FLFX75Usi0dj3QHYbEG+FML7ZZfTXhEHBAJWzimgd6cInGlgOHh2hwbJ9
	Onrp0dVUxEiz1AnqHXTp5eGvlyZcylgZYkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:48:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so337575071cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358124; x=1767962924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BUpoZ+T7vDuEG/zi9mTKqt429b9xs4793ENUoDPiZsQ=;
        b=Zy0o4kTciAq0EKBDPomsoJW4R0X5LObc5jXLoqDihSZQs4GIbb+khv+MRYvRjmLoiQ
         9adF3mpOwYfRP9HkKSQvRSQzf1YQM1CJ9B0Tx6Xc/uxDH2nPVc/KT8CcjXPtKavP7kF0
         PiAdpRuvmrsjE0RIqpxJg3F0OJDe3rIeoP0e7F6TlgS1EyXOFg/7f7slSUuHiCpvcq4L
         oDuHnuHnLpbyygItGryomWQGtNLwR7SnDqzax02+09yzR/symS44m2aBNS6r8eAgQXcE
         27igKb//AGbmk8QeNc5z/mTNb3R4maX+c9iK8ZrJ+yH6fMwBMsr0l0ozhYLrRsvGW22m
         SZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358124; x=1767962924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUpoZ+T7vDuEG/zi9mTKqt429b9xs4793ENUoDPiZsQ=;
        b=ff6w+dmpTkcSgGrfB2fzW2rmF5TtxjtaVVsIXVJPpd5JEol4C/H1uvREnT+HRvJ2r3
         biMroHMb8XoW//uH2Q7OMd5mZAFuwvnLz7B74XgWnBw4Y75i0Ib2Ns8yCaRJo6k6Nl2r
         oQgBoAzCI0fMbtkaiVv7+n9hXXMwAamA9lRvsitkSCDj7KMhCWAk5Mnyv6txd6kUofuQ
         zr3TeCdESvGftJ495/eVcOWD+ue4mTHsLY4LsO8Ve8DnL+q0ffapd4HffEkuIPEjTTcB
         /vQDYK6lDgcHhNCATZ2e9PCbpzd4+Udft1JnPmOvzznglvIYuOW0tBMai7ZJXUspnnn5
         llFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8tH/2NMnsbdmNS/S9wizoX+V3THA14s/NHcAB68dVnqLjSKrtFpJ5mnbIBCmVtlzPJ3WxU2wqUAsl+ramieT0@lists.infradead.org
X-Gm-Message-State: AOJu0Yydww86IV06dFDLPGYIVox/lnuRNGqDx6OvQKeQEd91ct9B0tS3
	sbgswoo8ev1qCN57JqeJ7XlxicrwRkGL3N1hiC0eYuJiyABceJU2t29/lZbqp4jLitPZafoSfvJ
	hPPIvj8X9qVGbfhtlooJaxki67oBwEHRoO4gWc8CimLJTQ2EkJPgMtxsOR3KTVmOgX1A3A9htg6
	/2Gw==
X-Gm-Gg: AY/fxX4GvzbgkxyRKsmAoCUZnx5SH7ukPJX34+mRofI/3tK/umh+0nY5cXiGxKQwvU/
	GOpyjQp1Obr+DpmoXNSmiujwM6b6KS/iOWeHEBgGPtOWKWMukk2eFIdyVhkNBvv6bSy31D1E/2d
	Wo1uBXNishW5WMOgvXYA5afvPSbc4v1TpRvI5vpOW8ZzyFU7U3QEHUcckVzyeIHQxkMkXnziNY5
	8ZP6TpVxsm0cLF6B9AedlFQa/zmh+W0x+1ICqekVtoPEwtnOeaHdQrSsgx6P81VPdpDog2aEe2Z
	xILi+Kzfajvy7ZJkC9NolkOMH+BdcRygE6Hqc5M3gu4qwDZFEJHe1ZvKfA1hTWrDnI5jh2Y43mt
	5q1cmlsObv55Pl4ax1Nu9VQ89Ig==
X-Received: by 2002:ac8:758f:0:b0:4f4:de66:5901 with SMTP id d75a77b69052e-4f4de665a8emr387649881cf.5.1767358124444;
        Fri, 02 Jan 2026 04:48:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgYCvGqiuv6UXoD9T46glKCVF4tcH0dvAXXUkL6iY+OU9BbPdW5meF8oWRi7nxOWejP/gtng==
X-Received: by 2002:ac8:758f:0:b0:4f4:de66:5901 with SMTP id d75a77b69052e-4f4de665a8emr387649731cf.5.1767358124097;
        Fri, 02 Jan 2026 04:48:44 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aac6d9sm328265755e9.4.2026.01.02.04.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pmdomain: mediatek: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:41 +0100
Message-ID: <20260102124840.64424-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=OcIwlu3RbDzj4APk+zQqEeDgPBcykjsRQep6QGMTQ8Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76oDAEMOGl9Z/fKeLxpkVZ7CyPuujcbJEqlX
 ymFmzy20JqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+qAAKCRDBN2bmhouD
 1yxyD/9wFzZRH+PYMR3wZFgaITMzhBAmjzbA/ynFwhrMvt/NU7/qwQz6iwrk+/tRwdWPtY4K3Ij
 Kgm6rBv7McPdYuZpzXmS4agwDTGSK1rMkkP7NToFQ2Noui6JMuX/rXZRgbee8YTWgbEVCQhNTDg
 bEaT5xFT16UNOuY1XVa5DcJmkfVXPcv+iuaxiSmnD7jKBeLhf6pH7tDDNoQkhmfqB+w5etusJda
 U5nlRktyIIbkT4raJpH9K0JXfdh1NHDiIhW6YvXcfzeS7v9Vsk6zPsWSlNcKKeIAs176+THWw00
 0PdVa1vdAcT4UsIfJNCbmyhIXOQyX0lpi+8a1R8v1ZyRIQlCIbxeUv7/T5+Go8/cEvT4ejrm368
 A1V2RnEwqw+P7B4yt9CuLXT28FP+eSXY8iFE7CcBCi7FWbAvZ1hOkVi6JZTx5nlneZC2+n/g6L8
 YLTc+E/p64pnCtbJUQRzcP0n1zQ5DMBKcmk7B9ygrab4A9UnGTZ0OWlLDzFfdKoS9WDapn04tvL
 nA071AAeFHm+FlYce2Waql1OsLt4D0BcdCNxQfpxeY7YK4vWQGqY6JXvKphbylfoN6UNS9loctk
 TyW24FMX7hsA8xnsejPkYlnwywBcmlj6AYo0NYYeq3qcTw943UdsqtI3FkbY4qaZ8KzUeUc8o38 KtOFgun2wv/jFnQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX2zJr1SwliUWI
 QAaakB0hu5DApIguti1DUB34V9zbWkv/vKnVVgUa0rkulSwJu8lxLcWkknisbkcPkwNKcdvFvmb
 ZZLJe9uWxS2nfPkh2dAvnySjLohLdxbxqdwNQZjQLXkYxGOhf61td8EOwXMGKaJrY9YN2UcSaBI
 bDyFLUhmxZvT7lbFruQ1Ld1voMM2eJNJLvEtPs7CtZQFXx2flN+9xChv7FQcIvumFKAdsQNqnbr
 DrU3ZhvZED5TnAkxiw4ASzDqS0NX0uJhy7Qj8IydV0YWDoMFIsX3FaUPfPnY990H+nTDhI4WzAL
 jZUCenNxPhBO6r27K4ka5PdThXGdNHbAwPuIcmXag9DP2hMsjPSba5Lwx81VYtEDPomnrYEhdT4
 dfZ/aejijCyHyVucgnJnbDnDjYYLEUTU2Hh6zVVES4bMb2J12z1uq7jTNww1XDlM04KGesau4eb
 B9cYNs+peEd5F740veQ==
X-Proofpoint-ORIG-GUID: WQNK2qzc-BaO9gZx_93oJox7-jFXSg9G
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bead cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2lWiiPulESlkJRycB4IA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: WQNK2qzc-BaO9gZx_93oJox7-jFXSg9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044845_882005_26CD4DAA 
X-CRM114-Status: GOOD (  17.22  )
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
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 80561d27f2b2..ab2514c78c14 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -1191,7 +1191,6 @@ static int scpsys_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	const struct scpsys_soc_data *soc;
-	struct device_node *node;
 	struct device *parent;
 	struct scpsys *scpsys;
 	int num_domains, ret;
@@ -1235,21 +1234,18 @@ static int scpsys_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = -ENODEV;
-	for_each_available_child_of_node(np, node) {
+	for_each_available_child_of_node_scoped(np, node) {
 		struct generic_pm_domain *domain;
 
 		domain = scpsys_add_one_domain(scpsys, node);
 		if (IS_ERR(domain)) {
 			ret = PTR_ERR(domain);
-			of_node_put(node);
 			goto err_cleanup_domains;
 		}
 
 		ret = scpsys_add_subdomain(scpsys, node);
-		if (ret) {
-			of_node_put(node);
+		if (ret)
 			goto err_cleanup_domains;
-		}
 	}
 
 	if (ret) {
-- 
2.51.0


