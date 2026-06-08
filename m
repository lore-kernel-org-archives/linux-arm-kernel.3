Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E8DCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=; b=EIxuLwWFkMJTcxYz1+zt4gbEel
	qB6U2tGFzscH4C0jTcVTeDjcQp2RTEospG0SJqyiVWUaopl7l25Hqfmgy1cORecXYBYxsziw6+N4I
	D9DivYsIizl5UVzFqme/1R0Dvy1Ei/FLP4MZrdszcJDiphQjSS35sQVxmaBzlgw91yJFRxpl7hg5h
	0dz4rwhSz5IVFDXAdxpoS8n1TDB3j/m22pM+txO67j9Cx4+LMxlo1jg7YjZtXkl4Ogh6Ezq+h1GrK
	YZPgjEWQ9FYGOe5Nl4O2S3ibNK8AlROLkPdsqL+n74b5HT0W9jOZq0FujPF6oacj7HIjzDDvqlJrb
	cOFpb6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadb-00000003hFe-11aL;
	Mon, 08 Jun 2026 14:07:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadZ-00000003hEB-0wMB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:07:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRJVN3340238
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=; b=CnZntvAIZQJCXCF1
	V+hFTzy9k2gmd1IQcKaptkh9SUwkVfMXIp7wRoWudquQkhvGuimw5O9kB1CCDrmb
	9wtJxrP8aex6lAEqk5vTKz1a2UeFBUbB6aoisGsqg60aH70uiXFaBCmwt1TfJN43
	bfjVtHV7XYHRv6m5aNQMo2uDQxaPpw641u82gfKlNNoZ2JhgNgUf2tdcWxo0luNO
	oX7l/TiALY30QSseazctqzbc2xi/m/jj+HmXCfCHiNqAhdcjc6GAElhalnjkvl3N
	onLTjCKsZI5w6cObXTo9WC44N/HP4ra3S7EEYzSMNq8ZL1BeVGAbsRUpuoWsy41Q
	DP6NyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0m7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:07:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so59628095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927652; x=1781532452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=;
        b=BSSNOZCGfsQxeteL536ZjUYNsMK0mPZbjsiZt2EFnZMUlqTd4yllvfmPu0Ssh6JLRC
         3PwOejj7j/xBGUttzensbhlRItUE74Qy9tjFHUug6IG/CfIHX11tCF/s8DoX6Jmc+I0I
         mQfi29W0sCgZj8whxEJxXvP10CoilqOxcPPJMt9PjnWkSVvNVe5xJRFrUNrkZKvY/cZT
         ZCOeye1dCcj8wtlboud5hWQgiojo8cVVFYxu7F6ESaqA0XVa5ezoG+Nz1M4SY+jnH1nz
         nPWCn/BmSqRrWTzFyNHnVsd7S3fsHxgVgsSie+XN3mT7wOPr+7Xd8IxKo+v8SINy6Pd4
         TRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927652; x=1781532452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=;
        b=QMeeeXQcxq6b9zv7OYVlmUF+kq39dgyV2tMr9hFWznOjFHoP+Gg9TbTc+soAJDk207
         hXx12PnQmHptL19M8j5z0lyqBawcaC3E6AJOIw1ZnqUO0zs8N/fSgvFfIIxQTB83Kd8W
         1lTdueFesuFf6T9EfXuvZNFtEefBnZC+ytfRc6DjcfGM09HL+JrKwky4AwQKHSIXuExw
         8oTm8nFLrKcH2thCTLNjvWHr/Tf8Ozh82c2sMAk7MtXiFYimWG4GSHQZ39kSzq7cfbvw
         t4LJ9VdxEMl0+YIOBBpwzxCvfMRfhdPFGhETbvyFZDf6icxZrV08XJ0S+6af+nzdEjb5
         JJYg==
X-Forwarded-Encrypted: i=1; AFNElJ8XUr2TM4hlkvrA/jGqgydfcRbGlBO3M7GjnkzwfUe7JVg+E41BVElqaZDiLn1vtgQM+MDJbtxqrQ2OQp5gUlfV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5d2LwWoFNi4hR0OU/5IRSUCETUq82pYJA0EoYqwZs2M0Ih6oA
	gTufzy1usYEx51lArqkuxBpWsIA4MIxYawX/flUe+aOd5Ra6FEbTZdO0XkT2s6Cpm4pCM7FLzTN
	YJwIBWK6m/OzsfC7G1mL9/vNIjFnZJD1FjOUvVwWNMgzox0EGY+Ma4kdtu+w/AaeItqDYmHNdk1
	NyJyEo5izmj4IG
X-Gm-Gg: Acq92OGHIPmAs6tsga61hDwGpW6ItMudpQBD2BAMfL9fERRp9h6qtX+5TvjQqJ5MBcg
	b4FYyFVb5CFc5C79BeSc1ACrLNradUftubEUIk7Y3q5U8Pc24mMcjGOHbRwxhzXxzQzhXpLunYF
	yEAw9AaQ4C5YhL+RTK/789hLtdvOkdRkS58qiAAyx9RSgLW6SOPZpZ0BBojXPS1WFJdkCqYWnxD
	9IDhD59qvuaoXrBlRi/Dn4M3oypcK7Y1oFJ7F33OsS3LPpg7Ziw5Q0QjIrEkWBwHFKs+LZlHTSA
	ffqs0Hc0jlopmvcTop1tPnGHYiq8Iuig8bw1JLcwEoepfGRjgvEdtRuacXJL7xQIVycMrDJQUW4
	HZwX45S4xwSuC08FOpkJbHyfPv9yaPvZ1w6SeGFDLNmnPQU7MNXHPEe4/TSw1gmc=
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr98642205ad.13.1780927652221;
        Mon, 08 Jun 2026 07:07:32 -0700 (PDT)
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr98641525ad.13.1780927651705;
        Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:42 +0530
Subject: [PATCH v2 5/7] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1392;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ycUtZD94R1/n0vpzgxAkoxJpZE6mj/5H3w0pL5YNCW4=;
 b=1cRNlukU2nfxNsqQpCxEMOWi8oORFoQw1ad5ofMs+sOgQWnHyRAYleyfD6cQ6PgGOlOqRWLLR
 N9AZrqsh6gSBbtWxqnF2lIZigMvXTar0tQAvvLRUF+EXwNfg9WIwrMT
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX60DHQNshjEYY
 8NX6j/wN5Tz5zqiOLrcgc+gLlB3iZZ7zEr29lCG6NoeuiOeAREQlO8LHvmUVy7Mp4Uzp0j+1KPG
 GE6YmA4BKRj7ufAs4piRbeOGJFuPk7CL8UvSYV535VC5Ap6GRlCoU6MNklAhtoh74TsITJF3i9I
 Aswv7my74iv15w2fvpFpBcVxaHKPEF5SaEaUl9T6q0JV8bKQsbiU2pSoBUhB86qDx9yjYHrzr0r
 HQ3v0Dkmu6OLuGW/s/WvWRJTzq+BkxYrm0yKbHE8cjHVN0w7nbOGH0VWuAGvhFHMQCkHeKVjQSN
 raBxlNraq2MjaT+Pj0nqPWPfUUjyV2X2OVGuXLGEPyyMisnU0iSY71gLzIYqJFE6/f9DlwOqJNA
 XpKtTjD571T07xD6r7L/b0tpxScTOKpsvkcwoaBpBMjR1/XOKfd42SzuK3BhInPIJhCkR3h102A
 Cl8J55Orfw7gtiSse6A==
X-Proofpoint-ORIG-GUID: UYFGQ3RfBdQdmn-t-pRMu7VHmU2Xk8W1
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26cca4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8fHhTolRNNEGZtKOGWoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: UYFGQ3RfBdQdmn-t-pRMu7VHmU2Xk8W1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070733_272793_AB9C8038 
X-CRM114-Status: GOOD (  12.62  )
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

Add pinctrl configuration for the four available camera master clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index fed71131491ebf6e261bfcd14b5d4a2624837878..2f0f7710c2897e140495afd8d4e8bde50f356096 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1


