Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B354C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=N+e4ws8nKgLiU6UBR5m9TmyY67
	PmoxnrIDCGcPnHxm0nx8XPuTbbqG7kc1rHJoEABw9Y/5dxP/H8E9wCrKbB99Bq/eZNeX95qsxGhuY
	xzD3psHJILztx+7nE56iP8k5E5xFzb4Gi43otNef68ezRVjCtCKRfj96wwSFA8VKFG+XjHddzmCQa
	iffODfgN1YnzOXJPDdm64/GGl4byIfov1qJhpDM0CvRjREnEq8Z/gJhlj5SfzgDoJYUrTXiJ07PrK
	4MJLoPegW2nzhv1yuvnd9xktRqzNQI7Sx9LYJwi4lVgXsykHFRAuhIL2t/lN1aFn1jupXaYsH01Qv
	IGAp1WLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeID-00000004WP8-2DNC;
	Thu, 27 Aug 2026 17:53:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHc-00000004W1R-0zJe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:53:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdkF1568341
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=XveKuaykkN0fyFu0
	oyzT6oSjYAB1CC8LaAlXMiNGzxKK4bODPslUpyRn/9nO3Kf/QBwXzzRvR7ddSitD
	UIoK4dEm55z0GU1r1+2qSljuF196tNvAi9zQS7gh4FPvYUppdo0DVyPz4FQ7mmk5
	jxIH95dYG1D4Zc1D2sdeIUJs5Wf5ZNMibzEES444Cpib+vFG7MlqyKjtVDLTBwRO
	yUjBy5BeP6my5z6ISXHM0M0rfOs3yiDQoiddXcObRTvE3WzBNT64Ndb5aUczdYSP
	8/h5D76PWHQCn9Q3M3UlYJTnKjox8D1QWQ3NBdethPYFzjgAsudHoqDfmtJuEyxg
	Drh2Og==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5ma2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:52:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so897405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853179; x=1788457979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=dWaO2MRasaHe4jHPCuZYapJAQ+pHOfFg/Q9oo4jU8v0nish64H7HPFcPMwjn3I9ySi
         jNqIBnhDZ/OXmqL2Axt47uCRLkkdWfHn/G9vb21hG8+Mw/1dxeBrAX9ORhn31v2wLQt2
         5JcqkcQVsS93P80TA09fHR/08ryIHsTThvMwGa61verAabJAF4z1p8k0D2l6o31n4dny
         4gu/OJKESNmCkkNU5vCE4mN+P8Z7u3djhwWpvNdjtgFBxkE3OW5B20flhb8rCoPb9l5Z
         xml/D8Lh1Ki+QLv3pLJUWHP3/DBX5a4WIsTfasbip47fSykIfoce5whMZIoEZVDOrOG5
         pg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853179; x=1788457979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=UN6fxzyKfGNXi3eGK7ckbCa/V+B0pwwB5FR54uZ98hHlQroYxsfgG0QLleTfaTQIZz
         ThBAV5oankIS6hAIToqOYJSAKXX4nCHm29Pgo6AxIVLKo0sA4vKmSS2j9q3nKlVPHemc
         5lNBKEJhGIf9FmnWBeZERutZk+pYbd606ItqptglkY8ANQH1xttLM1Z6dMh70iJoDZdz
         LpsCgdoM4B2zhS1DuDaa3BvOBbJIi+AkolzfNdBj3+CsbaG78UbyCRlbTeN9eSPKyR/w
         4lrGdjS98jzMMBKxfl8x20DL/czoGbt1+0QCoTyHUEbyYJY8hH2qOAdIbVFUeIBJxJpY
         XTPA==
X-Forwarded-Encrypted: i=1; AHgh+RojKrqOSJQ5ClaahWzbeyoFxjGHbFoh6G/J/niYYdSIFLCcZMasvL0Fi0nYXLiEqbFEv4mQDhFaVr4LkoJCikP5@lists.infradead.org
X-Gm-Message-State: AFuF++n6Thb/NWlWZHdBlChnIIhGYAjLCqHu2JJqnoysIlDmvOt9uVeD
	PnQjUeUQGZ/i1zCmaE/8ljXKcsr75tDHYEyP3UC6kmv5fI8GJsR3RW+DpHCMSx0PUJ5zBUYogQM
	JSAF2AtR330FTj8Z51iM98MpXMMZuofbPM5EjsuBRnyhG8pl/m51bUDB6mfMmGrIt66mby79BA7
	oPng==
X-Gm-Gg: AR+sD12tZAtblgetpzEBtgixrN+kD5kM6fNB37AdfrOxFiYM8ZsJxVQ+q70mW828VVH
	7CEB91zZJ70fZyQubcQ83MszIl0jmvBrOGeL7dAt8ZxODJlMe89jd8tBR9rZkBy3d2/qUvAWwG4
	COeglBBnTDD1HUkApB/IYCWxCsAnHzrWMNURQ+918nvpsQZtoIBD/mYCcnXEq+C5pvC1pQxDuGa
	bv7S7qRri3E2Pep2j5i9ri6TMJy47EVs/++ugtwrKOcOX4fTCvFAc4M7j7Ltuh0xfhiAV3HtbJj
	+WxhcUs4wMdgbIh1ydWhCsk34zTDJB459QJ3DgUnbuUoV1zRB1+CpCltyUsCrSlkplcDWGwhoDn
	o9XsyxdwayMev479ZmI4J7M2BiQDCPQHRAZBcHtQ1CAsN0SEsPSk79eaR3NvyTrDVk7dfGIFtjt
	HSYJ+4gEVHz2PjfZtWRePPJZA=
X-Received: by 2002:a17:903:15cf:b0:2d7:1aeb:739 with SMTP id d9443c01a7336-2d74e1295c2mr11086815ad.13.1787853179212;
        Thu, 27 Aug 2026 10:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2d7:1aeb:739 with SMTP id d9443c01a7336-2d74e1295c2mr11085775ad.13.1787853178763;
        Thu, 27 Aug 2026 10:52:58 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:58 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:15 +0530
Subject: [PATCH v5 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-12-6d47636a8f09@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=5+UqgzWqWAt2y8pw+wO8S1gQhj+ILFb5zZykxqwlJVi4SL1guDDGpMcNI/73AXMXGq7fNAD8n
 e00Bc2sIs1UCSRq9bFhRuWIPh3sI+xeXRdBycjDqBUkKY4tQG6SPHpa
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: H5JRSRZRzUyGc1ZohX68vUV2QiFXb5xt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX02m0her/Q/6E
 BhR5dkoGuxkohT6TRnn1TIr9eQY/p5lHmCH0qcppcciUHEq4gTAGfy18w08JMmgzml2+nh56N+6
 x7UZQatf0fdco/ZVqWuzaU4a1Qj9irg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXyC1zwrpHwSE+
 HSETRv+1tYjItP3mo4IpvtKi4t8XICO1qInoUDeq3aSOn+mCr1Adbd6CSZnSHQm/WXDD9wEPcf6
 wJV7O35VNhFfTCqW496Z3Wdx0i0oE/hV8KYQ9qZ37lbpIy1Vb5Q/4PH01wod/dMcGbZDoUXLHUt
 dDaFHP8OJt70E8rAgGvuJzILDPoqf0nhPnEhwGrFQGAo7dOX7D4xRuEbkDKZ+Fy97M5RRicGn+e
 fpheL7RTPlVCOCKe70nbLLfYxVQoT/csV8AXo65ZWGYRqzMC9fNtG1peMCmqluwdwKTIlUpSDXq
 2inyuUD8hlYybXSl9LfEeCuQdofG2Jw94LbBsRLKpwHoQKl9iTCpRBnWDvMBEYaWDgJzsdb6zqB
 Xh9LgUVRvCcSTqdqgxRN4Y1LFM787H3JaCH15VhejRxi4X0PJRElxwU+ivGe86ZccBcLtS3liJK
 seYXxVUPO+LsEINQNkw==
X-Proofpoint-GUID: H5JRSRZRzUyGc1ZohX68vUV2QiFXb5xt
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a90797b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105300_518006_EFEBC005 
X-CRM114-Status: GOOD (  11.74  )
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

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0


