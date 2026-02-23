Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B54E98DEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=LEH/n2M9uX2HhyWFVwdES489aA
	32ki61qSVUg9NNEhl6Bnv3l3miwnysWsglTV0EfFklXE3ngpcHGPEKlowUrd6PV9W+OK3HxOfpUHR
	INMKhWyVOprDD8YkVSTt2Ptm8veglLLhMcOnHIf5PFFEkeuPzy6/Z8u1umEhHgMW+mBs/+ASE6LmV
	Ak0BT6QI7sKcA2ZfcheH9/8XuXFFY+e4Iup/j1mqBBj7uQGkuFt7aozoUEt0XdjL29PRMBRsHRHTG
	8rFKjUMmcA4ozp01Q0MXaANsTXIoWm7W3OmF25K7r5Dv/jO893DXzAAupsbVNARZI1r0v+kNo0i/Y
	j8gV9BHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPhS-0000000HJUf-0Rdy;
	Mon, 23 Feb 2026 06:45:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPhO-0000000HJR3-3RKQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:45:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMAjOq2154922
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=pPXNeC5N16HuJEvH
	NNTVLdWJKjRpycH9VZwxi1Pl9MsXFMI2y1QzyOD5sq9R3aM6mzht9joPQ+z8WoJf
	iwKPoujoYeYJu9A0fIRQX1MqHqOOf0WmQUZBVXLYPsAQyB9Al8NyH/ijJ1RclWdu
	g/Xn3xP/4aIMlIFec9KmOCihOREqbMfZCNZxibQGkCwsDAoUmvlU38cGP2mCVB+o
	KIatDV6+CwnC4P6I1QbILRz3sK5P7K/nFOSZCGyeFwhuUg+Pto5m3lBP/bQwM7ny
	9IZkN3VaRSgzskW1/+XvlTjWYosVfun8Sj1itZKm7KT8ZJWVABDNTv/qOM8yOfE0
	uQzOnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vukm0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so2909296a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829141; x=1772433941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=kLyRSp4KXeCOL8wntXw32Mr1V1T5CCjoo+mAPiYDwQaLPwv+xjg8VDySG8JoWBA7hk
         PVaxQI3w/7fF7tS0ZQdSKeCE0yt4D8q7Gu0orWqSIbZihzZEG017JK+3OeviKtI814VN
         MBoJe98qSCmfA591jAhDcec7w77mvoMRWvQ80TODtbob+2sV2PXNMBfJ7xujDR0ST21o
         Lj5QYJ+zv+NlGRY2ecr/xqQhID8uLxE6kr/hPO9jREZCv5+sD/+V1zS1fcD2Ow0gB87q
         MZDDIn6aFJASGN7kIj6GtMcfFtfRrfbHzAL52WlMeIV8A+00DhS2c+TdKBh/NTRr7JIC
         h50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829141; x=1772433941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=YUERvNxBl31XAiA6WhhzqAKIKhPCF/Q0IypbxIfTiFOGLBfiR/wJg6xoi+xDoSWWrE
         pW9EgaUVddeakkP4mvUhc7F7Z8AkYPI45cHfjL+m80pc4UI4QY+eHP6HPcFO6AQlV3Hq
         ML5D9oaSqeTKXFjPZ4gINkOQGVS9yqN6IxlAkC1TKIT7w0O+6ns/8io72tEKtA46/Nki
         5RoSZMHV9DfqOkuesAjSZx+GaGV6qlZkWH2496SxdiraCLFakRnDDFkuyTv1PRJCLHTL
         vNP9hyb+nD2e0afyBbGPTtmSVJpnKhJqn0AoICfeHFujmv9CItOcCP+NiXsPg/DDUycH
         wh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMdUjhQwR2US7KgZZUMO6COdo1G4oCHmJ9nIB4NY4Mo2D1bZGmSc8Zs+zbJgvDaeeGmjykQDx0DvPNeWxO05mT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzajxu12DoqpMVIOWTgsYXYccx7BKrAVelagsV3379nzAtD0lDL
	WPtDBwZvi4sun7Cjs3AKS8wxqu5A5/MFB815Tmms6oifqez1sdaGuZSY8xOBQAfq28Gxr7aKK4B
	OZzAMBujlgQKv412DM98XvaVpM/s4yU5NDJkSgemz4hxsqwCgOYEDo8IPogvuulVEyjgFPyG6qL
	hnVQ==
X-Gm-Gg: AZuq6aKIyF3/pbioutIAxnI7PqorfpSIE2+ZTn/lmr/dBg5B9/Lu7+dfnok2+xBM1i0
	mYFaZ6VY2heZTf99cuZF3WfEe+t8IClEvNKuGy0XRE1I0HwJzQ+cLjuZxUZGY0QtNkHtdydqPv6
	pr61Cqlg2ydfE0novh2oV9BjXs9xACvfvYTSi+zWrUWABbe6gXojJ90bjjtvLX/rWk80e9XU6nU
	LvV0jHk+xm5R0W2tQGB0mQYWSI5VJR+o622IbjicG3cvNfJVCFlFeLcsnHeqALBVqxv3ZNFuKku
	ps1LGtBlVw2ToJysdE/XmOxG3p2/IK7hzU75RudBIAYqPDVLXQv9YmIWeZDF34iTezqJfHjJtlP
	ABc6vZcH3u9iPvjQhkkjQ/shBNgrYq3h/hGQ6ZhP1mmgKRubAcnqy0WUpAM360pbSE1RLs5kO3i
	xHFVpMurHE96S9
X-Received: by 2002:a05:6300:8a97:b0:394:f617:b418 with SMTP id adf61e73a8af0-39517b35a81mr11353957637.4.1771829140634;
        Sun, 22 Feb 2026 22:45:40 -0800 (PST)
X-Received: by 2002:a05:6300:8a97:b0:394:f617:b418 with SMTP id adf61e73a8af0-39517b35a81mr11353936637.4.1771829140165;
        Sun, 22 Feb 2026 22:45:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:44 +0800
Subject: [PATCH 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-8-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829097; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=A7MusA8b1rixgM7/D/ASj0yIGsmRsBAexrkdv9rI624/50t9vZK5GeJTvPPItLcY41IBNloz8
 6huL2xXkTumBdYn/0Dhp0CDcxJhVHuohW+RmF0KAeN5DRuFE1OKOZNn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699bf795 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: HujQl9HP3BSZQd84wjkPUfoutvkPv-Nx
X-Proofpoint-ORIG-GUID: HujQl9HP3BSZQd84wjkPUfoutvkPv-Nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfXztu2PF3pGVrO
 sfu/KE51H/5uVi462hCfR9Es+35vciagR1CsQhTLXB9dx+C6fz9bH1BOtQbiEzKI0EMmqtFB0gl
 GbmZpcAlpDeSFCpNQP7GoTipf6JxM9j/VKjQK4h6ElyBpKEt8pEyvW59a6EZFk7Ybco0qeMyXzx
 f73hMJoN+L7KpRqCjdoALzGOjBR9G8OVNItBhN5AaSWo1tASn1+S8UtDnZYBs9S1gCQIo4Qm6Oq
 wu24f20dHIcpKmidZuQgeYtopixrm6KfiHIMwC+mOLc2R955moDBvsiLTAjG9vAJTECu2zI2q2U
 p5cXVjHDJQqjzxAJ9lBhQ3PnmI+U9TANVDvGdy7LOWxlCrc/VUhG3fwr5hDWoFJphHCUIg/RF3N
 skAc9O9RDZpR1SxM95r/igR5LdM83YP+8pSgSu+pAnXU1vgzr7woYYmjj3lyb/oJwM1NgncKfT1
 CGLg+9jBYTHq4rSCD5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_224543_015607_2F0CCC3F 
X-CRM114-Status: GOOD (  12.44  )
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
index 808827b83553..e8a20789cd58 100644
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


