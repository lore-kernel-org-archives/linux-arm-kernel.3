Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDCDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WnYM2Khp6OMHAwZzqvl0rBtn/mMDowuM3l5URj9PLxk=; b=mBAKg2z38VxYcEsY4bAjORCJNd
	zfx7kYHCqOv8waNbxRHoUKTzzuYtqYONHf9XHn+0SGVXKl7NasQpNnL4A3l5WfIpS7VyZ/kOociVA
	QSAfs6L+8tlCmlgSD7blgAi96cc9FC/ryfRrZlwEXpFmFI4rpSQP71kaUTUDPVR9nDdpmZmNtOl5r
	X48Saz/LwS/XosrfAPk3tXAfu7xdU3OK5LIK1OpqcI2+6idRMAA9mel4sI03RG0bYxtyz44PxUSMO
	hddVPKuq9XM66RSNuLJN9aJ0N39sGYqQT2uZ9RVzY7Yu2hhALYs0FCFhzf+cqLjSM/1ecfECsi6Ah
	PKye9njw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQS-0000000CBph-2Hxf;
	Mon, 06 Jul 2026 10:19:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQM-0000000CBjd-0dSx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:19:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669H0A2160102
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WnYM2Khp6OMHAwZzqvl0rBtn/mMDowuM3l5
	URj9PLxk=; b=h9Rzf1dzATzkzVID+03XZlRJH/6EdzozbSf+FVhvyQ8mVxE9GKp
	R3RIrYl/g91EcSOZ06PUCNTGlfasdki4QNh6vjgcQKUY3mBsl9xMbuUG/+nYZmrw
	etEHIwEOQoL+x1pYAGZZPjmva1Dos8j8cHWwp/bj3giYqoI/RwBNJE5QXQXxUVa2
	OEOOCmmItOWuqGD3ZytWHua4xje9IuxAHMUS/RUSn0ppuc7pAL0M+P6aYgDKLOMl
	i9rjBCFM1an6ZP9t7HVPjlEwpeJbOF1RReL4HVwXyk1Vq+ik1Cq4dwUVedsSHk9J
	gzfgTDrXpaomzYW2sZKFaLF6CyaYwgPxQYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr85u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:19:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66f9e2baso271336285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333177; x=1783937977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnYM2Khp6OMHAwZzqvl0rBtn/mMDowuM3l5URj9PLxk=;
        b=XblIgfOjRATUQJ0SwuM2KZozf85HQ9A05BzhkBB7aviCwsKVY/xFkIL3DRqJFRet88
         snAit2S7le9ZySnH0p8brQQOuoknjzkIxSFHBOBOXtT8h7Uf9VVPuW2Z1KUeSewWAUAj
         TziAtHU1BxsGhxItnYEvC5gv5mOrgRHbaCXChbGepMhRrbkWunhHjmToMnBlvqM94u+N
         pgog3/XdtBDq8vVICAwGtlm6Uv00F1vkgD66ytNtaYmv5BrF4E4CcJJrZF+q0AqYJg3p
         JXML5AEoLa0FW61c8mYnkbbjCo6N7BUy4FyJoEcKSr4GyUZXgOh9i71hbFbLBmX8fFJD
         ly9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333177; x=1783937977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnYM2Khp6OMHAwZzqvl0rBtn/mMDowuM3l5URj9PLxk=;
        b=aZoetLXSM8qwZTzt5WRbhG473kUE2O3cfVTgCKojeNvZEUr3Vy9yz7gpooGx06BtMC
         nRLKhmurrHxa90KFYS/nAPWptzhfWIkhAB2WbRg8uzne7KJ5I4BzcC6MhRE1ZnG4RQYX
         7x7Jvmzqhamj0eUd1WqXk9IGpg0hF49N84eyprYMXKZJ1MK6cACPDbr5dT7Yeg1yWI44
         gMBsLZlIeomp1KTKeFd+T1SjmV30HX6EYYiY4Ymh0ry8Imr6O+Amav3el81v6PyB+cTZ
         FqRv4ZBK//IP4fEPp+Qx9EGXoqQjQozR2jrJ2Cqepapp+NDTzLHJ/Koe1Ppanu716/LS
         Ff5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrhcQ79ZqQH5EPdrh17rkajhvMWtb6pUEM+oZGxrl4qwJiVbe5J0CjzzblFHF9ncvcn8Qo6IwiC2WdznEur/hBW@lists.infradead.org
X-Gm-Message-State: AOJu0YybxmHUmcU1z6lgfyx01bDBQ5eoipqvJXe5SH7SqUcFfMToB9b9
	ybGcNd881rgstjk5Mj41yjpvRqn4zPOA0jZKNQGUK6ZaeRHXlVEe2ehQom1zS8mRj4bTDsrRaKW
	Wpo0HmpJXrNndiqzFtPsYcEU07VTcQFcXayyF+5nqxu8cI2eIsw/LyktHWCjPwK1CaLBt9PRmNh
	d3AfQOORcRVw==
X-Gm-Gg: AfdE7cmPHetv4u6SR5tOk5SMup+HNEQyRxkPlSC2/eZWKzlx5DnPzym/KmVyWogm6hm
	JHfzk0e86cLtUPytfJpUyd3iUHC+zSmHPSQjyDqoqFfGJbCRrbVx6JdquZxARkiAjfpqiIAQatU
	CctkLX48WVAlou7rdRNI34CBRMznI2GKMdfi7PxDE7gC70oCQ7V9HaZrsyPCxrlCTmlZiNxlLhV
	5XhALlRHiR1UMdGVuNs95qLapEmawC7QE9pMqZvVWhErLRZ7wFLzxmShcvI+FcooviC6nRda1DS
	FgN0zf4GdNiuHVb1+exLp5v3kKWvym8wpJoQmfR6Abn5kP8oDHrLorEtLjSA7IsnIx81KcXsPng
	YiZAbTSI2+DTf4IT5Lux6/9l3gA4=
X-Received: by 2002:a05:620a:800c:b0:914:bb06:288 with SMTP id af79cd13be357-92e9a3af0f6mr1369665685a.22.1783333176520;
        Mon, 06 Jul 2026 03:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:914:bb06:288 with SMTP id af79cd13be357-92e9a3af0f6mr1369655785a.22.1783333175072;
        Mon, 06 Jul 2026 03:19:35 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm24235818f8f.5.2026.07.06.03.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: aspeed: Correct indentation
Date: Mon,  6 Jul 2026 12:19:31 +0200
Message-ID: <20260706101930.341635-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10398; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wd87wCk7Lo7YBoaYTCwSFGdDxSW/IhGXexaZrkSW02k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4Ey7mYvVUNogR/yoIJnYevou5t+jFyQwPPXI
 svkZ7TevaaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBMgAKCRDBN2bmhouD
 1xkZD/97bMDPwUqVYOtzzEefvUZkfdTtp3OU8gOXAMbAeR0VL/PXVPjdMPwIrwOKoaHyUQ6H8qN
 aEE2dpKSrWk2vNjSBE8z0xDCPUAAiYTaJ9h7wDzti4hkI/v+GZW3srTzNM1MdE49FmqWyDN6o+u
 clo4FzC4GdsBv6yHwBHcNA4eeYX5ThFuFcD8jCKKCUwuZ3rQZ/pZN4nZwfp9dZUIrzN/iTwkHHj
 NPuuq616+2CihjGVNhvKzMJx5sbBNMZhU0/t8r2lOFSg+4DSvIP/NUJeLjnKHdUR0S5ILKy5wsB
 lxOHdJWzsHx5rWu+eGJdnX3CvuffQLr1rIqIyrhGpVWZjUTx1WO44Ch3T7e4kd3TEjKbCYoKCXU
 Dn43LVU7L2t/Uki0lGfFHP8BSr7A4pZEe3wWsoxk0GR/mA/Yb5OmuBwojds6v6My9Tl1ahz4UKG
 bdsqi+Ey9oyMPZU34pjGs8d0AFKY0xapPb8tMZwZW/J3g0MYkpR3edqy9QodWJKfYhu0yyeqVcZ
 Q/Yh6+L81vhiuUtzJcayj5O/S827nugMvXRh7ziBwyu8QVoDXhkCBC/aAoOnW9EZpjM2bSf1ZRm
 whtRzEbpfeKzzGLG4YxwpaEkkV70OubUW2DMq+oQUIbtD0WAJDqbqSOVTyOg3cYuyxM/nvwsr6U 8UwYaEdf3fsbLuQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AE_V7tVGgwdX5O6yKWblL5M9teW5CIbB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXw6ejtqFpEjqf
 LvCQSzAIZCxx0DgACin81oFJ6YR792kE5INsleeOz3F1UHmbbCoocJM5aT7V1EQOltcx213WevS
 aGYDgJ7Gt5zluSSh85YQkSK1SXYXU2fEV6lz6Sy1OzpJbBwKsDU5UXXLIM2bwPjr1Y3NR229xZ0
 bOTzSSs8W4umOWKccwgVZVkCuXOjkIaW9LgO06QuH0JCcV7rRgK9KAznOni/zJ55NFn6OwVClwR
 nauF/I0DkCpJQAI8PJewavBe7IsAeudoZ5L3xpqtsz0GC2gbbggqWG+mJwq683ymSPrWVG1DVLC
 ROplki0ufeYcSQyxgIP8LqvFKh/C3vTgjuyFG0LUtDunbWdoljh4LbpD6dzTFHhLTG/nVsFBrBi
 oKfGtasNU8BGzQ2hzmP/Aut110rHGqlW8cXql8gw6GUDBATaIVeyGX20M1YfOabW7+3Qxh40ea9
 BMHZhs0JxbWVLZ7D6YA==
X-Proofpoint-ORIG-GUID: AE_V7tVGgwdX5O6yKWblL5M9teW5CIbB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXzNs/eLw1sred
 UQNMJ5lq+WA6o6KuzO9dmNiZCV/7tzj/w+AnfDdOQZG8Ar3C926ACs37PTG6ToJ6LnaWT1iGr3Z
 OB55HLF4vNAVX2GFDckKVMMNHy/gUHc=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b8139 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1noj3m8NxD8BY0cqL3kA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031939_439714_CA263FCC 
X-CRM114-Status: GOOD (  14.24  )
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
 .../aspeed-bmc-inventec-transformers.dts      | 200 +++++++++---------
 .../boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts |   2 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   2 +-
 3 files changed, 102 insertions(+), 102 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
index c713cb7a6187..e51c726b4a55 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
@@ -13,33 +13,33 @@ / {
        compatible = "inventec,transformer-bmc", "aspeed,ast2600";
 
        aliases {
-               serial4 = &uart5;
+	       serial4 = &uart5;
        };
 
        chosen {
-               stdout-path = &uart5;
-               bootargs = "console=ttyS4,115200n8";
+	       stdout-path = &uart5;
+	       bootargs = "console=ttyS4,115200n8";
        };
 
        memory@80000000 {
-               device_type = "memory";
-               reg = <0x80000000 0x80000000>;
+	       device_type = "memory";
+	       reg = <0x80000000 0x80000000>;
        };
 
        leds {
-               compatible = "gpio-leds";
+	       compatible = "gpio-leds";
 
-               // UID led
-               uid {
-                       label = "UID_LED";
-                       gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
-               };
+	       // UID led
+	       uid {
+		       label = "UID_LED";
+		       gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+	       };
 
-               // Heart beat led
-               heartbeat {
-                       label = "HB_LED";
-                       gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
-               };
+	       // Heart beat led
+	       heartbeat {
+		       label = "HB_LED";
+		       gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+	       };
        };
 };
 
@@ -47,8 +47,8 @@ &mdio0 {
        status = "okay";
 
        ethphy0: ethernet-phy@0 {
-               compatible = "ethernet-phy-ieee802.3-c22";
-               reg = <1>;
+	       compatible = "ethernet-phy-ieee802.3-c22";
+	       reg = <1>;
        };
 };
 
@@ -64,22 +64,22 @@ &fmc {
        status = "okay";
 
        flash@0 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bmc";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <2>;
-               spi-rx-bus-width = <2>;
+	       status = "okay";
+	       m25p,fast-read;
+	       label = "bmc";
+	       spi-max-frequency = <33000000>;
+	       spi-tx-bus-width = <2>;
+	       spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout.dtsi"
        };
 
        flash@1 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bmc2";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <2>;
-               spi-rx-bus-width = <2>;
+	       status = "okay";
+	       m25p,fast-read;
+	       label = "bmc2";
+	       spi-max-frequency = <33000000>;
+	       spi-tx-bus-width = <2>;
+	       spi-rx-bus-width = <2>;
        };
 };
 
@@ -89,12 +89,12 @@ &spi1 {
        pinctrl-0 = <&pinctrl_spi1_default>;
 
        flash@0 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bios";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <1>;
-               spi-rx-bus-width = <1>;
+	       status = "okay";
+	       m25p,fast-read;
+	       label = "bios";
+	       spi-max-frequency = <33000000>;
+	       spi-tx-bus-width = <1>;
+	       spi-rx-bus-width = <1>;
        };
 };
 
@@ -115,9 +115,9 @@ &i2c0 {
 
        //Set bmc' slave address;
        bmc_slave@10 {
-               compatible = "ipmb-dev";
-               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
-               i2c-protocol;
+	       compatible = "ipmb-dev";
+	       reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	       i2c-protocol;
        };
 };
 
@@ -129,9 +129,9 @@ &i2c3 {
        // FRU AT24C512C-SSHM-T
        status = "okay";
        eeprom@50 {
-               compatible = "atmel,24c512";
-               reg = <0x50>;
-               pagesize = <128>;
+	       compatible = "atmel,24c512";
+	       reg = <0x50>;
+	       pagesize = <128>;
        };
 };
 
@@ -143,26 +143,26 @@ &i2c6 {
        status = "okay";
 
        tmp75@49 {
-               compatible = "ti,tmp75";
-               reg = <0x49>;
+	       compatible = "ti,tmp75";
+	       reg = <0x49>;
        };
 
        tmp75@4f {
-               compatible = "ti,tmp75";
-               reg = <0x4f>;
+	       compatible = "ti,tmp75";
+	       reg = <0x4f>;
        };
 
        tmp468@48 {
-               compatible = "ti,tmp468";
-               reg = <0x48>;
+	       compatible = "ti,tmp468";
+	       reg = <0x48>;
        };
 };
 
 &i2c7 {
        status = "okay";
        adm1278@40 {
-               compatible = "adi,adm1278";
-               reg = <0x40>;
+	       compatible = "adi,adm1278";
+	       reg = <0x40>;
        };
 };
 
@@ -172,15 +172,15 @@ &i2c8 {
        status = "okay";
 
        eeprom@51 {
-               compatible = "atmel,24c512";
-               reg = <0x51>;
-               pagesize = <128>;
+	       compatible = "atmel,24c512";
+	       reg = <0x51>;
+	       pagesize = <128>;
        };
 
        eeprom@53 {
-               compatible = "atmel,24c512";
-               reg = <0x53>;
-               pagesize = <128>;
+	       compatible = "atmel,24c512";
+	       reg = <0x53>;
+	       pagesize = <128>;
        };
 };
 
@@ -194,17 +194,17 @@ &i2c10 {
        status = "okay";
 
        i2c-mux@71 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x71>;
+	       compatible = "nxp,pca9544";
+	       #address-cells = <1>;
+	       #size-cells = <0>;
+	       reg = <0x71>;
        };
 
        i2c-mux@73 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x73>;
+	       compatible = "nxp,pca9544";
+	       #address-cells = <1>;
+	       #size-cells = <0>;
+	       reg = <0x73>;
        };
 };
 
@@ -213,46 +213,46 @@ &i2c11 {
        status = "okay";
 
        i2c-mux@70 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x70>;
+	       compatible = "nxp,pca9544";
+	       #address-cells = <1>;
+	       #size-cells = <0>;
+	       reg = <0x70>;
 
-               pcie_eeprom_riser1: i2c@0 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <0>;
+	       pcie_eeprom_riser1: i2c@0 {
+		       #address-cells = <1>;
+		       #size-cells = <0>;
+		       reg = <0>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
+		       eeprom@55 {
+			       compatible = "atmel,24c512";
+			       reg = <0x55>;
+			       pagesize = <128>;
+		       };
+	       };
 
-               pcie_eeprom_riser2: i2c@1 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <1>;
+	       pcie_eeprom_riser2: i2c@1 {
+		       #address-cells = <1>;
+		       #size-cells = <0>;
+		       reg = <1>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
+		       eeprom@55 {
+			       compatible = "atmel,24c512";
+			       reg = <0x55>;
+			       pagesize = <128>;
+		       };
+	       };
 
-               pcie_eeprom_riser3: i2c@2 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <2>;
+	       pcie_eeprom_riser3: i2c@2 {
+		       #address-cells = <1>;
+		       #size-cells = <0>;
+		       reg = <2>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
+		       eeprom@55 {
+			       compatible = "atmel,24c512";
+			       reg = <0x55>;
+			       pagesize = <128>;
+		       };
+	       };
        };
 };
 
@@ -260,8 +260,8 @@ &i2c12 {
        status = "okay";
 
        psu0:psu0@58 {
-               compatible = "pmbus";
-               reg = <0x58>;
+	       compatible = "pmbus";
+	       reg = <0x58>;
        };
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
index 8a7fb55ab489..5a3e8a3941d4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
@@ -82,7 +82,7 @@ &fmc {
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
-        label = "bmc";
+		label = "bmc";
 #include "openbmc-flash-layout.dtsi"
 	};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..edf4b74f5aba 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -517,7 +517,7 @@ timer: timer@1e782000 {
 				clocks = <&syscon ASPEED_CLK_APB1>;
 				clock-names = "PCLK";
 				status = "disabled";
-                        };
+			};
 
 			uart1: serial@1e783000 {
 				compatible = "ns16550a";
-- 
2.53.0


