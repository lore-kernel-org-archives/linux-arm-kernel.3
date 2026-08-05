Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A0DC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=; b=a3FlajZpeju/Kx/WPYPRGQhfmz
	KS37Bdmaml1iA6ywuZ1L16E4e3CA+M6KFts4idHW/ES7cj1p2v8mW0wQ0SIRERiITzWnGz4cm6aHE
	HBSO2iQ5IVJHuQ6/YBuCW7drxs/+NyzXEn0RqLSU4ydVeaCVZwE73G+l5mB2K0iMuPtSAW9svXr4Q
	eAGTMM3te5VA6Jckxe+YztD+MgxE6HXXGMdy9vsN27oMea9kuEZ8AoGZZ/foeO1b3d0Gb0f9xJfTa
	XwMdhuS09vl8Hu1fDcKWA/KvrNRN8jnMvbZ/+rPHRnrdb87gLx3uis08IVR7j06GbUwET87RNphPA
	ZXoeDCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3n-000000041a9-1B4p;
	Wed, 05 Aug 2026 13:53:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3k-000000041Z8-2Sjt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:53:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHLxD3314073
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 13:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=; b=W7/MkG6k5UsOh7ek
	7+SSXXYUmQNFbCVzzXSKPlG9dQ5shyQcbHAgrOg/WAG0jB3R1RqVL7xhYtndF7QA
	27DIenOEhF6awF4PD6DA3zcfpwkM5Vtd0+AUoEivnlkTTg4unq90Zl1hMeRDcu2z
	ScBpZfbYMO8qhdGd2cnOlgW6RD8RuBQjYL5CF4NhJrn5ZFBsJDnTXr740Pa9AP1A
	lPFCojZePVTPXb8T9Zhg2w36tMQ0oDwzubAvZfzTnGCA3kfPwQvpEzgoyiIHHBtU
	JSqkq4JPxlDyRx6dtaXjROGOMTn+87eH9T98211PNKnuGAMOpTKHH5sexVrAuALb
	wHgTNQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5r58v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:53:27 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e6ae12b42so14160967b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785938007; x=1786542807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=;
        b=jqgUOygmcUBJ+P0Fva/hoVxFBwxJFZYi+0YXm/BfpE8Kguh0qPFTQnTlGaaTI5fKuc
         Zv7pJ25ubod+ASkJ/adGHFwWlaDWnG9gFBRu/SiEs9TXb9dnSqiLmZHgrTS6h9EOyw+K
         M0p68894i+glaIesZNSmjFhMX5jKDhnNfKA3E6dAA8AYa9JSBQri8GJjdCS1rAsPDhx3
         BgywfwthH6oOMFDrklck/zlboHcfxHbmO5VHSpH73Kve19si4058kHDnM04KODFRY/+O
         3SswZrZHLChN4hZako55AbfxLiPyHaeTU6DnrYSsHUhREEJodiJw4XHRi9QhUYfSTcAb
         R7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938007; x=1786542807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHDj9TXQt02YxQEnRTeluEmHbttgGScQD7kszwd7H0k=;
        b=cvJG14NIZ9/z/JjDQWzL4ZMfr6I3LOoO6e2eXe0vkrYpOSK+MYU0jDar7PLGFbFvWd
         JCo4cO1+1jMR7yWnyDw6bOHKke5fJrf/mvQIvPar/4hfTE2VD9V3kLTlYRMgQCEr09u+
         VCmZUZfgoCFVeqfwd7ndP4VTLZMNTXfKt+1aP9gmT2G/ZAkln4BZ2cBVTQA40MsYM6dc
         81hiwiFZIyes93EA0Cf9u4WwlbgJ6iIfjoqsm+vzPm7CtiGkpQCvOi3AMDn84ypahAnv
         WTqYqrJJE4rN0s4VA8Kz2yldZVcmOfmXfP8AtBKbNpLeuGsFY3vpp7pmDotKO7rvqYf9
         b5mQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTMMEaWOGH7zEyOwqB+Z79SfIuOiXZK8MNHqXd/XqLsG6+qQd22gDzeFvn6cXWLzSS8xjWTRJCdAO8LQkQGNV1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyat44hkLUl14wLwkQhE1NcB2PIZy1qk/bn/8BqI4RgiiY5lURt
	GIQRJ4iOYbbInCKiLKOeDSsgy3EwZsnu6JQ/n99QMJZpPvJyIg6CKSJHw4Q6VG4vai6JvFSsr0X
	5QvL/iAvDaEkmIqTPR0A2CjwytgW/TBV9YgmENEozz8/LpOndVrgu2C/cPqZcCBD6qz7vVuTKpz
	7lnQ==
X-Gm-Gg: AR+sD10fP9gX0LvbJDJNS7/ohsU2V5EwbIfBZJ9TVuUhnXbxjAIML84JTNU6KMcoWKj
	ZMhl0iCLmRD8ZPnc9ufKgSn08hq3peA5Ss9qPIPmBQ/RaDWMiQMG+s0DvVIL+IX+IpdEIalPA+1
	T6GPw0p6si/38hll32tJJW3VVIwO9atu0fLBBhNJpQ9R01T4KJKpPfwz2tRVN3shACxeEDwIIJO
	Pd46CmNoalWgZuHCcinxprjrSwhQXrP8THVnDGYEZfz/5c/6reEW6SBAPW01QBYrZp2WAOsBeWV
	KRx0Tz0Us58D/fglUCVu6Ljg6DHXgcpNgTROXjtcq17I6lEhXEzI9kNL1VPP6RC8qxuPfb0U3yB
	b7M09RGb6fqLcxZ4WpugUL8oFPYOWLmg=
X-Received: by 2002:a05:690c:4b86:b0:7db:a109:f12f with SMTP id 00721157ae682-8201bc73833mr37282587b3.1.1785938007004;
        Wed, 05 Aug 2026 06:53:27 -0700 (PDT)
X-Received: by 2002:a05:690c:4b86:b0:7db:a109:f12f with SMTP id 00721157ae682-8201bc73833mr37282077b3.1.1785938006455;
        Wed, 05 Aug 2026 06:53:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:26 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:48 +0530
Subject: [PATCH RESEND v6 3/5] arm64: dts: qcom: shikra: Add pin
 configuration for mclks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-3-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zqWW9GqLxAuICtzSU1LCZ2LuTRVM2uyQw6HFZppsKLA=;
 b=sPuLgU939muF7lwZr37xaWm5GG4BsPu9vMW9m34ozfu+Pq6sMHMdoRAxVeqnsYL+ofo7mtjLA
 8q1T7zV8HxTDVId9Gns+28i2uGBlQRNdE1/TRBXtuXIsyXP+kmGawY0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Xea5Co55 c=1 sm=1 tr=0 ts=6a734057 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gVglfa6UiP61MsnhykPlsOS2589HVBVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX7Eh+LF9tOXY+
 mj7rmjv58v5EDzYRHaKDtPvMqU3GNR5wKIyRGAn1whUv1IIWfN37YcO6WZ8iIUaAk/mFWYMZVKU
 elMQ40q3+4SfbHdpkp/glQyGqdJMk3l50RbK3YXkTDrjvbduO6GnFElX2n9tqcqEf5iAkN5u4z1
 2FyYkPGF9065bSXwIAviX1rb4ACXtKaA9o9NKRYYMqjpEY6J+sQkEClHN0w+ZqbzixMoLlQc8HB
 ebaPoxXzhbNcPvuOQlvhOau8+HRc5SMvtTm4UxqbOCADn4rboSJnzJIXZJ+tObIuFS+DzZaURwb
 5az6nSwNyBtwr8Wcn5bSHVkOZL+pmwh3+NETGxqk4WJKykCuJpzOqz8zDAK7gR3k08610MKJVyZ
 uVOk6FdnDl0aCFhlNczQ6pj0jahPTypYBZ8bNkv79IW3FZ66BeXa3jARVNIAr0f2vt/t3dErTy6
 mmIGIYWCtc7W1dbB1lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX25LBwALPlnmQ
 OOh9NhvKcRNomMEiiRDV8JYJfnmwdSCSJhBcmjYP56vg6dmaNAZOFALEVB1GZPg4jPO9Xh4FJgy
 fMzlHoa4xh/US5ySBn2mZ182XA9RbcY=
X-Proofpoint-ORIG-GUID: gVglfa6UiP61MsnhykPlsOS2589HVBVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_065328_743253_C54A132A 
X-CRM114-Status: GOOD (  12.83  )
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ddfcfb137bb29439ce20ba6ebf3a76693792b56c..c6839aa2349f397b041f3201b8a33fa90e36c77f 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
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
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1


