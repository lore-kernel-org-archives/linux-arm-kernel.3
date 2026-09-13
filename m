Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDC0C88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=; b=45EroLe/9LNN9EVqKaAFdBX6uO
	948mpTuV4awIibF4haZhLwg6aXqkaZECNC2S9w1j/7jvZYaJTBJq+U1TTkoNWbIdWCCEzDAepCkUv
	A2obwomsMW2vCL4Qc3NZNha6Cj8tO9OmhocV+6OkxyMCnr05LibnGefoPZnXLOmbenNla7paus3Gy
	TKdDgF2J0voYGPU2LcuNh7zwHDnO0oDaPfuFxp6b6l9dVdibJSEq4pfDiorWiak68/aDO7j8/+ZuC
	q/NyFIQT20OTChtNqcgTCcLRk3PFP78L0oKWhDiZe3A4TIKm218+d0k8xYNNRON6WCbnTNvvtdZqo
	P33LNoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jNr-00000001e8p-3dLH;
	Sun, 13 Sep 2026 12:32:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jNn-00000001e7a-2eeq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 12:32:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU9xg821783
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfP
	Qn4Ziz5U=; b=U6Smo9kFJivHvkMds8U2IxKIiqYkWh1SgPCHvlOv3ToV6rfhIVx
	aiA7G1W061+QCitNeFESvaWnf7l5Sdx6GysnzFL7frFWJx4qVLd9gDhlH/M/cppB
	hguAc2gH/1hKHSNEnAvtTIUaqTeyW+5xCWooOItBKlVlcmA3v2j7+jQn+NMhmhm6
	BwESPjPzRpDR6BIEDIwhfXuEXFkznPV4vTDiHlL0nuQYhUEJAbNgDhUOY10U8nDi
	IHWOe0crgKe8YGX82cVwyCWbbKyMmlLW5VTNd5mDZJu12gZNnuWKzf+PAPrGt0Q4
	CTdRcpd8XtoXJXpnJJsJ1UXzLuf9WtCirlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cb5vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:32:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so221838685a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302750; x=1789907550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=;
        b=Jjt8xfxbb1kqyXvUjlTn5WVK6PkrP46RqN+cZpAPR0w6MkRatBXyTlhUDge6+gj3cL
         jrym86Y85vZxO6PyUqYVy7OZJisCa64q++DdxcTH8gkAjbwUk0Z7juhtrS9iaJ7ixyEo
         GoI6qp90khkcj/WSfEL01M07KMA/l99IfKYzTTTV03AASb3O+QU8jiza894fy7aGr3hu
         88zzzhONXtAPzCRa0QjcZHvy9Z3Trdxb7bsXVP/9KEbQvbKjfcX3Y6rBNjpSAPl4uhBG
         iRHbVDGNMkICs3a1JXApgfIHpuJChoyx2k+Gq7dExUY+h84w7plh1/Aj+6Uad7xw+fNT
         IUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302750; x=1789907550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=;
        b=geG7EPXdvaPz4eZeDNrW1d2UhPEdrnpsPbrhgFVPG4iAihy0G3k6GcEdtUUPRWiq+g
         Y/c+1zjE+738Oyyge6Zqq/r1Hnnw+Ph+iZl17eukmRQI5Y0yh07Mde+VbdavZ+aAAuZt
         vgNUP6fA6pxCrbP6ns3Pgcu0lveidw3Ce7nu32YirM1ShbD089dlOwzg3Ybfvn4qaICJ
         tapm5k7aDeO8cV2RrH/AoUbuVhTIsY9EZArl8DV8f4Gg9hdMndLtAVHCqbE0y+X/4mSQ
         OWMEEDYGDmn3YTTOc3rmEdhcniAVDsOnzZ38hMj7T92IVyt2GdmKrV6b8ZMeTY197zbt
         d9mA==
X-Forwarded-Encrypted: i=1; AKwUvByS38NB/Qg+4QqPTjYl1eOg+8O5opae8lLJXFDpkxBct5qkMLNnc+FjCIolgDxZodwQy32VvNGDw6olhI6pMu0v@lists.infradead.org
X-Gm-Message-State: AFuF++lXOpyH5bI3IZLszRs3MkKdsa6hvT7JIVRWX1wub9EC8I7UgovR
	eYJl4i5Syk1n224xrLY3cRDARS1m35LcPYo2k+ordCcqeCYbqZbArGBQMMzHNY3Sgqn3RV47oxF
	qLcQw1vH/GoCYBGN/7PnUmdVtZ+2SOJLYGStPqiCKb1YLLKeG/5f6H/w4EL6yDtgrFOKNkcPiYF
	PGlA==
X-Gm-Gg: AYBFou0tobqtNlgV+XLjiKi1qV4XL+H3LY0+smRW8f2sBY8PYlQR1Gx1CujGIkvi/1G
	+tdq73ryDNCawnEkOH+aYodQ49dbEsdFgS0E5IhYUbKWZBeCSg1Z6uGEZo2sXVB6h9rMwuslQL2
	ireWzgi1EPbfj5ETPDG6uhWdj7vnplxv6Z4DOv2g4D242Ma9maCBmXOqfFm4+BB//3uE/CHmkGq
	DyEvVm/jj+W0W1aZRzGz8YRgJWY/S/X0hKHFTbZkH7C4GfnK0nHGtB3yhYF6eD/+U8Icd0VQWkG
	lLbFMYoHO9/8Ga8kQu67Njx1F0X4ovysRvl1Ok8xjwu8uCNImpaKrNTdLq/S+DEisQ/WP8Z6YVg
	52genDtkScv0/kH4=
X-Received: by 2002:a05:620a:a0ca:10b0:939:ec25:e58d with SMTP id af79cd13be357-939ec260367mr1128824085a.12.1789302749619;
        Sun, 13 Sep 2026 05:32:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a0ca:10b0:939:ec25:e58d with SMTP id af79cd13be357-939ec260367mr1128819485a.12.1789302749044;
        Sun, 13 Sep 2026 05:32:29 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm329566615e9.3.2026.09.13.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:24 +0200
Message-ID: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11926; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pFYD9xnmywcXUkGLbix3V2jspMeKMaccoDyDTjuRfBw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfXhbn/AsH2HCU28b+w1iRFMdoj44HN03Qm3
 9qsEYLGX6mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX1wAKCRDBN2bmhouD
 1zKAD/46HmSfdDukAVteVmwTPNNO1cL5boOFPkv4ZaaxjHIhnpTCrIW0WdWOE5fgJvjVwV+bPeB
 POxVwkDqBR8WdNMwhBksOAN2B9t6K/mT8VWgirLj4kJaweY68/N6GGVuwTqLJmHfJqFYDsFD9hW
 ez45yd6g1zgqrDDsd9oyrX3ERmzTtM4bqxvLFp0E2Qv9FgDpXXc4xGzsu2BD+0BwBfTaEFpepMo
 HjC2RXjiLCLufXzHIAA9i4agQ+x1I0M2+sAOk4sioEvDOeeBfDBDCVXQ+YPq+YqMnLMFUMmRzxd
 EeKQgkHRm7XMkDF/5QQxKdjDnf7dkG7MMQbgdooZGIGAAJG+WNIOpqQDfRpHHeXbeT3u6j1F4Tv
 sm90tdMOKMibTPwOr0oo5kSUS/jVKmg5Q2YzEFqlzDdRasM1ko5zYnSS7SsSmBYsxtE9Ewlau2r
 +3jATULQBaJ6vc3gJTdNu1ocY8OLKu3KDmdIUZ47C8ERQu1PBRlmQXC/DWMlwvG8KLRXGeD8Cfy
 vOZWuvUaw2+sU8pCu6gn/BqrmlhAdMDkwfBSVkFx3/Pse8y2L6RQ5stekSCSs6ru9avZLM0zNvb
 y9v20RgSOGflXFIFA69CaqMWm/hptbvXEVCzWUaTuzzPBysthZSsQMYhab3Jd84wdjQuZonyysF YnhKsJOyWxJxDXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pjrbSKMbtb7hZCLz18JDqaB_hCKTDhs_
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa697de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9YUYMJPlCa3gOHXfvi8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX0ikhSdDa2H+3
 g8mXPqDJWRibth5N4bfs36AO1bRxHTRfzzhmVFYfgbsdQ9b4V5M/ElPxjD9zmxbV+Fulc0nOdK5
 nEIJyev0xcGCX2Ot6DErXdh/ceS2H4c=
X-Proofpoint-ORIG-GUID: pjrbSKMbtb7hZCLz18JDqaB_hCKTDhs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX5yq6UpRZL9se
 /NNIW25U31U41Ef7qF6m2xqNi2xmYL/jabkmNB7Eq5fswXKFXu8J/HEzalbtnGojYdyzK+/S/fw
 VLTzFWwmm0FYds97Yqkrdi7vfbRjM4JsrwF5OeVCZA4jhI8XDKoKCSGwRrt86WJv0vHDZXz88yC
 en0+iPGKUSujwAsB1F6ks3asSzhUOVcGX/h0M8HE6JK6Ax2zKJXK5QsBg7p0Efq0XH60uzPyJK8
 1cfN1hwGSk23I8fljSDDIC0KbenO9i/WUIY03hcRrmCb1+eAnW//DDdc5d8Hr/lVmOFWx4L7Agm
 Vm3eM0DntVKv5LuSqq69nBepY9W6G5xrRhmejSwPkt1IsIfBW4RK8fUApvF1138zIPBQJ4MIy7j
 GdH6AgMtbVkb3eNcaSJfTuzFq7lpzqxo7Pv8LWxxAWb2EaJu3/KVLCDnqifL+LnKsPFUFwoHqP0
 UDWJXVuDQdaMKIBBO9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_053231_864628_74E5AC1D 
X-CRM114-Status: GOOD (  15.57  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../pinctrl/awinic,aw9523-pinctrl.yaml        | 50 +++++++++----------
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  2 +-
 .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml   |  8 +--
 .../bindings/pinctrl/intel,lgm-io.yaml        | 14 +++---
 .../pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 +-
 .../pinctrl/mediatek,mt8195-pinctrl.yaml      |  2 +-
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml      |  4 +-
 .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml |  4 +-
 .../bindings/pinctrl/qcom,maili-tlmm.yaml     |  4 +-
 .../bindings/pinctrl/semtech,sx1501q.yaml     |  4 +-
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 46 ++++++++---------
 11 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
index 98c310a3c63c..1c09c0fd4930 100644
--- a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
@@ -108,32 +108,32 @@ examples:
         #size-cells = <0>;
 
         aw9523: gpio-expander@58 {
-                compatible = "awinic,aw9523-pinctrl";
-                reg = <0x58>;
-                interrupt-parent = <&tlmm>;
-                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 16>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+            compatible = "awinic,aw9523-pinctrl";
+            reg = <0x58>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&tlmm 0 0 16>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 
-                keyboard-matrix-col-pins {
-                        pins = "gpio8", "gpio9", "gpio10", "gpio11",
-                               "gpio12", "gpio13", "gpio14", "gpio15";
-                        function = "gpio";
-                        input-disable;
-                        output-low;
-                };
+            keyboard-matrix-col-pins {
+                pins = "gpio8", "gpio9", "gpio10", "gpio11",
+                       "gpio12", "gpio13", "gpio14", "gpio15";
+                function = "gpio";
+                input-disable;
+                output-low;
+            };
 
-                keyboard-matrix-row-pins {
-                        pins = "gpio0", "gpio1", "gpio2", "gpio3",
-                               "gpio4", "gpio5", "gpio6", "gpio7";
-                        function = "gpio";
-                        bias-pull-up;
-                        drive-open-drain;
-                        input-enable;
-                };
+            keyboard-matrix-row-pins {
+                pins = "gpio0", "gpio1", "gpio2", "gpio3",
+                       "gpio4", "gpio5", "gpio6", "gpio7";
+                function = "gpio";
+                bias-pull-up;
+                drive-open-drain;
+                input-enable;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
index 8ed53496c386..4ab1f00775cc 100644
--- a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -86,6 +86,6 @@ examples:
                 pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
                 bias-pull-up;
                 drive-strength = <8>;
-           };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
index 948160cfbc5f..7275215918bb 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
@@ -106,8 +106,8 @@ examples:
       fsl,input-sel = <&iomuxc>;
 
       pinctrl_gpio_lpsr: gpio1-grp {
-          fsl,pins =
-            <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
-            <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
-        };
+        fsl,pins =
+          <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
+          <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
+      };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
index 1144ca2896e3..96c405711f65 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
@@ -64,13 +64,13 @@ examples:
         reg = <0xe2880000 0x100000>;
 
         uart0-pins {
-             pins = <64>, /* UART_RX0 */
-                    <65>; /* UART_TX0 */
-             function = "CONSOLE_UART0";
-             pinmux = <1>,
-                      <1>;
-             groups = "CONSOLE_UART0";
-          };
+            pins = <64>, /* UART_RX0 */
+                   <65>; /* UART_TX0 */
+            function = "CONSOLE_UART0";
+            pinmux = <1>,
+                     <1>;
+            groups = "CONSOLE_UART0";
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 3db2438fadc7..4bcee7741fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -221,8 +221,8 @@ examples:
 
             i2c0_pins_a: i2c0-pins {
                 pins1 {
-                  pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
-                           <PINMUX_GPIO49__FUNC_SDA5>;
+                    pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
+                             <PINMUX_GPIO49__FUNC_SDA5>;
                     mediatek,pull-up-adv = <3>;
                     drive-strength-microamp = <1000>;
                 };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index 33cb71775db9..0bcafa78acb2 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -234,7 +234,7 @@ examples:
   - |
     #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #
+
     pio: pinctrl@10005000 {
       compatible = "mediatek,mt8195-pinctrl";
       reg = <0x10005000 0x1000>,
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
index 3b3961789860..2b1354e212e5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
@@ -113,8 +113,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
index 53534a07a1f0..ea7d4768483d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
@@ -120,8 +120,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
index 64fe90b2391b..a0b56adb3388 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
@@ -113,8 +113,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
index 39d7dad3313b..f7a7551d7f50 100644
--- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
@@ -244,8 +244,8 @@ examples:
             interrupt-controller;
 
             gpio1-cfg {
-                  pins = "gpio1";
-                  bias-pull-up;
+                pins = "gpio1";
+                bias-pull-up;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
index ce66fd15ff9c..300d38f87f2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -317,37 +317,37 @@ examples:
     #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
     zynqmp_firmware: zynqmp-firmware {
         pinctrl0: pinctrl {
-          compatible = "xlnx,zynqmp-pinctrl";
+            compatible = "xlnx,zynqmp-pinctrl";
 
-          pinctrl_uart1_default: uart1-default {
-             mux {
-                 groups = "uart0_4_grp", "uart0_5_grp";
-                 function = "uart0";
-             };
+            pinctrl_uart1_default: uart1-default {
+                mux {
+                    groups = "uart0_4_grp", "uart0_5_grp";
+                    function = "uart0";
+                };
 
-             conf {
-                groups = "uart0_4_grp";
-                slew-rate = <SLEW_RATE_SLOW>;
-                power-source = <IO_STANDARD_LVCMOS18>;
-             };
+                conf {
+                    groups = "uart0_4_grp";
+                    slew-rate = <SLEW_RATE_SLOW>;
+                    power-source = <IO_STANDARD_LVCMOS18>;
+                };
 
-             conf-rx {
-                pins = "MIO18";
-                bias-pull-up;
-             };
+                conf-rx {
+                    pins = "MIO18";
+                    bias-pull-up;
+                };
 
-             conf-tx {
-                pins = "MIO19";
-                bias-disable;
-                input-schmitt-disable;
-             };
-          };
+                conf-tx {
+                    pins = "MIO19";
+                    bias-disable;
+                    input-schmitt-disable;
+                };
+            };
         };
     };
 
     uart1 {
-         pinctrl-names = "default";
-         pinctrl-0 = <&pinctrl_uart1_default>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart1_default>;
     };
 
 ...
-- 
2.53.0


