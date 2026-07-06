Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C219C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2sllh4lJbEP3/nEKCxSWbGIu2PpVIeF6y7kzzDO0J4=; b=H7MM7jGtcGdORXr61GWbkIu6+v
	Mc2IoCAzpaiLqwCJyeFWWOJnFcTeDHYFCVIwOAJNp7LjPw4WqWPVbo8tGuyr0SWpSXyOysnA2O1Up
	nWMVrNknVAjlL0UP5Bti8LDMhHpqtSNJHzTkpRRCYj8Kicpd8bYGxLiqSFqfgiGQOGXLrippr5IM7
	wINnicOspOIWkwyg1UeMqCtuOZPMTD4kVYHcnYknpvtVyckxnIMWLI5TUa9P+yT18Bu2FNAqQIevb
	/4s936ZSywGijdi/IWhLVtMoHm1FZZN+k7GUFT1PKGVYE6tMplAdBrCchl/my3mtQimjkxwhqY8Xw
	Pu46usUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnff-0000000DI17-2k3k;
	Mon, 06 Jul 2026 18:03:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnfb-0000000DHyi-0wAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:03:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBfr982547
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 18:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F2sllh4lJbE
	P3/nEKCxSWbGIu2PpVIeF6y7kzzDO0J4=; b=VKYMCFWeEgCeNmxSB33MvYU6UXv
	St1vQcpCUmOH/CZqTGRdU+F/+XX5si2c4aJa9TxYIMlld1bZR3KSK56ZHF+SJXoD
	kKZAgJCV8G2MxFYtgy6XxYhrmqmsoUuLbL4cMs4HigUOtpV+/OreafKwO5Ih92wf
	46NlYHYLFwppFBLI4+vvqWPFn4hYpCiB2vfeSeyqqklbEy6kom2LPg+X1FCv9CKK
	aHrnXz5ZVMwxzQNP9yZ0uzF0kBpkGib0zY8WqidtLVwJSJXI6f4zPnMz5t2Nwwjw
	0yZ6rZd/PB555UpiBXd7dxmHepHaPDcHrOL+Opf6AVejDqU1kSUOtiJR/BQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjas7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 18:03:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5be258eaf60so2752557e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361030; x=1783965830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2sllh4lJbEP3/nEKCxSWbGIu2PpVIeF6y7kzzDO0J4=;
        b=V5DlprA7zhmgIT+sU1yZ11f/4oYEWPW34c+5lyPU9Ek8VdE1D7hzxOqOUmgBcshwPN
         D5ivba0/xPMICp1OArpI/5i2i55AMdEdfyuETwhlcU/uluI/MUfuJHmZ2Sn3V00EiK3V
         TkAjbBqUX5bScqq/kqduFNfQl2ZQlr4gyxYi+T6P/Sy+q+/OcCkPjNxhUUtLox6xxC36
         pmI5UV2OBozHUExhbv0wdxpStjXjlHu7eIF7R18A8jMM4y6jn158MC4hNJiyNYzYbRRq
         dIDAI3nFdQm6/D+nY5S2/7apxj7MDSsijM92B7xEuf/s5CJVOyh/WVviGgA7+0vlj2iQ
         DEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361030; x=1783965830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2sllh4lJbEP3/nEKCxSWbGIu2PpVIeF6y7kzzDO0J4=;
        b=pvYafzYP4OvaViRwA0ANiGIZ+tWVTpw1Oz6laUjy6IQnSpnxZZ0W22o6Oo/RQ5rBbc
         p9ADUY8z7XdGHbhGsOXPAO3LLkqKt1+DWMoVa0O1RG87D/NIBkJB8ehrKM994s15+7nl
         XFqgrzqUsoS+x6IX7zjj+P9q1qdHDSJ9eaRLQ0YIZQ4WYWbXfXRqNU3NVeS8w/9nK5cc
         T4BSwCz+2NnHy7CNhBll3umtRLLOWoo1cP2sF9SmdvVdSjh/ocHmPBsqubCaf79CEyVQ
         QPjDK84aSw4kPEVp43Wnjw11nXfyFwM6W2RmhPrn+yuyB1X7nhvlyBeZbDo3UtCeu6RJ
         xRTg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5lrVxD3uD8+bygVLUsJwf2nvbRIj2oXU1HqD2JBgiQHc+FJF713+xyBpoKBz1EjRri4ZyibQO8bxWt4xCXMHR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2i85OQ3Xbr0W6d1BneYnqLy4gH/gRAmMcNMrJB0OI0ur67tmb
	rB26Go4HeIztR5EfOFEFCpnkFJckNOyLQzC1muaKFjh1c9kJrXRgmcU4RfAJlsm/rFUaE7MxYH1
	eTwsJk5JzHFiSNZ+grll4S6K13Ta00Fui6hfQgnPsA7YtNkfmrNhbc4Xnbrpj7NJhCZjEj0qFsK
	jVPsDJh28yoA==
X-Gm-Gg: AfdE7cn37TbkqY2wd2eEiFrxQ5YwJL4z+p4ZrXBEtyJVvPUYRfxGzCzHjKK0DflTnWc
	GFwrv6IKbr5KuFP8XvGzcvzrjqf5DQ5c6IJfCnjUVJUbIpzm650s8mrd8ZUbL0GEsEFr5pzPi4g
	/4U+7TQJNtMvylTJCQAiK8AdodIcJ0q/gbGfV/vI2TkRxg+WCe9uAzHioLHueHF0oxE0VcG8uFf
	PwBxbnO1fnsdoB0pq23uj/kmugqDKcL8i1FsYP3tKfvngUEHQBNSZGByhbJIRAzzZXDkU4xW0Zt
	wsEb3syXWBE+3ulpb7d9UtFWIDkf8uRoDJmqQ1FdJyVU9UXJSkiqwAZtfXpv7SK33Zrh8SlV3yk
	AxYWcgK/rhpsTKi5MUOMZ5B1+NI0=
X-Received: by 2002:a05:6122:c81:b0:5bd:881c:f68e with SMTP id 71dfb90a1353d-5be9085dd0cmr978768e0c.9.1783361029449;
        Mon, 06 Jul 2026 11:03:49 -0700 (PDT)
X-Received: by 2002:a05:6122:c81:b0:5bd:881c:f68e with SMTP id 71dfb90a1353d-5be9085dd0cmr978737e0c.9.1783361028866;
        Mon, 06 Jul 2026 11:03:48 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e00b769asm1108555e9.14.2026.07.06.11.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:03:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] ARM: dts: marvell: kirkwood: Correct indentation
Date: Mon,  6 Jul 2026 20:03:35 +0200
Message-ID: <20260706180333.648401-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3711; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ZKpgfZBQLfz9wvo5mMdQIlagv8p64x3j95+GYzrm8Dw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+32VdOiKKUjdq7GpUdx7unld1+YxOx7cHIuh
 CB+2OFKC4WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvt9gAKCRDBN2bmhouD
 16tID/wND8S7RCU/r7YQ/z5fBLm9rk1UF0bDk/pV9C9wsHN+R6pXKvWBip1y/02bPDN1MfA05uu
 kRGSnkQuraivWeuA+wuEVp5J8b7nlyg+NVNpg8l6aSWch+VA0jUKmOooIcllt+sIDoM3E6OmCze
 efppVTFjCt+4OIyqC/ePeDYlwU8Zba+YPOB3eUJGPz841Ie8DSg7tNNY//AQ1P6sks617Q7GHuf
 KW+q3VvuN/SGUjeHGe33wiC3efu7Uv4lCrYl21PCPfIL4vb0RokSSKJhB9lkAH1teL9iNp+mskh
 yOo+iVBtzvpxb/WrHXMeuvBrmvJ9IDtUfPr/nnGfvGg586RWP+3/Gp9+TfH1N0PbdX8NZomz4IG
 vXU6Uhif9qWwlQbpyxKrDwCOQOJvusyFVkCxka/nuEf3Gz62np0hYpSmRfGsMZwHIJOk9G+XHQs
 RzHb8DViz5AMF06qpTaiF4bYpBISBx9iDIrqZZi6jlO+FrpuanmNEBq+dBnY3mD9G/h3GzLbKqf
 T5QvzI1ImDXmi4chdLEdD2dLxWmpOrOvXWb93jmYjKxrn4bGlWGXLVzgBp4obUkb+P9GcEhOy0S
 tLyx3q+fvJIM8OzfA3yYJ2uWhhAlRnFs/FsJydha6cxKH/rDuGYZX2NP2rDcLHEroK0syJcocCD 3iRxRsofaYHTGiQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bee06 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=HDDCt-YyP8Bx8sG_SwoA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 9ufh8QlQZ2Ma3JXu7zanrdOnN2DQH0Qf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX/Qe+MAcEGD0y
 EKq+pEq9WAeCv9ukR1wtDYu2HTN/YgEgPX0Ayv3peKEA4MS4hoWOELK+NKgvD85DWeKD7C6K+Dj
 FwmMLw4yaSPYqMTkgaEXeuvCqNmBVB4xN8auEQVZvHHuq/a2rNdEALgQuDRcG2EDIUD+eWvhfqn
 uzN/W6ChuYBHfX0fW+sps17J3Rm/HxCrOi1F4LVgdPtkvwFQ4fEPWViwbXeBYwQMAnECwdYuBTo
 ogETLHdtf8H+8Ys+NY9gNDBtD/Bs/m+/NhrqSsxDfNYg6qB05na6KpXuLSrIA+TQPd5sABNL5pI
 cAD1f2NzhX0x6i0w2fEUETEtq4IRkqmqMEnMHWsSjnLN6R1kcq5rFfwI8UA4ftBgx8mfTe/ajUk
 vvYLWPEdak753jmIWex0PPr4LFqeub1pyeBzFoP/b3QwMk0qFoKBwe57FID3aehSMzGB4FbNj8n
 NDgrttwbLj+vPJx4wOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfXwDTQGE9A8+G2
 PEDcTPJ+w5VWj4+Q10MLC3G2gAkxmzf+MDEZcBQEbv+wM09XSZOioH2dWnFm+ebrZ8lwAd6OQ9V
 V5EHZHfi2nOkwoMqNn2fb5Lp5z6rxio=
X-Proofpoint-GUID: 9ufh8QlQZ2Ma3JXu7zanrdOnN2DQH0Qf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_110352_521272_319BF1CA 
X-CRM114-Status: GOOD (  17.45  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).

Changes in v2:
1. One more fix in arch/arm/boot/dts/marvell/kirkwood-b3.dts
---
 arch/arm/boot/dts/marvell/kirkwood-b3.dts                     | 4 ++--
 .../arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi            | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts          | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts          | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi                 | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-b3.dts b/arch/arm/boot/dts/marvell/kirkwood-b3.dts
index 681343c1357a..9d5cc1689864 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-b3.dts
@@ -94,10 +94,10 @@ i2c@11000 {
 
 		serial@12000 {
 			/* Internal on test pins, 3.3v TTL
-		 	 * UART0_RX = Testpoint 65
+			 * UART0_RX = Testpoint 65
 			 * UART0_TX = Testpoint 66
 			 * See the Excito Wiki for more details.
-		 	 */
+			 */
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
index cb564c3bcdc4..a9adb777c7a0 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
@@ -239,7 +239,7 @@ ethernet0-port@0 {
 };
 
 &pciec {
-        status = "okay";
+	status = "okay";
 };
 
 &pcie0 {
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi b/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi
index d6b615cf6390..121d84609f20 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi
@@ -83,7 +83,7 @@ &mdio {
 	status = "okay";
 
 	ethphy0: ethernet-phy@X {
-                /* overwrite reg property in board file */
+		/* overwrite reg property in board file */
 	};
 };
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
index 20c6290d2037..82ccc6feaf3c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
@@ -109,7 +109,7 @@ led-yellow {
 			label = "obsa6:yellow:stat";
 			gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
 		};
-        };
+	};
 
 	gpio_keys {
 		compatible = "gpio-keys";
diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
index 2bc4b68bd723..ff08b01434bf 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
@@ -130,7 +130,7 @@ led-yellow {
 			label = "obsa7:yellow:stat";
 			gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
 		};
-        };
+	};
 
 	gpio_keys {
 		compatible = "gpio-keys";
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi b/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi
index f136059607b7..6c15e9257de3 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi
@@ -57,7 +57,7 @@ &mdio {
 
 	ethphy1: ethernet-phy@1 {
 		device_type = "ethernet-phy";
-                /* overwrite reg property in board file */
+		/* overwrite reg property in board file */
 	};
 };
 
-- 
2.53.0


