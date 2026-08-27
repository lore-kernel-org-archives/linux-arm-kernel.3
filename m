Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7D5C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=; b=ySwlySm/1WeD7gET/Zllsu+3zR
	tVFtFw69dOjE0h/B6lILcCxdFeE2PlNvIBcCwLW36xc7TdGhQpL4ESdYxtnsXcUIu+GHDdF7UwXIr
	6I10L0nzqnmQ3KxAY7wcsDCwASKVTK2+w7xX6LVmOyA7O7gTKOkDIuZFqVsQmL/Y4IQCtrQyIXW8c
	PFIJUMKEyeDCwRV5wdJaaQMet3AAV0uDl1wffxltIDmjk5aZE02TAmH+XgK2gEp1WRh0moZu3E67I
	H7QdACGUr1znGPaDpmpnBaUkjPrq+/FxVJjto/Nd4JYv8l1Y9anHyVwPt44L7Xbwt1TEOID+e7aQg
	EDWKnlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGf-00000004VO3-3siI;
	Thu, 27 Aug 2026 17:52:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGP-00000004VKl-3FV6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:51:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXfHI1568410
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=; b=k1Z6dd2ejZaZb14h
	BBiA2j/2MndoDiNZ3U04U6JUwtiVfZKYNpi3GsBPpNAcKgtFfOJ1M5gEyKHYFWGP
	+dAAXWRbjjpcRAbAWI4+PHVnuevAUUls25FW4l2pSJircAVOx4yUCNXxLkDO/hnB
	gDoBNNv03WhxxeOh9B9SQnAaYBlY2Yku5Lz8nBHHUlzXUdvLPqq+fP796h630+nS
	51n+L6GAXGEMA5qVZr5JxhVgjLHLjvecNKC3q6qOLU35I1WeDc27wOtmG5b9mbyC
	H1LFfhzsQSd5qAgy8FDp0A7rcZALqTIbUzKMDXsWZGmJI3lWjje5Ubj8RNZDbAEw
	vgE5ag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5m9pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7151120d6so1402555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853105; x=1788457905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=IAcz7gAmEAj/kJibucWYYgNiZ9L/8hjzO5zNwXExoRl6iDMBXOHJKei66YAtCsxefJ
         aFUguob2UcU45LSgRdFMiEm6nH3yfyQsvhax2YK4VV0gwKLcQPCCJJpg/k+PkGQT4r/C
         9U50o47kfyonNisNN98i7nsxfmjfHlYMZ7YuOz4gsQZOZxOC7+BnkKhr36z8XGiF1gCE
         x+wqJRoYAXbLgxlQ8pmal5tEBQnA9wYhVxB/CgeRuEpuZrZYzAg6Ts8GRXdLYBxcImrH
         qrcYOd96XZH6NUuKDO5SdXlTa1job3VcavxTKOhiAADoXmLhVUg/hEcpCavD6hqVCb8z
         MaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853105; x=1788457905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=mhEz60SFJKBiTnf8dpZUGWjPAdHSicguBMdlvZLghYnr+zLKExDmqbJ0HmLvhRlEna
         OVl7ejV18GgroWwwL7SO0Tt8cgv8wpOjAG4HzkE8uFTQfkkCNgJYK2+Lgbn+ruxBuMrz
         tM/nuIqnsnELRZMgAnpnQwIEgIf6yOe7ZXCTMjldmjPZXbuITz5LMGteN69mRcuOl17T
         9uEuMhCwyd0Xnd1vFalumO5XeuAQyh4lEqT11JSCFFJ8c+j/22dyY6C17JTdPv9JJhOx
         WJ/ER6Mk8Vt0dg0alMUUV2miS1gSnT4UlmXPD+p/m2Kp3yHQC567uGW7JygZNZ88g0bJ
         V9Rw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6NoOTiq/LTaztEpvJ0xzzIXC7wCw3OHb41GFVkHqI5U6lf+zJzLCP20wF45ALGp78RHGahkzpGIxyT6Kouw+K@lists.infradead.org
X-Gm-Message-State: AFuF++kHsAcnq5NwI71HHX1fClWLJL4CsLk/ROvMyhjHVY7I/tUrTfF0
	dIoI5PTe/oEMejudwL4t5VACS2ZysRqYhTsg1sbpffzIJjUjWEKfZWxqpAbc7fKH2eQ9poLkoBM
	ZPKCK2epkVvvLiAyiSxrppPel5Sx3v2n4QiLF2e5Ay9axzFCxuWrBfQAx/291AZ/2uYOhUSUwUv
	GVlg==
X-Gm-Gg: AR+sD12zf2XDVrdqz8SQ7ZjEvSLZY+eDpsrsevK+3TMMctmGszTzV+ZXiel67+c7jJ3
	iZFp08bUWukoFywBlwM0LwrCgDwArk4CPMW/HDq+MdeF8W43/5OZrR5uHD6fRM3vptzQB+1CwRS
	Yd9h1TdDYGpwDQmwl5uzktrCKZQc5Lvgz6tO6Tg3LlVpMVXSrz1ae5hslzRiqrfR6LsW28SkgP2
	axA2OcaKzL7zHdtbiGBJWthRiJnACwxRgNVlWGxN7bxKLsjilQp0r7hTvSfMDxofSb8quWQk9cg
	3VHhHYgW775LyflVSKwUBqIL3nklSjQyKiCsY0+kEGYr/4vqkAmT74C5HUcasmFydWEfgEigFm9
	ETclHHBt56pLonWmuFFS2fauZtalzu7BHn4xh9WJ84H2GITEr0AhXfoZY6uOOzpFwpFcKDQLDOX
	SaYGkPffp09H1j2nykYh91ZWI=
X-Received: by 2002:a17:902:f708:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d74dcb5c40mr12275005ad.6.1787853104499;
        Thu, 27 Aug 2026 10:51:44 -0700 (PDT)
X-Received: by 2002:a17:902:f708:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d74dcb5c40mr12273935ad.6.1787853103968;
        Thu, 27 Aug 2026 10:51:43 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:06 +0530
Subject: [PATCH v5 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-3-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=1801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
 b=i+O8rfJxoGXvxVb8s0xUN5ycmjvQA1VLSZzdlTqgB5ei4txrnc1hXqZx6yMSn+P7/kHrq/WRq
 +uDDOAajqMPCrT4rDfEz7FVT3k6XSqnAkUgQs9SKUE0OU/9v4bhnuj7
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: Q7ykom9goIfm_U5nemZ02TKLzn9VRomL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX8d8oYrX8SIFm
 ycuPi/cNcd+fSyMiDGDWi/B0V9vojUHiJChZOwHg4dOxcclxbEIHr/X1g87bBRJWs6YOkBKbLT0
 xTwkFGpYAOwLm/NKjmqDnDGzzS4HFAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX405N6qCymBrL
 PZzjN702b0myM/a4yr7Z5Y58McIJ2NAjzObOh7U0ktVef7y6bLSqKwTuhEgBgss6BTMAyct01f8
 oJItQzYY2JLicGtc8BfzuEc/6qm3e9ag5QlOsMToAYkC0cnlrB2FG+OQxGiJQZ3RjDKRPC9xY8r
 FN+8q0HLy/Xtjjgn9KXzpIzYddv2YHaqRNkJ7NUTCwU42jg37AxmIpW3M+QmPvvAaV5im9j6hWC
 rG3T3S4RZusB4aLZmtijZvTH92Y0cU7f0pmoWrY+P/J8tbGEe7zM/fyOA5YQUZ60A6/0QGfMWua
 mLprKIRUw8RD6hfhqut0Ey0LuF8eA31dc9lnNzAN8PKeWq8sI48S3qLHIx181UPJjLVPdLbwtYE
 bbrACpZJu6m7THIwAv2j4y/90h5HBt2qW4RUcVyl/a8d0YkVu1LQp4FaQ9Rh1nQrjvTIDzDTESF
 eozsGsNR0Ko8wMS9HEg==
X-Proofpoint-GUID: Q7ykom9goIfm_U5nemZ02TKLzn9VRomL
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a907931 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105145_819248_61779A94 
X-CRM114-Status: GOOD (  14.05  )
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

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 90743275942d..725ce802f683 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -681,6 +681,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -885,6 +900,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0


