Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36657C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=; b=vkV6ai1DErE0h4554ccWXMQpWM
	5Dmzm89VoaZz4u2Arc6mxdEB6pC5ScnkmdSs66bUB8jwGATNdhyasyAO9O93TEA/DfB45ttXGfQCH
	4cfCdoBTWy/NtPyEliNbsW7tFNUpclGRFmMBmBj8pmkniPE7cDDJBpPK9bvK6EiwQ4UKJzSYeYn6y
	0tcGqPIp3R9MUroFRfQwuLV7k5cZ+zga2wcdYCTRRQ7gAHwyiKkVt1xGrECFWsk5z59TOlrdgGJ24
	yFXT+Z9a72o7spk6Y0Uxz56o2gcdsoIosBY21ShuD64A6j5Prz73ay/eMTIdYT0QG1T/34ptItPPL
	gL25isew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1A7-00000003yke-0sYX;
	Fri, 10 Jul 2026 02:40:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1A5-00000003yjL-2qiu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:40:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A06PsT3357370
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=; b=QCAslgIYZyTntJHk
	MLk8ssPfTuu9MUEiM2pcq5i6a+5rJvYOVB5TJPcRChhLm3pDWMe9u4gOe8G0RsR4
	jgzeNpKET7Bri1b3fTb6IC/1Stdwr0lAzmAc2YvKpjkCsp/8ymF2viQHp1WKZDSd
	rvVfbTGNqRB4kcoaS+wEfA6sRK2lVqwQ8IPCtFX1o1Li6GX1Czy/w6mj9xut01u8
	zHEPKW9eQr9T4ZnhRBaygCENQG7I4lujyONwxeSWes53py73tVarEFJ0gaeMA7/Z
	IzjvlK8AxvaYm9s8+n1VrZ15R/WygIx9DsOCRWQxt10mnc5wI+X3Je3z2vXbI4dA
	TiXxlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe8d4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso4022625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651220; x=1784256020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=;
        b=dOIOnbSH0Uu5U8FcM6ecmh3MUs/5Pl01U2mSzoYFSYpoeS8lsO2fC0J2wx4ytO9pFs
         D6ZZKU1jV3KFjwhnS089UwJyTDDrpEJumeCEkMJa1Xz5sx91l4egrYghrn8/8zyAh/pS
         FaAQcIxKctaNbLQb7U+gVTNZGJrjl6o3pcOeRvEgh1WBv6cOue2WOACVC6c89tLMVWZE
         hPhp59zizQvBEoMvk2pHlbq5FbSGL4FUYeFv+JhFoOZ3zjCJCQ4IGPEA7cikyozez3BP
         bM6DOiy4ees4EjL62tBl1WhqgwOKF5hQGmQCrA38oW6hhtyT38neUbfBre/wmxjmrTQ9
         oPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651220; x=1784256020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=;
        b=UiMz52kNZaKOF8a4FzFpDjN66JuHHHzwz705cN9lV9QVqXPILa83WKHbSvQhRdb/2k
         Xftb86QUxqYF2lJsh1nluUk9dnW2/fggSKlOquHJ/Ydsg4S2pTp4QJ3BfZF25tWBIMvz
         5uizf8Tqxvbm+QDG2BsBmTDZVr1oNrR709uZDCbzs59s1XBiuuFDsKEN+6sjDkgShGbP
         3SRgTF0nNRhaoIlu+j4TWK8c8b3d6BLM6xilXOMBodOUxUKW+TqQet6f1zle/9fcb89t
         S4gGV6qJetKpdYOxUMf6JjpTXSRsmtG9ux7OY8EsQ353Qnv6mdq2UYaV64MLwBHouG2G
         zbrA==
X-Forwarded-Encrypted: i=1; AHgh+RraWEInNTZ0W7LeQnOwMrJzMfu0s7w/GGbG9iN1tx1eVJqXQoBeMRksK3MSc0q9lcKi5lGbwsJAdCRlhFTJ7Xt1@lists.infradead.org
X-Gm-Message-State: AOJu0YxX0civgXaodoZehY0yZ26fVcpdeTZCx8zXQBi/m5djY8YDcNsh
	90ZGRt8QGa9rcsfJAz1ha1HxrkDA7nBshwdJPmgcfEdTsrRm/fFfQfXFE2serbU9vGbXx4P2WeZ
	dNnFRjneDbgdcz337zKYcg/pvjG9b9CSHDrVN/k6IPOom+8edCp/ONCUts/TEBuJySBRDPVrTFl
	5ckUDX3x1mFxGE
X-Gm-Gg: AfdE7cmu37GLxLWYhkCuqNCaEvvpowNGhT+P0nueDYJIRa/8MoENc/I8bqSCqerFeMN
	BYw8pTagVfIgplV15yk32n8preK3I2ii/SSLNSV2pIC4Panww0iGDQ2URBBtbe4o5eGU00Z5xEU
	dyQjSQLpeErJ3NXyjt+ijYlMrG0R4ikDSIkog6euAqp6NaxXOONZLO2UZpQWlwIynb/Iyda2KJV
	qLfsnjqKRjmbtFVCHpBrTiczbhLmt/noxId2EMqWSrX0nDOY+fwgnFNNHtzsVOlXz7pzwpa62Ks
	Hq0mzdH0A5j5J6/OvOHd2YbU4Yh4FPl62AbUWDjzMNYC61wYx7EZ1q2YhLrOJ7TC0WQ4HEA6qdp
	Gj0yOaMJc6KDAhd1Q/fXdxmmzepyeZ86Q2iojbvV8yAtbu0KqRKuwiFxkKIVni/PpuXSMcJj3mw
	==
X-Received: by 2002:a05:6a21:4c13:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c0bd0fa84emr11841134637.37.1783651220445;
        Thu, 09 Jul 2026 19:40:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c13:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c0bd0fa84emr11841093637.37.1783651219984;
        Thu, 09 Jul 2026 19:40:19 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:03 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
 platform bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1616;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kUxtfu2GkKubtJdHqbDaFenuC/gQXoog7GcvX2P9CYg=;
 b=hlg9blVs46R5OiJ16+aISTtFikhio7y1TA4JxSn81vWK6bQvO1MyWoU4RGnN5Kjasstk+58Id
 xNgxcCOpTOqDrJ6K8vWSPiIWE7O0Etl3i34zOsebsMTQ7McjP4QlPxA
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a505b95 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=i4VRK_AS-aeX222KLmsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX/qoFPAk9LRkv
 gUTc5hP+ljFgO9amq/nzS3wy1Dfod95ngg9KJHedw2ZPNiy85jEY97UC67CSvyjJihchJ0qO/+1
 c2J1a7ApeYXICSUWgIiNBDUKu4TowXCkg/iIhNj2lyvMefNH+7bHhvSYKe7c6/BT3gDXuD9WAfl
 pNWizjlSgTGMiiq0JhCzs75iuW9Ni2vYHJ5HfDsSK9ZPb5XMplj40u8cA1zyQv5t81uyrKsfURw
 FDetjI2QpP2jboBihe/VanA1RUrcHnirPiXOEL0Y+X+UXytJnRTJWT1helvxX4WrTFqrfPzuiIV
 y9JDZBjsnmn8fyHzjns/1NxP05sSrPLzQQld3yXBMltT2Brfr9mKMlxyEaj+Kh9vOfkGZYhhAej
 /+T8RluQGSFHd9mEPxBeIjEGBXKs2oEN5um/tNY3flvxIGOcFsOXZ4IgFGVFKPqJBmt5AogimTM
 d6QkREShBQYJBUKleMg==
X-Proofpoint-ORIG-GUID: tg18Ta4UnFTGyLThlg9HmA59pm3IiMg2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX1s50Fb0ZH2gi
 pFm4HmyKA9Sr/wkwkaBidFcF+aq3fQC0Mwj93AL4bYkVGvzwHKjLV1bPjUtJD4X+QvYHQTAQu11
 TwfSMxbn1/p7ufP5I9CMkq1nN4OSAGY=
X-Proofpoint-GUID: tg18Ta4UnFTGyLThlg9HmA59pm3IiMg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_194021_731725_1648F9B6 
X-CRM114-Status: GOOD (  18.32  )
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

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..1e25be41aef5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


