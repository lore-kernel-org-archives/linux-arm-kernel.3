Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631B2C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gyFn94t9x8TJA8tuBwrgzVTnq7yWodUe/KP7IL6oCl4=; b=dmKoSNFOoAiUKdXcmw+jmXqIRU
	GdkHQgemXhys7R8uUF6iXRdYIX2d84FgWRqUrczD95X3mt84Kq5wvxK8xZq2NYtQoK6c/0UWoNXy/
	ZL2ghh/FxXapBtPxz241By8134Tg9R97HOkFRnPffO5q2ylyUGNzgMnvs+W9APXk5RloKqoQS32qG
	vMMdu76yjGixoM+XHpxkRqUu1PGza9kqONJosyjZD2YBb/fJtRhEk3K5Tjb3sf9ixEF1vJ7/G1IS0
	LejxyE/tZHuISLPwgKmwQHVudINqvY+4uDJETmnCBrKcmDA5kRrBLi9Ekv3SPVk6pXSyrInrhA+A0
	CQjhZqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x693E-00000004ETs-2PcE;
	Mon, 14 Sep 2026 15:57:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x693C-00000004ESu-28B0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:57:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Zo64157651
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gyFn94t9x8TJA8tuBwrgzVTnq7yWodUe/KP
	7IL6oCl4=; b=S+7WtvnHkhGsbKfbtakH3u0SWndFeCReU7mlhmD3HiVQHGn0wZO
	qGYp7CMNxVFWBdSVUtlnLooFG6oVcWTCxhuoorpp2NwieWmMqkPZhf42lbr+l4qW
	PDNkh5/Y2T91eQQDFiciBnmS5QKtDC+u/0jz8Dm6xCmJShYMYo62y71gqm6HeeII
	9cwv0uyLteW7sRM+/CQtTvs74iScYTDbzQRZRuUiDV+1KQQJgfoeGy0iIMntF8Uy
	C42HkcorIlT5zrzJtBdY0A+YmQ2UXpxxtVXwGRDUAnIVTTZoLyTcFrORyB5DD/+i
	Hpc7YRZljCRdndZGcu+05JgXt03pKWKleCg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f1u57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:56:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82ad4977dso3809559e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401416; x=1790006216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyFn94t9x8TJA8tuBwrgzVTnq7yWodUe/KP7IL6oCl4=;
        b=M5uKoUuTopOCcC3bUb2MSdQlKM6uUIHcgEGWcf59Ya+LM9n1tdXvrU+aRKYU2O+dTb
         K4iJQmSFXFLS45TrUjkBbRgp8JCw01Flu/0a36mKbt/W+D49vDbOUg9k84H58MuN5QbG
         mD4UFXwAKFHhc/MAPpR0dZeBjho1swe0cRfIIx6/gEpE+9xVsVrzMoM5vfLd3Vg9n643
         ZxVTT7wtGYtx6026PwSpu2yJSjN+vkjUUcdwaTKNJ9BIicSLNdLnUgW2yLAoymZe8AFO
         Mp3M199zYRAL9PLtHPLo6MqTy0QBHcyi4ONMYHhvvjpkF1n0L1HWiDaitPsRD7/P0p+y
         npnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401416; x=1790006216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyFn94t9x8TJA8tuBwrgzVTnq7yWodUe/KP7IL6oCl4=;
        b=FFWgioV4q5i1GUx2Awpd7/4gFmIicj+D3Vv/0ORzEml1VNu33Ju7oP1blQFiutJ6C/
         rXJRVGjgSlHAAxPBHDx3kMraMzbD5MY7N7QftA+b7HrNASzW2mEzu5+CI/COigiiK3gE
         TnP3KtLeAtkkvv4jQs2ZcVJrPuOnV14IZ04M5zi6c+z2kSuEloPAHO8U34svIgdNHVc1
         HqvGOjsC1x8cveEUMo917g39WkwlywFsrGduqVoXDkTipj2MRYNNDTHhyddm0lU6vNdI
         RlDJQii9xg4uWUJA7eyENA1AwRz5WjZIETHT2jk7529OemP/SEwURigQa7TU+dI1jSy+
         yz3g==
X-Forwarded-Encrypted: i=1; AKwUvBzZqzLC22BqhSqKMsjQan1ON7G7LrmElnmvSf8FhJnzPDE3fPHmBYvKxxEgIfAAOXAgFNSvrSEQxI5AIjLXOhhT@lists.infradead.org
X-Gm-Message-State: AFuF++mVpjAr15b/UUsxIvvTNAykLqeKwzZJcfn/wTZzjumPkzUqLdhs
	Ys3SW64V54cZOLogvdzNj5aaycBOIyULWIN6hYIKBPoMMgQOAzupVDuiiiUTHfBjQPJ3I5GATtU
	a0N/CBAmGsLhoGfNsv5SZH07NjVXjpTZ3dcWxfJ0I0TxepDYJTF12lD00RH2uHM4/dAj4P8SG3I
	HstQ==
X-Gm-Gg: AYBFou2oxGwNILc/ZoF+hjm0FPEZx5Px+6dKb6faHSrlXTZbmxzsTkxPs8p7vZmvbh6
	GlX9yPoHDviXLoLa3knEJ0eUBc+D36iKRhJTmlbM53/U1NTT6luy+6/M4P57vo537p4JhTy9Zq0
	IlB4FrWRL2pcQrHdee7hxmmYFYFlUyyO9jLmOY1pzXWIlqOj4QfCBnFhUhn15Wcf9YsqEmH2+LT
	+Ypo4wp0uggSu35HKzRdAH/UXON/f9aIRyR8PFYUZU93LGjgdjvvW5DwZRB7sy/XsoVzkyQkcwv
	FUpi7aEpMdsBvkgZT1flcJ4u+4MT+Yh/CxP4Mkh9QGc7S+KkRGeSPxUlzRzXbAEPNWNcBQXAu1p
	IX14ptCr6uN5lSzg=
X-Received: by 2002:a05:6122:547:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c981d5aaf4mr3107918e0c.4.1789401416305;
        Mon, 14 Sep 2026 08:56:56 -0700 (PDT)
X-Received: by 2002:a05:6122:547:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c981d5aaf4mr3107870e0c.4.1789401415780;
        Mon, 14 Sep 2026 08:56:55 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm28041761f8f.28.2026.09.14.08.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:56:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Justin Chen <justin.chen@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linusw@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alex Elder <elder@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
        ath10k@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation in the example
Date: Mon, 14 Sep 2026 17:56:46 +0200
Message-ID: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17298; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=DiFpwtiTagOgKrmD32DDdg+PeDUkeomqpgRCHr+4RT4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqBk9tilJmFuEUqCLqscJSbYlPNtUKu+EFwQlg
 nCthXqDXZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqgZPQAKCRDBN2bmhouD
 1w3gD/4lVvAqyRsKh4hnPM5HxIuJpT5ke0iz9Ej5+W8eZTGer4vTLGs3qHdPQTxRpDQsbInyi5L
 IAioadVS8t8dd380Lb4u5MKPmERCtDJ3XsHVUNDngGUbn2PiH2qZzsdARCDRo50tWvezJcvWOFk
 alc/iyxqDdCJNEQZPXr9qKlo+ZfX/qR75RCb4KNk3COGKJlWr68z/vrd0DIlCS4aS/k5YLEJetv
 /q+WY9PutvZYaZtHXbv2oqihJL7syqHBwhkEZ0vFPVOUV3Lv8Opl8HUyBQElHCmYHOYIqirhYTP
 EDkGurHvRgvHUg6DOsw88DPY48cesYePWW4OrdaLLJw9wkaKFa89no1teYW6nDNJCY0TpZucwNI
 qk+ABvxXWxobl2bcMt8MImi6uCd+227K6hPp8hZyxosolf36pLVk5Od9CLt458WrOdHuXSfIhVU
 zKi2CK0dkO67DnX7EkXmp3Va8hxtak/goP8cZqUovoZqCZLueXt+pIBmQr21OX4VF3C+SRiM+CR
 uts0dmn7SeT9nnbwQ84+uZ43zx8ihWkUmFsY1qNba8Ys8tlWD8O0y0UkI5suvbAyW0Me/yL5RdE
 JOGTFHsZOiG3/yv2OTdZdr6MXOdtdWeEv8NnLO2eez4435X9bHo3L4f7+/zYw8SlDI/WvbVjhq/ oGNm5uKwIE9WmYQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iJIDgV_qacqLjn5zT7pwbzQ_xR5DS8Og
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNyBTYWx0ZWRfXwHovOAaLtW3G
 dDuiPkwKt0hWTrgbafcR8bvVOtFITATY3tBmIBlev+4WEq/9Miamp6VyRcjVguex/u87ul1rwd+
 Y8hSgMKgMAbNgSoaQ6UOVykSww0H8xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNyBTYWx0ZWRfX3aicFxc5/r49
 tPW/7RiB8n/tu3qcqPOF27dSb7IyOBJrlBdw9wDaXE7kWoMwJtyZJOSIbOni6ZknNeEAQv574hV
 0etgujIl6VBAAR5009MGMBNvpd+aZv7v1s+hAFS1UYTNFz90cLbcgrQY2u677O2+L0V+p0vHyxl
 a6V4LvU2pZ4QJkpiW8VE99N0FSKrfgAWstx3gMGbTc7Y96WuBZEapxeGpMTtOxxclltWSmaYPFY
 IoaXnT8Ef2DSGL7Ih+zrkBoxOeJfLQOXgtd5lieihnDyfYwF6oAGE1pYV6iOrJReW7AL9eALfdr
 1Odd+4UkNTM5ml37kkXKD8P4N0Oq/8Rt1AASOPTLQ8XbF0/NpGRKN1KXDgvCd1IZ2GM5k79tKUV
 eRBaUWuJm+moHMMfXQlKWlB073YvJWrArCXopzLKyu4ZMn3uKCryP3i3Iw614mSz0N36jerkFLb
 KUYNx0jBoW9xruYhSzA==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa81949 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=xF3cmUhYqvfMUIrrNTsA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: iJIDgV_qacqLjn5zT7pwbzQ_xR5DS8Og
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_085658_658455_7C9E3259 
X-CRM114-Status: GOOD (  19.43  )
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

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

In cortina,gemini-ethernet.yaml also drop the wrongly indented mdio bus,
because it is not necessary for the example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Mention mdio bus removal.
---
 .../bindings/net/brcm,asp-v2.0.yaml           |  2 +-
 .../bindings/net/cortina,gemini-ethernet.yaml | 52 ++++++--------
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  |  4 +-
 .../bindings/net/intel,dwmac-plat.yaml        |  6 +-
 .../devicetree/bindings/net/mdio-gpio.yaml    | 16 ++---
 .../bindings/net/mscc,vsc7514-switch.yaml     |  8 +--
 .../devicetree/bindings/net/qcom,ipa.yaml     | 10 +--
 .../bindings/net/realtek,rtl82xx.yaml         |  6 +-
 .../bindings/net/socionext,uniphier-ave4.yaml | 32 ++++-----
 .../bindings/net/ti,cpsw-switch.yaml          | 70 +++++++++----------
 .../bindings/net/wireless/mediatek,mt76.yaml  | 32 ++++-----
 .../bindings/net/wireless/qcom,ath10k.yaml    |  2 +-
 12 files changed, 114 insertions(+), 126 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
index a3db6d594c8c..7fcc564e820c 100644
--- a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
@@ -123,7 +123,7 @@ examples:
             phy0: ethernet-phy@1 {
                 reg = <1>;
             };
-       };
+        };
 
         mdio@ce14 {
             compatible = "brcm,asp-v2.1-mdio";
diff --git a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
index f0b5bea2458d..da9bc170cd54 100644
--- a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
+++ b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
@@ -87,18 +87,6 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/clock/cortina,gemini-clock.h>
     #include <dt-bindings/reset/cortina,gemini-reset.h>
-    mdio0: mdio {
-      #address-cells = <1>;
-      #size-cells = <0>;
-      phy0: ethernet-phy@1 {
-        reg = <1>;
-        device_type = "ethernet-phy";
-      };
-      phy1: ethernet-phy@3 {
-        reg = <3>;
-        device_type = "ethernet-phy";
-      };
-    };
 
     ethernet@60000000 {
         compatible = "cortina,gemini-ethernet";
@@ -110,28 +98,28 @@ examples:
         ranges;
 
         gmac0: ethernet-port@0 {
-                compatible = "cortina,gemini-ethernet-port";
-                reg = <0x60008000 0x2000>, /* Port 0 DMA/TOE */
-                      <0x6000a000 0x2000>; /* Port 0 GMAC */
-                interrupt-parent = <&intcon>;
-                interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
-                resets = <&syscon GEMINI_RESET_GMAC0>;
-                clocks = <&syscon GEMINI_CLK_GATE_GMAC0>;
-                clock-names = "PCLK";
-                phy-mode = "rgmii";
-                phy-handle = <&phy0>;
+            compatible = "cortina,gemini-ethernet-port";
+            reg = <0x60008000 0x2000>, /* Port 0 DMA/TOE */
+                  <0x6000a000 0x2000>; /* Port 0 GMAC */
+            interrupt-parent = <&intcon>;
+            interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&syscon GEMINI_RESET_GMAC0>;
+            clocks = <&syscon GEMINI_CLK_GATE_GMAC0>;
+            clock-names = "PCLK";
+            phy-mode = "rgmii";
+            phy-handle = <&phy0>;
         };
 
         gmac1: ethernet-port@1 {
-                compatible = "cortina,gemini-ethernet-port";
-                reg = <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
-                      <0x6000e000 0x2000>; /* Port 1 GMAC */
-                interrupt-parent = <&intcon>;
-                interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
-                resets = <&syscon GEMINI_RESET_GMAC1>;
-                clocks = <&syscon GEMINI_CLK_GATE_GMAC1>;
-                clock-names = "PCLK";
-                phy-mode = "rgmii";
-                phy-handle = <&phy1>;
+            compatible = "cortina,gemini-ethernet-port";
+            reg = <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
+                  <0x6000e000 0x2000>; /* Port 1 GMAC */
+            interrupt-parent = <&intcon>;
+            interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&syscon GEMINI_RESET_GMAC1>;
+            clocks = <&syscon GEMINI_CLK_GATE_GMAC1>;
+            clock-names = "PCLK";
+            phy-mode = "rgmii";
+            phy-handle = <&phy1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index ea285ef3e64f..fab6aa6237e9 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -127,8 +127,8 @@ examples:
                 phy-mode = "internal";
 
                 fixed-link {
-                  speed = <1000>;
-                  full-duplex;
+                    speed = <1000>;
+                    full-duplex;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
index 62c1da36a2b5..d1522216d32b 100644
--- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
+++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
@@ -91,9 +91,9 @@ examples:
         snps,tx-queues-to-use = <2>;
         snps,tx-sched-wrr;
         queue0 {
-           snps,weight = <0x10>;
-           snps,dcb-algorithm;
-           snps,priority = <0x0>;
+            snps,weight = <0x10>;
+            snps,dcb-algorithm;
+            snps,priority = <0x0>;
         };
 
         queue1 {
diff --git a/Documentation/devicetree/bindings/net/mdio-gpio.yaml b/Documentation/devicetree/bindings/net/mdio-gpio.yaml
index eb4171a1940e..36e51aaae9c0 100644
--- a/Documentation/devicetree/bindings/net/mdio-gpio.yaml
+++ b/Documentation/devicetree/bindings/net/mdio-gpio.yaml
@@ -45,13 +45,13 @@ examples:
     };
 
     mdio0: mdio {
-      compatible = "virtual,mdio-gpio";
-      #address-cells = <1>;
-      #size-cells = <0>;
-      gpios = <&qe_pio_a 11>,
-              <&qe_pio_c 6>;
-      ethphy0: ethernet-phy@0 {
-        reg = <0>;
-      };
+        compatible = "virtual,mdio-gpio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpios = <&qe_pio_a 11>,
+                <&qe_pio_c 6>;
+        ethphy0: ethernet-phy@0 {
+            reg = <0>;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
index 86a9c3fc76c8..d825130b54b4 100644
--- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
@@ -197,10 +197,10 @@ examples:
             <0x71040000 0x10000>,
             <0x71050000 0x10000>,
             <0x71060000 0x10000>;
-            reg-names = "sys", "rew", "qs", "ptp", "port0", "port1",
-            "port2", "port3", "port4", "port5", "port6",
-            "port7", "port8", "port9", "port10", "qsys",
-            "ana", "s0", "s1", "s2";
+      reg-names = "sys", "rew", "qs", "ptp", "port0", "port1",
+                  "port2", "port3", "port4", "port5", "port6",
+                  "port7", "port8", "port9", "port10", "qsys",
+                  "ana", "s0", "s1", "s2";
 
       ethernet-ports {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 68ec76fe4473..38e3830512fe 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -246,14 +246,14 @@ examples:
         qcom,remote-pid = <5>;
 
         ipa_smp2p_out: ipa-ap-to-modem {
-                qcom,entry-name = "ipa";
-                #qcom,smem-state-cells = <1>;
+            qcom,entry-name = "ipa";
+            #qcom,smem-state-cells = <1>;
         };
 
         ipa_smp2p_in: ipa-modem-to-ap {
-                qcom,entry-name = "ipa";
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            qcom,entry-name = "ipa";
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
index 45033c31a2d5..07b39ef1fc62 100644
--- a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
+++ b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
@@ -91,8 +91,8 @@ examples:
         #size-cells = <0>;
 
         ethphy1: ethernet-phy@1 {
-                reg = <1>;
-                realtek,clkout-disable;
-                realtek,aldps-enable;
+            reg = <1>;
+            realtek,clkout-disable;
+            realtek,aldps-enable;
         };
     };
diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
index 4eb63b303cff..8c8622160abb 100644
--- a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
+++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
@@ -121,22 +121,22 @@ examples:
   - |
     ether: ethernet@65000000 {
         compatible = "socionext,uniphier-ld20-ave4";
-                reg = <0x65000000 0x8500>;
-                interrupts = <0 66 4>;
-                phy-mode = "rgmii";
-                phy-handle = <&ethphy>;
-                clock-names = "ether";
-                clocks = <&sys_clk 6>;
-                reset-names = "ether";
-                resets = <&sys_rst 6>;
-                socionext,syscon-phy-mode = <&soc_glue 0>;
+        reg = <0x65000000 0x8500>;
+        interrupts = <0 66 4>;
+        phy-mode = "rgmii";
+        phy-handle = <&ethphy>;
+        clock-names = "ether";
+        clocks = <&sys_clk 6>;
+        reset-names = "ether";
+        resets = <&sys_rst 6>;
+        socionext,syscon-phy-mode = <&soc_glue 0>;
 
-                mdio {
-                        #address-cells = <1>;
-                        #size-cells = <0>;
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                        ethphy: ethernet-phy@1 {
-                                reg = <1>;
-                        };
-                };
+            ethphy: ethernet-phy@1 {
+                reg = <1>;
+            };
         };
+    };
diff --git a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
index 8b5da602a2e8..4d24dadfaa5d 100644
--- a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
@@ -192,50 +192,50 @@ examples:
         interrupt-names = "rx_thresh", "rx", "tx", "misc";
 
         ethernet-ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                cpsw_port1: port@1 {
-                        reg = <1>;
-                        label = "port1";
-                        mac-address = [ 00 00 00 00 00 00 ];
-                        phys = <&phy_gmii_sel 1>;
-                        phy-handle = <&ethphy0_sw>;
-                        phy-mode = "rgmii";
-                        ti,dual-emac-pvid = <1>;
-                };
+            cpsw_port1: port@1 {
+                reg = <1>;
+                label = "port1";
+                mac-address = [ 00 00 00 00 00 00 ];
+                phys = <&phy_gmii_sel 1>;
+                phy-handle = <&ethphy0_sw>;
+                phy-mode = "rgmii";
+                ti,dual-emac-pvid = <1>;
+            };
 
-                cpsw_port2: port@2 {
-                        reg = <2>;
-                        label = "wan";
-                        mac-address = [ 00 00 00 00 00 00 ];
-                        phys = <&phy_gmii_sel 2>;
-                        phy-handle = <&ethphy1_sw>;
-                        phy-mode = "rgmii";
-                        ti,dual-emac-pvid = <2>;
-                };
+            cpsw_port2: port@2 {
+                reg = <2>;
+                label = "wan";
+                mac-address = [ 00 00 00 00 00 00 ];
+                phys = <&phy_gmii_sel 2>;
+                phy-handle = <&ethphy1_sw>;
+                phy-mode = "rgmii";
+                ti,dual-emac-pvid = <2>;
+            };
         };
 
         davinci_mdio_sw: mdio@1000 {
-                compatible = "ti,cpsw-mdio","ti,davinci_mdio";
-                reg = <0x1000 0x100>;
-                clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
-                clock-names = "fck";
-                #address-cells = <1>;
-                #size-cells = <0>;
-                bus_freq = <1000000>;
+            compatible = "ti,cpsw-mdio","ti,davinci_mdio";
+            reg = <0x1000 0x100>;
+            clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
+            clock-names = "fck";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            bus_freq = <1000000>;
 
-                ethphy0_sw: ethernet-phy@0 {
-                        reg = <0>;
-                };
+            ethphy0_sw: ethernet-phy@0 {
+                reg = <0>;
+            };
 
-                ethphy1_sw: ethernet-phy@1 {
-                        reg = <1>;
-                };
+            ethphy1_sw: ethernet-phy@1 {
+                reg = <1>;
+            };
         };
 
         cpts {
-                clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
-                clock-names = "cpts";
+            clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
+            clock-names = "cpts";
         };
     };
diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..bf4116b057d2 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -325,22 +325,22 @@ examples:
           r0 {
             regdomain = "FCC";
             txpower-5g {
-               b0 {
-                   channels = <36 48>;
-                   rates-ofdm = /bits/ 8 <23 23 23 23 23 23 23 23>;
-                   rates-mcs = /bits/ 8 <1 23 23 23 23 23 23 23 23 23 23>,
-                               /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22>;
-                   rates-ru = /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22 22 22>,
-                              /bits/ 8 <4 20 20 20 20 20 20 20 20 20 20 20 20>;
-               };
-               b1 {
-                   channels = <100 181>;
-                   rates-ofdm = /bits/ 8 <14 14 14 14 14 14 14 14>;
-                   rates-mcs = /bits/ 8  <4 14 14 14 14 14 14 14 14 14 14>;
-                   txs-delta = <12 9 6>;
-                   rates-ru = /bits/ 8  <7 14 14 14 14 14 14 14 14 14 14 14 14>;
-               };
-             };
+              b0 {
+                channels = <36 48>;
+                rates-ofdm = /bits/ 8 <23 23 23 23 23 23 23 23>;
+                rates-mcs = /bits/ 8 <1 23 23 23 23 23 23 23 23 23 23>,
+                            /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22>;
+                rates-ru = /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22 22 22>,
+                           /bits/ 8 <4 20 20 20 20 20 20 20 20 20 20 20 20>;
+              };
+              b1 {
+                channels = <100 181>;
+                rates-ofdm = /bits/ 8 <14 14 14 14 14 14 14 14>;
+                rates-mcs = /bits/ 8  <4 14 14 14 14 14 14 14 14 14 14>;
+                txs-delta = <12 9 6>;
+                rates-ru = /bits/ 8  <7 14 14 14 14 14 14 14 14 14 14 14 14>;
+              };
+            };
           };
         };
       };
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index e667d78b3ab3..a52cb8a0d409 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -408,4 +408,4 @@ examples:
                           "msi15",
                           "legacy";
         ieee80211-freq-limit = <5470000 5875000>;
-      };
+    };
-- 
2.53.0


