Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC5EC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 19:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/rSauAHR+KQh253IKg19esceySLhpM+RP7e7oNr6Drc=; b=f3iQh4Um8qVh9sajhQtM2Zjtok
	rK7BP1tQRxCH0OyRyd/QmNng8BK46fMZJYzJLOsgHlS6S4hJkhUvhyDTc6O06LYqbbmbkxZsqqfHS
	ma3QkWYBg6UQwu87tkR/6mck9/s+JcWDgWwUPFfBJ4K+Hp7WiGad3hnGkiE4rKU63CnVegVPi17Xu
	OAI7q3ExpELzSxqEKM6bEJLsuSDKGDEbFycntVZ1/M5edZrD/0kDabhIfQtSS/vIGONHV0PhnadWE
	p4nx8FPVRM1z4WzOeo7ddUxk35kbUVQ9ZJ5HfCR2AuHAB/iPLoErkJ90cAnip9Qb37oSmynkZ1iEe
	/rRIPUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFni-0000000F0fo-085l;
	Sat, 01 Aug 2026 19:55:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFnf-0000000F0ee-14of
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 19:55:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J01VQ3600262
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 19:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/rSauAHR+KQh253IKg19esceySLhpM+RP7e
	7oNr6Drc=; b=bxk1d3HSzXw4PYZJ+uKaYZNyejgZKcZhLt7NP5ImKWAUnYl858y
	cVs794u2NL0KdOrPDkR6KmOMn6WTFTi4gy6nktmtWFN6GeUe+zeF5RbcZpNbl7HW
	je0KNkXaLf/Jol2sitnBsuJk7lRyyY4WlT5mBHPb92NSuFJy2qNT5xC0u+Gd2m3j
	StltJThwmL1K7eJu0I3Goz2ceWjhtJeRunV3d0E5YqDf2a5SHkJyBVO34sqfiKho
	Pc5L6+N/kqVe8NX6W1yZ8mMyK+wLdmv0b9QQb+gzI98AJYvPZ2kVhRAunjNKUd2h
	aYRLgQMg88WOgbVVdEqGmQ4UUZPWjWrflNw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfserr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 19:55:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so23648431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614113; x=1786218913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rSauAHR+KQh253IKg19esceySLhpM+RP7e7oNr6Drc=;
        b=EQRprslgugF2L1MjC2dasQo2SHkMBu1zvsyftQ1oX0yYYoit46t7YVG9gluD4MjtS3
         en02RaQQM1VoUACceq9rmYTWQU6RKBSyUKPdj93Owv+CUI3y6THTp0+A1DY0d7vaxImL
         EGulxAZtq2LogkVVGohk8DYJV+Coc3qnQcur757zfXMvCLIPNDWFKPqGAPP8ufJY6dWx
         1FGmdYUplM+QT4+gOUQ1JrOGbLCMQhjnhkUItQz1qP+G7ioSfeEvOz8RG/xnjb2s6woi
         mBIJQBFPQNpCWexnYpsOxDfA74NgWiRVRfFxss8kMkX/39IoafbYx8/j60tcWcwPZANx
         qMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614113; x=1786218913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rSauAHR+KQh253IKg19esceySLhpM+RP7e7oNr6Drc=;
        b=PSb2fCmQ0uGwsIarZhCZKVQPELl1XwWreJXuz0BAA7WPt92OOmf64tB2v/3s+B6y3u
         Q6UNVeuIwSugqguq/ABDXjlC0sLqJ0vLfE71YmtyJW/N0aK+9Sj5O2+CrpWrYwjBOIG2
         G3UfZfpCfjekfNGsYWjBVCsjF4odsG7AKkhgyk5xh4AEQ4SRrGI34uhzrLDdNUIJBBCC
         g8NeqC5wxzE8unkbmIfzqAmk8AmvdSZHcStLp3RME1F4hBwebOPrsFKnpSdYCSJt7cGe
         /AQoYMnuHviz1iRhcepIYZrGu0yoWaJMd/rK2NM//mfUi+U2KdlYjni08Rek2OPuqEq4
         lqPg==
X-Forwarded-Encrypted: i=1; AHgh+RrinsRATwBkb0W1m57kZpv+LG0AZJy5R5qZU45ilGOUISAUrPY3oGVUAhqMTlxSBooZ2vFae/J1IpSUc45IPHsB@lists.infradead.org
X-Gm-Message-State: AOJu0YzhtcD96d/4PN7XUIsTIlvo76m588Rav1PB+dpTg48GUnBDlaeO
	3r8EnD9fKEyVTwCTUSfqsxS5mdOUo8hum5rMwKwtMqFE5kzyl9q7jMVqE0POVC3DuNchT8+DNfO
	1+HgyOj+olTBZuCJk3P/9//XnQXLin9cwwB27S8Z/9RE3MYx41sG7tV8ZYuw6GVA38FUiY0OOi+
	jzYg==
X-Gm-Gg: AR+sD12o8pFSV5Tuq+tzmWZ4TjreWq1osivo+iuoT6aVXt+HBqCMeyNHv0t5oP5ryIU
	u+DlM7b4ocz1z4oKK/MdDveWxLhbrpLauHeHpEx9lvOPTkBEL7haDiv+Jgtm25XvyluKRZ+rybR
	cgrzFOawbGGsl4OrlCJ8hueVCBp8W7jvqiM98eTZTSUioP1NwX/rtgehmKnyQ2E1j6LasVUfyQ6
	6SnIZLtNNyTlq9VOnLiUnnQzCinZ4WC8txJdjT9qTZ1a6DKUqvEt8ldrV1kEYr3Ou1YBUcUGTf/
	bCWwnHrGs6dzNpOsPGrUBdW/W5t6Lc67F2iXQlmLyp9vskMCjkvslhek1eH3Nk4EJh3xNXmSEFU
	8CmeF9/lpraqlk09o
X-Received: by 2002:a05:622a:4110:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-52b567d8136mr105345881cf.40.1785614113064;
        Sat, 01 Aug 2026 12:55:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4110:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-52b567d8136mr105345741cf.40.1785614112553;
        Sat, 01 Aug 2026 12:55:12 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b917efsm128193295e9.11.2026.08.01.12.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:55:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next] dt-bindings: net: Correct white-space style
Date: Sat,  1 Aug 2026 21:55:06 +0200
Message-ID: <20260801195505.235099-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4002; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6Rnuy0ZI9LSwFMu2N/BxYj84Vjuk07JT+SeI1Do0w+I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk8ZKVWCf9nvvQMsjQrgQMoA4KcejpZi78q/j
 VOwWhJcUBWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PGQAKCRDBN2bmhouD
 146aD/9Hde+I7H0ivjXHPZ5b9k6hkmSCAV4vjAAtOWDjp7HgakkRrMonmUpVDzANgYlpxs2AgQM
 +oKERpdW0VPFD5v1bTz/R1/1/tmqxyQQEl6QV7LSxg+pbKhNQyaPMIbM/DSFGmvjC8q9SCDdeYF
 VIMKQ589KOQVG4wy3D2H1zuhWMzNu+f9Ad7mNqnncm2yMQ4VG0hWq9FpzWlR/QY/N/+4BFez726
 3RMx93kUZRkk2m+qQ0l8G3igPPCX8HsUyXLDyWxcwB3IeIVU62/ZXSjQy6NepU5xXUVzCk7F/1Q
 1MVPOrKjiROqlY51Bvvh0K9qIFAE/9OTRU0tH6g1JXHzaGYOXL0/z7xcclf6phUBLm3PdSX/sgA
 IyzM6uelvgjqGomscWHze58dHLWsr7YwJScTwgQwAK+7tf1mHCxz1awaOZ7GbfcsNDfb4KKEurw
 JFjcm9MGCowsPHDqJKJyw8pqUbi6yzCkO4MHObDCYOFQf9WbR+QlqvvQoTERxBn2z2R8F2DVHmP
 Vs8nx/tjluWA35KSDYnho3uiLIjTWccW4KhAkxcql206yCVBcDohEWkh1el7aqBokjO3g12ICYe
 p3g3IzrJWTH80gCaMA3uEpVMvpdFD0X4xP5b5h9LDWWcAjwYa9wC+wkgMEsoH9DgUg/1uLbbXGW jBDXJrsZQyjzfQQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E0yy9Mmyxaw0rwHLZm75qFQek71jkgWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX/yGfJ+sKIIQU
 Zfb1CbiZfeBqBCQrfPun4nucrCmQIa0OQmvJ3KtfPJMUTs+QYfvm8fmYpJHUg0AFN2GJ0p1xRdM
 RgxjEiZeJAb8RTMHzofZX5M2lgTMsyWvJ+Oa//B1KM0fGj6N9+BvGPThEsRJXwM2gr5ZHncS5t7
 aImwnRl+DKplKy1yUyORlQ8vsK13+fPvL3ItrK6/xxSBDyG0tFWdG12dQ0f7W4NsG8yHz8TM629
 uKtcF0dzWzhoGvEujY2mY53wmA1NevrP77aCs+CvDWYCwtDTeYsf+feCgW04u1mlqFCaImRVqv0
 tKtFM8P9xpzOn3vK7Ex+Bc7Mmcy/xgu37wSn1aYOVfUM0lVWlAjj1ktPLMFA1aYYIsSFuTubLZN
 RfHbgebXJF7UqotOmCFWrHisWl2hhHcffzSB8Or00au+CyYvZx+dH5pvFwXKa/uOvVZY/2AwEb6
 gWv7WchmKXQxcMa89SA==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e4f22 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=mxJljgaHxS3Sv8GYpwQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: E0yy9Mmyxaw0rwHLZm75qFQek71jkgWI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfXwEbcittjxUr1
 KlL6+atgUb/TvJ49DRcokRkRBsqfFvhbBnniMnGL1z/Rai32IeP/vddLDzq9P/FNle5CzGyN9wH
 ZldUp7Hsz5AlwmkHi9JsQ4tIizb61hE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_125515_305843_B63349DB 
X-CRM114-Status: GOOD (  14.58  )
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

Correct a few white-space issues, like double space after '=' or before
bracket '{' characters, which will be flagged by dt-check-style.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/fsl,gianfar.yaml    | 2 +-
 .../devicetree/bindings/net/microchip,lan966x-switch.yaml | 4 ++--
 .../devicetree/bindings/net/microchip,sparx5-switch.yaml  | 6 +++---
 .../devicetree/bindings/net/renesas,rzv2h-gbeth.yaml      | 8 ++++----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl,gianfar.yaml b/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
index 0d8909770ccb..e2543b683bd4 100644
--- a/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
@@ -234,7 +234,7 @@ examples:
                              <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
             };
 
-            queue-group@2d14000  {
+            queue-group@2d14000 {
                 reg = <0x0 0x2d14000 0x0 0x1000>;
                 interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
                              <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml b/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml
index 0f0f35865ef4..b4efa2f6036a 100644
--- a/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml
@@ -140,8 +140,8 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     switch: ethernet-switch@e0000000 {
       compatible = "microchip,lan966x-switch";
-      reg =  <0xe0000000 0x0100000>,
-             <0xe2000000 0x0800000>;
+      reg = <0xe0000000 0x0100000>,
+            <0xe2000000 0x0800000>;
       reg-names = "cpu", "gcb";
       interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
       interrupt-names = "xtr";
diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index 75c7c8d1f411..9de8eeb8c6a4 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -210,9 +210,9 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     switch: switch@600000000 {
       compatible = "microchip,sparx5-switch";
-      reg =  <0 0x401000>,
-             <0x10004000 0x7fc000>,
-             <0x11010000 0xaf0000>;
+      reg = <0 0x401000>,
+            <0x10004000 0x7fc000>,
+            <0x11010000 0xaf0000>;
       reg-names = "cpu", "devices", "gcb";
       interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
       interrupt-names = "xtr";
diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 2125b5ddf73d..c8f76c8e7584 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -254,10 +254,10 @@ examples:
     ethernet@15c30000 {
         compatible = "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth", "snps,dwmac-5.20";
         reg = <0x15c30000 0x10000>;
-        clocks =  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
-                  <&ptp_clock>, <&cpg CPG_MOD 0xb8>,
-                  <&cpg CPG_MOD 0xb9>, <&cpg CPG_MOD 0xba>,
-                  <&cpg CPG_MOD 0xbb>;
+        clocks = <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
+                 <&ptp_clock>, <&cpg CPG_MOD 0xb8>,
+                 <&cpg CPG_MOD 0xb9>, <&cpg CPG_MOD 0xba>,
+                 <&cpg CPG_MOD 0xbb>;
         clock-names = "stmmaceth", "pclk", "ptp_ref",
                       "tx", "rx", "tx-180", "rx-180";
         resets = <&cpg 0xb0>;
-- 
2.53.0


