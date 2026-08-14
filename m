Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC51C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=js0/mphjzHV3BycFD0CtoHHn4f
	YxXlUhJXXQ3aABueiq2EHV9YLTZyJbuL9WBDOdp0ustiTnSTAcmSDHUKvqIU+yaKOQwsLXjLi4pgz
	Bi1ghjMw1pLAv+XU1985DObuQHU/3POBbJp1TV+IB9W9c9k5WHhH8QdGihB1Zo79fJCtAk8xU3HFt
	+RdJjTzaNY7u6JLQp8aXPXXQob+D2v8r3YaN1IXsxb9q5w0RP7pp6k3wOllw33dabrlFdMO2pXjaU
	qBiNZhXc3VHb2eZfbVvzTdPpBTsUopznTL5L6eO9QxUW+pzDKJRWNBDkVO7mrsd4dAa96JwTnKhqe
	2MzijTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQO-00000002B7k-1G46;
	Fri, 14 Aug 2026 07:33:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQK-00000002B55-3gAh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:33:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QpGX594176
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=AT6t0dk0VwlEmCfy
	auBXcp+9FRKb+DNMMZILEbh4tMM9yL91QHjbuoAYRaosD01u0lRA0PYSAJURbBr6
	09FD41Efcoh7+V7vM8DP7j8hWB0FQmmTUEydPIlk8c+YUvwoyUTaRtOSaf/3XbQT
	iVKRieSf7xWVikTnyVyDgBLhNG/ttLjc6S585jsn09P4cxchS9XlDgaMCidxn6XJ
	ZmLW83Co3mfGIzr87vKJ6Zwl7btTXca+MVWUOGvnbbGswM89D9Mqiy959rzIRlEA
	/s7a6T9MgGfI4q7q/1NOMlSDuKrfq8WpdKbYKQ1k6yU3bmMiFD0rkzzWqbt/ZvZQ
	JkDdWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4u8k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so9992585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692831; x=1787297631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=b8+HacvYVH56xvMtLM03c+aRzKG0UrjeB0teNZRCsR1CmaW6YM+3ax/P5b54iWcArn
         SAc4SrICMJr3qh2MlBxBZ9JnhU0OD0nm4Bz2h91qo6V0/zlb3My73WVwRceGNWe1/Jsw
         QUKqqR2r/JP34C4iI7SBj6/rd8D8yNOAq3WZePIyGT2grvA0Yef8vamE3e0aLDEP8/kx
         sloslF0Z5jIzjgZZlYJHybjh4Z/iwHlpT0/4RByVMdDW+bJq9M5/DcOs2KyOmfcgUE+b
         4F2K4sr9YAza/rcqQwwLTAuWezBHmUKVsBhGIAKuTsD0JvjpqJCilliUn3lisrb3+AtR
         pjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692831; x=1787297631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=GssyxHNPvUtXUcJa9QYUCxwA0jY9M1c6q1Hc/pRuKgwacGPKJ0ql7CEpazHNAs6vyL
         0XDoL6OBFLpknrZ+0q6O3fMy4+X8pnemCKN7qD1QAY5VK31vFzphop3WJPisS9w6G9Q2
         jZODl9o9E7SKpnh9dva8Db0XsDLvgaMuTTHpp+LOfrXMfk199fRJcy+Xoqlrs7MDplst
         egKcncC7swQ0MTo6sWiI1pRGSj4Gjlji3UGfltpeIIML3cfvIm26DzvmmOy8lGR1Qt0J
         RHidVDaYXZbR9h4feHkIDkAW0Nj4xJwyzPmVpJQcnTGLCeNI+c7kPmImFf2AIBOa2mfh
         Yf2g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1viQMvieMU6x/MNquQ3YIniYCYMc4pwmQDfRF+I2wXYPS4awuUGwcu+e8okwjj1w3+30h8eggGn7uRGk4YUQ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyaai0LESqaScXQW/A+B70ypRCjzxerRc2ZDV+1HNQ9Njn2epiX
	sWMK8qNAxz+ljgkIgrC/Inf7HV5RTxUsCTzfRRcs1+feiExbFVokm0kjOJAk9kYMYeIjLJ5aux9
	NCMbhCba7dPIK/i4jcumEKsP2R1nNPqanTPfFSusfhHbl3Ycpuer18SS0g7JD2j/J/FKZD53C39
	+ILQ==
X-Gm-Gg: AR+sD10EyymN7klyYTJplr0vhLFzJroHaX4Zy5ss+nmsQn/KDD9xoTCnFAEksjetsQF
	mNoFBTbV8MVWF7mFJi+Uh27YFTDj9LCoRUT6WPizgSS7DOhNnLlrTFHYm66BYr+KRWRCK85lMS+
	CIeigviWfcNo6+Vx6Fyl0+XVd8G7yAjZ3E3ZEDKvdR2ft0DBPHjmds0vUxrGNMKlwFmA81aLMq7
	5EaBjaNj7J22UtdmYTjQVo+1idQUBJ+a6KG1m5vaIxR1OJVuK3Gm50M26C1sNzeDwitau24EjQq
	W3xcG6vVSiU7sFd3V4BWW69p77UM3qFkRLGIkKlXn3Vz6zVkeLDvAZqFe5hClv6BSoPnn0tlBGO
	BAUIkqeTeASZP5JtcTHRil3EDUjSiPMLmmZfIQYGdw5RjmBspSlLasUSKYnuNJc/Jgr6jS/6YEX
	vCougKaS5vr/8H9VBTQbeOwTA=
X-Received: by 2002:a17:902:ec83:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d37f7c3e97mr128280315ad.15.1786692830913;
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
X-Received: by 2002:a17:902:ec83:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d37f7c3e97mr128279735ad.15.1786692830500;
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:44 +0530
Subject: [PATCH v2 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-13-3079794f0f73@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=LjytsBkPoYsdC9vRseuwegbAfCjR98WF6lyMXA6E4gV+//wSFMjNp4wjfU3xOcIuFr6RfUusP
 hR+zxeIFBwZCJ+4W+anZV058xUGhsJzxj02HcyfbAGnEYjizcYHTv/p
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: SlWWiUbZBXaFn85ohFsTjh75cRf7dJPH
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7ec4df cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX8GpitowpRltP
 m5WLj44/gORqWgBoLVQsU6a652jeeK/cBSKCja3ZEvz86iwaMB3VuHu+vPDBePT59IfpEIWoheD
 kzkSl5eWUXQIDni+Hw/MgsAgAaf/eCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX/1t7rj1bmX1/
 AFUX//xdoYpBNWvPEMOHGeA7Qj4FJOBk9Q3f2JJldIkgH7xCMcPYOdKmrXLrj2QcDdjvTs/5vz5
 D7QaPqkFtsA66RQ/K4F7TAFvxMNeTouoV5V9wS4gJXf3fgnvDD2jdmOMw23WX8pU1eG5tqSXDhm
 pPS+W8kv2/QUOhCYV/1Q2Tz4aBfsyoxk9twUcW2W+z4gqBnbFXCNWOqUsvncCI7AJlDze1F15LT
 QiWfeYy06/b88hL2XjSXIF/7n6/9v/pDTFo/KR5izUgvB936yw7poS08SUOg01jXzJ50sFu+Cxy
 QbWE0V/Rql8F3e2oOMASAwlTjYJwEEiv1cPaLZ1g+gzopjJaxZHudDx008e9sUAdw+aysObEKSj
 yAJMlIgtHz9vRsxcvTuKCEsAPCKhbym7XeH1xlk+V8InQtd2h6SKQNM8tRCFHgPN/3gkycy5yL1
 uT0dJHEZI3hfxjv1MYg==
X-Proofpoint-GUID: SlWWiUbZBXaFn85ohFsTjh75cRf7dJPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003353_039295_48ECE09C 
X-CRM114-Status: GOOD (  12.85  )
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


