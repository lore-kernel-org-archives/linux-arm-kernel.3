Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E773C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 01:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ook4P6T79/FD076Ce0QeS4hAiIChZcoMgfecYXpOa98=; b=gJE2h0XhdQMp5Jj2jeXmiM1AiO
	CuKU43G3M8QM/NQbJqT1yLyDsfeJfMDxY/yd+Zz8FdTnBIgsLMvw/Z/SURp0SJdHOg80C/qlunsYw
	+Z0w74cengUB//Bo6IxGmWAjCPRscnSCtOgREkHvYu4IInydsta45cfOHNdPGZvwYpApXLRVMxIDm
	V0El/qa9udkWVWnw9i5FNochGri7y6fEDcHOKM/AuiPJHnPQe420Ed3yWM6mAf9JJnj8Ym/Fd4/so
	0zi4gNo3bqUO94u/XZiI7lajP3UoZge5telgI2VhXUT937XPDiZImVcteB/cEElBcRO/eNX6ICwUu
	jbfIuHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BT8-00000006pDq-1kyf;
	Wed, 23 Sep 2026 01:08:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BT6-00000006pDI-0COh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 01:08:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXNi6268290
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ook4P6T79/FD076Ce0QeS4hAiIChZcoMgfecYXpOa98=; b=hc9d/DoLG1MsfkN3
	GWWMStTwEDuY+gW498vI7zqMzUMet3h7bSdZPd/LzPr/rToEiXwdXip19PSXDZLi
	9kaeTf4H3oH8SodrHrKjC1uMOtt4NiXOOvkg6twaXzIQ7HE0MVt20n5N5G1ofcQ6
	3MV0ywdRcvkve76u/dm7fiIRONgi9WKvtr8EpSPJmaQ8ZLJX+hKCEENKwGd4hSs0
	BuTK5v8Vh8/MPrlyOURG1Mvkugo8we6xN8nIFp7RMnnOpdLmn/90vurnEZTBIvcs
	od0LrvkgTJ+6efeE8VYBpRW/eNpjacoPEVilU+rstK92mHaVfqk4HwnoE+UbfYC3
	ae9uxg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1gx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:08:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso459866eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 18:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125694; x=1790730494; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ook4P6T79/FD076Ce0QeS4hAiIChZcoMgfecYXpOa98=;
        b=L0IGiLWOcTIShyZbBvlde6ppj/KzXLI7wC6W8Zq4oBlVjawgHOf1Vj6kqxAll1b114
         crDiOyAYGvXXK7OfpLe7MbAVqlRmGKKXVRQdtFBUpW1Om2yRNeYhQpRLUwdtrFwaSYXV
         qkJkGWTzzfD+AXENuKVw+Kc6bUsi2vlmWJ8OmRMvPIbOQnuJ9+Zhg7CK0F5BsJVUrZfl
         mJK+XutQKjPy+Agah3ADlihpzatPQ6d4wdzDQY5NWJjyHND5zvcyPGhBHaYrKVT6qPC0
         4Dtr+csVsKmUCATtQKJ1Hj8Hx4Aw12TfOBbc/HgUqKli2mpd2CzOU4BDKdQlvsXZO1XQ
         mE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125694; x=1790730494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ook4P6T79/FD076Ce0QeS4hAiIChZcoMgfecYXpOa98=;
        b=HY16Vzgvm0AGsDNuVNilY4qCzs1m5eaKn16iHfrlXN84PV9N9LZLiXypfC95C0gUAr
         12YYyqGb98P/ZDtCd/RCc01grfUFARBbL5+ARvcy2yTjSCGMGdZ0XUEowv11ePcP0Ydo
         85CNLRe49gYHBQz4p8xs7l1IP1SGqI0UOoTVQmlaAxDjiIqnmtRhoDg9x5LtDdjYKVn1
         RTT0TNKsNBPvqd0JqLMjp6lXnR1vv0PUSPgHPa7bU2uI6uKQuWnBTMBTdgovLoKp7JEn
         oo8KhZFttH5zuyME1GNkNh0BJXIkCTQYXK828tVzx6Rvs/JLTvYo35xv1R6ZboL04PNb
         XZRQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2zs7G2wMvPDT8FzKaP1Tj3ifcuav73oZweUGzNLUz0fTwJM4FV0KkALBCIRcF5ScIO6ZgAW4y70N5xnZ5A+7K@lists.infradead.org
X-Gm-Message-State: AFuF++lzfcO3OVKO2F8esWFWQCUKwuBRo8kwAtmo8tW4eLsEtLuY+/Tm
	Lq/KNPeT6BaXHGjqzrMCcRnfATQt6rS1aLB/zNxGHa/oGsBDf0ThzPrVaN6IQPrAYZLZ7nEdb/R
	8oW69Y08BJj+zVZB7XB7fOxp4FI0xvUr/QcIxGK3bGjeQfwddLm0NcreOYv6SE+qhjBTT5K93Bi
	T7Ow==
X-Gm-Gg: AYBFou0OsHmv8v62swSdBYUYGnRBPNcpRKwGURusKn76ilgiKEED6Y5wqvRjnq0BIXs
	+jUfwNBXPbBjq7mF9Zi8Cx03RG+LdYt74p/QIYsKQGV9sXfXzsn6spcsa5MuNo/rePLIXm88iUS
	Ax2CCfxEqZ6dXN18mgH4tBGgFkDUcpf6J1u2IFAt68Bo1R5LFpW8/dB5MXHT6vd4ixhtXJdUi8O
	xUhtjHBlK9MQYUpT3XGm95WHqSero0bUf4ZUBX2ljDODMGmyXP9Gk35jA65ON53iMH+C7ou7dRM
	zfJnYTsHVJpb49Sh7ezGt0eW8PoYXZhixcnz8rK2epgMyLTBpco0T8MWT01wZBYq6zJd+Df9fAk
	zgWbARvgLiipnzQWtutWeLgUq45ZM
X-Received: by 2002:a05:701b:2304:b0:143:8865:cca with SMTP id a92af1059eb24-144f91cb678mr1118015c88.22.1790125693711;
        Tue, 22 Sep 2026 18:08:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2304:b0:143:8865:cca with SMTP id a92af1059eb24-144f91cb678mr1117976c88.22.1790125692975;
        Tue, 22 Sep 2026 18:08:12 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:12 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:27 +0530
Subject: [PATCH RFC net-next 1/9] dt-bindings: net: pcs: add Qualcomm Nord
 XPCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-1-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=1756;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=xYKbYzTHR3j1UAc529MOi/VhEpbbOJmWKov6fds1hc0=;
 b=6JYNjwufW4kaDQq7jtknRxPE+vj7KK4oC9wom/fBsBw8BgrKo75Hr/ywl2yssCf6MwgqEatlV
 Ze6a+OOR+bhAySifywb3JmRixoG1HWMliVnIE7JY0mmy3SpvRSVouzo
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: RQ0QH9dT2RnH9G51nlCOIRnBBw9I8iZd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfXzJMhfJf1FtET
 yyL8CYlmqse1cjIrkGITg3g7ZgfTBveX+3FJN00SahK3GDXg15UyYQntDedN4zws1XCDXQ8uUhV
 FkdyeaUH5zUnukOVIsnJ4/Yi6eZ+lSo=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3267f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=G6hRZLYLTnwYp-PKA6gA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: RQ0QH9dT2RnH9G51nlCOIRnBBw9I8iZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX9fu5k0zEz+k6
 E0MPAQDHB8losma8Kkuh1V8RECc0Ma6m5Z34RXI5VB8Sg5im1pbrZ9z6+btYINHy4CwTDv11m0k
 jU4gdFHTycy+3dD80h3tXuVaAtY4xinRxR4bHSWqqAcxIMUzjGbvAfF+f4dlNo0PTGm37H+aGQu
 ZaxYcTg3c+B0rsuax4CzL8huqFLnxor945fzH9kDwLs68X5cxafefF1Eu+A4GNvljwMiyAT+hm6
 WpRMLDXdagmAIjFdFHf0cjbjXCtLWnjzXUSDxs/VjRt/cDm0VcCyvFrIe5C3lTqfdisYI7Tul0n
 V3CooJvkm+VXgfkY42GzJaG4f1wKFM3W7fvGtJYZ7lKl6KjDbFgL8mDrf+MNvY6c/5/ExrWVLsf
 8WdIS8/I+Y5yEt7CZewNDG0pR2jteAZSeeW9vEMrGmr6qWpGIZtJKwAQpS3r19l0F+cnARVJIWA
 KotNAknNgCz3Z2z/1yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_180816_218802_0551551A 
X-CRM114-Status: GOOD (  13.80  )
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

Document the Qualcomm Nord integrated DesignWare XPCS compatible. The
XPCS resides in an Ethernet power domain and requires its CSR clock for
register access, so require the clock and power-domain resources for
this compatible.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/pcs/snps,dw-xpcs.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
index e77eec9ac9ee08d2e11a28975f61f8c36b4e0a95..68bb941cbb290d29bbd94d7280b89d2ad0f38e7a 100644
--- a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
@@ -22,6 +22,17 @@ description:
   by means of the APB3/MCI interfaces. In the later case the XPCS can be mapped
   right to the system IO memory space.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,nord-dw-xpcs
+    then:
+      required:
+        - clocks
+        - clock-names
+        - power-domains
+
 properties:
   compatible:
     oneOf:
@@ -41,6 +52,8 @@ properties:
         const: snps,dw-xpcs-gen5-10g
       - description: Synopsys DesignWare XPCS with Consumer Gen5 12G PMA
         const: snps,dw-xpcs-gen5-12g
+      - description: Qualcomm Nord integrated DesignWare XPCS
+        const: qcom,nord-dw-xpcs
 
   reg:
     items:
@@ -98,6 +111,10 @@ properties:
           - enum: [core, pad]
           - const: pad
 
+  power-domains:
+    description: Power domain containing the integrated PCS registers
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.34.1


