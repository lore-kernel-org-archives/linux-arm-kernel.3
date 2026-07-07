Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C51C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=; b=ehe1N0aqyhj0jYu9+wys2d3KWs
	yZn2NGQjbJuzyDMYjTOhBgZ7xBqJxX6TPSCMXWTbQlM/rf6l9yZa0ZSLiyFq19Ojs+zowgRAYWVeA
	yHX3zTYU258LYeap1MDI03xzV2lBgLvNDPp11hzri5PMJt49kRjhALaip2LZW3Jv9zwNQu0yFr4Wn
	tOS+1ntnYykMPAtIbRhAfWsE1ZrN8lJhkF+FQ+ZPols/0fXlg0Rx7QlB73G/TFBC5+C4i8UQlY8KG
	bYEDY5hez6ruotRo8BiOb9jtRHKCfMbPWY9AxoOR11KqEF1ou8pxyv7YLOkpevILYs1IE0br1tCYw
	TkZL6X8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oI-0000000Ea5p-2xZe;
	Tue, 07 Jul 2026 09:09:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oG-0000000Ea5C-11to
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:09:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DcE93076608
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 09:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=; b=EJXnNfZe7oNzsWqw
	w/80DsVkc+biROTiGFwVObI+Fhw7ibQo2u64eSz5IYMLYhVYy0kRtGARQfd8amLV
	7piH/woUbrH7F2OOuKbFP6nxq4kvzlw41e6+OBsGXqUnxfESO5wVflpWDfI/JLir
	xlsZZuP46nh1h3I2LYmYfilWKETR7PiZJLWlT+fKqMMFu9Js1xfGF6T4NknRh/sf
	otjsMomessu+GqLucLjsLNJ/jfZ05aR70R/7yinm/3fPGJvLO2VXZ/qy731iwKdU
	ctInXv8BtMLs0Kx6SSSM5X9sxvUusrPWraW1MKlRCLRcxTdQHfL4+cMNhQBoQ5RI
	xGwX3A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun0f3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:09:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847b8d76e3dso6674769b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415383; x=1784020183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=;
        b=NCHICMZ36CbB1T/l36CeiOfLpR+uwFUT8zli59m6EWrJEy9AuXEbvbsF2Tz2kxXHIo
         Aws8nW3hPsqljKehIQ//pZIxXKCMuyHFisJ09kOD+/NHgbgXJNb1rJqjpH1MxayciP+U
         hTuPtAYtvgPDUXa5VS4ezOlSPQZy+q5BUBytPzMVVWXnhdMNNA5Wr9KZtd9uq/yLt9yO
         VWp6yGJ1vl8ddRcPRh5sWP7z3W+kxDJbyAbHWsOMYtAa2TN6HzXUeBevnYsunZR47cYi
         8UBgYON5iwPsEwjH0kpqQXU3KW2Erkrb/iL3gdHYINngrRmuGVwXVuGUk7QFnZ+GP9UF
         kFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415383; x=1784020183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=;
        b=p8alktO2veVbSssrQvR9OwXttoGuYpNYTx80Lb8oIpBN6aU2ybAd1gYLDAJunYFEfL
         LgrDk5tMKLRYncDZd9a0lW+Q/dSo74SspnFySd2Mk9Tr1wfPuWOZd8ho7IvX4LULD2Cy
         yVNuWu1E4An4tFMYWCcsOusxoX03rJufbEW7rqg+1mywGIv3DkzYiTMpZ/gRh/7NCWbv
         S7fqUv/cvrRsA3khzK0hhySEFlzdtQ+kJIG763BEELwJd48g0KUp8wiWO9/7lOgVXhCP
         dkwvYSSwEMzkGEq/bDN5T6TdxAZiREAfqWaiFjNCOU+FTtiW0KUw89kzwZMYXIOhU5pD
         O6Fg==
X-Forwarded-Encrypted: i=1; AHgh+RpZck4d7OU4vOIaIklGi7dLpFsrw6FBZp+ehpZpD2xQioHHGdW7g65CIL6+7QQsj77sBI3kOdZLjno82LHjk6+k@lists.infradead.org
X-Gm-Message-State: AOJu0YzYT9gqiQxdCfS+QTWSWhGIMz9K4MS2xdrDDQLoYRo9IRAaBf+t
	EfCWPdInhpQlOPS/ZZv43c9I7AZThZJhEQ4ETi1TUWcA+ivyNu6s1uptDsT/voBL2XNF1Eq65T5
	UTf1SB+6cR8WbZPhKCqvslUslXbkqfMHhUbuI0+j71Bx5T4thEC8up7y9fAVw50Ft6Z8zsR1Wg5
	jgZw==
X-Gm-Gg: AfdE7clCiC2ggu7u6FjW/QQFCDxsvqWwOA0HhFFsIYw6v7IDrrJhO/x60bZOYvf6F2z
	JCHXKnwwU5Y4uTVC1Y2OoYaKSG7e40cel9zrY8gvjEun/RqZetkdI/tfCPP3+4VLmXWqnS9HZA2
	+oPB19fwrnheDIlRb8V3ZsxAalVhzCCldzuGJ7I83RkER+xg0xoHYgYhOuddXXepr8RriQGwqeR
	wap9fV9UR4Z0PjQ6NqUWF4vZRDFHZk+r5Fzwrd6axIwf40acQTfusFVriNzN6b4n6lbiUQGv40F
	5V8OjH7vxJBTQSjv6+eEyfXuK7LD1NudQdvltNdDXBR5rbCygaiomMMiVRyWdqdqlpLpNxi48U4
	w1wW/kECiqE0D0z1ngMKxTjcHo2BIS2XFPxUh61w679/k7/WRg1a0imJCUee759ab+APszSR0yA
	==
X-Received: by 2002:a05:6a00:398f:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84826f0d90cmr3933165b3a.48.1783415382140;
        Tue, 07 Jul 2026 02:09:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:398f:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84826f0d90cmr3933112b3a.48.1783415381543;
        Tue, 07 Jul 2026 02:09:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:41 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:49 +0800
Subject: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415365; l=2032;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=YJ2uuXHSIbJZT0Fdwh5wizqsLop2xEM6VasKhhh4eMo=;
 b=DWkEQ5zuB1N8gnk/SVlIwaWzOxZO5tN6x4SbsmlNNyndgb831OiRn4rmGyDmHgdHeX1CLWViI
 bortK6pu/vUDWY5vwK4pkrR/zWayyKNqNdKX19/++DABsLon/MS6B1E
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX+h/Tzhk5vBFK
 pnD0qCfB57vjJHsLCZ0XgYS0Ln0QbDz6HkbBmPg9JIA0LRLydg38sR8nu1AXE2oIK6Fllkyvx5p
 n6UO9jLCvRpa3pldrtmGZ/J3XOOyf/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX3KQBDTvMCmxC
 0w1nQzBZCUuMq1HFnQ76HW+KVzNnoUBjEIuXjW40LF3CvVSnMfHxZ0lrgfUu01ksJ9g867sg0zy
 AxrtU0rmtTP1YAoqwuEK9TE4merSBuCity86RDLdOK6d3SoKMfRHQ2QQu+rovZ98hbxKWzxt+Kd
 dvmm01oeME/9T+vpDAaRMDuAyriGPFW8i+K9WDQ5xykxyNq1GccqPJBrfbX5U9q1b3u5PAfChv/
 ST0H5xd0q8LY4S+Wi//q0NekdjOhvEcuw/b2UbFg/wXWFe5eju0whnapzWBcwiYi25WessjGQtp
 xqSy/HHLfy3TSeWPtFAiRoZ2ury+dI7+26OqTz6nfKHrJ4r8SUO5OlIqCL/oCARhH6aJU6yyQdb
 G2Tyd+QEaS9CmfpfQ2+JEda8SiUkqqOtGEIOuuE77pHWsimojLNqRv00xtWsZLFwXoN7Ax9irO0
 fk43ceJGVnQFUf10hWg==
X-Proofpoint-GUID: FmAohIT2kHPjYgTSyP93FLdINiisxvMr
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cc257 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PCdWZNGgF4fqn8E18fcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: FmAohIT2kHPjYgTSyP93FLdINiisxvMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020944_299698_E019DFDA 
X-CRM114-Status: GOOD (  15.72  )
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

The TNOC compatible previously required the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
AMBA bus.

Change the compatible to a single "qcom,coresight-tnoc" string with no
"arm,primecell" entry, so the device is created on the platform bus and
bound by the platform driver through its compatible string.

Drop the custom select block as well. It was only needed to avoid
matching the "arm,primecell" string on unrelated nodes; with the single
"qcom,coresight-tnoc" compatible the schema's auto-generated select
already matches the right nodes.

Update the example node to use the standalone compatible form.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..72fb1210e22e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000  {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1


