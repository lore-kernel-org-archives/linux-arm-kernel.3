Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE7FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=; b=vJORwGXjkoAykWA8omHH3wr6W0
	LaqPzsIh0xEUyCY3Iix9LPsF885we1OI0vofq+IcsgIGRkEc8lLAfHqewGAbzta4laiwBaR0nU4FH
	/3KptdYQ5swzduQOG2inPSBhRk7OdDyz/Pr4j6AvFzszJ5tDAZ7kxTVY4mWMcUEb373lequ1k6TS3
	FEK4wqrS3COgHIp+h+KyH15PsDnQDZmFibjPqs2z95R6IzWffYuIstH/my6WiGNq+O1XVlT4X64pS
	gznUeLz0Q0bkIBgHXFXtj4EOlGQv+2k2IJQnbkSmdWxxS8Ancg0RPb/GBNJga0sNK0rl2AA0mphBZ
	II3yG1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAAy-0000000ERJg-1jO4;
	Mon, 29 Jun 2026 11:29:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAAv-0000000ERGK-3NAR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:29:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATSjM2592837
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 11:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=; b=mDoLn51y1+n9c+LX
	/uFOfzjryd4fR2ExPRPOfIXZtNSwDJNcyTOtjbzWDTOZBWMyugD7sJkoSPvrB5wO
	8kXIBQcn49GjQUL+q/jVdB1CkwqtGpIkW2ioZH71DFlDTpdZKhNCYR1kCIGtyzwE
	pMSK85M4O/Mw2GX3aVt5CKlkTbELhbsWp2ImFRXJhp2LSD9byS7BWFnATmxMfTGa
	RwrbnX/+nM70popR69Ac+CjBKdodkaOi51fWAtTFemCDx/MMiUJNTdnveuoDzzfY
	orBZ8QQ2KEsVOfVmmZzIeSKiXpQJnzmPWJPiwlSy0q1LeslTDLK1pNNaBCHdMp6N
	Fise9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhddd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 11:29:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55f0613cso95952385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732556; x=1783337356; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=;
        b=MdIrSKG2944E2RcG5kHRNwZZh6HXdX7DvYfGZaniW90wQ7Whh70YNhq/F34uB78/9B
         QHDMeCAhnk2YxAA3tt01uZc1xQaNPWDDL+TCIMyEb1djjpne5eI2XsfQxMjuuG581306
         t7qqduR+oIjmQCHlJL8PxymOxwn19Da6pZa+AHme9VycflkTPelAm2g777Fnjyrmotco
         xMYv1C7RbNgSlL8Uhm7OY1MEBBD0ZehiKyHWC0KJqkJsazushtZzR2sBUJgz9sHVVrsN
         3+aBFdnTvitsoe+D6c6Dx08LjZIlFUd2BvL6uL7r2icZLnXqFpszko7vKDlNroUwTpUA
         loUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732556; x=1783337356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=;
        b=R5OTUH4O0Tdeg4NtyXnlf0k8qFFLK/4tJryJVyA2oVzOZo61UCkPK3MFuF+xQk66GT
         y4DUwGriJMMJ/4Sf0i+cSP2iQa9BjgL/NMv3E5QeBDZR8vmcK3GeMwBhXDI9xVTrvlHM
         MnY2kFUFcYIk3v+p74Hdj6sQjiaxu7a0woITot0Gi1kFJM7tNJXlayHdHATYqAiBR+A4
         vEJpjnpVXigJYhTvGA6UCeZ+WcfOVvUBYhzWP5Pn4djpruWqAGSGnwInG8sSem92PgHT
         TZo6NBirtlifCtMP+JJjJC4pV/4nCtfZw3owzpmiUEOXOeX906udhD2BsvZgY0KOdEhN
         4ztg==
X-Forwarded-Encrypted: i=1; AFNElJ+KELpA858zeLj3/wcotn23B7NlnwLn0I1IditKFrXI7s1SyYgLKDR3RJRfZIjVqL6hPXjqyF8uh+BkzJ6BuwXB@lists.infradead.org
X-Gm-Message-State: AOJu0YzGhsygsZD5H47r9X3MvFrMVlAZbUqJ8e8xM/321bT72pExwIrE
	OW1GW3Zt75vhoSOTqS0i6YkuCWvVo58Ihp2bbtUsH0k3eTFkLGs9FOyHNfJSkT18fXyknE6PgR5
	j4zTQMQzfQsGWKNXikUotwoQoGIgBkQCeGOdW8tGDaNF5f8blCVSt3F4o93PTwRvc1aCB/ckruq
	eWsQ==
X-Gm-Gg: AfdE7cmTxWUWr05Qv1KFXSKleNXJlNvEvWVXngDPzM/eQ6o7IwR/fQAl42q0PjXEW1B
	wWEvqCD5juU0zimsNHyRG3+8w3SKBGV9KV8v5pKHEMQozQrMA/iRcgZqYkmd44hVb5/5H8TViqq
	2fk+HFGYCHxySYKMgJ98omcb89dku3a0vscZ8ub4vgAZo1Bk+apVtaVqDiOAidZcJjZj4BqxHl3
	26Sy1VW7NqwM22jXsM4Cxl+3iyP/807PA3YFdoLI3FM6JBWeu6/3jFHE12MooJQIQfzxn8h/xNo
	mDMJLR6SsWXKD/baB60M0N2xZhrYza4JM7noPi/piGSvfeWhQf2HAQakAFowobpFDXg5S30lNLw
	VT8LKUwRUmJpWh8iMgdhJ1ev+GMi3CTp7efMVSBA5
X-Received: by 2002:a05:620a:8811:b0:92e:4613:5b0b with SMTP id af79cd13be357-92e5f3e9a4fmr49742085a.68.1782732556125;
        Mon, 29 Jun 2026 04:29:16 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:92e:4613:5b0b with SMTP id af79cd13be357-92e5f3e9a4fmr49734185a.68.1782732555518;
        Mon, 29 Jun 2026 04:29:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:47 +0200
Subject: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes PHY
 on sa8255p
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OFyFIYba4yDJjHIOFWWcs6aVl9zR1OAh6XyBHH3ICVs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlb9/FP9ORrwIL+ZXHhc4b/L5Vtd7JbT7/lyW
 6CTLAJxkTeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJW/QAKCRAFnS7L/zaE
 w9DkD/9MZJRrtOsV5vLrh1qrBZUZqJ2J9P8RRMHcXW1H6bhugDvmWsApILNySh2JSvj/F75OBxe
 G/pjESTF0lriIWKZ0+AMeTHCvhTp+m41R1GmLxCqFVKAicTOXqKmgAiffSSBkBqVaNeeWlZ83sL
 6GLB1/MvboM7lOBK7c0kM+Q7W6L8mYDjhKMDrJEu7SJ1Gm/CeG71rEWMC0nrlutq+IMg3Fsl+KG
 8oQVK/BqD00erY7V6zhduQycUgvTDvlMrA0LVCGZNDD58EYhNTWUaP82QxlIZImo2D/QXFZFCWW
 NHk7KncIU8gjJxo2AlVAsVSl15s0QPL6iEtQ2YDugZyToITAyww/uLfUjzoOJg7EP2xGDBFXiER
 m6HrIZtcTkiRst6J6Ye1inXnGCTLjybVyT9FiqyYAwhW6xCKZHJz+X0xI7shjpvTJoAohGVbt2m
 X7d4hOW9l6tZi9IOCcLymOb51eOmK1TsCByx/q4A/HjihTwQmy5VsGv+TDW+zC23d9w5iqz4CuE
 MpNFlr7NUEUqgqmDh0hR/C8xQldgjn2QV+bMmIoIGn9M+Sb5UU88qOIgcXi4/Q4J7jR4tDnlzED
 7Mp0XiPmZaXaouKbY2axFMyY3y6MveKZQ0lVz3KLZgmiVOQKTmYQEgOXDbZt1cXRgf5FBbKnTMI
 DRZ6xiS1vJOJEXw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: YSe2uSpQ1JQjzHOjBRpJXV6riTdpIgVI
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a42570c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX1pUXLfxPp5Qz
 LRAF6zmJsdFZk8Hc+XbQMUWKPHFdFkR69g6kqrsB2uEMqoTORQV5qbloApjKlsJ+InAp6BC/HoW
 c/X9eKPf5vk7uZI3cDMXoyrKkl3uTR8=
X-Proofpoint-ORIG-GUID: YSe2uSpQ1JQjzHOjBRpJXV6riTdpIgVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX2Nw8hKPxyBsF
 S4szz7KBOHKchPYvDWD2FHF5/DRQ3S3G81TxPCxkFLcpmBWLjWGopfSZOmrRbaDF+7iraSYHQvG
 UnLd43Xefgv9c4MihOX2aKb8aDa56vNcuvfLt9txoe2f41V9BkblfGQdt7iHiwHnv4O2BeciI58
 fkpj4CZfT74IjOqTaUTE9HkT9yKZ24nsAeN0MUOFjdW9flVe6xtpoWFJdnGqHX90Fff788mxq0D
 DeOEzafX0W3W0d7gyjrgXlpf9KNTZ5iyOrm40QGIfv96+zoryulAGaAH6pz8XIgtriienRquNB/
 n/Zz2tRshBom/FSsFmr5PcPrWwL6NkuzIJig07am8dFL+uowRpAhP/BA4h5I9Jy0OHwdykckSyv
 1JsUH4FhRFhJEMiUFkh3oM8cV2lw23eougpqwZqR5XO+1xt1m5lzoiKZw+Z2hViw0Kp798czKLD
 tvL3/dekdBn7NsPVnMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_042917_972886_139AE904 
X-CRM114-Status: GOOD (  15.45  )
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

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4cea6926d1c28872ea7b7aad53088dbbcb74fa99
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    items:
+      - const: serdes
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3


