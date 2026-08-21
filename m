Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE43C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=BCi0t0yQJqnLAC0eRL+kQcEn2K
	NlyO9yukdFsuR8gFbHLCnpRnBTCcSqg4+e6wnQQHI2B2U4H0AULPbWe25/8TZPa14v8yLcuQu1qm2
	A/2POLu9rWDxcIZOlZ8Is7Idn4NbvBZ0PHesLeTDOQs8ZvDHtZ/ag2Gyu1A0KUK8fW4hbP5vsUxwV
	6c10zmOPqe2SLOE13UfH1iu9PAH+4aRh+NCCVj+n1USvc4RJDALKRDUmdnW7D1pg3Wh2PDyK/gKGN
	KkW4TvjXnTr5qhnbHWNigyoOPkrAd41CHXCNkN8pbEEUvoZE4ctyWCc3PSna6Cx2iRxWPufsYEKAw
	d5Wj9c3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoY-0000000Dl20-3J7a;
	Fri, 21 Aug 2026 16:09:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoU-0000000Dkz4-0cpw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:09:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmJ8h2744623
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=HvNWmG3cGQB5SN1o
	4S3jxthaESGU+fyHigSOwfsTnZbKqpVnpCTbUecz1r5nSNMMinJgUXYolTR6o3ie
	8wT2ApfQ5/PSaP1GxDXac/14trJvUBgn9tAO7dg+OphPz6xc3jQIVWU9RdRzFIeJ
	ScK2Pz+RmxS2j1IK1IQfxdtwJTHNET+gP8z/o+9WwvZ/uyBRlg5yyMDl5RZGeNTn
	hiQjUdmKJb+cX8SYYCx3s1v+TjYuRbNCi5Fj736JNVVo6oqkrkthuws5OxUXtszV
	inVG5sRuw6mgdK9RC9i8TLgwY4HKQtOJXGnh/1YWyslE4VuCjkxDatf9JN/Dd55W
	10STMA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdnaf1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:49 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso1940076b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328588; x=1787933388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=U78glohNSaQY0jhlQaThqwLPtxihQtHg4ZLWkn6b9J+dKTkzK9/57HQYete2tzp2oh
         z79kbzWXTUQSKX8xBwq5wHoFNMGb6VLwv7zYyRZ7BRkcydFCtBm/OUeEpRA/RYNm5Xr5
         bm7EV+pt+TGtYVoCezw7a8kFt73Dtgs/vPh24Yu4AwwgwAnrIWAWGSuzchVt4PXrJ2Xb
         BAQuX/7WRYxMBgNWKYLlBl363aGgZkXMAf9PleMnQvOjI6uc7er76IPWSfWOXTkjR81R
         5vmaFcPQXBqdYk6br/Q/L6xcWbbt0E/FVqqy0KsyMPdou2bHyr+EHjTz03EX30ztgI2J
         z7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328588; x=1787933388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=ZSr6bY1qLegmDiUpfxPneNWqjwlY54INV9QUEegvvA32P817d0JFz7PDLP7YJlyglr
         pvXhDxzbehYUthzmBD80hw+KsEO+D/DMm7wIkgVR68c0aiMfzFfA83qVUW4wcP5FeZXu
         WrLUwlYK0MHr0DX/0apU/NeGephh6f5/RYr4U8aSYsimMq3OQndZ41KxrMHa0idj9f3R
         T70la/QnlnoFRbjmbWQEgrKAFXFxUIS1m47rlH8bQ5Nd9w2PhGrb1syjQ4ZinQke2Hd0
         YNLUttZRP+f6MwDB8QEIrdwzwTEvRNoWGRoSmt+fhl4w4bbvyzpeRYsv6HjkdB4WCTCX
         IsnQ==
X-Forwarded-Encrypted: i=1; AHgh+RokoC95T+l9sm6kJMEIZBb315Sp5A6iZu8GBVWRsLGz07cB0S8/AHrHrqUCHsOfgjA/smujIXAffvm2ax5Ucwbh@lists.infradead.org
X-Gm-Message-State: AOJu0YzM4Gq5KrhFqVyzVFrRCLlKJs5c34UZ/ZnKKEw9CIG0haOL9wXE
	q73S2CjhZdm/xrUfvH9dBHVrjTRaSthdxo1gxLxIt/BX2jGAt19QgXCvE17HwlVUxxwKcRFdlQ5
	+xjMmDOOEVmixUXjrZj1nuAzWhBnbe3GNnRz4s6Fof514oDt8fDliDZNghGBKcSoGhnMmxfHDhI
	81Gg==
X-Gm-Gg: AR+sD10gGKbVPxAxffy8rfLHryAsx8KSqQljlnZffdyBGbP+zI1T92Vltvnk5uKpL1+
	KjBodho5ytLRNo0vYPVZUHdSwW5tGmohnjnf48uIougIzfXdVJJyPzojMH6RMOlkVaX8fQdVT27
	thDkO4lzheaFDIPW8R9dC2JSxYr+2Alt+h54q+uL+4HwgGQasLAWtQPBo+9VfG8OXHeyPEgkl0m
	ckSVyChX6x4ia0UbNXlc4fDqQMkeHZ9KGuKrws7mgURG/XgX0OybErEKd0K5dTYmmssLEJuINWk
	DTCksfSCRJtfM8tlWx1QBVxLErXoin0UVmQ49+3Hhw2vFk+kg6epCN9dbpIRNRBXsbj8GV/tAFm
	zby4BO9aG0LLHceMxQZ0q5r8BnwkuODk2NkOfGL/NhqlQQY9C6USBDegrG03SS2IcBfMND+bkY9
	gn7BrktLlplEvfll+tlX8vjwc=
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078438b6e.3.1787328588578;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078344b6e.3.1787328588130;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:47 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:57 +0530
Subject: [PATCH v3 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-4-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=9IPV7eFcmcQy3YV7XduUDzVOHCb0O8TQeRqyjO8MMMACqn9sPoWMnZYcaAMUrzKUCuPu/vqFO
 PVRyy4d1nvKCgSpIwfSYSyxpTfHjH7jkE0NF+jGaoQYV7MN4Ry/ukC4
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX2IxOEgjhmEoH
 Rnx/V2zlGBvKc/O4SNGuo5WtD9CZV0Gf1TGwNYCzmWdIw43yz6GdbOZAV7tfu38zlAk2efxdfFm
 nVTKZmDFlTgbBHPBBgNfQyHWMYaxJohRgRw7wN3rVJeE/8NQp/pI8/yAp67uF1SnY/fmBkVLNOP
 Gg0nSDFvbwrlyQkQ4Id+z0LYu3XG1vZTDMfvOxt7yewl1EScOZXI9mvwWzJqcZ/j8Eai5L06y0S
 i6j5iecGKnfWjNkLrCXYYZ96g2HRyu1QupiIznNbcaNMbSCbtmD6tbzqjDMTYPWntOdrax0ojcv
 UCAepDXhQNwijW04tF8rHwu74mu2SV3nY3ZARPsf9XyaJqbB/2Z+AHlISyLFtMOTvf+93wHJUkY
 i635kwX0ZpaR9ir/dA8fyHnFBW381OMkPVz7qfwmlLQQmkp81RRf5/UwkAT11lw02gfE5sje4yU
 wxNk6xCKUmLnNeWPmww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX7PLIWod0X8Zp
 FOKtNIn+6fbmYAILVCoJeueikEOH7J6fKiAThNvRbXv22mmO8JAldSzC4ZZUL2Getmdc1FB+Lk9
 Hvtq1TTJjdOKphrW0+tqkaQ3lYbDCQg=
X-Proofpoint-ORIG-GUID: SORbI_guEgCGp3KywwYwopU6dkaPCcBG
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a88784d cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: SORbI_guEgCGp3KywwYwopU6dkaPCcBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_090950_410509_CAD2617B 
X-CRM114-Status: GOOD (  12.29  )
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

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0


