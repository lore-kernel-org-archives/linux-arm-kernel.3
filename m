Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcgnkajawYKqpU6qG8Qh0lQ//Ymi7V9Vf3n5LhJH1ps=; b=CbbcgcZhOxGZpJDzN3soOSk40j
	HKosDbZeVfQuFF5bM2Y2iqVzI62f1YNTW7hgE9Z6kB5gYKzbVUg5oxG9wZf2M1NLsiU7iDixy0/k+
	zMr75WnXZJ1JcOdwav9x+TTbYWKKmblmlxMVkOC9hbbObhdslRjwzmqs5HcBWkFUM2UKUi7AYc/QX
	s28WGx2RMwxFWMfQEt4IMtFkI265WuOk3BBL6RHhRlXpqS9FbjpfUSx5uL9kd2tQkO0VqUnQrmhoJ
	it5GY23rzSPlHTnFikRNqPjQc2wN3i06NlBfl28behHU7jnUUXWrA8fpRfMLWG1ot/TDDcLJJyXY9
	Q3xbCS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfal0-00000006XlR-2iOb;
	Fri, 03 Jul 2026 10:04:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfakv-00000006Xhp-0Toe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:04:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rf6V2994864
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcgnkajawYKqpU6qG8Qh0lQ//Ymi7V9Vf3n5LhJH1ps=; b=MuS9GvCIX25OPlbm
	pzbngbg6zhKRIfTAyeqvS0t3lKxZRB8vvkadWogBtEnvfaV6AWM+X8q16BV+1ANV
	zD8jsIjBaExV8e7DrcLpzfKgJDNxCGrzDBspttAaWQv7C4rkSV6vmAGGO8Xh3YwB
	gE3bC0eMceXPf/kLrXtZ39VUVpAJJwY47cu6I/PCvahUuD3xN2Ag586/Kry+MtSu
	46BfDNqP3eDJyE/RhkCXNL9GG30+cVaAev0h+U6KGHaXz5gs86c0a+Gi1IoA/2up
	EPFSoHYnVC6fUVjHhGdz/YhGLoVWEBO21u07HpvPTD4vLT2lq2vzedNCfhSdYnD9
	P7Vyeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1t6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:04:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c364ae3bso34689885a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073059; x=1783677859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcgnkajawYKqpU6qG8Qh0lQ//Ymi7V9Vf3n5LhJH1ps=;
        b=fSHrVt2KScIlOG6Z/1xn9UU33lOzSx0YzcexQU0+BivWTuHR/FQRagoIbuDPI/GEPf
         0PGiNN8jp6EJLuN0kWANLP6qkTBiO8Zh+o/eyK6CDN8c3Izif2HBQlP3AI1Dpk1aGI1P
         TaFKMLKUNOsLeDGw0zAfzoSRoexwlfFGwLQMjjTq5/EmjAS+KDOyHzxnwpHq8ydhO3rP
         sB1ZyM6zPH8+N+fCwXvExnLAG1HflSQuUJmuFgeRl+xA5wWIJTaziDxKQ034a8rma49E
         lfi9xJVCnlPU9rw9O6fw/V9ptD1LFBGaNsokM5B+0Ek+NDSQ/IS/kLFanR+eyzH9BIrv
         DhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073059; x=1783677859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fcgnkajawYKqpU6qG8Qh0lQ//Ymi7V9Vf3n5LhJH1ps=;
        b=VLrNcdVfNL5XaSMVonheZBFU75T22pkqKcPXMcVH0PjD71xg3iZQ/G2k3NyiVHg7EH
         tNvvkRfZoSjDeQ6WWmRimEVo1IEUM1elIuXUD7SvRK3fKdbvTAseJ4iaWAEPcGqfqI95
         f0S7dTxkZkYNPjDX8jPxfZVflyWyFBUL+gRfCStcgKC+ND5uw40hRQUFXSRf4DeFnWlE
         XLNiNVmy2q8mwowhSgAe/cVvRB+98bp+SD06kGOqRovDpvBJVNi+gqobyT8JWskUKPDN
         SlVCC3dPbJB64uPCkpTcvPJ9K9CdkIOiaHoi8CwhTFnJGRgUVjkMvrBd17F6dbu5Ym1t
         4k9w==
X-Forwarded-Encrypted: i=1; AFNElJ/TnNKxQHg+4CymX+dzN0kZmjci3vTqrr/6eo5ZTNviTIKxBRHXqQwcKVK10xBdJ4kKTXNeol1otEkq4zy/0Miq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjxn1mRDUiVh1jlgzspbIRxuTmveLvY1C83sqy+PA+uPN/wj2J
	hPNkxwv+oFeQ7rahQZ6boA1XiwxuweppupvI06yapLlAQpilmg8ecOtxvCdwbk5xsJpjARHQAjv
	XHEIP2i/agcMuuAsiwwrPGHVxNjxR/irL/EoboUjXzepVZjZDYcIgkMZvO6Crna+y1e9+SoyDs5
	uQ8A==
X-Gm-Gg: AfdE7clz1e45f6ItjAGnY5WHb6NKhxf9tz0VDh4a+HmQYe18I2Jzr3LJoikkfsEE0bt
	Oyul6BjUh7aBGW5zRuHgpAsJn232sonBk34KcLPHAHFrRh3935zS6TzSNsbctTAC1dCOwEVyA1B
	h0II/8b3ZZtGDEbErfgYGxBKHxtwfXdXWz36AJ25mHoukFu4FCRYf9O6cmx/JJ3qOzLhxKEEFlu
	UJIPPElhdqNu9qt9M45gecslkC5i68/PuI7phKxvfvKeCvXSEOYqi13pP882d7T3Yaf7VosKhEf
	opaiXDkaUWpDEhZylyCgTOuPs7URbO8GFouPYf90b1aMwBp8bNoeGCjpXDeFku3h59fZWcgcZzI
	ssF5BR+MMfHLkWPqbm2UX9alW13D0VyqIF/A=
X-Received: by 2002:a05:620a:170a:b0:92e:6c8a:2a1a with SMTP id af79cd13be357-92e781d28a0mr1246326485a.7.1783073059065;
        Fri, 03 Jul 2026 03:04:19 -0700 (PDT)
X-Received: by 2002:a05:620a:170a:b0:92e:6c8a:2a1a with SMTP id af79cd13be357-92e781d28a0mr1246317585a.7.1783073058218;
        Fri, 03 Jul 2026 03:04:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:03:59 +0200
Subject: [PATCH v3 1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-1-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6RY5cIrVgZDKKwhOrSo7qgkhL/e4/H0mXeSOwXjaWI8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kUxwOR/PqADyvRF1PEutdEMrXc8V6t5ElBb
 XwlcvCUNJGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFAAKCRDBN2bmhouD
 1+PfD/9LYQ7sld4HL+cuSM3ViP6etJb4kHUUgWF4zfcFM+VKDmqQWE14LIlGitteIKN7AO9qHl5
 zkrjjAk3JfGMmU70fRzzfdrlQ3IitETvaQacd37epDe8YlIplnwXYc09MbDfUlrnlyqba8VY1m7
 QkeBEFm275rYwArIwXH45JUVTS78LdvaT+lBC6pErdcCIV0ciKQ22gH4woGlWZQYs9y9xraCJhH
 nc+0GXQUpznbpf0eoNxJOvJAZVWjpMZGradolQDPQX1FJyslxPc62AibgbBfEFqpjgNMAhB2BQe
 vqaWUWZ336vrf1ciDB4ZUsJN5lLu9TWiHX+UURSqZndIecOoe9o8PaOjxmHwbab+cGX07iqG3y1
 SWwYsfCToSamXRA82XPWxU4JdXMCG1z/eMa2HW2Syv7JPA/LlSXGdhxDOVJe9bYoBWbo5zf/Uh1
 9jnOwXk7GCeeYAmnHLBXnDpm3i+JnC+SY52hiHmt4NcYRMJ8lDsP3dj9qt/MrGJFjJY30+vkjUL
 55qNoZbORE3qCWm8657wQFRY622D8SBjIAFWr4JNnYEi1SbRW1WzHjdFN9vcwCIEZPtRhU1pDdz
 yRHdVdTJduyBHPvdrPryeQSjTU/8Pxi4+JR7qHojnUuTpjJe1KBRadjSmFKwlZKpvImvPzHUOmS
 jxUEw0EcWaJlatg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfXw2FHIwOI6+2F
 CgFlAEVpL0Er11tNIafdW49/GCitBZd/phYWo0L8rv1oudK9qhmXsMfBrGNjBHy/033zCe92UWw
 hE6uq+baM05/NzIMXQepYwUbf16Iwrk=
X-Proofpoint-ORIG-GUID: WGWVA839sLHZKPQF6MR5mLGBwV0_ZpEp
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a478923 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oh4px0T-8jNy5rkF8LYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WGWVA839sLHZKPQF6MR5mLGBwV0_ZpEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX3uJkVo5Fe9Fp
 kIjjFPzjCpyUn0kGqsyuIAyqIy4qr/CCXpeEzYoYE84ZAvqzzj11s8En8MBICpOgftOrm6tr6y5
 8hhA06df2/SBEJNpvDwgTFspgnQOOu7gJsFXitux4yH8VcJRUdFO0idcxVuOb8IYy7Bth3bxmc/
 Jo1HuRM8YHpxsclvSn6Olu7jBFbqHEuHF8uCLv2rB35I2G8Lyfl9bvHIU2GBJps/Z1wV52zaCwj
 0v3W7uqkhZLsje2nsCg1RRUHJh/9+vUV/mhp9uPqxPV6rxi3BLypIu6jsagcuZGLkoecASDAs/d
 3dFfViLeNtkNHsqHqQmxGnGkkKvabeAgXMUwf3LROm6cjrvA+CENAsId+VmSiG+HstjnXFJ0Nhi
 7CmWs7kH99MpVQN8nLxGXfsk1sag8ruR9+EN/74oFdi1oK0XhRWv8FLaP5mni0KdQrkgnFpNWgI
 epOB30dy2eXjUDpNHZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030421_300021_3C1E87EF 
X-CRM114-Status: GOOD (  14.11  )
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

Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
so should not be a choice for ARM 32-bit builds, to make kernels smaller
and user choices easier.

IPQ_CMN_PLL is used only by the SoCs already having clock controllers
restricted to ARM64

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911..d4f80c6953e3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -363,6 +363,7 @@ config IPQ_APSS_PLL
 
 config IPQ_APSS_5424
 	tristate "IPQ5424 APSS Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select IPQ_APSS_PLL
 	default y if IPQ_GCC_5424
 	help
@@ -373,6 +374,7 @@ config IPQ_APSS_5424
 config IPQ_APSS_6018
 	tristate "IPQ6018 APSS Clock Controller"
 	select IPQ_APSS_PLL
+	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM
 	help
@@ -384,6 +386,7 @@ config IPQ_APSS_6018
 
 config IPQ_CMN_PLL
 	tristate "IPQ CMN PLL Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for CMN PLL clock controller on IPQ platform. The
 	  CMN PLL consumes the AHB/SYS clocks from GCC and supplies
@@ -432,6 +435,7 @@ config IPQ_GCC_5424
 
 config IPQ_GCC_6018
 	tristate "IPQ6018 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq6018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -457,6 +461,7 @@ config IPQ_LCC_806X
 
 config IPQ_GCC_8074
 	tristate "IPQ8074 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for global clock controller on ipq8074 devices.
@@ -466,6 +471,7 @@ config IPQ_GCC_8074
 
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -690,6 +696,7 @@ config MSM_MMCC_8998
 
 config QCM_GCC_2290
 	tristate "QCM2290 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QCM2290 devices.
@@ -698,6 +705,7 @@ config QCM_GCC_2290
 
 config QCM_DISPCC_2290
 	tristate "QCM2290 Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
@@ -869,6 +877,7 @@ config SC_DISPCC_8280XP
 config SA_GCC_8775P
 	tristate "SA8775 Global Clock Controller"
 	select QCOM_GDSC
+	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK_QCOM
 	help
 	  Support for the global clock controller on SA8775 devices.
@@ -877,6 +886,7 @@ config SA_GCC_8775P
 
 config SA_GPUCC_8775P
 	tristate "SA8775P Graphics clock controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SA_GCC_8775P
 	help
@@ -1079,6 +1089,7 @@ config QCS_Q6SSTOP_404
 
 config QDU_GCC_1000
 	tristate "QDU1000/QRU1000 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QDU1000 and

-- 
2.53.0


