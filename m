Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F418EEF33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XLSH/VllHO4/R5amWSzTjK20IvQyA+qXLE5tuqFPiw=; b=Y0aNS4d01o7uZmUYCzDvI5pjYL
	uBizpDwudiPbK8eGcq9tUddyHTj9LW51j9hD98mEk6frGWa3WAf6yWFOdptZeplMICzLVVvxjvZPe
	xDbii4nYVfiJTKIHJDZoV2vePtf78LMsgzydPAeof3S4Yx0ulDfBWcasJ05exGPG0PnSzQaS4+2ti
	DsgyEiEwvgvB+3MVY0lwFA2o+tLgD6sWRsfdq13vIIbLxFqgkNnH+U38m4bJ9BBiKVkgy5gibj/ok
	WKU3XDKBK/wgNR5CyCjqpD7+DCPE/bjv5NXmODkw3aCYIMfjpOuUhrpc4xLkVg4h4HtzrJeYRB/rD
	M/8eO+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iH-00000001Jr9-0qYt;
	Thu, 05 Mar 2026 09:09:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iD-00000001Jnr-30o9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:09:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254tYGZ218428
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XLSH/VllHO4/R5amWSzTjK20IvQyA+qXLE5tuqFPiw=; b=Jt6+k1nlOOCkT+aA
	vlK34BXw/2VI9u8uJ32hfWIlqSIWGWpp3rMq+6O45XQEikP2gXqqYmpgSAhQrOTY
	rB0VixPAvhB+wbbAuQkjoMdwkUTcA55oOnStW9mrwFc4XjrCNoIHvmtDTzeBsFTA
	gn5tNVolmdYZQ51PqI2mfM/mspcMY9GgrpFrseetjRhjlsnhD4hlagimuav/ghcK
	l+VL005+JlKzJBUXDxtew6FGb5f9z0zkuWJh5eDN64CYw5zc5QrG25XP/KzW7cRW
	xqUQB1jEVmZZSZDG5lAZqnjbqSD8IMlEpIzyvHEPHu4juaxMib2JByRr6+YgAUCR
	u54kdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380rtb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:09:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb37db8b79so5699714785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701780; x=1773306580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XLSH/VllHO4/R5amWSzTjK20IvQyA+qXLE5tuqFPiw=;
        b=YJBFuVpfiU4SQ4GnQIV7Z33ExfMqgRrpQZwo2fM8HXJHk+z2dR8FmIdaQc7mkPnSHR
         6P10U5IhqUuRA45JpQTU5uDkwK/BJY5eVE86t4qVK/JaLRF3jOWpCai3KGfoZBDVzPsI
         cHlPWoGD5Gy9kjqscgIDVx9ejRyjCr9WJAO773vU1sHkUQCJewhsc3KfMX5srCKQ5Pzp
         e0PqH7I7gWArs35szsl+xOmotQo7JFKaUmH21hyvg6XLh27YLaIPVefDwfT33k71m4g7
         sMVqxxHIPZWfcsDpyO5EvO4hBALV36j1JtoebN5xqa9Lrcoi6v1+mOFdrdTFhgsMOF+l
         3BZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701780; x=1773306580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2XLSH/VllHO4/R5amWSzTjK20IvQyA+qXLE5tuqFPiw=;
        b=JapB8eZSwWTd0kOa9aL0tEuZA6t350xRBgwWlUWIaA+uxtPqblNYka/wPZbjQVoK2Z
         tM/65d2TlSocHvjnZHeLzL47Vcm/wfwHCWB3JcWF/SUaHrS1/V7d4UcLWVk5LwM9fSDH
         SPzf92OCmtVXe/Ic7FCR1NvXRxzczKIDGl6RtQXVHL2oh12noGFBu8s5tLGVfkD1M61d
         C0Yh77ZLczjyDsYNDPKmvZrzCH+eKsMEpHqZ/M0mxRi8Hs4LaZyOI+IlW7fiee2C+P3m
         LiJitAGW/7IL9fL/NQ9gBYRnap+3ipyw4sHUBmSsY70aKvU7g7U8VUYpgKkkOq6RABUi
         uU9w==
X-Forwarded-Encrypted: i=1; AJvYcCUjiTEWfIxnISAK1oKgIaCs2y36cDTgaPGwg/nQOyeIvUkm7G9uvNPQmX0dZNvFpNAbys2zw5oc8sSSa+HOJzAT@lists.infradead.org
X-Gm-Message-State: AOJu0YzDaBtbksKJib6Zws1cH5On7eWPHwvwFQuiBQ5hV/Tz/6BtlQvP
	9A8VBc5fteWJwdxkzE9UI0jGZnvNI+5K542m1RwLAIYufk3pwlfB0TpDZq7qz5hOk4153VMsiHY
	GUmdegz+Ov4G9Cd4CzhauacKTK1PX5V07WLqQQpjvkucgd4WPD5+5D2FjOuJ1zt4v8TaA2r/WP6
	CFaDh4hhggbQ==
X-Gm-Gg: ATEYQzwHwtKBDvCN/6arLnBNGOGw1RKW2fXWJ0lfIxsYhX674OIc4kJuxhcQDOfwhbL
	aIu0ZCXrAda/m6vcmuI9Eu2AafFJCB3wLMfrvYLCLvWqyvrb10joQg9AZ+u7aJ6VsAdjJwq7qDL
	PyBwjBRuwBy2mxUXlNycBizOX/3smSoji+AY9JbhWRlFOQgxS0bRH/UvEiFpDd+RvUFQNhQeTL3
	AN1Gqoix3a3y2b9+1IdjUsxxgSa9kg7UBmtLimSv3YJBUTos3qPDGWO+pPucuxMO+OYvV96vwaq
	M0Rycst2sM6G5NKmSenvQyilXaD9CWYC9xG/4uMmoTkXXzagjIPHtyri5tBe1HNC6W0VkGo7qDv
	Fz+hEUTAXjWHY/pdsfJ7LO4ruC88EBTCIz7idYZA7sI1Q
X-Received: by 2002:a05:620a:29d1:b0:8cb:72b2:2a15 with SMTP id af79cd13be357-8cd5af12a64mr580767485a.33.1772701780101;
        Thu, 05 Mar 2026 01:09:40 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8cb:72b2:2a15 with SMTP id af79cd13be357-8cd5af12a64mr580765785a.33.1772701779738;
        Thu, 05 Mar 2026 01:09:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:28 +0100
Subject: [PATCH 5/5] ARM: dts: exyons4412: Drop duplicated I2C
 address/size-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-5-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfajksrGcjq0LJQysaqze8aovqdA8pPK47mtqHPAEV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhJh2kpc2NzBYOMDl24QA5vGv92yqs0YU6wE
 IYIhpS/JxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalISQAKCRDBN2bmhouD
 16KKD/sEuHd8hbKj7Ipv6E2ThTTgkiR3ia29G7i6Dw4oQuwwYcaNmp9MuHXCCuJUPH5uFn8fpJu
 IWOvDXHAIsp/YS7G2owceGOyVDq1CvKjVIwuLs+bsXqSOZkQ3YoGnDT8U1GMbz4tBv2FwqOxNIc
 l9uitb330z5LkXufy4MTwCXKOXjF8Me1jrtiIARV1VTHPD2jp7Q8OfP8LbCd7G619RDzO0oEY30
 esA6sw6lwX+qCeVisgThBDUMJ/+3gQzdsfROcZC49HACCGEH4bdTOGQ04gyPKV0LhZV2ZYuGYEV
 n3NJYVdxtwVpYD/zccnR08IpYpXjnYhnexAYc6qgYBWXLPuP1501emnLLs0rS+E35KhY/kQVZ0v
 jxBpnuSZTaxauO6DZ/abHcYD8yqMsPZts2mTUuJe7xUkDOgpDldfd3yi1mPyXx7XwOEp1NEHWrG
 7H8vDheA1N6jpfx3MSTFq8c0539sDZAfhHR3mIhH37H5FwKPXHvUbbcxr4NQB125iovDR9aiHc5
 B/XQ2FXFWh0+tUCnACuvHPpkgReDfIhuL3fsl3u+Rt33ch+2utkK51XJrKjt3zyjrkX/jN1/J0c
 v4xD4uJpMhgCBQhVjCFW6Y/jHLIEK2GzV2vbrX1TNAMph19paAsBSh/fXO5j1cKjrJJwAhE8hp5
 V6OO2rqUzvg9sVQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a94854 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=os_Ci-yCVAlAVq4Xw6AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DdbGCQgNVVYFYEachjCXc6Te5oKFtKZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX1FCuRRJFjgp7
 13POdJ5vET0Vr1DRiJCAhvleNtsWe5fL+6Dl6ynDiOHiysl8Z3aljEZibwbtdmLfeEZckrYFcCQ
 kQYcAWTOEMJ1+1UBYv/4RsxtpCiby5Xo4Aqi2QeqmUnP6Li8xPROJXOzTZ+RZFOzs93dM/SzzS3
 ACHqBoRJDp4vGTYNn00oYA00Lw7vO9SITmDzgIx0GcOMHNU39OEihjYmKUwtWisDlx5LntMiXJj
 4X9ERDe5g3zFaR7Zbr0PaAz1yIOhB/sY8HuPQaklJFxvo4D4jWz3/TM4FT3gLeuFgHxBIobcr8V
 Vam4meObwh3Aos6Cxqgm00FuLkuECsI47ESkADSnruRIkyTmhtqEWRQgLlcRKTnZJn5BNs9B99N
 Earm/CmtsKCCMq8vws9LsBIEK7xO/UlmjO1XxJAqsU90OATmf+MQYCtu+T2fm/G1OnqwpslAys3
 UGwuvskXNHZcg1ML/kw==
X-Proofpoint-GUID: DdbGCQgNVVYFYEachjCXc6Te5oKFtKZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010941_885262_A56B51B0 
X-CRM114-Status: GOOD (  13.43  )
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

The DTSI already has address/size-cells for each I2C controller, thus
the board does not have to define them again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi | 2 --
 arch/arm/boot/dts/samsung/exynos4412-origen.dts         | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi
index 7bc6968af9c3..223907e5919c 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-itop-scp-core.dtsi
@@ -130,8 +130,6 @@ &hsotg {
 };
 
 &i2c_1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 	pinctrl-0 = <&i2c1_bus>;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-origen.dts b/arch/arm/boot/dts/samsung/exynos4412-origen.dts
index 10ab7bc90f50..c5fb551ab352 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-origen.dts
@@ -113,8 +113,6 @@ &fimd {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <20000>;
 	pinctrl-0 = <&i2c0_bus>;

-- 
2.51.0


