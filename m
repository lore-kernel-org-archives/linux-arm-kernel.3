Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C095C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVOsjnfr6AZds1Ha+EheEVgd4WK/VoKKw/cFpNwWuzI=; b=TuZ0wKVvaw94pSNx6dlZ6Nv0Dt
	F7cc4c/gggDYtJJq2fg+2i+Y0sQnO5Th4/DRSwEUkmN0euFnYL7vpi7PzLdQMnFf1jyy7BnTr6WX8
	f+Wb96cYguULm6bUdy2iYoyylNgt7f+lxCMBQ/lfytangYviPReB/oP+Ldfu/Cf56kIFxVzXeO7kD
	xiz30nK8v9N5bwfK/PIjdx0WJ2/HTiyOrtj1BCPzAqdycuyUhPHD4nSDBA6HLRlZJwqlFq87tHp0k
	1CnlQAe3nMF+aSzqb1P2V45RZ1psPz+54NlGn0YLnmfpGMekZHMoiA6pinhs6NA1QYjNPKhN25ZBc
	fSHv5/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJD-0000000EmHK-3tTc;
	Sat, 01 Aug 2026 15:07:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJ7-0000000EmBX-0byt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:07:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Caiqn3122205
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 15:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVOsjnfr6AZds1Ha+EheEVgd4WK/VoKKw/cFpNwWuzI=; b=ORDlqK2NSwQMYC/8
	vd3yv/vKfdFmKsKb6rhgMIXvo5BOSJJ7C6f7ZHDu62OP8gu5p28Axz4hAeUjdOgB
	zuRAF+o8HvuvfbHh/+MbuilHQgnr5OZ4u5CJ2uiPOIaiRiR3Lr8bBukIUnylNPj/
	juGZJrQSwn7NOkwatigOw0ItK9HgKsUV5KZmqiBZ02lHpLtin0XrFkHV+pMLpFON
	lPe4z5jPqdggSMqVkkSoUpCNPG6K0Fs8e6mAsgUQxryw0oDybycPoQNQH2GybaN0
	h/jQCgfab0k3pJo1cufwQ+PmYXEadZIo5j0AH2odMmovg6N/x5Ouo76o1KGFvCco
	sFN2AA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs91193y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 15:07:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so19428421cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596844; x=1786201644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVOsjnfr6AZds1Ha+EheEVgd4WK/VoKKw/cFpNwWuzI=;
        b=I3UTPo9RM7BIwEGxrYIn6tKy/urueeIbfAmhMWj3PZbnhMM/FnnKdfQY98O0ySxYD0
         CfO5fMZ4i1OOB3/zqfThen5NTIvT9dqXAIY1dfE/wOM9vB1sQNK92DHbyos+TpqjFwJx
         ErfX7YpBHFY+OJy2CfuruL6XhL7+1zBSOBR1qzMCm3K/ZRB8M1IDnVDLUNP15eIxDVPe
         4Fd4Mx7ZcUd3Hz+0/AuUGBCG2owUTDKwrvLWF2855AxxTW+F3DyTcifQkmDmipFIPN/a
         BHr+l+MxlnLoExnKcFAMhOju+1B/blaWM0yJMvisohEoErb86xzG1tgfaKkTYCPJsVxg
         z9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596844; x=1786201644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVOsjnfr6AZds1Ha+EheEVgd4WK/VoKKw/cFpNwWuzI=;
        b=D/wammX0TRi2Zh4kFOgc4q1mL9NikjhseNDYIcXTM4LC1hpY3pekKwxS7Yd+qfkoWO
         brXB42JXeQ+zhrDtuK/ggScGq8vVjkw8JK309Ns5Sginv1887dWQp2U5t4mbLURYUOvg
         O+LhEyFfnzMgWkgXQYMZO20rlHf/9RQdp14exqtd9dtaE/rkUySEGo8aR6kZm8UVGPCH
         rfXDF/HBH10dTB+XHJCTt+Q0yCq6mKns+yhED3pI+Z3o6kjT7slMl3VL8kBkaOPJCUVI
         goPF3p7q2ZVv4osHfKh4hQ90SedXL8BnGwBChG+3PRVd1X4EWbKYOAGNowogUq59GiPM
         sBNQ==
X-Gm-Message-State: AOJu0YzjtsBkQVk+ptqWzEtrnOxPN2Vn9Po4vSYmaNd9eijV496+zU2n
	YcQ73wmoFgt5WOtsAWio/7ZFB4xtUnIuqeN4dkiGZuO+Lb1sOPhBBTGke9ykBR8+nQ8ZzjzwzDR
	+vjqMAfu5HaA3iECHxUJo01d/6/KpfX4t38siaG6hS0SrGOHcODDKdUayxpVm/+He3IXDLUsQZV
	aA9A==
X-Gm-Gg: AR+sD12g9kPwYKRW9qVlUMzK4ABjUu+P+Y9NYsd3GVRArVV9mxNgjo6Hqg/OM5mvHTP
	NtZXafen4YSk8qCy8BMmh7pPPmuNAy1nZ825o4RZziMlFr/ySZGZR68sJVCrAlR2VozO9KbcOxj
	ZH89bXvp6UB/yDRUz0umnBzNnkCHSvqTW9YA+nyrmVAQiMzUyZB808yTcFOTOUBDz/apxJNovQK
	a+vqUQXyuwrmCgrk+V3pcIztlIzvXA7YFlmxkfkRIqFJ73RAW9gJLkQUCRQKJ1riaCso4V+vDJU
	wQhzRn7qntFbndDVGoSmYHGwmnVWBbdu9TwyvCqhpwp1dfFkqvtzfckD4pF4pEHqS1jk5BTA1Dw
	jdpCyIW3Hg4XzGQxgeGLeJ6MF
X-Received: by 2002:a05:622a:1183:b0:51c:167d:b345 with SMTP id d75a77b69052e-52b56752f6amr68929081cf.24.1785596843401;
        Sat, 01 Aug 2026 08:07:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1183:b0:51c:167d:b345 with SMTP id d75a77b69052e-52b56752f6amr68928281cf.24.1785596842665;
        Sat, 01 Aug 2026 08:07:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:07:00 +0200
Subject: [PATCH v2 5/8] arm64: dts: google: Move 'status' to the end to
 match coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-5-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18995;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NB46ZyeMgDWsFKPy20XcjmxVHbFekCrtFMxH2QMZGmY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguZhBwBfxzIZhsRraQ1Y11DBXzqs1wBtXLcm
 SjQml95tfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LmQAKCRDBN2bmhouD
 1xkgD/9O/KD2vKxWkhOtoHXfM11eBHNe+ukbeYKt8Rskea3zY8Vvuuo9ha0uwkiIjEqw/dcJZkR
 ZBIdv3nzEl+6nvgg1jZBu6VWEpJyhqaiENsiij2B0A7esZgOqy2U3myQcFpCG6XInLZxXXOdToo
 S3cDaLuHED2/Xmvfys/8R4bb+PoPgw94Dcw/vXCJpSZ7eWwudomDX33N+dpm7cpUVLkTc916b0E
 LNWU5yzlyFya/yIhRNxSeorxzKrB3ureiO4IEtQY9eDVO8lngSDQPyJM8U4ABDyX8SCT3zSyAHl
 5sA6f4TmOeV3ujXkNs1q09jePFNDRRRUDOUclVtPGuQ0t6BKeVpuLvoye0zdBlK/sqJ5Qm2e3Wa
 LTbED/B17MVc/8yW+JQxWe0OT++8BEnKWNWiz/3XvasXWYC1KlbT3eg8J4Bk+gPeHiQ6db+OjDU
 sTXvrBgboFGrKYjQ8Ll9G3ruCzsyMFgounbK00DTf9GuqCuUT6OpKvQ8rkpxiYi0eW392QmC1p8
 TF3I6DaULpeedEsmnDApNXMa3UKOLTzP3eYOlSIIQ8e2gthHOutJ+n4ZT5kcNUVIC0sIRlxJM5i
 kIQoZ7OobLi3jSn76WyAOSy44fUWRZrMSdCPNHCUsxtz3VTNXhzGehPRxyvmuzbz9FtlDl/u2nx
 3rYnbDms+O24PXw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX7ghcsD94yGEM
 SWGGgIjqaZHtTtTAXQOPcxkWa6GmItmQlbGwNrYSXQf7hvUL5nj5S1T/MCKEr+DQKnN75SZBOLy
 A3r1kiPd5YbO0F2WUmsI5qK7ITkh2d4=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e0bac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=m3zw2U_XGuQn2lDZ05UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FcQWnT6uRe5SDim3RcOvqp2u47sxVBLa
X-Proofpoint-ORIG-GUID: FcQWnT6uRe5SDim3RcOvqp2u47sxVBLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX6WU9/+pbfILs
 iih1+fRU7nYzJSvMbE8bijxbDBbErBaA28HXYWPfXLSgHfZO5hhplZixMhbd0yNEPwb2l5ryyTB
 kJAdmbicBpyzyU9zUzp+kmHvcVtZER5SQy7dxsB8BtrHtEcwKv/WbTFq6TC5MN8iXrZz4AoQ/Gn
 QQYxSl6n3Oy8UxwgVPBjkiLjtK+IOIo3tkC8Ypnp62I4AjymxCUtT6IUhRhYmidudeikB3/0lrH
 gUeV/1zH/aTIDIh63G2ZGLciC7cKiV6uSyq4UPsNYCUe5y3Q+rB/o/J7hTBqTlPT5nv53B/iscp
 YNrlWvcAI+wRiHS33podMS+koF6Qy/IvO8yCudEaja1lZ04fQoycwGYLU6IgiCCS5zU1eeM1QtD
 WcmZYuRC2Ks09gAfj7GgzPjRUjnaSibGfEmG0kuyIFyme8gjB0iWWi6pM73vp16JSqjaYyCx34k
 iE2uxoTJ3ls9H5RF2kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_080726_248126_6AFDD0B5 
X-CRM114-Status: GOOD (  17.73  )
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

'status' property is special, thus DTS coding style expects it to be
always the last property preceded with a blank line, as reported by
dt-check-style:

  [required-blank-lines] "status" must be preceded by a blank line
  [property-order] property 'vcc-supply' out of canonical order (should sort before 'status')

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  2 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 12 +++-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 70 ++++++++++++++++++++++
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 36721adcaa23..c5a3958c2320 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -39,6 +39,7 @@ ldo31m {
 
 &cont_splash_mem {
 	reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+
 	status = "okay";
 };
 
@@ -47,5 +48,6 @@ &framebuffer0 {
 	height = <2400>;
 	stride = <(1080 * 4)>;
 	format = "a8r8g8b8";
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 5227cd4e314b..a12f2b88d72d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -32,6 +32,7 @@ framebuffer0: framebuffer-0 {
 			vci-supply = <&s2mpg10_ldo22m>;
 			vddi-supply = <&s2mpg11_bucka>;
 			/* format properties to be added by actual board */
+
 			status = "disabled";
 		};
 	};
@@ -98,6 +99,7 @@ cont_splash_mem: splash@fac00000 {
 			/* size to be updated by actual board */
 			reg = <0x0 0xfac00000 0x0>;
 			no-map;
+
 			status = "disabled";
 		};
 	};
@@ -856,8 +858,9 @@ &serial_0 {
 };
 
 &ufs_0 {
-	status = "okay";
 	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+
+	status = "okay";
 };
 
 &ufs_0_phy {
@@ -867,6 +870,7 @@ &ufs_0_phy {
 &usbdrd31 {
 	vdd10-supply = <&reg_placeholder>;
 	vdd33-supply = <&reg_placeholder>;
+
 	status = "okay";
 };
 
@@ -875,6 +879,7 @@ &usbdrd31_dwc3 {
 	usb-role-switch;
 	role-switch-default-mode = "peripheral";
 	maximum-speed = "super-speed-plus";
+
 	status = "okay";
 
 	port {
@@ -893,6 +898,7 @@ &usbdrd31_phy {
 	vdd33-usb20-supply = <&reg_placeholder>;
 	vdda-usbdp-supply = <&reg_placeholder>;
 	vddh-usbdp-supply = <&reg_placeholder>;
+
 	status = "okay";
 
 	port {
@@ -904,20 +910,24 @@ usbdrd31_phy_orien_switch: endpoint {
 
 &usi_uart {
 	samsung,clkreq-on; /* needed for UART mode */
+
 	status = "okay";
 };
 
 &usi8 {
 	samsung,mode = <USI_MODE_I2C>;
+
 	status = "okay";
 };
 
 &usi12 {
 	samsung,mode = <USI_MODE_I2C>;
+
 	status = "okay";
 };
 
 &watchdog_cl0 {
 	timeout-sec = <30>;
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
index a422542715f2..7c4273796a22 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -35,6 +35,7 @@ ldo14s {
 
 &cont_splash_mem {
 	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+
 	status = "okay";
 };
 
@@ -43,5 +44,6 @@ &framebuffer0 {
 	height = <3120>;
 	stride = <(1440 * 4)>;
 	format = "a8r8g8b8";
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 86933f22647b..edc38f2d1183 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -624,6 +624,7 @@ watchdog_cl0: watchdog@10060000 {
 			interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,cluster-index = <0>;
+
 			status = "disabled";
 		};
 
@@ -636,6 +637,7 @@ watchdog_cl1: watchdog@10070000 {
 			interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,cluster-index = <1>;
+
 			status = "disabled";
 		};
 
@@ -707,6 +709,7 @@ usi1: usi@109000c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1000>;
+
 			status = "disabled";
 
 			hsi2c_1: i2c@10900000 {
@@ -721,6 +724,7 @@ hsi2c_1: i2c@10900000 {
 				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c1_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -734,6 +738,7 @@ serial_1: serial@10900000 {
 				pinctrl-0 = <&uart1_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -748,6 +753,7 @@ spi_1: spi@10900000 {
 				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi1_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -762,6 +768,7 @@ usi2: usi@109100c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1004>;
+
 			status = "disabled";
 
 			hsi2c_2: i2c@10910000 {
@@ -776,6 +783,7 @@ hsi2c_2: i2c@10910000 {
 				interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c2_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -789,6 +797,7 @@ serial_2: serial@10910000 {
 				pinctrl-0 = <&uart2_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -803,6 +812,7 @@ spi_2: spi@10910000 {
 				interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi2_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -817,6 +827,7 @@ usi3: usi@109200c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1008>;
+
 			status = "disabled";
 
 			hsi2c_3: i2c@10920000 {
@@ -831,6 +842,7 @@ hsi2c_3: i2c@10920000 {
 				interrupts = <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c3_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -844,6 +856,7 @@ serial_3: serial@10920000 {
 				pinctrl-0 = <&uart3_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -858,6 +871,7 @@ spi_3: spi@10920000 {
 				interrupts = <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi3_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -872,6 +886,7 @@ usi4: usi@109300c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x100c>;
+
 			status = "disabled";
 
 			hsi2c_4: i2c@10930000 {
@@ -886,6 +901,7 @@ hsi2c_4: i2c@10930000 {
 				interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c4_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -899,6 +915,7 @@ serial_4: serial@10930000 {
 				pinctrl-0 = <&uart4_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -913,6 +930,7 @@ spi_4: spi@10930000 {
 				interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi4_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -927,6 +945,7 @@ usi5: usi@109400c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1010>;
+
 			status = "disabled";
 
 			hsi2c_5: i2c@10940000 {
@@ -941,6 +960,7 @@ hsi2c_5: i2c@10940000 {
 				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c5_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -954,6 +974,7 @@ serial_5: serial@10940000 {
 				pinctrl-0 = <&uart5_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -968,6 +989,7 @@ spi_5: spi@10940000 {
 				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi5_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -982,6 +1004,7 @@ usi6: usi@109500c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1014>;
+
 			status = "disabled";
 
 			hsi2c_6: i2c@10950000 {
@@ -996,6 +1019,7 @@ hsi2c_6: i2c@10950000 {
 				interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c6_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1009,6 +1033,7 @@ serial_6: serial@10950000 {
 				pinctrl-0 = <&uart6_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1023,6 +1048,7 @@ spi_6: spi@10950000 {
 				interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi6_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1037,6 +1063,7 @@ usi7: usi@109600c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1018>;
+
 			status = "disabled";
 
 			hsi2c_7: i2c@10960000 {
@@ -1051,6 +1078,7 @@ hsi2c_7: i2c@10960000 {
 				interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c7_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1064,6 +1092,7 @@ serial_7: serial@10960000 {
 				pinctrl-0 = <&uart7_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1078,6 +1107,7 @@ spi_7: spi@10960000 {
 				interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi7_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1092,6 +1122,7 @@ usi8: usi@109700c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x101c>;
+
 			status = "disabled";
 
 			hsi2c_8: i2c@10970000 {
@@ -1106,6 +1137,7 @@ hsi2c_8: i2c@10970000 {
 				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c8_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1119,6 +1151,7 @@ serial_8: serial@10970000 {
 				pinctrl-0 = <&uart8_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1133,6 +1166,7 @@ spi_8: spi@10970000 {
 				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi8_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1148,6 +1182,7 @@ usi_uart: usi@10a000c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1020>;
 			samsung,mode = <USI_MODE_UART>;
+
 			status = "disabled";
 
 			serial_0: serial@10a00000 {
@@ -1160,6 +1195,7 @@ serial_0: serial@10a00000 {
 				pinctrl-0 = <&uart0_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 		};
@@ -1174,6 +1210,7 @@ usi14: usi@10a200c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1028>;
+
 			status = "disabled";
 
 			hsi2c_14: i2c@10a20000 {
@@ -1188,6 +1225,7 @@ hsi2c_14: i2c@10a20000 {
 				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c14_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1201,6 +1239,7 @@ serial_14: serial@10a20000 {
 				pinctrl-0 = <&uart14_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1215,6 +1254,7 @@ spi_14: spi@10a20000 {
 				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi14_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1254,6 +1294,7 @@ usi0: usi@10d100c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1000>;
+
 			status = "disabled";
 
 			hsi2c_0: i2c@10d10000 {
@@ -1268,6 +1309,7 @@ hsi2c_0: i2c@10d10000 {
 				interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c0_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1281,6 +1323,7 @@ serial_usi0: serial@10d10000 {
 				pinctrl-0 = <&uart0_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1295,6 +1338,7 @@ spi_0: spi@10d10000 {
 				interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi0_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1309,6 +1353,7 @@ usi9: usi@10d200c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1004>;
+
 			status = "disabled";
 
 			hsi2c_9: i2c@10d20000 {
@@ -1323,6 +1368,7 @@ hsi2c_9: i2c@10d20000 {
 				interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c9_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1336,6 +1382,7 @@ serial_9: serial@10d20000 {
 				pinctrl-0 = <&uart9_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1350,6 +1397,7 @@ spi_9: spi@10d20000 {
 				interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi9_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1364,6 +1412,7 @@ usi10: usi@10d300c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1008>;
+
 			status = "disabled";
 
 			hsi2c_10: i2c@10d30000 {
@@ -1378,6 +1427,7 @@ hsi2c_10: i2c@10d30000 {
 				interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c10_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1391,6 +1441,7 @@ serial_10: serial@10d30000 {
 				pinctrl-0 = <&uart10_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1405,6 +1456,7 @@ spi_10: spi@10d30000 {
 				interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi10_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1419,6 +1471,7 @@ usi11: usi@10d400c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x100c>;
+
 			status = "disabled";
 
 			hsi2c_11: i2c@10d40000 {
@@ -1433,6 +1486,7 @@ hsi2c_11: i2c@10d40000 {
 				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c11_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1446,6 +1500,7 @@ serial_11: serial@10d40000 {
 				pinctrl-0 = <&uart11_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1460,6 +1515,7 @@ spi_11: spi@10d40000 {
 				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi11_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1474,6 +1530,7 @@ usi12: usi@10d500c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1010>;
+
 			status = "disabled";
 
 			hsi2c_12: i2c@10d50000 {
@@ -1488,6 +1545,7 @@ hsi2c_12: i2c@10d50000 {
 				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c12_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1501,6 +1559,7 @@ serial_12: serial@10d50000 {
 				pinctrl-0 = <&uart12_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1515,6 +1574,7 @@ spi_12: spi@10d50000 {
 				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi12_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1529,6 +1589,7 @@ usi13: usi@10d600c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1014>;
+
 			status = "disabled";
 
 			hsi2c_13: i2c@10d60000 {
@@ -1543,6 +1604,7 @@ hsi2c_13: i2c@10d60000 {
 				interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c13_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1556,6 +1618,7 @@ serial_13: serial@10d60000 {
 				pinctrl-0 = <&uart13_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1570,6 +1633,7 @@ spi_13: spi@10d60000 {
 				interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi13_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1609,6 +1673,7 @@ usbdrd31_phy: phy@11100000 {
 			clock-names = "phy", "ref", "ctrl_aclk", "ctrl_pclk", "scl_pclk";
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
+
 			status = "disabled";
 		};
 
@@ -1622,6 +1687,7 @@ usbdrd31: usb@11110000 {
 			clock-names = "bus_early", "susp_clk", "link_aclk", "link_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
+
 			status = "disabled";
 
 			usbdrd31_dwc3: usb@0 {
@@ -1635,6 +1701,7 @@ usbdrd31_dwc3: usb@0 {
 				snps,has-lpm-erratum;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
+
 				status = "disabled";
 			};
 		};
@@ -1698,6 +1765,7 @@ ufs_0: ufs@14700000 {
 			phys = <&ufs_0_phy>;
 			phy-names = "ufs-phy";
 			samsung,sysreg = <&sysreg_hsi2 0x710>;
+
 			status = "disabled";
 		};
 
@@ -1709,6 +1777,7 @@ ufs_0_phy: phy@14704000 {
 			#phy-cells = <0>;
 			clocks = <&ext_24_5m>;
 			clock-names = "ref_clk";
+
 			status = "disabled";
 		};
 
@@ -1812,6 +1881,7 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			/* TODO: update once support for this CMU exists */
 			clocks = <0>;
 			clock-names = "pclk";
+
 			status = "disabled";
 		};
 

-- 
2.53.0


