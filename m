Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98632CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7x+x2EqIKOOwjkZEZOP456OBm1fIhjRi5NcqRMu1zAo=; b=zNRWo+IGw0Aa341zcMYyLjrXFq
	KvoLSaFLEPe6lRJTcUYa5AcZWHREHuDiDi31jxkL6vFmjwr6hrncXjheXjLJAryoKQjlxe9GJh7rf
	LwDq2F1fiUI2ArTetCiT7rw8P2aZ7KmtAkTmLpzMfheG6DgvMp/QntZjQI4tnDyRDmbAVAEfar7tK
	qPjXrbCos+bOZCr18uqcMofk/X+60br5Mroy/NgvJFnX9zqGBLsXxn/9W8PZZPtl4vWtULo10NUmw
	Pr8w1McSbGohm7W5FljvEBwtKv4Os8evGLwMTrIg8rqQraDlnPxF1/7nxZ6RyoLcfYYJ0rRbji6WZ
	F6nYk5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg9c-00000008t4o-2yez;
	Thu, 25 Jun 2026 09:13:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg9a-00000008t4M-0L2o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:13:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pUuR1885454
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 09:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7x+x2EqIKOOwjkZEZOP456OBm1fIhjRi5Nc
	qRMu1zAo=; b=JU9Jgs15W7yICIG0oX8KVSV+GGKv7a269TG3lkiI3j95ZF8vEKI
	fRGXGxhA1ssGp5YQi6/maBNUzqxwoK3OPO3b9AbAViIxIYgdPrxLJSU3jduGL/iQ
	91OriA6xvsU4cdllsBuCz6EZAzAHpEfYQdgBFaIncufm+Oeya9ocJtYddxr6PThB
	33IPLNOtl5LXhZ/NNcfdVKJ36enSmOOKs5dAv+nTolgJckhnrdgbNvvOXCyoEemN
	rRoiuHXvjcP7OX3Tj0kmAkA9e9FBifjY+xktA+elX5UgtcF4+vhmplDUW6KmfEqq
	7HRCQzjleMUc6yz3t1BDZAoZQc2F2GyDEQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmhes2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 09:13:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9227d9b3b5cso506155385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378823; x=1782983623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7x+x2EqIKOOwjkZEZOP456OBm1fIhjRi5NcqRMu1zAo=;
        b=AJz5ywZvu6yA9DpFW/Ol8lMmHJBhc6Sxeqv0xb94nq9kiJpJ9lqOLlqPHeNU6bbUfw
         hnrTK+kCRyWXPtEnn1vHB9uqUcp5mzRVA8jb/Y4kaXlt8NN3XSSvANrChjAcz9Slit2y
         h/WglW+nHjYEQiJUhsbw3YRiuPj87aoWb30Z4JvxyBqjHYoARc4INeu/JD4FUKCdCp+7
         /bMJ87L5jLnWCJGRSmGGu3ee4k1j7jGSZBHfJCRfvZx6IWaNejGHjNkRUtNP/pdn8Qnt
         ZO4895hgGB00sghqptkwXZRj89UbkJcoBFKPWsEObPPzME+h0Sjy6Hz6+ntBCosjuCko
         LwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378823; x=1782983623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x+x2EqIKOOwjkZEZOP456OBm1fIhjRi5NcqRMu1zAo=;
        b=mviS9iz/PPqI0bbV/qAtAkTWIwNs7HGkwHqekhHq2cShJkpaxE61ZQTgff7Zeu1KvW
         ZU1lXMsS6qO1vYWYM+TI13quwIzVnMvFmsP37+mA9kZRdnyqR76XQ3ps5ZfofTGYVnWA
         QsHFRiAFfcLiXZ5y8okUygCalPB8YimJx6ibk5HQuTOM1Pg7n1TwZHGdMr5lry6ycjzE
         bgw36As1EhTUvWbE71FIBTLDJPz1qENQ+fLaNYOCnUormW2wkQXk+CaI4vNHBmlaS9L2
         VxzkFZxWk3wLJQP613+odB7vqSpawUyHvbfrAoMZO3t0NVNaUfNfM/wVCQqImPdc66lX
         YqHw==
X-Forwarded-Encrypted: i=1; AFNElJ985cdvDoHWDR2Gh7KqC45tBQWkwMo1sml8nb7v/DkBQcWvsg5OEh2eRJBM0cJ/h51Lm1MGAGym9y1IkVOZTkFk@lists.infradead.org
X-Gm-Message-State: AOJu0YzEkuYupSLjtKfMQNmu6n2AcpnfeHW4VSIWk8AzBbwUmhi+ueFw
	4iLHrMG/CfXAuVk3aBt6n+RFnhFtpQi4bOK3RD9avl8WihEDrd6E5Hpx1yAxk9nrweKfcjX/7Fp
	Yel4uPLnTRlSGEauC2fviA7FoE6rLtq8TkthkvKIyHyGRaQ+hWyV7x2RmFR/lgL9c+pa5jMvfZY
	iAMQ==
X-Gm-Gg: AfdE7cks3KywpBNFVOgfo564iCIkNGBL+twaJLOXksfjk3FVVvBkwPhSsdhgYNMEEgz
	pt1+QYC3TjB3KA545ZQ69cKXVLn/bLHdSYqpmszIgj8kalGoWhKbql6n12+TmZTShwTbzncDbAe
	cb8ZnZGv8vjgVGIykwKbN+5htPzsMBCFSISgSCMh9liq90WG7tKDcRgSRmjBjLUAEd4oKwYD6lt
	k81a75Aty8iIlkXdrml1zWgSBctqLN/zOz0WH7umXNKqNYCPaqNg10tkwFgbhWEyQxAnACMN4XN
	F6WIOY38Cu0FaOYKsqZvqjmRDZ4Ixt8Kp+3sExvhD1QWVm4vHeF84o3klqveBl+7wIqvvKHVhJz
	Xkv+jMajsepEWMyY1ENDhCtD3wdU=
X-Received: by 2002:a05:620a:bca:b0:915:c4de:7ab7 with SMTP id af79cd13be357-9293d5b513fmr212349785a.35.1782378823268;
        Thu, 25 Jun 2026 02:13:43 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:915:c4de:7ab7 with SMTP id af79cd13be357-9293d5b513fmr212346685a.35.1782378822800;
        Thu, 25 Jun 2026 02:13:42 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660ea064sm40413085e9.11.2026.06.25.02.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:13:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: hisilicon: hi3798cv200: Drop unused clock-names and reset-names
Date: Thu, 25 Jun 2026 11:13:36 +0200
Message-ID: <20260625091335.106951-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=l8GEHoorhaF1fEe6cH2o7fz4xeI2z+vO0aTX+zd6f3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqPPE/7g1cmUqgKKbTB4HQAf8Vv22cAfJz8XxFy
 URzWElg5/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajzxPwAKCRDBN2bmhouD
 13z+D/4175rTmNwQKb/aAMasdYPQkIP61TCiEVWS6gKyTZmq5cmhHwgtOk9ZM3nTrWkAvdygmF0
 k4vfg7kP/o9+yVDzrPoNtGbRh8J6lJHhJA36L0tD/j9bXO7KVM9FV790IE9sgiU+LFO9bPCPTlu
 dUJPe3W5cLU6S7Gv1FjrausknavN2bEdHgV/iDgNe5L2guiz2IhiQB2jkbak1SSazStcF5VxAmC
 nqlHEhGfuzeM7K2ZUKx9/rxHCPXiUrQB47uzfW8TY+MlT9Pluy29LDisydcN9KIEmj9JQNm8KGh
 kb8GJ4NbYl0tkQbwQv0IeikQWT+fVs1pD6WydZceVaUisBOOG7EfZKRPYRENO+USBYho2I74KI4
 Yffvm+QaPdxFsXQaMP4+cdv5jSulgQNWXyPGCivmRA/BGdxI7SZ1BqYV6+Sg1PuOGLkTpMIOCxa
 KuOvqNY3VGRvmBUeYlpdNXIzyx+3z6FvB0rtzaJvymIzSrKt2cEJZs5PxaXPRAG6uV4Cce8Ljb0
 14TcSfgP28n8TD8YoGbfB69QR65PSLWKGrPK44lSB4G0idp5JUgabN0Bc7ZLK6Bc3wh1CFCTDty
 GWLGTx7llF5vgcwZM4jkwbGuiZFlxSPvNVdGTfyOQUKcoODbMTLMJAMbQs+kr7B+cyEaLeCPsIi ID1+C8h13G1SoUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3cf147 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PoG0SKuk0EEFDSeeQbIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OCBTYWx0ZWRfXwTXJbCGjxqoQ
 M7uk9yglhjJMKAg3FsEjm3fqILQ/GhlI3XzrMUHFWumpE3tERCd5T53HlOSDCk5VGbXTWwTxr0J
 0obfMSdu+ks3FeJxvpkEzt8utaWFGYNis0lwODTk0/ymNS5/Rb8VY2uOD/1uQA0Ld74fUPBE7Tj
 KrIn6DtuEOtqBbbxI/msjOmVjdfEMFKBg2vtxWqqADesfeTPsahBG6vyZMM1rSxR2hXKUpMkQrA
 5TnHRW0zAeiDy1k7ptOnX2UjinKXZVnCZrTo0geLuATPG0GAInqzrUAmDUYaGsrgXTcXBajcuBE
 23HG7a+A5cVxsxbp4TRM57OfE5vI1U5NFf9EXKwiLBOEQoXJv4YWBXdHLWC7FlVhZORyg71Wj4k
 DyBBFmXqVjHstj+1qT2lvFuwlUyJkJ9TYxwqlluL+vQWzycKzSOsb3ruqc2WWhfdaXkinr4nYKa
 puQ/iHmawwfQ7RYTgsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OCBTYWx0ZWRfXyJkuZCOc1O4C
 mefJ+wcm8JijNjR9q/jTJaGzjyJoLSKCOSAgb66rJFDOwvYUaX+XUMlF8QeAHC9xZdKcXhJdzzK
 WUbwjOFYOIgg7u4M29dhADyWQ9vUiMQ=
X-Proofpoint-GUID: YPMwVlxIqjFU416nU5DzojcW5m0QODK3
X-Proofpoint-ORIG-GUID: YPMwVlxIqjFU416nU5DzojcW5m0QODK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_021346_253330_98D351BF 
X-CRM114-Status: GOOD (  13.51  )
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

Neither Linux drivers nor DT bindings ever described or used clock-names
and reset-names for this SoC.  The binding allows clock-names only for
atmel,at91sam9g45-ehci and atmel,at91rm9200-ohci, but not for HiSilicon.
reset-names were never allowed.

Drop them from DTS to fix dtbs_check warnings:

  hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): False schema does not allow ['bus', 'clk12', 'clk48']
  hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): Unevaluated properties are not allowed ('reset-names' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index 2f4ad5da5e33..e5010c9d4c39 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -633,9 +633,7 @@ ohci: usb@9880000 {
 			clocks = <&crg HISTB_USB2_BUS_CLK>,
 				 <&crg HISTB_USB2_12M_CLK>,
 				 <&crg HISTB_USB2_48M_CLK>;
-			clock-names = "bus", "clk12", "clk48";
 			resets = <&crg 0xb8 12>;
-			reset-names = "bus";
 			phys = <&usb2_phy1_port0>;
 			phy-names = "usb";
 			status = "disabled";
@@ -648,11 +646,9 @@ ehci: usb@9890000 {
 			clocks = <&crg HISTB_USB2_BUS_CLK>,
 				 <&crg HISTB_USB2_PHY_CLK>,
 				 <&crg HISTB_USB2_UTMI_CLK>;
-			clock-names = "bus", "phy", "utmi";
 			resets = <&crg 0xb8 12>,
 				 <&crg 0xb8 16>,
 				 <&crg 0xb8 13>;
-			reset-names = "bus", "phy", "utmi";
 			phys = <&usb2_phy1_port0>;
 			phy-names = "usb";
 			status = "disabled";
-- 
2.53.0


