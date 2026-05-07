Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F0FCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=; b=dt92r08aoxxKY0i5mxs2pOCtyw
	Pqi0xcqmgL913z501UWre49po5OV1oBoZluDt4FKddNn1Yy7aiDZVIBrUCEf5bbmsbuVyZN+/5aSE
	BdFHrbdfdSesPEjC/uir3Ek6QuWNu59/WDnsfctQPfPtqZvFlRTfjKKGg4f+/NVNYIBMobzv4ONuA
	nwbXLKnSzog1Zc6rCq8AUkvqQyK0CFpdCwrMrXs1h7lgjbLMrdp7uFYKeEumIkQsm74S/5TDhxnBa
	b3dbH6OiDqVaWlF+nZlx6enoTWomjp1vEAMuZ0WPxZnAq8TX38xfynUhsPPRAmxdvqi9vN3aGx3aV
	uWtRfBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTT-000000041rV-3qZF;
	Thu, 07 May 2026 14:13:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTR-000000041ph-439Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:13:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BZrnM682767
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 14:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=; b=obji58Nu5Gqj7unu
	WszKTUNm+LSt7bdUl9WT176axS+Cx/oD0+1xmjSpd4pwd3Pn9PZhtjhGOFrV+zvj
	SwaCSHKGJD7NifcMNmOirpG6zovXl5econsK0Sj6aiJJybAp4QN49G7FtSR6tAKk
	M/1nsn9SGrGNSHQfKfr8H5psRxu9SZtTbBVHd1p9MZdqHmHmmSx1MQ2YRDa05Dsg
	/0MliZllnnoW1OMiTz7DD9AKFFf1zU06+iOs6R63eA8dT9goccItGRtxoPTIATeT
	O6DwrBuBSoshspgE/nYtH2R31ypBf6QSpEDWWCEYJ7pgxZcZnJUvFPNMf+naxmKR
	S1uLqw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhaswv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 14:13:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so503724a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163189; x=1778767989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=PlCfIWolgiMf47n8nsOEnfq7OcY+6sE2IoGS7mPHuVanHDR5pOEOKwfPPpSwMmHd8M
         XhHNwej3qAxjgc4TvjC6SXTdSiOyhugDbLD2h0J9d+vQgQek+uKOu+EWcw28awDXFc8Z
         R/p3P3qAm9eSidHqsCgpF6pK5OUmtCmragZNH/oVHvFXWrCQr2tId1L3A0RhKi/3KKzU
         w6SGoTwLeRAZiP/ecikhuXCjxcJunVjQkhcUGjxzlyXca/jXFJ1IEdzodCn83Gvq7LTt
         jud+b99rYj3MqsMTEyvB0sxxcp3ncqVacZJc5G1j6DLTGOCwqDKRD8ia5XaRAY7JKzER
         ECcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163189; x=1778767989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=FrkcY+h/0RFkMl7IaH/RlSOAyNa114Wju66R6Bvnw+tVUw5AIlOEsJkJq1NfQgs8No
         lGmdaRQ08a2hzf/W9TkgVSYkCbYWPU1NeQk2qVf/m6bj6X7OizT1cWipP8YLdp7fHbTb
         l2o5JB8PpWgcP/gQDgwNtNY+NO+3+FEtYwYb7qhJ3tsiWFNNZqSH0ckosYcGBldHb1cU
         5/KngbvFooAsxfDP09v1D2wsLeJE32avyr3iR5l2lOe9fDQ9M3SNNoP6RH5h5z1aE51P
         sG1b/jZBFVvCHJkcL0/mN+tlCmt++Uv49Jup2mFz2sy2c4FCuNN7E0obTfcC1oBPZE/Z
         BcEA==
X-Forwarded-Encrypted: i=1; AFNElJ+PhYoDhdIAH+59AQAAO27LAXLf0P3RwS6NIGfpOpuBuIYMywh7L/Tm4RdDQIWSZIxKq2SNUw3veqGkLcOiF+ss@lists.infradead.org
X-Gm-Message-State: AOJu0YxNnwf1EdSc+lBSZANbCKqQ5POFCID5dE6uewh9ZvZc7QsFUVbP
	JARlPNXRy+uggQO/b0qqHi0kIuhHU2jYLC0AtCiKWfkI7JU6e7ixjeEjX5R4FJUIO8SmNok1wx7
	zo7ZtW5IyIXk//ZI1/KTnF6YIuUfDWoFsgNVQKObFDqmZjOvnl/Q4tunHqcvLpId3M10PQyTo2m
	/nng==
X-Gm-Gg: AeBDievSjMyST6khwewLJTRe97maB1Q21i+tfxkwJ3x9rZOhCen/UKY3ulKhlArrpaN
	33QKI9+7E2IqiOFZxjUsGIxtsNVEgh6dTxEDlMH5qbE8+wTTyzTWtKeI4f3fSD8YGUvAbP0YRvj
	FVcL0tW14bqU0NdnDVrJKCG3o3pJo5obNBOylmuW2czSI5CzBrY0946/S8+NuUjm/ZLWxVknzQ7
	0Fh4RKkmX9HVEfPgdiOgVM3cm/C4x0Al+VcvbTxv/XLEjtdLQsluUmRdBYWYGOEbwPZFQ+JS3Hw
	DqOlHPbCqQNp2fXmXNJCqN5emNbzSSULbF7yumer/TvLn4ReTCWS9+JllIitpQUqLGh6GOoWNgx
	SSAnPTV0EKomPo/MIiXcBwJX3bd96J0DKsjlg5co3E/4cKutuvTBOh8zYQdj86e0MFZ/5l8MGX3
	1NWTfurbyqCogFwEEl+rY=
X-Received: by 2002:a05:6a20:1591:b0:34f:14d6:15f5 with SMTP id adf61e73a8af0-3aa5a934e9cmr9687599637.29.1778163188799;
        Thu, 07 May 2026 07:13:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:1591:b0:34f:14d6:15f5 with SMTP id adf61e73a8af0-3aa5a934e9cmr9687531637.29.1778163188196;
        Thu, 07 May 2026 07:13:08 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:13:07 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:03 +0800
Subject: [PATCH v18 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-7-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163147; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
 b=sdUjel/sDCFE86TLQatL135VVmhF1NPENX06ZBgfvs2tIhWEvaoHw5CuGwyXPqG1yiqTdbiLh
 /Flw6geY9VtD44J9V2RyI33NtrFE1YU/yPggQvfsQsNwzrZmJDejfn/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfXxX3w99/Fs8kG
 jv/AXiro4Zd7CnCbXZOPz9E3aPdq//zotN3yosdT0WMLmAW2XJdmxQzTPar66ZUD7P+fXk0cTfh
 otyzFBwPW7jpzWGkGX+jF2hKcGC4YNjchIcNaE17EGNbO+CZHh0HphmkpCwoSXHPCGCV2WAWs8H
 phgtJO0/DmxrAMq9g62dPzmAOUw3qGTesWlKQwLIGIraLl57GBmhkhROKHO2E/A7KY17wtZTVgQ
 W3CzY9frpEtkyMsXMubtPatDMHSdaZfnsM9J02uV6YKjf1pz7BzlA6Maui0Qvdm0nyY8c5aNYfP
 XlNk/7+s1ySdrHBjXnuqnSKG2Ra8/+Ztwl9cRRGz3jsdB7wCZPYUGbZwiy1BfAy77npo2McdWUU
 Fc17y21Gxp+JUJEELOmp4DDBraEu7WxocvW0DT2UC/qVByZQT4kQ1g6ihSqnpyr83D5qoAEnkfp
 4RUw3CRCcF1lH0S8XSw==
X-Proofpoint-ORIG-GUID: htYlylyWOFbNVmY2dr7zZpto6EFHZ_0i
X-Proofpoint-GUID: htYlylyWOFbNVmY2dr7zZpto6EFHZ_0i
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc9df5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071310_028152_B4818AC7 
X-CRM114-Status: GOOD (  11.96  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..2cc855ec9759 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


