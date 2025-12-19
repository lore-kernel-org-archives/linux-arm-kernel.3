Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CFFD74961
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 07:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vIv/ZqdFpIpDMymuJJe93Re2tS4+Ah+sbiKzhp+N5A=; b=21ul8xF6U7TJytR1ZVgHe8Ix41
	GDcTodxBMgNI8PmWyLcarOXc6jDemB+OUjmSK34iM25R/C/+0PD9vOy1fu3zLKP22Z/dHRbdLZ3rd
	IiVQM1v6wimgnvy7Uq61tPj/P6yWbuguSFmydSG3HYSr8zBXm63TFMMBj2a57EIOGwVCRx73Nx/TL
	WVuUaE6jKFHXZtMZc2YD7zTDFuB+xLq8Yn1Gv+f4WeMZiLJPJYwLoDLAVKLpSvXA65Djra7QbiDDa
	BolxZXRQzyeAFQ+fDyKXWrfw61Nh9DB9bQ08Hwn+KFZtKkCcXjbEa9FWwuTCc7XBNUBfzOrBonht8
	scvUUbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV6Z-00000009lcp-46ox;
	Fri, 19 Dec 2025 07:40:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV6V-00000009lbt-1Fz9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 07:40:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c1623990920
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 07:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7vIv/ZqdFpIpDMymuJJe93Re2tS4+Ah+sbi
	Kzhp+N5A=; b=eceOhw7MHcNJBA4Q0lTL8Xlrni7bLyZOSqMbCPrqfaEmaBcDkOI
	fjsook5rfL4kdOyjFe5ziRLha6s6hyB2B+YQ+hh77uFIPEMz7eDivoCSsxc8HTzv
	UmuTLpw9/tsjlKWumtqh5eKAC0kqquxGOZkzkR2/LDHdk3usKh+AJLNB21YnneTT
	ILDotgp+YZfTzhpGiJpxe9JjgM6Fnv8pQlD+MuxKdmISpIH2ZewkdlSTLp2UVlmj
	1NziJmuUnl0WD7cyfYu5SaANylX+nZuErx6MqAb5EFTddA/uvUq1rpZeSKRxUvX8
	fLySNg2iYKi/610scmOt/GMWRYhsqJZVwAA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2d9q7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 07:40:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f35dcb9d4fso48699011cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130045; x=1766734845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vIv/ZqdFpIpDMymuJJe93Re2tS4+Ah+sbiKzhp+N5A=;
        b=LCGkO+Vlhl/QRUJSu0QbIIUA76m5BXbCoIYxI+92CvoZOf5ElpcIdn35Sr5Cgzpa+j
         iHCrpkojc3L1FJKuXm7/5Ue9LPCUTHalszojjqoa3HjXtr5F7Sdi2Xd9aNRZ/84NpXj5
         197fRV32Y3pLVzja20TkYlf84rK+Fido1Vr/pc9twhD2FjtfV3+vF+YEuY8JqgCjEF/C
         DLSWA1QYwGbT+xR2m0KF8ZhIt9vU2JdO99NYxQfSL3y+BC8iQ5lrS9ZZ9oKyAIMTdGPo
         KKUb2GII5V+2KorjvX8kO7/Ps1e3b2FkOiPzNTmbaND5A3NerEKFcBQz1Edq5q9Sw5jP
         +1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130045; x=1766734845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vIv/ZqdFpIpDMymuJJe93Re2tS4+Ah+sbiKzhp+N5A=;
        b=L9vsvzmXgRz2XvJo0d4jmJ7Y8IjrhqGjmv9OgysnooIwK2WjIai50O+jBYoEW9mkH3
         5wouBGa6Ds7pUuvHhNUOwhT7T55KbhxCcN5Y0FQsPQTAZODIzSo9QrXrrubUI2EIc95P
         BtnSU1QykxrIkUU1/aZzjVHwmm9JOWiv9WQ4nGQgWQYXlWJd7pTyKFd8pCouzp06cIOa
         StDPXKfVs5ZYkFU7ZRBJFMCMO/D3WUtxgQl4POAFpFeO0Wzdv8qrU9FBP1kGqSHYzffM
         0Wqc41fU3TDvCB0cLQ/GMJ5a2O4XIFgeVyKZJYvyl6tbhbVqnUE5g5PPUwZzvX/MT5Vb
         Oiug==
X-Forwarded-Encrypted: i=1; AJvYcCVV9LkAip9Pa5Q9lJCe5kDQAN4ULHY7GTlO4VpDhnzUDfCvEgfNu/8kh1sz7Z5TrxyoR3oVczPvNj3tXYp9ffZ4@lists.infradead.org
X-Gm-Message-State: AOJu0YyqPbzLuPUSHYcJdsPdWR6h0xRauNchvWJp0FC8uMdIM/WPn4nE
	Vvd7fdCAW2NrzWy/BQikFeUv8ntDNNT3QSb92px48eMWmJwTx1/+zugONN2EU/cBZmHTyu4VA9J
	6h30cDgDI6yB98/5SPVEAlKxsDeXdZUO3TnHhWiwEG2NcwAVJaEX0bHWIUtVPoaXg0S6Mlmk+yR
	YTxg==
X-Gm-Gg: AY/fxX5HsiaX6VP0buD2dO7Lluz2nTWCE9nsamyPy9u2NV7MsVLQkj7dxZ/pqJ4DjCk
	FirgTyQcM1ivCBJhFUpzlUIXKdkd4bGeV9mWL3DXB4Bp8KXkPvARRN04/+D8vWKMvm+xc/8wREE
	V1lMbyxaABMMcWA5vx1Ae7fJVJj8cgkpiwEr1zY0pLJ0gAge5dxitbDyEeqOgbYXIwZHaysq9iF
	sUtSb4EfeKd9YjLdbBhC8mXhUVFBAp879VP04q8msFSkcJndkahXUaL2uug0A0Hf85MOwopkguT
	ysdoy7C3+O2wqZJN+fwyE/cLoBtSE/A2OfZUFsO0pNisJd5+Pob1BQW1apRAhjwUfFt6k6EODmr
	X8CQHuioJE832HneoUo6lYSXAvEGY21G4NyzHi2EaCrdGruQBUSewymDcOcpFuvqjqOQ=
X-Received: by 2002:a05:622a:4106:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f4abd6e3camr26272751cf.51.1766130044821;
        Thu, 18 Dec 2025 23:40:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZEHmexCkpUpnJU3gD8Mpws4Lb3U3S6CxCEkKP17IE4LRT4jWtCCJFbvZtGo1Vj8vdU/D+Ww==
X-Received: by 2002:a05:622a:4106:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f4abd6e3camr26272671cf.51.1766130044437;
        Thu, 18 Dec 2025 23:40:44 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm163174266b.1.2025.12.18.23.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:40:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        MandyJH Liu <mandyjh.liu@mediatek.com>
Subject: [PATCH] dt-bindings: mediatek: Drop inactive MandyJH Liu
Date: Fri, 19 Dec 2025 08:40:36 +0100
Message-ID: <20251219074035.13001-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Pj+5rF1JzrlA2iWQvzCZRORhOwCpPgy2lS1f3GmBXaQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRQFzVSyGI1P+7P7LeiMXwYB/UU4cmRnFddVZ2
 NZtxkX9aC6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUBcwAKCRDBN2bmhouD
 19JYD/9CCbYGdUgNg/6wlO7AqltOh1PNwU+mESZeL+tKQSbY6m3VjAiplRsoDiNUJMowDAcxJTK
 PqxdrWg63SHJpgaE1xS7p8x4AHVwSQhVR62MzrUwNPBtSHLBV29cJA3BJVmTWTFzovTLFjyGiOo
 90UGzia4vNxO7PVXsP//ULpayHUp7dtpDtvvlaV6F/d8788bUcGBOVzgAsP9n6HvW0kwFr9dnKb
 wVpEjEDipSGJ4LepDYYIHKMpw1g/xio3Db3fPaLGZK3w4ayniYVttpBpXHnYgek/gNEXaghXdd6
 vc+r6fJI8AFGSaVmixFdWAzmFeDphvbL/0TQOsa9NHO0b5u7UwenNGTl0mn8r2fymKSOCfNyIyC
 yYkuTf30W2plhYnuC4BrhQnSGztgyDl4NMYRyiT5S74VW6D4ZQ/q6Vk+o3KedRPX0N7z6KtQSh3
 GVosI6Ib+OAu2fjlmMV9A4AleOQntd+jXRmDNqeNWK7oFM6daOXN+SGUDqT7CVlcqe9ZX2PvL44
 X5lVWuprTJh44StcfRB0EuxSRRbsadKHZuZSsngcIgKNun43ygOJV0wlKlKCPm6YUNtoQuwTT6n
 9Kb3YrVRn7ZoNDGadO+CC6OSzzZ9TqSl41Ci6g1j6CoN0P2Q9Zs2rmuDtYSzUgH+Ks9OdMwyb3M Q7fvNxtKKfCKL+w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6945017d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8 a=RAb97dgWUv9LPol2dIoA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfX3K4riuZo6EDq
 hwbFUGoXRESH+7vcRZkV6dFJgIKK5bkb3riUtKl6CtidsRy2k8VtWhVsuWpJuHkfgwt7jjP0s8Y
 u7J53jaJJ9RnzO2MaJlc9Iu409GQ/D33N+nGoaoq1+SWTrQpVG2HKqlhvJ2+EN32QiEuvj6ZL7J
 b7P+lOKpOk5CJI793EJR1XWeQxEkLgsfx1QAydiZ+hWOeulXCAOn4oJSI+UtmDNvJUCH+38bazA
 1U0LQDLao1MUcTpz8ZAtLxYObdYFwvK+xjm+e+eDm0hoqfRorHj/VJ83zmdPytgCn8gyfUqJvDA
 uLgxHeo4mdVYGmCR6JaYBeI+7fjsjIL8O++hrIvTaWfuyFd3eMr/mvUpJG6O+sNyjeiMXDyjR6P
 MZ5SbfP1OHL/2wzVZdDkNSl6WlhWkddROKxNUxQ639VdrZlkDtPh/OOJSOspGMa6g5SjRRqk4LG
 euD63MqoofexGpGuLoA==
X-Proofpoint-GUID: rq_7M2H8np9elg_jCQ3E_64tUGSziyi2
X-Proofpoint-ORIG-GUID: rq_7M2H8np9elg_jCQ3E_64tUGSziyi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_234047_447112_7A2B765D 
X-CRM114-Status: GOOD (  13.54  )
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

There are no emails from MandyJH Liu, no reviews [1] of these bindings, so
clearly no maintenance is happening here.  Switch to Mediatek SoC
maintainers.

Cc: MandyJH Liu <mandyjh.liu@mediatek.com>
Link: https://lore.kernel.org/all/?q=f%3Amandyjh.liu%40mediatek.com [1]
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml        | 3 ++-
 .../devicetree/bindings/power/mediatek,power-controller.yaml   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 0e1d43c96fb9..1cb9d6797b92 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: MediaTek System Control Processor System
 
 maintainers:
-  - MandyJH Liu <mandyjh.liu@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description:
   MediaTek System Control Processor System (SCPSYS) has several
diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index f8a13928f615..9507b342a7ee 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek Power Domains Controller
 
 maintainers:
-  - MandyJH Liu <mandyjh.liu@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Matthias Brugger <mbrugger@suse.com>
 
 description: |
-- 
2.51.0


