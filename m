Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BB9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=; b=39uVlY+UG8lKpY9lAJe71dazGZ
	Y/0wIgMjx/oVhF1zSZKWIvENx5KL2AlhxOhWJMkIZJHMlSBQa3CsRpQK2DB2yJa5bvz6EREnO9hlk
	jxqNQExgCgRLTtXMT/MUgBF+flGK6FiNsPFE/ZWcEyZesNOZUUgYk14dyCz01Ova0YHd52f74s/yg
	TGrXTP0KgTgfat9W82mIVnMF7zyGNiYmyZYxcnfmfUkZx+34xGqbCnoTjrZRTNky/mNaOV5HOigMP
	6GhiMuEy6Eqs+0wr3p0H8hqhcyezVvp7vS0gG3QpRdkdw3ZcWi+JYBCQe45SQX4+/Jj7yR6U+Jb8A
	tZlYZzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NYL-00000000VQ2-0S0H;
	Fri, 25 Apr 2025 18:13:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N8v-00000000Rbd-3vd9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuin024719
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=; b=OoM6afEuRR4Kz4H1
	5KrmI+gLMaBQ5ITBcMnsNIL/ItyRiR2v9+ft1f4LDy85mxiSM7pHiLvpU/IBx6k7
	2xveUSf1+o8aagk8PvHHSCHX+aY5qUrElYn+9JaNW2q8JA8hQrO3XFoYR+C7PSo1
	CegOi/Gid8aoPMTB8xJlvKvCS1kZj4KolqOOBKLjX3GJKbcs2hQb5/+RS+hNVeAs
	uCND8JdPgeRKClU7Mc9PsjZwX8Jr87wfQ2BTX50Xw5lJgXsBhQj5jByb9YShgkDc
	oeZsV5F72LMFwJYqY1ofXsI/9rLLFar9HVyzvqXOJTiHIjzMlH53+7nawNVTb8jY
	EfqPOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0srd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9305d29abso438528485a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603236; x=1746208036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=;
        b=g9nnoakYwMCLkKY7h1QYlESGpo46Qj65v6OUTsZg2X30u47FUgwN48Kn9xJn69C7Mj
         RroyQkBG+WQGAl+Gc63cKUfzQpL5abcsjkSSxprayiFM7hiakEqk5u4PvnbYWCgpx2jm
         lV75ts8815MtsjKqwvP5m/emStp0CBaAMFD5GMmF987qXNjd85riODSaNNIR37f0183d
         vNEJWTk77s9T871WEXYNqxdN2mCelRtP+Xf8ftMaaEzVxlV9w0GHo3z9gQFaMt4gBzdK
         ThMbP0l3NAdi3rI5EdMEtNKctnpmXfbBBpCF63AOEfgTbHCXz4EgfuWGu5VKT98iPbOP
         Xq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgK9V2Ev1954rEkWjJ4/wQ8SC7S5RFkBmVYOupcFHeJ1Kr/e3kfaOlIwt9ZDqLgKbhSpsX9ZP+QZCwE+AZt1LH@lists.infradead.org
X-Gm-Message-State: AOJu0YysnmDSW6WdxeoKGHQOVGAYGU2LffVJkNGVqAVrd68zYKDV+t39
	GmM0sKWVdbUX0fc1Mu2zV1cVNDH9zFwpDeu8NXhr4a+tKDXI5BJSA9H6IqQF8Y5VkD77g0/3rqH
	lAo+XbZCTZKBO0Mkv/lYDPFWj7DB/Ya+YzqpACOaCay6lptGJxvwDFb5k2dsZrGwIQDE1flZ3Rw
	==
X-Gm-Gg: ASbGncs0sT72zyahK1Cg9SaHMSPBxpruRMNAAHpPcAO8YyR9jVNdab4n/KWQj/8TO13
	luxt2uo1M1y7gdI3en+XYK1ugr4dP/57JCiEp6/pSnj6hpKhFzvgUQxxs7TZ0FpgTUdfb8ezLky
	ioF6krOOy89yHnipG3jVMFESvXjRMRUDpWIRyMY9tCdYu+oaREeFYIbe0wcPDQifcgQuyr0WmHi
	A2q7/VePAMOE12CQ5lQx3Zjc+5HD48EAWzBJc6q7e1EDjkri9PpafaUd2Wm9nVXp3jhCky5BhCC
	Sqcw+Sdy2FdGUowcUiWQWtwEsYKjbkXUDC1n2l4qIAhtVmgMfLJDYYq8ypwl4kbKEEI1foqCZq8
	4MEx1tlK9p9zZs9Pv3Fgif+Wq
X-Received: by 2002:a05:620a:2b48:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7c9607acbb3mr577616985a.58.1745603236232;
        Fri, 25 Apr 2025 10:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXc63YgasBioIfPyv4s4+i+5SA3kwzq74Oh0ca2GCZsKjTjH6+xDOPmc2+pgsugmJAfdYlyg==
X-Received: by 2002:a05:620a:2b48:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7c9607acbb3mr577610985a.58.1745603235745;
        Fri, 25 Apr 2025 10:47:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:04 +0300
Subject: [PATCH v3 04/11] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-4-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WRG9dHTLQ2jwnkCiRxmgtVZUE3m+6omsipYnyHhT2vg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwb3qVnBjhOjN1cX+3w9/23Xn69pkQ8NPkfkSe3mub1L+
 X9cRYZUJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsmM1+1/BgueLbZkWFJT8
 feC4w3nJitqObYpF1zjVRU2a5Gw6N4b0FOU5Z8pk6zYn7DP6bshlpnVCdJ1RwgttdoEW/R6N+wz
 hX9uO7LWaL3s9uugT2xZLNvOsS6YsEnEqypxqz+L/h/1lfc6w22SLlwCrWixDkyxLWFyh3m/Ztc
 FfZ3ewbHJdwbLhoZStQfa6XXfX9V5Uyq2q9NSXZEt6w8ujpDG/c8516aK9Ki9/9/55LVDPfWyZx
 XwGF0HB305LZ7dODN1keeipGnfl6eSCO9kLZwp/6G6x/Zzb3iC655TRNMHWjhL363qh8/+ps+fl
 8bKvWCjQ82cJ/87pNxafdFha/XJNk+jSZ7da/lxwYXAGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JNs9SEYOZBzrLrBtJeZGougxE0NHzjYv
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bcaa5 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-Z_mRg2wFor0aBS9cE8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JNs9SEYOZBzrLrBtJeZGougxE0NHzjYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX76EmGCXxXDuj SXZ5B6ah4MurBYsBdXzDfrxdvuuvjpKiKef9xppw/f3HcjH6z6SJYR2bTczLrHsq1SXaH3gzeHL qxPP6QhDgRe8V7iSPUNo3Jc6Q501CTrZsvP061xFqU+hUQu0xEAkZt1zGdqmPnzh1Li8EwpABpS
 RhYce2JgqREEFD/utjdFrBBi5gWm4cy7QmG7JBDCAS3L5YDB0qBiY/8xy7gi46GXGsd2KaiJoLV yPOFkXvijasqg/aoKfipRqPt6/rPOXxCIZog2i4PeQc+tU1tyDK8Ez9K6zhyGBzpH9STrUcm4hr 5+ghiFgWJs04x4jQwoulZI62GB1c5hwFOQwasuaO0wPidYZCMgrB/rCZhbD1viSJ5aL64zZc2KZ
 PdH6A4L53HfbYCJdaEtC7N2oeJF7Hu1GDxbCzbJxGjFbKTOQzuQfU0VxgyGruV92Mk1rRaOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104718_098977_C888FBBF 
X-CRM114-Status: GOOD (  12.02  )
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

On Qualcomm platforms in addition to regulators the RPM also provides
clocks via the child clock-controller node. Describe it properly in the
schema.

Fixes: 872f91b5ea72 ("clk: qcom: Add support for RPM Clocks")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index b00be9e01206d1c61802dee9f9ec777c4b946b7b..10956240df0856a4241d6032d3aff7d447af9ce6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -46,6 +46,14 @@ properties:
     description:
       Three entries specifying the outgoing ipc bit used for signaling the RPM.
 
+  clock-controller:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,rpmcc
+
 patternProperties:
   "^regulators(-[01])?$":
     type: object

-- 
2.39.5


