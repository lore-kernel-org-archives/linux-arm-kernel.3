Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E1AC5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=; b=OE08RU7PhGwyqZebMF01Yq4TlT
	sWoD/n2MjHkrQojY3h9dG7EVrPr08iq5P/X4tTZrz4EN/RcVkoAfiu8YaBI1Pwi+ItH6xN7fLLl11
	FXgOwth+UbOET9n8ceVPAVod/lxLNW/HnhzJyCwUij7QgLlwNJQayrblJE+x94wM9Z9RISZiu5GiF
	eje3KIW7SJqTMuiLGnC2IbTXI6DiMaF9by192TkyjV/QRzaWzrSQcJSBE7IH6EJo1KKQI8XD0BEQN
	GAgLNltOUkGxkbJqfhcMkNaE/FK23+ui/Klz6uNfBW1YUCCzfs9nzZqKfzjwvmd9DfQn9AqD2QbON
	MtwTF37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRrC-0000000DlWT-3FZJ;
	Fri, 21 Aug 2026 16:12:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRq1-0000000DlHh-2TvA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:11:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmVvw1641180
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=; b=OCoPJGGX7igyFx7L
	ze7Q6ck88ijWO0zgCDWL5grpQ8CYTsRf6T8Fw5NRWY+/9gIWHYJ/oaXY25t5xj++
	/6OXmeH0tfHJDQCU86+tPCxhIoaIfCpgtXP/oxvX6eYCzE3B6CweyXVW9RjOPQVX
	Vo3c5bFb8wVOND6wQqSAA5ytnKLRydFeNx7AeOA7QpUDVQ1e4re3P7/VcK6Hdmm5
	fzi+LKp9AXuO4OL5+Z2GzmlZnB4yheVQWLjbO8BwjEfDgj8YcNMsSg3LA+GrLO3+
	Sy+/TIweQxRzI/WWeTVIB/xKfxaCMArcQ7pijkQ1KGpXp9JICZrN5kKaFQYe9zYQ
	2c8+1Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebuttv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:11:24 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2089132b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328684; x=1787933484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=;
        b=IzM0tCWsIZm9oafq+gJrNYo6C+w1xH+qfT3N2evkD7Lm1UFoTfg75D09ttmglmCihN
         pjZiYHQQ7uJJPH4uyabnxmSVTZUOO18ahMN9llp1BavB3kqupWZ+6H++odYOmH6nPnzz
         OlRlX4VP2jydARulbQPoJ8T5ROOkdyoNf9HEYXToaEZiSEgyKSu2L7MWopxQyJF633kU
         BH5wKmoFw1jWNvmTZSooI0FCTSt+gDJYIa0HiRf8MOpQCLuXTaXrfkIr4KW/n5DoubPs
         FHfHwgfiFjy/IqfpsxKYzPCIctSt95kPgC8n6ibYq1qS1vk/liEjWZOZtESsFGM/7DA5
         7ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328684; x=1787933484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=;
        b=TL6WQ6ICNh07cHmwOlPOyAHGXUITbB7hzwMV8E3LC+UYcH85iwGBsa31x6tawAJXCX
         ijmjdtcG8+f8hJyddKPzl5Qiza6+2T8oZ4annF70VSaWkwhvDXcM9iAPjfdUip14ozum
         X2oaRDWJqilENzLZ355pYA6V6tAluu2eG0mIdmVdz9qmZzU/sOpn+MP/3s1f0xyPChQ5
         ZseVo4Crf3X0l2xy4s3VfcBEJUd7EFcaETko+NYjzDAI35igFVtQPCQs6jj6zUplfzfH
         jGAIRScYPUTTtZXSp40cwCtruW81bpcWx6h6EEckPzPd1BOH2TNjFW8wCw2mvR2iq9mR
         AYVg==
X-Forwarded-Encrypted: i=1; AHgh+RrM41W6usfkAyAHsBZ/FL6gVw/y+X54qQAoPiRxEH2LPAE34dCx9azlfxGuu516xiEL0ioiMp7b6R9Qxyhdd+d0@lists.infradead.org
X-Gm-Message-State: AOJu0Yya/VXfNsCyYUSuG74T+RDI+yy/tzri+Idrq9Q3tD56mFq36bYp
	OB2L6CJOrfF5zkeYSTjreTt1WteRpsU+Q2/PZ8RobGSUv+dtEts3j3pACJh2JMY/Ily/ySjbst3
	30enQR8a4r1cclmG7X9FTe+Oiha4yIad8cX38aCQsgAo2tn+2RFPXuF1l9qty1rIdjpBpjDYU/d
	tY3Q==
X-Gm-Gg: AR+sD13CljlkbFPHM5AEPWcbClhZ1yGbqgxlvtsvXrymtIVSeCvUyg9ogtP/VyLRMoC
	C8qFCcDFuGX7DeIC9ithW0RSOtR85lK7p4fVJDm/HQO4fQ1eMrswtNf3+ZwHLflanjXThezQ7M4
	e9jQgvRO0453eXLQIf5z42/0pB2Zc2KUjJwLZ4b03l7xJETiYZdmLKR8eDIt6slGMZJ0BWj13fJ
	pyM/zfKOMDjW2raz0knWvZLLii9zI6hTjcjJHw1PpLkwgzOAX4DFLT4AFCIKM2jPQDU6gZawNPT
	NBE1eYfqggni9ZTaL+qkGkq58l2V1yp6+AhtPDfgjUgJP7ygPIX5f/dIXdHfNMlDaSzn2er+E7w
	tXdWZLe7BtNtyYa8iY/oSraXzg+ljXC9q545OPJrO786HPUsNuaOTGn5ViaYaeiYTFOAbqwlwil
	Puk0IR2d3rygBIT6h5Xn71EjU=
X-Received: by 2002:a05:6808:13ca:b0:4aa:cad:cb4d with SMTP id 5614622812f47-4b2ef40c7e8mr7487875b6e.19.1787328683882;
        Fri, 21 Aug 2026 09:11:23 -0700 (PDT)
X-Received: by 2002:a05:6808:13ca:b0:4aa:cad:cb4d with SMTP id 5614622812f47-4b2ef40c7e8mr7487786b6e.19.1787328683448;
        Fri, 21 Aug 2026 09:11:23 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:22 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:07 +0530
Subject: [PATCH v3 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-14-196e2b306368@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=2248;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=mcaRPD1yVE1lNbFj9arsqohiAw2BWUacERpzcyqjwvI=;
 b=Hxd1KRhg3fuPoN/wzOapNCFMOpVN0UkreJGyf7jijbcGmh57K1Z7/71AU6X9faB+nSPnaT1+h
 8mT6dYe/TeVBYZ8bww9LHWpu5Jr6CksRvJkR49o+XgXXPxgcb2rDP9x
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: 9hGOL41UXFCXJwAsA6gEMyrRRN_cFUqc
X-Proofpoint-ORIG-GUID: 9hGOL41UXFCXJwAsA6gEMyrRRN_cFUqc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX2PUW9yAO1hl0
 lJO9kGuS3x/Vr/3s781VVL2s4aj9rr3OtDdf2fpFtNlQWF+Lk2chymOecxYlEEsGZXgLsiGgMI7
 xGgoqJCcGQWp6b+kh7Hxng3ErFeQocc=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a8878ac cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX3XrmoooIbYNB
 XJvIvpMpbl7vzb9RBfqEHg6Unw64uraVe/39/uu97iQSvPlaAFctic07Gv0BIbE8KqcU9Ix8JJk
 5bNcTrCJsaAjB0vVLxVFT+ldE4Tb7wUkcqw3e4oeGIJ6RVszQ1d9UIyNHEz3tNydcJ1g7t0skq9
 199GjZFBDSYKE8YAG1KTvv3BT6rODpGi0O2Py2Ys8QXzXSask+cREfU+0g2yCmJWgWDpZxz2CvO
 i71R14WHcjL1/WWort3FZVlQsZmIIUxXvX7r1Axplf479HaAS9SBIu0+i87WxkuwQPs29avgqli
 vepO57/iEdwireV/oqHQiifzCmRZBIy3W/74/TZBD5J/MQEg8REUXoHpw0PUmZzB1XYjTAJluFU
 xgdgvabG9q1H6RJz5H889RfpGb4KGOcnV2Qlbt77GaZyEbwGGhGpZ62XiqnnvNZuDV/S+N0OJem
 qRXQB5X7f8Cxxdevc3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091139_539638_78CB52F5 
X-CRM114-Status: GOOD (  14.34  )
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

Document the Qualcomm Kuno IDP board and register the "kuno"
codename in the SoC naming convention schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index e7160b63d814..179aadc86a9f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..ca02a2f0396f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kuno-idp
+          - const: qcom,kuno
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.43.0


