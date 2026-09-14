Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9C1C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo6lkBP6TqX0J1FUeHfohEqxSgaBQojAzmOdg5GekDE=; b=jzyj8uQsgeYlghZ6hLSQO2sW6z
	jWGB91cqgDcgXByjiouNCg1mDzIlTWsrTjgIQLDtrGodPuE8fSHU5ZBMFr5bszJYjv+sh3rF29zAS
	c0KS0kH2tK54XgdNPmMPRIjhWYnAJjuLZ3gHbTX00XQkza7TEiJg2bJ/iApfPux2lVlJEqXRQxZcs
	uOWVTDjDxit1ooxswG0oVigfvuQJiPJGy4tnW5R+4aePIfEoOt3BcXxFCdeRUTh6s04JO6N2nYqWY
	A0c6d11wCtKubsM9tb5z0fUpVpk1TGFZ1Vt4B2du8LAxFVZtbOglw6Y6YH9v29/BnKmQ4dnl7Vfk1
	nWJnYq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60QQ-00000002T0i-3MVZ;
	Mon, 14 Sep 2026 06:44:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60QO-00000002Szc-0sFY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:44:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ibBE793174
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wo6lkBP6TqX0J1FUeHfohEqxSgaBQojAzmOdg5GekDE=; b=OckLvB6xmvUNUV3H
	j4NZSpVOzveMIzVMeVafEjAnUoofBx2QVq5KAMd8pnzkIG2mdaK4CORO+xOvSl8v
	JeyUDPo3lf7Fn4Wvu9gQRw47jFQ10D5+bc8NkcFL0MlV892ie2woQGj2crXfnKuV
	LnGOTShvrwU4yzCaCzusvpqDOWOu9FphLFEkEekHSLRrosxB773RsI2ZMr8ECghW
	0Zby7gKhfrmdjTu6so87tqXk2mfEvRsGhb6MOOu/829Cd6fToc7QWoDoq+AWwSTV
	dFccIW0aLdOIzedOE9PEq5tPxEwHX4WgIufh0hO2Z6SEZYPJMvkugaVszUko26kU
	3BG7/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnb85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:44:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so782374585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368259; x=1789973059; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wo6lkBP6TqX0J1FUeHfohEqxSgaBQojAzmOdg5GekDE=;
        b=W/Kv/2dlpg/s+PHv06SK8xqSivQhXWyZ0CbZQ9F8qda8/7RmJ0hJQ+h5XdX9hK5nEy
         ERm7FVQ3YKmIE0+t3E/nTBPXzG3NOUcD2NInH32/VL1oSF66KlUHJv0pQhYEXD1wXzTO
         24WRoPOcv3MafhN4Hu47E5k4gPrGWSnF+ICiZeZ98WozQek6SnPhwONKibdKTMmFi2QF
         6PrjVQk3ExAnVMTfVPl64JkciIi8YNW7WqIdg6bZK7mbn8RerKJvIec2u5kKulfSl2v3
         WeXGIvatdobMpIbXb+Z7qrMfh2NTdYeYl8Bah2PqdHEl3Cwaynfwpu+EE6qt5mdDf6o6
         Btag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368259; x=1789973059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wo6lkBP6TqX0J1FUeHfohEqxSgaBQojAzmOdg5GekDE=;
        b=CwT84cOlglRx8Gj/FYRglOQ8WsxDQsl+wamtTqLhPy56l+KW7HnMnO3TnLSSR3kbzM
         AcORAfdRUAprrAgUrTZaknHhvZtSClUfYRN0p7qD+AkzQ+MLCKhQRWvRjO6uG5PBkxG1
         NeAp3I9lo7cyYzKplGdovrPjOSYT5DIYwvc+wS7vNyUiO8QuYEcBphn2v5OjBOQ8otVK
         nZcC4KlkWK4uu5PT5MToEg3+hbl9dByPWDn2hL8ShS1D255adYTjKTy1lz3s/C1JkC0z
         vsS14hMhDgmXej0G8DlRBdSdT/j1lp7uowkOplVITsUva19OLKRB8a3vJYN7YhUi3Wer
         IBmQ==
X-Forwarded-Encrypted: i=1; AKwUvByJoMNSP9V3bz190VyC3OdBA3IQT10z4XvFCIo4BoQjpOVpmWeCYg9PUD2CnnSreY6RbWhN0o5slI77e2jGZM/D@lists.infradead.org
X-Gm-Message-State: AFuF++mLLlK8mLStSzi9Bckp11UJsdAYCe8ZsdcP/+yfwY+Q9+2IZmVi
	eqhxgMtypztAqENfmkz5WtC8ZIFKP3lpR4fob36OlhlDcRRGr+Ydn57LewyzvgecTyWQHoiUNu0
	ubLsTpThJA5MZVVVc41Teavikmv4bRIbDYT9+56i2EiYtLhPX9OZ/T6k5HLDJaofs4do3lO59yC
	oI507yve2ZMw==
X-Gm-Gg: AYBFou1zHWUkqkGYC2VwmwsdbffiuNqK6gowY2yMMMWPrjbJ5f3F9QP4F/EkQmGAKFo
	jMjcTcHCZtO/FLOWNH+mMyJKkPFoN9em3+DzGK5TLHHZl6PKdf1FZ/GounSE9NbYkb4tsGxS1MY
	vQQdL+hcefmGR2lNb4osrurWBojfa01ekrvaUdquwK00HEdDBDKWkrN/FjMwGYnVGVGGoQgFh4n
	MJCJLiRtHURlZY0SGu61j0Mx7cRjgHvGhQ2tkI7g65B6N7KfUZ8aeYnmChjzGGRv6XDrWmxaQcM
	sE6tGlW9gw5bQJ9K8ukxp8RpapPMQxk/fOmZdJRs1UuGy29HNc8YpV82J1UVuZZbq60zbRt+52h
	DP/p8cFYemGwYz+2qVnUfSis=
X-Received: by 2002:a05:620a:6f01:b0:937:50b6:4a5b with SMTP id af79cd13be357-93a298dce2fmr172171885a.23.1789368258718;
        Sun, 13 Sep 2026 23:44:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:937:50b6:4a5b with SMTP id af79cd13be357-93a298dce2fmr172169385a.23.1789368258341;
        Sun, 13 Sep 2026 23:44:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm23736954f8f.35.2026.09.13.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:44:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 08:44:05 +0200
Subject: [PATCH v4 2/2] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-interconnect-qcom-clean-arm64-v4-2-5b2c0e6a929a@oss.qualcomm.com>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DkghmOpxQVQQ344fbDwVdJF/835lptBoNZwqa5eEQg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqp5e85tKMoFWpUA+N/fZck3aARl4n/xy0Z195a
 S1g9dY/53+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqeXvAAKCRDBN2bmhouD
 1/HeD/9M+hHQDFfq6g9fb0+Xqyny3If7zxaSuChzneq8qfnroUOrLktosJ6zeou03Dc5lkEYqls
 L+HtHwT/np43Uic+t1mrmwIPC4jrazTxG9LcrbLS9m261q19ScdiKiEhljzBHokqDdyRC4gKfKt
 B+fLdytyhwRO4KKi2hyFsSp5dxM1WACjUn8vgnQID1XIM6ecZJjL5ewblpxAOEy18olr8rnL8fE
 ItXlPQLtyg/hpthLRggk3ZXZgVKN9m+VUuYkmLRaXTD00OilsU9NeeOkzTIHDx0fsEkRoAC+Gtq
 oSmKDNX3sjTCgWP7kKVah7LcSRTLVCpkeflE3MXMxbMpSBlPanBAtkV9F665ld1OnOd30e7wnZB
 wuYGoWVjL2+UKyi1CatdHOdnn7GC2+jdiJ9zrX8QbkPBWvcfnjNQ17oxEW8p9oD1hIiMiBKxPCY
 pt9uROC4DVY9Im4EgfvXD0fP55LRO3dalvalS5hvifpxqnD4h4oF0N4VrbPj+v+HCdhRjyD9CnR
 LBDjq0A2Dv/is7bYU3mmddhfuevy89i3rAugmzw+nfb1SlF4b1GDFR1BUVJybia2Pk4KAniP+/8
 ItROQtzaPy0uUtRfU8GCu+hlKOMcDPTT45fLIRbwtHxqTPUfRvg0ydB+KW4TmAeWxyjH+2+3eFQ
 r8jy3OKwgoo7F9w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX9KzDilDvNBFY
 xkCOXy/xnSQSMQ0EcqY64lgM5oMi0PPrOaj8D0Z0I3RMlxpx+CdBgmvmuQL0e/CQ+VfYomjKXNB
 /zNPkHKa96i39oXZ+SOh5eh6miGvZ6tPLYf0ZIMSzoJCo1cOCBYbXl6AuqlsUMN19hDR+nCTCf8
 vTOn4DKaxPNIBehBwXlmaDNI17eRBwybbCoxNH2dT7wy0CAMv7PajDJwtn4ayZq1K9095FJFVkQ
 jkiVM6huzZxreLXOghx/32N5/ZuH9jLJrbPt/vQuuLq7gYVo/1++zgBk5PIKZSqgrrKPktvEiH0
 4+gg2bq9hUC/L00CSEVPn8/xI6fTgr22g+BfGD+K4V+3yN8XcdC+yK2bdGr0dOiSJmSLRgkBJGN
 HERVRJpaL58TfAimOcgPqDrb8teoLVuc6uXGDYih8urjpfNfR76+kRSn+pa/6qkEk+u20cspuxo
 AAoEwFNqmgocN1PiuJw==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa797c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kXAE_2JiKEgLwU3Z5NgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfXx7+Ce7rGxAyF
 jWCpPai9UQcPpVEB0n9Gm9X3tXVjgv/VOdraUy+m7wdS93UOXEfg8LhxHMd0sj96V0n9m7ySNT8
 Nxn67CObvKE+QNnDv+pir8zSIItBg0I=
X-Proofpoint-GUID: 6O8_B0JL2Kb8lvZPjdptK8wtENVTSagq
X-Proofpoint-ORIG-GUID: 6O8_B0JL2Kb8lvZPjdptK8wtENVTSagq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_234420_259007_9E53DE59 
X-CRM114-Status: GOOD (  13.47  )
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

Hawi, Maili, Nord and Shikra were added in parallel or after
commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
ARM/ARM64"), thus they missed the update restricting them per
architecture (with the same rationale).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index d6c37704be03..da7af117466a 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -34,6 +34,7 @@ config INTERCONNECT_QCOM_GLYMUR
 config INTERCONNECT_QCOM_HAWI
 	tristate "Qualcomm HAWI interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -55,6 +56,7 @@ config INTERCONNECT_QCOM_KAANAPALI
 config INTERCONNECT_QCOM_MAILI
 	tristate "Qualcomm MAILI interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -146,6 +148,7 @@ config INTERCONNECT_QCOM_MSM8996
 config INTERCONNECT_QCOM_NORD
 	tristate "Qualcomm Nord interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -370,6 +373,7 @@ config INTERCONNECT_QCOM_SHIKRA
 	tristate "Qualcomm SHIKRA interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	default ARCH_QCOM
 	help

-- 
2.53.0


