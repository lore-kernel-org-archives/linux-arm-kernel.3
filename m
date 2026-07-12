Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15306C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/bMBeEHG8=; b=S10QevcTg/cYxWbj7HZmbipf8G
	z4SpyrGQk4UjLAzy7oew0SuCNEyY+I/TnLsOYtm69k/Iziv2apl28G9RF8GaRXSYd04l6mWl92H/j
	bBJdixhJ+TLOf1AfXanSX9jLjLVW1QNxa28mpJuMp9oaW7wwAjeNh9Mia9eZwiGjkygUL6CLqZS+f
	hcsYia/VE+1sj9yuFMHymTZAcKJ+OrhK35jPVIq8j7nCUt9QFuw1x4ESBP2qrp3dIpRmbkAdglFaV
	VN3y6lGjcLpJtSdtpGD3Sk++wV3VFNc34ARPOzTyg+6heI6xploACoU7NkvX9q2u50gCrsx0BjHUd
	+w11kwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivcX-00000007XrJ-2mne;
	Sun, 12 Jul 2026 14:57:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivcV-00000007XqX-0ta5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 14:57:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZbDZ2749713
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 14:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/
	bMBeEHG8=; b=ZzeYaWQN41TGzdQrFgh9bvy4DfMIUIpA75j9VXX/0Yjl/pnZ3Th
	CdQ1mrUlwxKTSgt+qVsfVUxb5wnaXuaB/GMQ9W3RzC0KWkVlnsu8JRS3PPJxGyY7
	eCOcd9z53brTPD6mcYsUIxwxrWa9ctWssD2Slgsc4ab04uqqj1GwE79zPY9qXkup
	1BVVxiCD7wJQIycRHLJmiWZW2op9nyKbtrSr8GOywvmsV5gRWU8czj2ZjrSxHNYI
	EBglMnP4lT7PHrNdIXG5bPFDV1r41+OeUBodzbXfz1Dsmanvu1Qpb469BMM1yYoH
	Nb8+SwhpAQRQDjWwpanbbvn9e0vTQ3DVADQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgk0cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 14:57:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso27434951cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783868245; x=1784473045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/bMBeEHG8=;
        b=ctYeoIndYYwmmB2Z1Fxpfb9Del1HlfQKMmuEwGHj4Bjg4hnIgdYOMi/FwnHUuy6DYJ
         a8fIDdkSb5divypRcI4/RpMntwGIT7kH7H9pfsDcgcC/3cfrEzJ4qTTogvfLcXWgoGqL
         b4xBPiLCgNDjDyOCcSv5Vz31akwRC7GXyspooOp5lB1TKxJHdNkwteLGi06UQKhbiVAY
         x04SyZLZlII8IC0p5Cyy7XDP5ADRQDENx7d2LGJn0JUxjls8bTf9VxgwixlLhfTzMgEH
         yknVsZ1jqs4tjZNwropQ1vuhkud4UyVZiiwVaytH8LjdGOLjOxL3ZahdSdxYZE2U5EwT
         laCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868245; x=1784473045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/bMBeEHG8=;
        b=M8BwuTdRADV1K4zHSX78oPPgF0paka9mCHMOM7B591e+OO7YVRuatI+DLDlcHjlrC+
         FJ9uGvzjZLCYPx4c5mFFdMC5sMZQ9LdSjj5hEEWVUfnDcEm/WBaOufMDamCsMaCq42lk
         ikqrqWDzLKaBUgTVd/kpz67rLbL9C471iFxFHRjxoXFQVlo1PSQ1bTSwo2LgJeop/4Jg
         JzI6Z1VQtBuHlx3lCNT+hR5Y7kt3JtUwBYt7KH2sBAXFzYzN5Xz6jTB4r8kr40nBmh5k
         isTDP05KpScR2zwAaa803zwoN+MN2282pqGoY0QxZlD1hzAqv4pxP4vZ/qwUkF/3jxZm
         BVmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHa4R8IBZv6WalF6PwLHlFh2PL+TU0JYCv40rw9KXdJ1wkK/2QeMVTo7QgxVBrnCYeW6l1dgKBJyVeBaSRBdCV@lists.infradead.org
X-Gm-Message-State: AOJu0YysuJ6f3XwT11/6YnwE67ZXrt31ND4e3+6vFlUQrqLCMNfrvH5h
	3WFhp4v8N79vYOLXTPEXLFvcws70wgYdhBLakqpSi+pOn/isEMvTnJP0sKIP+Y9C6vW5bunZjGw
	6BLB0M4WJlAQ2no0OHx33YLi7W+NtdETr4vTmi7t0+zGxTBM8Zx9Z8Ify/239tkSXY49WdOkbvL
	tPsQ==
X-Gm-Gg: AfdE7cnnt3NK0qCX1IXFgquMQdZAbd5ErAR3qV1VqqrEvorEd4AJXTnxdbcLhX/TiRk
	jcrTkIByCOmURzHq7tZNZtMaC9Mbe/sRowUOWgLUVSfZm4an7l+QSobzke8BX91IqJTPyH+cj4b
	l/XItyRlJ+7cQkD0SUGQSdEkLgCoESsp8Z76GkeMvnqlEid51+9RYT9iRHMcAxowb3DTF6wDuAh
	3H60lJ1hN5sE/mP/AJv+0ZI0r7uB611ogd1ZR7j9T9ZwYFf2ri/Lj+cWGrhIQprn/TBQLdoJ2az
	McXjW6XTX9tGuVjprwN+NtMwKMyLH1mZs4Jxdf3ZXNr0J+dTrpbC/GM9n/RqyTkRGUqzWp5bQjI
	76MBshyolWFKturCk3ozzA9MZD3Q=
X-Received: by 2002:a05:622a:34a:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51cbf049379mr63203161cf.9.1783868245088;
        Sun, 12 Jul 2026 07:57:25 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51cbf049379mr63202981cf.9.1783868244698;
        Sun, 12 Jul 2026 07:57:24 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm222688675e9.0.2026.07.12.07.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:57:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of firmware-name property
Date: Sun, 12 Jul 2026 16:57:19 +0200
Message-ID: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Xam3WnySSyihDDDGxNPmRcmRKrs0uTJ9euwWF3c2V3U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqU6tODyBAdxCv7LttYZ1TljOtnt5RYl8TpHtke
 z5IVF2RgpKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalOrTgAKCRDBN2bmhouD
 15QDD/0S5wV672WNwxOQ+uf/SmXYU0a/71SL7SJCwz5L+Sm2S7Snh+QEnukl/91QB8uvvIKbFUB
 a6ptRx6zWLegA9e76DbjuYkOItsyiiyAsyN7Ps3U14JYWlYNfaVt/a4b9Jfv9ahBrK9G+m4/MbU
 Q/jbnQM9DDxaNwj0nO5vzAM0AtaUskzDcau48XzdTpfTafyulMysq+gTvikJPCMqmc7nggB61RG
 RsYu/KPNeHqXPwktw+my++ko1y90OJVHZ53uSCFwNNaNSXsUozeXUgGTPjZYpYrhevy+KQGB6e8
 o95LTqOeTtt7RE3NiCMIHjfZCLjLKm/noI/SP4AHAKjBh3kg6AuS+2rfQTHLDGXzjWG4/qAyAVa
 O3GHO+MhqnkKqunw2Ci0LoxS7UByrmyFSSIjdMK7+HMJlQ/lzUBcAhTA/3QK5rneCsZPZzWYkL9
 BzpBfXeIPyNoLAJhZ2Sqc7BlsnfvtH3Nugu2i6gEQqZOO6mTKoeIAsDNlnY49RaK+2bQZQZyl/8
 P6R7xJ1+JVIxajvHdYrLCOL4Um9nKvl52uzBQZE0aGud3Debt2OfY3BlD4zG7JksZgf2oA5MJP5
 DfISs4qDlczuoI/rRyNtHXBfTbN5c6XeZusZc8Jyeh6qYe6HS4SqD60Xx+3/pYxBr1gdVtA+TNR RsMLs8SVQsK+bNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfXypEts45o5Bjw
 3fN/g/A09XJ8UY4+MWz8SwaL/waG12K94zHFiVndPMXohc1EClPXD3aeX5p2YPqgl/bBOP4Zwwq
 QmP4SjTG6axq4KrA3r54uWLUoj0s+F0=
X-Proofpoint-ORIG-GUID: IrdTy0Hc9qzzZUFwgkxIcgpYrbt391R2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfX0DB/6gDlRIxL
 8YoxlNWxh7r/HZKDr5BP5s2L1RQpm/yvac6Y9eZ6xJTiHlo2htFbtEuAAa8LNdTVs7/4MFGxQlM
 /GnzbH286DnO6a7yQ7/O91cAwifUeI/0ayU40hWT/ntdLVxOP+J+I+t/0em8uzviRe0M9oCgDdS
 Miip3XGi8DnSgE7A1gaAzqduA644YJ2MDpjb+VYikHSl2cy3RucbOJ7j/Zl44U+AJssKBpZT7rp
 Y455NdUthJTGR3Qc/wXeeuyg7XyBYiBF3uMfHKTCvQkIaHLoLTTpb5NeZs674ZPHKOmy8k3RoRc
 NnPOhWfbV2RPb1fQ9O2X1lUzwaNqsItrP9ukaRc7zSfFEdgg/XRIh6ZtdtP85WavP8uJpq5L90H
 3Mfiww/WFnSbEPBukRFVJYcSVzX+f7ZVdJsCYjZMWEJW2T4iISCbOeMRn0wySifwNNeNHm40bxW
 S2uLzVviDQQjWIuizyw==
X-Proofpoint-GUID: IrdTy0Hc9qzzZUFwgkxIcgpYrbt391R2
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a53ab55 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hJuU4UVuZdPSbFSiBLIA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_075727_374987_5D224D3B 
X-CRM114-Status: GOOD (  14.59  )
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

The DT schema core defines the type ($ref) of 'firmware-name' property
as string-array, so individual schemas do not need to.  They also should
not redefine it to a single string, but instead just set number of
expected firmware names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml | 2 +-
 .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
index 3f710433e937..4cd5121b9a4e 100644
--- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -25,7 +25,7 @@ properties:
       - const: amlogic,meson-mx-ao-arc
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       The name of the firmware which should be loaded for this remote
       processor.
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
index 2811334515d1..591471e5f93a 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
@@ -30,7 +30,6 @@ properties:
       maxItems: 1
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     minItems: 1
     maxItems: 6
     description: |
-- 
2.53.0


