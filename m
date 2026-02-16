Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDA9E7BD92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4UOtGqik+QvwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=; b=sH58oyUmdbDR5JOqufKx4RCEby
	uLD49MnvCb31FLLxhd+UtY7oe2p3BuD9ktLuS5F0rKfjKePTOW7SqZWndd7hzW0ihBFEcPJbB7j92
	kD7jLR1YJ8hmhGYV9VcV2HmwiHZ74rfNOdLONjPgGW1q7QcGoD5GntP18ZRhhu90AMS1bR4+IQ64v
	H0yDj97MxJtt885JeafIFLqgA4oljUoXfGypGS8GydwU0nEC4RwQwOMuBOTtU7/2TpTxQfRMn4tuP
	6DMx8olPrzWt9iaPXenRRS6FGl3L9QBa5GLnHW0mK+8ImMire/oGMQ4zTjpLpgis3avXynfDa5kRr
	OORbNTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwP0-00000006PHV-3wRS;
	Mon, 16 Feb 2026 11:04:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwOx-00000006PES-1hRv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:04:28 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAHqq23272627
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+4UOtGqik+Q
	vwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=; b=cmxjZIKmo5SdpDShUOOsFDSR6fr
	TUYz2J13IMDwq3zI7dsLgcYWmcmym3kTYr4CvzAIC4xXQd0zhlJG6h/YZeMJE0El
	DvkLNSf3I9TpEyL81oz/TdNtZh5q1nBOanEy1YZ+QCpueYkf42gv4s30q/Z14JNV
	/XKMVFgAwdSZwdhwARVG4UetRhbTYTeiJSzmSJFTodBEFGm9OSFaKoPtfT7PLyPM
	/+cA1o9zVKYr1SPObSwHcAIdj0kAW/fiCeb1iOagBeTvowndnviMyuUpmaFs3wnB
	vPR+HOY/9v9cTH+cBzGH27Y2YUOAmta7mzdXKYanzXpnFJcZpEDJnnFsUgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jc4t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:04:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so2129357285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239866; x=1771844666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4UOtGqik+QvwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=;
        b=KRi6IBf5kUWj1DLKr0WhA1X32NLGKjzi6hNalUc7LehK1Np+aLnPS28PK+MxIqMKVk
         j+i8bOViiiPXxxcCKUIpl8QOHApwLqNnVN3xxTFqIz6xI4p+STj07cBB/BjBm6ejfc92
         l16JW1qrDKKu3IVQU8llZfRR8nC24QTF19ijISH2H1SackQWCpH9n2dsDCZ7q3aCxxbb
         6YocKy30WDivGo4EGTZVlxHfboQ9KRNIf83YH/lKHU/eSM8Z0WvFclG6uCZMbaoBhMqo
         urqNCGer5O5mPJOL1IG9tWSSnPlhkZA0V1TlKz0Csr9lbMPw6bPNn8e94R0KIYmg5mwT
         u3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239866; x=1771844666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+4UOtGqik+QvwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=;
        b=I5riNA5U4PhZ9bntxvVqaUhORSDawGFPtGUntEyl0+xeV9rq54VdEo/RQxg9BmGCnD
         JoWhHPiwalDzn2nA61h3LFIpRXeAWCQXp6xvi3xILoEP3raP7VrkQc358UNcoHaIj0Ln
         jU1oKJlImrCq5JyE4e0T/Dgl0uMu9SxsAGkF7NyzwOmaaNQs9P243mz3q+3DLHkx/a2G
         rxlkkl1odvlsS1b520VaRy3Lgst2WyeaC0C834Aj0/dDJXkGddWc8rb/KkEvySmfV5gz
         KpBc7stNVP+sN+Sok0CK+Zw0Dy/MGYc7yZRIRmX42yrulX2+DWPsToHpansziQQ8GBYZ
         8IlA==
X-Forwarded-Encrypted: i=1; AJvYcCVJqu8Y+mqzgPwf996stoBlx6twxO4UxsO3/o0MYKOIAptdnwtQqDH6bPFbafpH4rRFa0Z9xhjiNsJsGfqW6CMi@lists.infradead.org
X-Gm-Message-State: AOJu0YxNkRVXt2X81gr0xmlwYmBKh+2+J4+NHNldHIG9TObiuyXp0vhD
	E9k++/pJX1qDkPBBWujTqz+jnz951xmy4nr6OSbBVlHhuuE65LYHveAlJO5W6V1g30yVZyiij0w
	qtuj4x9MxxoUJ+im4vYN8Do211ukbEgNXjdtrnAQFOPC9j5x4noGoR+iKZCWZvGbHddT8KIryek
	c+jg==
X-Gm-Gg: AZuq6aLwMdEG0QGQrWUpgqXU3xeQbMpR0PmNVBtrvqW6OveWb3ek/8ypnFkvzToYV/Q
	IvEv2XbY/jA3XVgeCAUEgRxrhqI9jpGdX5UI1/nagZPi2AARQK9b/vGRkZxcpgd/qAYm+J/Nk/K
	nLXkqZjMu0Yp+HcZk2U+EhgovyRGJGAFh62+9t9IbzGTaZiGtSkINJPhMKFZb2wPOVMrg6m5CUo
	JvsmqeQMUnz8ofu++j/nc1Lae60A/qW6B8fPHlzxm9U7/8elBf2/SX9STHQFM+b3VqeH2irhaon
	4FL+LEQUYI0Bztf5BIhCR59cegrDDYId1sc9ikrJIQoNfvxEUuYoUhKuk8vxFZL2RJehFP86Gg7
	WLGdpWgLkmLrodTuTFDu+ouzz5Df06Q7aFEVX9w==
X-Received: by 2002:a05:620a:46a8:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cb4ac7d40bmr980230385a.29.1771239865779;
        Mon, 16 Feb 2026 03:04:25 -0800 (PST)
X-Received: by 2002:a05:620a:46a8:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cb4ac7d40bmr980227885a.29.1771239865393;
        Mon, 16 Feb 2026 03:04:25 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL pointer
Date: Mon, 16 Feb 2026 12:04:16 +0100
Message-ID: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PuKi//RWjSJoYL/Th2Gud7CekjaZAZonzL+Z2LBjfj4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmvJCfKJ0aoPYfKrLswzpxol6BGDAX4YsmZO
 Bl4p9IrvUyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rwAKCRDBN2bmhouD
 15cAEACRnZMiu1htoX9cxB1Vwj+aBvwUSP7uhENSAuxz8GHr6mSXXOdQgpL68JJbK6ezXC2Bw3Q
 eNAW2+4p4Hb8KznZpMYdQMLp9ojUjnYWOiPwGhn4aY9Ql+a5pgyy829zOmRFLRmvzgZGVpV/85s
 RpKdcLEPNMQqJKWtxG60h2QehNJ/G98WeKyYv6wLxdLiDtPOzLIkGcMzGHzZq2Mo0vDGY7zLfvq
 NLM36XwkuC72+xoSD+ZXu2ThHwNlQPnd0Y2LgQxeVJjQifxGpWl57sjCjDJELia4kONzGcD12Un
 0kOGlJ+M2IBJud1IZsh8tvXCbrW5xgUSw4TaUtcoh2aQEuZvYngOp1zz9scq7neibqfkjB9v6dq
 4AHVDf+JMyxSu8M82ni+fqzZhe/sfQFxHgeVDU2bmRq+mGG0gjUDbTHJLopusUvR+D+MzZBS0yr
 rmgRl2wv5GmV2+rI/c9Uy5PCC2Ru+3ulCJlgUXP1n3potgdWQaq4lDJpsdH+BXbRAX6hN1rROwq
 ZBewIiYOb5xvlrCU1fxeNxus8gtpAGFQK5fS+686iQFzKeccogPVZql9U6nDmvMpP3FMwY3PSlD
 vbdyXChRug25nxLQLErXNk0wwmsFJd2Tn/Myi3k39XKAXm5ylBjNQR3YhFP2AAZJoLD3ikvaX1F vpaEdpXC8IZvJGQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=6992f9ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=RGc8Xe-UuCxs7xLLDosA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX+5Vs+VE79kUs
 qg7mQDvu7ejLsr75TKN8E+trULVLVNH+cUc5zbyxJFdN5zBEiASwx7UvMqtMlQgmdGReempK2YY
 mT/e8OVvY+rbKCOHkIEMgBuaHOOFKzGf6xQzS8Xm59DCmRRURjLhSXQtdl8knZcr6B7QK0fHglw
 pqsz9NQpzyGsmTLFfpewatG6JDaQgEEThUt2leJoM1MCBD6Nwh6d1i15hQRsPml7egvxjeBhywT
 EuvaOXDtMzt4j8dGBNRAIeYe9ApazviJgNy62/ZOW9r/6xGD+FQ09w37SENHprAgJ4GURp5nRqx
 0U/pjYHSCrqxzgmkRTWJqEWQi3u+Ww3WubnFniasYMhiD/XKO5xguettad0uCn60PuaxQKuF1wt
 e9V8FB2EnuHjTTVpncDZ1k1V+pvbbXrKRDJu0/vrElTQB4jA+nG3yJf6k9WKiatc+7Q+X4fVR8z
 T9XcrJxshKqylbqs67g==
X-Proofpoint-GUID: qpIrohKVUBLfsN_wwEKA6DuCAUG9QJEI
X-Proofpoint-ORIG-GUID: qpIrohKVUBLfsN_wwEKA6DuCAUG9QJEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030427_446881_5601B2E6 
X-CRM114-Status: GOOD (  15.19  )
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

Pointers should not use explicit '0' comparison, so just use standard
evaluation as non-NULL:

  phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 14feb77789b3..c342479a3798 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1679,7 +1679,7 @@ static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np
 	if (ret)
 		return ret;
 
-	if (qmp->dp_serdes != 0) {
+	if (qmp->dp_serdes) {
 		ret = phy_dp_clks_register(qmp, np);
 		if (ret)
 			return ret;
@@ -1833,7 +1833,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	if (offs->dp_serdes != 0) {
+	if (offs->dp_serdes) {
 		qmp->dp_serdes = base + offs->dp_serdes;
 		qmp->dp_tx = base + offs->dp_txa;
 		qmp->dp_tx2 = base + offs->dp_txb;
@@ -1982,7 +1982,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
 
-	if (qmp->dp_serdes != 0) {
+	if (qmp->dp_serdes) {
 		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
 		if (IS_ERR(qmp->dp_phy)) {
 			ret = PTR_ERR(qmp->dp_phy);
-- 
2.51.0


