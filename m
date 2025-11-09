Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC92CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xzsLq6x8zujM+mSWgjjGh8I+QpYkRNwwRETPEDP6/Q=; b=eG4yaYOF9X8UrHFUDGikxjJiAE
	oCWWkEzVhCYU05/SRhMtI4RoYoqztvEXQKjBCGc15+94O5mpPqRbE5s5Q7LoysNrYE1MpJE0X5lpl
	CNTd2qkuj16Ninqhv0pxa30NvUkv/WAc6rr9Tjz5or4+il17t6j1+WqM6FC/8BKQlvoov6r7kCeha
	yTYdfvZQAgdIvrobWvxOXRo+sqDj3I4EDiJt7QKjvqZnuAS1afAnfJYsX4zzWTyg5mboOGbL3RmUy
	rqcqbDkGpXR0bzVSCHtgOHlhHKaLrfU4fwDlJPZsSEnr0zShddWE+GNda6+mspQx08bSYARZ6iuTh
	ftvE+2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Zb-000000045Lw-1BRI;
	Sun, 09 Nov 2025 14:39:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6ZY-000000045Ig-2zRW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:39:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9BNEOs399637
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xzsLq6x8zujM+mSWgjjGh8I+QpYkRNwwRETPEDP6/Q=; b=PY0hDFBGvwSC/Zwi
	eQZoP7MaJFNlvAN82OowVKLHEzV8+xZVYpiffL5WlL0Nxs2NFBYkGvGJXUpIKKUs
	6FaAtf5VqcPX2TbrYmq9U1JSvr1225VP/huhWBvQkIxjPy3GKfz1A/V9fzYR4B5J
	E78Tcc772JXXsVgdVjboP+R7uxLcJq5GmMpKdH+Ca5YfxN3wowd1cZi/WaoXS6Wg
	ZHgsiGko8Jp35Vea3xz2lvUH9xMYdC5gF+Ed2812Qh9vjBEncXHOJ7Icue4ijvUD
	7v08VXreRAwwCdi2stgO3bfRQQtOmHbTY2cUxflaZU0pPEdVh1J6uUoRwD0wKFg3
	pBEU5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xvja8g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:39:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29809acd049so4824645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699154; x=1763303954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xzsLq6x8zujM+mSWgjjGh8I+QpYkRNwwRETPEDP6/Q=;
        b=PsCmJ2rTGHTqXAhTSf8e1pBBFQv5fHPowMObVQIpyKKZob+eXf6L6zVAYaboeWqnpQ
         0NWNOGrRsc/VmkXgqyHXqQHdfQV1ce4tghy9NzqORkTxtYxpep8DQU15bghgl1uEG31/
         gUyDYBolErnRpCHtsfGYlD07c1h6MUb7PvPBEmk0oboQ07QcUSy7pm7r+dyqCJH2SCyr
         weOnE3EZRs73kqoTW4nX/tgJVOqzYFDg0xym/pAI4YRBuGL7HiHKjFvUW8pTxhE8RoT+
         ZXJOgpH9JgJJri1w8NtII+RnBnhxSi/uT9Y+giTE4Ji8B6T9A2uKxweBbWaZmtB6r197
         dXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699154; x=1763303954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xzsLq6x8zujM+mSWgjjGh8I+QpYkRNwwRETPEDP6/Q=;
        b=gj5RmzauzNpA+HSwyl+JeKINIt/sB45INkETDncsKS17W9hkEqZBMqOfUYM44K5ueF
         q1p8tfRgQL01WuS8R9qLK1TF6tCJTKcEUQdL8KWmGYCljNCtnnxbAoMCd18QTCGL7rZm
         txRCTZu10513WXmNf6U/yfdVK7Ajumc0ukKXDZ70sgBNtKIwT4Vu036230w9O4azqqwh
         yM2rWnocHDevF30TAIeQEdYNSjPaN8neW4qOnD5eRcl7fErSIrwn7bI+f3pqOQqYcPkG
         D+mNhpOA2HZquTE7IJyYDLWWLlOrflnXrbheP0oktlh7GL3r+k/U4NmWIfv7IkzCVXOJ
         IweQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQBgzeQxgck89prKDhYcbECWJBBiRnJe5+VV6L8L9ucP3QJfj6QL/9FOZjVqpax3JVKgrmRYBcie3RE1IsKM8S@lists.infradead.org
X-Gm-Message-State: AOJu0YztPnj+q+smVYqSq2xxfNPSDkqFJPJHn8FHoiV76dri9Ro+F87R
	y/nRRTeY3kTKWssMdRBOwEfxjc+n07YZuoLyR8vDos/724R5VZ9JmzTKug/BwXWDbXeQakwPIu+
	ICbml/toRJXKFr2QnWYmMfREzTP6zWaK4EBzR49L8eoQr8O/RNrlpWLJbY1a0qMJu/K20uk/ZlR
	MK/w==
X-Gm-Gg: ASbGncvkHzwKI2hQerWkxBJM86U4IshxCtx2NhOOhXa5gRRkBFhdDNyI4bLi4p0RtMG
	r740TSntZlK0BCbNJrf/2PXKOGnpJ6KweUTXY8y+DNnFp88qzkam4ZEx+8P7ID4oI7YcXDV7q1B
	cSXZmqVNanH8dXc1/yxvWuhKx0aPLKPpy3qMv2n6ZHYlxyux65denrM4okGdfCi4nG6Yi9DnYOa
	iBQuqStlt8rSYc3YuIjTeo4Xg5gdVV7lvBFwD6zOC4///2A1TPeZYpqyoQ612wfWkqSDMDFd96f
	kRu8w7r5DU2CJkGIb/5kfdAZ/lAuSdLjxA+EgFNBPet2JjFBb1hI7F8pEMQBQzHRJM6jVjuarLy
	RjzPCrlzPZQlZjafD0AL27oqlT+PsNmreTyM=
X-Received: by 2002:a17:903:244a:b0:295:59ef:809e with SMTP id d9443c01a7336-297e564e380mr69725225ad.24.1762699154333;
        Sun, 09 Nov 2025 06:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJIVsonHu4pNwPE+f7/331weZTNenlkh2Ar1ZXefNCwpSl91W0SITTJGiPOzgc2bETvAUx0w==
X-Received: by 2002:a17:903:244a:b0:295:59ef:809e with SMTP id d9443c01a7336-297e564e380mr69724875ad.24.1762699153810;
        Sun, 09 Nov 2025 06:39:13 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:13 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:21 +0530
Subject: [PATCH v17 08/12] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-8-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=wPevfrKI7oCQBZ67FuK+Z4QMbgrqZ9zLXyhCmM5o3U8=;
 b=KRVfr1hd7m7qekk11hcXPHqyUxRtzdmozZcKhdaIrFvqaMzJOpK7PwGxYGG/pI/c4lZoafU+D
 C1C+I5ZDulcC10A5XnRAERkFZgYaryxMEbXGezaQxwhe1NO0r20BiqE
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=QuxTHFyd c=1 sm=1 tr=0 ts=6910a793 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aJ7DVAbnvPsQRaqNFFu8QAJ9xeFttOgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX2LGIN3LT/Lpr
 wDOxk0g86EJWsVp0X96JQtTJzkY/lL4u4HL4moZLfufVwf5Pr9DF3zpOsr0q/6DfbWLrVGn2Id4
 JBqbhAtZy0auScLjdb0QbHtgmnzyVyK30glh2mnmHKSOnINxkHKEKN0Jzh6bqsVRhQqKHXgJPQW
 YJRON+igweF7POKWQKbGaWLF0Ym0+RQFFSDd0H6GVIW0glb9Dt/Zn59ChKZF59ITaovfBpmm3da
 o7ZzBPyM05bRq/hxdFN8ls3/Bx6Ng4dr65Ze88PX1Psyf2kHuvgi+eJkkRR0lINZQmQyKou8gI2
 BvGTGfLeQnHSCZHjJtG7FBcAltKiuyHY2HgnM48FllP5Njz8gOELr5A1Y3Zw+k427hdyAX9rcFx
 u+k9Oj1d5maYjDNWT1uQQwdtrRfsNA==
X-Proofpoint-GUID: aJ7DVAbnvPsQRaqNFFu8QAJ9xeFttOgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063916_886889_3A531ED4 
X-CRM114-Status: GOOD (  15.82  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcm6490-idp as reboot-modes.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode. "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 73fce639370cd356687f14a3091848b8f422e36c..84322b74917f3a70adce5a4182adfa5d787ab11c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3ef61af2ed8a87d03e82131fcd8848f0a1bc509c..5fe7a2220e1dec3b5cffdf151e09553d54e27960 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -858,7 +858,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


