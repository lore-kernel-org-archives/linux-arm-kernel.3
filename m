Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E504C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdo5qj4aLwQQz2BSfiH1l2eNd4aaZgSHVI7lc8DSn8Y=; b=Z00Qo6/YJbTDuQm+27KhfvPKeO
	bugGqcCYcGxO/a/zDWDvYl/k0An+714tjptFzh0e6VXaylx51P9mhtUdwUhs7bbSZBMrgLuJg94jf
	FsRCsXnBckvg0Rl0+5JZCzqiB3xGMM0FtV5fGOZMoCRVkjiuxuG4AWV6sCt8T1+YIefTqhoYHiZ1c
	+Gg0YRWj0zCQTBu0JkySv3VefAeLnOqO7n6PpcLIi8+tBGUFYQP79uNTnj+KaRNfeDNMwuvPrmibt
	MjQfn2eXnVvpol2OjuAwlmup1gJQ0GcuQ+H6xw/lgMEPQ81LhgSn068UJuMpnpGimcEh3S0R2mVo6
	tB10884A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMc-0000000GMMa-41g3;
	Fri, 11 Sep 2026 10:20:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMJ-0000000GM9h-3vaz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfhV423498
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdo5qj4aLwQQz2BSfiH1l2eNd4aaZgSHVI7lc8DSn8Y=; b=KQRfEsWUgCHNb5A6
	3+dFtT5+gkBwTzwe5bwMGNEEKTfhu2JcFYzDKJjZo6IesrdzE+aO0jpPtLAxoFEg
	EJwQ1mOFtRMdyIUM9v1AWqb20e1QF54tvYVK5fqZFdNS6TW/ROzb/8767KD70Gtt
	qBvoREs608Ox1NyJ77x6yQycPFwL2j4gTbqNWDvIrFDRwOOmDB+hHheCIvan5kr+
	nN5WNEKLAzhdWJgBl4xkDHLIxZTkVEYB6wVX0lWKWRyyTYDfMupB2uZhdqVJOWzS
	Iixi4Jde55ERHUyk/mbbxvnEWKC4Kea0FTCIfpARg0EsZVQyGM/hR33B+4XIftLV
	YF9LUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8h68b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so139820885a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121990; x=1789726790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdo5qj4aLwQQz2BSfiH1l2eNd4aaZgSHVI7lc8DSn8Y=;
        b=bzpXoPUtLorwy6vym9MPEVkFl0xtBu0skCbxN6Q3SMYGf1xhvmbBG6+YmsrbRN3lMT
         lN1uAIbuCOkIbOxvFSMWj5wZC55LePnHlQWWqsJueesHbtjOj1HR13yKjq5W5Snb/jg/
         WY14SvvpMq1VUOSiByIyZYKFlEmkqyCI2jVxl97VcQBxQFO7vMc3XzCNZLFTv7eYGBvZ
         HoFDfyisvfXWf+by/hXiC2+YeBNKW7xSvLh1wxk2bWGqYcXB/Idr2GQR/jEC7pQ/8B+X
         dRDDU8HG/kz8lR9XK5y5Sx7ILG3mPVzRoSUYdZJy+a296CTscQMpc8XX6ytnZ+gohn7A
         HvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121990; x=1789726790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdo5qj4aLwQQz2BSfiH1l2eNd4aaZgSHVI7lc8DSn8Y=;
        b=HmFbeM7vYVYbdKxFCQlE+aiSgWZX8+Ot2q9xeEskHw08zcqqPUJ4XVXx5p2xrf38B6
         hQN+YLGTPq7LyulruROPt4cusRnC1/zfwOgXpJtXKY+FlcJrjvONjreVX/Px1rgAHTJD
         4e/58pfERP2hIYDBRfxJA2M/T0DYbZuUq0QJMH4yx1DR/HEq6bS7FZyJKceiqQHF/qg6
         B427ogjDokd3OAUMTIfow3gKCN9HJKUQymW1tzItPMLx087qTq098XyKYXj7UgW6cp5B
         yy7OShBRxus8AlhP2mF4mrf7oK6dTu21lMRPdUQXrbn8zNE9bG7/gqyVUJr0U14uEJUR
         GWQQ==
X-Gm-Message-State: AFuF++kr9YPIgzfzz1oI9ITTo4sQyIO6TTByFcshbpvXHBPr94Ty/qqP
	w4fU3hYNJ6PBXGsGnlmZ/fifJ7stgeamOHriKq7ggeUfYdBsPHRc0h8iT6lJVfOTZDW1kmeTXNv
	HK7jTINIpJ5vVkI0EFyVot9I2QVOdKqVUGJwWZCyVUdXlxgsm+jxGqAtsrU3rEY5ALhRt9PFpyq
	haPbU/h11I7g==
X-Gm-Gg: AYBFou21NGdvbuI52RKj4VkXEkAReyzRtithFG3sc8U6shMOz8/aSJwUADmNdZd01x0
	FfO+OmAf7V6aJelChClEXFGAXX9r2y3q8On5PFyWFiEKIWmsaqqx6RV4XTYvpuK31jLjwpZb6Ac
	lv8HcY2DzluOVB8azDsemLOTdbTH/PL0V9JJsT0/VNIvZHTRU2DyhirwIkq3R2zbp7Ue583IHgX
	YfMCfVZCMQuJ/EYG0VT52ZbJ2F1mrMW+NXrvNE7368K6v7wr2dN1I03r9a2xp3AK/ZJZodhNAqM
	pQkju+9M8enOFomUxPgh3xrUxWUu8eZFihbEy9BT29KndxANZtM7icf5I8IWNfGQ9JYVvIADKLi
	sH4bG4xtDQp79YRV+VthWL3w=
X-Received: by 2002:a05:620a:28d4:b0:936:8840:427f with SMTP id af79cd13be357-939ea037c44mr407786585a.4.1789121990416;
        Fri, 11 Sep 2026 03:19:50 -0700 (PDT)
X-Received: by 2002:a05:620a:28d4:b0:936:8840:427f with SMTP id af79cd13be357-939ea037c44mr407780285a.4.1789121989805;
        Fri, 11 Sep 2026 03:19:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:16 +0200
Subject: [PATCH 08/10] arm64: dts: exynos5433: Re-order nodes to match
 coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-8-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6620;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nl0HsDsR4z58RCd3PnCbvBV/vsEQCHxZmJkbD0eCG3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WtWR/YT6ut7t8VgTBvB6pfMZIiGK3gB7JX3
 kTN6OuAVfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVrQAKCRDBN2bmhouD
 10uZD/4+lZ4UcI+YR1b9Lj/AVFmQwwkozDm4YW6iVy0Ucu7IFDVb6wCspf8Zld1q1N8Z+ZNPxxh
 B9T7jVP030GDR7qRhENnyUjmGXIQS19T64n9iRHjsejedaU+UONjnASpbX2RTV8qQip3GJ6kxpQ
 QKSoKheWYTMhQgNepo5ayaN9W6cnOK8xwB2Uzh9AhktqeM13omB0rCh7pswg2a/+8Z8MtReOjxp
 nl033mLFM+bYuB6JLTc540aj7rquf4upWgBMxKZukN6EtA2lOw97zScX/Ba5QYR0BBwiMcSg3Aw
 bvzJPbD922v+XPCYmkoptKFKKHavfwHDN/Hrdgkeclbv10rLD6fVJeAM/RnFMn/GEMoyTI+a0H0
 il2zcSErjHG4vWt3Hpgn56xFzni0FHGamh0yGwTno54ed1OPRDWPuLVJnGcnKqhb1RmDTlIxHcK
 I0Py6xekmAkOIanRRgeFAIj9BG67nTW99ZiuuTOnm8OyF++rgzp1TkYRMxhIIj6SUjFr0+XPjfY
 iyBx4DcxsxRfafCdkDyAOHX/IGQ7GNigdImes1wu7e4C8v7FTK7pZ9zhucVB2lQtc6ucTvL3/yV
 NnB7nTm2islI4n1k4OyNXcp9RDgGbhpSiZTxUEIRvSjNV2JTe6e44xLC0MMchXqZj8K5EL7rsy3
 ZJUAqfeAF8KbjRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: KdcZu3ffJu8cxh0xWCEIxniftsBXq-WT
X-Proofpoint-ORIG-GUID: KdcZu3ffJu8cxh0xWCEIxniftsBXq-WT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXwDPc8PK52qNc
 6Uw6jmc1K8hCfoMefjr+OtoBMpsFsLNSD+gINA/+VqFdbv1BAoKG03OmPGITzZ1rYhq2bY2GGoD
 HcDUOKnlcITVzTrRsGRS1hpsf6F00otb8lnZAC5JetvPvChKQRYdZiP1PdepUSefqHY8IpbempZ
 TGcheR9YmDiEYbzHDEgHYCqozPO2H1HJyRx7xMqH/SDGVENQiEVJQyW08n3puAEryocskJjguHn
 ZmuBqWKjG3lzo0cqf45B6zE/OUJFJMPaDbe8wti/iNKhDOGuBqVr2lIgMb94kpYP032VRNj5UL3
 EXhCViwhHjC5rWe/WYwO5Z/rXA4/lf9INI8XnsStmduAWb4zwdjtwd9REJvUzkB8SGDGDNsFSJ5
 gam6t/O+gSKZVHH/I7NqwP7c1P7xYIr/0py/F02th8kV4DaJipd8rLKxcYc0bDkh7/DF3D9/NuC
 At8bBO3Kjd8V3TG9xCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX/TujDVNNua+h
 MQHzEgdQ6Gh5/dvArK0igCn0zXwTaxBgf1Lwx1NVm6NwohocEkUmKXaPI/ZcBVCkx0AzK4eLi5/
 T8xCAgUPJrpew3fgthvt9pjCk4m4yGA=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa3d5c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ycHTqKVFhA26NmRza4AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031953_046432_89992EE1 
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

Re-order a few nodes to match coding style - ordering by the name, as
pointed out by dt-check-style, e.g.:

  gs101.dtsi:476: [child-name-order] child node 'ect' out of name order
  gs101.dtsi:479: [child-name-order] child node 'clock-1' out of name order

While moving the lines, move also linux,code to the end to follow convention.

This is not complete re-ordering of all nodes and children of "soc" node
are left as is.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  28 ++---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 132 ++++++++++-----------
 2 files changed, 80 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 0ad02a098765..a85afdde9c41 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -56,6 +56,13 @@ memory@20000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
+		homepage-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "homepage key";
+			debounce-interval = <10>;
+			linux,code = <KEY_MENU>;
+		};
+
 		power-key {
 			gpios = <&gpa2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
@@ -76,13 +83,6 @@ volume-down-key {
 			label = "volume-down key";
 			debounce-interval = <10>;
 		};
-
-		homepage-key {
-			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_MENU>;
-			label = "homepage key";
-			debounce-interval = <10>;
-		};
 	};
 
 	i2c_max98504: i2c-13 {
@@ -103,13 +103,6 @@ max98504: amplifier@31 {
 		};
 	};
 
-	vph_pwr_regulator: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "VPH_PWR";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-	};
-
 	irda_regulator: regulator-irda {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -117,6 +110,13 @@ irda_regulator: regulator-irda {
 		regulator-name = "irda_regulator";
 	};
 
+	vph_pwr_regulator: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VPH_PWR";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+	};
+
 	sound {
 		compatible = "samsung,tm2-audio";
 		audio-codec = <&wm5110>, <&hdmi>;
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index d318c87effaa..3e67d9091a19 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -90,72 +90,6 @@ core3 {
 			};
 		};
 
-		cpu0: cpu@100 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			enable-method = "psci";
-			reg = <0x100>;
-			clocks = <&cmu_apollo CLK_SCLK_APOLLO>;
-			clock-names = "apolloclk";
-			operating-points-v2 = <&cluster_a53_opp_table>;
-			#cooling-cells = <2>;
-			i-cache-size = <0x8000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
-			next-level-cache = <&cluster_a53_l2>;
-		};
-
-		cpu1: cpu@101 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			enable-method = "psci";
-			reg = <0x101>;
-			operating-points-v2 = <&cluster_a53_opp_table>;
-			#cooling-cells = <2>;
-			i-cache-size = <0x8000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
-			next-level-cache = <&cluster_a53_l2>;
-		};
-
-		cpu2: cpu@102 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			enable-method = "psci";
-			reg = <0x102>;
-			operating-points-v2 = <&cluster_a53_opp_table>;
-			#cooling-cells = <2>;
-			i-cache-size = <0x8000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
-			next-level-cache = <&cluster_a53_l2>;
-		};
-
-		cpu3: cpu@103 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			enable-method = "psci";
-			reg = <0x103>;
-			operating-points-v2 = <&cluster_a53_opp_table>;
-			#cooling-cells = <2>;
-			i-cache-size = <0x8000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
-			next-level-cache = <&cluster_a53_l2>;
-		};
-
 		cpu4: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
@@ -222,6 +156,72 @@ cpu7: cpu@3 {
 			next-level-cache = <&cluster_a57_l2>;
 		};
 
+		cpu0: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			enable-method = "psci";
+			clocks = <&cmu_apollo CLK_SCLK_APOLLO>;
+			clock-names = "apolloclk";
+			operating-points-v2 = <&cluster_a53_opp_table>;
+			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
+		};
+
+		cpu1: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			enable-method = "psci";
+			operating-points-v2 = <&cluster_a53_opp_table>;
+			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
+		};
+
+		cpu2: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			enable-method = "psci";
+			operating-points-v2 = <&cluster_a53_opp_table>;
+			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
+		};
+
+		cpu3: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			enable-method = "psci";
+			operating-points-v2 = <&cluster_a53_opp_table>;
+			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
+		};
+
 		cluster_a57_l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;

-- 
2.53.0


