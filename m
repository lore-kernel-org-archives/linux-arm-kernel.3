Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FD9C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=FJLJ+s113T7k9/LMcB169vJHOb
	cik8oOEipuoXo85LkO+XkAKj752OOGFR+bY5+l4YGJLBMI9CxzdZwt4q6iWAeFPcP0f/I0vwK7eBG
	j5+dbmOVFX0YgZgi89vbnus6KLul1e0BPopvYRTMR9jdyioViZ3vyuP5PlfdiPDsACDbjoHSzmOhU
	CO4Po5PfrpN9Z3R+JfFSlxtZATupLkEPRCMc4Wq1WB466Wz3uXt2lJSYwRzIo3MTBpyfiybLBr/Bi
	iJ/l62ODxFwc/G8phtLq3w7Z+e7SoiQbOxYIN98Zk5pgrDcAkQ2wtE+MFUs3Hq8akklc8JtgAirei
	MwDPt4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQI-00000002B2o-0UsJ;
	Fri, 14 Aug 2026 07:33:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQC-00000002AxY-1yv5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:33:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QYcp282902
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=f47cNOju6Yg9bKgr
	pVlDJ9ZD1JPPwYQ3kYTqh0QE4byrKyuysRvlI0cjuCdzouB1EIo/rY7ONJaRiM3D
	4e0Wfs35yErbB8+a0S6GCI2+0GqTZkiMDgQlWuoJDvop9jsAe7abC7somdrXeOSy
	m7w29WbZpnvknbkOeiNeJyscniNVcUN+ZRBdwH6oFVFs0a/5sZIB5L2TsOYGRmVC
	EQwU1HgTvwJqWAGZAXg9ySNKRlz9FEBpBc6GCxwf3TTEM2cUCozy+hj/taydQVl8
	utrwPClqiXnV80cVBd6hlfMBJ2+FOMTamDkS3kjarFQ1bkPhxyfzaVzLmQSUKKWn
	yWQ2Wg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90u5py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so11664765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692822; x=1787297622; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=gbKVVUYL0n6CoioSlm2mfYWvvJPeVgm39N2S2QXHt6ol4YkJYED8acA3xPvR80hAsQ
         UzFf++Ma5/mwREgaO6DUdMQsbfh/bnkfKQ9YpP3ygOWSGRCxNiyCf8GdGL/zeA3L3EhX
         asKa9pRIL951gqMwJlVjNQAqvmaEvn7cUfm1tI4HbwK1l3vbTAluCm5c1Re+QdaOZuZw
         3atbqoPCcunDTxueLIihJPGUPLqC0VxJPbdnbw34+ggmJuwyoSbooMURXIBoqQu6NYM8
         Pa1Dq6DAif0PGoejrIiQgiLZiFHRVzbkocsvq+fRXBS/az2p1od9mQkHWvcpXzxwBej9
         d1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692822; x=1787297622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=kEVosE5jZ+/+M0G8kYBoe7mP6S8vGmi+C2LmrvMjv77aAbwaLxW5Wzhl4GSt2SJSGk
         oc5KY7OLkmPmhSbQehhQnWBjg0nWJ7XRMQGzKb0o8oyyKRBf72r/2O6Tg1v7X2nQjcT7
         jrhyJr3C1QwtmtFALT+1Pewq8ChNSuBRB7AKC1sqDQBlg6aQNIixgziAd9e3iVY31YB2
         lDHy3OgD16rL0c935ccpEPu7mPkwhVOdTr0BOG8RFYK1/I5HJen57dIzDHGinH6qRGxO
         4JBiwkr//p99HUvY6oh6Lg6IE0Ja30CgD/juLqlQZh+giLwPjrBJnF0L2AgekfLrBT+J
         3n5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpH7fRjCnWCb8kUjauY774a8i8dSDXo3vCruN5EQBkc4xq+5UqrGc5bDT4pQU1jcSnSLyiApHtTJ1E+SlFw2lIR@lists.infradead.org
X-Gm-Message-State: AOJu0YySTjJnJVqk25AiWfvKdCDcDHHgm4ZAwFzRkeT+OpyFapgyE8og
	eoURQzJcD/fQM6zf8jmP1WHPUPeaKz7QmFHLNfkkPKP6vMI8y16tmH/7l9AQ/L7Jg+7ZMa9av3A
	BJ4dXboA7KIkrtolYUgFYyFMKsYoa3VZJJXtwkc3rGgocwRlwtGBi/s5H18ZUgO1HUaASju4AlI
	JUDg==
X-Gm-Gg: AR+sD10wAoE30HQ6uzybazHAkmlV+GSEho7PtX1WxBFo8X41bj7hZ1LTh78rr4zCneo
	Wk2DYbOrlOrJf9+l9szTPoYcN3sic7OWSgKbaFDcUT6Mx2lJ/7qRD5uBJbvx8cCsSD4hwfbYTAm
	UEbMzxNTbDJAMbYxkGcjGAYRUxKaSI4D/xnb1NJU2ETvrhfj8pXjBm7BTRWYIPZv6MYJjMcM3cB
	C34f+U1dUHcgQegFBc071KYZCSEL87j9HFUbTFYPrBu7+miWu7Y603ajNghwdJOCN4SfI7atGHY
	OTuwFRcpNSm7895mjFbi4o/A14kEgaChZ1HqGaMLz2vLzp+iFBHKNb4HnxsFyky2yveBmHfTGm2
	H+LkgZZjD3KciHfY6SOpSqq74lTYJ68CH8+k6pwP6hDUOSvCXZRTuwH9LGB+5prwTMFIvVMuLp2
	NnErxcydHZnBiUbqhXQClnhbY=
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr4631998637.28.1786692822527;
        Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr4631945637.28.1786692822096;
        Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:41 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:43 +0530
Subject: [PATCH v2 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-12-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=5rfTSqeF3ZffhEbWQ/MCkAbuDD82v1o8NO8GUugDaLDLaKTC3LlK5BcLVBkEaw7CxqOZjkCyn
 LB5WOXsXFY3DZZxny1BmotvMhg1imljcHSJu02Gp/nx3UKotZJU73zb
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7ec4d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX1K4oPMFyir7C
 fGK7sdlue4fYf/o19sEA3beGYhJC6FZH13D6UwVPfTQ8WFpw3NYZjfDB51KrdD3uv0CIlJgc+Rk
 i7m5GtA3wZYg3Zoxw7g+/j6N/crbVmU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX3bo3Kz78Ck0R
 NDz6sN7a5Gh/tzvAgRljqNeyAfRHDQXQuXrBUiIHNmyyRoxshBdpenCILqAyUBVty0I+wCH+hiX
 7oVTfvLkMfENapAAGwaQQKcEi5+ccjhqotO5BkBbMsF8q7rGzTpahAiyq5Fly0dnll5LvfnePME
 ZI7rtkqQ2gWRQ7T0Cl9OX/BmKmauJ+VfYHZ/OTUwygdZ3CMIgtrBrzWUH2NsptAaUr1ByhYdvOz
 KvF6VYCdp68Mal2xM13Cd2c7cKN3fXVXhkQYktnziH7Zs184LuoHnm8p1cJOAcRnTNrxY3onBpv
 OnWLuGXkznkM44j8odcDDrxOFEJIOysJS/3pZV3TEeXKNgpOlLzyYkLgc+xwODr8H/wSQNUEU4J
 n3uW/ZGYQBEzv8nozlUPFAkMKcgpUIOHyPUO0mdFA/cxE2sJUd7NWgwj2cwI3RSecs/qd3NS/zh
 ca35ZhVAYLCuRynqqGg==
X-Proofpoint-ORIG-GUID: LZ7SRRtQanku0_BsFZWIdqdNSzx_jBnE
X-Proofpoint-GUID: LZ7SRRtQanku0_BsFZWIdqdNSzx_jBnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003344_636961_7E04450B 
X-CRM114-Status: GOOD (  12.18  )
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


