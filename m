Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D322AC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=NJB5YR27mfGUpoNCzzEjbiigCw
	3LDpnb8QyLuZH/mmoRDAqUtxxuZbVkXhB13PPeN8t5n0Y9/SaxcGMK9BQszD+oXlLNQsk+B2EUbwP
	MZAe7qoVQrAUZImqhafd/MbnraxLS8XlB7KGukfoCcamKe/j/QMUVymsl1vmCx/xzaTacgKMVF2hD
	wv4U/yZ/w1bsYXB5A19FC1kA8HeSGzQ/tkrAb32AspK6crRVjO8F0AylYDCrsocv6m9XuI5HrUPsF
	XHYFtTzPp/YJdhlJuYNDWB5Z00PVY6K4RxIMB5Mz6ibrAjKrpBnV9rKPziNUc68loDL7YHnBCk9Nx
	Dz6ArGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd9U-00000004NZe-0Pdo;
	Thu, 27 Aug 2026 16:40:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd9G-00000004NSL-3GoM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:40:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbh7U1310852
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=N8vvVj2vTDZzGwDP
	A67C1JtkqcTDE53xyqIRB/SYAAMWMy+LHtcy8zSAN8PY7N29uUmX0BftGy8MdN7K
	EGsCSXD3ROSR9NFgNiMmJST28GA3MV6h01b6mlJQw69l6zmbhNWZz86bHrgrTARb
	Za2Twxone3gG/EmKGplJ9HTEkfLX45P99ffP93JTuHFnRYTGSNojLt4T7c/l8YQS
	2O7SWRYpBFVuVK41L0YtPBDlGLIfXXebfV2bu3KUHCdu5e8Tt9Guwc4to6sq9ULF
	WvWlXfLLed1KZ3r7anRbhygqYvy1GXjHtI0O1Dfr/IpkdFhP8EaQ3SH0THqqz+0x
	AocL7A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5kt2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:40:18 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f1da5e5b06so135531a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848817; x=1788453617; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=VsZ5LE2xhcuTe5fp2zldQue/GhifdG9KOP5Mar2hHuQ5XFG5xD3/yOvhfCLqnwcCWB
         IWK0WHImTtvOhHvNHNWqVJfnzpVNtGiylEnK4XOX0OtKdIcgZAt2Tjpm371FzG5y0AQQ
         FkH3343z2e1X3D4aG7wL6Gb75U9FPyTz3DVjJaTMqCbO/g3eKKBpqEM+2TmqDvzPFrDz
         AQCC3Y6OI5ERQkVKepq5mmJdnoHM6kBju3ST1niKEx/igwjlVchm4FTnroGRUmOIiW3e
         JQ0s6/vXRgz73/tILNj9bID0oAXtsRVKwEPnZdxEtbTCZjSBqlf9rSPYVonCS30trzS6
         JJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848817; x=1788453617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=eiopwp+VyIF1lcyO1AqKhvwH8jy6PcR2ULU+svWkU8YstJwtZR/NcNGkIJxxItLHPq
         Wd+X5Mx1jyUco+x+Fa2TUt9YTFlrT2ksmcr6/ueKRawPl2JR7dX5QoKLmQzPmN3WDnFj
         TkM86kT19L7pwbyQyUc+A4PHAkDSD7OQKSUyfyYFK8rhW+PDzXvDJI4J4t/ZIFFVeuZt
         Q7UoFqqZQvHZQHLGHQyz+cCV5fQePmEsvpJey0RX/nfC1f18h0zlR44dJ0i/posxIev2
         DUM0A73M37dg0U7SoHh4IJkEOCZdiI8vlBkYxATWDGPrwx0MIFM15I6MEnnY70L3AzYK
         f+Kw==
X-Forwarded-Encrypted: i=1; AHgh+RoOEByV1XSCq1aVFshFEqNxAhzre2WwfaC80c0jknltvNjKHikW0tjDSATELtQs9Fg9XSrI7b7wivpuARU3QbSJ@lists.infradead.org
X-Gm-Message-State: AFuF++kmnamhZeJCTMz+ibfM7nf5Fp7g5BGAB81auAVMJzbCovMXfPP4
	/Ztkm0d7ViDsD/HUtcILrFTX1DPg/CGm0eHo2FjxeJt7dBArFpEn8tnEVuIEh6U148WqFAt7pOo
	/HoGRkfPIn7gzJcULCfxRdqA45CWHbjLZRz2DxXBl6pcuIyFvQ6ycTI3Lfua+jqVht9uEw6DXYO
	IOvw==
X-Gm-Gg: AR+sD103auarDqWGNI2/j8RS1phTxlAqUcYSVJDJR0fAaQLhXW5/dFFgkdF8s7CR32X
	98gsev135sVqWozUU+IoX0IR2FBBSz/fjk/w0T6iKmwesCh7Lldv+52SXoz1oy5O9oVJyy5VfLC
	fh2cGZJ0fM/xoINRBQ5muu+AdZiImzEkEmY3RXx/RpSwNy2yf5lrc38+6dcRmKwtY4rMP4J8OAG
	NzQZuguQso8idE2AvyatXvjqO+O3qiwkdcThrO4K9XcvX1jHdKAr+wzkHX4wfjT3t+Cex4LW9Gt
	7X8E43+EiDzNOF002M9dYpMu+Vi8+7OWBt7aEv2ABwtE5+n42TRQMWQpFw63FThd3VzHnr3Wam+
	4XTRTC0OJj459N3SdGJfuC5aAq+btBgLRUa8bhOzoJOc052FX44qBht2+ft1fIqiBYYSVK3FKZI
	SYySoei4tgv5GoMEyvoVbymRA=
X-Received: by 2002:a05:6820:179:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b1a052926bmr13261542eaf.33.1787848817496;
        Thu, 27 Aug 2026 09:40:17 -0700 (PDT)
X-Received: by 2002:a05:6820:179:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b1a052926bmr13261458eaf.33.1787848816972;
        Thu, 27 Aug 2026 09:40:16 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:16 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:14 +0530
Subject: [PATCH v4 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-13-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=FzE4Q+PBujlIxnBIqlmOr7wAj0IwjS7m5ptJ/dDcSO/NJAOnDGcge2UvSXP9Ldwdg4J2npUQM
 agBO9OVl2R7Cj2H8FreXT0fPbuMGanegKflD/GG71Sg7ZNDymSJR3cG
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: NvudzK0eB7hWzDydmv_WDybS4-u2Llhl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXx3dI4G43JRVs
 +SzPQY6BnQ8KfBLvQlgGQ0xdFfwcLZyK2vqf+QG3kVLQ2L05zIT5GWXggYxOFAJMV41N8xoxbLH
 rbgF+4FU32vd3bU6usDPXKwIbTcyHT0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX2UoaaAxITaqc
 AClmRn9MHrgRwlzkgK1FXTUxjENXAx2c3TByd1fFViTMAXNkejo4crxZ+wzdV1xxq8PixLY7+O+
 ih9Q85d2Jeu08/vQUftV8mIdZKLUM8cogFOk+j1dQvc3loRzx+G8ME8eq28pm8iHSCQG8BXZhfQ
 1Vw3x9GPAqzzfOjNQHUrrYMF254t87pxfft1Ot5M5lyoPqX8qI9AuCc9cvMgrE2bH5FCPJlphM/
 OD+/XLB8L/VDflaeuNJ6OohTAiQJeBJe2zFF++Otwy7JsaRXMdP/0wNkOenZlkzRmL2//Iv+Dmn
 7ch1XhbBFqOJ/mpPutXU5CinmlLtpw4LfcBTBDHwV0w4Z5QKv0TXJnGtS3m7KmOBcO2bdAyVW6K
 ETUDmXQJzZZGbjZDPb+2j5YmuDtQdtYVhW+ivLrvQ5ktUVqu4QKfEixT2XJU7vaqmfbFrxZAP54
 EIjkhrhe98h1X4fwNOw==
X-Proofpoint-GUID: NvudzK0eB7hWzDydmv_WDybS4-u2Llhl
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a906872 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094019_199834_3BE8AA8C 
X-CRM114-Status: GOOD (  12.25  )
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

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0


