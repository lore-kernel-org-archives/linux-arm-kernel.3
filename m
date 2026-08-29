Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E93C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qoO8N/t+dbhkTmzXPT0NEb1XZflknAdTKZXb5wgS1ks=; b=JfyomXteLrv76fiWOZuEzkm2PH
	gl9o3KEI0Th+dIkR128avJ/HD/JgA944T53pWsH6vn3kIg1JW+KAXqPRaXPhxN65r2Z5mgs2umjU8
	zffTg+24t2om2AlO4Uw7iJuLOnAdVPfk9rTqMpkfGCOecJqISdYKuQ89gSCRmoGDXqoX46ZBSa44G
	/NGtsdcBcjQW0BWG80rQxCTAPJIS3oPptmGrP/YoM+kgj83ukmSTOndR7AF7dbCEFCePlh6W/i5/g
	IVxxHlBLdPNAIG21djn/Rx2erYONKZ1DRTaOYK6YBcUvOi9Z/hfNMyrLcplg/jWlZZT13/GYpGK7B
	rh3pGkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OwP-00000007H2D-0QV1;
	Sat, 29 Aug 2026 19:42:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OwM-00000007H0i-0LDq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:42:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx9vV2421145
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qoO8N/t+dbhkTmzXPT0NEb1XZflknAdTKZX
	b5wgS1ks=; b=AuHa/bhQlze39BVcvDwSIBIpCiPFSjZ+OVX/eTm9QBU08whQN/e
	AWhpUd+Z4MpBIWbiRCewfLR1FuagvceoB40v3Cek4KPWvQDoPLXMK0kSt/OmzbOP
	jZim8VCEMMYldTKjoBQbFDz/9MkuG5YbD+o2huEt+TIbq0y7irH3NNSuDaJwg1xl
	TjqSNEiOVvaPaSU+5yANxmC7F6yNkmmMpj57OiOGU+kX0nLJ6VaQmbjBYo7sAHPS
	X7wh61kJjh7fOm1/49ecSw9eFSTZ/YLMdgY3ZRUxMdAIzmulCXU9tC7204xdwVYn
	9IyQbwdXrkW7/8dJDFbmmo+1gyNM1EQ/Few==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2hmkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:42:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so454766485a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032528; x=1788637328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoO8N/t+dbhkTmzXPT0NEb1XZflknAdTKZXb5wgS1ks=;
        b=dojrvE9SjM0UGt4T8s2qNDgK4JYZ+f+2iWKC+2Dle4BIikvrIk/EoRrmNqX9w/wqDH
         KD59AyHESfrdALjAGKZ7MNZXk2ckvlf5VYMaEXI2Uq+rWp8kGqKMDdjTc20tOPcLbppa
         8gQR8qSEAUjGSbX8vR7N6jKjsDi6kHYWLpKb3c/nvnQycBkxjsn1cKifnTmB3Blwd8tD
         6gi8ZK3XanSMbQP4T8eI1i3lI36AjtLpa/yfE4LUgfK70B8+Wudu0Z0J+5ccO9EBtgGb
         wSdIru4awU7ynSlLPzEKTSLTnTsXvMV5h6vMLu+C63jbVX+AjiWNxZOVsLtJdK+fJWv5
         TVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032528; x=1788637328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoO8N/t+dbhkTmzXPT0NEb1XZflknAdTKZXb5wgS1ks=;
        b=cIkBewjifW+kQ3fiJN9h9Dc3yiDW92+HCWbNbudQWlHPzFxBS/8ZPG3375XSE8TTov
         hKrkIUUijLM0gN0PYU06zWB8FX3G8CLnYE8q6/11Jbn7U7WaaDl/lxLkuB6IfdAiIZ04
         Nf9/JAbBJAc8DvIGG6FrbNY4okRP+OF6lYCAsmMrMzjOAO3fDrsoQay7kv3LFKZxh6we
         yloQKyz2NdPcVk6W1XFWYXkz6MR3JBqBNjsxhVMiiHf1oQnNh6RrOyOvQOe+v/36ilAL
         tz9F7haKK+PV+sp3llnM/ZtWtYd5DvaQStRifBv8r6rf1oTxr6TpF0Zc2Z+9FdhHOjBM
         h6GA==
X-Forwarded-Encrypted: i=1; AHgh+RoRObajXPX8kS1TuvkapWvYfSvNLhnqLcIzauCC5tEuB4kLqC1PhijmyYcRQ2H6yLXcf93n/E2cekTW0ASHdYyD@lists.infradead.org
X-Gm-Message-State: AFuF++k84ME7Ll4q6WHepzmjdrwS6SCIwkJFjxzOCJXHsGSX2KFvC6Lf
	iqkBtlsuBQ+CwTUi7D+Xa/NJOAqXGvVpGf+6HVUdyi5Vy/JnyTHSaKH1iS8WgLSNl5fFwJMxT9t
	tlMxWu03zW9IPzD2zukEz8ihi3QgV6As2DMmwr+dhf3VvGSWdXKlW9yw+9lGjaFUchYb3/fACLa
	60jg==
X-Gm-Gg: AR+sD13fyXnGRDH4mmAkSQRDQ1yPT5X6r2lfU2lgVnW9v7gJQZ1GKH1Je4wn8RNSXTf
	FW8zQfwQjA4psJhIZ86fGYpttjYC6urASPAPGtwuJdkf4AcpPm6SnsSV5vnVgMSeff66u9uwAEj
	i4Dp+7bumv+d6qvduHVBSx0G7BIXXTOpWeQ7SrIKFc6neeqmN9Mgd3cZZGhUzrYo9eIzSXI3M9N
	7dVAQ++yBxdiEBcgP8r2nZIBNqcxHetXrpwS+SRl+6xyeJoIeBfk+pd+hWUsSRaJiWZ76xQW7e1
	49iCYJNIBEmY4XPhLKnnmM0QP6vw7MK/jioB254hM8v2RsXxKslmi4ChpFIwV541wnYtG5YvLsT
	bG1YJVAY74IDrZl4=
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr222014731cf.9.1788032528637;
        Sat, 29 Aug 2026 12:42:08 -0700 (PDT)
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr222014391cf.9.1788032528192;
        Sat, 29 Aug 2026 12:42:08 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab730fsm12565406f8f.8.2026.08.29.12.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:42:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Jesse Taube <Mr.Bossman075@gmail.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: fsl: Replace tabs with spaces
Date: Sat, 29 Aug 2026 21:42:04 +0200
Message-ID: <20260829194203.108240-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5713; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BbCuz6cFPXT9NGbskaMTv8v+sD3jV6Mr18Elc9/RIhM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzYLmZBZmlopcykPk8eVfdVP9/2i7IHlLyPM+
 ZT+T5E593OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM2CwAKCRDBN2bmhouD
 1/+tD/9s18VfyOGpsT+XoJaxwp3s0w7usBuNWv1fkwBgjf2lYeI/cQJUCiMjpXYGx0xksnc2Io+
 jD5FJieHhT3zJh/pWPreX2I3Oy4faVIj9ZsoRxqjJCJz76bZ3GxwVjowcqhL2/z7HnmWJ60oirr
 WnilmFowVLaxmWoGaHzfR5/oGNtU7hpkJqgwr24n5PKGLiqYzx6DJoBanCEIEdoAJHbZCGU1aCu
 IsMDG5kWTrY1CektmR3Cg48F25YEZ9MNziz//eklc5xRUU73GecmBCvX32fOAxY78xpctFZ/WaR
 8MCRn/khXZjQMsY7DLMg5KIeCvLCP7845BH7AkjVR2ng3QWM171Y4q+reGUZSJxm78CzuIASrbM
 /J+vA0/mlA7O176NMvuykp0Dk1+e8nR3ODutk/rpL6Hk/VhqsR/5j4bo1xtIAR45shdNF8oIQDK
 uMesdqh+q2uM06SPMsA6tz2ySFYUpkhnSzpMeCeXNJkCvqWxK/TTQxCd2hok3hnyp1EIOiPzgRp
 Hj2sgm0t1AX0uayw5B9rscv/zucJ+hhMVXPWwr+0QLIji3sIs8M2a67d1Q/N1sa+whOuMU+9Nm2
 b9zHI09cPHDtSBHDORyRp3QOKOBAZuSC/DYwveLiBotd2wy3LOdQlioljN4HPSdl6jPSkmN0lm+ yVweh0mpsrFq3WQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3UCWSKbHKuLhs5nyH8Fi41sOecKPqRQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX4wD3f4DRTRuf
 9Go/Wy2jpcXoWPaIf1vqLTenaVUwZr1zbJGAH3sXiTdZ5kMhTO4OAU6GFglvvzORUiWdW2R83St
 O+zDsRf0P7CVyU+yetP0UKKc4+cU+/2+Cne08V+KzYH6/l8tRwNL7R5qlwQ96Je5Ni85g6Kdigm
 iBepAWxPFLb2p17a8FhjXGwRWeTHtz8dvgfDwnwtYzl5XXR3d4Q69AOZf0ETlkUr/WqF6mcnqyf
 gjU1tNKjwP1JwRLPBbUr/Pa1IVjDP0kyePMmHci7GcqZ/nM8jhFfAJrF/OX5m1TtKN7snMiQTF4
 kdMjgHup0Da995lqfsoNCeRVtHTP8Tlj5mJCm9JmXkbuFqsZqVtJDfIJsWuuGAiYEAVRGPjmfTL
 TSXUs4o5QvpgTCzkURXnRFOpz1FwbaznaHf5uzs/n9EYxUYziOOKvbcqFksjLbrgMnHNiFRPo23
 yWsdYoAGAxchYCHL8Qg==
X-Proofpoint-GUID: 3UCWSKbHKuLhs5nyH8Fi41sOecKPqRQ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX9SsHubf6gEeH
 ZrAaLJu6O74ptbUZpapW/t/aKOQzNjxGOenj3/NnQ/2sITanGGEnyZxjuVfe+4iWylsezC7WLKK
 TMGTmhQ2bT/JG8fflb5/mNCp0gZgY/w=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a933611 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4PiMN3fzvG74CLbEUuQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124210_124923_E8632DE1 
X-CRM114-Status: GOOD (  12.04  )
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

YAML files do not use spaces, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml    | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml    | 8 ++++----
 .../devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml    | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml  | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml     | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml        | 4 ++--
 .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml        | 4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
index 846e110062b2..0a69ed9880e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
@@ -179,7 +179,7 @@ examples:
 
         pinctrl_uart4: uart4grp {
             fsl,pins =
-                <0x288 0x658 0x000 0x3 0x0	0x140>,
-                <0x28c 0x65c 0x938 0x3 0x3	0x140>;
+                <0x288 0x658 0x000 0x3 0x0 0x140>,
+                <0x28c 0x65c 0x938 0x3 0x3 0x140>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
index 7bd723ab1281..948160cfbc5f 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
@@ -95,8 +95,8 @@ examples:
 
       pinctrl_uart5: uart5grp {
         fsl,pins =
-          <0x0160 0x03D0 0x0714 0x1 0x0	0x7e>,
-          <0x0164 0x03D4 0x0000 0x1 0x0	0x76>;
+          <0x0160 0x03D0 0x0714 0x1 0x0 0x7e>,
+          <0x0164 0x03D4 0x0000 0x1 0x0 0x76>;
       };
     };
   - |
@@ -107,7 +107,7 @@ examples:
 
       pinctrl_gpio_lpsr: gpio1-grp {
           fsl,pins =
-            <0x0008 0x0038 0x0000 0x0 0x0	0x59>,
-            <0x000C 0x003C 0x0000 0x0 0x0	0x59>;
+            <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
+            <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
index 6068be11dfe2..2341633943c7 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
@@ -82,8 +82,8 @@ examples:
 
         pinctrl_uart2: uart2grp {
             fsl,pins =
-                <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
-                <0x240 0x4A8 0x000 0x0 0x0	0x140>;
+                <0x23C 0x4A4 0x4FC 0x0 0x0 0x140>,
+                <0x240 0x4A8 0x000 0x0 0x0 0x140>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
index 7dcf681271d3..dc86bf6e580f 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
@@ -74,8 +74,8 @@ examples:
 
         pinctrl_lpuart5: lpuart5grp {
             fsl,pins =
-                <0x0138 0x08F0 0x4 0x3	0x3>,
-                <0x013C 0x08EC 0x4 0x3	0x3>;
+                <0x0138 0x08F0 0x4 0x3 0x3>,
+                <0x013C 0x08EC 0x4 0x3 0x3>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
index 96e7b6995273..333b2e7fdaac 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
@@ -78,8 +78,8 @@ examples:
 
         pinctrl_uart3: uart3grp {
             fsl,pins =
-                <0x48 0x1f8 0x41c 0x1 0x0	0x49>,
-                <0x4c 0x1fc 0x418 0x1 0x0	0x49>;
+                <0x48 0x1f8 0x41c 0x1 0x0 0x49>,
+                <0x4c 0x1fc 0x418 0x1 0x0 0x49>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
index db5fe66ad873..854fbcd8e78a 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -73,7 +73,7 @@ examples:
 
         pinctrl_lpuart1: lpuart1grp {
             fsl,pins =
-              <0x0EC 0x2DC 0x000 0x2 0x0	0xf1>,
-              <0x0F0 0x2E0 0x000 0x2 0x0	0xf1>;
+              <0x0EC 0x2DC 0x000 0x2 0x0 0xf1>,
+              <0x0F0 0x2E0 0x000 0x2 0x0 0xf1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
index 2e880b3e537c..988db9507543 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
@@ -71,7 +71,7 @@ examples:
         reg = <0x400e8000 0x4000>;
         pinctrl_lpuart1: lpuart1grp {
             fsl,pins =
-              <0x16C 0x3B0 0x620 0x0 0x0  0xf1>,
-              <0x170 0x3B4 0x61C 0x0 0x0	0xf1>;
+              <0x16C 0x3B0 0x620 0x0 0x0 0xf1>,
+              <0x170 0x3B4 0x61C 0x0 0x0 0xf1>;
         };
     };
-- 
2.53.0


