Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0633DE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7VrQHP03KosO8TfO9a1+cRPMeJr8Z2/vRw7wFVMcEA=; b=JbVSCHo9OLfonC5W+ttzPr8kbW
	OJfOnpDQQwZByRhd8kR3w5e7UsFGcJL5GrxisAkYw2pae7iQ4ozhLwY4EDNQUgZ5wCVAcyUvTwlyR
	RfAXhOueWzOZIMZRU0R/B92yZP4Wor2Bcjp4HmU2pYFcc+C/6xlEJvbpNDk3QVQlN/Ix8dpGytBhC
	Z/smfrpLQOQLPXtj83ju1Mn2L+AtIJm3Bm17COZFN/3MBIHNwfZajEuHs5UxeF7Nusw7zGVppdkf1
	nqPZHiqBViK/vBDaxu2PV/eZ0s3fyum51SelRRz4sjM/s3jIHfR2rVM66zb3DeBJbNPu3gsdg34Zh
	XKNRB7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRfD-0000000CWhe-49J2;
	Tue, 17 Dec 2024 07:06:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROU-0000000CTJ1-411e
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 06:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D7VrQHP03KosO8TfO9a1+cRPMeJr8Z2/vRw7wFVMcEA=; b=jY2cWpfrNRdfXB1gRrXFf7Q9gn
	JnnhThc7VB1YJ3xHphpJgO/f6ZTlCIvDbtmVe7uZhirKYxTzSGT4Qepe2lOkE6do9aZIrG1aa6ZSI
	/L9jUL8ltfVmk7uC2eEO6+NugmiJ7cPm52v/M1cnjKygmZSdN8lC8f0OLgUlj8EBgyG9udI3HY5/D
	hDDbwt6mN3FcGyPZkG1TCnz0b6Fjg5c/RfFoX8I7ZKxkIEKhsVxKNO34X/AAGrrNF19N90uYCwmZl
	TrXQVGSGGeDsZPbi35zIvRAm09E8t6jOPXR5KUQe3UiedJj0Q8E0OAuVIDERdPpPshRFq+u9eZjt0
	pHxo3e/A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROQ-000000050qg-3fFQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:49:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH5flUb001374;
	Tue, 17 Dec 2024 06:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D7VrQHP03Ko
	sO8TfO9a1+cRPMeJr8Z2/vRw7wFVMcEA=; b=D1hA4CML+wPL+LoAmNW5iwaUAfA
	IK0ioXSLWAFJSC4XNwjLwG3Apxl1h/Zfp9vs6IIG4EU944vp2vgoOxoUWAheJyTy
	VLbn3D3N3iv901gkd6T5UNVqwnFA/3fpoaTNcvUCbPx/WnCkN0aSnq2rToTSyiym
	cdfeiobeZD6+x10NbMw8HJJOlIOPZ8qcXcuQsogIqKrvCzlXs47wUjElqsRwxihJ
	FQezx4s8yDIN3GWbbTm+4ZJimtNG5xBw2BEqSYhTMvCzKYoth0BKzK1trjx27Ujr
	NIHP4IBpVFb3wE5XAZ9uk5fCW9tOlKivQ6ioeQmJeBkT0TgvlT0lYJ5lKtA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3cgr5e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n0oq014906;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n025014873;
	Tue, 17 Dec 2024 06:49:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6mxUt014867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:00 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id F20185AB; Tue, 17 Dec 2024 12:18:58 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 2/7] soc: qcom: socinfo: add QCS9075 SoC ID
Date: Tue, 17 Dec 2024 12:18:51 +0530
Message-ID: <20241217064856.2772305-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kVO4_xVpEukHpjaCZBqlKPg5nk_9pZM6
X-Proofpoint-ORIG-GUID: kVO4_xVpEukHpjaCZBqlKPg5nk_9pZM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_064919_672856_749B4170 
X-CRM114-Status: GOOD (  11.45  )
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

Update soc_id table for the Qualcomm QCS9075 SoC
to represent qcs9075 machine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 62fadfe44a09..174210f3467b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -451,6 +451,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS9100) },
 	{ qcom_board_id(QCS8300) },
 	{ qcom_board_id(QCS8275) },
+	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
 };

--
2.47.0


