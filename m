Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107F5C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgXStR+vrHgH+n0Bt1NFXqO8qrllnjEuPJHIAOPIUpw=; b=0YkNCv6Am+ni4Bz8DTLYCAo7VH
	bCgAGgQLoRrfvl3GB9D6cLw/saANHtMyj1f4dtbqnihAxKJ8Y3lkusN6JEkCbdj/qW2InA/x9O2bx
	TwC8Dh63RAmczohMt2YHJB5DNVYt0AdGj0+YyZ6laPdpKgU/+4k5z2wPoHO9ajRNqmRV+VCH8VvM6
	9kAbYnwRf17ZhQCG352gdtHlBTVfjBCQht1QjsACgBb7SiWf6EzaN5hON4UsHwaPW+qVQxwM+yJuU
	7rc20Iaka0mHWZzT4M3/jCqLXcM0bza1EZih/4s88XK39cEPAq7kJT64+sTXZiefmyiVUb1EBZM96
	dhT5hbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQ1-0000000CBV8-2HLW;
	Mon, 06 Jul 2026 10:19:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPt-0000000CBOE-2E96
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:19:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693oJL107352
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fgXStR+vrHg
	H+n0Bt1NFXqO8qrllnjEuPJHIAOPIUpw=; b=OFJH5U3vvFjWF6hZRx2e97djNWN
	Rn/l1VIlrW/cARn69daqiSxg0BiFIj3VC8pdb18FGZ/3W1jRg+S4C8SDt7i94E6X
	AxCoivChfvFGk58qIrX/rP7WkUL2PGJ0ivyAug+o0gskZzyPuPe8UKkDZhPkb7sV
	/gt1M8BmtYTi58oKxXqEiG47Oa2PPbKtWObDpPuceQgXchlx9db90ikEBP41FUFd
	eb4lFu7w3uKSLaL/165Vivvw9ETLD3QU8+Ff+zzLQ+LJMuYbNqpPh4Y/mLGGaUpA
	Q+eWy5kBhZMrMiaWLl2Yp/di3NuevSCVsjhb+8AR3aoRFrnueiIcQFbf+fA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urcm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:19:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5939so280261285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333148; x=1783937948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgXStR+vrHgH+n0Bt1NFXqO8qrllnjEuPJHIAOPIUpw=;
        b=B3yJSg+V3uVQUHGX3mrh3/qISQM0odKw+tUXTYmRB4IuT1fiak13q5M46CTFI30at1
         KVSv/vn8JQ6ftBENOXiHaENPTHDW867niOwHbUurtJtzdyEq2dntbAXy/yoftr6Qzpxk
         IusybVHIhUCWWFE5VEUe2x8TCIjPVLtFbuU9sl/1P02VUNi6mcihQlBs4WNd/81H5TMH
         LuwyMJzd5xQGv4VbZP+freERvQGP+4L0hVUG6fKoC015R9+M+NLHe4KvYINdcV1ADm2o
         1HGoXkdMbZKkJ1IclrdlklxbT4x2w00C5x1YBLpwItrgPFHLCofz5/SPikfxfF9E96lf
         a72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333148; x=1783937948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgXStR+vrHgH+n0Bt1NFXqO8qrllnjEuPJHIAOPIUpw=;
        b=sQnu7+tdwFz3iY66que5X3jYYu+nkf/wXc4Z6A1qBwfDTrohrj3J2aK2wQyR6l/ZW8
         rBBXy4kuATK9OiVOIQi2UcFJWzu0eVUm7/myYIJ8k9EtapA2H42vx4ByQhyxe/py3sRy
         Yan6FsC3Cf7W9BfqC7jN8z2RLpiqHyJQXmMuW4rmEm73WLAZjKwqr89VTi/9fNKuu57i
         dlu3We+QfCVM3JyN0vXFFt5mgyE5M7I8ctThN3oehN2ZXiNcsjSxfhaMoHGlp0kPNvUc
         SAKRParOHVOmS4IRYVeOLZIgNco0FKgWFp0i3fnmygH01S94wN41t+l5aROf1f5SyMqY
         3d1A==
X-Forwarded-Encrypted: i=1; AHgh+RqSoiry/2SV97/b2NJSuJOe+pJG00klRStlUhODJqOcbx/qUxXnglt5xk07A/UatuRbOgumDTACbiaKyNWDoTxS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz38o/1A0ZrGnH6fwdzNbEeDHL38V8J0NlAEWVTjgdwJs2D65lB
	LgV6alV6ksF8sA/XT5IA2UPmHE+fbOInbRsNWflx74BiaC2AqCSRouLepxheSCcZHYb8v86fUHU
	QKb92EVWJEgQgy1EmoF0HDJQvrRC5FOMbOlR3Xmf7qfTz9t6t6YY8lvCzpF82kFWcN833Fz3LID
	yGHA==
X-Gm-Gg: AfdE7cklYu8B37gVhIjjVpsXOTDFlw2OBZYazF1WNFw67Fs4YqfoWhDpYNYdlqTNnpQ
	xC+cGYipyjfqGjjHANDvSbDHsA4bFxKqmeDowiPT8BhovXRC/JtTHa9BtydaATGyAIeUJGSCQKv
	OW6/vp4zLTCZNtoSMjn11OIlQK9m8uKCYZQJr/AsmTfZJ4V3DhMuouq56HCrdPsboeQ4gSycG0R
	gOmicARpesxTzAPXZJ4oe8z2C70Vke/pbyyEy6TbHAeTVXo8Qf1x+M7wVV16dDmkL9epJWq4Ofe
	r3XwJwWZDeejAVh6hhAHCdw0ZM0UFhF9Ska1ha6adr75Qa0q4Ptln7HxDID+1L7h7hU3A/yOiCl
	6gcYDKv1hdUPk+NIbfDInV6W7uQc=
X-Received: by 2002:a05:620a:2688:b0:92a:f65e:1e9c with SMTP id af79cd13be357-92e9a3a3b75mr1272221685a.19.1783333148076;
        Mon, 06 Jul 2026 03:19:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92a:f65e:1e9c with SMTP id af79cd13be357-92e9a3a3b75mr1272218485a.19.1783333147587;
        Mon, 06 Jul 2026 03:19:07 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24506340f8f.37.2026.07.06.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:06 -0700 (PDT)
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
Subject: [PATCH 2/3] ARM: dts: marvell: kirkwood: Correct indentation
Date: Mon,  6 Jul 2026 12:19:01 +0200
Message-ID: <20260706101859.341467-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=bYoP10yD5TtlArmXIdJE3yshVzCGxEq/GLpJ2Rh3E7c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EUN//Zb8I5JBUxojN/tnkKR4SWdHURL+dU9
 +WXkrSGYcCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBFAAKCRDBN2bmhouD
 18E/D/0SafbQ1hWPoh8kl9eJF3apmFTOgtNaIStYFKiirpN368l9jvbAYgWQq+juiuxy2EDw5dc
 FLiLktlb1S3eF1aI+jMdop2F6wFk1qhu3dZZbTgYdGQ2WioG+GVI48H1LUUM+VVsyAuj+8/sDk/
 gT6E3H+V9evgSX/mCAcijoVw04/HCVvolbwwJenAPVd48no8pN85d0iq0jzY+LW/O5D/U+i/aaq
 0UKPik0XGMW5mBecoMAF25o9mxkxIndokc3xLvPZyza0+aJRrwcH00JTjoIwJ3BUcbNnICM7ZfW
 5yx4QaMeW2cHhc/G+lDysZk5aBrn4naNDbPeDcZodmZzCuS9GDwcL+2zjCUQYcjK3F4zPpWXZvu
 no2YhYAqy6xHlkxUcvg8OuXtoOYKIFimHc4iK1MELci4DnA2mIb7ze0i2t0EGt9DZXhGdLuDkeN
 YrAAN4D1ROcHgpR/rzabkMyStZgVC7O4Tk5rEg4YAj/s27IdK+R1IzKiGLjsnaH18HhVRmB+Vsm
 J2nNe9HoXtkDF+3FkC4YRkFYGyeaFRJMRFUhaTiMMmmvsENIh6l3nAfEhsW7WwzkqE+ryIAxuQj
 vBtx3DV9v2TWsj/Ry7M4REjXvtTWukn0q3+nEuM9LPbopAmc4jPibugA6yFI5dbpA/vF5MHgHp7 7MVmtqB1os3q8hg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: POEUtkR4oKmrgVxq8B1iVytKjqVoK-2z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX9JxI03r3cNSi
 x9ksB1K56x54rEsvW4+eXWLCTzSsdeua9mxMuDdSg1HgiciikN58HbTjAxzSNg27PSB4DUrDo2Y
 eCLShFrAk0KgBdDigCcrWQNKtbVxIZM=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b811c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yCPzjt8dSLUH7PgGldcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX0HALTVjUHV9e
 tQGPcdAFO9HxbenzWFG42lAK65UnI8Te30KjVKN0bJF099RCVxSxaHUApE/giWMozHl7lp41wmG
 xGIiNSFPk67zDpYlmre8rIkAsXu8cCv+YFFjuSWUxEKzNKBf7LJyI/9DK/Y7IEDPz0IvUgrHCsx
 ayrXkLTgX4qUJNyuFDmZUSm+snik48vZpA509twkp6jZbOra70GxsICkZCqlz/0TGRxxz71xaIM
 ezQ+pqRuoxIJh84bxM6JPA1nK92c1InOt3LZzoCWbYd+235vnUEkNlvbbWZjzGQjVKHJOKDMyDZ
 M76kvV4oPXJDHNeGXPpOCym9fp10eLf9RJRRjxb6zF2MLNyMZxUouLI1q7v9rN9pSGT5dRncV97
 O3ovUZoOcZ4AWqcJFJmX1J9borJls7NFEgNFMxQUPZWF8F2WC0a84CkOugUyVD2wgMpWcSLnxKP
 +n2H0F8C3h+qot7Wqhg==
X-Proofpoint-ORIG-GUID: POEUtkR4oKmrgVxq8B1iVytKjqVoK-2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031909_594863_16CD34EC 
X-CRM114-Status: GOOD (  15.89  )
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
---
 arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi             | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts           | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts           | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi                  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

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


