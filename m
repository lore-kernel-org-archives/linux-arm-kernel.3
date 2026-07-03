Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DFCC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=; b=j3YIK+Y1sPfaRiBIBJeqDAuued
	hZ0B2rgR+x+0RD5h/IBvjCFNNz2UkzGYVj1uCjurIYaVZaL2mp9e9FptkN40KWS83cMyeFsZmyLmS
	ioYZb67olnA0jmlQFrRzo2LMqyhIkdgiVqTTi8Qo+zwXvpEZuWiyjDt5/kqCADxz4iP7Gl1tyrhaP
	/lSWo/eYHeZI9j3LWGhrO7ysefI3DnSYt7fhI20yTOrp2ePPrbh63Iifp0cWPH14Y8GmP8zmukr4Q
	QwX8WCemaFgd3UpS+3hpRp1nUvFLWPcbrROQwxMNGJ7o1EuWZP2N4mO8cXQdSQiRMV/B67odrasxF
	D6VZiw4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfal1-00000006XmJ-3MnJ;
	Fri, 03 Jul 2026 10:04:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaky-00000006Xk8-1E8m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:04:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rw543126400
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=; b=JWpgvTlPz0bQog+z
	NqyiIGfmu2cWZ3ArF2+0yp0CKPB1aW5cBFlIwbu4daYbG+r+wVThBJOo0TIUtGU/
	yLoOLXBBKVSzHPtKgK4fa/GGJrJPwvbg0GawNSZ6W9dTPUacfSaxdkLajZElBZnM
	f4BKDq3S5YVEovPWlDkVsMMVbhkkSfnBk8tcQb/rrH0e0QglX7TU2SGS+MG0piKx
	tqNjmuxgfmfZCU8VDvOqwYU9pzfRbGU1O9Yqa6rGY5dep7mWvYES2Ixv9HWhDRtO
	7Ej6N1myQtPuTXCHvMYTFpCWLe1DfjBtogtWPg5ZYXfDltC6+VV03E/0PCAuuktJ
	nnQKSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnkw00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:04:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so159318885a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073062; x=1783677862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=;
        b=R2z79d6u7GiyRZ3ibSyT9HqYWJCzQB/k4U7rAS2bJpymP5eR2uER3DxMMvK3IPatYK
         wgShTdWYsBcOy17z7SsqgtVppK0lrLUmuk1nqNFt/79V8y0/VxpzRORNuNbvnJR/jrlY
         7f62DGTZ4tV8wmad+f6X58IT5+daXq11Yuo95kZyEhsm6ai3g1qg1p3FAZ+uOu1RdTTd
         ceXt/gSUbX16El5Jux9tFLLL18ygRc1Uu7bL5fo7XeyMsPTRqcZoW6vy/Qyn1TxtvyNS
         0A7lPCjbrAQGIeAoRooj3S2pIn0A+aVSVK0l4j8Rmk7Ssxk3XXlAHvSAPCnWy9SKKVJ4
         Ek/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073062; x=1783677862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vzY6VtgRaXQm2ALYg/hWmUCpgwFNEblpl/7KboAIqFA=;
        b=XzM5XpWM+KVg1lx/9ClR5GBWqkKFzbZQ2FY+LBREnOecEhqkE5HY5gCc9b1fZQnaun
         ahiI7sqZJ4tkEnzK1QoSY3C16U0mP6Dvjnma7GyJq/wows9b292wY6L5zkKqxPijf9Q9
         LTFPK3pSYEvJiG5V6lKDHT7HjPyJ+eLLJbQiMKJsW/C7xxMaehbWxCvobH0Bda9JizLx
         Rs6UHNj7GMNpSHL1PB5FWJ+sKHkkvfThJWvXNWUHLoiaiLQgSPEDgBDk2m5vJilZS78Q
         kOwVHY+NQ+PpazEMDPSuhf3i3mmo57m+t5KGcEV26+ZLGWOGE/hK7AvUIw6UEDqZ3YY0
         gJjg==
X-Forwarded-Encrypted: i=1; AFNElJ8iCuJ8nbiJ6SwiC6QQkaB2Coqbv7oz2V4PYtbFvg1ntYd0LVqaerBlrMjUBNnaGrJetMN6sPdwPCqFmZ4vyGvc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4gQxEy1NshMOE1bvQRUunsqYmYx3OFz5+zejRukgOQmDRSZXf
	sDKqI+x41icPpszvNJbGJZVZfNYm0fdxJaPTD+G7baDqUHnsaEASkkiJnP6BNvs9s8i0CLMUEGi
	MybsbJ7eyhzSk8vtxg4e0sbZnaRecDVWJGraRUfWLE5IeJ7rWaO9S0wlcp8G8a5urlzHq/zOulY
	sdRQ==
X-Gm-Gg: AfdE7cmUeJmkjWFrxB6uCcRriZ+xCV3NYF6n1m5V99uQKO0vX8dKyyfeT2KYvgiNiNm
	yxJex365V3b3mz2FoTuxAiagN5DtlBm+lM2iEeOLJyYcfMD7tQ1QtQa0kmTZjmCLtx/lZYnWCNG
	GfkxpV0BrXoHJktNhS6yXr/6AAViyueft4EwdkH4PQEZQFMmZe6iF1gFXM2gUkIFghK8c8W+8pi
	i3YTziNdv/JJyVx9OGbG9pz7AECUedK95h7mBGtT+xvdNilTIf2elHenXx47kk3UyiuhPET7xj1
	o3KdvbQWXpnlPNuEUZMzAI0RxazHYwO6/+eZ4MsYOih/B6RyIiwuQ5sBntkwwPbyin98C6t86+A
	h3RpJLUet3GdvXAruAw3bldXMeukBIGd845M=
X-Received: by 2002:a05:620a:288d:b0:92e:5b63:224d with SMTP id af79cd13be357-92e8b50a646mr388577085a.26.1783073062451;
        Fri, 03 Jul 2026 03:04:22 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:92e:5b63:224d with SMTP id af79cd13be357-92e8b50a646mr388571285a.26.1783073061913;
        Fri, 03 Jul 2026 03:04:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:00 +0200
Subject: [PATCH v3 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-2-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6IUDRPm8vWXd3Ap2chxvIhrLJKPJP1JURTs7mxhVP8o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kVqxQIqKFkGTfTuOe+2a9hTQwLHaVhoVBew
 UyZ6qrLjlWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFQAKCRDBN2bmhouD
 18BhD/9gxKiAWPubM37j9jOGrQ1wOEDTmfvOxGim2SUQHd3X1MB6Vbe1cn3BnrCgzayktB5J2h/
 QD8pe5JM1nO8WV9muwgZF9oez7XFzdWmgNpTY90dMybUcP4I3FIHgZyRsuce+0TT55yV5Di8znq
 byEBDJ3LECftpEV+CYfv+gIoXzqAlUUZlepmdJRqGjYsxe3f3UhHcx8yQgdZu2Du9CuVeQQOP6Z
 xtZGY0XCa7/AcwRmQnB/82jv92ZSg3U8bK8k2pifkAO/kBMrrzUKRwNGDHdQ/v2C6gDL7oJeqUJ
 6MpatpuUxCbLkahxjVQZHjEqgfmuQqt4i3nWcNZoiLlYrZzJ7wnxDU4mfcTjWllnU0C3UeU71b/
 Iv79p1CJn82HJmxE4CfLHk8oo3U3z1Q9For6whQdgwPBxVpQaWdd7okTEbeCYL6lLOK8+daAeXf
 rqnYuugGyu5JtmSkgvToOdQirlWSCzFdUPuzdrLSjc+03zqtA6jFVe5jvUTwFcFmHIgU1GrKtsr
 IVulZbTZtLZDF4cWICgoIdVdO1z3pXyHiCgvrEkwk+vERdajNJ6MhePKE1fDJ0dbGn9CfH+gey2
 M25aNpNHKY3J4bnuACGgupYsVcaVqekkUNPX8pjqmVbJKgQbhxmsujbIKKxRP6StPcRVnkawuAJ
 AcE8MomTP14zgAw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ifJLcHrUVk8ZU2HiAeETmMPhDRYoWiOT
X-Proofpoint-ORIG-GUID: ifJLcHrUVk8ZU2HiAeETmMPhDRYoWiOT
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a478927 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZSuaVHzWtUHH4nz7hFsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX5uKjIrTxwDwr
 1yd30efZO8UBr7iqLA++/FueN7ROLp0ryvznb1xW64xs97mkDeoKszqeZJWzbohYMswXrGWMJSS
 vVFQYqRrhM3lyYv0JsvFizOYbDJpFxg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX9kxS5/IvQBNa
 fGS2MTiKxSzQ7le+Y8EjFGHz4o0BQb8t+Eosdyjqb40EcFEalcoDz3dd6yQo3mIkodazeyQ+YcJ
 oAiJ8Y252omFygDPW2KVLeshCG7yALkC95cM9jkfT76iR1vO8xNxpdLQa8khJ2Qd05Hs/Ax4GOy
 8Mk/Y0m3zZIMhyZV3J9EBFR8N9HRTZSxN1QYAMq2CeAnUcmM0ARdWOMDDfLVcJQG9Jh2gCxbFfU
 LJeozKmoBXZfrXA6UI4fs2GsvWmi2VC23TE+yaQgWcUYMJ/GGudHbXpnNIEoiva8yfbq1zy17aJ
 WT5LAvtPZUgNQ17SCkg0qmGHPSREq7cmPE0q9iXBTOLT8DfrCRuar31gx8biAX7s25+ddXbV7Ap
 Pe9YGTllcJs514B4Vfcfe8pRpLt50JcrvaAdRDb6ZKk3/TY6f20BEGGCpbAC4FXWJkdEmPmnuTP
 50/j7VLEGXUDhpurUAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030424_518631_61689EE8 
X-CRM114-Status: GOOD (  14.14  )
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

IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
SDX65, which are 32-bit as well.

Do not allow building them for ARM64 to make built kernels smaller and
user choices easier.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d4f80c6953e3..f07455328e5c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -250,6 +250,7 @@ config QCOM_A53PLL
 
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -396,6 +397,7 @@ config IPQ_CMN_PLL
 
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,

-- 
2.53.0


