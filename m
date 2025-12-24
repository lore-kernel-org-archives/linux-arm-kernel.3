Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A0FE75452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MD4+4dTtOWYC4DkHPGbCwOgkR+4yQ1iA13HnXjKESLc=; b=YbVplsnweZEKBdRuuA5gG8eh3y
	RnS0aVsSwZTA9KJwtirN+nx5pE51im2Czq3i4itSo7KBygTjuOsuUhAJnWg3GlGBiflHavTctA3iA
	4R7n/pwTH/+4aPNmgQaqRmz2PGR6mtxg2AKs+/nhu4MUjEpmT9JZOmvR9Rb6QhlKa9ismrurZHdmD
	jiNJyssKF21syaCBs7DMJrj+RgGShDkfr2BpViWKmV33H22ExyooQf+nmHKniG9kNAuKQYacoxmxg
	xyQwoGLJHyRQmSRx9zHdSShpiIvV6/zWIuiO9liUMk4yvN2rjKljcN+9DTjtRCAqrE3wZvHhIL5v/
	suiM0CYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOFJ-0000000GoOP-1aPX;
	Wed, 24 Dec 2025 12:45:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOFF-0000000GoL3-09eS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:45:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOA7Xj11597811
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MD4+4dTtOWYC4DkHPGbCwOgkR+4yQ1iA13H
	nXjKESLc=; b=lFkkXYGA4/bjPOl5rVodkdi04IsWD4QIPpS8qMTCAiebZqipiaM
	GXF0j88CYqAni3F0u/6dEnNubMoZLB5vuaO1NUNfElbETW14JJRwtGRkS8ExJbtJ
	TUjkSDxb3VgHrY5LacKdkuHDe5FpqUjVNw53mZ5klLttn5AgGQVL1w6qBBjHMXj+
	BZD6fCfL6afXR7sg7sMCsUgLhlzEASboFRHfTBQEyc8HYPzJa35iPcET74rdMZA1
	77Erd1CZlcrV4sDHAtKf9aWuddFbh/SGn7/57UOzK9eyPlIs1q7N0/GEU37MSp+M
	tb7NiLyaioCVqgBAGsoujPVKjdTZ0YoYbyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hkpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:45:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso82720121cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580336; x=1767185136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MD4+4dTtOWYC4DkHPGbCwOgkR+4yQ1iA13HnXjKESLc=;
        b=FpGAICYupqGWBC7V2n9Qwq3l6WvhK9fDbc42FQYoYhb0H8DNAhXUxT8AdqcH+5xBI3
         9cHJKo7878xohYU2h8cI5PjIinyMEVszQP8j5IblPd4rpMFhNaFXPVdYvQyOilWjE8F9
         x9Mz5gLNCKBw7bdp6SuUFxzN5tBCTSBlmBvA6mPPb0/4pKRy3IOzYlgvyiTUCca/r4ar
         RVeKIcT2swoqcpbfGFFjQFVKmWhKxdmZyC1/hfQzJtgy0a0bSAR6zow5AwRGY6xqvnih
         klYnpB3Kav04KvIELZ9U9+JoelhSMDugMruqDE2YTQk92EpBzY3yh9nB63stFRE1GQvg
         +ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580336; x=1767185136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MD4+4dTtOWYC4DkHPGbCwOgkR+4yQ1iA13HnXjKESLc=;
        b=PiK6POfXTxUJPmMuLY6lojabQ6u3vI2dm9YBHJUtcugkDZ/sDR56a2jdBDGDUDpJoe
         V/4i+IlbVxKgbwx/p/Y6TCUTqsNr4KWd+r2buHwxRvSVzgFB/RKdycF7Q8a83fYPsqPT
         msWA0zB0Y69ypuz3KaXSvYY+qaiLkUPJX09NkhkeYSnrlseo5E29ToU/lx+wSM0JZDFI
         hhQ88XHfgKZbyt33sUgVSwYbWUWLaLg/rK0RyIDJRwi3K0NXkYU8moMkYu9oqqvCZcNf
         l0jUZI2ruyv0Dh8vzV648e5M8Z4XO/GQGE9jQPEAn1HvC3OXc9RyxRyzaU5V2z89N40D
         5UbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUluQetsk8mZDd12sxeufrxUJPO4tCI+U+ILrAh5kWRvFbKRQkyJTizQvIq4/iTk33g3NgJ1K3oCsN/9d+fIaQb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2DwlAK5sgmI0Tsv4nrBowm8dwIjWA3r6uvZJdCu1mpRPvf0uZ
	+u8aIGh4MFnGXJ3Z9yLXxCBPFScIJBvGYrqU+GEyQV/i2ZyN/y0CcyjvF046BYDNqVQlU82JiRh
	Qatre8WmPqzE358JZacf/oTDs2KQVb1acm5li7UtrBl0A0Yz+JhIQMZEyrx1qDlh6c9EZ62qhRH
	8txw==
X-Gm-Gg: AY/fxX77uglNPurSQTOFoUfrV08ZNquh5fVc/lWbwqiEKQmyh8s7FtpZ9BpioieeTJd
	kI6lovvk4Rk8xNdKU7ba4ocjSptwC1EqhnYi95sI4DJeDq2oM1p/RJZaDDEJ7x/cIriCDZqH7bt
	McyE5AplpfKFGfI0HsSSDi0L53yjw9WnrNZ3kiy+qVhAkn9pX0fLncg/QRO4Iptm3WD2YZLNxz1
	3UVN7i/7/MypkwWihljAV6ErnH0PVjCSegJ69tvcGAOaD6zE9Cb/j4Ocov26Qlh3fLpPs0onsW1
	0EKrQIF0Clhu3seDhpDUQSzk/Vx3ibh0HVmA5+GzDaV/Q+djvV8ZVnnsFWW5R2HywQALwvO5M5y
	5p6+RrcfMvj556OYi/pjclBiDwUZ2kJM+ts7JHWYJXGJw4V8O6vE8YrmnHrrIzrnNuyPKNQ==
X-Received: by 2002:a05:622a:4d06:b0:4f0:441:96be with SMTP id d75a77b69052e-4f4abd6097cmr255765531cf.51.1766580335667;
        Wed, 24 Dec 2025 04:45:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvjMIM5yhJoLEQH74M5IK0AdJgrY2gnBRvrxLNfELlqjEcnwKdDd3x3oifm+uyn4I2JE6zkw==
X-Received: by 2002:a05:622a:4d06:b0:4f0:441:96be with SMTP id d75a77b69052e-4f4abd6097cmr255765181cf.51.1766580335233;
        Wed, 24 Dec 2025 04:45:35 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a6050dsm1777975966b.9.2025.12.24.04.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:45:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dmaengine: axi-dmac: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:45:32 +0100
Message-ID: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9zcpzey/wbo2n2NG7vk52Reue7c2cbJAJeguA6lv1Pg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+Brq/1ZTfyYDb1xnkiLhDH7/pTNXiZHymNo6
 +BtVzGgpjmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgawAKCRDBN2bmhouD
 1+3ZD/9Lw9Z3ImP1PgtCe5vQAGa4CiOnLPTq3fwM69u66tCwwJnPaLMs2LKclNM5QFiTwQj5jG4
 q3KlX9yGcC+xGo0vKE7zz/LxCNGgHF+QIXkMaueMPH8sakYaSBElYGVu2XaQxfabIu3ieZNiWJv
 ojBQDA86XJFYGb4LO7g1BUu60Y01+dQcjNm7oOofytzlPDraEKs2vNCLUFbpgsf5gNokHH5LYlF
 O/IiBSaTW3uQuEnImsDT0S7Be8zY49MUeicDJGX/eIDQWAasDA0YWIf1Pu0d1bGgbMZpiLMXV92
 yjPkWQJX/FFCzahNaKPqTUKyYysAvD+0rmrjaUh6ClrEGROcnDMP5PhbsBqUNfLtov+yK5p09Gd
 iCyUoomhlHwMa8RmIwHhhHs1gTbdu/rVEkT37e0zBXP2VeHtAsGF/GO+YkMCYCmWE+2bvP9p0Sf
 CmZEKoT7goZ+HJEW9C1hIzBTqbccQMBG2c6WwnlbzqTPXiJfN5z2IyD0pSinYmOD5TRQ8Vk2c4h
 joERR0XQPfQvjGmIpVjKULVJGWbaLgvvoKwXkxUT7qvEso01UxQc6RbmUfJVu+JsGaiYUp70YLh
 WJllgrGcpnEKkFnepSzCSOozvljD9aAfDi2RSFmi6nIzKNWTIwvqw7jW5aOIQ2jw8CnQ1vcMkq+ /IrsakAqRyEdLrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s9yosu6XMF96ts6FEBvocWv7bZ2vPg7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX2qlvDjtiSdHZ
 Jp4MzsN+JGA97s8GeT5yy47q+ae2ykETc1w9gl+6elQsSLuuAlyjqQLhi0lWEiHZ4vSFuneivEf
 5fHuGF/ZBDxkyMbRsEkx0rANJk6wr4YqhL556BhSFRGTKJ1l5UOSgKR0co2PfPclto3HXLua5Gn
 5wHFWvLf8DOyB1pAVwJsoK3XfBFxy8YWm0eDcSUOj81mItDGptC1fPznYIZjFiH81koezAupeoy
 9bpgJcAkP6DywIB8EAPBzlVZX48DNIIqvZGrt1HoROVP1wuCM/VCnnUy+uz8mbGuB/knClC2arO
 sUmikJiyuJrHw28Jf4rE4Ps2wCjZ1hSq0gSxGQogms7r4tXu43f+PRvy7+E3fWx5A8cwj0racQA
 VZN2XC0SiE4vPozZSIEi20eUOi8XTjaOrUkjls3ybKLFf7kD32Wu9QWsVr565zMQQTlK5RbIdoE
 bTym93D4f3upaEKul9Q==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694be070 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cJhNrYchChBbACeWSR8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: s9yosu6XMF96ts6FEBvocWv7bZ2vPg7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044538_558262_D3F97CB3 
X-CRM114-Status: GOOD (  14.40  )
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
 drivers/dma/dma-axi-dmac.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 5b06b0dc67ee..45364b1e47f4 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -925,24 +925,21 @@ static int axi_dmac_parse_chan_dt(struct device_node *of_chan,
 
 static int axi_dmac_parse_dt(struct device *dev, struct axi_dmac *dmac)
 {
-	struct device_node *of_channels, *of_chan;
-	int ret;
+	struct device_node *of_channels;
+	int ret = 0;
 
 	of_channels = of_get_child_by_name(dev->of_node, "adi,channels");
 	if (of_channels == NULL)
 		return -ENODEV;
 
-	for_each_child_of_node(of_channels, of_chan) {
+	for_each_child_of_node_scoped(of_channels, of_chan) {
 		ret = axi_dmac_parse_chan_dt(of_chan, &dmac->chan);
-		if (ret) {
-			of_node_put(of_chan);
-			of_node_put(of_channels);
-			return -EINVAL;
-		}
+		if (ret)
+			break;
 	}
 	of_node_put(of_channels);
 
-	return 0;
+	return ret;
 }
 
 static int axi_dmac_read_chan_config(struct device *dev, struct axi_dmac *dmac)
-- 
2.51.0


