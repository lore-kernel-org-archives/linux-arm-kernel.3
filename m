Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD84C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TFCpJc0hDy7ktIER8DCjfk9vRFJ4luyNuixu1IkNlJw=; b=SySnsX5iewG52XN7+LmfMBbLx1
	4j0Do1zB6yjgCMaWfUTO72wHZ32wsLBf8MD87wD2mGoDZSBKJ6qlp/dQIDikDPas6rpy0uvl5RAyg
	si9CndY6FnyaeqrpJQziv/GmiI8CJ9fx7C3V/FqofrieSVA65gDfVVglhwcoTLS37lOV7tnMLlsFm
	sDT1//XC/PkIb0uhrmVgcJjYWxURXVDrjFxYvAG6ah2qNqEcmyzdfb7ElgwltnO1ICXIjuE1teudC
	C5nIZdIjeCMreT29+yCRa/94Q0C3yQTmhxXGCCIJRK1AQEImQ23zb8+U3ILkMkKizeo8A5ylpWle3
	h+tTHvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnfz-0000000DI9y-44HW;
	Mon, 06 Jul 2026 18:04:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnfw-0000000DI83-2Qem
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:04:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFC5m972259
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 18:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TFCpJc0hDy7ktIER8DCjfk9vRFJ4luyNuix
	u1IkNlJw=; b=ncdzL1eXr++yCPZ8FVwVzOTqE/VB8PRl6Wt/keE9tVmVdWQdxPe
	c9YG8OAEDxLxOVbl1lIw/3oVKTeLf1TQyGiwsSFzytf1V1czJ4bgSbdA6NfYcTD6
	a+jEKsyRgevKaXInelMxWX4mMW6t7WMGr3si0Xp29YXHsE/PhJr5IBd5viw/RfKp
	no5E+7Rewt4WRx0RuQVov41qwFcgL/hduXvFBzQzP846QV8WCeuDWVlxvWuX8goS
	LwFFZS5lzRRIT/NXANWCKCv+Lsfs74TtAeATxCe4NK0e0xMHUlIjP6c73g0CC+7S
	tjzT51BmLyvWtxsw7v7pXwUzzifDLos7m0w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r26pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 18:04:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5be0de8bf7cso279666e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361051; x=1783965851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFCpJc0hDy7ktIER8DCjfk9vRFJ4luyNuixu1IkNlJw=;
        b=J41Sa5sFr4mcxesOxOTFUI5uLzZ+5KrOsJzD5ttjV79LMs2kd9FxmR6QGhsfs118Fm
         BW4J2bCQuaHUbao9MsAum1/m1XdUDK/n+NKS+q29iRH1klFYrUG+xBGqb07NmidPdMIL
         O3A31gVLKh6/1Nn3/NKwDw/jKP0FSX4ju1i5rZ4iT4dL6sd7K+mdl/xq7rqabk6hbNav
         Rq0FC5H6ldDcZDmC30b/9+B1wR3mzooqIiHkVHJ2iu0bA3r8B2BDYk5UnXueFzkJP8xF
         g0hrKpEEgaBzni0fgH/9jSf+Ym/tw1jm0GCYuWzeZUk15PgwblLsnyWY0j0dxNqbVcsD
         LBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361051; x=1783965851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFCpJc0hDy7ktIER8DCjfk9vRFJ4luyNuixu1IkNlJw=;
        b=Z1ToFvWW8IKoCMmKf0LPGpEEqjDANRGSptk37epD4Z8CYzKfiFPKAqk54nETb1Mu1W
         a8jysbhyLpYSSdcSy2dB//2OW0bCcOTFIw2m9TWY6UZgmbGNSyQu3gh1HKm+P3DpZgpH
         BwHCvmGiMo8D+2NZOsHEsyUHuEicutU61L1ZdqEW+kQvuRAjF/DvGe2DKkVzpqcT6voQ
         nvdICQ+1ZJ4hkY1dOUIL+gWH7RAPRlqf8Ivb2MK8vcyTpWB98U93pC5SAwGrD1i7jqqm
         AEoTHPiODgD5Dcq2ap6SpgJwYSPsgqYf00Y1mh9+oVpaMC9hsT++8Ma+Hwsil0/qNMA/
         y2KQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIII4PvDCHHj++fHcnAd63xMK3OiNVVLe4hURXKjtBknDDV7PGdYG9GGC1Z4JYzk80qtOsdr24vfxHwBMyHcYn@lists.infradead.org
X-Gm-Message-State: AOJu0YwQU6+U2qb+ZNFjy9egecFw0/7nkSx7fusCNEzSy3sO5IMFQMDs
	ftFD8szUTTfTgOeKxfhjNACgNhL8gLxLhj0SnpK6KEPKhC5zBpON6Nt0crcqkd0nsumcNAGrJ24
	FNUPSvC6o6YR129MURI56kwvLbHU6kbOEKIx20ZxzbUluNUUt/KBUSyZz+q+AsZhwVdhPNRw7sK
	icDw==
X-Gm-Gg: AfdE7cniZ9R9OX45UbJT9gGOk5udjx+t1puAEtzLoabhOAvpJ/SIU3dPira6b2y5wCK
	fCrcSJR8YDFU7PhzOTrS6k0HAgZQsqbljCRsCRDm8o87r6cxfmJ1rOssVeEq1Gm4+U0xsU2UIkC
	4pJbA9gvLlRd5xF5Li9wcRUwCBXrWdrBkp4k/lLIiQq/a87bmxTv8XqjxWMA4kacNbghHGoc74j
	3A6UOu/RCq3/vD4QqI0ijKVZXCzKwvgG+kcVHeG1Tmc/c6Oig2bpIBkJ59rh08qFvgMPNw3v5Sh
	yf6sWrlsS0zYf462+bZJe2LtqVphqwJ2/Tfa/DYjiV6Ab7CUJLHcVDA0AkENHVimPD6PZ58Q/QS
	dM15h25SVKi8b2egLGThjdW9XsCA=
X-Received: by 2002:a05:6122:3d4b:b0:5bd:cb34:1b65 with SMTP id 71dfb90a1353d-5be8f01ab9cmr821128e0c.2.1783361051020;
        Mon, 06 Jul 2026 11:04:11 -0700 (PDT)
X-Received: by 2002:a05:6122:3d4b:b0:5bd:cb34:1b65 with SMTP id 71dfb90a1353d-5be8f01ab9cmr821108e0c.2.1783361050560;
        Mon, 06 Jul 2026 11:04:10 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm27092115f8f.5.2026.07.06.11.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:04:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: sigmastar: Correct indentation
Date: Mon,  6 Jul 2026 20:04:05 +0200
Message-ID: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Ve6EeY8KkAjL95WGV4thfC8RN67B8RKvW4TyZWmJEls=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+4UT4hjqHmzvdRxYx3bcga+pRwmgY/5JUURV
 P+IzAy7deWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvuFAAKCRDBN2bmhouD
 12huD/0VrM4UOmMT0JyL4dhqyPGUPEkna/I07XrmkKhDStZkHi37hxJLBxX0HlNws3THxKNIWsu
 n3R0CNzgXPGBTA+B99FeF+C9mK80gl0B47IN9AC/D1uFth9LHrRwxfTyY1uH7IsWhfixEoUl3Gy
 pFzdYM/HVWpMYKO/Yg9BygydKSUGhhNGtuFS/+fz+EpOHplxjgv33vgziEBWrEwiXgYwnZ3Th6U
 gBU9rIUmLA8EnlrooJvK/WHhh4HeO/2jsMyP/sUWfiEp9wHO1iRvc67ux4SJO5fF4DhTbSWeF3e
 xcI4rjm3JmoKP1jZACjwx6W8gCHJSSAQ65YhAAULlYdVjLlpoCNi6TXvmgDswtPhJOMKbuTagow
 VFaDARbuI5UQ5DJy3vE6ixCdBR3YiqRuKAQ/ggx8IcIjGI7qRw4mv8J75UpVW9/8KgQ+tO5hL2c
 iBsqmRcwepT5SQz9t4vqpzMheqyixQ4m9SMloLRmyTg4u3qEga1xnpChR5tEFMwwuCXklMmse4z
 Q5CxmibGPjedmJA1c3XXPl3jr7R0GL5W3YDPIs7X/Tc5fZ+wsstHOa2788U4IfDuyPVFwIUewmp
 IZiDfALEOvbtff+GFB0seQ9VGFZM4JSwxsnngFr1ouLGiwF4t1nsAsDLfsKepIQz1jQE/vUYGL8 q2wM8WTExu1E+Vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX0mAOY9kPm3ic
 1VjkAkx05DIRSbzAlmeuY1n2/eWTgNH+A3/L4X0dc02RorfwPisL/0HyvReuUz8JmvLBoPd07de
 xz6qOXfGWs5/OX6SniW1J3MjbhhA+1oe/OGgmQewIwgkHeePEU4JkfdyDFsVw0WK5LhNVcgGynT
 VqJtDCkV+6a0eL/x6UlBdn27RuJhwlIzsQCgGinud1X5E3nYpoqUqzHvwpgL9s3eepUSf6pYlWV
 eK9kW91jgqmKtqy+hGgXMOh8RLPVqtfWgNveIGoVu+rDidbvaFl3IkPk1zrdA9+ECjfTjExFyl6
 fOBXRzQ5d/vZE77tDApHrd+/Ctd2GXtqgFF6V49UCSVidHyoaxUGXV5gIYx8NZXNXQ1Dl4z5kaG
 EvzFOPSf9EONr2ZkM8Qx3sm2lCAPL0W8xT3zq1rzJ51J0W0RY9NzTv/JgF2VqjgWgG84W+8mUyI
 Nk5BbS0nyrzZu4YIt6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX8WuzpFHcIPMQ
 jSZTnzzIzWPkKvlXW0buJ+f2j/4peTvKh4txcChTrrvaX8/hS6sYcdEHbpIiKudFZ5spcRfHBhk
 EnkYa6x90fGtwxUHCJfS0fSNZZnESkg=
X-Proofpoint-GUID: T4xarN0QCwvsjmQQINQKUwBxjvnDh8Ia
X-Proofpoint-ORIG-GUID: T4xarN0QCwvsjmQQINQKUwBxjvnDh8Ia
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bee1b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BJV7ttL8GAApAH6KOnwA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_110412_744538_E6D0714A 
X-CRM114-Status: GOOD (  12.68  )
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

Correct indentation to one tab.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/sigmastar/mstar-infinity2m.dtsi  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
index 1b485efd7156..437329fb912a 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
@@ -7,17 +7,17 @@
 #include "mstar-infinity.dtsi"
 
 &cpu0_opp_table {
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <300000>;
-		};
+	opp-1000000000 {
+		opp-hz = /bits/ 64 <1000000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+	};
 
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <300000>;
-		};
+	opp-1200000000 {
+		opp-hz = /bits/ 64 <1200000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+	};
 };
 
 &cpus {
-- 
2.53.0


