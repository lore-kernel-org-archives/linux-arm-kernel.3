Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F136C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 01:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=ufjO6wBfx/kyZuRRSKaaSJq7Ic
	StpONfaavPK1fUuNcx0xwDPCrp4QC1aESudgaYXQLUgXaLpSWL1pR3PcRNrb/AlCHUDGAh78Me2Cg
	gqE1G/RxkM10KyZFtF1m8M1U3HawjhGVXx9o/nnadVjfebfrlQESFeqlkjb3BpkbGQy28ae7To+ng
	UtpJ+4wzbPjjKLon/44Uth9lFqlwj2XYZ5vQti8wSljC1Bh5cKDNGhYsIzxyv1Jo95hVQxh2oSB7m
	JT67lMhaI5KXqmrocpugF1GCaDJxLe3CmMsZmlSTOWbnihEp38JQf5GW75YXxQA7p3odSkgxlyM3X
	ud9wJqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoEy-0000000DXa0-3PwB;
	Wed, 15 Jul 2026 01:16:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoEw-0000000DXXk-2GQp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 01:16:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0ITsg2049624
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=ZnLn+WJxNHdNzF4i
	3W+cZF6RmtLpCQU1MTWdWGxgW+Q6CBk/MU07fBZgetR6321KC6yrX1rD+AOHGSaX
	EdXPiHEmTXhTfCDDmBRQHt87jtRl5yDKBbwl5bOM4L/UBDQ1neX5SoEHhr2XutDh
	zQMGegjFmLXwcbb5Koo6EfcF23turYDZF4N5RuiyCQEI8vtlE+3k19WHEorefctb
	jG7zaUtupi1AkGPSEzKPGEs0G2RkqrK91/l1y7IL+Lu3WE4W3/UoHq5kDlatiz2B
	os8mJ7Wj25cnFlcVf7c48HnVoQuLUtlkQYN/EyRVMdXgCETKe+/6Dy/A/+K09yt0
	pKQn4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk30gpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:16:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380b630c505so5986495a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784078204; x=1784683004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=WxU3UEsE4salfynYInhgtAS9n/ctRbT1vR24FauQ7GA8Zs/9vo2/0wNm9D7ItOGRkk
         yHoKNRZFQ60juJKoI/6m1c40gIkNMtryP9gcv0fbvwnq4m0T75MUpsQ9nRx42Ln6f79F
         ziRncc6dBb/9KuosOq3SfYuSb+htei4X36jR+b9w25du/FqgSoSzHvvYiv52qoEGB1kl
         t9p19TDW858sMRlvWsCA91+nfME59bzSnedMgy2SFYTP59y9JdQCdLamNODzBi7kiCcW
         mIJXfbMv3sElTzKzIpb3zBEVKKG2fHZzn5OceWVsh811xYiXcTA78QlRT540RTSWq+TY
         t0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078204; x=1784683004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=YrnmJ43hI3h4LeExJq7Besto81KihAO+UwUqnPDC9msnFSGQ410acT9OX6libJHL5T
         gDKrRu7Zfu3meVsSWo28QV6ZwwR8KGbwRiXGakXlyCzhC7cID9sQ8984NVla3IKybR6O
         Tg+awnUhtgsFKXFothe7FTbpYpLhFyBhp+PxiQmqRn5CNFbuaQ0OSShuQDvsMCqEQAn1
         iFabJiV9+4060dbrFfTmYt0iv+zYASBMz6OqnacoK/OTmhTQ/oLXJET4mKKfB95JghtL
         +vMMkLWjB3CwvruUXDtcISBCg8NgJ6KyQ2jcpuNd69ILuXHGitwuyr5Ccg/GpQi0D+uV
         alIg==
X-Forwarded-Encrypted: i=1; AHgh+RrRuLyN1Vx7HZ6TFU5wSl7tSVHNSQ+C1G27lahofmPmlM5TmxmXjKG1U03KRCHCPzTAdWidOW9XJ22Fep93xGfh@lists.infradead.org
X-Gm-Message-State: AOJu0YyywVop0YqeaCuHwKC0TPo/ySEsiuT1a/PxlYNSU4lNnjuEj03u
	/7kIb0cAocY5wsd9zgFcDMoKy+Gyg7E5xzVnCCtpsQnc2lXDix0QBSK16LlWGiFtQgWvGiZ6tvf
	SZBxx9td1yehuOvIy79N96RIVAsSvsdW/lYQqwCwuVodBGmzf/82sI1WQd0hqI51/tLnPaOGEtT
	bY1A==
X-Gm-Gg: AfdE7clApSWCC3d9DUleGSZbVgrKfXTLVcmE5HZsE9/Wp+snPB6I9CgDGmGGtHlSNuL
	jUyWnoxBik97Fa5MeaQut4yxYZjIe3b1vEsfopYzsLv6UfOycvi9gkpHxWWrl/8Hkx0NI3DeENm
	nCQ6ZBewx8ODq49XqhzZMLjkBULnJE0nrS4Vk1o8SYuXpQODW4lhSdZVX/VOwnHbXtdvdCznaMe
	PtXaDUh9lG4EOcKMpa9gma+cVnz45yciuu1whcjaA0k2VmdozKKclSeGwDdg03h1ey8GiKea/8I
	sv8lQH/kCDw9YGcNNB57u9QWpZDJuFoQIZgQMZ6A5A5j9LN5FV4JkKCqEiE9dZje5J8GJaGjB5/
	tazsua51I2e82yvZqgb1QY3odWkP9gssgrluldHO8KTw9IWFy1W0rT3OucdFjSl4F8jf1Uk0zng
	==
X-Received: by 2002:a17:90b:3c8a:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38e1af3fbf1mr4250309a91.35.1784078204360;
        Tue, 14 Jul 2026 18:16:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38e1af3fbf1mr4250282a91.35.1784078203859;
        Tue, 14 Jul 2026 18:16:43 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm2207487a91.13.2026.07.14.18.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:16:14 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
In-Reply-To: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784078191; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=WtyqlZzA0DXss5OsWmivd5DeH34exJbbEApd5XxCJO2QDiBWm7Js2v6uEFquGfE6CkTb+Abn9
 iyXf/b5+j4XB7vlIZQ9mF1ykxlBRUym8OWoSjDj47vk3A6GEOOUaG5/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a56df7d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Ms9qdyU1AI-7xFWX1sJuf2Up5w7Kza1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX9jpar602jBjJ
 BVXsGEFPjJf/LCVIUzE5wLxZAo9yke4jdCUng1NiA3VcvOH8dPluY1Gh+gSlGHyNJzHmaJJplZV
 dJ++/Yt4r4AK1OoAkkA+OiSrj1vavNyqcSuaClazql3bnibgTU3ek5JAaXSYO7U7jVgAU/JeJUK
 /GLkLbQtGTCGb90PtDK/6Uj923fKr3Rw9AB3MO94kRZ23LbUsidS3adxIyTg1iyzXJFv1hV7wtS
 DtsSNvQUg4oWaWLH7tEePlCPSwW+cKOZY3hPzeeLh8OVH5nPI4x9WxSN8AiQ1Jx2GoL3kXbX5Ub
 dlP7M3QdfdnpHG1GUh5zcELQVkRaNOyGqn6/nU7vqhp/6paTsNyOgw/6RNwKS9pdhXIao4NcDVi
 Y+tYfYwX6MVcqhQ+xWHpBdLoc4Y9utyIzmMTt7QXaAkq4hi23xqQy8pSvyJC0pm+B8wbR9Rzxs0
 zISAtlKBcmeO3QaBY7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX4DeFtpxHzO5S
 zbNenpCpITwikYqQmbfdN/iXSECyhSjNAqtCgN8WetvQ3bgFTDNz5SlX/UomMM9OdrjOMswMtW8
 huetiTC5GZTMgXuEg+qdwjlAabkHIbk=
X-Proofpoint-GUID: Ms9qdyU1AI-7xFWX1sJuf2Up5w7Kza1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181646_716432_EC9354B0 
X-CRM114-Status: GOOD (  13.22  )
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

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1


