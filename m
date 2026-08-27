Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707CFC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=FRhnkwxU4zXJi/Ry/mFI/hbLhE
	bWok8vhZPI/JZnXizm5dgR2UDkq6PdGmCCOBTJn5iscMBMd2JLtOzKwJhOLa6Uskg07MxVxV8fg1k
	YjK0lF8wDAF0XKsJ+3ybaMZIoNulXDv5J5WgKRCXWfmSxD+ZlLamKvvq0OidFGrCcC4OOirE75i15
	H0VGiImk+WL9iJbsNnR1upMqU3kp/qFHk2AvewSwO6KYMmKYKJW0fABOLQ8qcl5yB5WVH+ooTcT5i
	0+EXkXWRtSISkQeu4wwVk/r1rHITtyhrJ+Uiz3HmWoWGqtm/yPOSbf9JYItF+2PEaL3fxRARhGmUh
	jhwl51Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd9H-00000004NTv-3x5m;
	Thu, 27 Aug 2026 16:40:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd98-00000004NNW-2aGX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:40:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFcvfD359711
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=E0YYt6f6HIevJsBd
	GX+u8SCGPuzsdlWqvB+D6oHOcH6IqkT4tR0SrbSPCCZUrzxSyz5FCUnziW4PMhFb
	GDCb/MeAroaXuVKWw2H+tHiPO5lIMnJ4UoInLTLJcLJYf5PdDGheWJ0qYtL/e25a
	0n3AomPNFaJ7Q3Xk3bLt49KAdWA4PhtB5Pic+Wzy+nUp85lLqqFGEALELmgEP4By
	LQ93fZwhV2Aew6E7RORb/QGVzi0v+BzLvO45c+99GiDZeR374uexa7CZetNACcWE
	mdPs95IYFGJBkZaZpVHLiYTRA5xsNVBO8A04kn5MEhi6kP0oqxnzdOkoKhu/Ut6l
	8jSAPQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr68vby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:40:09 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-44899f99756so287241fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848809; x=1788453609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=ew9XnG3zHprVOU4pAG/CvELSzxhQsMUDddu+fZBgr8NsjyaLF/o5YBm6RiCZ/lyVU9
         Xx5TmdP/uFQZUptOzCewapK7G/Gz/kqSMih66eD0dY5DBU6qPPeMZcNH4CMgyGj/b+ZC
         nzn8kjgzYVBTF/uLN30yNq3yc78NaUTtHJFHxXVqE4hndYX/9TZV1RWp+5Kk4BWSthUY
         epZbzQd5HoxAw5cbgidDmQFefl1F7wci/hQKs7vTdOMQcWSOhccV20j4opHhzKJKhOEW
         ftdGyFyIzUvBaCEtSzL2iolQ5urkEDQu1yAWJhrk0lV+SFAF8WDQ8Z1bOVaHp1TwQdGq
         DNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848809; x=1788453609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=KzhacAlFkmBUyD2Q1Vr+bkz+bfBs2+lu355I67/TkA911O755kPYz8HGRmOoQ4DEkI
         ExdJVffumyk+aCOmOSm/Tt5sYQad6jMiSxl0IMFfCp83vaRmos2CV9MX8Edd1UD8ICaN
         l9OYGXKaZAiyXokMxVYCn6VaIKZ5LBIPkxXfewvv3hnIBlWCHZPfDDSHTEwJ7Uj75Y4b
         Qrr4xNyWtLkRze6yhuj2BeJN6ziswVnqAnEI9/H4qZ3T/WOAu4vq5LrXAZBq0xPB4k2a
         HkywJ2aOPYfPxlEazMrIOXbrdWH4EBwoVEB6KWXMfjJW0DKj3e2JmXcunPYP70jw4Pst
         zlFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqh2b81Hg/EqNSDWZ2OtvQLO5ZoUOFR7JQtbu/OKSu20V11dTRsb+mBFMDFZBGAuAsvBhDAERsxLjY1bcIByGKo@lists.infradead.org
X-Gm-Message-State: AFuF++llrOjU1SIhJ7H7QYRceU5EC1vL5PVFbaajedRsaqunqoGC2bxb
	x9nvD6pSwUjbp8j2SZiSU87qFSzXi3nPjwYgNxoxGpZc8f/FLveZjYcZpXvXtAzCb4ZIyE/Y31U
	uF+ynijNh74C8ABNep3h+sCKcfghwu1mTUVpxnXtQFS2pVmghQCTZ7qk0kvvib1lN8TtMtzNoNm
	U2kw==
X-Gm-Gg: AR+sD13VzCfAHWq5e3XCF+gD9tRrmLt/g69f1SHb+Ji/rEfpJgGZ0mTtJNU3Lqo/gN8
	hOI/CNgCpqOEg7bJnPdIX7Sy5zeIdegQFFfRTQRi9XBuUjMExaZi0o8VRhutHjizbRdDzljz223
	7q+SEUHkTf//yDG9yDgf6W3ReO/1C/JQ1YB/9y+AhJaQghYSbeO9GgpwPDMxEymYm7woDMDbzd6
	ean+VOY+tRwWtRbvFB/+iHAuPCBfQnZGpQlj7yS2uTYuA4Muv5Qg0iXqD+8RYsKTxp4m7520jz+
	xWJjP0Rzmmagu3J+X8fiSuoQA+aj87WnjpnahhcJ/6TlceTUIhMEgPVZN3cPVtOeFfmPcK/7bT2
	WmbR9vtabc8umwsMd4My5bELuh7Yo3U+L0CaaMB49NB9g+Fl+JC4w7dzWjzbp90cpisumno0LdM
	pcag6O1rgBSGYFFyBllQICfcg=
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6b1a035992dmr14794098eaf.1.1787848808696;
        Thu, 27 Aug 2026 09:40:08 -0700 (PDT)
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6b1a035992dmr14793990eaf.1.1787848807924;
        Thu, 27 Aug 2026 09:40:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:07 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:13 +0530
Subject: [PATCH v4 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-12-dd34f235fc1a@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=pBrBLzP9TMaCVUrFowgcMyIoJfPSjcRKOakAZG2f0A8c5CHxwMisU/O2fCHoDFLEHgcn+UTEU
 fPRnjvgpBYyCB7YGXQ7XCauoSDwHWyfAeGfsWsob99y6XN4Y7qQhGLh
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXx0giUP1VYGxn
 KIf14dwYUrnI1UuvDy/gRL22JXBvNKT5EPe5aKbFWg5FrWP/5mRMhKely/cnT68kXjy9H7XJ1aa
 X08D2tYOu9+lzmEVpvF1Z3ajCu/b3oScBIGwhzfjGM63Fm0E3rCAVJSGxGzj+gtnvAPjHvRvA8l
 GHnS7glFKLpomiYr1+cMUZVMKvVSxYrNqO4tXow9EquksY6AQ/j/XBW32fV5d2GUQ+zL0LFULn8
 Yum+83ETp07oRptk91oTDFPM6TRmn+mES02UX1hwsnjGs/m9weHZ8Gt4A9FHPqa6yXHbDguVtYk
 0gVzEQF3GFCdzwQTWXWNiyWd3XLEQb9drCkyFL5Yly4/PQqZj2D4zwsm6Pp6cRxsus6vCb3YEHQ
 2/LZHKPvDSgUemh519TdXt43+VKy0h7ssYYZmFMiHAV+IENMdZx9s84Qe4exSwVItEclAZ5tFbd
 ZYMDHzpmq+Bqt1OxWdg==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a906869 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: wjWatsg9pzzuiJVf-95_lq8KPt2nSBwK
X-Proofpoint-ORIG-GUID: wjWatsg9pzzuiJVf-95_lq8KPt2nSBwK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX0f70KFs8zkRW
 pW7Ipzx4bbcPV8LZnQHCeQH/34LtQ2bO+8kxdSaQ2n7PNlOuQ7LyCJGjg6Ct2SwHtyRIQ3uRYBl
 GllYskKWHq6lFFw5NlM7ZioLeRFslIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094011_405616_6457CA74 
X-CRM114-Status: GOOD (  12.12  )
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


