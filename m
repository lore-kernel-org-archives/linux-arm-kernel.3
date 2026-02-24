Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A087E9B258
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Ir69B/GEyfS1puBfTgdxzD/7c4cirDkBJ4obVkyjhs=; b=Z1RTywd5WcRTiFi9naE+3Xw/OT
	kkyDV/fkv90THM4kSG8pFyHAXoYn/FO5PyQFtFAbkRxGbCraUdwnOnyDK3BJ+daO5ApdQ4yRazB1O
	Le15U/UHoQbuwCrMrZg672BDEGpIwsPha96JiRd+bj0C7tzeG6vxh3NP1TspDgCfZOP1N9sh/10Kp
	EIYdQqfYL7ieoClKBFK0RT7ti7lONZKpEZDY3bbDgW8O4ccvVXyxpCsCF4q7EIFzb3ecy1IuN1cdC
	sP19RVttfWw9uXqzWan7oNPLmjiU784XCZIgNCz4t0qP+Q1DHpuTD2BS83hE9Ob83plxr5jGSVTR6
	bSD0vNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurW5-000000022th-1C0R;
	Tue, 24 Feb 2026 12:27:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurW3-000000022tD-0Gm5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:27:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFL062560016
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 12:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Ir69B/GEyfS1puBfTgdxzD/7c4cirDkBJ4
	obVkyjhs=; b=nSBHgL08dO2nmd67Ftux2WonYJ7Le4osBhaK0anZmbWilGtSxwk
	dL6adwJahus23lMqCJ3qMS4BduzBmBBjx9c2lfO04DpjzVgLnhtgVxz/81lMqB24
	6u9WgVuxjTRtfKMI4TVinRRhtReBtoNNLbtYHPSyO6vEbtvb+8RYXv+ro9YWGPVG
	gP/rOXdLAj8S2QwQcuw29qjcUEJlfvHlRE5gsiHCrpMsNNs8wk9rlrweGEbqtnW2
	Qqqd9eGg9ZbVT/Uv5IeE2By+Wejf1H1265wympM8xIgCA1KgwE9WZUfVpM2zmJQ4
	bYF+RT6SNVZyEqWV7kEr8bHCnhFByMoFEKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e39c50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 12:27:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3d11b913so4495936185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 04:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771936069; x=1772540869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ir69B/GEyfS1puBfTgdxzD/7c4cirDkBJ4obVkyjhs=;
        b=E8WO6fbSczXaf5gA0Dh9rlQiI/6GBE5WvMpkUJd8HLv/2fcXsIsLr/s2Zi9N3WiBk4
         M61Sdm2a/OkgS/RWV82cU1p4LaZ2bhT5QCWv3YfDZK+fXf0B/iMJJwPMM4Ql+TBRk/rA
         UVvj0yi6ZbGlzjwYg3hSurEq4nFGMHpM9a1UKeo3ICHi6E927uXVaMiO5wHnvsRKq78G
         LYVkNUjl6iNoKFDqcUnKifCWK2oXRAOmzN+469cMs+N5ZdWGdV+yD7Sl0ABL4fcbWs6i
         uFY39wuRG8ZH9cnkipZwLZ55IBsa354T+OdQ3HkuijZEwRBnmp47Scq/mlpmxWQoBzdF
         WPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771936069; x=1772540869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ir69B/GEyfS1puBfTgdxzD/7c4cirDkBJ4obVkyjhs=;
        b=ryv1sxH2SZR5CeJL4oeeLJ2EWyjavQOkIz/qizFgHWrwuW2q2H6BOer9ShdU6Y6Ukv
         Xpo9CIEchT9wWGC9bK/9LyUFvi679LThDAarMhenr5rx11S/mEF04m//ZlXIe2Yhqrqy
         hA/Pd7BbJWRCpdjoPu9qxpXfRN36bWTc7XrLxvkV/mrviiNd50A/I5rnlx/CyDz1Z0Td
         VR2m7GVF1hK3G5MvGzNUWrXObA4EPa4gip+iA0z2Z2DE+AYeREUWfokqrF4B/EJ26ZE9
         sH68yqVxdZFWXO8GNvRpD5Uk+VFM0bJGofMp2zOcxBIOUAFp7hRk4qMUIBFlS6ebxZXZ
         eEiw==
X-Forwarded-Encrypted: i=1; AJvYcCW6nQ19Z3rikFJyoiIPj+WGraN/eBgtuV5ISAtD+YrvU375I2jQOS4TT1xi3SF8KvaqftbBW0WAIQXSMNjQnySd@lists.infradead.org
X-Gm-Message-State: AOJu0YzP9KbMp4YjsnVMlrbkUZdo1kqbRaR0QfoHAh6/8KKN/DC2eMBV
	7KxfW8uKK9vwnDu2umZTcYqVypm7AX0/pzQauHsoqPjT8QVJBERlB83cgepsvpPXpTtX9iPTVAp
	DYfJQF53ilfnD9lVZXIyd1C1t456KnaLPaX5DwyTM+Q3nHPrIJrzGla7EzEWE4fBFQt6UUL5HBt
	mxrg==
X-Gm-Gg: AZuq6aJ8D0kExq44zskFWM6gC42N9jda07uTBRfuRMgTN1DeYDCIJV4J+iz49NKMJgw
	lf4bGKfwIX5pC7asYycHeS0bZnCYtOd48TXi0fpyhmSrzjjfT2R6lFR2/ow/UNiuPoOREaQnTg2
	Dg+zz6EpN3I7gpmMyRkxFbNFxPj/qZj4gmzqA8e1RXx/3pVgctv4iRBRXMin1UN+7exxWDaHvDN
	bVotP7KCMNV3Jc1RxvZrbC2DkxkQdTTljDW/tK8x3goXtRF7L1TAeA068b2SCdOIbG3J+D98Mfg
	Ml2FY7OsgHLq9pTSbPMjLWrT2rh6maWLoztFm/NN98DxWEIAQmP6GTltWgTt1CwcQKDQNJA7cuH
	I6MBz82ulDBVL2zMuchPCkvkfdTVz9AmYtIHu8Q==
X-Received: by 2002:a05:620a:199a:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8cb8ca8c47dmr1409090585a.65.1771936069347;
        Tue, 24 Feb 2026 04:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8cb8ca8c47dmr1409088685a.65.1771936068880;
        Tue, 24 Feb 2026 04:27:48 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43987f3ed03sm4678682f8f.16.2026.02.24.04.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:27:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: axis: artpec9: Fix missing soc unit address
Date: Tue, 24 Feb 2026 13:27:40 +0100
Message-ID: <20260224122739.95168-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=917; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=J9Qef/qoIJidbPmIW/Z2j438gZALQ1kgT5Gn27Ae9xk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnZk7YL+y5BtlCOGbKIsde/kmK84p9VqZKPbbc
 9SBtBQp4bqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2ZOwAKCRDBN2bmhouD
 1zahEACLGmkzLLklQhtZqcb4Z4zRNXWDokwSrb46fcOxI0zB4wDMy1U2kfpWP8f3wYQa0F7B00U
 9ad+D0+rDK61kav5GVYNptR5RLuDdjHrsrTy8mBNLLmiWDuSlroI9W6QabvJDSbiwiNVRi/mbnZ
 HwZyac41zwc0Rzw3q1qeSg3Ihd1s4QPSxmg73fkoai+gZhP0X+40xk1AiZ9hCSpXbssBhrfv0EX
 TlHgrjT4e3Jns4OdD0/Z0pFMrg/A2ndK5bTNi5NlHmqEiofQCjht59xQcN/dlSkB2k18bH/RoA1
 6S/+P+5i9LHCcdrfod1We6/SiMBPdk+bipOauy9b0MGm+EL2kWFayd6Xm9zZWpUSzORTUleOUZq
 ePlAPu+BkpuTbnvk5cxSeryvfFOFzL3nqK2R87RjcVG/97X2qTt1goUo1wZRE0eVOWYEZzfqs21
 S9xAew11x/89ijbLyLG+7xrCij6RBwxTz/T/cKOJCzwZ1RibkgbAfXIaa7U0HSEfZ+trRe6dCbs
 EeIXeALKfCHlWdzCFcL+NpSHgZIAer2l0BJWt3riiO7W2kxW0weiSetRni51zPp1hTBjJzWOx6R
 VIp80iF5hvon7OzEN35T3tZy7fv5eUSiEYFuC1nMD1MKhAzmX7p49QSKZEZZgfSSBu9iAn9lf3S z2o266kfRE5+Vkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699d9946 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MnJphn7iKxffC-OSF-8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7kgMbkSDsj3SGxz4B7ASKrbp6iOLjwU7
X-Proofpoint-ORIG-GUID: 7kgMbkSDsj3SGxz4B7ASKrbp6iOLjwU7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwMSBTYWx0ZWRfX30CDD3eea3dq
 yAKg+1hsq395j3cIkE4gqMu8mAdyeyY3iGkdLDnmi82n7leXz8lwdofbVdcRl9fDPhl2g+TKp6V
 39yuQPY7NTMIrqYjxJLMtILVqfz2NgbcuDxsuWSjO9SHNUkxqqiRZfPD95mRB5qTvzMjI3MBbTn
 mDfhxX4ukSjOI6hWvzdsXqPZcVTW+RinK+AL+fv+b0htx5u8eRbOOuJkPsiv0Lf0Pa+w4JVSNqn
 YIkMEX7tVPtTXjp7fEpukmo/d7hELwiWd1e3FFZTrxmA9e4T6bhmGaLUVOSTE3qoT+W2lTNYwkd
 TuiC99cyE7hHeirajuCCCWx8eupa0dCbC1iuQQX3PKL4dR4n3C+tvA4KLvt1Y2TyawqFShQZ6bR
 k4fB9HEmBXcRzDwSF2C9+lTXZBjBc7SmQSe4uLfMH4CGm8zaH7fz1OIs2HcYhLqGDvIiYPKb6VJ
 r+o68BQRQjcOukmMI2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_042751_221400_4FEB5D19 
X-CRM114-Status: GOOD (  13.35  )
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

Fix W=1 build warning to comply with Samsuung SoC maintainer profile:

  artpec9.dtsi:121.11-268.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

Fixes: 3ae2b7442cb8 ("arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
index f644198fa80f..f8ed43c6e825 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
@@ -118,7 +118,7 @@ psci {
 		method = "smc";
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x0 0x0 0x17000000>;
 		#address-cells = <2>;
-- 
2.51.0


