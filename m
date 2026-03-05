Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C55F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=; b=J7jrYU+L0UDl8qKB8xmMUvFVKb
	Ux56jfeJxVT5xSuKACy8SyVLypPOvcE3f77zbgZdK+NuJuQMjFzoxID+s8/vvFnM+s1okzXiLFGsH
	L9r9a6IPOdHrwQCB3B4ULuMH0jxsdGYz1pP0yj5lMjg1eQPXK42ziISEmu3929oB8XtUNlgjfPYTD
	F/arYkB9+uEc1xkoAIkQDQsik5z/H3QtKEQIyeDBu1bBfNlTQE0EZPsLnWm/siipmomo0ocjkahSx
	szK4AIbrZr/n8GM3u8pF6dT8s3E3EiimxcXpQEcOCsdxiSuEkP0GpKfqzPBGUf502TtA3spgCzcas
	WEjxpBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5KJ-00000001Rmw-0VBW;
	Thu, 05 Mar 2026 09:49:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5KH-00000001RlS-2agD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:49:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258faGL021015
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=; b=m0eanmbe0KpQ4EZG
	fwJYyZ/9ahL9lpyukyALogpv9cxSWSnZeI46S33ZVe4AVK8y2C1BH+uW8WAjj51e
	wT92BFgBGN+/uIHznYeinmRIjsiyXz0wAeHa0DubAIIEQxHOABkmvXPce8xeNjyM
	6AR1gEQzM15hAJwrCcq3KU83KNRg3jWTigIdr/QVnxcjxD+IA83DSU9OYuvVf8zB
	PTBe0+x9CXtha7Xmit5ktXklz94yEMA5WUH85/oB8mBKtl82+woEiJZdyqIWmucm
	DuhMQvbH0wTiebtcRz8pTsHL7y2RymWb9eHAw7H8qD9b5OUxTsiAyhhdMdilG5Xx
	xDkiQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptj6us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:49:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5032e68560dso613721561cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704138; x=1773308938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=;
        b=Q0mA1HzhaF2oHRk3qX0ClSwW0Xn2gHE/Mm1p6zIOSq7PSI9E68CdZr2X6AAgNh+PLY
         0AKgzrCoPRfV0aH3bC0BCz01SiyIPpsw96HguJo89E8sHWUruwtvxxWvs2j7iylTq9oh
         S7V2p2Hanf3YgnUu/mcAiM8OBznjMtHYXWh6RDMU1Xgs7mft/EISrTCETxlveNXje7V0
         sLh144+/pik3ARyRYA1JeURMn8ClV8SXoUy+uNNMunWx1RcjKBfYHnaJwphWdc/rMCuv
         eECZgoYUM3UJePyeYbkOBNBdpBdGZc9FKJlL1Qu9H5k7vNVzC4sETSafT/H9hDptRWms
         6zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704138; x=1773308938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=;
        b=p5Kfds137HysZiUJv3V2a9YE9YWDRs+v/ubVAAIpko2RM8ZGQqA45ifMEcLoCx/04l
         TToQJ2Rpi5VHAMfbu8w6vVjhitRElgYl9Dk9nZilOjdWbIQkEp0IfqJBS9jgd0SBGJrn
         6bsJv3vmodDNI6l+hiOGu/MAg6Xxk6UdI9U3omp/AlLW6rFdl0LH7pkei0K3HBZShog5
         M8YkofOIih5+8G9JRGCjIZKjNnTpGCJYqbTaFCqErUjqdKweBj/9pKVwqMvw+pe/cqbi
         Pyk7lehO0aIZ0vAxQbF2Q1Eeu2ZdoB++TpOhQCdlTtp213EuYFiPUO3UudbFHjorTaZN
         Vu5A==
X-Forwarded-Encrypted: i=1; AJvYcCWrG8pWMZQ7sQLrSXQpOQrGEvXAwychI7G2k4qR0T195uKnDfn2n7pol1bLW7Ik/RAyVafti9HGkSuyDdFLwWt5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3EeuQRhv2c6QGEJPXP9MY/d11l4+Uv9KAXpavDsqNzFaQ08uC
	YSub8xGnqU7YbpgG8cyn75A0IgOhPttY8CAyqz1jO+Gl5r6i2KbPIfyfT1kmb217nUL2K7V9E7G
	0b0w2PifxWqr2Vj+jEkWd2BK55B1LeQs5AXpo9YARyfLbsLc7uQUhv/Jn+M+eCG5NlvqEH4X6TP
	Mqvw==
X-Gm-Gg: ATEYQzxK2n+zpRiVPXtb3wDDW08h16riqARX6EkkgfhLfmC8XQg4+D0lYUZOcle3Z5H
	hRh8T/2hIJ0o72HITplelMlMefIxYpDtNMUZljeHP8FjofM+u9jkBz5Ndd6lrsLjV0nJI7V7nPr
	qgh3IednAX30Ebq1JmJTm9Sj3Zy44mmU1V5DBOZQpKHs8ILKCk6deJxYaQ/cSY8wzPPo3x0vsW/
	Xoh554g/FuYAQrVg+Z01sBFOTQLGnsoO1te/prVev1SZmwyvIznL1ouIoMeVnrubqbU6kf/TMIc
	dG/3Q4hT9s479obijKxbPKuNa8p3AYq5TzHGVIeQbly5enCuuH4vZnQpFFryRObcV5C75q7GbzF
	Mgs+FCr3tJ8QVLqA1GtuJwqGkadnVetConnrf+wFIjOjXYrUNHSXM7iuFhiFw2VUskl69fwKA/S
	QwN3ST7NbQ8QBR
X-Received: by 2002:a05:622a:190c:b0:503:2f21:6355 with SMTP id d75a77b69052e-508db32cef3mr62095081cf.34.1772704138548;
        Thu, 05 Mar 2026 01:48:58 -0800 (PST)
X-Received: by 2002:a05:622a:190c:b0:503:2f21:6355 with SMTP id d75a77b69052e-508db32cef3mr62094771cf.34.1772704138150;
        Thu, 05 Mar 2026 01:48:58 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:57 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:15 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-4-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=1578;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PxCok/m06RL8EtXvhxkBdkhQnDrY29ujrliEFTX0zGs=;
 b=QCvqamsbtXSXBcZDLP6JGVj8UEFEM6iTAPbY3uUtSzvfKRzoSV6fuCQYY0vBFV5l2El9SHEjF
 TWyDUqc5QqZANTVRm5sUT2Yqc9F9T6A+NHbsPYIv5LDxHIpYi7GFVTx
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX6wppjVoZ5yiZ
 k5z9GoXOd4wwc3NtfDNiDsnlojZk59OhkjrVCq2oZcDX1KT1GmVesrdOPcWLIlV/5eg+ljhemeP
 49fIG7wnuns8iRxW8iLQzk95GzKkP3sG/Em1IZ3ZudUIWUb1meHDkV2OVc/6QTI/wAfLMjKr269
 04toQPaW3d+x9OULn54YWWO+gsGKJ41Fcc/4trVRjRFTouacORvJynMx8UL1YHfFkzgHIIhb1cK
 w5OyH+mLEYP3YBThS9Sw9BG0JBt2TSjEwNlRPjLzSDSVZ591VfIXdej22UMSzuKrmQwa2Vvyic/
 0xqFO7zwAZKwWMas/pB1ZEZBFngz09/de9+Z3xrurtt2Sne8HMWZvRDCu35J/L52+BZwL2XMvo4
 veo3nk5D2gc4sMc7osPdHjUUyZMghH3Dmqxe12ynDSEkH+kKY8wOJNsc4m04ucyLcB+A8jE1EYF
 K71hSrMXcc5+LKxcmlQ==
X-Proofpoint-ORIG-GUID: NyEv81IVi-GC9TFozQdOSgW2EMuX86nU
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a9518d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NyEv81IVi-GC9TFozQdOSgW2EMuX86nU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_014901_672924_6F706D72 
X-CRM114-Status: GOOD (  12.66  )
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

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ace2b2a0bf2b7e574b0d43f98ae4624df03b477c..9da6ae131b9195885458ff4b7688773620af8e8c 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


