Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC1CC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2hIfk2KsP0EZz3gIHGRsAcT/OdDAxsw1vtQpagIPDFc=; b=TgVhh8C8TSGEBzN0vZsugSOHco
	hL5KUazbJP3wCEWH5j3dZAMAeUBUcZgVnc6b8fM6QuEbfxw/QNm1h1HKBu63hzbh+ZZe3mRBjUF86
	SHY17ejR/A0WykrgSB8N/zZbZujQq0MxZCfIqdMpu+OgnzqzcAbqAl/eQIZsfywIqhYCccTOju1Wd
	FuzD/z6zJA/2aLtzWwgJYnWxtQ3f6ILFT1ajB6zLuW2OdPRpqPUx/pbPClY8gJFyBI2A69AhDwRvG
	OyCGGP6W19MUVayk1cRgfE/Y7iBtrN55Y2d9MkPXQulhcQOz7DEKf4lyrZqmUFA9BfCwd7q3lXdRB
	RaOjxFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0b6J-00000007bKP-1sUH;
	Sun, 30 Aug 2026 08:41:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0b6H-00000007bJw-0L9r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 08:41:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U5vYts2820173
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 08:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2hIfk2KsP0EZz3gIHGRsAcT/OdDAxsw1vtQ
	pagIPDFc=; b=CF2eUxT0WnCj4NZ1wqq7WVGWb0D3x2ATm7Krtj2NVh2ofx7rH3K
	FTQx3ShfQMHhEnVbGvQpzK5tjpvfrXQrlQ/jfT3emizbVX7PL0MSrrW082874aTo
	eBdtKmzNp4c5kSLyql+Pb7cB0U+jdkbwcwrj+8otgJrrZjoSz2Kn5mat3emslTSb
	/Gps/mJGBAH+OJhzD33F9nCR8l6ird0D9A9+j2YVC2YQZg0Ar4441qmEVVQtzhl7
	2WLdf4FFy8km0PsXmdtywUb9QhRukgb6bHp09AHc7Z0JtjdPkR8RbdZGcqBTU3Xk
	dLgcfYK/zQm+vv/kszlEbm8pqrwJ850peHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgtgqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 08:41:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fb2a46cb5so63942061cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788079271; x=1788684071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hIfk2KsP0EZz3gIHGRsAcT/OdDAxsw1vtQpagIPDFc=;
        b=kUCV1QJGB2U/5dAR1Hr04SP9vT8NA3hq4DPTi1NALC+x3N72ybnWgubQc5B8BSGtEe
         3h4TlIP7zarXR1t9sgoZ/EKgarC2Zk6osB1afbQpnP8WRmdYwg32b5i6xgx1IErmL5U6
         zlAUjfHlncj9wnklyk0OKGyB6dnWwIJAKVLQ6q94gPOfMUecMZPr0shqpg5q80rZ0RnW
         7adyK0jcgd6AYHLxMJ67oo9iHhQ/Nx+VTuxdv1eLXWyXrHYsg/X0AVJat9souygSLlPk
         b2cXAibRhmAHvJ74GfA8RIA6BXEKTrlF4QqAo7U13iVNmh9+hyHEsURWi1Z46j4inulQ
         mNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788079271; x=1788684071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hIfk2KsP0EZz3gIHGRsAcT/OdDAxsw1vtQpagIPDFc=;
        b=tRaIyOFAH1zGbOMZWSh1CkZU3XjESokmkxmaCyjJnjCfjcr1QY0hMv35QfqaX/YwXD
         8NqCHcBme+DXT8fXvzcQ1pYiieh+8tZViBJDDtLhugqapYrENINFc1wx1QQFx/PUX4e2
         Qgfk5nyQ3/9yXWZDlRMyliV8raeIV2oU5hUGPO5ybRPePLCj4EaKVPpX/hb7sDX3j0Yy
         dScXynCuR36VX0VN4fygemRsWyoboOiqtNw1LYoIkHoj0GyVOhUsro1TSarBKjcFk9ht
         CPttfTUQVBXRa3ASTZIVXknm+TypxO2K/C/OCPsrCovUSKU/IuRfqkL4ZGOGlyWenXho
         CpxA==
X-Forwarded-Encrypted: i=1; AHgh+RqUpj5tiyoR1iDGKqoAWXSDOd5e7GQ5fkXVXqJ73+Zwc/WcntjkyP6Ia/NOEthjqhSBb3SBSn+DCY50kuCEIK5f@lists.infradead.org
X-Gm-Message-State: AFuF++mpUoquGBt/+Q3ucSCWT2p2iuv9n4ZHKdCnzZEx8LuDwf82aoTc
	kbKpy8fsK0OFKqa55l5Ulxj+bOmEA12Q5Ca64S8y8/dRQLL/PJTTU6F5GvQ6IEbtb3VqCxLY4+l
	uNetQgDAzzHDoenx5CkrTuL1ryZLBALE3Z3rE+W68B24hMyESYCl32RnAa/DGF8bOfmlzYnKwHC
	V70g==
X-Gm-Gg: AR+sD123cJHitDY3w9MbXHkcJ5pkFfHkxATFLN/h75zl3/7baQLoBLB7+WX1e9ks9x6
	wK83atKzzLvA+o8T3wwAl58YQ7qIfp1kFApNcrkcMAKV7ziDjcKRrKIdg1dzD6B1iDs5OPfuPxF
	92TyMjar1aHJfbXUQXhWsSrV31+woWBdVBv0rYaDMDk9PhaJGVADeq/8JuKzI4odOqModbpWMmH
	hcfA6ymYL9GagoA5KcOG9Bq0/HMRu8QURgIL1ufk+PCr9eUH735zPz7mUimdjUoS7p+OfKxP4vI
	ExVwpph1UU5jCZd7QngzEYWkbgclPIOwZD1MsPTD3MN5ms6u2/qf3sgVJOSluK0hB2wofnX60Z6
	URhMSNK9XcKbgmGQ=
X-Received: by 2002:a05:622a:1486:b0:52d:8256:ac33 with SMTP id d75a77b69052e-52fb95f4fb5mr214250401cf.28.1788079271281;
        Sun, 30 Aug 2026 01:41:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1486:b0:52d:8256:ac33 with SMTP id d75a77b69052e-52fb95f4fb5mr214249981cf.28.1788079270793;
        Sun, 30 Aug 2026 01:41:10 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm56071755e9.3.2026.08.30.01.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:41:09 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: pinctrl: fsl: Replace tabs with spaces
Date: Sun, 30 Aug 2026 10:41:05 +0200
Message-ID: <20260830084104.14968-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5781; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=P5YoXmwsa6Ehsg4LISy8/Uhe1DYRHh5p2rSm5w6dsRM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqk+ygy4zLzP+8gDUARwqQa2XhorzTcQB/ozd5X
 31/KrTlkKCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapPsoAAKCRDBN2bmhouD
 16bVD/91ny6FEEHEyeL16IBP1y6/zQD9jvfwVq/7MoXDsPW9dlRIpoHdWs1QXBY1MDsh1rbXBBU
 HwzUs3JCVRH0T21eYZnlddeMyfmUTZfIIhiPnbOGOdO1skhlwLvbhRGMbDdwvme7aXBxqbl0lu3
 h4mPQn/7KxDqJLS+dP/H0siwnVi9N8zGuavRt6wgDMjR4SnakDdNVVjQMAvv9LPagFOv/zGRwRt
 YxqKO6hgNAWK1F/4p04Mk+CzE9kxGQIddiG7zZSWgNZdTQab2BwrBFnNHEj/qznoVoNnVeWofXs
 jjdwTvoM0yZtqKF/d3zRcPeXK7cw/kDgy38BpECaq49OtzU3I+lBfYvGhcJc2G1b/NUbepBhq23
 nvhXVdVHnYmOWkvq11he1prYLSS0ojLbR9n8a1wwMZ8zgPFhr73LFFpELZIiOO3z6nDbBd7Voai
 bOnSt+0Iqbn68tbl+2u6qfxsIRFXdFcup5jNormWTb1vronNxNHz7nkcWVXgxp2rFoNzllXCS1s
 DoUyqMY79zx5I8GOjt24uoFCTzygTALMe07i/s81J3bXGqr6LCkyTUMafXBlHr2Q1dM3BOiJaJc
 aw/bBV/+Z2zw0qc66nqFPfthvtwJJtXFGrRK/zDDICBr/6EaZY/tlgMlVaHTtPJ/GAWIs7FSEL4 2tx44dk/5FVA9zw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfX8lqHLRAhsfh4
 VHR+5FHpnES9yTC/hpv/xh42U3CPcpZzoh+vBQ/tlb1l0ZrJPQAEFReh401XLBQVj0hu+83MF79
 D7tXmmiBG7qHLxfkp0m/1DVdZGSOr01692L1hldsLSdOZs+UqDOnyN/bKSZJ53OQ1Yw9XjznMdY
 jq5gK9Pd8kvRjYlT/k33iiP9QZqFZsbyatnwG4lzA7AdpXmhtBc4eVGdWceWlU91DG+zDstSHPl
 j6H3EywyhM9gVsJ6f3gJDDRHNMKjBGsSMI8qjNTLYV/8xcP5HkIEvaV1R6OzEdvM/QdWAi8VlY8
 PoDQjcdhsgeZ5t8Z2bK/t+Fm1ImnsOgRVffmK4+lhPu1EQ4LsPkkJaLF+ddKHHjPefIfxzA3u6Y
 QNmLSeju1/h5DJj0W4ewNmmkX73WEWI6fXrzjBWQIrmV7myaFnd7PCQ8ROMRzOGRF3a0ZvNx/gi
 jAL9lIo9uan7ycoxXxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfXztsieDFVbz/y
 IeYOIorSKaEubqrobl0o0meVyR2ewMJ6zv+doM4EN/4TAWz163XUP9X+do5+af3VoLjT4fnKc2k
 VQZzhHCJ1lTy/G74mBr33Gi9kN9ZaNI=
X-Proofpoint-ORIG-GUID: lqRquNgsPwAJwk7U_vhyBDNdr7aeiJWA
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a93eca8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4PiMN3fzvG74CLbEUuQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lqRquNgsPwAJwk7U_vhyBDNdr7aeiJWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_014113_131149_FCF3FDDD 
X-CRM114-Status: GOOD (  12.75  )
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

YAML files do not use tabs, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Correct logic in commit msg spaces->tabs
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


